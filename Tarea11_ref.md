10.4.1
SELECT Products.ProductName, [Order Details].UnitPrice
FROM [Order Details] INNER JOIN Products
ON [Order Details].UnitPrice < 20 AND
   [Order Details].ProductID = Products. ProductID; 





  10.4.2 
   
   SELECT Orders.Freight, Customers.CompanyName
FROM Orders INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
ORDER BY Freight; 

10.4.3
WHERE table1.primary_key = table2.foreign_key

10.4.4
SELECT Products.ProductName, [Order Details].UnitPrice
FROM Products INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
