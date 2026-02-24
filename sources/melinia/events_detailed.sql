SELECT
    e.id,
    e.name,
    e.event_type,
    e.participation_type,
    e.max_allowed,
    e.min_team_size,
    e.max_team_size,
    e.venue,
    e.start_time,
    e.end_time,
    e.registration_start,
    e.registration_end,
    COUNT(DISTINCT er.user_id) AS registrations,
    COUNT(DISTINCT ec.user_id) AS crew_count,
    COUNT(DISTINCT eround.id) AS round_count,
    COALESCE(SUM(ep_agg.total_prize), 0) AS total_prize_pool
FROM events e
LEFT JOIN event_registrations er ON e.id = er.event_id
LEFT JOIN event_crews ec ON e.id = ec.event_id
LEFT JOIN event_rounds eround ON e.id = eround.event_id
LEFT JOIN (
    SELECT event_id, SUM(reward_value) AS total_prize
    FROM event_prizes
    GROUP BY event_id
) ep_agg ON e.id = ep_agg.event_id
GROUP BY e.id, e.name, e.event_type, e.participation_type, e.max_allowed, e.min_team_size, e.max_team_size, e.venue, e.start_time, e.end_time, e.registration_start, e.registration_end
ORDER BY e.start_time;
