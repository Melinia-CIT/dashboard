SELECT
    d.name AS degree_name,
    COUNT(p.id) AS students
FROM profile p
JOIN degrees d ON p.degree_id = d.id
GROUP BY d.name
ORDER BY students DESC;
