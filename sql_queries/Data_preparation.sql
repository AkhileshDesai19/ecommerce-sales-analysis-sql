--  Data Preparation
--  cleaning a data



--                         1. customers

-- Checking null values
SELECT * FROM customers;

SELECT * FROM customers 
WHERE customer_id IS NULL;

SELECT
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_id,
SUM(CASE WHEN customer_unique_id IS NULL THEN 1 ELSE 0 END) AS null_un_id,
SUM(CASE WHEN customer_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS null_zip,
SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS null_city,
SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END)AS null_state
FROM customers;
--  No null values are present in any column

 --------------------------------------------------------------
 
-- Blank or empty strings
SELECT * FROM customers
WHERE customer_city = '' OR customer_state = '';
--  No any blank string present

------------------------------------------------------------

--  Duplicate detection

-- indvidual check
SELECT customer_id, COUNT(*) AS count_id FROM customers
GROUP BY customer_id HAVING COUNT(*) =1;

SELECT customer_id,customer_unique_id,customer_zip_code_prefix,
customer_city,customer_state, COUNT(*) AS count_data
FROM customers
GROUP BY customer_id,customer_unique_id,customer_zip_code_prefix,
customer_city,customer_state
HAVING COUNT(*) > 1;
-- No duplicate detetcted


--  Now let check a duplicates by using window Function 

-- Created a window function and given row number
SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id,customer_unique_id,customer_zip_code_prefix,
customer_city,customer_state ORDER BY (SELECT NULL)) AS Row_Num
FROM customers;

-- Created  a CTE function and window function is used init
WITH CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id,customer_unique_id,customer_zip_code_prefix,
customer_city,customer_state ORDER BY (SELECT NULL)) AS Row_Num
FROM customers
)
SELECT * FROM CTE
WHERE Row_Num > 1;

--  No Duplicates are presnt in this table

------------------------------------------------------------------

-- Checking Distinct vlaues
SELECT DISTINCT customer_city FROM customers;

------------------------------------------------------------------

-- Customers Table Findings:
-- No null values found.
-- No duplicate customer_id values found.
-- Data quality is good and suitable for analysis.


------------------------------------------------------------------
 --                2. orders
 SELECT * FROM orders;

 -- 1. Checking Null Vlaues
 SELECT * FROM orders                -- No Null
 WHERE customer_id IS NULL;

 SELECT * FROM orders                      -- No Null
 WHERE order_id IS NULL;

 SELECT * FROM orders              -- No Null
 WHERE order_status IS NULL;

 SELECT * FROM orders                   -- No Null
 WHERE order_purchase_timestamp IS NULL;

 SELECT * FROM orders
 WHERE order_approved_at IS NULL;   -- 160 null

 SELECT * FROM orders
 WHERE order_delivered_carrier_date IS NULL; -- 1783

 SELECT * FROM orders
 WHERE order_delivered_customer_date IS NULL; -- 2965

 SELECT * FROM orders
 WHERE order_estimated_delivery_date IS NULL; -- No Null

-- Dealing with nulls 

-- FOR  order_delivered_customer_date value is null
 SELECT order_status,
 COUNT(*)
FROM orders
WHERE order_delivered_customer_date IS NULL
GROUP BY order_status;

SELECT * FROM orders
WHERE order_status = 'delivered'
AND  order_delivered_customer_date IS NULL;
--Data Quality Observation:
--8 orders were marked as 'delivered' but had NULL values in
--order_delivered_customer_date. These records were retained
--because the correct delivery date could not be inferred reliably.

--------------------
-- for order_delivered_carrier_date only 2 records where deliverd so ignore
SELECT order_status,
COUNT(*)
FROM orders
WHERE order_delivered_carrier_date IS NULL
GROUP BY order_status;
--------------------------------------
--  order_approved_at 
SELECT order_status,
COUNT(*) FROM orders
WHERE order_approved_at IS NULL
GROUP BY order_status;
Orders Table Findings

--146 NULL values found in order_approved_at.
-- 141 records belonged to canceled orders.
-- 5 records belonged to created orders.
-- 14 records belonged to delivered orders.
-- The NULL values for canceled and created orders
-- were considered valid business events.
-- The 14 delivered orders with missing approval timestamps were 
-- identified as data quality issues and retained without modification.
---------------------------------------------------------------

SELECT * FROM orders;


--                        Checking duplicates

SELECT customer_id,
order_id,
order_status, 
order_purchase_timestamp, 
order_approved_at, 
order_delivered_carrier_date, 
order_delivered_customer_date, 
order_estimated_delivery_date ,
COUNT(*) AS count_id
FROM orders
GROUP BY customer_id,
order_id,
order_status, 
order_purchase_timestamp, 
order_approved_at, 
order_delivered_carrier_date, 
order_delivered_customer_date, 
order_estimated_delivery_date 
HAVING COUNT(*) > 1;

--  No duplicates are presnt in orders Table

--  Checking Duplicates by CTE + Window Functions

SELECT *,
 ROW_NUMBER() OVER(PARTITION BY customer_id,
order_id,
order_status, 
order_purchase_timestamp, 
order_approved_at, 
order_delivered_carrier_date, 
order_delivered_customer_date, 
order_estimated_delivery_date ORDER BY (SELECT NULL)
) AS row_num
FROM orders;


WITH CTE AS (
SELECT *,
 ROW_NUMBER() OVER(PARTITION BY customer_id,
order_id,
order_status, 
order_purchase_timestamp, 
order_approved_at, 
order_delivered_carrier_date, 
order_delivered_customer_date, 
order_estimated_delivery_date ORDER BY (SELECT NULL)
) AS row_num
FROM orders
)
SELECT * FROM CTE
WHERE row_num > 1;

--  Proved that no duplicates present in table
-------------------------------------------------------

SELECT * FROM orders;

--   finding Distinct Values
SELECT DISTINCT order_status FROM orders;

-- Orders Table Findings:
-- No null values found.
-- No duplicate customer_id values found.
-- Data quality is good and suitable for analysis.

--------------------------------------------------------



