 select  machine_id, 
        round(avg(delta),3) as processing_time from 
            (select machine_id, timestamp - lag(timestamp,1) 
             over (partition by machine_id, process_id 
                order by activity_type) as delta 
from    Activity as DeltaTable) as result 
where delta is not null 
group by machine_id