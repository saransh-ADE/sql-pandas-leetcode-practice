SELECT (
		count(DISTINCT a.player_id) * 1.00 / (
			SELECT count(DISTINCT player_id) AS total
			FROM Activity
			)
		)::NUMERIC(10, 2) AS fraction
FROM activity a
-- get first login date 
JOIN (
	SELECT min(event_date) AS first_login
		,player_id
	FROM activity
	GROUP BY player_id
	) f ON a.player_id = f.player_id
	-- compare first login date with 
	AND a.event_date::DATE - f.first_login::DATE = 1
