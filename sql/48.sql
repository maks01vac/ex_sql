-- Найдите классы кораблей, в которых хотя бы один 
-- корабль был потоплен в сражении.

SELECT
    c.class
FROM
    classes c
    inner join ships s on c.class = s.class
    inner join outcomes o on ship = name
WHERE
    result = 'sunk'
UNION
SELECT
    c.class
FROM
    classes c
    inner join outcomes o on o.ship = c.class
WHERE
    result = 'sunk'