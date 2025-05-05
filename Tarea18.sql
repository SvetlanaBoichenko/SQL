
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
       
SELECT Dwarves.name, count(Items.item_id) AS sumItems
from Dwarves,Items
where Items.owner_id = Dwarves.dwarf_id
       
       
5.
Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| dwarf_id     | INT          | Уникальный идентификатор гнома            |
| name         | VARCHAR(100) | Имя гнома                                 |
| age          | INT          | Возраст гнома                             |
| profession   | VARCHAR(100) | Профессия гнома                           |
| squad_id     | INT          | Идентификатор отряда                      
                                (NULL, если не в отряде)  

Select Squad.name 
where Squad.squad_id = 
Select ( Dwarves.squad_id,  sum (dwarf_id) )
