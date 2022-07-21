-- Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.


select name from passenger
where id_psg in (
  select
    p.id_psg
    from pass_in_trip p
    group by p.id_psg, p.place
    having count(*) > 1
)

