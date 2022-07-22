-- Найти производителей, которые выпускают только принтеры или только PC.
-- При этом искомые производители PC должны выпускать не менее 3 моделей.



select
    maker
from
    product
where
    type = 'printer'

except

select
    maker
from
    product
where
    type != 'printer'

union

(
    select
        maker
    from
        product
    where
        type = 'pc'
    group by
        maker
    having
        count(model) >= 3

    except

    select
        maker
    from
        product
    where
        type != 'pc'
)