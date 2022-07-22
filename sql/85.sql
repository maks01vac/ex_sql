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