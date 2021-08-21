select visitors.date_start,visitors.visitors,visitors.Bounce,users.registered_users,new_visitors.new_visitors,firstpurchases.FirstPurchases ,
       'MissLEgypt' Halo_Country
from
(select sum(cast(M_ga_users as int64)) as visitors,sum(Bounces) Bounce,startdate date_start from(
select *,(cast(M_ga_sessions as float64)*cast(M_ga_bounceRate as float64))/100 Bounces from `noted-computing-279322.halo_1_1_Egypt.fGABaseVisitors`
)
group by date_start) visitors
left join
(select count(distinct userid) registered_users,date(activateddate) activateddate  from `noted-computing-279322.halo_1_1_Egypt.refUsers`
group by activateddate) users
on visitors.date_start= users.activateddate
--order by month,year
left join
(select sum(cast(M_ga_users as int64)) as new_visitors,startdate date_start from `noted-computing-279322.halo_1_1_Egypt.fGABaseVisitors`
where D_ga_userType='New Visitor'
group by date_start
) new_visitors
on visitors.date_start=new_visitors.date_start
left join
(select order_date date_start,count(distinct order_id) FirstPurchases
from `noted-computing-279322.halo_1_1_Egypt.fOrders`
where is_new_customer =1 and Is_successful_order=TRUE
group by date_start) firstpurchases
on visitors.date_start=firstpurchases.date_start