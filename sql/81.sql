with q as(
    select
        *,
        sum(out) over(
            partition by year(date),
            month(date)
        ) as month_out
    from
        Outcome o
)
select
    code,
    point,
    date,
    out
from
    q
where
    month_out =(
        select
            max(month_out)
        from
            q
    )