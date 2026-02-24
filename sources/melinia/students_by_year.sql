SELECT year, COUNT(*) AS students
FROM profile
GROUP BY year
ORDER BY year;
