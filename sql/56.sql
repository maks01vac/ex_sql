-- Для каждого класса определите число кораблей этого класса, 
-- потопленных в сражениях. Вывести: класс и число потопленных кораблей.



SELECT
    c.class,
    COUNT(ship) AS amount_sunk
FROM
    (
        SELECT
            ship
        FROM
            Outcomes
        WHERE
            result = 'sunk'
    ) o
    LEFT JOIN Ships s ON o.ship = s.name
    Right JOIN Classes c ON s.class = c.class
    OR o.ship = c.class
GROUP BY
    c.class