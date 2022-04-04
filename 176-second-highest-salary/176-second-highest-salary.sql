SELECT  MAX(salary) as SecondHighestSalary
FROM
(
SELECT  salary, 
        DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
FROM    Employee ) e
WHERE   e.rnk = 2
