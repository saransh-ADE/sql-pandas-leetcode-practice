select r.contest_id,
Round(count(*) * 100.0 /  (select count(user_id) as total_user from users) ::numeric,2) as percentage
from register r
group by  contest_id
order by percentage desc,contest_id 
