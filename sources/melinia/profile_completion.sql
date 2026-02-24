SELECT
    COUNT(*) FILTER (WHERE profile_completed = true) AS completed,
    COUNT(*) FILTER (WHERE profile_completed = false) AS not_completed,
    ROUND(100.0 * COUNT(*) FILTER (WHERE profile_completed = true) / NULLIF(COUNT(*), 0), 1) AS completion_rate
FROM users;
