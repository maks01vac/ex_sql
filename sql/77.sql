with q as (
select
  count(distinct t.trip_no) as trip_count
  , pt.date
from trip t, pass_in_trip pt
where t.trip_no=pt.trip_no
      and town_from='Rostov'
group by date
)
select
  trip_count, date
  from q
  where trip_count=(select max(trip_count) from q)