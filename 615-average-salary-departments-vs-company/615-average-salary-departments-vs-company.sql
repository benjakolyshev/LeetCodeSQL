SELECT  e1.pay_month,
        e1.department_id,
        ( CASE WHEN e1.mon_emp_avg > e2.mon_avg THEN "higher"
             WHEN e1.mon_emp_avg < e2.mon_avg THEN "lower"
             ELSE "same" END ) AS comparison
FROM
(
SELECT  AVG(s.amount) AS mon_emp_avg,
        DATE_FORMAT(s.pay_date, "%Y" "-" "%m") as pay_month,
        e.department_id
FROM    Salary s, Employee e
WHERE   s.employee_id = e.employee_id
GROUP BY    e.department_id, DATE_FORMAT(s.pay_date, "%Y" "-" "%m") ) e1
JOIN
(
SELECT  AVG(s.amount) AS mon_avg,
        DATE_FORMAT(s.pay_date, "%Y" "-" "%m") as pay_month
FROM    Salary s, Employee e
WHERE   s.employee_id = e.employee_id
GROUP BY    DATE_FORMAT(s.pay_date, "%Y" "-" "%m") ) e2
ON  e1.pay_month = e2.pay_month