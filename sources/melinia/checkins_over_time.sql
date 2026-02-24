SELECT
    DATE_TRUNC('hour', checkedin_at) AS checkin_hour,
    COUNT(*) AS checkins
FROM check_ins
GROUP BY DATE_TRUNC('hour', checkedin_at)
ORDER BY checkin_hour;
