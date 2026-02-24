SELECT
    e.name AS event_name,
    er.round_no,
    er.round_name,
    er.round_description,
    er.start_time,
    er.end_time,
    COUNT(rr.id) AS total_rules
FROM event_rounds er
JOIN events e ON er.event_id = e.id
LEFT JOIN round_rules rr ON er.id = rr.round_id
GROUP BY e.name, er.round_no, er.round_name, er.round_description, er.start_time, er.end_time
ORDER BY e.name, er.round_no;
