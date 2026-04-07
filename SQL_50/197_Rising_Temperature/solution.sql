SELECT id
FROM (
    SELECT id,
           recordDate,
           temperature,
           LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM weather
) w
WHERE temperature > prev_temp
  AND recordDate - prev_date = 1;
