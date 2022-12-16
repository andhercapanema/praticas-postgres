SELECT MAX(j.salary) AS "maximumSalary", r.name AS role
FROM jobs AS j
JOIN roles AS r ON j."roleId" = r.id
WHERE j.active = true
GROUP BY r.id
ORDER BY "maximumSalary";