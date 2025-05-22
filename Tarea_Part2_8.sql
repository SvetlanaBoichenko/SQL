
Select exp.expedition_id, exp.destination, exp.status,
  
(Select count(em1.survived) From EXPEDITION_MEMBERS em1, EXPEDITION ex1
  where em1.survived = true and em1.expedition_id = ex1.expedition_id) / 

(Select count (em2.survived) From EXPEDITION_MEMBERS em2,EXPEDITION ex2
  where em2.expedition_id = ex2.expedition_id)  *100
as survival_rate, 
  
(Select sum (ea.value) from EXPEDITION_ARTIFACTS ea,EXPEDITION ex3
  where ea.expedition_id = ex3.expedition_id)   
as artifacts_value,

(Select sum (es.site_id) from EXPEDITION_SITES eS,EXPEDITION ex4
  where es.expedition_id = ex4.expedition_id and es.site_id not is null) 
as discovered_sites,

(Select count (ec.outcome) From EXPEDITION_CREATURES ec,EXPEDITION ex5
  where ec.expedition_id = ex5.expedition_id and caoutcomed = 'GOOD' )/
(Select count (ca1.outcomed) From From EXPEDITION_CREATURES ec1,EXPEDITION ex6
  where ec1.expedition_id = ex6.expedition_id)
as encounter_success_rate,

(Select count (dr_s.skills_id) FROM DRAFT_SKILLS dr_s,EXPEDITION_MEMBERS em, EXPEDITION ex7  
  where dr_s.dwarf_ID = em.dwarf_ID and em.survived = true and em.expedition_id = ex7.expedition_id )  
  as skill_improvement 

(exp.return_date - exp.departue_date) as expedition_duration,

  
  JSON_OBJECT ( 
  
'member_ids', (
  Select JSON_ARRAYAGG (em2.dwarf_id)
  From EXPEDITION_MEMBERS em2, EXPEDITION ex8
  WHERE em2.expedition_id = ex8.expedition_id
  ),

  'artifact_ids', (
   Select JSON_ARRAYAGG (ea2.artifact_id)
   From EXPEDITION_ARTIFACTS ea2, EXPEDITION ex9
  where ea2.expedition_id = ex9.expedition_id
  ),
  
  'site_ids', (
   Select JSON_ARRAYAGG (es2.site_id)
   From EXPEDITION_SITE es2, EXPEDITION ex10
   where es2.expedition_id = ex10.expedition_id
  ),
  )
from 
EXPEDITION exp;




  
