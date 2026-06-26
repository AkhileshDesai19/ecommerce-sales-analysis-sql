-- 1. Which 10 products generated the highest revenue?
SELECT p.product_id, product_category_name, SUM(oi.price) AS revenue_gen
FROM products AS p JOIN order_items AS oi 
ON p.product_id = oi.product_id
GROUP BY (p.product_id)
ORDER BY revenue_gen DESC LIMIT 10;
-- The top 10 products generated the highest revenue, indicating they are 
-- the company's strongest revenue drivers. These products should be 
-- prioritized for inventory management, marketing campaigns, and demand
-- forecasting.

-- 2. Which product categories generate the highest revenue?
SELECT p.product_category_name,
SUM(oi.price) AS highest_revenue
FROM products AS p JOIN order_items AS oi 
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY highest_revenue DESC LIMIT 5 ;
-- The top 5 product categories contribute the largest share of total
-- revenue, indicating that customer demand is concentrated in these
-- categories. These categories should be prioritized for inventory planning,
-- marketing campaigns, and sales promotions.


-- 3. Which product categories contribute the highest percentage of total revenue?
WITH total_revenue AS (
    SELECT SUM(price) AS total_revenue
    FROM order_items
)

SELECT
    p.product_category_name,
    SUM(oi.price) AS category_revenue,
    ROUND(
        (SUM(oi.price) * 100.0) / tr.total_revenue,
        2
    ) AS contribution_percentage
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
CROSS JOIN total_revenue tr
GROUP BY p.product_category_name, tr.total_revenue
ORDER BY category_revenue DESC;
-- A small number of product categories contribute a significant share
-- of the company's total revenue, indicating that sales are concentrated
-- in these categories. These categories should be prioritized for inventory
-- planning, marketing campaigns, and product availability.


-- 4. Which 10 sellers generated the highest revenue?
SELECT s.seller_id,
SUM(oi.price) AS highest_revenue
FROM order_items AS oi JOIN sellers AS s
ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
ORDER BY highest_revenue DESC LIMIT 10;
-- The top 10 sellers generate the highest revenue, indicating that a 
-- small group of sellers contributes significantly to overall business 
-- performance. These sellers should be prioritized through strong
-- partnerships, performance incentives, and inventory support to 
-- maintain revenue growth.


-- 5. Which sellers contribute the highest percentage of total revenue?
WITH total_revenue AS (
SELECT SUM(price) AS total_revenue
FROM order_items
)
SELECT s.seller_id,
SUM(oi.price) AS seller_revenue,
 ROUND(
        (SUM(oi.price) * 100.0) / tr.total_revenue,
        2
    ) AS contribution_percentage
FROM sellers AS s JOIN order_items AS oi
ON s.seller_id = oi.seller_id
CROSS JOIN total_revenue AS tr
GROUP BY s.seller_id,tr.total_revenue
ORDER BY seller_revenue DESC;
-- A relatively small number of sellers contribute a significant 
-- percentage of the company's total revenue. This indicates that the
-- business relies heavily on top-performing sellers. Maintaining strong
-- relationships with these sellers while improving the performance of 
-- lower-contributing sellers can help reduce business risk and support
-- sustainable growth.

-- 6. Which 10 sellers have fulfilled the highest number of orders?
SELECT seller_id, COUNT(DISTINCT order_id) AS total_orders_fullfilled
FROM order_items 
GROUP BY seller_id
ORDER BY total_orders_fullfilled DESC LIMIT 10;
-- The top 10 sellers processed the highest number of unique orders, 
-- indicating strong sales performance and operational efficiency.
-- These sellers play a key role in fulfilling customer demand and 
-- should be supported to maintain service quality.

--7. How has monthly revenue changed over time?
SELECT 
TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month_name,
SUM(oi.price) AS total_revenue
FROM order_items AS oi JOIN orders AS o ON 
oi.order_id = o.order_id
GROUP BY month_name
ORDER BY month_name DESC;
-- Revenue fluctuates across months, with certain months generating 
-- significantly higher sales than others. Identifying the factors behind 
-- these peak periods can help the business plan future marketing and 
-- inventory strategies.

-- 8. Which states generate the highest revenue?
SELECT c.customer_state, 
SUM(oi.price) AS highest_revenue
FROM order_items AS oi JOIN orders AS o
ON oi.order_id = o.order_id
JOIN customers AS c ON c.customer_id =o.customer_id
GROUP BY c.customer_state
ORDER BY highest_revenue DESC LIMIT 5;
-- The state of SP generates the highest revenue, indicating 
-- it is the company's strongest market. Revenue is concentrated in
-- a few states, suggesting that expanding marketing efforts in 
-- high-performing regions while improving sales in lower-performing 
-- states could increase overall business growth.

-- 9. Who are the Top 10 customers by total spending?
SELECT c.customer_unique_id, SUM(oi.price) AS total_spend
FROM order_items AS oi JOIN orders AS o
ON oi.order_id = o.order_id
JOIN customers AS c on c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_spend DESC LIMIT 10;
-- The top 10 customers account for the highest spending on the 
-- platform, making them high-value customers. Targeted loyalty programs,
-- personalized recommendations, and retention campaigns can help maximize
-- long-term revenue from these customers.

-- 10. How many customers placed more than one order?
WITH repeat_customer AS (
SELECT c.customer_unique_id, COUNT(order_id) AS count_orders
FROM orders AS o JOIN customers AS c
ON o.customer_id = c.customer_id
GROUP BY  c.customer_unique_id
HAVING COUNT(order_id) > 1
)
SELECT COUNT(*) AS count_of_repeat_customer
FROM repeat_customer;
-- Out of all customers, 2,997 placed more than one order, indicating 
-- a relatively small but valuable group of repeat customers. Improving
-- customer retention through loyalty programs, personalized promotions,
-- and post-purchase engagement could increase repeat purchases and
-- long-term revenue.

--  11. How are orders distributed across different order statuses
-- (Delivered, Canceled, Shipped, Processing, etc.)?

SELECT order_status, COUNT(order_status)
AS count_of_status FROM orders
GROUP BY order_status
ORDER BY count_of_status DESC;
-- Most orders were successfully delivered, indicating efficient order
-- fulfillment. Canceled, unavailable, and processing orders represent only
-- a small proportion of total orders, suggesting that the order 
-- fulfillment process is generally reliable. However, reducing canceled 
-- and unavailable orders could further improve customer satisfaction.

-- 12. What is the average number of days taken to deliver an order?
SELECT
    ROUND(
        AVG(order_delivered_customer_date::date - order_purchase_timestamp::date),
        2
    ) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- The average delivery time indicates how efficiently orders are 
-- fulfilled. A lower average delivery time generally reflects better
-- logistics performance and a better customer experience.


-- 13. How many orders were delivered after the estimated delivery date?
SELECT
    COUNT(*) AS late_deliveries
FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;

-- Orders delivered after the estimated delivery date may negatively
-- impact customer satisfaction. Monitoring and reducing late deliveries
-- can improve customer trust and overall service quality.

