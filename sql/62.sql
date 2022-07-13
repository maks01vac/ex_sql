-- Посчитать остаток денежных средств на всех пунктах приема на 
-- начало дня 15/04/01 для базы данных с отчетностью не чаще одного раза в день.



SELECT
    SUM(sum_inc) - SUM(sum_out)
FROM
    (
        SELECT
            point,
            SUM(inc) AS sum_inc
        FROM
            Income_o
        where
            date < Cast('2001-04-15' as datetime)
        GROUP BY
            point
    ) i
    LEFT JOIN (
        SELECT
            point,
            SUM(out) AS sum_out
        FROM
            Outcome_o
        where
            date < Cast('2001-04-15' as datetime)
        GROUP BY
            point
    ) o ON o.point = i.point