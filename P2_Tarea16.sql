
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

 ) location_data AS (
 Select lc.location_id,
 lc.zone_id AS zone_id,
 lc.name AS zone_name,
 lc.fortification_level AS fortification_level,
 mcz.response_time AS military_response_time,
 
 
 
"zone_id": 15,
"zone_name": "Eastern Gate",
"vulnerability_score": 0.68,
"historical_breaches": 8,
"fortification_level": 2,
"military_response_time": 48,
"defense_coverage": {
"structure_ids": [182, 183, 184],
"squad_ids": [401,
        
 
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
