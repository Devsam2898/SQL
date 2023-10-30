use AdventureWorks2012;

--1)  Get all the details from the person table including email ID, phone number, 
--and phone number type.

select * from [Person].[Person]
select * from [Person].[EmailAddress]
select * from [Person].[PersonPhone]
select * from [Person].[PhoneNumberType]

select p.*, e.EmailAddressID, h.PhoneNumber, t.Name from [Person].[Person] p, 
[Person].[EmailAddress] e,[Person].[PersonPhone] h, [Person].[PhoneNumberType] t
where p.BusinessEntityID = e.BusinessEntityID and e.BusinessEntityID = h.BusinessEntityID
and h.PhoneNumberTypeID = t.PhoneNumberTypeID;

--2)  Get the details of the sales header order made in May 2011.
select * from [Sales].[SalesOrderHeader] where (OrderDate) between '05/01/2011' and '05/31/2011'
order by OrderDate asc; 

--3)  Get the details of the sales details order made in the month of May 2011.
select d.* from  [Sales].[SalesOrderHeader] h, [Sales].[SalesOrderDetail] d where d.SalesOrderID = h.SalesOrderID
and h.OrderDate between '05/01/2011' and '05/31/2011' order by OrderDate asc;

--4)  Get the total sales made in May 2011.
select * from [Sales].[SalesOrderDetail]
select count(distinct SalesOrderID) TotalSales from [Sales].[SalesOrderHeader] where (OrderDate) between '05/01/2011' and '05/31/2011';

--5)  Get the total sales made in the year 2011 by month order by increasing sales.
select month(OrderDate) Month,count(distinct SalesOrderID) TotalSales from [Sales].[SalesOrderHeader] where OrderDate between '01/01/2011' and '12/31/2011'
group by month(OrderDate)
order by count(distinct SalesOrderID)  asc;

--6)  Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'.
select * from [Person].[Person]
select * from [Sales].[SalesOrderHeader]
select count(distinct h.SalesOrderID) TotalSales from Sales.SalesOrderHeader h, Person.Person p 
where h.rowguid = p.rowguid and p.FirstName = 'Gustavo' and p.LastName = 'Achong';