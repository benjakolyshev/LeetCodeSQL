SELECT  (CASE WHEN (SELECT COUNT(DISTINCT(salary) > 1) FROM Employee) THEN
(SELECT e1.salary 
FROM    (

    SELECT  salary
    FROM    Employee
    GROUP BY    salary
    ORDER BY    salary  DESC
    LIMIT   2   ) e1

LEFT JOIN   (

    SELECT  salary
    FROM    Employee
    GROUP BY    salary
    ORDER BY    salary  DESC
    LIMIT   1   ) e2

ON  e1.salary = e2.salary
WHERE   e2.salary IS NULL)
ELSE NULL END ) SecondHighestSalary
FROM    Employee
LIMIT   1