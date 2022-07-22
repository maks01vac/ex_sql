-- Определить названия всех кораблей из таблицы Ships, которые 
-- удовлетворяют, по крайней мере, комбинации любых четырёх 
-- критериев из следующего списка:
-- numGuns = 8
-- bore = 15
-- displacement = 32000
-- type = bb
-- launched = 1915
-- class=Kongo
-- country=USA




with q as (
    select
        name,
        case
            numGuns
            when 8 then 1
            else 0
        end as a,
        case
            bore
            when 15 then 1
            else 0
        end as c,
        case
            displacement
            when 32000 then 1
            else 0
        end as b,
        case
            type
            when 'bb' then 1
            else 0
        end as d,
        case
            launched
            when 1915 then 1
            else 0
        end as e,
        case
            c.class
            when 'Kongo' then 1
            else 0
        end as f,
        case
            country
            when 'USA' then 1
            else 0
        end as g
    from
        ships s,
        classes c
    where
        s.class = c.class
)
select
    name
from
    q
where
    (a + b + c + d + e + f + g) >= 4