-- В наборе записей из таблицы PC, отсортированном по столбцу code 
-- (по возрастанию) найти среднее значение цены для каждой шестерки 
-- подряд идущих ПК.
-- Вывод: значение code, которое является первым в наборе из 
-- шести строк, среднее значение цены в наборе.


with numberedPc as (
    select
        code,
        price,
        row_number() over(
            order by
                code ASC
        ) as numb
    from
        pc
)
select
    code,
    (
        select
            avg(price)
        from
            numberedPc
        where
            numb between n.numb
            and n.numb + 5
    ) as avg
from
    numberedPc n
where
    numb <= (
        select
            max(numb) -5
        from
            numberedPc
    )