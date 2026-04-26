-- Write your PostgreSQL query statement below
select
user_id,
count(*) as followers_count
from
followers 
group by
1
order by user_id
