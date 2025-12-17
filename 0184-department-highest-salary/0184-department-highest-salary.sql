WITH cte AS (
    SELECT *, 
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) as rnk
    FROM Employee
)
SELECT d.name as Department,
    c.name as Employee,
    c.salary as Salary
FROM cte c
JOIN Department d
    ON c.departmentId = d.id
WHERE rnk = 1