# 📘 Online Book Store – SQL Project

This project is an end-to-end SQL case study built using **MySQL**.  
It simulates the operations of an **online bookstore**, including books, customers, and orders data.  
The goal of this project is to practice database creation, data import, joins, subqueries, aggregations, and analytical SQL queries.

---

## 🗂 Project Structure
The project includes:

- **Database Creation**
- **Table Schema Design**
- **Primary & Foreign Keys**
- **Data Import (CSV → MySQL)**
- **20 SQL Queries** covering:
  - Filtering  
  - Joins  
  - Aggregations  
  - Subqueries  
  - Group By & Having  
  - Sorting  
  - Data analysis tasks  

You will find all SQL code inside the file:  
📄 **Project 1 Complete.sql**

---

## 🛠 Tech Stack
- **MySQL 8+**
- **MySQL Workbench**
- CSV data files (Books, Customers, Orders)

---

## 🗃 Database Schema

### 1. Books Table
| Column          | Type           |
|-----------------|----------------|
| Book_ID         | INT (PK)       |
| Title           | VARCHAR(100)   |
| Author          | VARCHAR(100)   |
| Genre           | VARCHAR(50)    |
| Published_Year  | INT            |
| Price           | DECIMAL(10,2)  |
| Stock           | INT            |

### 2. Customers Table
| Column        | Type            |
|---------------|-----------------|
| Customer_ID   | INT (PK)        |
| Name          | VARCHAR(100)    |
| Email         | VARCHAR(100)    |
| Phone         | VARCHAR(15)     |
| City          | VARCHAR(50)     |
| Country       | VARCHAR(150)    |

### 3. Orders Table
| Column        | Type                 |
|---------------|----------------------|
| Order_ID      | SERIAL (PK)          |
| Customer_ID   | INT (FK → Customers) |
| Book_ID       | INT (FK → Books)     |
| Order_Date    | DATE                 |
| Quantity      | INT                  |
| Total_Amount  | DECIMAL(10,2)        |

---

## 📥 Data Import
Data is loaded using:

```sql
LOAD DATA LOCAL INFILE 'path/to/file.csv'
INTO TABLE table_name
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

---

## 📊 SQL Questions Answered

This project covers 20 SQL challenges such as:

01. Retrieve all books in a specific genre

02. Find books published after a certain year

03. List customers from a specific country

04. Show November 2023 orders

05. Calculate total stock

06. Find the most expensive book

07. List customers who ordered more than 1 unit

08. Orders with total amount > $20

09. List all unique genres

10. Find book with lowest stock

11. Calculate total revenue

12. Quantity sold per genre

13. Average price in “Fantasy” genre

14. Customers with at least 2 orders

15. Most frequently ordered book

16. Top 3 most expensive Fantasy books

17. Total units sold per author

18. Cities of customers who spent > $30

19. Customer who spent the most

20. Stock remaining after fulfilling all orders

All queries are included and well-formatted in the main SQL file.

---

## 📈 Key SQL Concepts Demonstrated

- `JOIN`, `LEFT JOIN`
- `GROUP BY`, `HAVING`
- `ORDER BY`
- `DISTINCT`
- `BETWEEN`, `IN`
- `MAX()`, `MIN()`, `SUM()`, `AVG()`
- `COALESCE()`
- Subqueries
- Aggregate filtering

---

## ✔️ What I Learned

- Designing a relational database schema  
- Loading CSV data efficiently into MySQL  
- Setting up primary and foreign key constraints  
- Writing analytical and business-oriented SQL queries  
- Combining data using joins  
- Using aggregate functions to extract insights  
- Calculating metrics like revenue, order frequency, and stock remaining  

---
