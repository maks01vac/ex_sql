-- Найти производителей, у которых больше всего моделей в 
-- таблице Product, а также тех, у которых меньше всего моделей.
-- Вывод: maker, число моделей



WITH count_model AS (
    SELECT
        maker,
        COUNT(model) as count_m
    FROM
        Product
    GROUP BY
        maker
)
SELECT
    maker,
    count_m
FROM
    count_model
WHERE
    count_m = (
        SELECT
            MAX(count_m)
        FROM
            count_model
    )
UNION
SELECT
    maker,
    count_m
FROM
    count_model
WHERE
    count_m = (
        SELECT
            MIN(count_m)
        FROM
            count_model
    )