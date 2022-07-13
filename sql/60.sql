-- Посчитать остаток денежных средств на начало дня 15/04/01 
-- на каждом пункте приема для базы данных с отчетностью не 
-- чаще одного раза в день. 
-- Вывод: пункт, остаток.
-- Замечание. Не учитывать пункты, информации о которых нет до указанной даты.


SELECT
    i.point,
    sum_inc - (
        CASE
            WHEN sum_out is null THEN 0
            ELSE sum_out
        END
    )
FROM
    (SELECT
            point,
            SUM(inc) AS sum_inc
        FROM
            Income_o
where date < Cast('2001-04-15' as datetime)
        GROUP BY
            point) i
    LEFT JOIN (SELECT
            point,
            SUM(out) AS sum_out
        FROM
            Outcome_o
where date < Cast('2001-04-15' as datetime)
        GROUP BY
            point) o ON o.point = i.point

