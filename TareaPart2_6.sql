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


Задача3.

Select 
  w.workshop_id,
  w.name,
  w.type,
  w.quality,
  
  JSON_OBJECT ( 
  
  'craftsdwarf_ids', (
  Select JSON_ARRAYAGG (w_cr.draft_id)
  From WORKSHOP_CRAFTSWARDERS w_cr
  WHERE w.workshop_id = w_cr.workshop_id
  ), 

  'project_ids', (
  Select JSON_ARRAYAGG (prj.projects_id)
  From PROJECTS
  Where (w.workshop_id = prj.workshop_id)
  ),

 'input_material_ids', (
  Select JSON_ARRAYAGG (w_mt.materials_id)
  From WORKSHOP_MATERIALS w_mt
  Where (w.workshop_id = w_mt.workshop_id)
  ),

  'output_product_ids', (
  Select JSON_ARRAYAGG (w_pr.products_id)
  From WORKSHOP_PRODUCTS w_pr
  Where (w.workshop_id = w_pr.workshop_id)
  )
  
) as related_entities
 
  From
  WORK_SHOP w;


  Задача 4.

    Select
    s.squad_id,
    s.name,
    s.formation_type,
    s.leader_id,
    
   JSON_OBJECT ( 
    Select  JSON_ARRAYAGG (sm.draft_id)
    From SQUAD_MEMBERS sm
    Where (s.draft_id = sm.draft_id)
    ),

    SElect JSON_ARRAYAGG (s_eq_equipment_id)
    From SQUAD_EQUIPNET s_eq
    Where (s_eq.squad_id = s.squad_id)
    ),

    
    
Возвращает информацию о военном отряде, включая идентификаторы всех членов отряда, 
используемого снаряжения, прошлых и текущих операций, тренировок. 
    
    "squad_id": 401,
    "name": "The Axe Lords",
    "formation_type": "Melee",
    "leader_id": 102,
    "related_entities": {
      "member_ids": [102, 104, 105, 107, 110],
      "equipment_ids": [5004, 5005, 5006, 5007, 5008],
      "operation_ids": [601, 602],
      "training_schedule_ids": [901, 902],
      "battle_report_ids": [1101, 1102, 1103]
    }
  }

