Oдин к одному
Не найдено
  
Один ко многим

  1. Territories - Regiones
  Поля с ключами:
  (PK) TerritoryID, (FK) RegionID  
   Регион может содержать больше одной территории.
   Территория Не может принадлежать разным регионам

2. Employees - Employees
  Поля с ключами:
  (PK) Employees, (FK) ReportTo
  Сотрудник должкн отчитаться перед начальником или большим начальником.
Юольшой начальник неотчитывается ни перед кем.
Внешний ключ создан из поля собственной таблицы

Многие ко многим
  
2. Products - Supplier - Categories
Поля с ключами:
(PK) ProductID, (FK) SupplierID, (FK) CategoryID 
  Продукция ProductID может быть разных категорих и иметь разных поставщиков
В свою очередь поставщики поставляют продукты разных категорий, 
также как и разные категории продуктов могут иметь разных поставщиков, 
что отражено в  сооответствующих полях таблицы.

3. Orders - Customers - Employers - Shippers
   Поля с ключами:
   (PK) OrdersID, (FK)Customers, (FK)EmployersID, (FK)ShipVia 
  Заказы могут отправляться различным потребителям, различными способами и 
  Выполнять заказ могут разные работники. Поля FK могут проявляться в различных
  комбинациях, образуя новые заказы.
 
  

Служебные таблицы - нет собственнык ключей РК
   OrderDetails
 Поля с ключами:
 (FK) OrderID,   (FK) ProductID
  Заказ может содержать разные продукты. 
  
  EmployeeTerritories, нет собственного ключа 
Поля с ключами:
(FK) EmployeeID,   (FK) TerritoryID
На одной территории может работать несколько сотрудников
Любой из этих сотрудников может работать на одной или нескольких территориях

