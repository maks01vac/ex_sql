-- Вывести все строки из таблицы Product, 
-- кроме трех строк с наименьшими номерами моделей и 
-- трех строк с наибольшими номерами моделей.


WITH md AS (
    SELECT
        TOP 3 model
    FROM
        Product
    ORDER BY
        model ASC
    UNION
    SELECT
        TOP 3 model
    FROM
        Product
    ORDER BY
        model DESC
)
SELECT
    maker,
    model,
    type
FROM
    Product
WHERE
    model NOT IN (
        SELECT
            model
        FROM
            md
    )