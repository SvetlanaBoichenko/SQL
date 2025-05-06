 
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

Select Squad.name, count (Dwarves.squad_id) as counDwarves
from  Squad    INNER JOIN  Dwarves 
ON Squad.squad_id = Dwarves.squad_id
GROUP BY Dwarves.squad_id, Squad.squad_id 

6. Получить список профессий с наибольшим количеством незавершённых задач 
 ("pending" и "in_progress") у гномов этих профессий.
 
 Select Dwarves.profession  as dwarvesProfession, Tasks.description As taskName,  sum (Tasks.task_id) as maxTasks
 From Dwarves INNER JOIN Tasks
 ON Tasks.status = 'pending' or Tasks.status = 'in_progress'
 GROUP BY  Dwarves.profession, Tasks.description
 Order by sum (Tasks.task_id)

7.


 Таблица Dwarves
| Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| dwarf_id     | INT          | Уникальный идентификатор гнома            |
| name         | VARCHAR(100) | Имя гнома                                 |
| age          | INT          | Возраст гнома                             |
| profession   | VARCHAR(100) | Профессия гнома                           |
| squad_id     | INT          | Идентификатор отряда                      
                                (NULL, если не в отряде) 
Таблица Tasks
| Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| task_id      | INT          | Уникальный идентификатор задачи           |
| description  | VARCHAR(255) | Описание задачи                           |
| priority     | INT          | Приоритет задачи                          |
| assigned_to  | INT          | Идентификатор гнома, ответственного за задачу 
                                (NULL, если не назначена)                 |
| status       | VARCHAR(50)  | Статус задачи                             
                        (например, 'pending', 'in_progress', 'completed') | 
 
