# 🍽️ Swiggy SQL Project

## 📌 Project Overview

The **Swiggy SQL Project** is an end-to-end SQL project that demonstrates the process of transforming raw transactional food delivery data into a structured **Data Warehouse** using a **Star Schema**.

The project begins with data cleaning and preprocessing, followed by dimensional modeling through the creation of **Fact** and **Dimension** tables. After loading the transformed data into the warehouse, various SQL analyses are performed to answer business-related questions and generate meaningful insights.

This project highlights practical SQL skills commonly used by **Data Analysts**, **Business Intelligence Analysts**, and **Data Warehouse Developers**.

---

# 🎯 Project Objectives

The primary objectives of this project are to:

- Design a **Star Schema** for analytical reporting.
- Clean and preprocess raw data.
- Remove duplicate records and handle missing values.
- Create Fact and Dimension tables.
- Load data using ETL techniques.
- Perform SQL-based business analysis.
- Practice analytical SQL concepts used in real-world projects.

---

# 🏗️ Data Warehouse Architecture

The project follows a **Star Schema** consisting of one Fact table and five Dimension tables.

## ⭐ Fact Table

| Table Name | Description |
|------------|-------------|
| **fact_orders** | Stores transactional data such as price, rating, rating count, and foreign keys to all dimensions. |

---

## 📂 Dimension Tables

| Table Name | Description |
|------------|-------------|
| **dim_date** | Stores date-related attributes such as year, month, week, and quarter. |
| **dim_location** | Stores state, city, and locality information. |
| **dim_restaurant** | Stores restaurant details. |
| **dim_category** | Stores food category information. |
| **dim_dish** | Stores dish names. |

---

# ⚙️ ETL Process

The following ETL (Extract, Transform, Load) steps were performed:

### 🔹 Extract

- Imported raw Swiggy dataset into MySQL.

### 🔹 Transform

- Removed duplicate records.
- Removed invalid or NULL values where required.
- Standardized the data.
- Created dimension tables from distinct values.

### 🔹 Load

- Loaded cleaned data into:
  - Dimension Tables
  - Fact Table

---

# 📊 SQL Analysis Performed

The project includes analytical SQL queries covering:

- Basic SQL
- Aggregate Functions
- GROUP BY
- HAVING
- INNER JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Running Totals
- Month-over-Month Analysis
- Revenue Analysis
- Business Insights

---

# 📈 Business Insights Generated

Some of the key analyses performed include:

- Total number of orders
- Average dish price
- Top-rated restaurants
- Highest-priced dishes
- Restaurant-wise revenue
- City-wise revenue
- Category-wise revenue
- Monthly order trends
- Running total of orders
- Month-over-month order growth
- Restaurant rankings
- Category performance analysis

---

# 🛠️ Technologies Used

- **MySQL 8.0**
- **SQL**
- **Git**
- **GitHub**

---

# 💡 Skills Demonstrated

This project demonstrates practical knowledge of:

- SQL Programming
- Data Cleaning
- Data Transformation
- ETL Process
- Data Warehouse Design
- Star Schema Modeling
- Analytical SQL
- Business Intelligence Reporting
- Query Optimization
- Window Functions
- CTEs
- Aggregate Functions

---

# 🎓 Learning Outcomes

Through this project, I gained hands-on experience in:

- Designing a relational data warehouse.
- Implementing a Star Schema.
- Creating Fact and Dimension tables.
- Performing ETL operations using SQL.
- Writing analytical SQL queries.
- Solving real-world business problems using SQL.
- Organizing a professional SQL project for GitHub.

---

# 🚀 Future Enhancements

The project can be extended by:

- Building an interactive **Power BI Dashboard**
- Creating KPI dashboards
- Performing trend and customer behavior analysis
- Automating the ETL pipeline
- Integrating additional datasets for deeper business insights

---

# 📌 Conclusion

This project demonstrates how raw transactional data can be transformed into a structured Data Warehouse to support business reporting and decision-making. It showcases practical SQL techniques, dimensional modeling, and analytical querying skills that are commonly used in modern data analytics and business intelligence workflows.