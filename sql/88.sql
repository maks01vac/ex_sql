with pass_one_comp as (
    select
        p.id_psg,
        count(p.trip_no) as count_trip,
        max(t.id_comp) as id_comp
    from
        pass_in_trip p
        join trip t on p.trip_no = t.trip_no
    group by
        p.id_psg
    having
        count(distinct t.id_comp) = 1
)
select
    pas.name,
    p.count_trip,
    c.name
from
    pass_one_comp p
    join company c on p.id_comp = c.id_comp
    join passenger pas on p.id_psg = pas.id_psg
where
    p.count_trip = (
        select
            max(count_trip)
        from
            pass_one_comp
    )