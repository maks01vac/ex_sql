-- Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.


SELECT
    name
FROM
    (
        SELECT
            t.id_psg,
            COUNT(name) as count_name,
            name,
            place
        FROM
            Passenger p
            INNER JOIN pass_in_trip t on t.id_psg = p.id_psg
        GROUP BY
            t.id_psg,
            place,
            name
        HAVING
            COUNT(name) > 1
    ) t


    -- вопрос: не прошел на тестировочной базе, я вроде все учел