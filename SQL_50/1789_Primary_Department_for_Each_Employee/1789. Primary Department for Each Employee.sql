SELECT employee_id
	,department_id
FROM employee
WHERE primary_flag = 'N'
	AND employee_id IN (
		SELECT CASE 
				WHEN count(employee_id) = 1
					THEN employee_id
				END AS employee_id
		FROM employee
		GROUP BY employee_id
		)

UNION ALL

SELECT employee_id
	,department_id
FROM employee
WHERE primary_flag = 'Y'
