## E-Commerce Sales Analysis
Project Objective

Analyze e-commerce sales data to identify customer behavior, sales trends, product performance, seller performance, and revenue-generating opportunities.

# Business Goals
1.Measure overall business performance.
2.Identify top-performing products.
3.Identify top-performing sellers.
4.Analyze customer purchasing behavior.
5.Discover sales trends over time.
6.Determine regional sales performance.
7.Identify high-value customers.
8.Generate actionable business insights.

Phase 1: Data Preparation
Tasks
Import CSV files into PostgreSQL.
Check data types.
Handle missing values.
Detect duplicates.
Validate relationships between tables.
Create required tables.

Phase 2: Data Modeling

Create:

Fact Table
fact_orders
Dimension Tables
dim_customers
dim_products
dim_sellers
dim_payments
dim_location

Create relationships between fact and dimension tables.

Phase 3: Exploratory Data Analysis (EDA)

Questions
Total number of orders.
Total customers.
Total products.
Total sellers.
Total revenue.
Average order value.
Revenue distribution.
Order status distribution.
Monthly order volume.
Customer distribution by state.

Phase 4: KPI Development

KPIs
Total Revenue
Total Orders
Total Customers
Average Order Value
Revenue Per Customer
Revenue Per Seller
Monthly Revenue Growth

{One improvement I'd make
After every analysis query, write:
Business Question
Which state generates the highest revenue?
SQL Query
(your query)
Insight
Karnataka generated the highest revenue.
Recommendation
Increase marketing spend and seller acquisition in Karnataka.}

This makes your project look more like business analytics rather than just SQL practice.

Phase 5: Business Analysis

# Customer Analysis
Top 10 customers by spending.
Customers with highest order frequency.
Customer distribution by state.
Repeat customer analysis.

# Product Analysis
Top 10 products by revenue.
Top product categories.
Lowest-performing products.
Product category contribution.

# Seller Analysis
Top sellers by revenue.
Seller ranking.
Seller contribution percentage.

# Revenue Analysis
Revenue by month.
Revenue by state.
Revenue by city.
Peak sales periods.

# Order Analysis
Orders by weekday.
Orders by month.
Order status analysis.
Cancellation analysis.


# Github Repo
README.md
Business_Requirements.md

dataset/

sql_scripts/
├── 01_data_preparation.sql
├── 02_eda.sql
├── 03_kpi_analysis.sql
├── 04_business_analysis.sql
├── 05_advanced_analysis.sql

screenshots/