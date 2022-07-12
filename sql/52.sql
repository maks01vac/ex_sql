-- Определить названия всех кораблей из таблицы Ships, 
-- которые могут быть линейным японским кораблем,
-- имеющим число главных орудий не менее девяти, 
-- калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн


SELECT
    DISTINCT s.name
FROM
    ships s
    JOIN classes c ON c.class = s.class
WHERE
    c.country = 'JAPAN'
    and (
        numguns >= 9
        or numguns is NULL
    )
    AND (
        c.bore < 19
        OR c.bore IS NULL
    )
    AND (
        displacement <= 65000
        OR c.displacement IS NULL
    )
    AND c.type = 'bb'