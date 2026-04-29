SELECT DISTINCT (e.employee_id) AS employee_id
	,e.name
	,reports_count
	,average_age
FROM employees e
INNER JOIN (
	SELECT count(*) AS reports_count
		,round(avg(age), 0) AS average_age
		,reports_to
	FROM employees
	GROUP BY reports_to
	HAVING count(*) >= 1
	) a ON e.employee_id = a.reports_to
ORDER BY e.employee_id
