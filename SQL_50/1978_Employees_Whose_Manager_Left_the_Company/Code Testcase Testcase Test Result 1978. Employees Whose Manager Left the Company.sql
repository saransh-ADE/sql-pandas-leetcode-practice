select 
  e.employee_id 
  from 
  employees e 
where 
  e.manager_id not in (
    select distinct employee_id from employees
  ) 
  and e.salary < 30000 
order by 
e.employee_id
