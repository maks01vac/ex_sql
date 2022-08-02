Select
    min(t.trip_no),
    min(tt.trip_no),
    min(ttt.trip_no),
    max(t.trip_no),
    max(tt.trip_no),
    max(ttt.trip_no)
from
    trip t,
    trip tt,
    trip ttt
where
    tt.trip_no > t.trip_no
    and ttt.trip_no > tt.trip_no