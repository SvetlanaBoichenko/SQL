
WITH 
Workshop_stats AS (
 SELECT w.workshop_id, w.workshop_name, w.workshop_type, 

 COUNT(wcd.dwarf_id) AS num_craftsdwarves, 

 SUM (CASE WHEN wp.quantity = NULL THEN 0 END) AS total_quantity_produced, 

 SUM (pr.value CASE WHEN pr.value = NULL THEN 0 END) as total_production_value,
 
 SUM (pr.quantity) as all_product_quantity,
    
 SUM (wm.quantity) as qnt_m1 
 SUM (pr1.value CASE WHEN pr1.value = NULL THEN 0 END) as sum_m1, 
  
 FROM WORKSHOP w

 LEFT JOIN WORKSHOP_CRAFTSDWARVES wcd ON w.workshop_id = wcd.workshop_id
  
 LEFT JOIN WORKSHOP_PRODUCTS wp ON w.workshop_id = wp.workshop_id
  
 LEFT JOIN PRODUCTS pr ON pr.product_id = wp.product_id and wp.workshop_id = w.workshop_id

 LEFT JOIN  WORKSHOP_MATERIALS wm ON pr1.materials_id = wm.materials_id AND wm.workshop_id = w.workshop_id
  
 LEFT JOIN PRODUCTS pr1 ON pr1.materials_id = wm.materials_id and wm.workshop_id = w.workshop_id
  
 GROUP BY w.workshop_id, w.workshop_name, w.workshop_type), 
 ), 
 
Production_period AS ( 
 SELECT w1.workshop_id, wp1.product_id,

 Case (When  (FIRST_VALUE (wp1.production_date) OVER ORDER BY (wp1.production_date) -LAST_VALUE (wp1.production_date)) = 0 
     Then 1 End), 2) 
 AS  all_product_period

 From WORKSHOP_PRODUCTS wp1, WORKSHOP w1
 WHERE  wp1.production_date IS NOT NULL and wp1.workshop_id = w1.workshop_id
 ),

Work_shop_util AS (
 SELECT w2.workshop_id 
 ROUND( (Production_period::DECIMAL) / Case (When (SUM ((LAG (wp2.production_date, 1, 0) OVER ORDER BY (wp2.production_date)) = 0 
 then 1 End)*100 ,2) AS workshop_utilization_percent
 
 From WORKSHOP w2
 JOIN WORKSHO_PRODUCTS wp2
 where w2.workshop_id = wp2.workshop_id
 ),

Material_conversion AS (
 pr.project_id, w3.workshop_id, wm2.materials_id
 
 ROUND (SUM (pm.quantity_required::DECIMAL) / Ws3.total_quantity_produced::DECIMAL), 2) AS material_conversion_ratio,

 join Workshop_stats ws3 ON Ws3.worksop_id = w3.worksop_id
 join PROJECTS_MATERIALS pm ON pm.materials_id = wm2.materials_id

 From WORKSHOP w3, WORKSHOP_MATERIALS wm2
 where w3.worksop_id = wm2.worksop_id
 ),

Dward_skill AS (
 dw_sk.skill_id, dw_sk.dwarf_id, w4.workshop_id

 AVG (dw_sk.level) AS average_craftsdwarf_skill
 
 FROM DWARF_SKILLS dw_sk, WORKSHOP w4
 join WORKSHOP_CRAFTSDWARVES wcd2 ON wcd2.dwarf_id = dw_sk.dwarf_id AND w4.workshop_id =  wcd2.workshop_id
 ),

Skill_corr AS (
 
 Ds.skill_id
 ROUND (Sum (pr3.quality)/ Ds.average_craftsdwarf_skill),2) AS skill_quality_correlation
 FROM  Dward_skill.Ds
 join Products pr3 ON  pr3.workshop_id = Ds.workshop_id
 ),

SELECT 
WS.workshop_id, 
WS.workshop_name, 
WS.workshop_type,
WS.num_craftsdwarves,
WS.total_quantity_produced,
WS.total_production_value,

ROUND((PRP.all_product_period/WS.total_quantity_produced),2) AS daily_production_rate,

ROUND((WS.sum_m1/WS. qnt_m1),2) AS value_per_material_unit,
 


 

From Workshop_stats WS
join  Production_period PRP ON WS.workshop_id = PRP.workshop_id

 
