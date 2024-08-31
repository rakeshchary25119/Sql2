with cte as 
(select departmentId, name as 'Employee', salary as 'Salary', 
DENSE_Rank() OVER (PARTITION BY departmentId order by salary desc) as 'rnk' 
from Employee)
select d.name as "department", c.Employee, c.salary from cte c join department d 
on c.departmentId = d.id 
where c.rnk <= 3


