

-- fGACAMPAIGNCOSTS - EGYPT
select  * from
(select *except(sm_old,sm_ga,sm_expectation) from
(select *except(campaign_name), ifnull(sm_expectation,ifnull(sm_old,'')) D_ga_sourcemedium from
(select distinct *except(d_ga_sourcemedium),d_ga_sourcemedium as sm_old from
 (select * except(row_number) from(
select *,row_number() over ( partition by StartDate, D_ga_sourceMedium,D_ga_campaign order by _daton_batch_runtime desc) row_number
from `noted-computing-279322.MissL1.halo_ga_egypt_216665006_campaign_cost`
where D_ga_campaign in
(select distinct campaignname from `noted-computing-279322.MissL1.Missl_Egypt_Google_Ads_9042714035_CAMPAIGN_PERFORMANCE_REPORT`)
)
where row_number=1))a
left join
(select distinct sm_ga,campaign_name,sm_expectation
from `noted-computing-279322.halo_1_1.channel_egp`)b
on a.D_ga_campaign = b.campaign_name and a.sm_old = b.sm_ga)
)
