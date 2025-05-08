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
