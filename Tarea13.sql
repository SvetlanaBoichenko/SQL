13.3.1  
Update [Order Details]  
Set Discount  = '0.20'  
where Quantity > 50;  
  
13.3.2  
Update Contacts 
Set City  = 'Piter', Country = 'Russia'  
where City = 'Berlin' and Country = 'Germany';  


13.3.3  
INSERT INTO Shippers (Companyname,Phone)  
  values ('Binar', '(831)305-6383')
INSERT INTO Shippers (Companyname,Phone)  
  values ('Binar2', '(831)305-6384')


Delete From  Shippers 
 where CompanyName = 'Binar';
Delete From  Shippers 
 where CompanyName = 'Binar2';

Удалила записи по имени компании, которую добавляла.


