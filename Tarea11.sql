
SELECT Customers.CompanyName, Orders.CustomerID FROM Customers 
LEFT JOIN Orders ON Orders.CustomerID is null 
ORDER BY Customers.CompanyName;

SELECT 'Customer' As Type, ContactName, City, Country FROM Customers 
WHERE Country='USA' 
UNION 
SELECT 'Supplier' As Type, ContactName,City, Country FROM Suppliers 
WHERE Country='USA' 
ORDER BY City; 

