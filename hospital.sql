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
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `adm_id` int(11) NOT NULL,
  `adm_date` date DEFAULT NULL,
  `fk_patient_id` int(11) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admission`
--

INSERT INTO `admission` (`adm_id`, `adm_date`, `fk_patient_id`, `fk_unit_id`) VALUES
(1, '0000-00-00', 1, 3),
(2, '0000-00-00', 1, 2),
(3, '0000-00-00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `specialisation` varchar(55) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `first_name`, `last_name`, `specialisation`, `fk_unit_id`) VALUES
(1, 'Aloisia', 'Arzt', 'Cardiology', 3),
(2, 'Dora', 'Doctorov', 'Critical Care', 2),
(3, 'Ivy', 'Irrsigler', 'Psychiatry', 1);

-- --------------------------------------------------------

--
-- Table structure for table `intervention`
--

CREATE TABLE `intervention` (
  `int_id` int(11) NOT NULL,
  `treatment` text DEFAULT NULL,
  `fk_patient_id` int(11) DEFAULT NULL,
  `fk_adm_id` int(11) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL,
  `fk_doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `intervention`
--

INSERT INTO `intervention` (`int_id`, `treatment`, `fk_patient_id`, `fk_adm_id`, `fk_unit_id`, `fk_doctor_id`) VALUES
(1, 'intensive care', 1, 1, 2, 2),
(2, 'surgery', 2, 2, 1, 1),
(3, 'tranquilizers', 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `SSN` varchar(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `main_symptom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `first_name`, `last_name`, `SSN`, `age`, `main_symptom`) VALUES
(1, 'Karin', 'Krankl', '1974121274', 45, 'Coronavirus'),
(2, 'Martha', 'Malade', '1975121275', 44, 'Cardiac Crisis'),
(3, 'Ilya', 'Illiev', '1976121276', 43, 'Hypochondria');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `name`, `floor`) VALUES
(1, 'Psychiatry', 3),
(2, 'Critical Care Unit', 2),
(3, 'Cardiology', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`adm_id`),
  ADD KEY `fk_patient_id` (`fk_patient_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`);

--
-- Indexes for table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`int_id`),
  ADD KEY `fk_patient_id` (`fk_patient_id`),
  ADD KEY `fk_adm_id` (`fk_adm_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`),
  ADD KEY `fk_doctor_id` (`fk_doctor_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission`
--
ALTER TABLE `admission`
  ADD CONSTRAINT `admission_ibfk_1` FOREIGN KEY (`fk_patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `admission_ibfk_2` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`);

--
-- Constraints for table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`fk_patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `intervention_ibfk_2` FOREIGN KEY (`fk_adm_id`) REFERENCES `admission` (`adm_id`),
  ADD CONSTRAINT `intervention_ibfk_3` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`),
  ADD CONSTRAINT `intervention_ibfk_4` FOREIGN KEY (`fk_doctor_id`) REFERENCES `doctor` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
