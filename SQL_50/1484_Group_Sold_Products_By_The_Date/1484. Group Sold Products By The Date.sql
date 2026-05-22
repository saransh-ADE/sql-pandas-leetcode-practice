select 
sell_date,
count(distinct product) as num_sold,
STRING_AGG( distinct product, ',') AS products
from Activities 
group by sell_date
order by sell_date
