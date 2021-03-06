-- Определить страны, которые потеряли в сражениях все свои корабли.
WITH Sunk_Out AS (
    SELECT
        country,
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
        country
),
C_a AS (
    SELECT
        country,
        COUNT(name) AS amount_name
    FROM
        (
            SELECT
                DISTINCT country,
                name
            FROM
                Classes c
                INNER JOIN Ships s ON c.class = s.class
            GROUP BY
                country,
                name
            UNION
            SELECT
                DISTINCT country,
                ship
            FROM
                Classes c
                INNER JOIN Outcomes o ON c.class = o.ship
        ) c
    GROUP BY
        country
)
SELECT
    c.country
FROM
    C_a c
    INNER JOIN Sunk_Out s ON c.country = s.country
WHERE
    amount_sunk = amount_name