SELECT class
FROM (
	SELECT count(*)
		,class
	FROM Courses
	GROUP BY class
	HAVING count(*) >= 5
	)
