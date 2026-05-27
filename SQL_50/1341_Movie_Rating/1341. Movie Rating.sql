(
SELECT
NAME AS results
from (
    select count(*), m.user_id, u.name as name 
    from 
    MovieRating m
    join
    users u
    on u.user_id=m.user_id
    group by m.user_id,u.name
    order by count(*) desc, u.name 
  )
limit 1
)
UNION ALL
(
select
title as results
from 
  (
    select avg(r.rating) as avg_rating ,m.title as title from 
    MovieRating r
    join 
    Movies m
    on m.movie_id=r.movie_id
    where TO_CHAR(created_at, 'YYYY-MM-DD') like '2020-02%'
    group by m.title
    order by avg_rating desc, title
  )
limit 1
)


