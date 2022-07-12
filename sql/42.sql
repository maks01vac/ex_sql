-- Найдите названия кораблей, потопленных в сражениях, и название сражения, 
-- в котором они были потоплены.

SELECT
    ship,
    name
FROM
    Outcomes
    INNER JOIN Battles ON name = battle
WHERE
    result = 'sunk'