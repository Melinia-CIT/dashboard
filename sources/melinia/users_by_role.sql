SELECT role, COUNT(*) AS count
FROM users
GROUP BY role
ORDER BY count DESC;
