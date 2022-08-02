select
    name
from
    passenger
where
    id_psg in (
        select
            id_psg
        from
            trip t,
            pass_in_trip pit
        where
            t.trip_no = pit.trip_no
        group by
            id_psg
        having
            count(
                distinct case
                    when town_from <= town_to then town_from + town_to
                    else town_to + town_from
                end
            ) = 1
    )