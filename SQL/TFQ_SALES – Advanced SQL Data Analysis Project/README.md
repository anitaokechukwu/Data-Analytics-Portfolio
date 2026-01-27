#  TFQ_SALES – Advanced SQL Data Analysis Project

##  Overview
The **TFQ_SALES** project demonstrates the application 
of **advanced SQL techniques** to analyze retail business data and generate actionable insights.  
The analysis focuses on **employee compensation**, **departmental structure**,
and **store sales performance**, using real-world business questions to drive decision-making.

This project highlights proficiency in **subqueries, Common Table Expressions (CTEs),
aggregate functions, conditional logic, and joins** for analytical reporting.

---

## 🗂 Dataset Description
The analysis is based on three relational tables:

### **employee**
- `emp_id`
- `emp_name`
- `dept_name`
- `salary`

Contains employee demographic and salary information.

### **dept**
- `dept_id`
- `dept_name`

Stores department-level details.

### **sales**
- `store_id`
- `store_name`
- `cost`
- `quantity`

Holds transaction-level sales data.

---

##  Key Business Questions & Analysis

###  Employee Performance & Salary Insights
- Identify employees earning **above the company-wide average salary**
- using scalar subqueries and CTEs.
- Determine the **highest-paid employee in each department** using multi-row subqueries.
- Classify employees as **Above Average** or **Average/Below** earners using
- subqueries within the `SELECT` clause.
- Detect **departments without assigned employees** using single-column subqueries.

###  Store Sales & Profitability
- Identify stores with **total sales cost above the average** across all
-  stores using nested subqueries and CTEs.
- Find stores that sold **more units than the average quantity sold** using the
-  `HAVING` clause with aggregate functions.

---

##  SQL Techniques Used
- **Subqueries:** Scalar, multiple-row, and correlated subqueries  
- **Common Table Expressions (CTEs):** Improved query readability and structure  
- **Aggregate Functions:** `AVG()`, `MAX()`, `SUM()` for analytical calculations  
- **Conditional Logic:** `CASE WHEN` for employee classification  
- **Joins:** Combined multiple tables and derived datasets for comprehensive analysis  

---

##  Key Insights
- A small group of employees earn significantly above the organizational average,
-  indicating salary concentration at senior or high-impact roles.
- Certain departments lack active employees, highlighting potential organizational or data integrity gaps.
- Several stores consistently outperform the average in both **sales cost** and **unit quantity**,
-  identifying them as top-performing outlets.
- Average-based comparisons reveal performance outliers that may not be visible using raw totals alone.

---

## 🛠 Skills Demonstrated
- Advanced SQL querying and optimization  
- Data aggregation and transformation  
- Business insight generation  
- Analytical problem-solving using real-world datasets  

---

##  Tools Used
- MySQL  
- SQL (Advanced Queries & Analysis)  
- GitHub for version control and project documentation  

---

##  Project Use Case
This project is suitable for:
- SQL Portfolio Demonstrations  
- Data Analyst / Business Analyst Roles  
- Interview Discussions on Advanced SQL Concepts  

---

##  Contact
If you’d like to discuss this project or collaborate, feel free to connect with me on **LinkedIn** or 
explore more projects on my **GitHub profile**.
