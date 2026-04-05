-- Write your PostgreSQL query statement below
select p.product_name,t.year,t.price from
Sales t inner join Product p
on t.product_id=p.product_id
