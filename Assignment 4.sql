use Sam;

select * from Orders;

--Use the inbuilt functions and find the minimum, maximum and average amount from the orders
table
select min(Order_amount) as Minimum_Amount from Orders;
select max(Order_amount) as Maximum_Amount from Orders;
select avg(Order_amount) as Average_Amount from Orders;

--Create a user-defined function, which will multiply the given number with 10
create function multiply(@val int)
returns int as 
begin 
return(@val*10) 
end
drop function multiply;
select *,dbo.multiply(Order_amount) as Multiplied_Amount from Orders;

-- Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and
--print the corresponding value
select 100 as value,
case
when 100 > 200 then '100 is greater than 200'
when 100 < 200 then '100 is smaller then 200'
else '100 is equal to 200'
end
as Measure