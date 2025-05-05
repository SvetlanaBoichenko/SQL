
1.Получить информацию о всех гномах, которые входят в какой-либо отряд, 
вместе с информацией об их отрядах.
       
SELECT Dwarves.name, Dwarves.age, Dwarves.profession, 
       Squads.name as squadsName, Squads.mission as squadsMision
FROM Dwarves INNER JOIN Squads
ON  Dwarves.squad_id = Squads.squad_id and Dwarves.squad_id IS NOT NULL;

2. 
Найти всех гномов с профессией "miner", которые не состоят ни в одном отряде.
       
select name from Dwarves
where Dwarves.squad_id IS NULL and Dwarves.name = 'miner'

3.
Получить все задачи с наивысшим приоритетом, которые находятся в статусе "pending".


