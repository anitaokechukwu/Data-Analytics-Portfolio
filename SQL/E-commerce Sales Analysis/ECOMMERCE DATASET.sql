CREATE DATABASE ecommerce; 
USE ecommerce; 
 
-- Create Products Table 
CREATE TABLE products ( 
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(255), 
    category VARCHAR(50), 
    price DECIMAL(10, 2) 
); 
 
-- Create Orders Table 
CREATE TABLE orders ( 
    order_id INT PRIMARY KEY, 
    product_id INT, 
    quantity INT, 
    total_price DECIMAL(10, 2), 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
); 
-- Insert Sample Data into Products Table 
INSERT INTO products (product_id, product_name, category, price) 
VALUES 
    (1, 'Laptop', 'Electronics', 1200.00), 
    (2, 'T-Shirt', 'Apparel', 25.00), 
    (3, 'Bookshelf', 'Furniture', 350.00), 
    (4, 'Sneakers', 'Footwear', 80.00); 
 
-- Insert Sample Data into Orders Table 
INSERT INTO orders (order_id, product_id, quantity, total_price) 
VALUES 
    (101, 1, 2, 2400.00), 
    (102, 2, 5, 125.00), 
    (103, 4, 3, 240.00), 
    (104, 3, 1, 350.00); 
    
    
-
