
9.4.1
SELECT t1.ContactName, t2.ContactName, t2.Region
FROM Customers t1, Customers t2
WHERE (t2.Region IS NULL) and
 (t1.CustomerID <> t2.CustomerID) 

9.4.2
Select * FROM Orders t1 
WHERE EXISTS 
(SELECT * FROM  Customers t3 
WHERE t1.CustomerID= t3.CustomerID  AND t3.Region IS NOT NULL );

9.4.3
SELECT * FROM Orders t1
where t1.Freight > ANY 
(SELECT UnitPrice FROM  Products)
