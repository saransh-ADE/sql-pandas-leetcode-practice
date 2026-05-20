DELETE
FROM
person
WHERE Id NOT IN
(
    SELECT min_id
    FROM
        (
        SELECT email, min(id) as min_id
        FROM Person
        GROUP BY email 
        ) 
    test
)
