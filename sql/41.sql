-- Для каждого производителя, у которого присутствуют модели 
-- хотя бы в одной из таблиц PC, Laptop или Printer,
-- определить максимальную цену на его продукцию.
-- Вывод: имя производителя, если среди цен на продукцию данного 
-- производителя присутствует NULL, то выводить для этого производителя NULL,
-- иначе максимальную цену.




WITH t1 AS (
    SELECT
        DISTINCT a.maker,
        b.model,
        b.price
    FROM
        product a
        JOIN laptop b ON a.model = b.model
    UNION
    SELECT
        DISTINCT c.maker,
        d.model,
        d.price
    FROM
        product c
        JOIN pc d ON c.model = d.model
    UNION
    SELECT
        DISTINCT ab.maker,
        ba.model,
        ba.price
    FROM
        product ab
        JOIN printer ba ON ab.model = ba.model
)
SELECT
    DISTINCT maker,
    CASE
        WHEN maker IN (
            SELECT
                DISTINCT maker
            FROM
                t1
            WHERE
                price IS NULL
        ) THEN NULL
        ELSE MAX(price)
    END price
FROM
    t1
GROUP BY
    maker