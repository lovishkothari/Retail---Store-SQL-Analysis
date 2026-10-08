# 🛒 Retail Store SQL Analysis

##  Project Overview

This project is a **MySQL Retail Store Database Project** designed to demonstrate database creation, table relationships, constraints, data insertion, and SQL querying.

The project contains multiple related tables representing customers, products, orders, order items, payments, and product reviews.

##  Database Structure

The database includes the following tables:

-  **Customers** – Stores customer information
-  **Products** – Stores product details, prices, and stock
-  **Orders** – Stores customer order information
-  **Order Items** – Stores products included in each order
-  **Payments** – Stores payment information
-  **Product Reviews** – Stores customer reviews and ratings

##  Relationships

The database uses **Primary Keys and Foreign Keys** to establish relationships between tables.

Main relationships include:

- Customers → Orders
- Orders → Order Items
- Products → Order Items
- Orders → Payments
- Products → Product Reviews
- Customers → Product Reviews

##  SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- AUTO_INCREMENT
- UNIQUE constraints
- NOT NULL constraints
- CHECK constraints
- DEFAULT values
- INSERT statements
- SELECT queries
- COUNT functions
- Table relationships

##  Project Files

| File | Description |
|---|---|
| `SQL_MINI_PROJECT.sql` | Database and table creation, constraints, relationships, and basic queries |
| `DataInsertionQueries.sql` | SQL INSERT statements used to populate the database |
| `SQL_Mini_Project.pdf` | Project questions, requirements, and/or query solutions |
| `README.md` | Project documentation |

##  Project Objectives

- Create a structured relational database
- Understand database design and table relationships
- Practice primary and foreign keys
- Insert and manage relational data
- Write SQL queries for retrieving information
- Strengthen MySQL database skills

##  Tools & Technologies

- **MySQL**
- **SQL**
- Relational Database Concepts

##  Key Learning Outcomes

Through this project, I practiced:

- Designing a relational database
- Creating interconnected tables
- Maintaining data integrity using constraints
- Working with multiple related tables
- Writing SQL queries
- Managing and analyzing retail store data

##  Author

**Lovish Kothari**



---

⭐ If you find this project useful, feel free to explore the SQL files and project documentation.
