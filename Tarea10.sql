
10.4.1
SELECT Products.ProductName, [Order Details].UnitPrice
FROM Products Join [Order Details]
ON Products.ProductID = [Order Details].ProductID
AND [Order Details].UnitPrice <20
