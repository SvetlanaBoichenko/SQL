
7.3.1. SELECT (Discount*100)/UnitPrice FROM [Order Details];

7.3.2. SELECT * FROM [Order Details] WHERE ProductId IN 
 (SELECT UnitsInStock FROM Products WHERE UnitsInStock > 40);
