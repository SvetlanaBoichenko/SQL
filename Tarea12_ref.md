# Рефлексия к уроку 11

11.5.1  
Мое решение:
SELECT Customers.CompanyName, Orders.CustomerID FROM Customers   
LEFT JOIN Orders ON Orders.CustomerID is null   
ORDER BY Customers.CompanyName;  
Эталонное решение:  
SELECT * FROM Customers LEFT JOIN Orders  
ON Orders.CustomerID = Customers.CustomerID  
WHERE Orders.CustomerID IS NULL  
  
Опять ошибка - вывела все записи из двух таблиц, а надо было пересечение.  
"..записи из таблицы Customers, для которых FK-ключ таблицы Orders пустой"   
Записи из одной таблицы - для которых записи из другой с условием означает   
что записи должны быть и в первой и во второй таблицы, пересекаться:  
  
Orders.CustomerID = Customers.CustomerID  




11.5.2.  
Верно  
