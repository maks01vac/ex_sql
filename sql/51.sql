-- Найдите названия кораблей, имеющих наибольшее 
-- число орудий среди всех имеющихся кораблей 
-- такого же водоизмещения (учесть корабли из таблицы Outcomes).


with all_ships as (
    select
        name,
        class
    from
        ships
    union
    select
        ship,
        ship
    from
        outcomes
)
select
    name
from
    all_ships a
    join classes c on a.class = c.class
where
    numguns >= all(
        select
            cl.numguns
        from
            classes cl
        where
            cl.displacement = c.displacement
            and cl.class in (
                select
                    a.class
                from
                    all_ships a
            )
    )