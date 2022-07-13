-- Определить страны, которые потеряли в сражениях все свои корабли.

WITH Sunk_Out AS (
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
        INNER JOIN Classes c ON s.class = c.class
        OR o.ship = c.class
    GROUP BY
        c.class
),
ClassHaving3 AS (
    SELECT c.class,
		 COUNT(name) AS amount_name
		FROM 
			(SELECT DISTINCT c.class,
		 name
			FROM Classes c
			INNER JOIN Ships s
				ON c.class=s.class
			UNION
			SELECT DISTINCT c.class,
		 ship
			FROM Classes c
			INNER JOIN Outcomes o
				ON c.class=o.ship) c
			GROUP BY  c.class HAVING COUNT(name)>=3) c
    GROUP BY
        country
)
SELECT
    c.class, amount_sunk
FROM
    ClassHaving3 c
    INNER JOIN Sunk_Out s ON c.country = s.country
WHERE
    s.amount_sunk = c.amount_name