15.7
  
1. Создание таблиц.  
CREATE TABLE Region ( 
    RegionID int NOT NULL, 
    RegionDescription nchar(50) NOT NULL ); 

CREATE TABLE Territory ( 
    TeritoryID int NOT NULL, 
    TerritoryDescription nchar(20) NOT NULL, RegionID int NOT NULL );

2. Назначение первичных ключей для обоих таблиц. Это RegionID в первой таблице и
  TeritoryID во второй

  
3.  Связывание полей RegionID двух таблиц. 
Назначаем поле RegionID в таблице Territory внешним ключом для связи с таблицей Region.


 4. Заполнение таблиц данными с учетом правильности заполнения поля RegionID
  в таблице Territory

  INSERT INTO Region (RegionID, RegionDescription)
VALUES ('1', 'Rusia Sur');
.
.
  INSERT INTO Region (RegionID, RegionDescription)
VALUES ('5', 'Belarus');

Результат:

RegionID	RegionDescription
1	        Rusia Sur                                         
2	        Rusia Norte                                       
3	        Rusia Oeste                                       
4	        Rusia Este                                        
5	        Belarus                                           
  

  INSERT INTO Territory (TeritoryID, TerritoryDescription, RegionID)
VALUES ('2', 'Krasno', 1);
.
.
.  
  INSERT INTO Territory (TeritoryID, TerritoryDescription, RegionID)
VALUES ('7', 'Osipovichi', 5);

TeritoryID	TerritoryDescription	RegionID
2	          Krasno              	1
3	          Glebovka            	1
4	          Leningradka         	3
6	          Pribug              	5
7	          Osipovichi          	5

