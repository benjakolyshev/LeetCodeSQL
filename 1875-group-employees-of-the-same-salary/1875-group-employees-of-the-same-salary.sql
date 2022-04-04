SELECT  e1.employee_id,
        e1.name,
        e1.salary,
        e2.team_id
FROM    
(
    SELECT  *
    FROM    Employees ) e1
RIGHT JOIN
(
SELECT  salary,
        dense_rank() over(order by salary asc) as team_id
FROM Employees 
GROUP BY salary HAVING COUNT(salary) > 1 ) e2
ON e1.salary = e2.salary
ORDER BY    e1.salary, e1.employee_id
