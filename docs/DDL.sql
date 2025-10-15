-- -----------------------------------------------------
-- Schema online_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_shop` DEFAULT CHARACTER SET utf8;
USE `online_shop`;

-- -----------------------------------------------------
-- Table `online_shop`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`customers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(256) NULL,
  `last_name` VARCHAR(256) NULL,
  `phone` VARCHAR(16) NULL,
  `email` VARCHAR(128) NULL UNIQUE,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `online_shop`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `online_shop`.`sub_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`sub_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(128) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sub_categories_categories1_idx` (`category_id` ASC),
  CONSTRAINT `fk_sub_categories_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `online_shop`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `online_shop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NULL,
  `description` TEXT NULL,
  `sku` VARCHAR(32) NULL UNIQUE,
  `img_url` VARCHAR(256) NULL,
  `quantity` FLOAT NULL,
  `price` FLOAT NULL,
  `created_at` DATETIME NULL,
  `sub_category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_sub_categories1_idx` (`sub_category_id` ASC),
  CONSTRAINT `fk_products_sub_categories1`
    FOREIGN KEY (`sub_category_id`)
    REFERENCES `online_shop`.`sub_categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `online_shop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`orders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency` VARCHAR(8) NULL,
  `status` ENUM('pending', 'shipped', 'delivered', 'cancelled') NULL,
  `total` FLOAT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_customers_idx` (`customer_id` ASC),
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `online_shop`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `online_shop`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`order_items` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `quantity` FLOAT NULL,
  `unit_price` FLOAT NULL,
  `discount` FLOAT NULL,
  `total` FLOAT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  INDEX `fk_order_items_products1_idx` (`product_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_order_items_orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_order_items_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `online_shop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_items_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `online_shop`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `online_shop`.`shipments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`shipments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pkc_number` VARCHAR(32) NULL,
  `tracking_number` VARCHAR(32) NULL UNIQUE,
  `carrier` VARCHAR(64) NULL,
  `status` ENUM('pending', 'shipped', 'in-transit', 'delivered', 'cancelled') NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `order_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shipments_orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_shipments_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `online_shop`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `online_shop`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`addresses` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` ENUM('billing', 'shipping', 'home') NULL,
  `line_1` VARCHAR(256) NULL,
  `line_2` VARCHAR(256) NULL,
  `city` VARCHAR(64) NULL,
  `postal_code` VARCHAR(32) NULL,
  `country` VARCHAR(64) NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_customers1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_address_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `online_shop`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `online_shop`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`payments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `method` ENUM('cash', 'credit', 'credit_card', 'fund_transfer') NULL,
  `status` ENUM('pending', 'on-hold', 'paid', 'refunded') NULL,
  `amount` FLOAT NULL,
  `created_at` DATETIME NULL,
  `order_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payments_orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_payments_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `online_shop`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- -----------------------------------------------------
-- Table `online_shop`.`activity_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`activity_logs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` VARCHAR(64) NULL,
  `record_id` INT UNSIGNED NULL,
  `operation` VARCHAR(16) NULL,
  `changed_data` TEXT NULL,
  `changed_by` INT UNSIGNED NULL,
  `changed_at` DATETIME NULL,
  `ip_address` VARCHAR(64) NULL,
  `remarks` TEXT NULL,
  PRIMARY KEY (`id`));