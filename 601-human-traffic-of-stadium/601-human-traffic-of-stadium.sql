SELECT  DISTINCT(s.id) as id,
        s.visit_date as visit_date,
        s.people as people
FROM
(
    SELECT  s3.id,
            s3.visit_date,
            s3.people
    FROM    Stadium s1, Stadium s2, Stadium s3, Stadium s4
    WHERE   s1.id = s2.id+1 AND s2.id = s3.id+1
            AND s1.people > 99 AND s2.people > 99 AND s3.people > 99

    UNION ALL

    SELECT  s2.id,
            s2.visit_date,
            s2.people
    FROM    Stadium s1, Stadium s2, Stadium s3, Stadium s4
    WHERE   s1.id = s2.id+1 AND s2.id = s3.id+1
            AND s1.people > 99 AND s2.people > 99 AND s3.people > 99

    UNION ALL

    SELECT  s1.id,
            s1.visit_date,
            s1.people
    FROM    Stadium s1, Stadium s2, Stadium s3, Stadium s4
    WHERE   s1.id = s2.id+1 AND s2.id = s3.id+1
            AND s1.people > 99 AND s2.people > 99 AND s3.people > 99 ) s
ORDER BY    visit_date ASC