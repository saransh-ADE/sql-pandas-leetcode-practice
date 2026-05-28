with total_sum as (
    select sum(amount) as dailyamount, visited_on 
    from customer
    group by visited_on
),
running_total as 
(
    select 
    visited_on,
    sum(dailyamount) over ( ORDER BY visited_on  ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount,
    avg(dailyamount) over ( ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)::numeric(10,2)
    as average_amount ,
    row_number() over (order by visited_on) as rn
    from
    total_sum
)
select 
visited_on,
amount,
average_amount
from running_total
where rn>=7



