Рефлексия:
Многие ко многим.
Неправильно поняла многие ко многим. Сбило с толку отсутствие поля с РК
Один ко многим.
Сбила все в кучу. Да, все верно отношения таблиц один ко многим следует писать конкретно для каждой таблицы с ее данными FK. 
Разным полям РК «OrdersID»  может соответствовать одно и то же значение CustomerID . (один и тот же потребитель может сделать несколько заказов). 
Аналогично связь данных поля «OrdersID»  с  данными из таблиц Employees, Suppliers. Один и тот же работник или поставщик могут выполнять несколько заказов.
Аналогична ситуация и с таблицами 
Suppliers	Products
Categories	Products
И не важно,  есть ли связь ли между таблицами Suppliers- Categories. Собственно ее и нет.

Employees – Employees
Не совсем понятно пока как интерпретировать связь полей (PK) Employees - (FK) ReportTo.


Ответы:
1.	Select ProductName, QuantityPerUnit From Products;
2.	Select ProductName, UnitPrice From Products WHERE (UnitPrice < 20); 
3.	SELECT * FROM Orders where (Freight > 11.7) AND (Freight < 98.1); 
4.	Select * From Employees  where (TitleOfCourtesy = 'Mr.');
5.	Select * From Suppliers  where (Country = 'Japan');
6.	Select * From Orders  where (EmployeeID = 2) OR (EmployeeID = 4) OR (EmployeeID = 8); 
7.	Select OrderID, ProductID From [Order Details] where (UnitPrice > 40) AND (Quantity < 10);
