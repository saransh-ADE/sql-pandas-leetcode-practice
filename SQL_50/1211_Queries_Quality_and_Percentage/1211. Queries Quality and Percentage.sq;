-- Write your PostgreSQL query statement below
with deno as (
    select query_name,count(*) as deno
    from queries
    group by query_name 
),
poor as(
    select query_name,count(*) as deno
    from queries
    where rating <3
    group by query_name 

),
quality as (
    select q.query_name,(sum(q.rating * 1.0/q.position)/d.deno)::numeric(10,2) as quality,
    COALESCE((p.deno * 100.0/d.deno)::numeric(10,2),0) as poor_query_percentage 
    from queries q left join deno d 
    on
    q.query_name=d.query_name
    left join poor p on q.query_name=p.query_name
    group by q.query_name,d.deno,p.deno
)
select * from quality
