SELECT  e1.student_id,
        s.student_name
FROM
(
    SELECT  *
    FROM    Exam ) e1
LEFT JOIN
(
    SELECT  exam_id,
            MAX(score) as bad_score
    FROM    Exam
    GROUP BY    exam_id

    UNION ALL

    SELECT  exam_id,
            MIN(score) as bad_score
    FROM    Exam
    GROUP BY    exam_id ) e2
ON  e1.exam_id = e2.exam_id AND e1.score = e2.bad_score, Student s
WHERE   e1.student_id = s.student_id
GROUP BY    e1.student_id HAVING (SUM(e2.bad_score)) IS NULL
ORDER BY    e1.student_id