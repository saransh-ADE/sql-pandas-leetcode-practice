-- -- Write your PostgreSQL query statement below
SELECT 
  id, max(num) AS num
FROM
  (
	SELECT sum(cnt) AS num
		,id
	FROM 
  (
		SELECT count(*) AS cnt
			,requester_id AS id
		FROM requestAccepted
		GROUP BY requester_id
		
		UNION ALL
		
		SELECT count(*) AS cnt
			,accepter_id AS id
		FROM requestAccepted
		GROUP BY accepter_id
		)
	GROUP BY id
	)
GROUP BY id
ORDER BY num DESC limit 1
