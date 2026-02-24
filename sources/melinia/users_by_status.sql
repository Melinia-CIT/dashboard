SELECT status, COUNT(*) AS count
FROM users
GROUP BY status
ORDER BY count DESC;
