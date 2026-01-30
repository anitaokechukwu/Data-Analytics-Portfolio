# E-commerce Sales Analysis (SQL)

##  Project Overview
This project analyzes a simple **E-commerce database** using **SQL** 
to extract meaningful business insights from product and order data.  
The analysis focuses on understanding product pricing, order behavior, and revenue performance.

The database consists of two tables:
- **products** – stores product details
- **orders** – stores customer order information

This project demonstrates core SQL skills such as filtering, aggregation, joins, and subqueries.

---

## 🗂️ Database Schema

### Products Table
| Column Name   | Data Type        | Description |
|--------------|------------------|-------------|
| product_id   | INT (PK)         | Unique product ID |
| product_name | VARCHAR(255)     | Product name |
| category     | VARCHAR(50)      | Product category |
| price        | DECIMAL(10,2)    | Product price |

### Orders Table
| Column Name  | Data Type        | Description |
|-------------|------------------|-------------|
| order_id    | INT (PK)         | Unique order ID |
| product_id  | INT (FK)         | Linked product |
| quantity    | INT              | Quantity ordered |
| total_price | DECIMAL(10,2)    | Total order value |

---

##  Objectives
- Retrieve and explore product data
- Analyze order volume and revenue
- Identify high-value products and orders
- Practice SQL joins and aggregations

---

##  Key SQL Analysis Performed

- Retrieve all products
- Count total number of orders
- Filter products above a price threshold
- Join orders and products to view order details
- Calculate total revenue
- Find average product price
- Identify highest-priced product
- Identify highest-value order
- Filter orders above a revenue threshold

---

##  Tools Used
- **MySQL**
- SQL (SELECT, WHERE, JOIN, GROUP BY, SUBQUERIES)

---

## 📁 Project Structure
