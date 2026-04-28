select customer_id from (
select count(distinct product_key) as pc,customer_id
from customer
group by customer_id
)
where pc = (select count(*) from product)
