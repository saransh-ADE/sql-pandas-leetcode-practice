-- Write your PostgreSQL query statement below
SELECT activity_date AS day
	,count(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date <= '2019-07-27'
	AND activity_date > ('2019-07-27'::DATE - INTERVAL '30 days')
GROUP BY activity_date
