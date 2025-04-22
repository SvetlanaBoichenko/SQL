# Рефлексия к уроку 12

Мое решение:  
12.3.1  
INSERT INTO Employees (Lastname, FirstName,Title,TitleOfCourtesy,  
BirthDate, HireDate, Address, City, Region, PostalCode,Country, HomePhone,Extension,   
Notes, ReportsTo)   
VALUES ('Boychenko','Svet','Bailadora','Flamemco', '1970-27-08','2025-03-01',    
  'Ronda Magdalena 14-16', 'Castellon',    
'Valencia', '12004','España','12345','6789','Baila cada dia', '2');    

  Эталонное решение:  
  INSERT INTO Employees (FirstName, LastName)  
  VALUES ('Petya', 'Durov')  
  
Ввела больше полей  
  
  
12.3.2  
Идентично  
  
12.3.3    
Insert into Orders (CustomerID, EmployeeID, OrderDate, RequiredDate,  
ShippedDate, ShipVia)  
values ('ALFKI', '13','31-01-2024', '02-02-2025','03-02-2025', '2');  

При задании корректных FK ключей, проблем при добавлении записей     
а таблицу Orders не возникало  
  
Эталонное решение:  

INSERT INTO Orders (CustomerID, EmployeeID, ShipVia)
VALUES ('ALFKI', 11, 3)
Это классический пример опасности прямой модификации таблицы без учёта логической целостности. Мы добавили   заказ, в котором не заданы важные поля (например, дата заказа). Товары в этом заказе отсутствуют, так как не 
  сформирована связь в таблице Order Details, и подобные некорректности могут привести к существенном  
 искажению логической структуры.    

Ввела больше полей следуя интуиции, однако,
да, запись появилась, а заказа нет,  
так как нет деталей заказа.  
