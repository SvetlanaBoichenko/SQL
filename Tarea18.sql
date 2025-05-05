
1.
SELECT Dwarves.name, Dwarves.age, Dwarves.profession, 
       Squads.name as squadsName, Squads.mission as squadsMision
FROM Dwarves INNER JOIN Squads
ON  Dwarves.squad_id = Squads.squad_id and Dwarves.squad_id IS NOT NULL;

2. 

