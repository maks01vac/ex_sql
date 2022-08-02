-- Найти НЕ белые и НЕ черные квадраты, которые окрашены разными цветами в 
-- пропорции 1:1:1. Вывод: имя квадрата, количество краски одного цвета
select
    B_Q_ID,
    sum(sum_b_vol) / 3 sum_b_vol
from
    (
        select
            B_Q_ID,
            V_COLOR,
            sum(B_VOL) sum_b_vol
        from
            utB
            inner join utV on B_V_ID = V_ID
        group by
            B_Q_ID,
            V_COLOR
    ) z
group by
    B_Q_ID
having
    count(v_color) = 3
    and sum(sum_b_vol) < 765
    and sum(sum_b_vol) % 3 = 0

    -- Не прошло проверку на второй базе