-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2018 at 06:14 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsp-projek`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(55) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_ori_price` varchar(25) NOT NULL,
  `product_sell_price` varchar(25) NOT NULL,
  `product_profit` varchar(25) NOT NULL,
  `product_quantity` int(25) NOT NULL,
  `product_supplier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `product_ori_price`, `product_sell_price`, `product_profit`, `product_quantity`, `product_supplier`) VALUES
(2, 'Pisang', 'Makanan Segera', '15.00', '35', '12', 1, 'AL');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_date` int(11) NOT NULL,
  `sales_amount` int(11) NOT NULL,
  `sales_profit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_product`
--

CREATE TABLE `sales_product` (
  `transaction_id` int(10) NOT NULL,
  `transaction_date` date NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_sell_price` int(55) NOT NULL,
  `product_amount` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(10) NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `staff_birth_date` varchar(255) NOT NULL,
  `staff_address` varchar(255) NOT NULL,
  `staff_contact_num` varchar(55) NOT NULL,
  `staff_salary` int(55) NOT NULL,
  `staff_position` varchar(50) NOT NULL,
  `staff_hire_date` varchar(255) NOT NULL,
  `staff_email` varchar(255) NOT NULL,
  `staff_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staff_id`, `staff_name`, `staff_birth_date`, `staff_address`, `staff_contact_num`, `staff_salary`, `staff_position`, `staff_hire_date`, `staff_email`, `staff_password`) VALUES
(27, 'Vibhor', '2018-06-15', 'Noida', '01129404479', 1500, 'cashier', '2023-01-23', 'vibhor@gmail.com', '0192023a7bbd73250516f069df18b500'),
(29, 'Shilpa', '2018-06-09', 'Noida', '01129404479', 1500, 'cashier', '2023-01-29', 'shilpa@gmail.com', '0192023a7bbd73250516f069df18b500');
-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(10) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `supplier_contact_num` varchar(55) NOT NULL,
  `supplier_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_address`, `supplier_contact_num`, `supplier_description`) VALUES
(8, 'Aliah Sdn Bhd', 'Taman Seri Murni', '01129404479', ''),
(9, 'Aliah Sdn Bhd', 'Taman Seri Murni', '01129404479', 'Syarikat pembekal gula gula'),
(10, 'Izzat', 'Taman Seri Murni', '0122954571', 'asdasd'),
(12, 'Hairul Sdn Bhd', 'Taman SEri Murni', '0122921042', 'Ali penggoreng pisang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_email` (`staff_email`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;