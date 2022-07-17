WITH count_trip AS (
    SELECT
        COUNT(*) as count
    FROM
        trip
    GROUP BY
        town_from,
        town_to
)
SELECT
    COUNT(*)
FROM
    count_trip c
WHERE
    count =(
        SELECT
            MAX(count)
        FROM
            count_trip
    )