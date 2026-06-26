--  KPI Development

-- 1. Top 10 products by revenue
SELECT 
product_id,
SUM(price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;

-- 2. Top sellers
SELECT 
seller_id,
SUM(price) AS Total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC LIMIT 10;

-- 3. Delivery time analysis
SELECT
    AVG(order_delivered_customer_date - order_purchase_timestamp) AS avg_delivery_time
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- 4. Late delivery rate
SELECT
    COUNT(*) FILTER (
        WHERE order_delivered_customer_date > order_estimated_delivery_date
    ) * 100.0 / COUNT(*) AS late_delivery_percent
FROM orders;

-- 5. Revenue by month 

SELECT
    TO_CHAR(o.order_purchase_timestamp,'YYYY-MM') AS month,
    SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;
