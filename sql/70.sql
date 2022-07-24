-- Укажите сражения, в которых участвовало по 
-- меньшей мере три корабля одной и той же страны.



SELECT
    DISTINCT battle
FROM
    (
        SELECT
            battle,
            country
        FROM
            (
                SELECT
                    battle,
                    country
                FROM
                    Outcomes
                    INNER JOIN Classes ON ship = class
                where
                    ship not in (
                        select
                            name
                        from
                            ships
                    )
                UNION
                ALL
                SELECT
                    battle,
                    country
                FROM
                    Outcomes o
                    INNER JOIN Ships s ON o.ship = s.name
                    INNER JOIN Classes c ON s.class = c.class
            ) battle
        GROUP BY
            battle,
            country
        HAVING
            COUNT(*) >= 3
    ) battle_having_3