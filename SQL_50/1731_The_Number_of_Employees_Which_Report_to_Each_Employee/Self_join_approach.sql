-- Write your PostgreSQL query statement below
select 
e.employee_id as employee_id,
e.name as name,
count(mgr.employee_id) as reports_count ,
round(avg(mgr.age),0) as average_age 
from 
employees e
join 
employees mgr
on e.employee_id
= mgr.reports_to
group by 
e.employee_id,e.name order by e.employee_id
