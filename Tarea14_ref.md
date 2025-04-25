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
Update [Order Details]  
Set Discount  = '0.20'  
where Quantity > 50; 

Про второй вариант и не подумала. 
  
13.3.2   
Эталонное решение:
UPDATE Contacts  
SET City = "Piter", Country = "Russia"  
WHERE City = "Berlin" OR Country = "Germany"  
  

Мое решение:
Update Contacts 
Set City  = 'Piter', Country = 'Russia'  
where City = 'Berlin' and Country = 'Germany';  
  
Применила оператор And на случай, что Берлин может быть где то еще, кроме Германии..  
  
13.3.3    
Эталонное решение:  
INSERT INTO Shippers (CompanyName)
VALUES ("Delete Me")

/************/

DELETE FROM Shippers
WHERE CompanyName = "Delete Me"
 

Мое решение:  
INSERT INTO Shippers (Companyname,Phone)   
  values ('Binar', '(831)305-6383')  
INSERT INTO Shippers (Companyname,Phone)   
  values ('Binar2', '(831)305-6384')  

    
Delete From  Shippers   
 where CompanyName = 'Binar';   
Delete From  Shippers   
 where CompanyName = 'Binar2';  

 Да, так как ID неизвестно, можно было вытащить его через SELECT..
