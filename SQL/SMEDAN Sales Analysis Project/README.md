# SMEDAN Sales Analysis Project (Sweden Sales Dataset)

## Overview
This project analyzes sales transaction data using **MySQL** to uncover 
business insights related to customer behavior, product performance, 
sales channels, and revenue trends over time.

The analysis focuses on answering real-world business questions 
using **SQL querying techniques**, including filtering,
aggregation, joins, window functions, and subqueries.  
It demonstrates how structured query logic can support 
data-driven decision-making in sales and retail environments.

---

## Dataset Description

The project is built on two core tables:

### Product Table
Stores product-level information:
- Product_ID
- Product_Name
- Brand
- Unit of Measure (UoM)

### Sales Table
Contains transaction-level sales records:
- Sales_ID
- Product_ID (Foreign Key)
- Customer_Name
- Location
- Salesperson
- Customer_Type (Hotel, Restaurant, Retail, Corporate)
- Date
- Quantity
- Value_in_Rupiah

---

## Key Business Questions Answered

- Which sales transactions have values above a specified threshold?
- How do sales rank based on transaction value?
- What are the most recent customer transactions?
- Which customer types generate the highest total sales value?
- Which products contribute the most to overall revenue?
- How does salesperson performance vary across years?
- What are the total, average, maximum, and minimum sales values?
- How do sales quantities and values change year over year?

---

## SQL Techniques Used

- `SELECT`, `WHERE`, `ORDER BY`
- Aggregate functions: `SUM()`, `AVG()`, `MAX()`, `MIN()`, `COUNT()`
- `GROUP BY` and `HAVING`
- `JOIN` (Sales ↔ Product)
- Subqueries
- Window Functions: `RANK() OVER()`
- Date functions: `YEAR()`, `BETWEEN`

---

## Project Structure

