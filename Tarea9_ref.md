
8.3.2 
SELECT Products.ProductName, [Order Details].UnitPrice
From Products, [Order Details]
Where [Order Details].UnitPrice < 20; 
