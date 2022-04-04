# Write your MySQL query statement below
SELECT  p.firstName,
        p.lastName,
        a.city,
        a.state
FROM    (
    SELECT  *
    FROM    Person ) p
LEFT JOIN   (
    SELECT  *
    FROM    Address ) a
ON p.personId = a.personId