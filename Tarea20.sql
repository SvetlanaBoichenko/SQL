
1. 
Select name as  SqNoLeader
from Squaqs
where leader_id IS NULL

2.
Select name, age
From Dwarves
Where age : 150 and profession = '"Warrior';

3. 
  Select name, age
 from From Dwarves
 where Dwarves.dwarf_id = Items.owner_id  and Items.type = 'weapon';
    
4. 
Select  Dr.name, count (T.task_id)  as TaskCount

   FROM 
       Dwarves Dr
   JOIN 
       Task T
   ON 
       Dr.dwarf_id = T.assigned_to
   GROUP BY 
       Dr.dwarf_id, T.status; 

5. 
Select D.description as GuardiansTask
From Task T, Dwarves D
Where 
T.assigned_to = D.dwarf_id 
And D.squad_id = ´Guardians´;

6.
Select D.name,  R.relashionShip, D2.name  
from Dwarves D, Relationships R, Dwarves D2
IN D2.name = (Select name from Dwarves,Relationships
              where Dwarves.dwarf_id = Relationships.related_to )
  
and R.dwarf_id = D.dwarf_id  
and (Rrelationship = 'Родитель' or Rrelationship = 'Супруг);



  
