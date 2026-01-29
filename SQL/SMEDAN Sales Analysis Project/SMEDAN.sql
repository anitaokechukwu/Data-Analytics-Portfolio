-- creation of SMEDAN DATABASE
DROP DATABASE IF EXISTS SMEDAN;
CREATE DATABASE SMEDAN;

-- Using SMEDAN DATABASE
USE SMEDAN;


-- Creation of product table
CREATE TABLE Product(
Product_ID INT PRIMARY KEY,
Product_Name VARCHAR (50),
Brand VARCHAR (50),
UoM VARCHAR (30)
);
INSERT INTO Product VALUES (100,'llly Ground 250 Gr', 'illy','Kg');
INSERT INTO Product VALUES (200, 'Viktory Ground 500 Gr','Viktory','Kg');
INSERT INTO Product VALUES (300,'San Pellegrino Sparkling 500ML','Water','Bottle');
INSERT INTO Product VALUES (400,'Mango Puree Sorbetto','Ice Cream','Kg');




-- creation of Sales table
CREATE TABLE Sales(
Sales_ID INT PRIMARY KEY AUTO_INCREMENT,
Product_ID INT,
Customer_Name VARCHAR (50),
Location VARCHAR (50),
Salesperson VARCHAR (50),
Customer_Type VARCHAR (30),
Date DATETIME,
Quantity INT,
Value_in_Rupiah INT,
FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID)
);
INSERT INTO Sales VALUE (1,100,'Holiday Inn','Bandung','Gates','Hotel','2019-10-01 00:00:00',25,50000000);
INSERT INTO Sales VALUE (2,200,'MicKinsey','Jakarta','Kristi','Corporate','2019-11-01 00:00:00',300,35000000);
INSERT INTO Sales VALUE (3,300,'Ritz Carlton','Jakarta','Oprah','Hotel','2019-12-01 00:00:00',40,65000000);
INSERT INTO Sales VALUE (4,100,'McD','Makassar','Mark','Restaurant','2018-10-01 00:00:00',60,85000000);
INSERT INTO Sales VALUE (5,200,'State Senayan','Bali','Mercy','Restaurant','2018-11-01 00:00:00',220,29000000);
INSERT INTO Sales VALUE (6,300,'Hypermart','Medan','Francs','Retail','2018-12-01 00:00:00',20,22000000);
INSERT INTO Sales VALUE (7,100,'Holiday Inn','Jakarta','Gates','Hotel','2016-10-01 00:00:00',29,58000000);
INSERT INTO Sales VALUE (8,200,'McD','Jakarta','Mark','Restaurant','2016-11-01 00:00:00',100,200000000);
INSERT INTO Sales VALUE (9,300,'State Senayan','Jakarta','Mercy','Restaurant','2016-12-01 00:00:00',150,19000000);
INSERT INTO Sales VALUE (10,100,'Grand Hayat','Jakarta','Merry','Hotel','2017-10-01 00:00:00',33,58000000);
INSERT INTO Sales VALUE (11,200,'Microsoft','Jakarta','Kristi','Corporate','2017-11-01 00:00:00',22,40000000);
INSERT INTO Sales VALUE (12,300,'Google','Jakarta','William','Corporate','2017-12-01 00:00:00',150,18000000);  



-- question; 1
select * from sales
where Value_in_Rupiah >= 30000000
order by value_in_Rupiah desc;

select *, rank() over (order by value_in_Rupiah desc) from sales
where Value_in_Rupiah >= 30000000 group by;


-- 1 add applicable to row 
select *, rank() over (order by value_in_Rupiah desc) as Ranking from sales  
where Value_in_Rupiah >= 30000000;

-- 2
select * from sales;
select Customer_Name, Customer_Type, Date, Value_in_Rupiah from sales
order by date desc;
  
  -- 3
select * from sales;
select Customer_Name, Customer_Type as Channel, Date, Value_in_Rupiah from sales
order by date desc;


-- 4
select * from sales;
select Customer_Name, Customer_Type as Channel, Date, Value_in_Rupiah from sales
order by date desc;


-- 4
-- SUB QUERY
select customer_type, sum(value_in_Rupiah) as value_ from sales
group by customer_type
order by value_ desc;


select customer_type, sum(value_in_Rupiah) as value_ from sales
group by customer_type
order by value_ desc
Limit 1;


-- 5
select * from sales;
select * from product;
select product_name, Sales.* from sales
join product
on sales.product_id = product.product_ID;

-- 6
select * from sales;
select * from product;
select product_name, Sales.* from sales
join product
on sales.product_id = product.product_ID
where salesperson = 'krist' and 
year(date) between 2017 and 2019
order by Value_in_Rupiah desc;

-- 7



-- 8
select sum(value_in_Rupiah),
avg(value_in_Rupiah), max(value_in_Rupiah), min(value_in_Rupiah),
count(value_in_Rupiah) from sales;

select product_name, sum(Quantity), sum(value_in_Rupiah),
sum(quantity * value_in_Rupiah) from sales
join product
on sales.product_id = product.product_ID
group by product_Name;

-- 10
select year(date), sum(quantity), sum(value_in_Rupiah),
sum(quantity * value_in_Rupiah) from sales
group by year(date);



-- 1
select * from Sales;
select * from sales
where value_in_Rupiah >= 30000000
order by value_in_Rupiah desc;
-- 2
select * from sales;
select Customer_name, Customer_type, Date, Value_in_Rupiah from sales
order by date desc;

-- 3
select * from sales;
select Customer_name, Customer_type as Channel, Date, Value_in_Rupiah from sales
order by date desc;

-- 4
select * from sales;
select Customer_type, sum(value_in_Rupiah) as value_ from sales
group by Customer_type
order by value_ desc;


select * from sales;
select Customer_type, sum(value_in_Rupiah) as value_ from sales
group by Customer_type
order by value_ desc
limit 1;

select * from sales
where Value_in_Rupiah = (select max(value_in_Rupiah) from sales);

-- 5
select * from product;
select * from sales;

select * from sales
join product
on sales.product_id =  product.product_id;

select product_name, sales. * from sales
join product
on sales.product_id = product.product_ID;

-- 6
select product_name, sales.* from sales
join product
on sales.product_id = product.product_ID
where salesperson = 'krist' and
year(date) between 2017 and 2019 
order by value_in_Rupiah desc;

-- 7
select * from product
join sales
on sales.product_id = product.product_id;

-- 8

select * from sales;
select sum(value_in_Rupiah), avg(value_in_Rupiah), max(value_in_Rupiah),
 min(value_in_Rupiah), count(value_in_Rupiah) from sales;
 
 -- 1. Suppose you work for a company and your manager says
-- you should get the Sales report where the value is greater
-- than or equal to 30,000,000 and rank them from largest to
-- smallest value

-- 2. Get only the customer name, customer type, date, value,
-- from the sales table and sort them by date (newest to oldest)

-- 3. From the above query(maintaining the arrangement), you
-- are asked to change customer_type to channel temporarily

-- 4. Your manager wants to know who is the big contributor
-- based on Customer type

-- 5. Your manager wants you to join the sales and product
-- table in order to get more details about the products that
-- have been sold

-- 6. Using the query above, a sales person named Kristi asked
-- you to extract her records from 2017 to 2019 sorted from
-- largest to smallest

-- 7. Get all the products and their corresponding sales
-- information, if any

-- 8. Do data aggregation or summarization of the table and get
-- the
-- (a) total sales
-- (b) average sales
-- (c) minimun sales 
-- (d) maximun sales
-- 9. Helping us gain a deep understanding of the data

-- Get the total quantity, total sales and total price sold for each product in the datadase table

-- 10. Your manager wants the report on a yearly basis:
-- summarise the data to sales report or trends on a yearly basis.





















