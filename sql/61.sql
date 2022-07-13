-- Посчитать остаток денежных средств на всех пунктах 
-- приема для базы данных с отчетностью не чаще одного раза в день.




SELECT
    SUM(sum_inc) - (
        CASE
            WHEN SUM(sum_out) is null THEN 0
            ELSE SUM(sum_out)
        END
    )
FROM
    (
        SELECT
            point,
            SUM(inc) AS sum_inc
        FROM
            Income_o
        GROUP BY
            point
    ) i
    LEFT JOIN (
        SELECT
            point,
            SUM(out) AS sum_out
        FROM
            Outcome_o
        GROUP BY
            point
    ) o ON o.point = i.point