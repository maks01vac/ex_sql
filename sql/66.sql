SELECT
    date,
    max(c)
FROM
    (
        SELECT
            date,
            count(*) AS c
        FROM
            Trip,
            (
                SELECT
                    trip_no,
                    date
                FROM
                    Pass_in_trip
                WHERE
                    date >= '2003-04-01'
                    AND date <= '2003-04-07'
                GROUP BY
                    trip_no,
                    date
            ) AS t1
        WHERE
            Trip.trip_no = t1.trip_no
            AND town_from = 'Rostov'
        GROUP BY
            date
        UNION
        ALL
        SELECT
            '2003-04-01',
            0
        UNION
        ALL
        SELECT
            '2003-04-02',
            0
        UNION
        ALL
        SELECT
            '2003-04-03',
            0
        UNION
        ALL
        SELECT
            '2003-04-04',
            0
        UNION
        ALL
        SELECT
            '2003-04-05',
            0
        UNION
        ALL
        SELECT
            '2003-04-06',
            0
        UNION
        ALL
        SELECT
            '2003-04-07',
            0
    ) AS t2
GROUP BY
    date