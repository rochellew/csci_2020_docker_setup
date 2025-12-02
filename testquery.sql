SELECT COUNT(p.power_name) as "Num Powers",
    c.name,
    STRING_AGG(p.power_name, ', '
    ORDER BY p.power_name)
FROM marvel.characters c
    INNER JOIN marvel.character_powers cp ON cp.character_id = c.id
    INNER JOIN marvel.powers p ON p.id = cp.power_id

GROUP BY c.name
ORDER BY c.name;