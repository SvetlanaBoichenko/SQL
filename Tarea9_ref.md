
8.3.2  
SELECT Products.ProductName, [Order Details].UnitPrice  
From Products, [Order Details]  
Where [Order Details].UnitPrice < 20;  

  Зтот запрос вывел все имена для которых, для каждого имени выведены все  
  значения UnitPrice из таблицы Order Details. Получился набор из повторений каждого имени 1195 раз  
  где для этого (одного и того же) имени выведены все цены меньше 20. Их 1195.  
Колонки получились никак не связаны между собой.  
Потеряна логика.  
