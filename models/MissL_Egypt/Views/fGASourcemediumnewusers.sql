

select * from
 (select * except(row_number) from(
select *,row_number() over ( partition by StartDate, D_ga_sourcemedium order by _daton_batch_runtime desc) row_number
from `noted-computing-279322.MissL1.halo_ga_egypt_216665006_sourcemediumnewusers`
)
where row_number=1)
