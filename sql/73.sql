-- Для каждой страны определить сражения, в которых не 
-- участвовали корабли данной страны.
-- Вывод: страна, сражение


with sh as (
    select
        class,
        name
    from
        ships
    union
    select
        ship,
        ship
    from
        outcomes
),
cc as (
    select
        name,
        country,
        battle
    from
        Classes c
        left join sh on c.class = sh.class
        join outcomes o on sh.name = o.ship
)
select
    distinct c.country,
    b.name
from
    classes c,
    battles b
where
    (
        select
            count(cc.country)
        from
            cc
        where
            cc.country = c.country
            and cc.battle = b.name
    ) = 0