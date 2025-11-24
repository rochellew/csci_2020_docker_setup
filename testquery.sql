SELECT COUNT(p.power_name) as "Powers",
    c.name
FROM characters c
    INNER JOIN character_powers cp ON cp.character_id = c.id
    INNER JOIN powers p ON p.id = cp.power_id
GROUP BY c.name
ORDER BY "Powers" DESC;