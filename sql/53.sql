select
    cast(avg(numguns * 1.0) as numeric(6, 2)) as "avg numguns"
from
    classes
where
    type = 'bb'