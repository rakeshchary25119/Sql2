select (
    case
        when MOD(id, 2) != 0 and id != cnts then id + 1 
        when MOD(id, 2) != 0 and id = cnts then id
        else id - 1
    end
) as id, student from seat, 
(select count(*) as cnts from seat) as seat_counts order by id;


select s1.id, coalesce(s2.student, s1.student) as student from seat s1 
left join seat s2 on s2.id = ((s1.id + 1) ^ 1) - 1 order by s1.id;