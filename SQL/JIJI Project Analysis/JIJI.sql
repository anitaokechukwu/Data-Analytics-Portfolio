USE jiji; 

-- SELECT Clause: 
-- Retrieve the names and salaries of all employees. 
select * from employees;
select name, salary from employees;
-- Retrieve the order dates and total amounts from the Orders table.
select * from orders; 
select OrderDate, TotalAmount from orders;
-- Retrieve the customer names and cities from the Customers table.
select * from customers;
select Name, City from customers; 
 
-- WHERE Clause: 
-- Retrieve orders placed in March 2023.
select * from orders
where OrderDate between '2023-03-01' and '2023-03-31';
--  Retrieve customers located in Lagos. 
select * from Customers
where city = 'Lagos';

-- Retrieve employees with a salary greater than ₦50,000.
select * from employees
where salary > 50000; 
 
-- GROUP BY Clause: 
-- Calculate the total sales amount per customer. 
select * from Orders;
select CustomerID, sum(TotalAmount) as TotalAmount from Orders
group by CustomerID;
-- Calculate the average salary per position. 
select * from employees;
select EmployeeID, avg(salary) as salary from employees
group by employeeID;


-- Count the number of orders per month.
select * from orders;
select OrderID, count(OrderDate) as OrderDate from orders
group by OrderID;

select * from orders;
select month (OrderDate) as month, count(*) as TotalOrders from Orders
group by month (OrderDate);
 
 SELECT 
  DATE_FORMAT(OrderDate, '%Y-%M') AS Month,
  COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Month
ORDER BY Month;

SELECT 
  YEAR(OrderDate) AS OrderYear,
  MONTH(OrderDate) AS OrderMonth,
  COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;

-- Count the number of orders per month. 
 
-- HAVING Clause: 
-- Find customers who have made total purchases greater than ₦1,000. 
select * from Orders;
select CustomerID, sum(totalAmount) as TotalAmount from Orders
group by CustomerID
having TotalAmount > 1000; 


-- Find positions with an average salary greater than ₦50,000.
select * from employees; 
select employeeID, avg(salary) as salary from employees
group by employeeID
having salary > 50000;

-- Find months with more than two orders. 
select * from Orders;
select month(OrderDate) as month, count(*) as totalOrders from Orders
group by OrderDate
having TotalOrders > '2';

select * from Orders;
select OrderDate, count(OrderDate) as OrderDate from Orders
group by OrderDate
having OrderDate > '2';

SELECT 
  DATE_FORMAT(OrderDate, '%Y-%M') AS Month,
  COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Month
HAVING TotalOrders > 2;

 
-- ORDER BY Clause: 
-- Retrieve employee names ordered by salary in descending order.
select * from employees;
select * from employees
order by name, salary desc;
-- Retrieve order dates ordered chronologically. 
select * from Orders;
select * from Orders
order by OrderDate asc;
-- Retrieve customer names ordered alphabetically. 
select * from customers;
select * from customers
order by name asc;
 

-- Retrieve order IDs and their corresponding customer names.
select * from orders;
select * from customers;
select orderid, name from Orders
join customers
 on Orders.customerID = customers.customerID;

-- Retrieve customer names and their corresponding cities. 
select * from customers;
select Name, City from customers;
 
-- DISTINCT Clause: 
-- Retrieve unique positions of employees.
select * from employees;
select distinct position from employees;

-- Retrieve unique cities of customers. 
select * from customers;
select distinct city from customers;

-- Retrieve unique order dates.
select * from Orders;
select distinct OrderDate from Orders;
 
 
-- Combine results to retrieve employee names and positions.
SELECT * from employees;
select name, position from employees;

-- Combine results to retrieve customer names and cities. 
select * from customers;
select name, city from customers;

-- Combine results to retrieve order IDs and total amounts 
select * from orders;
select OrderID, TotalAmount from Orders;




