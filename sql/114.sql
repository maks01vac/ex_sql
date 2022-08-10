-- Определить имена разных пассажиров, которым чаще других 
-- доводилось лететь на одном и том же месте. Вывод: имя и 
-- количество полетов на одном и том же месте.






WITH Count_psg_place AS (
    SELECT
        ID_psg,
        COUNT(*) as count_place_psg
    FROM
        Pass_In_Trip
    GROUP BY
        ID_psg,
        place
),
Max_count_psg_place AS (
    SELECT
        DISTINCT ID_psg,
        count_place_psg
    FROM
        Count_psg_place
    WHERE
        count_place_psg =(
            SELECT
                MAX(count_place_psg)
            FROM
                Count_psg_place
        )
)
SELECT
    name,
    count_place_psg
FROM
    Max_count_psg_place m
    INNER JOIN Passenger p ON (m.ID_psg = p.ID_psg)