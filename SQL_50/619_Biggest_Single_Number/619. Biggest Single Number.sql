-- Write your PostgreSQL query statement below
select max(num) as num
from (
    select count(*),num
    from 
    MyNumbers
    group by num
    having count(*)=1
)
