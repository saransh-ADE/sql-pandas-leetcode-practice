--postgresql
SELECT p.project_id
	,avg(e.experience_years)::NUMERIC(10, 2) AS average_years
FROM project p
INNER JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id
ORDER BY project_id
