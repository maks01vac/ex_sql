-- Для пятого по счету пассажира из числа вылетевших из Ростова в апреле 2003 года 
-- определить компанию, номер рейса и дату вылета.
-- Замечание. Считать, что два рейса одновременно вылететь из Ростова не могут.


Select
    name,
    trip_no,
    date
from
(
        select
            row_number() over(
                order by
                    date + time_out,
                    ID_psg
            ) number_pass,
            name,
            t.trip_no,
            date
        from
            Company c,
            Pass_in_trip pit,
            Trip t
        where
            c.ID_comp = t.ID_comp
            and t.trip_no = pit.trip_no
            and town_from = 'Rostov'
            and year(date) = 2003
            and month(date) = 4
    ) _
where
    number_pass = 5