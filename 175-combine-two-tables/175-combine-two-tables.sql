# We do a left join here because we want all of the person's first and last names
# but we do not care for their addresses if we do not have their names
SELECT  p.lastName,
        p.firstName,
        a.city,
        a.state
FROM    
(
SELECT  *
FROM    Person ) p
LEFT JOIN 
(
SELECT  *
FROM    Address ) a
ON  p.personId = a.personId