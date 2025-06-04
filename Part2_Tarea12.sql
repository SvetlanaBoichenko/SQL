WITH SQUAD_ACTIVITY AS
(
SELECT ms.squad_id,
      ms.name as squad_name, 
      ms.formation_type,
 
COUNT (DISTINCT sqb.squad_id) AS total_battles -- проверить NULL и неповторене

SUM (CASE WHEN sqb.outcome = TRUE THEN 1 else 0) as victories,
SUM (sqb.casualties) AS casualty_rate,
SUM (sqb.enemy_casualties) AS casualty_enemy_rate,

COUNT (DISTINCT CASE WHEN(smq.join_date IS NOT NULL AND smq.exit_date IS NULL)THEN smq.dwart_id END) AS current_members,

COUNT(DISTINCT CASE WHEN smq.join_date IS NOT NULL THEN smq.dwart_id END) AS total_members_ever,

AVG (dqe.quality::INTEGER) AS average_equipment_quality,
SUM (sqt.duration_hours) AS total_training_session,
AVG (sqt.effectiveness) AS avg_training_effectiveness,
 
From MILITARY_SQUADS ms

LEFT JOIN SQUAD_BATTLES sqb ON  sqb.squad_id = ms.squad_id
LEFT JOIN SQUAD_MEMBERS sqm ON sqm.squad_id = ms.squad_id 
LEFT JOIN DWARV_EQUIPMENT dqe ON dqe.equipment_id = sqe.equipment_id AND sqe.squad_id = ms.squad_id
LEFT JOIN SQUAD_TRAINING sqt ON sqt.squad_id = ms.squad_id
), SQ_LIADERS AS 
(   
  Select  
   ms1.squad_id
   dw.name as leader_name,
  
  FROM MILITARY_SQUADS ms1
  JOIN  SQUAD_MEMBERS sqm1 ON sqm1.squad_id = ms1.squad_id 
  JOIN  DWARVES dw ON dw.dwart_id = ms1.leader_id
  
  Group by ms1.squad_id,   dw.name 
), SQ_EFFECTIVE AS
(
 Select ms2.squad_id

  ROUND ((SA.victories::DECIMAL/NULLIF(SA.total_battles,0))*100,2) AS victory_percentage 
  ROUND ((SA.current_members::DECIMAL/ NULLIF(SA.total_members_ever,0))*100, 2) AS retention_rate 
  CORR (SA.avg_training_effectiveness, victory_percentage) AS training_battle_correlation,

  From  MILITARY_SQUADS ms2
  JOIN  SQUAD_ACTIVITY SA ON SA.squad_id = ms2.squad_id
  Group by ms2.squad_id
),




