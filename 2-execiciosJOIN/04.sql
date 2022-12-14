SELECT u.id, u.name, r.name AS role, c.name AS company, e."startDate"
FROM experiences AS e
JOIN users AS u
ON e."userId" = u.id
    JOIN roles AS r
    ON e."roleId" = r.id
        JOIN companies AS c
        ON e."companyId" = c.id
            WHERE u.id = 50 AND e."endDate" IS NULL;