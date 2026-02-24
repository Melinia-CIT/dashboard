SELECT
    COUNT(*) AS total_coupons,
    COUNT(cr.id) AS redeemed,
    COUNT(*) - COUNT(cr.id) AS available
FROM coupons c
LEFT JOIN coupon_redemptions cr ON c.id = cr.coupon_id;
