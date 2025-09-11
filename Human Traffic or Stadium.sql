# Write your MySQL query statement below
select id, visit_date, people 
from Stadium as s1
where people >= 100
and (
    (exists(select 1 from Stadium as s2 where s2.id = s1.id - 1 and s2.people >= 100)
        and exists(select 1 from Stadium as s3 where s3.id = s1.id - 2 and s3.people >= 100))
    or
    (exists(select 1 from Stadium as s2 where s2.id = s1.id + 1 and s2.people >= 100)
        and exists(select 1 from Stadium as s3 where s3.id = s1.id + 2 and s3.people >= 100))
    or
    (exists(select 1 from Stadium as s2 where s2.id = s1.id - 1 and s2.people >= 100)
    and exists(select 1 from Stadium as s3 where s3.id = s1.id + 1 and s3.people >= 100))
    )
order by visit_date;
