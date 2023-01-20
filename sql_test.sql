/*create database*/
create database test2_sql;

/*keyword to use database*/
use test2_sql;

/*creat table table_name(column data_type)*/
create table sales(purchase_number INT,date_of_purchase date);

select * from sales;

/*alter(add)*/
alter table sales 
add column category varchar(20);

