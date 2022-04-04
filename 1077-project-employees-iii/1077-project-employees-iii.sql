# Write your MySQL query statement below
SELECT  project.project_id,
        employee.employee_id
FROM (
    SELECT  project_id, 
            employee_id
    FROM Project ) project
    JOIN
    (
    SELECT  employee_id,
            experience_years
    FROM Employee ) employee
ON project.employee_id = employee.employee_id
WHERE experience_years >= ALL(
                                SELECT MAX(experience_years)
                                FROM Project p2 JOIN Employee e2 
                                ON p2.employee_id = e2.employee_id
                                WHERE p2.project_id = project.project_id)


