SELECT DISTINCT d.name AS Department
	,e.name AS Employee
	,e.salary AS salary
FROM (
	SELECT name
		,salary
		,departmentId
		,dense_rank() OVER (
			PARTITION BY departmentId ORDER BY salary DESC
			) AS dept_salary
	FROM employee
	) e
JOIN Department d ON e.departmentId = d.id
WHERE dept_salary <= 3
