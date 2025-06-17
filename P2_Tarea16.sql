
Историю всех атак существ и их исходов

With creature_statiscic AS (
 Select cr.creature_id, 
        cr.type AS creature_type,                             -- Goblin  
        SUM (cr.threat_level) AS threat_level,                --Or Sum
        MAX(cr.last_sighting_date) AS last_sighting_date,     -- Последняя дата наблюдения
        SUM (cr.estimate_population) AS estimated_numbers
        ct.distance_to_fortress AS territory_proximity

  From Creatures cr
  Left join Creature_Territories ct ON  cr.creature_id = ct.creature_id AND  ct.danger_leve = cr.threat_level  
  Where cr.active = true
  Order By cr.type, cr.creature_id
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
 ), 
 
 defence_data AS (
 ca.defense_structures_used AS defense_type, 
 RAUND ((SUM(Case when ca.outcome = true then 1))/SUM(Case when ca.outcome = false then 1))*100, 2)
 AS effectiveness_rate,
 AVG (ca.enemi_casualtied) AS avg_enemy_casualties

 From creature_attacs ca
 ), 
 

 
 SUM (cr.thread_level) AS current_threat_level
  
total_recorded_attacks": 183,
  "unique_attackers": 42,
  "overall_defense_success_rate": 76.50,
  "security_analysis": {
    "threat_assessment": {
      "current_threat_level": "Moderate",
      "active_threats": [
        {
          "creature_type": "Goblin",
          "threat_level": 3,
          "last_sighting_date": "0205-08-12",
          "territory_proximity": 1.2,
          "estimated_numbers": 35,
          "creature_ids": [124, 126, 128, 132, 136]
        },
    },
