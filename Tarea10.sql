
10.4.1
SELECT Products.ProductName, [Order Details].UnitPrice
FROM Products Join [Order Details]
ON Products.ProductID = [Order Details].ProductID
AND [Order Details].UnitPrice <20;

10.4.1
SELECT Orders.Freight, Customers.CompanyName
FROM Orders FULL JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
ORDER BY Freight;
Появились две новые записи, те, что пересекаются вывелись по одному разу и добавились те,
которые не подошли под условие - получили полный набор неповторяющихся записей

10.4.2
