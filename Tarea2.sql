Отношения один к одному
Таблицы:
  



Один ко многим

  1. Territories
  Поля:
  (PK) TerritoryID, (FK) RegionID  
   Регион может содержать больше одной территории.
   Территория не может принадлежать разным регионам
 

Многие ко многим

1.OrderDetails
Поля:
(FK) OrderID,   (FK) ProductID
  Заказ может содержать разные продукты. Продукт модет принадлежать разным заказам 

2. Products
Поля:
(PK) ProductID, (FK) SupplierID, (FK) CategoryID 
  Продукция ProductID может быть разных категорих и иметь разных поставщиков
В своб очередь поставщики поставляют продукты разных категорий, 
также как и разные категории продуктов могут иметь разных поставщиков, 
что отражено в  сооответствующих полях таблицы.

3. EmployeeTerritories 
Поля:
(FK) EmployeeID,   (FK) TerritoryID
на одной территории может работать несколько сотрудников
Любой из этих сотрудников может работать на одной или нескольких территориях

