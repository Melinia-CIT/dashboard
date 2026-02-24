SELECT event_type, COUNT(*) AS count
FROM events
GROUP BY event_type
ORDER BY count DESC;
