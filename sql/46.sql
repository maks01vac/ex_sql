-- Для каждого корабля, участвовавшего в сражении при 
-- Гвадалканале (Guadalcanal), вывести название, водоизмещение и 
-- число орудий.

SELECT DISTINCT
  ship, displacement, numGuns
FROM 
  (SELECT
    ship
  FROM
    Outcomes
  WHERE
    battle='Guadalcanal') o 
LEFT JOIN 
  Ships s 
ON 
  o.ship=s.name 
LEFT JOIN
  Classes c
ON 
  s.class=c.class OR o.ship=c.class