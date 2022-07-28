select
    c.name,
    sum(vr.vr)
from
    (
        select
            distinct t.id_comp,
            pt.trip_no,
            pt.date,
            t.time_out,
            t.time_in,
            case
                when DATEDIFF(mi, t.time_out, t.time_in) > 0 then DATEDIFF(mi, t.time_out, t.time_in)
                when DATEDIFF(mi, t.time_out, t.time_in) <= 0 then DATEDIFF(mi, t.time_out, t.time_in + 1)
            end vr
        from
            pass_in_trip pt
            left join trip t on pt.trip_no = t.trip_no
    ) vr
    left join company c on vr.id_comp = c.id_comp
group by
    c.name