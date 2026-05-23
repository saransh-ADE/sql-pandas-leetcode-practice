-- Write your PostgreSQL query statement below
select 
p.product_name as product_name,
sum(unit) as unit
from orders o
join products p on p.product_id=o.product_id
where EXTRACT(MONTH FROM  order_date)=2 and Extract(Year from order_date)=2020
group by o.product_id, p.product_name
having sum(unit)>=100
