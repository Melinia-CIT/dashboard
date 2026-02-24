SELECT
    e.name AS event_name,
    rr.status,
    COUNT(*) AS count
FROM round_results rr
JOIN event_rounds er ON rr.round_id = er.id
JOIN events e ON er.event_id = e.id
GROUP BY e.name, rr.status
ORDER BY e.name, rr.status;
