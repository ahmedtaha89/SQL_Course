CREATE DATABASE SQL_PARCTICE ;
USE  SQL_PARCTICE;

CREATE TABLE  sales(
user_id int IDENTITY(1,1),
user_name varchar(50) not null,)

insert into sales 
values('test',null);

select * from sales
where user_id =1;

update sales
set user_name = 'AHMED'
where user_id = 1;

delete sales
where user_id = 2;


--test
/**/

ALTER TABLE sales
ADD  date_of_purchase DATE;

truncate table sales;

select * from sales
where user_id =1 or user_name = 'AHMED';


select * from sales
where date_of_purchase not between '2005-09-05' and '2006-10-8';

select * from 
where date_of_purchase is not null


select distinct date_of_purchase from sales

select count(date_of_purchase) from sales 
select count(*) from sales 

create table product (salary decimal(8,5));
drop table product;

insert into product 
values (587.58224)

select salary from product;
select round(salary,1) from product;


drop table product