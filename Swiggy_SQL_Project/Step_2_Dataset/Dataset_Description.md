# 📊 Dataset Description

## 📌 Overview

This project uses a Swiggy food delivery dataset containing information about restaurants, dishes, pricing, ratings, and order dates. The dataset serves as the source for building a **Star Schema Data Warehouse** in MySQL, enabling analytical reporting and business intelligence.

The raw transactional data was cleaned, transformed, and loaded into dimension and fact tables following dimensional modeling principles.

---

# 📁 Dataset Information

| Attribute | Value |
|-----------|-------|
| Dataset Name | Swiggy Food Delivery Dataset |
| Database | MySQL |
| Schema Type | Star Schema |
| Source Table | `swiggy_data` |
| Number of Columns | 10 |

---

# 📋 Dataset Columns

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| `state` | VARCHAR | State where the restaurant is located |
| `city` | VARCHAR | City where the restaurant is located |
| `order_date` | DATE | Date when the order was placed |
| `restaurant_name` | VARCHAR | Name of the restaurant |
| `location` | VARCHAR | Restaurant locality or area |
| `category` | VARCHAR | Food category (e.g., North Indian, Chinese, Fast Food) |
| `dish_name` | VARCHAR | Name of the dish |
| `price` | DECIMAL | Selling price of the dish |
| `rating` | DECIMAL | Average customer rating |
| `rating_count` | INT | Total number of customer ratings |

---

# 🧹 Data Cleaning & Preprocessing

Before loading the data into the warehouse, the following preprocessing steps were performed:

- Removed duplicate records.
- Filtered out rows with NULL `order_date` values for the Date Dimension.
- Extracted unique values for dimension tables.
- Validated relationships before loading the Fact table.
- Structured the data into a Star Schema.

---

# 💡 Purpose of the Dataset

This dataset is used to demonstrate:

- Data Cleaning
- ETL Process
- Star Schema Design
- Data Warehouse Modeling
- SQL Query Writing
- Analytical SQL
- Business Intelligence Reporting

---

# 📌 Note

This dataset is intended for educational purposes to practice SQL, dimensional modeling, ETL processes, and business analytics using a Data Warehouse approach.