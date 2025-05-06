 
1.    
SELECT Dwarves.name, Dwarves.age, Dwarves.profession, 
       Squads.name as squadsName, Squads.mission as squadsMision
FROM Dwarves INNER JOIN Squads
ON  Dwarves.squad_id = Squads.squad_id and Dwarves.squad_id IS NOT NULL;

2. 
select name from Dwarves
where squad_id IS NULL and profession = 'miner'

3.
select description from Tasks 
where priority = 1 and status = 'pending'

4.
SELECT Dwarves.name, Items.name, count(Items.item_id) AS sumItems
from Dwarves INNER JOIN Items On 
       Dwarves.dwarf_id = Items.owner_id and Items.owner_id is not null
group by Dwarves.name, Items.name

5.
Select Squad.name, count (Dwarves.squad_id) as counDwarves
from  Squad    INNER JOIN  Dwarves 
ON Squad.squad_id = Dwarves.squad_id
GROUP BY Dwarves.squad_id, Squad.squad_id 

6. 
 Select top 3 Dwarves.profession  as dwarvesProfession, Tasks.description As taskName,  sum (Tasks.task_id) as maxTasks
 From Dwarves INNER JOIN Tasks
 ON Tasks.status = 'pending' or Tasks.status = 'in_progress'
 GROUP BY  Dwarves.profession, Tasks.description
 Order by sum (Tasks.task_id)

7.
 Select  Items.type as itmType, avg (Dwarves.age) as dwAvAge
 From Items INNER JOIN Dwarves
 ON Items.owner_id = Dwarves.dwarf_id 
 GROUP BY  Items.type
 
8.
 Select Dwarves.name,Dwarves.age, avg (Dwarves.age)
 from Dwarves join Items 
 on Dwarves.dwarf_id <> Items.owner_id and Items.owner_id = NULL
 group by Dwarves.name,Dwarves.age
 having Dwarves.age > avg (Dwarves.age) 

