-- MySQL Script generated by MySQL Workbench
-- Wed Apr 29 19:57:53 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `amazon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `amazon` ;

-- -----------------------------------------------------
-- Table `amazon`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `amazon`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`product` (
  `product_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `detail` VARCHAR(45) NOT NULL,
  `cost` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `amazon`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`cart` (
  `cart_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `total` INT NOT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `customer_id` (`customer_id` ASC) INVISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `amazon`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_id_fk`
    FOREIGN KEY (`product_id`)
    REFERENCES `amazon`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `amazon`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`transaction` (
  `transaction_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transaction_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `amazon`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`order` (
  `order_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `delivery_address` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  `order_staus` VARCHAR(45) NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `transaction_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `product_id` (`product_id` ASC) INVISIBLE,
  INDEX `customer_id` (`customer_id` ASC) INVISIBLE,
  INDEX `transaction_id` (`transaction_id` ASC) VISIBLE,
  CONSTRAINT `order_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `amazon`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `amazon`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `transaction_id`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `amazon`.`transaction` (`transaction_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `amazon`.`seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`seller` (
  `seller_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`seller_id`),
  INDEX `product_id` (`product_id` ASC) INVISIBLE,
  CONSTRAINT `seller_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `amazon`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `amazon`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`wishlist` (
  `wishlist_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `notification_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  INDEX `product_id` (`product_id` ASC) INVISIBLE,
  INDEX `customer_id` (`customer_id` ASC) INVISIBLE,
  CONSTRAINT `wishlist_customer_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `amazon`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `wishlist_product_id_fk`
    FOREIGN KEY (`product_id`)
    REFERENCES `amazon`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
