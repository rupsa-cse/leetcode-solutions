# Write your MySQL query statement below
SELECT d.name as Department,
    t.name AS Employee,
    t.salary AS Salary
FROM (
    SELECT *,
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) as rnk
    FROM Employee
) t
JOIN Department d
    ON t.departmentId = d.id
WHERE rnk <= 3
