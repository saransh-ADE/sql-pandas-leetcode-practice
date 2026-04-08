-- Write your PostgreSQL query statement below
select machine_id,
Round(avg(timestamp - prev_timestamp)::numeric,3) as processing_time 
from
(
    select machine_id, process_id,activity_type,timestamp,
    lag(timestamp) over (partition by machine_id,process_id order by timestamp) as
    prev_timestamp
    from activity
) a
where a.activity_type='end'
group by machine_id
