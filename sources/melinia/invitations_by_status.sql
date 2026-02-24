SELECT
    status AS invitation_status,
    COUNT(*) AS count
FROM invitations
GROUP BY status
ORDER BY count DESC;
