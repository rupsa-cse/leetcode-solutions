# Write your MySQL query statement below
SELECT DISTINCT num AS ConsecutiveNums 
FROM (
    SELECT id, num,
        LAG(num) OVER(ORDER BY id) AS prev_num,
        LEAD(num) OVER(ORDER BY id) AS nxt_num
    FROM Logs 
) t
WHERE prev_num = num 
    AND nxt_num = num;