with red_blue as (
    select
        v.v_name,
        v.v_id,
        count(
            case
                when v_color = 'R' then 1
            end
        ) over(partition by v_id) count_red,
        count(
            case
                when v_color = 'B' then 1
            end
        ) over(partition by b_q_id) count_blue
    from
        utV v
        join utB b on v.v_id = b.b_v_id
)
select
    v_name
from
    red_blue
where
    count_red > 1
    and count_blue > 0
group by
    v_name