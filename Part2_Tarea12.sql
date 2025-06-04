WITH SQUAD_ACTIVITY AS
(
SELECT ms.squad_id,
      ms.name as squad_name, 
      ms.formation_type,
 
COUNT (DISTINCT sqb.squad_id) AS total_battles,

SUM (CASE WHEN sqb.outcome = TRUE THEN 1 else 0) AS victories,
SUM (sqb.casualties)       AS casualty_rate,
SUM (sqb.enemy_casualties) AS casualty_enemy_rate,

COUNT (DISTINCT CASE WHEN(smq.join_date IS NOT NULL AND smq.exit_date IS NULL)THEN smq.dwart_id END) 
      AS current_members,
COUNT(DISTINCT CASE WHEN smq.join_date IS NOT NULL THEN smq.dwart_id END) 
      AS total_members_ever,

AVG (dqe.quality::INTEGER) AS average_equipment_quality,
SUM (sqt.duration_hours) AS total_training_session,
AVG (sqt.effectiveness) AS avg_training_effectiveness,
 
From MILITARY_SQUADS ms

LEFT JOIN SQUAD_BATTLES sqb ON  sqb.squad_id = ms.squad_id
LEFT JOIN SQUAD_MEMBERS sqm ON sqm.squad_id = ms.squad_id 
LEFT JOIN DWARV_EQUIPMENT dqe ON dqe.equipment_id = sqe.equipment_id AND sqe.squad_id = ms.squad_id
LEFT JOIN SQUAD_TRAINING sqt ON sqt.squad_id = ms.squad_id
), 
SQ_LEADERS AS 
(   
  Select  
   ms1.squad_id
   dw.name as leader_name,
  
  FROM MILITARY_SQUADS ms1
  JOIN  SQUAD_MEMBERS sqm1 ON sqm1.squad_id = ms1.squad_id 
  JOIN  DWARVES dw ON dw.dwart_id = ms1.leader_id
  
  Group by ms1.squad_id,   dw.name 
), 
SQ_EFFECTIVE AS
(
 Select 
  ms2.squad_id

  ROUND ((SA.victories::DECIMAL/NULLIF(SA.total_battles,0))*100,2) AS victory_percentage 
  ROUND ((SA.current_members::DECIMAL/ NULLIF(SA.total_members_ever,0))*100, 2) AS retention_rate 
  ROUND ((SA.casualty_rate::DECIMAL/ NULLIF(SA.casualty_enemy_rate, 0))*100, 2) AS casualty_exchange_ratio
  CORR (SA.avg_training_effectiveness, victory_percentage) AS training_battle_correlation,

  From  MILITARY_SQUADS ms2
  JOIN  SQUAD_ACTIVITY SA ON SA.squad_id = ms2.squad_id
  Group by ms2.squad_id
), 

C_SKILLS_PROGRESS AS
(
SELECT
sm.squard_id, 
      
AVG ( COALESCE(ds_after.level,0)-COALESCE(ds_before.level,0) )
AS avg_combat_skill_improvement

FROM squad_members sm
JOIN dwarves d ON sm.dwarf_id = d.dwarf_id
JOIN dwarf_skills ds_before ON d.dwarf_id = ds_before.dwarf_id
JOIN dwarf_skills ds_after ON d.dwarf_id = ds_after.dwarf_id AND ds_before.skill_id = ds_after.skill_id
JOIN skills s ON ds_before.skill_id = s.skill_id AND ds_after.skill_id = s.skill_id
      WHERE s.category='BATTLES'
JOIN squad_operation so ON so.squad_id = sm.squad_id
WHERE ds_before.date < so.start_date AND ds_after.date > so.end_date
GROUP BY sm.squad_id
)
      
Select (
      SA.squad_id,
      SA.squad_name,
      SA.formation_type,
      SL.leaders_name,
      SA.total_battles,
      SA.victories,
      SF.victory_percentage ,
      SA.casualty_rate,
      SF.casualty_exchange_ratio,
      SA.current_members,
      SA.total_members_ever,
      SF.retention_rate,
      SA.average_equipment_quality,
      SA.total_training_sessions.
      SA.avg_training_effectiveness,
      SF.training_battle_correlation,
      SCP.avg_combat_skill_improvement.      
      
      ROUND( (SA.victory_percentage)*0.35 +
      + (SA.retention_rate)*0.15  
      +(SA.avg_training_effectiveness  *0.15)
      +(avg_combat_skill_improvement * 0.20)
      AS overall_effectiveness_score,
)

JSON_OBJECT(
'member_ids', (SELECT JSON_ARRAYAGG (smem.dwarf_id)
FROM squad_members smem 
WHERE smem.squad_id = SA.expedition_id ),


      
FROM  SQUAD_ACTIVITY SA
LEFT JOIN SQ_LEADERS SL ON  SL.squad_id = SA.squad_id
LEFT JOIN SQ_EFFECTIVE SF ON SF.squad_id = SA.squad_id
LEFT JOIN C_SKILLS_PROGRESS SCP ON  SCP.squad_id = SA.squad_id
GROUP BY overall_effectiveness_score DESC
