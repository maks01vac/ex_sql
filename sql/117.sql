-- По таблице Classes для каждой страны найти максимальное значение среди трех выражений:
-- numguns*5000, bore*3000, displacement.
-- Вывод в три столбца:
-- - страна;
-- - максимальное значение;
-- - слово `numguns` - если максимум достигается для numguns*5000, слово `bore` - 
-- если максимум достигается для bore*3000, слово `displacement` - если максимум достигается
--  для displacement.
-- Замечание. Если максимум достигается для нескольких выражений, выводить каждое из них отдельной строкой.






Select
    top 1 with ties country,
    max_val,
    name
from
    classes
    cross apply(
        values
(numguns * 5000, 'numguns'),
(bore * 3000, 'bore'),
(displacement, 'displacement')
    ) V(max_val, name)
group by
    country,
    max_val,
    name
order by
    rank() over(
        partition by country
        order by
            max_val desc
    )