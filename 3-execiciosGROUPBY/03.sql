SELECT u.name AS writer, COUNT(t.id) AS "testimonialCount"
FROM testimonials AS t
JOIN users AS u ON t."writerId" = u.id
WHERE u.id = 435
GROUP BY u.id;