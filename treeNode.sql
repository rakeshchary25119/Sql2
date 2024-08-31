# Write your MySQL query statement below
select id, 'Root' as 'type' from tree where p_id is null
union 
select id, 'Inner' as 'type' from tree where id in (select distinct p_id from tree where p_id is not null) and p_id is not null
union
select id, 'Leaf' as 'type' from tree where id not in (select distinct p_id from tree where p_id is not null) and p_id is not null

select id, 
(case 
    when p_id is null then 'Root'
    when id in (select p_id from tree) then 'Inner'
    else 'Leaf'
end) as 'type' from tree