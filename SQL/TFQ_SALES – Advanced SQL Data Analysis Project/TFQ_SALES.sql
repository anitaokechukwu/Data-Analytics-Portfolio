

USE TFQ_sales; 
-- 1
-- Get the employee who earn above the average salary of all employee -- scalar subquery
select * from sales;
select * from employee;
select * from dept;

select avg(salary) as salary from employee;

select * from employee
where SALARY > (select avg(salary) as salary from employee);

-- Cte commom table expression. or with clause

# avg_sal = select avg(salary) as salary from employee)
with  avg_sal as (select avg(salary) as a_sal from employee)
select * from employee, avg_sal
where salary > a_sal;

-- 2
-- Get the employee who earns the highest in each department -- multiple rows subquery 
SELECT emp_ID, emp_NAME, DEPT_NAME, SALARY
FROM employee
WHERE (DEPT_NAME, SALARY) IN (
    SELECT DEPT_NAME, MAX(SALARY)
    FROM employee
    GROUP BY DEPT_NAME
);

-- find the department who do not have any employees -- single column multiple rows subquery
select distinct  dept_name from employee;
select dept_name from dept
where dept_name not in (select distinct  dept_name from employee);

-- Find the stores where sales is better than the average cost across all stores -- subquery in subquery (best case to use the WITH Clause)

select * from sales;
select avg(cost) from sales;
select store_name, sum(cost) as total_cost from sales
group by store_name;

-- 2

select avg(total_cost) as avg_cost from (
select store_name, sum(cost) as total_cost from sales
group by store_name
) as number_1_table;

-- Find the stores where sales is better than the average cost across all stores  -- subquery in subquery (best case to use the WITH Clause)
-- n0 3
select * from sales;
select store_name from sales;
select * from (
select store_name, sum(cost) as total_cost from sales
group by store_name ) as number_1_table
join 
(select avg(total_cost) as avg_cost from (select store_name, sum(cost) as total_cost from sales
group by store_name) as number_1_table) as number2_table
on total_cost > avg_cost; 
-- cte
with total_cost as (select store_name, sum(cost) as total_c from sales
group by store_name),
avg_cost as (select avg(total_c) as avg_c from total_cost)
select * from total_cost, avg_cost
where total_c > avg_c;


-- Fetch all employee details and add remarks to those who earn more than the average pay -- using a subquery in the Select Clause

SELECT  emp_ID, emp_NAME, DEPT_NAME, DEPT_NAME,     
CASE 
WHEN SALARY > (SELECT AVG(SALARY) FROM employee) THEN 'Above Average'
ELSE 'Average or Below'
END AS Remarks from employee;
 
-- Find the stores who have sold more units than the average units sold by all stores -- using Having clause

SELECT store_id, store_name, SUM(quantity) AS total_units_sold
FROM sales
GROUP BY store_id, store_name
HAVING SUM(quantity) > ( SELECT AVG(total_quantity)
FROM ( SELECT store_id, SUM(quantity) AS total_quantity from sales
GROUP BY store_id) AS avg_units );
			
	


