SELECT
    e.name AS event_name,
    e.event_type,
    e.participation_type,
    e.max_allowed,
    COUNT(DISTINCT er.user_id) AS registrations,
    ROUND(100.0 * COUNT(DISTINCT er.user_id) / NULLIF(e.max_allowed, 0), 1) AS fill_rate
FROM events e
LEFT JOIN event_registrations er ON e.id = er.event_id
GROUP BY e.id, e.name, e.event_type, e.participation_type, e.max_allowed
ORDER BY registrations DESC;
