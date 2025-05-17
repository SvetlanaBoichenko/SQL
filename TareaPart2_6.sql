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


  

