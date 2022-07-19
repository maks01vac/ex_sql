select
    distinct maker
from
    product
where
    maker not in (
        select
            maker
        from
            product
        where
            type = 'pc'
            and model not in (
                select
                    model
                from
                    pc
            )
    )