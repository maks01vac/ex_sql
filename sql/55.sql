-- Для каждого класса определите год, когда был спущен на 
-- воду первый корабль этого класса. Если год спуска на воду 
-- головного корабля неизвестен, определите минимальный год 
-- спуска на воду кораблей этого класса. 
-- Вывести: класс, год.


SELECT
    c.class,
    s.min_launched
FROM
    classes c
    LEFT JOIN (
        SELECT
            class,
            MIN(launched) AS min_launched
        FROM
            ships
        GROUP BY
            class
    ) AS S  ON c.class = s.class
