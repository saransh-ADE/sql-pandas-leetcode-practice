WITH cte
AS (
	SELECT product_id
		,new_price
		,change_date
		,dense_rank() OVER (
			PARTITION BY product_id ORDER BY change_date DESC
			) AS rn
	FROM products
	WHERE change_date <= '2019-08-16'
	)
SELECT DISTINCT p.product_id
	,coalesce(c.new_price, 10) AS price
FROM products p
LEFT JOIN cte c ON p.product_id = c.product_id
	AND rn = 1
