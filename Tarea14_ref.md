# Рефлексия в уроку 13
Эталонное решение:  

UPDATE [Order Details]
SET Discount = 0.20
WHERE Quantity > 50

UPDATE [OrderDetails]
SET Discount = 0.20
WHERE ProductID IN
  (SELECT ProductID IN Products
   WHERE UnitsInStock > 50)

Мое решение:

