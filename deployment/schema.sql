-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2018 at 06:14 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23


SET SQL_MODE=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsp-projek`
--

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(55) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_ori_price` varchar(25) NOT NULL,
  `product_sell_price` varchar(25) NOT NULL,
  `product_profit` varchar(25) NOT NULL,
  `product_quantity` int(25) NOT NULL,
  `product_supplier` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_date` int(11) NOT NULL,
  `sales_amount` int(11) NOT NULL,
  `sales_profit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sales_product` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_sell_price` int(55) NOT NULL,
  `product_amount` int(55) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `staffs` (
  `staff_id` int(10) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(255) NOT NULL,
  `staff_birth_date` varchar(255) NOT NULL,
  `staff_address` varchar(255) NOT NULL,
  `staff_contact_num` varchar(55) NOT NULL,
  `staff_salary` int(55) NOT NULL,
  `staff_position` varchar(50) NOT NULL,
  `staff_hire_date` varchar(255) NOT NULL,
  `staff_email` varchar(255) NOT NULL,
  `staff_password` varchar(50) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `suppliers` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `supplier_contact_num` varchar(55) NOT NULL,
  `supplier_description` varchar(255) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(100) NOT NULL,  
  `store_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `staffs`
ADD UNIQUE KEY `staff_email` (`staff_email`);

ALTER TABLE `stores`  
  ADD UNIQUE KEY `store_name` (`store_name`);

INSERT INTO `staffs` (`staff_name`, `staff_birth_date`, `staff_address`, `staff_contact_num`, `staff_salary`, `staff_position`, `staff_hire_date`, `staff_email`, `staff_password`,`store_id`) VALUES
('Vibhor', '2018-06-15', 'Noida', '01129404479', 1500, 'cashier', '2023-01-23', 'vibhor@gmail.com', '0192023a7bbd73250516f069df18b500',111),
('Shilpa', '2018-06-09', 'Noida', '01129404479', 1500, 'cashier', '2023-01-29', 'shilpa@gmail.com', '0192023a7bbd73250516f069df18b500',111);

INSERT INTO `stores` (`store_id`, `store_name`, `store_location`) VALUES
(111, 'NY_1', 'New York');


INSERT INTO `suppliers` (`supplier_name`, `supplier_address`, `supplier_contact_num`, `supplier_description`,`store_id`)
VALUES ('venky\'s', 'usa', '999345689', 'venky',111);


-- Sample data in products table

INSERT INTO `products` (`product_name`, `product_description`, `product_ori_price`, `product_sell_price`, `product_profit`, `product_quantity`, `product_supplier`, `store_id`)
VALUES ('chicken burger small', 'chicken burger small', '40', '50', '10', '100', 'venky\'s', '111');

INSERT INTO `products` (`product_name`, `product_description`, `product_ori_price`, `product_sell_price`, `product_profit`, `product_quantity`, `product_supplier`, `store_id`)
VALUES ('chicken burger large', 'chicken burger large', '100', '120', '20', '100', 'venky\'s', '111');

INSERT INTO `products` (`product_name`, `product_description`, `product_ori_price`, `product_sell_price`, `product_profit`, `product_quantity`, `product_supplier`, `store_id`)
VALUES ('veg wrap small', 'veg wrap small', '120', '140', '20', '100', 'venky\'s', '111');

INSERT INTO `products` (`product_name`, `product_description`, `product_ori_price`, `product_sell_price`, `product_profit`, `product_quantity`, `product_supplier`, `store_id`)
VALUES ('veg wrap large', 'veg wrap large', '80', '95', '15', '50', 'venky\'s', '111');

INSERT INTO `products` (`product_name`, `product_description`, `product_ori_price`, `product_sell_price`, `product_profit`, `product_quantity`, `product_supplier`, `store_id`)
VALUES ('french fries small', 'french fries small', '100', '110', '10', '50', 'venky\'s', '111');

INSERT INTO `products` (`product_name`, `product_description`, `product_ori_price`, `product_sell_price`, `product_profit`, `product_quantity`, `product_supplier`, `store_id`)
VALUES ('french fries large', 'french fries large', '120', '130', '10', '50', 'venky\'s', '111');


-- sample data for sales_product

INSERT INTO `sales_product` (`transaction_date`, `product_name`, `product_quantity`, `product_sell_price`, `product_amount`, `store_id`)
VALUES 
  ('2023-02-23', 'veg wrap large', 10, 50, 500, 111),
  ('2023-02-24', 'veg wrap small', 10, 120, 1200, 111),
  ('2023-02-25', 'french fries small', 10, 140, 1400, 111),
  ('2023-02-26', 'french fries large', 5, 110, 550, 111),
  ('2023-02-27', 'eg wrap medium', 5, 130, 650, 111);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;