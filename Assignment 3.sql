use Sam;
--Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’,
--‘customer_id’
create table Orders(
Order_id int,
Order_date date,
Order_amount int,
C_id int not null primary key
)

select * from Orders;
insert into Orders values(1,'2023-01-01',5000,1);
insert into Orders values(2,'2023-01-02',6000,2);
insert into Orders values(3,'2023-01-03',7000,3);
insert into Orders values(4,'2023-01-04',8000,4);
insert into Orders values(5,'2023-01-05',4000,5);
insert into Orders values(6,'2023-01-06',3800,6);
insert into Orders values(7,'2023-01-07',8000,7);

--drop table Orders;
select * from Orders;
select * from Customers;

--Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 
select C_firstname,C_lastname,C_email,C_address,C_city,C_state,C_zip,Order_id,Order_date,Order_amount from Customers c
inner join Orders o
on c.C_id = o.C_id;


--. Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
select C_firstname,C_lastname,C_email,C_address,C_city,C_state,C_zip,Order_id,Order_date,Order_amount from Customers c
left join Orders o
on c.C_id = o.C_id;

select C_firstname,C_lastname,C_email,C_address,C_city,C_state,C_zip,Order_id,Order_date,Order_amount from Customers c
right join Orders o
on c.C_id = o.C_id;
--Since using select'*' displayed C_id two times, the best parctice is to use each column name.


--Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3
update Orders
set Order_amount = 100
where C_id = 3;
select * from Orders;