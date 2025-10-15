-- -----------------------------------------------------
-- Schema online_shop
-- -----------------------------------------------------
USE `online_shop`;

-- -----------------------------------------------------
-- Data for table `online_shop`.`customers`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`customers` (`id`, `first_name`, `last_name`, `phone`, `email`, `created_at`, `updated_at`) VALUES (1, 'Aino', 'Virtanen', '+358401234567', 'aino.v@example.com', NOW(), NOW());
INSERT INTO `online_shop`.`customers` (`id`, `first_name`, `last_name`, `phone`, `email`, `created_at`, `updated_at`) VALUES (2, 'Elias', 'Niemi', '+358409876543', 'elias.n@example.com', NOW(), NOW());
INSERT INTO `online_shop`.`customers` (`id`, `first_name`, `last_name`, `phone`, `email`, `created_at`, `updated_at`) VALUES (3, 'Sanna', 'Korhonen', '+358408765432', 'sanna.k@example.com', NOW(), NOW());

-- -----------------------------------------------------
-- Data for table `online_shop`.`addresses`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`addresses` (`id`, `type`, `line_1`, `line_2`, `city`, `postal_code`, `country`, `customer_id`) VALUES (1, 'billing', 'Mannerheimintie 10', 'Apt 3B', 'Helsinki', '00100', 'Finland', 1);
INSERT INTO `online_shop`.`addresses` (`id`, `type`, `line_1`, `line_2`, `city`, `postal_code`, `country`, `customer_id`) VALUES (2, 'shipping', 'Kalevankatu 5', 'Floor 2', 'Helsinki', '00100', 'Finland', 1);
INSERT INTO `online_shop`.`addresses` (`id`, `type`, `line_1`, `line_2`, `city`, `postal_code`, `country`, `customer_id`) VALUES (3, 'billing', 'Hämeenkatu 20', 'Suite 5', 'Tampere', '33100', 'Finland', 2);
INSERT INTO `online_shop`.`addresses` (`id`, `type`, `line_1`, `line_2`, `city`, `postal_code`, `country`, `customer_id`) VALUES (4, 'shipping', 'Satakunnankatu 12', NULL, 'Tampere', '33100', 'Finland', 2);
INSERT INTO `online_shop`.`addresses` (`id`, `type`, `line_1`, `line_2`, `city`, `postal_code`, `country`, `customer_id`) VALUES (5, 'billing', 'Aleksanterinkatu 25', NULL, 'Turku', '20100', 'Finland', 3);
INSERT INTO `online_shop`.`addresses` (`id`, `type`, `line_1`, `line_2`, `city`, `postal_code`, `country`, `customer_id`) VALUES (6, 'shipping', 'Yliopistonkatu 8', 'Unit 4', 'Turku', '20100', 'Finland', 3);

-- -----------------------------------------------------
-- Data for table `online_shop`.`categories`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`categories` (`id`, `name`, `description`) VALUES (1, 'Mobile Devices', 'Smartphones, tablets, wearables');
INSERT INTO `online_shop`.`categories` (`id`, `name`, `description`) VALUES (2, 'Computers & Laptops', 'Personal and business computers');
INSERT INTO `online_shop`.`categories` (`id`, `name`, `description`) VALUES (3, 'Home Entertainment', 'TVs, speakers, streaming gear');
INSERT INTO `online_shop`.`categories` (`id`, `name`, `description`) VALUES (4, 'Smart Home & IoT', 'Connected home devices');
INSERT INTO `online_shop`.`categories` (`id`, `name`, `description`) VALUES (5, 'Components & Peripherals', 'PC parts and accessories');

-- -----------------------------------------------------
-- Data for table `online_shop`.`sub_categories`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (1, 1, 'Smartphones', 'Android and iOS phones');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (2, 1, 'Tablets', 'Touchscreen mobile devices');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (3, 2, 'Laptops', 'Portable computers');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (4, 2, 'Monitors', 'Display screens for computers');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (5, 3, 'Televisions', 'Smart and 4K TVs');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (6, 3, 'Speakers', 'Bluetooth and home audio');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (7, 4, 'Smart Lights', 'Wi-Fi enabled lighting');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (8, 4, 'Security Cameras', 'Indoor and outdoor surveillance');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (9, 5, 'Storage Devices', 'SSDs, HDDs, external drives');
INSERT INTO `online_shop`.`sub_categories` (`id`, `category_id`, `name`, `description`) VALUES (10, 5, 'Networking Equipment', 'Routers, modems, mesh systems');

-- -----------------------------------------------------
-- Data for table `online_shop`.`products`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (1, 'iPhone 15 Pro', 'Apple smartphone, 256GB', 'IP15P-256-EU', '/images/products/iphone15pro.jpg', 50, 1299.99, NOW(), 1);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (2, 'iPad Air', 'Apple tablet, 10.9\" display', 'IPAIR-109-EU', '/images/products/ipadair.jpg', 40, 699.99, NOW(), 2);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (3, 'Dell XPS 13', 'Lightweight laptop, 13\" screen', 'DELLXPS13-2025', '/images/products/dellxps13.jpg', 30, 999.99, NOW(), 3);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (4, 'LG UltraFine 4K', '27\" 4K monitor with USB-C', 'LGUF4K-27INCH', '/images/products/lgultrafine4k.jpg', 25, 499.99, NOW(), 4);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (5, 'Samsung QLED 55\"', 'Smart TV with 4K resolution', 'SAMQLED55-4K', '/images/products/samsungqled55.jpg', 20, 899.99, NOW(), 5);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (6, 'JBL Flip 6', 'Portable Bluetooth speaker', 'JBLFLIP6-BT', '/images/products/jblflip6.jpg', 60, 129.99, NOW(), 6);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (7, 'Philips Hue Bulb', 'Smart LED bulb with app control', 'PHHUEBULB-WIFI', '/images/products/philipsbulb.jpg', 100, 49.99, NOW(), 7);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (8, 'Arlo Pro 4 Camera', 'Wireless security camera', 'ARLOPRO4-CAM', '/images/products/arlopro4.jpg', 199.99, 35, NOW(), 8);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (9, 'Samsung T7 SSD 1TB', 'External solid-state drive', 'SAMT7SSD-1TB', '/images/products/samsungt7ssd.jpg', 139.99, 45, NOW(), 9);
INSERT INTO `online_shop`.`products` (`id`, `name`, `description`, `sku`, `img_url`, `quantity`, `price`, `created_at`, `sub_category_id`) VALUES (10, 'TP-Link AX3000 Router', 'Dual-band Wi-Fi 6 router', 'TPLAX3000-WIFI', '/images/products/tplinkax3000.jpg', 89.99, 70, NOW(), 10);

-- -----------------------------------------------------
-- Data for table `online_shop`.`orders`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`orders` (`id`, `currency`, `status`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES (1, 'EUR', 'shipped', 1999.98, NOW(), NOW(), 1);
INSERT INTO `online_shop`.`orders` (`id`, `currency`, `status`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES (2, 'EUR', 'pending', 699.99, NOW(), NOW(), 2);
INSERT INTO `online_shop`.`orders` (`id`, `currency`, `status`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES (3, 'EUR', 'delivered', 499.99, NOW(), NOW(), 3);
INSERT INTO `online_shop`.`orders` (`id`, `currency`, `status`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES (4, 'EUR', 'processing', 129.99, NOW(), NOW(), 1);
INSERT INTO `online_shop`.`orders` (`id`, `currency`, `status`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES (5, 'EUR', 'cancelled', 89.99, NOW(), NOW(), 2);
INSERT INTO `online_shop`.`orders` (`id`, `currency`, `status`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES (6, 'EUR', 'shipped', 229.98, NOW(), NOW(), 3);

-- -----------------------------------------------------
-- Data for table `online_shop`.`order_items`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (1, 1, 1, 1299.99, 0.00, 1299.99, 1);
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (2, 1, 1, 699.99, 0.00, 699.99, 2);
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (3, 2, 1, 699.99, 0.00, 699.99, 3);
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (4, 3, 1, 499.99, 0.00, 499.99, 4);
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (5, 4, 1, 129.99, 0.00, 129.99, 6);
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (6, 5, 1, 89.99, 0.00, 89.99, 10);
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (7, 6, 2, 49.99, 0.00, 49.99, 7);
INSERT INTO `online_shop`.`order_items` (`id`, `order_id`, `quantity`, `unit_price`, `discount`, `total`, `product_id`) VALUES (8, 6, 1, 129.99, 0.00, 129.99, 8);

-- -----------------------------------------------------
-- Data for table `online_shop`.`shipments`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`shipments` (`id`, `pkc_number`, `tracking_number`, `carrier`, `status`, `created_at`, `updated_at`, `order_id`) VALUES (1, 'SHP001', 'FI123456789', 'Posti', 'delivered', NOW(), NOW(), 1);
INSERT INTO `online_shop`.`shipments` (`id`, `pkc_number`, `tracking_number`, `carrier`, `status`, `created_at`, `updated_at`, `order_id`) VALUES (2, 'SHP002', 'FI987654321', 'Posti', 'in-transit', NOW(), NOW(), 2);
INSERT INTO `online_shop`.`shipments` (`id`, `pkc_number`, `tracking_number`, `carrier`, `status`, `created_at`, `updated_at`, `order_id`) VALUES (3, 'SHP003', 'FI555666777', 'DHL', 'delivered', NOW(), NOW(), 3);
INSERT INTO `online_shop`.`shipments` (`id`, `pkc_number`, `tracking_number`, `carrier`, `status`, `created_at`, `updated_at`, `order_id`) VALUES (4, 'SHP004', 'FI111222333', 'Posti', 'processing', NOW(), NOW(), 4);
INSERT INTO `online_shop`.`shipments` (`id`, `pkc_number`, `tracking_number`, `carrier`, `status`, `created_at`, `updated_at`, `order_id`) VALUES (5, 'SHP005', 'FI444555666', 'Posti', 'cancelled', NOW(), NOW(), 5);
INSERT INTO `online_shop`.`shipments` (`id`, `pkc_number`, `tracking_number`, `carrier`, `status`, `created_at`, `updated_at`, `order_id`) VALUES (6, 'SHP006', 'FI777888999', 'DHL', 'delivered', NOW(), NOW(), 6);

-- -----------------------------------------------------
-- Data for table `online_shop`.`payments`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`payments` (`id`, `method`, `status`, `amount`, `created_at`, `order_id`) VALUES (1, 'credit_card', 'paid', 1999.98, NOW(), 1);
INSERT INTO `online_shop`.`payments` (`id`, `method`, `status`, `amount`, `created_at`, `order_id`) VALUES (2, 'fund_transfer', 'paid', 699.99, NOW(), 2);
INSERT INTO `online_shop`.`payments` (`id`, `method`, `status`, `amount`, `created_at`, `order_id`) VALUES (3, 'cash', 'paid', 499.99, NOW(), 3);
INSERT INTO `online_shop`.`payments` (`id`, `method`, `status`, `amount`, `created_at`, `order_id`) VALUES (4, 'fund_transfer', 'pending', 129.99, NOW(), 4);
INSERT INTO `online_shop`.`payments` (`id`, `method`, `status`, `amount`, `created_at`, `order_id`) VALUES (5, 'credit', 'refunded', 89.99, NOW(), 5);
INSERT INTO `online_shop`.`payments` (`id`, `method`, `status`, `amount`, `created_at`, `order_id`) VALUES (6, 'fund_transfer', 'paid', 229.98, NOW(), 6);

-- -----------------------------------------------------
-- Data for table `online_shop`.`activity_logs`
-- -----------------------------------------------------
INSERT INTO `online_shop`.`activity_logs`
(`table_name`, `record_id`, `operation`, `changed_data`, `changed_by`, `changed_at`, `ip_address`, `remarks`) 
VALUES 
('customers', 1, 'INSERT', '{"first_name":"Aino","last_name":"Virtanen","email":"aino.v@example.com"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('customers', 2, 'INSERT', '{"first_name":"Elias","last_name":"Niemi","email":"elias.n@example.com"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('customers', 3, 'INSERT', '{"first_name":"Sanna","last_name":"Korhonen","email":"sanna.k@example.com"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('addresses', 1, 'INSERT', '{"type":"billing","city":"Helsinki","customer_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('addresses', 2, 'INSERT', '{"type":"shipping","city":"Helsinki","customer_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('addresses', 3, 'INSERT', '{"type":"billing","city":"Tampere","customer_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('addresses', 4, 'INSERT', '{"type":"shipping","city":"Tampere","customer_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('addresses', 5, 'INSERT', '{"type":"billing","city":"Turku","customer_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('addresses', 6, 'INSERT', '{"type":"shipping","city":"Turku","customer_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('categories', 1, 'INSERT', '{"name":"Mobile Devices"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('categories', 2, 'INSERT', '{"name":"Computers & Laptops"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('categories', 3, 'INSERT', '{"name":"Home Entertainment"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('categories', 4, 'INSERT', '{"name":"Smart Home & IoT"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('categories', 5, 'INSERT', '{"name":"Components & Peripherals"}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 1, 'INSERT', '{"name":"Smartphones","category_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 2, 'INSERT', '{"name":"Tablets","category_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 3, 'INSERT', '{"name":"Laptops","category_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 4, 'INSERT', '{"name":"Monitors","category_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 5, 'INSERT', '{"name":"Televisions","category_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 6, 'INSERT', '{"name":"Speakers","category_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 7, 'INSERT', '{"name":"Smart Lights","category_id":4}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 8, 'INSERT', '{"name":"Security Cameras","category_id":4}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 9, 'INSERT', '{"name":"Storage Devices","category_id":5}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('sub_categories', 10, 'INSERT', '{"name":"Networking Equipment","category_id":5}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 1, 'INSERT', '{"name":"iPhone 15 Pro","sku":"IP15P-256-EU","sub_category_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 2, 'INSERT', '{"name":"iPad Air","sku":"IPAIR-109-EU","sub_category_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 3, 'INSERT', '{"name":"Dell XPS 13","sku":"DELLXPS13-2025","sub_category_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 4, 'INSERT', '{"name":"LG UltraFine 4K","sku":"LGUF4K-27INCH","sub_category_id":4}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 5, 'INSERT', '{"name":"Samsung QLED 55\\"","sku":"SAMQLED55-4K","sub_category_id":5}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 6, 'INSERT', '{"name":"JBL Flip 6","sku":"JBLFLIP6-BT","sub_category_id":6}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 7, 'INSERT', '{"name":"Philips Hue Bulb","sku":"PHHUEBULB-WIFI","sub_category_id":7}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 8, 'INSERT', '{"name":"Arlo Pro 4 Camera","sku":"ARLOPRO4-CAM","sub_category_id":8}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 9, 'INSERT', '{"name":"Samsung T7 SSD 1TB","sku":"SAMT7SSD-1TB","sub_category_id":9}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('products', 10, 'INSERT', '{"name":"TP-Link AX3000 Router","sku":"TPLAX3000-WIFI","sub_category_id":10}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('orders', 1, 'INSERT', '{"status":"shipped","total":1999.98,"customer_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('orders', 2, 'INSERT', '{"status":"pending","total":699.99,"customer_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('orders', 3, 'INSERT', '{"status":"delivered","total":499.99,"customer_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('orders', 4, 'INSERT', '{"status":"processing","total":129.99,"customer_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('orders', 5, 'INSERT', '{"status":"cancelled","total":89.99,"customer_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('orders', 6, 'INSERT', '{"status":"shipped","total":229.98,"customer_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('shipments', 1, 'INSERT', '{"pkc_number":"SHP001","tracking_number":"FI123456789","carrier":"Posti","status":"delivered","order_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('shipments', 2, 'INSERT', '{"pkc_number":"SHP002","tracking_number":"FI987654321","carrier":"Posti","status":"in-transit","order_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('shipments', 3, 'INSERT', '{"pkc_number":"SHP003","tracking_number":"FI555666777","carrier":"DHL","status":"delivered","order_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('shipments', 4, 'INSERT', '{"pkc_number":"SHP004","tracking_number":"FI111222333","carrier":"Posti","status":"processing","order_id":4}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('shipments', 5, 'INSERT', '{"pkc_number":"SHP005","tracking_number":"FI444555666","carrier":"Posti","status":"cancelled","order_id":5}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('shipments', 6, 'INSERT', '{"pkc_number":"SHP006","tracking_number":"FI777888999","carrier":"DHL","status":"delivered","order_id":6}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('payments', 1, 'INSERT', '{"method":"credit_card","status":"paid","amount":1999.98,"order_id":1}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('payments', 2, 'INSERT', '{"method":"fund_transfer","status":"paid","amount":699.99,"order_id":2}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('payments', 3, 'INSERT', '{"method":"cash","status":"paid","amount":499.99,"order_id":3}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('payments', 4, 'INSERT', '{"method":"fund_transfer","status":"pending","amount":129.99,"order_id":4}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('payments', 5, 'INSERT', '{"method":"credit","status":"refunded","amount":89.99,"order_id":5}', 1001, NOW(), '192.168.1.10', 'Initial data load'),
('payments', 6, 'INSERT', '{"method":"fund_transfer","status":"paid","amount":229.98,"order_id":6}', 1001, NOW(), '192.168.1.10', 'Initial data load');

-- -----------------------------------------------------
-- Mark Old Orders as Archived
-- -----------------------------------------------------
UPDATE orders
SET status = 'cancelled'
WHERE created_at < CURRENT_DATE - INTERVAL 1 YEAR
  AND status != 'delivered';

-- -----------------------------------------------------
-- Apply Bulk Discount to Low-Selling Products
-- -----------------------------------------------------
UPDATE products
SET price = price * 0.90
WHERE id IN (
    SELECT product_id
    FROM order_items
    GROUP BY product_id
    HAVING SUM(quantity) < 5
);

-- -----------------------------------------------------
-- Update Customer Email Format
-- -----------------------------------------------------
UPDATE customers
SET email = LOWER(email)
WHERE email IS NOT NULL;

-- -----------------------------------------------------
-- Update Shipment Status to Delivered
-- -----------------------------------------------------
UPDATE shipments
SET status = 'delivered', updated_at = NOW()
WHERE tracking_number = 'FI987654321';

-- -----------------------------------------------------
-- Delete Cancelled Orders Older Than 6 Months
-- -----------------------------------------------------
DELETE FROM orders
WHERE status = 'cancelled'
  AND created_at < CURRENT_DATE - INTERVAL 6 MONTH;

-- -----------------------------------------------------
-- Remove Products with Zero Stock and No Orders
-- -----------------------------------------------------
DELETE FROM products
WHERE quantity = 0
  AND id NOT IN (
    SELECT DISTINCT product_id FROM order_items
);

-- -----------------------------------------------------
-- Delete Orphaned Addresses
-- -----------------------------------------------------
DELETE FROM addresses
WHERE customer_id NOT IN (
    SELECT id FROM customers
);

-- -----------------------------------------------------
-- Delete Payments with Refunded Status Older Than 1 Year
-- -----------------------------------------------------
DELETE FROM payments
WHERE status = 'refunded'
  AND created_at < CURRENT_DATE - INTERVAL 1 YEAR;