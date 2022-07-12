-- Найдите названия кораблей с орудиями калибра 16 дюймов 
-- (учесть корабли из таблицы Outcomes).

SELECT
    name
FROM
    Ships s
    INNER JOIN Classes c ON s.class = c.class
WHERE
    bore = '16'
UNION
SELECT
    ship
FROM
    Outcomes o
    LEFT JOIN Classes c ON ship = c.class
WHERE
    bore = '16'