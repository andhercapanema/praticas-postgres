SELECT s.id, s.name AS school, cour.name AS course, comp.name AS company, r.name AS role
FROM applicants AS a
JOIN educations AS e
ON a."userId" = e."userId"
    JOIN schools AS s
    ON e."schoolId" = s.id
        JOIN courses AS cour
        ON e."courseId" = cour.id
            JOIN jobs AS j
            ON a."jobId" = j.id
                JOIN companies AS comp
                ON j."companyId" = comp.id
                    JOIN roles AS r
                    ON j."roleId" = r.id
                    WHERE comp.id = 10 AND r.name='Software Engineer' AND j.active = true;