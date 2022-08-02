-- Определить имена разных пассажиров, когда-либо 
-- летевших рейсом, который вылетел в субботу, а приземлился в воскресенье.



select
    name
from
    passenger
where
    id_psg in (
        select
            id_psg
        from
            pass_in_trip pit
            join trip t on pit.trip_no = t.trip_no
        where
            time_in < time_out
            and datepart(dw, date) = 7
    )