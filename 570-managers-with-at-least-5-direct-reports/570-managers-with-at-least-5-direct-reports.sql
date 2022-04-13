
SELECT  name
FROM    Employee
WHERE   id IN (
        SELECT  managerId
FROM    Employee
WHERE   managerId NOT IN ('None')
GROUP BY    managerId HAVING COUNT(managerId) >= 5 )

