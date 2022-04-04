# Write your MySQL query statement below
/*
SELECT  Department.name as Department,
        Employee.name as Employee,
        Employee.salary as Salary
FROM (
    SELECT  departmentID,
            name,
            MAX(salary) as salary
    FROM    Employee
    GROUP BY    departmentID) Employee,
    (
    SELECT  id,
            name 
    FROM Department ) Department
WHERE   Employee.departmentId = Department.id
*/
SELECT  department.name as Department,
        secondT.name as Employee,
        secondT.salary as Salary
FROM (
    SELECT  departmentID,
            MAX(salary) as salary
    FROM    Employee
    GROUP BY    departmentID ) firstT,
    (
    SELECT  *
    FROM    Employee ) secondT,
    (
    SELECT  *
    FROM    Department ) department
    WHERE firstT.salary = secondT.salary AND firstT.departmentID = secondT.departmentID AND secondT.departmentID = Department.ID
