12.3.1
INSERT INTO Employees (Lastname, FirstName,Title,TitleOfCourtesy,  
BirthDate, HireDate, Address, City, Region, PostalCode,Country, HomePhone,Extension,  
Notes, ReportsTo)  
VALUES ('Boychenko','Svet','Bailadora','Flamemco', '1970-27-08','2025-03-01',   
  'Ronda Magdalena 14-16', 'Castellon',  
'Valencia', '12004','España','12345','6789','Baila cada dia', '2');  

12.3.2  
INSERT INTO EmployeeTerritories (EmployeeID,TerritoryID)  
  values ('13', '01730');  
  

12.3.3  
Insert into Orders (CustomerID, EmployeeID, OrderDate, RequiredDate,
ShippedDate, ShipVia)
values ('ALFKI', '13','31-01-2024', '02-02-2025','03-02-2025', '2')

При задании корректных FK ключей, проблем при добавлении записей   
а таблицу Orders не возникало
