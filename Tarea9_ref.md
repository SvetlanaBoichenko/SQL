
8.3.2  
Мое решение:  
SELECT Products.ProductName, [Order Details].UnitPrice    
From Products, [Order Details]  
Where [Order Details].UnitPrice < 20;  

  Зтот запрос вывел все имена, для каждого имени выведены все    
  значения UnitPrice из таблицы Order Details.  
  Получился набор из повторений каждого имени 1195 раз.  
  Записи получились никак не связаны между собой. Потеряна логика.      
  Надо было связать таблицы по ID, как это сделано в эталонно решении:  
  Products.ProductID = [Order Details].ProductID;  
 Поспешила..  

 8.3.3
Аналогично.
Мое решение:
