
WITH Workshop_stats AS (
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
  
SELECT  w1.workshop_id, wp1.product_id,

Case (When (ROUND (FIRST_VALUE (wp1.production_date) OVER ORDER BY (wp1.production_date) -LAST_VALUE (wp1.production_date)) = 0 
     Then 1 End), 2) 
AS  all_product_period

From WORKSHOP_PRODUCTS wp1
WHERE  wp1.production_date IS NOT NULL
),
Work_shop_util AS (
  

