-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2024 at 02:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment_5`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(30) NOT NULL,
  `FName` varchar(55) NOT NULL,
  `Lname` varchar(55) NOT NULL,
  `Email` varchar(55) NOT NULL,
  `phone` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `FName`, `Lname`, `Email`, `phone`) VALUES
(1, 'ahmed', 'hany', 'ahmed@gmail.com', 1151117044),
(2, 'hany', 'sayed', 'hany@gmail.com', 1022232771),
(15, 'mohamed', 'hany', 'mohaddmed@gmail.com', 1898267262),
(34, 'seif', 'hany', 'seif@gmail.com', 1898267262),
(36, 'jjj', 'hany', 'jjj@gmail.com', 1898267262);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(30) NOT NULL,
  `orderID` int(30) NOT NULL,
  `productID` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `unite_price` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordertable`
--

CREATE TABLE `ordertable` (
  `orderID` int(30) NOT NULL,
  `orderDate` datetime NOT NULL,
  `totalAmount` int(100) NOT NULL,
  `customerID` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`orderID`, `orderDate`, `totalAmount`, `customerID`) VALUES
(6, '2024-05-24 00:47:24', 151, 1),
(8, '2024-05-24 00:48:35', 151, 2),
(11, '2024-05-24 01:53:06', 151, 2),
(12, '2024-05-24 01:53:06', 151, 2),
(13, '2024-05-24 01:53:11', 151, 15),
(14, '2024-05-24 01:53:12', 151, 15),
(15, '2024-05-24 01:53:12', 151, 15),
(16, '2024-05-24 01:53:13', 151, 15),
(17, '2024-05-24 01:53:13', 151, 15),
(18, '2024-05-24 01:53:30', 151, 34),
(19, '2024-05-24 01:53:30', 151, 34),
(20, '2024-05-24 01:53:30', 151, 34),
(21, '2024-05-24 01:53:31', 151, 34),
(22, '2024-05-24 01:53:31', 151, 34),
(23, '2024-05-24 01:53:34', 151, 34),
(24, '2024-05-24 01:53:35', 151, 34),
(25, '2024-05-24 01:53:35', 151, 34),
(26, '2024-05-24 03:54:04', 151, 34);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `category` varchar(50) NOT NULL,
  `unitPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `unitPrice`) VALUES
(5, 'Bluetooth Speaker I', 'Audio', 100),
(6, 'Smartwatch A', 'Wearable Tech', 200),
(7, 'Camera C', 'Photography', 600),
(8, 'Wireless Mouse D', 'Computer Accessories', 30),
(9, 'Fitness Tracker E', 'Fitness', 150),
(10, 'undefined', 'undefined', 0),
(11, 'Fitness Tracker b', 'Fitness', 150),
(12, 'Fitness Tracker h', 'Fitness', 150),
(13, 'Fitness Tracker dd', 'Fitness', 150),
(14, 'Fitness Tracker sss', 'Fitness', 150),
(15, 'Camera i', 'Photography', 600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `orderitem_ibfk_1` (`productID`);

--
-- Indexes for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `orderID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
