-- Определить пассажиров, которые больше других времени провели в полетах.
-- Вывод: имя пассажира, общее время в минутах, проведенное в полетах


WITH time_trip AS (
    SELECT
        p.id_psg,
        SUM(
            Case
                When time_out >= time_in Then DATEDIFF(minute, time_out, time_in) + 1440
                ELSE DATEDIFF(minute, time_out, time_in)
            END
        ) as sum_trip_time
    FROM
        Trip t
        INNER JOIN Pass_in_trip p on t.trip_no = p.trip_no
    GROUP BY
        p.id_psg
)
SELECT
    name,
    sum_trip_time
FROM
    time_trip t
    INNER JOIN Passenger p ON t.id_psg = p.id_psg
WHERE
    sum_trip_time = (
        SELECT
            MAX(sum_trip_time)
        FROM
            time_trip
    )