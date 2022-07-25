-- С точностью до 2-х десятичных знаков определите 
-- среднее число орудий всех линейных кораблей 
-- (учесть корабли из таблицы Outcomes).


select
    cast(avg(numguns * 1.0) as numeric(6, 2)) as avg_numg
from
    (
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
    ) s
    join classes c on s.class = c.class
where
    type = 'bb'