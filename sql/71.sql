SELECT
    p.maker
FROM
    Product p
    left join PC on p.model = pc.model
WHERE
    p.type = 'pc'
GROUP BY
    maker
HAVING
    COUNT(p.model) = COUNT(pc.model)