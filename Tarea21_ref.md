
    1.Найдите все отряды, у которых нет лидера
Select name as  SqNoLeader  
from Squaqs  
where leader_id IS NULL  
  
Эталонное:  
SELECT *  
        FROM Squads
        WHERE leader_id IS NULL;

Вывела не все поля.
  
2. Получите список всех гномов старше 150 лет, у которых профессия "Warrior".  
Select name, age    
From Dwarves   
Where age : 150 and profession = '"Warrior';
  
Эталонное:  
SELECT *   
    FROM Dwarves  
    WHERE age > 150 AND profession = 'Warrior';  

    
Вывела не все поля.


3.  Найдите гномов, у которых есть хотя бы один предмет типа "weapon".  
  Select name, age  
     from From Dwarves  
 where Dwarves.dwarf_id = Items.owner_id  and Items.type = 'weapon';  
  
Эталонное:  
SELECT DISTINCT D.*  
        FROM Dwarves D  
        JOIN Items I ON D.dwarf_id = I.owner_id  
        WHERE I.type = 'weapon';  

Подумала, что надо только данные имена гномов.
Да, надо было вывести как минимум еще и имя предмета. Ане только гнома.

    
4. Получите количество задач для каждого гнома, сгруппировав их по статусу.  
    
   Select  Dr.name, count (T.task_id)  as TaskCount
   FROM   
       Dwarves Dr  
   JOIN   
       Task T  
   ON   
       Dr.dwarf_id = T.assigned_to  
   GROUP BY   
       Dr.dwarf_id, T.status;  


Эталонное: 
    SELECT assigned_to, status, COUNT(*) AS task_count
    FROM Tasks
    GROUP BY assigned_to, status;

   Не сработает группировка по статусу, если не вывести поле, ошибка.
   Можно было вывести ID гномов из этой же, а не имена из другой таблицы. которую надо присоединять.

   

5. Найдите все задачи, которые были назначены гномам из отряда с именем "Guardians".  
  
Select D.description as GuardiansTask  
    From Task T, Dwarves D  
Where   
    T.assigned_to = D.dwarf_id   
And D.squad_id = ´Guardians´;  
   
SELECT T.*  
        FROM Tasks T  
        JOIN Dwarves D ON T.assigned_to = D.dwarf_id  
        JOIN Squads S ON D.squad_id = S.squad_id  
        WHERE S.name = 'Guardians';  

D.description - надо было T.description  
  
Не учла имена гномов, а только отряды, отсюда обращение только к двум таблицам.  
надо было делать join и выводить всю информацию о задачах т гномах,  
а непросто - имя задачи.  
  
6. Выведите всех гномов и их ближайших родственников, указав тип родственных отношений.  
   
Select D.name,  R.relashionShip, D2.name   
    from Dwarves D, Relationships R, Dwarves D2  
IN D2.name = (Select name from Dwarves,Relationships   
              where Dwarves.dwarf_id = Relationships.related_to )   
    and R.dwarf_id = D.dwarf_id    
    and (Rrelationship = 'Родитель' or Rrelationship = 'Супруг);  
  
  
Эталонное:   
SELECT D1.name AS dwarf_name, D2.name AS relative_name, R.relationship
        FROM Relationships R  
        JOIN Dwarves D1 ON R.dwarf_id = D1.dwarf_id  
        JOIN Dwarves D2 ON R.related_to = D2.dwarf_id;  

Надо было делать через  join
    
