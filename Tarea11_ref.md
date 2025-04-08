10.4.1  
Эталонное решение:  
SELECT Products.ProductName, [Order Details].UnitPrice  
FROM [Order Details] INNER JOIN Products  
ON [Order Details].UnitPrice < 20 AND  
   [Order Details].ProductID = Products. ProductID;   

Мое решение:  
SELECT Products.ProductName, [Order Details].UnitPrice  
FROM Products Join [Order Details]  
ON Products.ProductID = [Order Details].ProductID  
AND [Order Details].UnitPrice <20;  

В общем, то по результату выходит одно и то же. 
Только в запросах таблицы присоединяются с разных сторон.  

 
  10.4.2 
   
SELECT Orders.Freight, Customers.CompanyName
FROM Orders INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
ORDER BY Freight; 

10.4.2  
Эталонное решение:  
Технически, мы получим несколько дополнительных записей, у которых в поле Freight записан NULL.  
Это записи, которые не подошли под условие отбора, поэтому поля, соответствующие другой таблице,  
заполняются значением NULL.  
Мое решение:    
SELECT Orders.Freight, Customers.CompanyName  
FROM Orders FULL JOIN Customers  
ON Orders.CustomerID = Customers.CustomerID  
ORDER BY Freight;  
  
Появились две новые записи, те, что пересекаются вывелись по одному разу и добавились те,  
которые не подошли под условие - получили полный набор неповторяющихся записей.  
В общем и целома верно. не отметила, что то, что поля, которые не совпали, заполняются NULL



10.4.3  
Эталонное решение:  
WHERE table1.primary_key = table2.foreign_key  
  
10.4.3   
SELECT Products.ProductName, [Order Details].UnitPrice    
FROM Products CROSS JOIN [Order Details]   
WHERE Products.ProductID = [Order Details].ProductID;  

не догадалась.
Собственно, да, 
  
10.4.4  
совпадают


