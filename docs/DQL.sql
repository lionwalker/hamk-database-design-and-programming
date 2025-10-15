-- -----------------------------------------------------
-- Schema online_shop
-- -----------------------------------------------------
USE `online_shop`;

-- -----------------------------------------------------
-- Total Spend Per Customer
-- -----------------------------------------------------
SELECT 
	c.id AS customer_id, 
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	ROUND(SUM(o.total), 2) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, customer_name
ORDER BY total_spent DESC;

-- -----------------------------------------------------
-- 5 Top-Selling Products
-- -----------------------------------------------------
SELECT 
	p.id AS product_id, 
    p.name, 
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name
ORDER BY units_sold DESC
LIMIT 5;

-- -----------------------------------------------------
-- Orders Placed in the Last 30 Days
-- -----------------------------------------------------
SELECT 
	o.id AS order_id, 
    o.created_at, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE o.created_at >= CURRENT_DATE - INTERVAL 30 DAY;

-- -----------------------------------------------------
-- Average Order Value Per Customer
-- -----------------------------------------------------
SELECT 
	c.id AS customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	ROUND(AVG(o.total), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, customer_name;

-- -----------------------------------------------------
-- Customers Without Orders
-- -----------------------------------------------------
SELECT 
	c.id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.id
);

-- -----------------------------------------------------
-- Product Inventory Value by Subcategory
-- -----------------------------------------------------
SELECT 
	sc.name AS sub_category, 
    ROUND(SUM(p.quantity * p.price), 2) AS inventory_value
FROM sub_categories sc
JOIN products p ON sc.id = p.sub_category_id
GROUP BY sc.name
ORDER BY inventory_value DESC;

-- -----------------------------------------------------
-- Orders with Delayed Shipments
-- -----------------------------------------------------
SELECT 
	o.id AS order_id, 
    s.status, 
    s.tracking_number
FROM orders o
JOIN shipments s ON o.id = s.order_id
WHERE s.status IN ('pending', 'in-transit');

-- -----------------------------------------------------
-- Refunded Payments with Customer Info
-- -----------------------------------------------------
SELECT 
	p.id AS payment_id, 
	p.amount, 
    c.email, 
    o.id AS order_id
FROM payments p
JOIN orders o ON p.order_id = o.id
JOIN customers c ON o.customer_id = c.id
WHERE p.status = 'refunded';

-- -----------------------------------------------------
-- Subcategories with No Products
-- -----------------------------------------------------
SELECT 
	sc.id, 
    sc.name
FROM sub_categories sc
WHERE NOT EXISTS (
    SELECT 1 FROM products p WHERE p.sub_category_id = sc.id
);

-- -----------------------------------------------------
-- Most Recent Order Per Customer
-- -----------------------------------------------------
SELECT 
	o.id AS order_id, 
    o.customer_id, 
    o.created_at
FROM orders o
WHERE o.created_at = (
    SELECT MAX(o2.created_at)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
);

-- -----------------------------------------------------
-- Customers Who Placed More Than 2 Orders
-- -----------------------------------------------------
SELECT 
	c.id AS customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	COUNT(o.id) AS order_count
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, customer_name
HAVING COUNT(o.id) > 2;

-- -----------------------------------------------------
-- Products with Total Sales Value Over €1000
-- -----------------------------------------------------
SELECT 
	p.id AS product_id, 
    p.name,
	ROUND(SUM(oi.total), 2) AS total_sales
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name
HAVING SUM(oi.total) > 1000;