select person_name from queue where turn = 
(
    select max(turn) from
    (
        select turn,
        sum(weight) over (order by turn) as cummulative_weight
        from Queue 
    ) 
    where cummulative_weight<=1000)
