-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 02:30 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `auctionset`
--

CREATE TABLE `auctionset` (
  `auctionset_id` int(11) NOT NULL,
  `cat_nr` int(11) DEFAULT NULL,
  `lowest_price` int(11) DEFAULT NULL,
  `highest_price` bigint(20) DEFAULT NULL,
  `rem_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auctionset`
--

INSERT INTO `auctionset` (`auctionset_id`, `cat_nr`, `lowest_price`, `highest_price`, `rem_time`) VALUES
(1, 20201, 10, 10000, '2020-07-08 03:00:00'),
(2, 20202, 100, 100000, '2020-07-08 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `bid_id` int(11) NOT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `biddate` date DEFAULT NULL,
  `hour` datetime DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`bid_id`, `amount`, `biddate`, `hour`, `fk_auctionset_id`, `fk_customer_id`) VALUES
(1, 500, '2020-07-08', '2020-07-08 02:45:00', 1, 1),
(2, 1500, '2020-07-08', '2020-07-08 02:50:00', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `PW` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `first_name`, `last_name`, `PW`, `email`) VALUES
(1, 'Otto', 'Obermeyer', 'otti', 'otti@gmail.com'),
(2, 'Ottilie', 'Oberkofler', 'otti', 'ottilie@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `product1`
--

CREATE TABLE `product1` (
  `p1_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product1`
--

INSERT INTO `product1` (`p1_id`, `name`, `description`, `photo`, `fk_auctionset_id`) VALUES
(1, 'Vase', 'Chinese Vase', 0x2e2e2e, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product2`
--

CREATE TABLE `product2` (
  `p2_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product2`
--

INSERT INTO `product2` (`p2_id`, `name`, `description`, `photo`, `fk_auctionset_id`) VALUES
(2, 'Vase', 'Japanese Vase', 0x2e2e2e, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product3`
--

CREATE TABLE `product3` (
  `p3_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` blob DEFAULT NULL,
  `fk_auctionset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product3`
--

INSERT INTO `product3` (`p3_id`, `name`, `description`, `photo`, `fk_auctionset_id`) VALUES
(3, 'Juwel', 'Famous Diamond', 0x2e2e2e, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auctionset`
--
ALTER TABLE `auctionset`
  ADD PRIMARY KEY (`auctionset_id`);

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `product1`
--
ALTER TABLE `product1`
  ADD PRIMARY KEY (`p1_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`);

--
-- Indexes for table `product2`
--
ALTER TABLE `product2`
  ADD PRIMARY KEY (`p2_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`);

--
-- Indexes for table `product3`
--
ALTER TABLE `product3`
  ADD PRIMARY KEY (`p3_id`),
  ADD KEY `fk_auctionset_id` (`fk_auctionset_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`),
  ADD CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `product1`
--
ALTER TABLE `product1`
  ADD CONSTRAINT `product1_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`);

--
-- Constraints for table `product2`
--
ALTER TABLE `product2`
  ADD CONSTRAINT `product2_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`);

--
-- Constraints for table `product3`
--
ALTER TABLE `product3`
  ADD CONSTRAINT `product3_ibfk_1` FOREIGN KEY (`fk_auctionset_id`) REFERENCES `auctionset` (`auctionset_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
