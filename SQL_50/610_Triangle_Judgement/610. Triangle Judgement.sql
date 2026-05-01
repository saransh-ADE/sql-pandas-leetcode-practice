SELECT
  x,y,z
	,CASE 
		WHEN abs(x + y) > abs(z)
			AND abs(y + z) > abs(x)
			AND abs(z + x) > abs(y)
			THEN 'Yes'
		ELSE 'No'
		END AS triangle
FROM Triangle
