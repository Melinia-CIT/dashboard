SELECT
    COUNT(*) AS total_users,
    COUNT(*) FILTER (WHERE role = 'PARTICIPANT') AS participants,
    COUNT(*) FILTER (WHERE role = 'VOLUNTEER') AS volunteers,
    COUNT(*) FILTER (WHERE role = 'ORGANIZER') AS organizers,
    COUNT(*) FILTER (WHERE role = 'ADMIN') AS admins
FROM users;
