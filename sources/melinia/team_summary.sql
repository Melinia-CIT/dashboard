SELECT
    COUNT(*) AS total_teams,
    ROUND(AVG(member_count), 1) AS avg_team_size,
    MAX(member_count) AS max_team_size
FROM (
    SELECT t.id, COUNT(tm.user_id) AS member_count
    FROM teams t
    LEFT JOIN team_members tm ON t.id = tm.team_id
    GROUP BY t.id
) sub;
