SELECT
    c.name AS college_name,
    COUNT(p.id) AS students
FROM profile p
JOIN colleges c ON p.college_id = c.id
GROUP BY c.name
ORDER BY students DESC
LIMIT 20;
