# 🛒 Olist E-Commerce Sales Analysis using SQL

## 📌 Project Overview

This project analyzes the **Olist Brazilian E-Commerce Dataset** using **PostgreSQL** to uncover business insights related to sales, customers, products, sellers, and order performance.

The objective is to demonstrate real-world SQL skills by performing **data preparation, exploratory data analysis (EDA), KPI development, and business analysis** to support data-driven decision making.

---

# 🎯 Business Objective

The goal of this project is to help the business answer important questions such as:

* Which products generate the highest revenue?
* Which product categories contribute the most to sales?
* Who are the top-performing sellers?
* Who are the highest-value customers?
* How has revenue changed over time?
* Which states generate the highest revenue?
* How efficient is the delivery process?

---

# 📂 Dataset

**Dataset:** Olist Brazilian E-Commerce Dataset

### Tables Used

* Customers
* Orders
* Order Items
* Products
* Sellers

---

# 🛠️ Tools Used

* PostgreSQL
* SQL
* VS Code
* Git
* GitHub

---

# 📋 Project Workflow

### 1. Data Preparation

* Created database
* Imported CSV files into PostgreSQL
* Verified data types
* Checked data quality

---

### 2. Data Cleaning

* Checked duplicate records
* Identified NULL values
* Handled missing product categories
* Validated order and delivery dates
* Reviewed data consistency

---

### 3. Exploratory Data Analysis (EDA)

Performed initial exploration including:

* Total Orders
* Total Customers
* Total Products
* Total Sellers
* Total Revenue
* Average Order Value
* Revenue Distribution
* Order Status Distribution
* Monthly Order Volume
* Customer Distribution by State

---

### 4. KPI Development

Developed key business KPIs including:

* Total Revenue
* Average Order Value
* Total Orders
* Total Customers
* Total Sellers
* Total Products

---

# 📊 Business Analysis

## Product Analysis

* Top 10 Products by Revenue
* Top Product Categories by Revenue
* Product Category Contribution to Total Revenue

---

## Seller Analysis

* Top 10 Sellers by Revenue
* Seller Contribution to Total Revenue
* Top Sellers by Number of Orders

---

## Revenue Analysis

* Monthly Revenue Trend
* Revenue by Customer State

---

## Customer Analysis

* Top 10 Customers by Spending
* Repeat Customer Analysis

---

## Order & Delivery Analysis

* Order Status Distribution
* Average Delivery Time
* Late Delivery Analysis

---

# 📈 Key Insights

* Revenue is concentrated among a small number of product categories.
* Top sellers contribute a significant portion of total sales.
* A small percentage of customers are repeat buyers.
* Revenue varies across states, with some regions contributing significantly more than others.
* Most orders are successfully delivered, indicating efficient order fulfillment.
* Delivery performance can be monitored by comparing actual and estimated delivery dates.

---

# 💼 Business Recommendations

* Prioritize inventory for high-performing product categories.
* Strengthen relationships with top-performing sellers.
* Introduce customer loyalty programs to improve repeat purchases.
* Increase marketing efforts in high-revenue regions.
* Improve logistics to reduce late deliveries.
* Develop promotional strategies for low-performing categories.

---

# 📁 Repository Structure

```
E_Commerce_Analysis/
│
├── Dataset/
│   ├── customers.csv
│   ├── orders.csv
│   ├── order_items.csv
│   ├── products.csv
│   └── sellers.csv
│
├── sql_queries/
│   ├── 01_data_preparation.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_eda.sql
│   ├── 04_kpi.sql
│   └── 05_business_analysis.sql
│
├── README.md
```

---

# 🚀 Skills Demonstrated

* SQL Joins
* Aggregate Functions
* Common Table Expressions (CTEs)
* Window Functions
* Date Functions
* GROUP BY & HAVING
* Business KPI Development
* Exploratory Data Analysis
* Business Analysis
* Data Cleaning
* Data Preparation

---

# 📌 Conclusion

This project demonstrates how SQL can be used to transform raw e-commerce data into meaningful business insights. Through data preparation, cleaning, EDA, KPI development, and business analysis, the project provides actionable recommendations to improve sales performance, customer retention, seller management, and operational efficiency.
