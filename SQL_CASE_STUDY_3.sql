use CaseStudy;

select * from [dbo].[Continent_CS3];
select * from [dbo].[Customers_CS3];
select * from [dbo].[Transaction_CS3];

--1) Display the count of customer in each region who has done the transaction in year 2020
select region_id, count(*) Count_of_Cust from [dbo].[Customers_CS3] c, [dbo].[Transaction_CS3] t 
where c.customer_id = t.customer_id and year(txn_date) = '2020'
group by region_id order by region_id asc;

--2) Display the maximum, minimum of transaction amount of each transaction type.
select txn_type, max(convert(int, txn_amount)) Max_TAmt, min(convert(int, txn_amount)) Min_TAmt
from [dbo].[Transaction_CS3] group by txn_type;

--3) Display customer id, region name and transaction amount where transaction type is deposit and
--transaction amount > 2000.
select c.customer_id, o.region_name, t.txn_amount from [dbo].[Customers_CS3] c, [dbo].[Continent_CS3] o,
[dbo].[Transaction_CS3] t where c.customer_id = t.customer_id and
c.region_id = o.region_id and txn_type = 'deposit' and [txn_amount] > 2000;

--4) Find duplicate records in a customer table.
select [customer_id],[region_id],count(*) from [dbo].[Customers_CS3] 
group by [customer_id],[region_id] having count(*) > 1;

--5) Display the detail of customer id, region name, transaction type and transaction amount for the
--minimum transaction amount in deposit.
select c.customer_id, o.region_name, t.txn_type, t.txn_amount from [dbo].[Customers_CS3] c,
[dbo].[Continent_CS3] o,[dbo].[Transaction_CS3] t
where c.[customer_id] = t.[customer_id] and c.[region_id] = o.[region_id]
group by c.customer_id, o.region_name, t.txn_type, t.txn_amount
having t.txn_amount = (select min(txn_amount) from [dbo].[Transaction_CS3]);

--6) Create a stored procedure to display details of customer and transaction table where transaction
--date is greater than Jun 2020.
create procedure DetailsCT
as
select c.*,t.* from [dbo].[Customers_CS3] c, [dbo].[Transaction_CS3] t
where c.[customer_id] = t.[customer_id] and txn_date > 'Jun 2020'
go

exec DetailsCT; 

--7) Create a stored procedure to insert a record in the continent table.
create procedure InsertCT
as
insert into [dbo].[Continent_CS3]([region_id], [region_name])
values('6', 'Antarctica')
go

exec InsertCT;
select * from [dbo].[Continent_CS3];

--8) Create a stored procedure to display the details of transactions that happened on a specific day.
create procedure TransactionSD
as
select * from [dbo].[Transaction_CS3] where txn_date = ' '
go

exec TransactionSD;

--9) Create a user defined function to add 10% of the transaction amount in a table.
create function Add10pct(@A int)
returns float
as
begin
declare @Result as float
set @Result = @A*1.1
return @Result
end

select [customer_id],[txn_date],[txn_type],[txn_amount],
[dbo].[Add10pct](convert(int, [txn_amount])) New_TxnAmt from [dbo].[Transaction_CS3];

--10) Create a user defined function to find the total transaction amount for a given transaction type.
create function TotalT(@txn_type varchar(50))
returns int
as 
begin 
return(select sum(convert(int, [txn_amount])) from [dbo].[Transaction_CS3] where [txn_type] = @txn_type)
end

select [dbo].[TotalT]('deposit');
select [dbo].[TotalT]('withdrawal');
select [dbo].[TotalT]('purchase');


--11) Create table value function which comprises of the following columns customer_id,
--region_id ,txn_date , txn_type , txn_amount which will retrieve data from the above table.
create function RD()
returns table
as 
return(select c.customer_id,c.region_id ,t.txn_date , t.txn_type , txn_amount 
       from [dbo].[Customers_CS3] c, [dbo].[Transaction_CS3] t where c.[customer_id] = t.[customer_id])


--12) Create a try catch block to print a region id and region name in a single column.
begin transaction RiRnSC
begin try
select ([region_id] + ' ' + [region_name]) as Area from [dbo].[Continent_CS3];
end try
begin catch
select ERROR_MESSAGE() as Error_end_catch
end catch


--13) Create a try catch block to insert a value in the continent table.
begin transaction Value_CT
begin try
insert into [dbo].[Continent_CS3]([region_id], [region_name])
values('7', 'Dreamland')
end try
begin catch
select ERROR_MESSAGE() as Error_end_catch
end catch

--14) Create a trigger to prevent deleting a table in a database.
create trigger Prevent_Del on [dbo].[Continent_CS3]
after delete
as
begin
print'YOUR RECORD HAS BEEN DELETED!'
end


select * from [dbo].[Continent_CS3]
delete from [dbo].[Continent_CS3] where [region_name] = 'America';

--15) Create a trigger to audit the data in a table.
create trigger AuditData on [dbo].[Continent_CS3]
after insert 
as 
begin
insert into [dbo].[Continent_CS3] values('7', 'America')
end

--16) Create a trigger to prevent login of the same user id in multiple pages.
create trigger PreventLogin 
on all server with execute as 'sa'
for logon
as
begin
declare @customer_id sysname
set @customer_id = Original_Login()
if (@customer_id not in ('1','2','3'))
begin 
rollback
end
end

--17) Display top n customers on the basis of transaction type.
select [customer_id], [txn_date], [txn_amount], [txn_type]
from (select [customer_id], [txn_date], [txn_amount], [txn_type],
      (rank() over (order by txn_type)) as rnum 
      from [dbo].[Transaction_CS3])
where rnum<=3;



--18) Create a pivot table to display the total purchase, withdrawal and deposit for all the customers.
select customer_id, [purchase] as Total_Pur, [withdrawal] as Total_Withd, [deposit] as Total_Dep
from (select customer_id, txn_type, cast(txn_amount as int) txn_amount from [dbo].[Transaction_CS3]) 
as SourceTable
pivot
(sum(txn_amount) for txn_type in ([purchase], [withdrawal], [deposit])) as PivotTable
order by customer_id asc;


