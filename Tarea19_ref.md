# Рефлексия к заданию 18
Эталонное решение.  
 SELECT  
       D.name AS DwarfName,  
       D.profession AS Profession,  
       S.name AS SquadName,  
       S.mission AS Mission  
   FROM   
       Dwarves D  
   JOIN    
       Squads S    
   ON  
       D.squad_id = S.squad_id;   
  
Мое решение:      
SELECT Dwarves.name, Dwarves.age, Dwarves.profession,   
       Squads.name as squadsName, Squads.mission as squadsMision  
FROM Dwarves INNER JOIN Squads  
ON  Dwarves.squad_id = Squads.squad_id and Dwarves.squad_id IS NOT NULL;  

В общем и целом верно. Вывела некоторые лишние поля. Условие IS NOT NULL - было не обязательным,   
так как ключевое поле первичного ключа не может быть нулевым.  
  
 2.  
    Эталонное решение.  
 SELECT  
       name,  
       age  
   FROM   
       Dwarves  
   WHERE   
       profession = 'miner' AND squad_id IS NULL;  

Мое решение:   
Select name from Dwarves  
where squad_id IS NULL and profession = 'miner'  

 Верно,  но не вывела возраст. Возможно есть гномы с одинаковым именем и разным возрастом.  
 Тогда выведение возраста в первом задании оправдано.
   
3.  Получить все задачи с наивысшим приоритетом, которые находятся в статусе "pending".  
Эталонное решение.   
 SELECT 
       task_id,
       description,
       assigned_to
   FROM 
       Tasks
   WHERE 
       priority = (SELECT MAX(priority) FROM Tasks WHERE status = 'pending') 
       AND status = 'pending';


Мое решение:    
Select description from Tasks   
where priority = 1 and status = 'pending'  
  
Запуталась, конечно, надо было найти сначала максимум из приоритетов, в затем вывести   
информацию о задаче. Я выбрала только описание задачи для запроса, как минимум надо было   
и ответственного за выполнение тоже запросить.  
  


4. Для каждого гнома, который владеет хотя бы одним предметом, получить количество предметов, которыми он владеет.
      
Эталонное решение:  
SELECT   
       D.name AS DwarfName,  
       D.profession AS Profession,  
       COUNT(I.item_id) AS ItemCount  
   FROM   
       Dwarves D  
   JOIN   
       Items I  
   ON   
       D.dwarf_id = I.owner_id  
   GROUP BY   
       D.dwarf_id, D.name, D.profession;  
  
Мое решение:  
SELECT Dwarves.name, Items.name, count(Items.item_id) AS sumItems
From   
Dwarves INNER JOIN Items   
On  
     Dwarves.dwarf_id = Items.owner_id and Items.owner_id is not null  
group by   
  Dwarves.name, Items.name

1) Надо было дать название полям.  
2) Лишняя проверка на нулевой ID в поле owner_id.   
   при сравнении с полем первичного ключа таблицы Dwarvers.   
3) Нет группировки по полю Dwarvers.dwarf_id.  
4) Не выведено поле Dwarvers.profession. 
5) Более компактный выд записи в эталонном решении.  


5.  
SELECT 
       S.squad_id,  
       S.name AS SquadName,  
       COUNT(D.dwarf_id) AS NumberOfDwarves  
   FROM    
       Squads S   
   LEFT JOIN   
       Dwarves D   
   ON   
       S.squad_id = D.squad_id   
   GROUP BY   
       S.squad_id, S.name;   
  
Мое решение:     
Select   
  Squad.name, count (Dwarves.squad_id) as counDwarves   
from  Squad    
  INNER JOIN  Dwarves   
ON    
  Squad.squad_id = Dwarves.squad_id     
GROUP BY   
  Dwarves.squad_id, Squad.squad_id   
  
1) Неправильная группировка    
Сначала надо было по ID  а потом пame таблицы Squad   
2)  В эталонном решении поле имена гномов будут слева  LEFT JOIN   

6.  
 SELECT   
       D.profession,  
       COUNT(T.task_id) AS UnfinishedTasksCount  
   FROM   
       Dwarves D  
   JOIN  
       Tasks T  
   ON   
       D.dwarf_id = T.assigned_to  
   WHERE   
       T.status IN ('pending', 'in_progress')  
   GROUP BY  
       D.profession  
   ORDER BY  
       UnfinishedTasksCount DESC;  
  
 Мое решение:   
 Select top 3   
 Dwarves.profession as dwarvesProfession, Tasks.description As taskName, sum (Tasks.task_id) as maxTasks    
 From    
  Dwarves    
 INNER JOIN Tasks   
 ON  
 Tasks.status = 'pending' or Tasks.status = 'in_progress'  
 GROUP BY    
   Dwarves.profession, Tasks.description   
 Order by  
 sum (Tasks.task_id)   
  
1) Вывела лишнее поле - описание задачи Tasks.description  
2) Вместо sum -надо было использовать count, для подстчета количества записей,  
   а не содержимого записей  
3) Не сделала связку по id при соединении таблиц - грубая ошибка.
   не заметила
4) не надо было использовать top 3, а просто упорядосить по убыванию.

7.  
SELECT 
       I.type AS ItemType,
       AVG(D.age) AS AverageAge
   FROM 
       Items I
   JOIN 
       Dwarves D
   ON 
       I.owner_id = D.dwarf_id
   GROUP BY 
       I.type;


Мое решение:  
 Select   
   Items.type as itmType, avg (Dwarves.age) as dwAvAge  
 From   
   Items   
 INNER JOIN Dwarves  
 ON   
   Items.owner_id = Dwarves.dwarf_id   
 GROUP BY    
   Items.type   

 В общем,верно. Эталонное решение более компактно 
 
8.   
 SELECT   
       D.name,
       D.age,
       D.profession
   FROM 
       Dwarves D
   WHERE 
       D.age > (SELECT AVG(age) FROM Dwarves)
       AND D.dwarf_id NOT IN (SELECT owner_id FROM Items);
 
 Мoе решение:   
 Select  
   Dwarves.name,Dwarves.age, avg (Dwarves.age)  
 from  
  Dwarves join Items  
 On   
   Dwarves.dwarf_id <> Items.owner_id and Items.owner_id = NULL  
 Group by   
   Dwarves.name,Dwarves.age  
 having   
   Dwarves.age > avg (Dwarves.age)   

 
Отличия в логике.
Можно да, использовать вложенный запрос. 


