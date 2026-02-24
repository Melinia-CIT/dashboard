SELECT
    e.id,
    e.name,
    e.event_type,
    e.participation_type,
    e.max_allowed,
    e.venue,
    e.start_time,
    e.end_time,
    e.registration_start,
    e.registration_end,
    COUNT(DISTINCT er.user_id) AS registrations
FROM events e
LEFT JOIN event_registrations er ON e.id = er.event_id
GROUP BY e.id, e.name, e.event_type, e.participation_type, e.max_allowed, e.venue, e.start_time, e.end_time, e.registration_start, e.registration_end
ORDER BY e.start_time;
