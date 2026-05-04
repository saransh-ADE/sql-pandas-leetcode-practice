WITH cte
AS (
	SELECT id
		,num
		,lag(num) OVER (
			ORDER BY id
			) AS prev_num
		,lead(num) OVER (
			ORDER BY id
			) AS next_num
	FROM Logs
	)
SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE prev_num = num
	AND next_num = num
