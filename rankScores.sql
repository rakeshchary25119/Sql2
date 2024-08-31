select score, dense_rank() over(order by score desc) as 'rank'
from scores order by 'rank'

select s1.score, (select (count(distinct s2.score) + 1) from scores s2 
where s1.score < s2.score) as 'rank' from scores s1 order by s1.score desc