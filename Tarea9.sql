
9.4.1
SELECT t1.ContactName, t2.ContactName, t2.Region
FROM Customers t1, Customers t2
WHERE (t2.Region IS NULL) and
 (t1.CustomerID <> t2.CustomerID) 

9.4.2
