
1. Найдите все отряды, у которых нет лидера. 
Select name as  SqNoLeader
from Squaqs
where leader_id IS NULL

2. Получите список всех гномов старше 150 лет, у которых профессия "Warrior".
Select name, age
From Dwarves
Where age : 150 and profession = '"Warrior';

3. Найдите гномов, у которых есть хотя бы один предмет типа "weapon".
  Select name, age
 from From Dwarves
 where Dwarves.dwarf_id = Items.owner_id  and Items.type = 'weapon';

  Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| dwarf_id     | INT          | Уникальный идентификатор гнома            |
| name         | VARCHAR(100) | Имя гнома                                 |
| age          | INT          | Возраст гнома                             |
| profession   | VARCHAR(100) | Профессия гнома                           |
| squad_id     | INT          | Идентификатор отряда                      
                                (NULL, если не в отряде)                  |  
                                (ссылка на dwarf_id из таблицы Dwarves)   | 
Таблица Squads
| Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| squad_id     | INT          | Уникальный идентификатор отряда           |
| name         | VARCHAR(100) | Название отряда                           |
| leader_id    | INT          | Идентификатор лидера отряда 
                                (ссылка на dwarf_id из таблицы Dwarves)   |
    
Tasks
| Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| task_id      | INT          | Уникальный идентификатор задачи           |
| description  | TEXT         | Описание задачи                           |
| assigned_to  | INT          | Идентификатор гнома, ответственного за задачу 
                                (NULL, если не назначена)                 |
| status       | VARCHAR(50)  | Статус задачи                             
                        (например, 'pending', 'in_progress', 'completed') |
    
4.  Получите количество задач для каждого гнома, сгруппировав их по статусу.
Select  Dr.name, count (T.task_id)  as TaskCount

   FROM 
       Dwarves Dr
   JOIN 
       Task T
   ON 
       Dr.dwarf_id = T.assigned_to
   GROUP BY 
       Dr.dwarf_id, T.status; 

5. Найдите все задачи, которые были назначены гномам из отряда с именем "Guardians".

Select description as GuardiansTask
From Task 
On 
Task.assigned_to = Dwarves.dwarf_id 
And Dwarves.squad_id = ´Guardians´;


