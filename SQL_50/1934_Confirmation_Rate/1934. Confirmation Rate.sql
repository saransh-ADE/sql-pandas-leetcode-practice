-- -- Write your PostgreSQL query statement below
with total_count as 
(
    select c.user_id, count(*)  as request
    from  
    confirmations c
    group by c.user_id
),
action_count as 
(
    select c.user_id,c.action, count(*) as confirmed_count 
    from  
    confirmations c
    where c.action='confirmed'
    group by c.user_id,c.action
    
)

select s.user_id, COALESCE ((cast(a.confirmed_count as float)/ t.request),0.0)::NUMERIC(10, 2) as confirmation_rate from
signups s left join Confirmations c
on s.user_id=c.user_id and s.time_stamp=c.time_stamp
left join
total_count t on s.user_id=t.user_id
left join action_count a
on a.user_id=s.user_id



