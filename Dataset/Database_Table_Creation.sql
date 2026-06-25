--                        E-Commerce Sales Analysis
-- Datbase Created manually - ecommerce_analysis
-- Tables Created and imported a data from csv files 
--  Creating a Tables 
-- 1. Customer table

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

SELECT * FROM customers;

-- 2. orders Table
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

SELECT * FROM orders;

-- 3. order_items Table
CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),

    PRIMARY KEY (order_id, order_item_id)
);

SELECT * FROM order_items;


-- 4. Products Table
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- 5. Seller 
CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);


-- Imported a Csv files for each tables 
-- Now let go through a data of each table

SELECT * FROM customers; -- customer_id,customer_city,customer_state

SELECT * FROM orders; -- order_id,customer_id,order_status,time Related info

SELECT * FROM products; -- product_id,product_category_name

SELECT * FROM sellers; -- seller_id,seller_city,seller_state

SELECT * FROM order_items; -- order_id,order_item_id,product_id,seller_id,price,shipping_date


-- Now Adding PRIMARY KEY AND FOREIGN KEY to each tables
-- 1. for orders
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

-- 2. For order_items - order_id
ALTER TABLE order_items
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- 3. product_id
ALTER TABLE order_items
ADD CONSTRAINT fk_products
FOREIGN KEY(product_id) REFERENCES products(product_id);

--  4. seller_id
ALTER TABLE order_items
ADD CONSTRAINT fk_order_item
FOREIGN KEY(seller_id) REFERENCES sellers(seller_id);