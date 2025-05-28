
WITH workshop_stats AS (
SELECT w.workshop_id, w.workshop_name, w.workshop_type, COUNT(wcd.dwarf_id) 
AS num_craftsdwarves, 

SUM (CASE WHEN wp.quantity = NULL THEN 0 END)
AS total_quantity_produced, 

SUM (pr.value) as total_production_value
  
COALESCE (SUM(ea.value), 0) AS artifacts_value, COUNT(DISTINCT es.site_id) 
AS discovered_sites, 

SUM(CASE WHEN ec.outcome = 'Favorable' THEN 1 ELSE 0 END) 
AS favorable_encounters, 

COUNT(ec.creature_id) 
AS total_encounters, 

e.departure_date, 
e.return_date 
FROM expeditions e 
  
LEFT JOIN WORKSHOP_CRAFTSDWARVES wcd ON w.workshop_id = wcd.workshop_id,
  
LEFT JOIN WORKSHOP_PRODUCTS wp ON w.workshop_id = wp.workshop_id,
  
LEFT JOIN PRODUCTS es ON p.product_id = wp.product_id and wp.workshop_id = w.workshop_id,
  
  
LEFT JOIN expedition_creatures ec ON e.expedition_id = ec.expedition_id 
  
GROUP BY e.expedition_id, e.destination, e.status, e.departure_date, e.return_date),
