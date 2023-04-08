-- Basic SELECT Statement
-- SELECT *|{[DISTINCT] column|expression [alias],...} FROM    table;
-- distinct => áãäÚ ÇáÊßÑÇÑ

select distinct *  from [production].[stocks];
select *  from [production].[stocks];

-- Arithmetic Expressions (+,-,*,/)
select quantity * 100  from [production].[stocks] 
where store_id = 1 ;

-- alias 
select quantity * 100  as quantity_store_id_1 from [production].[stocks] 
where store_id = 1 ;


-- Concatenation Operator
select first_name + ' ' + last_name from [sales].[customers];

-- Limiting the Rows That Are Selected > , < , =  
select * from sales.orders
where order_date >= '2003-01-07' and shipped_date >= '2022-01-01';
 

--between  and
select * from [production].[brands] 
where brand_id between 1 and 2;

-- like    escape ''
select * from [production].[products]
where product_name like 'test_\_%' ESCAPE '\' and list_price like  '4%';

-- in ()
select * from [sales].[customers]
where first_name in ('ahmed','kareem') ;

-- is null
select * from [sales].[customers]
where first_name in ('ahmed','kareem') and state is null  ;

-- not in
select * from [sales].[customers]
where city not in ('alex');


-- Using the ORDER BY Clause
select * from [sales].[customers]
order by first_name desc; 


--Substitution Variables
--CREATE PROCEDURE myProcedure
--  @param1 varchar(50),
--  @param2 VARCHAR(50)
--AS
--BEGIN
--  -- Use the parameters in the procedure
--  SELECT * FROM [sales].[customers] WHERE first_name = @param1 AND last_name = @param2
--END

--EXEC myProcedure 'ahmed' ,'taha';

--sp_help '[sales].[order_items]'


-- Functions 

-- Single row => Character

--Case-conversion functions
select upper(first_name + ' ' + last_name) as Name from [sales].[customers];
select lower(first_name + ' ' + last_name) as Name from [sales].[customers];

--Character-manipulation functions
select concat(first_name , last_name) as Name from [sales].[customers];

-- length 
select  first_name, len(first_name) as Name from [sales].[customers];

-- Trim 
select  trim('a' from first_name) as Name from [sales].[customers];

-- REPLACE
SELECT REPLACE('Hello, World!', 'World', 'Universe') as Hello


-- SUBSTRING
SELECT SUBSTRING('Hello, World!', 1, 6)


-- Round 
select list_price , list_price*0.333  , ROUND(list_price*0.333,2) as new_salary from [sales].[order_items];

-- Trunc
select list_price , list_price * 0.333   from [sales].[order_items];

-- Mod

select  MIN(list_price) as min_list_price, MAX(list_price) max_list_price, 
AVG(list_price) AVG_list_price , SUM(list_price) SUM_list_price , COUNT(*) , COUNT(list_price)  as 'count' from [sales].[order_items];


select required_date from [sales].[orders];


SELECT CONVERT(varchar(10), GETDATE(), 120);


 -- Group by / having
select  store_id , sum(quantity)  from [production].[stocks]
group by store_id
having store_id = 1;



select * from sales.customers 
select * from sales.orders 

select customers.customer_id , first_name +' '+ last_name as Name ,email , order_date , shipped_date from sales.customers full join sales.orders
on customers.customer_id = orders .customer_id;


select * from sales.orders 
where order_date < (select order_date from sales.orders where order_id = 1);

-- insert into 

select * from sales.customers;




-- create the sequence
CREATE SEQUENCE my_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 1000;

-- insert a row into a table using the sequence
INSERT INTO  sales.customers (customer_id, first_name, email)
VALUES (NEXT VALUE FOR my_sequence, 'John', 'john@example.com');

-- Data Manipulation Language
select * from  sales.customers ;

update sales.customers
set phone  = '010564445964'
where customer_id = 3;


alter table sales.customers 
ALTER COLUMN street varchar(50) not null;

alter table sales.customers 
drop COLUMN zip_code 


select list_price , list_price *0.2 + list_price as new_salary from [sales].[order_items];
