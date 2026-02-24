SELECT
    e.name AS event_name,
    er.round_no,
    er.round_name,
    COUNT(DISTINCT erc.user_id) AS round_checkins
FROM event_rounds er
JOIN events e ON er.event_id = e.id
LEFT JOIN event_round_checkins erc ON er.id = erc.round_id
GROUP BY e.name, er.round_no, er.round_name
ORDER BY e.name, er.round_no;
