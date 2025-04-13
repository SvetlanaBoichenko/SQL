11.5.1
SELECT Customers.CompanyName, Orders.CustomerID FROM Customers 
LEFT JOIN Orders ON Orders.CustomerID is null 
ORDER BY Customers.CompanyName;

11.5.2.
SELECT 'Customer' As Type, ContactName, City, Country FROM Customers 
UNION
SELECT 'Supplier' As Type, ContactName,City, Country FROM Suppliers 
ORDER BY Type;


