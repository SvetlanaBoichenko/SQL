
  Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| dwarf_id     | INT          | Уникальный идентификатор гнома            |
| name         | VARCHAR(100) | Имя гнома                                 |
| age          | INT          | Возраст гнома                             |
| profession   | VARCHAR(100) | Профессия гнома                           |
| squad_id     | INT          | Идентификатор отряда                      
                                (NULL, если не в отряде)                  |
Таблица Squads
| Field        | Type         | Description                               |
|--------------|--------------|-------------------------------------------|
| squad_id     | INT          | Уникальный идентификатор отряда           |
| name         | VARCHAR(100) | Название отряда                           |
| leader_id    | INT          | Идентификатор лидера отряда 
                                (ссылка на dwarf_id из таблицы Dwarves)   |

 Найдите все отряды, у которых нет лидера. 
Select Sq.name as  SqOffLeader
from Squaqs Sq
where Sq.leader_id IS NULL
