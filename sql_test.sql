/*DDL => DATA DEFINATION LANGUAGE*/
/*use to define structure of database*/

/*create database database_name*/
create database test2_sql;

/*keyword to use database*/
use test2_sql;

/*creat table table_name(column data_type)*/
create table sales(purchase_number INT,date_of_purchase date);

/*select => retrieve data from database*/
select * from sales;

/*alter(add)*/
alter table sales 
add column category varchar(20);

/*aletr(drop)*/
alter table sales 
drop column category;

alter table sales
drop sales_data ;

/* rename tabel
1- alter table old_name rename to new_name
2- rename table old_name to new_name
*/

/* truncate => delete data in table
truncate table table_name;
*/

ALTER TABLE SALES 
RENAME TO sales;


/*DML => DATA MANIPULATION LANGUAGE*/
/*use to manipulate data*/

/*insert => insert data into table*/
INSERT INTO sales (purchase_number, date_of_purchase) VALUES
(1, '2017-10-11');

INSERT INTO sales (purchase_number, date_of_purchase) VALUES
(2, '2017-10-27');

/*update => allows you to renew existing data of your tables*/
UPDATE sales
SET date_of_purchase = '2017-12-12'
WHERE purchase_number = 2;



drop database test2_sql;





