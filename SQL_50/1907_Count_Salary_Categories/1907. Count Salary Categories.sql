with 
  category as (
    SELECT 
      'Low Salary' AS category 
    UNION all 
    SELECT 
      'Average Salary' as category 
    UNION all 
    SELECT 
      'High Salary' as category
  ), 
  acc_cnt as (
    select 
      case when income < 20000 then 'Low Salary' when income >= 20000 
      and income <= 50000 then 'Average Salary' else 'High Salary' end as category, 
      count(account_id) as cnt 
    from 
      Accounts 
    group by 
      category
  ) 
select 
  c.category as category, 
  coalesce(ac.cnt, 0) as accounts_count 
from 
  category c 
  left join acc_cnt ac on c.category = ac.category
