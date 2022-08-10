-- Определить имена разных пассажиров, летевших 
-- хотя бы два раза подряд на месте с одним и тем же номером.



with same_place as (
    select
        p.id_psg,
        p.name,
        pit.trip_no,
        pit.date,
        pit.place,
        row_number() over(
            partition by p.id_psg
            order by
                pit.date,
                t.time_out
        ) num
    from
        passenger p
        join pass_in_trip pit on pit.id_psg = p.id_psg
        join trip t on t.trip_no = pit.trip_no
)
select
    s1.name
from
    same_place s1
    join same_place s2 on s2.id_psg = s1.id_psg
    and s2.place = s1.place
    and s2.num = s1.num + 1
group by
    s1.id_psg,
    s1.name