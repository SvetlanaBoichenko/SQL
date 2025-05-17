Задача2.

Select
d.dwaft_id,
d.name,
d.age,
d.profession,
JSON_OBJECT ( 
  
'skill_ids', (
  Select JSON_ARRAYAGG (ds.skills_id)
  From DWARF_SKILLS ds
  WHERE d.dwaft_id = ds.dwaft_id
  ),
  
 'assignment_ids', (
  Select JSON_ARRAYAGG (da.assignment_id)
  From DRAWF_ASSIGMENTS da
  where (d.dwaft_id = da.dwaft_id)
 ), 

  'squad_ids', (
  Select JSON_ARRAYAGG (sq.squard_id)
  From  SQUAD_MEMBERS sq
  where (d.dwaft_id = sq.dwaft_id)
  ),

  'equipment_ids', (
  Select JSON_ARRAYAGG (s_eq.equipment_id)
  From SQUAD_EQUIPMENT s_eq
  Where  (d.dwaft_id = s_eq.dwaft_id)
  )

  ) as related_entities

  From 
  DWARWES d;


  
}

Информация о гноме, включая идентификаторы всех его навыков, текущих назначений,
принадлежности к отрядам и используемого снаряжения.

  [
  {
    "dwarf_id": 101,
    "name": "Urist McMiner",
    "age": 65,
    "profession": "Miner",
    "related_entities": {
      "skill_ids": [1001, 1002, 1003],
      "assignment_ids": [2001, 2002],
      "squad_ids": [401],
      "equipment_ids": [5001, 5002, 5003]
    }
  }
]
