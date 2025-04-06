# Рефлексия к заданию 9 

## 9.4.1   
Эталонное решение:    
SELECT t1.ContactName, t2.ContactName, t2.Region   
FROM Customers t1, Customers t2   
WHERE (t2.Region IS NULL) and   
 (t1.CustomerID <> t2.CustomerID)     

Мое решение:   
 SELECT t1.ContactName, t2.ContactName, t1.Region  
FROM Customers t1, Customers t2   
WHERE (t1.Region IS NULL) AND (t2.Region IS NULL) AND  
      (t1.CustomerID <> t2.CustomerID)  
  
Лишнее условиев моем решении (t2.Region IS NULL), поэтому результат отличается,   
убрала не только нулевые регионы у заказчиков и в списке регионов.  
В условии нулевые поля учитвать только у заказчиков.  
  

## 9.4.2   
Эталонное решение:  
SELECT OrderID  
FROM Orders t1  
WHERE EXISTS   
  (SELECT * FROM Customers t2 WHERE  
   t1.CustomerID = t2.CustomerID AND  
   t2.Region IS NOT NULL);  
  
Мое решение:  
Select * FROM Orders t1  
WHERE EXISTS  
(SELECT * FROM  Customers t3  
WHERE t1.CustomerID= t3.CustomerID  AND t3.Region IS NOT NULL );  
  
Выбрала только одно поле вместо всех, в результате вывела только один столбец.    
Неправильно поняла условие    
    
## 9.4.3  
Эталонное решение:   
SELECT * FROM Orders t1   
where t1.Freight > ANY   
(SELECT UnitPrice FROM  Products)   

  Мое решение:   
SELECT OrderID   
FROM Orders   
WHERE Freight > ALL   
  (SELECT UnitPrice FROM Products)   
  
  Та же ошибка, что и в предыдущей задаче -   
  не вывела все поля.




