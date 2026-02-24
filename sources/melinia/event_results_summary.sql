SELECT
    e.name AS event_name,
    COUNT(DISTINCT evr.user_id) AS total_winners,
    COALESCE(SUM(ep.reward_value), 0) AS total_prize_value,
    SUM(evr.points) AS total_points
FROM event_results evr
JOIN events e ON evr.event_id = e.id
LEFT JOIN event_prizes ep ON evr.prize_id = ep.id
GROUP BY e.name
ORDER BY total_prize_value DESC;
