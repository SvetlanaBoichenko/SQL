
3.9.1.	Select ProductName, QuantityPerUnit From Products;
3.9.2.	Select ProductName, UnitPrice From Products WHERE (UnitPrice < 20); 
3.9.3.	SELECT * FROM Orders where (Freight > 11.7) AND (Freight < 98.1); 
3.9.4.	Select * From Employees  where (TitleOfCourtesy = 'Mr.');
3.9.5.	Select * From Suppliers  where (Country = 'Japan');
3.9.6.	Select * From Orders  where (EmployeeID = 2) OR (EmployeeID = 4) OR (EmployeeID = 8); 
3.9.7.	Select OrderID, ProductID From [Order Details] where (UnitPrice > 40) AND (Quantity < 10);
