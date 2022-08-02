with a as(
    select
        x.class,
        x.numGuns,
        row_number() over(
            partition by x.class
            order by
                x.numguns
        ) n
    from
        Classes x,
        classes y
    where
        x.type = 'bc'
)
select
    distinct class,
    'bc-' + cast(n as char(2))
from
    a
where
    numguns > = n