
8.3.1 
SELECT Products.ProductName, Categories.CategoryName 
FROM Products, Categories
WHERE Products.CategoryID = Categories.CategoryID;

8.3.2 
SELECT Products.ProductName, [Order Details].UnitPrice
From Products, [Order Details]
Where [Order Details].UnitPrice < 20;

