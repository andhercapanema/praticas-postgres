SELECT s.name AS school, c.name AS course, COUNT(e.id) AS "studentsCount", e.status
FROM educations AS e
JOIN schools AS s
ON e."schoolId" = s.id
    JOIN courses AS c
    ON e."courseId" = c.id
    WHERE e.status IN ('ongoing', 'finished')
    GROUP BY school, course, e.status
    ORDER BY "studentsCount" DESC
    LIMIT 3;