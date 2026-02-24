SELECT payment_status, COUNT(*) AS count
FROM users
GROUP BY payment_status
ORDER BY count DESC;
