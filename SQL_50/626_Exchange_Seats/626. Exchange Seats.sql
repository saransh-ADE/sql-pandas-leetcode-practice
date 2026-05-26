select id,
case
    when (id=cnt and cnt%2!=0) then coalesce(student,next_student,prev_student)
    when (id%2=0 ) then prev_student
    when (id%2!=0 ) then next_student
    end as student
from
    (
        select 
        id,student,
        lead(student) over (order by id) as next_student,
        lag(student) over (order by id) as prev_student,
        (select count(*) from seat) as cnt
        from Seat
    )
