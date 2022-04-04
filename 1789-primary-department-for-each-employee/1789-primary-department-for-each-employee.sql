SELECT  e.employee_id,
        e.department_id
FROM (
    SELECT  employee_id,
            department_id,
            primary_flag,
            RANK() OVER (partition by employee_id ORDER BY       primary_flag ASC) AS rnk
    FROM    Employee ) e
WHERE e.rnk = 1
