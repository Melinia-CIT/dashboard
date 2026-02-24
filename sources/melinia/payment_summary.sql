SELECT
    COUNT(*) AS total_payments,
    COUNT(*) FILTER (WHERE payment_status = 'PAID') AS successful_payments,
    COUNT(DISTINCT user_id) FILTER (WHERE payment_status = 'PAID') AS total_paid_users,
    COALESCE(ROUND(AVG(amount) FILTER (WHERE payment_status = 'PAID'), 2), 0) AS avg_payment
FROM payments;
