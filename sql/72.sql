WITH count_pass AS (
    SELECT
        id_psg,
        COUNT(date) AS count
    FROM
        Trip t
        INNER JOIN Pass_in_trip p on t.trip_no = p.trip_no
    GROUP BY
        id_psg
    HAVING
        max(id_comp) = min(id_comp)
)
SELECT
    name,
    count
FROM
    count_pass c
    INNER JOIN passenger p on c.id_psg = p.id_psg
WHERE
    count =(
        SELECT
            MAX(count)
        FROM
            count_pass
    )