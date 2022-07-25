-- Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
-- Замечания.
-- 1) A - B и B - A считать ОДНИМ И ТЕМ ЖЕ маршрутом.
-- 2) Использовать только таблицу Trip


with Trips as (
    select
        count(*) as count_trips
    from
        trip
    group by
        case
            when town_from > town_to then town_from
            else town_to
        end,
case
            when town_from < town_to then town_from
            else town_to
        end
)
select
    count(*) as count_trips
from
    Trips
where
    count_trips =(
        select
            max(count_trips)
        from
            Trips
    )