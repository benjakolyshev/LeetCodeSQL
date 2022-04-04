CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (   
    select  max(salary) as SecondHighestSalary
    from    (   select  salary,
                        dense_rank() over (order by salary desc) r
                from Employee
            ) t0
    where t0.r = N

  );
END