-- Write your PostgreSQL query statement below
select p.product_id, 
COALESCE(
    ROUND(SUM(u.units * p.price) / SUM(u.units)::numeric, 2),
    0
) AS average_price
from prices p left join unitssold u
on p.product_id =u.product_id
and u.purchase_date>=p.start_date and u.purchase_date<=p.end_date
group by p.product_id
