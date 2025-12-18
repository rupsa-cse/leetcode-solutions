CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    WITH cte AS (
        SELECT salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) rnk
        FROM Employee
    )
    SELECT salary 
    FROM cte
    WHERE rnk = N
    LIMIT 1
  );
END
