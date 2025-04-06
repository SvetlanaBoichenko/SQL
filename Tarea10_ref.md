# Рефлексия к заданию 9 

SELECT t1.ContactName, t2.ContactName, t1.Region
FROM Customers t1, Customers t2 
WHERE (t1.Region IS NULL) AND (t2.Region IS NULL) AND
      (t1.CustomerID <> t2.CustomerID) 


SELECT OrderID
FROM Orders t1
WHERE CustomerID = ANY 
  (SELECT CustomerID FROM Customers
   WHERE Region IS NOT NULL) 


SELECT OrderID
FROM Orders t1
WHERE EXISTS 
  (SELECT * FROM Customers t2 WHERE
   t1.CustomerID = t2.CustomerID AND
   t2.Region IS NOT NULL)   
      
