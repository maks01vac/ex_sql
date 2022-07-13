-- Посчитать остаток денежных средств на каждом пункте приема для 
-- базы данных с отчетностью не чаще одного раза в день. 
-- Вывод: пункт, остаток.


SELECT
    i.point,
    sum_inc - (
        CASE
            WHEN sum_out is null THEN 0
            ELSE sum_out
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