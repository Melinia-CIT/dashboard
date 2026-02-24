SELECT
    DATE_TRUNC('day', created_at) AS registration_date,
    COUNT(*) AS new_users,
    SUM(COUNT(*)) OVER (ORDER BY DATE_TRUNC('day', created_at)) AS cumulative_users
FROM users
GROUP BY DATE_TRUNC('day', created_at)
ORDER BY registration_date;
