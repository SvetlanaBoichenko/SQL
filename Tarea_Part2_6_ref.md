# Рефлексия зад 6, часть 2
    
 Задача 3.    

    Отличие в запросе  
 'input_material_ids', (   
            SELECT JSON_ARRAYAGG(wm.material_id)   
            FROM workshop_materials wm   
            WHERE wm.workshop_id = w.workshop_id AND wm.is_input = TRUE 
     )    
  
    В моем решении не учтен параметр is_input таблицы WORKSHOP_MATERIALS.  
    Этот параметр, по всей видимости,означает, используются ли материалы или просто хранятся на складе.  

Задача 4.   
    Отличие в запросе   
       'member_ids', (
            SELECT JSON_ARRAYAGG(sm.dwarf_id)
            FROM squad_members sm
            WHERE sm.squad_id = s.squad_id
        ),
        

      В моем решении неправильно задано условие отбора:  Where (s.draft_id = sm.draft_id) - это неверно  
      так как надо выбирать гномов по принципу принадлежности к отряду. В моем условии запрос просто выведет 
      всех гномов 
     Ошибка по невнимательности.  


