with maker as (
    select
        maker,
        max(iif(type = 'laptop', 'Laptop', char(20))) as laptop,
        max(iif(type = 'pc', 'PC', char(20))) as pc,
        max(iif(type = 'printer', 'Printer', char(20))) as printer
    from
        product
    group by
        maker
)
select
    maker,
    replace(
        replace(
            replace(
                laptop + '/' + pc + '/' + printer,
                char(20) + '/',
                ''
            ),
            '/' + char(20),
            ''
        ),
        char(20),
        ''
    ) as types
from
    maker