/*
SELECT  e.employee_id,
        e.department_id
FROM (
    SELECT  employee_id,
            department_id,
            primary_flag,
            RANK() OVER (partition by employee_id ORDER BY       primary_flag ASC) AS rnk
    FROM    Employee ) e
WHERE e.rnk = 1
*/
SELECT  employee_id,
        department_id
FROM    Employee
WHERE   primary_flag = 'Y'

UNION

SELECT  employee_id,
        department_id
FROM    Employee
GROUP BY    employee_id HAVING COUNT(primary_flag) = 1