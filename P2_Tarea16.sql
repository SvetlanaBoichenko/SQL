
With creature_statiscic AS (
 Select cr.creature_id AS creature_id, 
        cr.type AS creature_type,                             -- Goblin  
        SUM (cr.threat_level) AS threat_level,                --Or Sum
        MAX(cr.last_sighting_date) AS last_sighting_date,     -- Последняя дата наблюдения
        SUM (cr.estimate_population) AS estimated_numbers
        ct.distance_to_fortress AS territory_proximity

  From Creatures cr
  Left join Creature_Territories ct ON  cr.creature_id = ct.creature_id AND  ct.danger_leve = cr.threat_level  
  Where cr.active = true
  group By cr.type, cr.creature_id
 ),
 
 zona_data AS (
 Select lc.location_id,
 lc.zone_id AS zone_id,
 lc.name AS zone_name,
 lc.fortification_level AS fortification_level,
 lc.wall_integrity AS historical_breaches,
 ca.military_response_time_minutes AS military_response_time,

(lc.fortification_level*0.6 + lc.trap_density*0.2 - lc.wall_integrity_0.2) AS vulnerability_score
 
 From  Locations lc
 left join Creature_Attacks ca ON ca location_id = lc.location_id
 group by lc.location_id,lc.zone_id
 ), 
 
 defence_data AS (
 ca.atacks_id,
 ca.defense_structures_used AS defense_type, 
 RAUND ((SUM(Case when ca.outcome = true then 1))/SUM(Case when ca.outcome = false then 1))*100, 2)
 AS effectiveness_rate,
 AVG (ca.enemi_casualtied) AS avg_enemy_casualties

 From creature_attacs ca
 group by ca.atacks_id, ca.defense_structures_used
 
 ), squad_data AS (
  
 Select sq.squad_id AS squad_id,
        sq.name AS squad_name,
        SUM (sm.dwart_id) where sm.exit_reason = NULL,
        AVG (ds.level) AS avg_combat_skill,
        ROUND (SUM (CASE WHEN sb.outcom = 'win' THEN 1) / 
            COALESQUE (SUM(CASE WHEN sb.outcom = 'loose' THEN 1), 1 ), 2 ) 
           AS combat_effectiveness;
        

 From Military_Squads sq
 Left join Squad_Members sm ON sm.squad_id = sq.squad_id,
 left join Dwarf_Skills ds ON sm.squad_id = sq.squad_id AND sm.dwarf_id = ds.dwarf_id
 left join Squad_Battles sb ON sb.squad_id = sq.squad_id
 group by sq.squad_id, sq.name
), 
  defence_data AS (

  ca.atacs_id,
  EXTRACT(YEAR FROM ca.date) AS year,
  count (ca.atack_id) as total_attacks,
  count (ca.casualities) as casualities,
  ROUND (SUM (CASE WHEN ca.outcom = 'win' THEN 1) / 
        COALESQUE (SUM(CASE WHEN ca.outcom = 'loose' THEN 1), 1 ), 2 ) 
        AS "defense_success_rate"
  from creature_attacs ca
  group by ca.attacs_id,
  order by year 
  ), 
Select   
 (Select(count ( ca.atacs_id) FROM CreatureAttacs AS total_recorded_attacks),
 (Select(count (DISTINCT ca.creature_id) FROM CreatureAttacs AS total_recorded_attacks), 
 (Select ROUND (SUM (CASE WHEN ca.outcom = 'win' THEN 1) / 
        COALESQUE (SUM(CASE WHEN ca.outcom = 'loose' THEN 1), 1 ), 2 ) AS overall_defense_success_rate,

  SELECT 
JSON_OBJECT( 
 'security_analysis' (
  JSON_OBJECT 'threat_assessment'(
              'current_threat_level', cs.threat_level
               Select JSON_ARRAYAGG 
                    'active_threats'( 
                     JSON_OBJECT (
                     'creature_type', cs.creature_type,
                      'last_sighting_date', cs.last_sighting_date,
                      'estimated_numbers', cs.estimated_numbers,
                      'creature_ids',(
                      Select JSON_ARRAYAGG (DISTINCT cr.creature_id)
                             From Creatures cr
                             where cr.creature_id = cs.creature_id),
                       ),
                       'vulnerability_analysis' (
                       JSON_OBJECT ( 
                       'zone_id', zd.zone_id,
                       'historical_breaches', zd.historical_breaches,
                       'fortification_level', zd.fortification_level,
                       'military_response_time', zd.military_response_time,
                       'defense_coverage', 
                            JSON_OBJECT (
                             Select JSON_ARRAYAGG (DISTINCT str.structure_id)
                             From Creatures cr
                             where cr.creature_id = cs.creature_id), 
  
        "defense_coverage": {
          "structure_ids": [182, 183, 184],
          "squad_ids": [401, 405]
        }  lc.zone_id AS zone_id,
 lc.name AS zone_name,
 lc.fortification_level AS fortification_level,
 lc.wall_integrity AS historical_breaches,
 ca.military_response_time_minutes AS military_response_time,
      }





  
  

  
  
  
  "security_analysis": {
    "threat_assessment": {
      "current_threat_level": "Moderate",
      "active_threats": [
        {
          "creature_type": "Goblin",


JSON_ARRAYAGG(







  
  

