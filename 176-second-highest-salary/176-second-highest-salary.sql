SELECT  MAX(s.salary) as SecondHighestSalary
FROM    (
    Select  salary,
            DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
    FROM    Employee ) s
WHERE   rnk = 2