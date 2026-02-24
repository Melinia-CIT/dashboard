SELECT
    COUNT(*) AS total_checkins,
    COUNT(DISTINCT participant_id) AS unique_participants,
    MIN(checkedin_at) AS first_checkin,
    MAX(checkedin_at) AS last_checkin
FROM check_ins;
