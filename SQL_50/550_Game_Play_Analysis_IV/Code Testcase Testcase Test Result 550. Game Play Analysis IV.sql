SELECT (
		count(DISTINCT player_id) * 1.00 / (
			SELECT count(DISTINCT player_id) AS total
			FROM Activity
			)
		)::NUMERIC(10, 2) AS fraction
FROM (
	SELECT player_id
		,event_date
		,lag(event_date) OVER (
			PARTITION BY player_id ORDER BY event_date
			) AS previous_date
	FROM Activity
	) a
WHERE a.event_date::DATE - a.previous_date::DATE = 1
