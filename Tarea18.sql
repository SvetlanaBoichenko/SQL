 
1.Получить информацию о всех гномах, которые входят в какой-либо отряд, 
вместе с информацией об их отрядах.
       
SELECT Dwarves.name, Dwarves.age, Dwarves.profession, 
       Squads.name as squadsName, Squads.mission as squadsMision
FROM Dwarves INNER JOIN Squads
ON  Dwarves.squad_id = Squads.squad_id and Dwarves.squad_id IS NOT NULL;

2. 
Найти всех гномов с профессией "miner", которые не состоят ни в одном отряде.
       
select name from Dwarves
where squad_id IS NULL and profession = 'miner'

3.
Получить все задачи с наивысшим приоритетом, которые находятся в статусе "pending".

select description from Tasks 
where priority = 1 and status = 'pending'

4.
Для каждого гнома, который владеет хотя бы одним предметом, 
получить количество предметов, которыми он владеет.
       
SELECT Dwarves.name, Items.name, count(Items.item_id) AS sumItems
from Dwarves INNER JOIN Items On 
       Dwarves.dwarf_id = Items.owner_id and Items.owner_id is not null
group by Dwarves.name, Items.name

5.
Получить список всех отрядов и количество 
гномов в каждом отряде. Также включите в выдачу отряды без гномов.

select Squad.name, count (Dwarves.squad_id) as counDwarves
from  Squad    INNER JOIN  Dwarves 
ON Squad.squad_id = Dwarves.squad_id
GROUP BY Dwarves.squad_id, Squad.squad_id 

6.
