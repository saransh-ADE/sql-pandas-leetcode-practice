-- Write your PostgreSQL query statement below
SELECT e.name
FROM employee e
INNER JOIN (
	SELECT DISTINCT managerid
	FROM (
		SELECT count(*)
			,managerid
		FROM employee
		GROUP BY managerid
		HAVING count(*) >= 5
		)
	) c ON c.managerid = e.id
