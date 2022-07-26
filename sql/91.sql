-- C точностью до двух десятичных знаков 
-- определить среднее количество краски на квадрате.


SELECT
    cast(avg(amount_dye * 1.0) as numeric(6, 2))
FROM
    (
        select
            case
                when sum(b_vol) IS NULL THEN 0
                ELSE CAST(sum(b_vol) AS numeric(6, 2))
            END amount_dye
        from
            utq
            left join utb on utq.q_id = utb.b_q_id
        group by
            q_id
    ) d