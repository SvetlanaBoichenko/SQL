Select  name, age, profession from Dwarves
name, mission from Squads
where  Dwarves.squad_id = Squads.squad_id and Dwarves.squad_id IS NOT NULL;


