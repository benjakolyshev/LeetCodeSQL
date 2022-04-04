SELECT  d.name as Department,
        e.name as Employee,
        e.salary as Salary
FROM
(
    SELECT  name,
            id,
            salary,
            DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) rnk,
            departmentId
    FROM    Employee ) e
LEFT JOIN
(
    SELECT  *
    FROM    Department ) d
ON  e.departmentId = d.id
WHERE   rnk < 4
