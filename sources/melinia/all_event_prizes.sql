SELECT
    e.name AS event_name,
    e.event_type,
    ep.position,
    ep.reward_value
FROM event_prizes ep
JOIN events e ON ep.event_id = e.id
ORDER BY e.name, ep.position;
