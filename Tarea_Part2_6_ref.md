# Рефлексия зад 6, часть 2
    
 Задача 3.    
    
Select    
  w.workshop_id,  
  w.name,  
  w.type,  
  w.quality,  
    
  JSON_OBJECT (     
  'craftsdwarf_ids ', (  
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
 ) As related_entities   
  From  
  WORK_SHOP w;  
    
  
 Эталонное решение.   
 SELECT   
    w.workshop_id,   
    w.name,   
    w.type,   
    w.quality,  
    JSON_OBJECT(   
        'craftsdwarf_ids', (   
            SELECT JSON_ARRAYAGG(wc.dwarf_id)   
            FROM workshop_craftsdwarves wc   
            WHERE wc.workshop_id = w.workshop_id   
        ),   
        'project_ids', (   
            SELECT JSON_ARRAYAGG(p.project_id)   
            FROM projects p   
            WHERE p.workshop_id = w.workshop_id   
        ),   
        'input_material_ids', (   
            SELECT JSON_ARRAYAGG(wm.material_id)   
            FROM workshop_materials wm   
            WHERE wm.workshop_id = w.workshop_id AND wm.is_input = TRUE   
        ),   
        'output_product_ids', (   
            SELECT JSON_ARRAYAGG(wp.product_id)   
            FROM workshop_products wp   
            WHERE wp.workshop_id = w.workshop_id   
        )   
    ) AS related_entities   
FROM    
    workshops w;   



    Отличие в запросе 
 'input_material_ids', (   
            SELECT JSON_ARRAYAGG(wm.material_id)   
            FROM workshop_materials wm   
            WHERE wm.workshop_id = w.workshop_id AND wm.is_input = TRUE 
     )    
  
    В моем решении не учтен параметр is_input таблицы WORKSHOP_MATERIALS.  
    Этот параметр, по всей видимости,означает, используются ли материалы или просто хранятся на складе.  
