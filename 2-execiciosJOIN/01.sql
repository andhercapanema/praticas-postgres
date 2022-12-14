SELECT u.id, u.name, c.name AS city
FROM users AS u
JOIN cities AS c
ON u."cityId" = c.id;