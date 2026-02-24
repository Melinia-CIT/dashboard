SELECT
    DATE_TRUNC('day', er.registered_at) AS reg_date,
    COUNT(*) AS registrations
FROM event_registrations er
GROUP BY DATE_TRUNC('day', er.registered_at)
ORDER BY reg_date;
