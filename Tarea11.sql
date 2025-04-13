
SELECT Customers.CompanyName, Orders.CustomerID FROM Customers 
LEFT JOIN Orders ON Orders.CustomerID is null 
ORDER BY Customers.CompanyName;
