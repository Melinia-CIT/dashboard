SELECT
    DATE_TRUNC('day', paid_at) AS payment_date,
    COUNT(*) AS payments,
    COUNT(DISTINCT user_id) AS paid_users,
    SUM(COUNT(DISTINCT user_id)) OVER (ORDER BY DATE_TRUNC('day', paid_at)) AS cumulative_paid_users
FROM payments
WHERE payment_status = 'PAID' AND paid_at IS NOT NULL
GROUP BY DATE_TRUNC('day', paid_at)
ORDER BY payment_date;
