SELECT
    payment_status,
    COUNT(*) AS count,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status
ORDER BY total_amount DESC NULLS LAST;
