-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2021 at 09:33 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybank`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL,
  `branchNo` varchar(111) NOT NULL,
  `branchName` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchId`, `branchNo`, `branchName`) VALUES
(1, '100101', 'Lal Chowki'),
(2, '100102', 'Anand Nagar');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `message` text NOT NULL,
  `userId` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackId`, `message`, `userId`, `date`) VALUES
(1, 'This is testing message to admin or manager by fk', 1, '2017-12-15 04:30:48'),
(3, 'This is testing message to admin or manager by fk', 2, '2017-12-15 04:30:48'),
(4, 'this is help card for admin', 1, '2017-12-17 06:45:20'),
(5, 'I am Jatan', 1, '2021-06-03 09:57:02'),
(15, 'Hello manager', 21, '2021-06-09 06:52:48');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(111) NOT NULL,
  `password` varchar(111) NOT NULL,
  `type` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `type`, `date`) VALUES
(2, 'manager@manager.com', 'manager', 'manager', '2017-12-15 04:36:27'),
(3, 'j@gmail.com', '12345', 'type', '2017-12-16 07:13:12'),
(4, 'fkgeo@gmail.com', 'asdfsa', 'type', '2017-12-16 07:13:18'),
(12, 'jatanchoudhary441@gmail.com', '12345', 'cashier', '2021-06-03 19:39:11'),
(17, 'cashier@gmail.com', 'cashier', 'cashier', '2021-06-09 06:24:49'),
(18, 'admin@gmail.com', '12345', 'cashier', '2021-06-09 07:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `userId` varchar(111) NOT NULL,
  `notice` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `userId`, `notice`, `date`) VALUES
(7, '11', 'Jatan', '2021-06-04 13:45:34'),
(8, '11', 'Jatan', '2021-06-04 13:48:10'),
(9, '11', 'Jatan Choudhary', '2021-06-04 13:52:34'),
(10, '19', 'Jatan Choudhary', '2021-06-05 09:37:51'),
(11, '19', 'Jatan is a great.', '2021-06-06 17:48:37'),
(12, '19', 'Jatan is a great.', '2021-06-06 17:49:47'),
(13, '21', 'Hello user', '2021-06-09 06:53:34'),
(14, '21', 'Hello Jatan Choudhary', '2021-06-09 07:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `otheraccounts`
--

CREATE TABLE `otheraccounts` (
  `id` int(11) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `bankName` varchar(111) NOT NULL,
  `holderName` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otheraccounts`
--

INSERT INTO `otheraccounts` (`id`, `accountNo`, `bankName`, `holderName`, `balance`, `date`) VALUES
(1, '12001122', 'MPL', 'Peter Parker', '40800', '2017-12-14 11:55:07'),
(2, '12001123', 'BOI', 'Steave Rorgers', '70000', '2017-12-14 11:55:07'),
(3, '12001124', 'SBI', 'Natasha Romonoff', '15000', '2017-12-14 11:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionId` int(11) NOT NULL,
  `action` varchar(111) DEFAULT NULL,
  `credit` varchar(111) DEFAULT NULL,
  `debit` varchar(111) DEFAULT NULL,
  `balance` varchar(111) DEFAULT NULL,
  `beneId` varchar(111) DEFAULT NULL,
  `other` varchar(111) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionId`, `action`, `credit`, `debit`, `balance`, `beneId`, `other`, `userId`, `date`) VALUES
(4, 'transfer', '', '200', '', '', '12001122', 1, '2017-12-14 12:33:40'),
(5, 'transfer', '', '200', '', '', '10054777', 1, '2017-12-14 12:56:48'),
(6, 'transfer', '', '333', '', '', '10054777', 1, '2017-12-14 12:57:20'),
(7, 'transfer', '', '222', '', '', '10054777', 1, '2017-12-14 12:58:19'),
(8, 'transfer', '', '333', '', '', '10054777', 1, '2017-12-14 13:00:23'),
(16, 'withdraw', '', '100', '', '', '23423', 1, '2017-12-15 08:31:59'),
(17, 'deposit', '1200', '', '', '', '234232', 1, '2017-12-15 08:32:17'),
(18, 'transfer', '', '467', '', '', '12001122', 1, '2017-12-17 06:44:48'),
(22, 'deposit', '1200', '', '', '', '32424', 2, '2017-12-17 06:56:29'),
(23, 'withdraw', '', '12', '', '', '23423', 2, '2017-12-17 06:59:02'),
(24, 'deposit', '12', '', '', '', '21321', 2, '2017-12-17 06:59:20'),
(25, 'transfer', '', '1200', '', '', '10054777', 1, '2017-12-17 07:01:37'),
(26, 'deposit', '600', '', '', '', '342342', 2, '2017-12-17 07:04:39'),
(27, 'withdraw', '', '1012', '', '', '23423', 2, '2017-12-17 07:04:58'),
(28, 'transfer', '', '5000', '', '', '12001124', 19, '2021-06-04 17:28:53'),
(29, 'transfer', '', '5000', '', '', '12001124', 19, '2021-06-05 12:29:57'),
(30, 'transfer', '', '5000', '', '', '1622827518', 19, '2021-06-06 08:24:00'),
(31, 'transfer', '', '1000', '', '', '1622820697', 19, '2021-06-06 10:25:07'),
(32, 'transfer', '', '1000', '', '', '1622827518', 19, '2021-06-06 10:25:41'),
(33, 'transfer', '', '1000', '', '', '1622827518', 19, '2021-06-06 10:37:14'),
(34, 'transfer', '', '2000', '', '', '1622827518', 19, '2021-06-06 11:25:37'),
(35, 'transfer', NULL, '1000', NULL, NULL, '1622827518', 19, '2021-06-06 11:47:58'),
(36, 'transfer', NULL, '1000', NULL, NULL, '12001124', 19, '2021-06-06 12:38:21'),
(37, 'transfer', NULL, '5000', NULL, NULL, '12001124', 19, '2021-06-06 12:39:12'),
(38, 'transfer', NULL, '1000', NULL, NULL, '1622827518', 19, '2021-06-06 12:50:39'),
(39, 'transfer', NULL, '200', NULL, NULL, '12001124', 19, '2021-06-06 12:53:06'),
(40, 'transfer', NULL, '5000', NULL, NULL, '1622827518', 19, '2021-06-06 12:53:20'),
(41, 'transfer', NULL, '1000', NULL, NULL, '1622827518', 19, '2021-06-06 12:53:56'),
(42, 'transfer', NULL, '1000', NULL, NULL, '1622827518', 19, '2021-06-06 12:54:16'),
(43, 'transfer', NULL, '1000', NULL, NULL, '12001124', 19, '2021-06-06 12:56:43'),
(44, 'transfer', NULL, '5000', NULL, NULL, '1622827518', 19, '2021-06-06 13:09:03'),
(45, 'transfer', NULL, '49000', NULL, NULL, '1622827518', 19, '2021-06-06 13:09:35'),
(46, 'transfer', NULL, '1100', NULL, NULL, '12001124', 19, '2021-06-06 13:09:46'),
(47, 'transfer', NULL, '1000', NULL, NULL, '12001124', 19, '2021-06-06 13:11:26'),
(48, 'transfer', NULL, '40000', NULL, NULL, '1622827518', 19, '2021-06-06 13:35:07'),
(49, 'transfer', NULL, '1000', NULL, NULL, '12001124', 19, '2021-06-06 13:48:20'),
(50, 'transfer', NULL, '10000', NULL, NULL, '1622827518', 19, '2021-06-06 13:48:42'),
(51, 'transfer', NULL, '7000', NULL, NULL, '12001124', 19, '2021-06-06 13:49:00'),
(52, 'transfer', NULL, '1000', NULL, NULL, '12001124', 19, '2021-06-06 13:52:50'),
(53, 'transfer', NULL, '9000', NULL, NULL, '1622827518', 19, '2021-06-06 13:53:14'),
(54, 'transfer', NULL, '1000', NULL, NULL, '12001124', 19, '2021-06-06 13:54:11'),
(55, 'transfer', NULL, '8000', NULL, NULL, '1622827518', 19, '2021-06-06 13:54:27'),
(56, 'transfer', NULL, '1000', NULL, NULL, '101079737', 12, '2021-06-06 15:01:04'),
(57, 'transfer', NULL, '8000', NULL, NULL, '101079737', 19, '2021-06-06 15:08:45'),
(58, 'transfer', NULL, '8000', NULL, NULL, '1622827518', 12, '2021-06-06 15:10:30'),
(59, 'transfer', NULL, '8000', NULL, NULL, '1622813728', 12, '2021-06-06 15:11:37'),
(60, 'transfer', NULL, '1000', NULL, NULL, '12001124', 12, '2021-06-06 15:17:03'),
(61, 'transfer', NULL, '7000', NULL, NULL, '1622827518', 12, '2021-06-06 15:18:41'),
(62, 'transfer', NULL, '10000', NULL, NULL, NULL, 12, '2021-06-06 16:00:49'),
(63, 'transfer', NULL, '1000', NULL, NULL, '12001124', 19, '2021-06-06 16:05:15'),
(64, 'transfer', NULL, '10000', NULL, NULL, NULL, 19, '2021-06-06 16:05:45'),
(65, 'transfer', NULL, '7000', NULL, NULL, '1622827518', 12, '2021-06-06 16:25:02'),
(66, 'transfer', NULL, '10000', NULL, NULL, '12001124', 12, '2021-06-06 16:38:05'),
(67, 'transfer', NULL, '1000', NULL, NULL, '101079737', 12, '2021-06-06 16:45:11'),
(68, 'transfer', NULL, '10000', NULL, NULL, '1622813728', 12, '2021-06-06 17:01:50'),
(69, 'transfer', NULL, '10000', NULL, NULL, '1622827518', 12, '2021-06-06 17:02:24'),
(70, 'transfer', NULL, '5000', NULL, NULL, '101079737', 19, '2021-06-06 17:03:06'),
(71, 'transfer', NULL, '25000', NULL, NULL, '101079737', 19, '2021-06-06 17:04:19'),
(72, 'transfer', NULL, '10000', NULL, NULL, '101079737', 19, '2021-06-06 17:05:56'),
(73, 'transfer', NULL, '5000', NULL, NULL, '1622827518', 12, '2021-06-06 17:09:57'),
(74, 'transfer', NULL, '45000', NULL, NULL, '1622827518', 12, '2021-06-06 17:10:26'),
(75, 'transfer', NULL, '50000', NULL, NULL, '101079737', 19, '2021-06-06 17:11:17'),
(76, 'transfer', NULL, '50000', NULL, NULL, '12001124', 12, '2021-06-06 17:12:20'),
(77, 'deposit', '2000', NULL, NULL, NULL, '123445', 16, '2021-06-06 18:38:28'),
(78, 'transfer', NULL, '4000', NULL, NULL, '12001123', 19, '2021-06-06 18:44:06'),
(79, 'withdraw', NULL, '6000', NULL, NULL, '565', 19, '2021-06-07 11:47:12'),
(80, 'withdraw', NULL, '6000', NULL, NULL, '565', 19, '2021-06-07 11:47:27'),
(81, 'withdraw', NULL, '6000', NULL, NULL, '26666', 19, '2021-06-07 11:52:46'),
(82, 'withdraw', NULL, '6000', NULL, NULL, '26666', 19, '2021-06-07 11:52:52'),
(83, 'withdraw', NULL, '6000', NULL, NULL, '26666', 19, '2021-06-07 11:54:42'),
(84, 'withdraw', NULL, '6000', NULL, NULL, '26666', 19, '2021-06-07 11:55:09'),
(85, 'withdraw', NULL, '1000', NULL, NULL, '666', 19, '2021-06-07 12:00:54'),
(86, 'withdraw', NULL, '1000', NULL, NULL, '545', 19, '2021-06-07 12:04:43'),
(87, 'withdraw', NULL, '2000', NULL, NULL, '123', 19, '2021-06-07 12:04:57'),
(88, 'withdraw', NULL, '1000', NULL, NULL, '12345', 19, '2021-06-07 12:05:26'),
(89, 'withdraw', NULL, '3000', NULL, NULL, '12345', 19, '2021-06-07 14:33:54'),
(90, 'deposit', NULL, '30000', NULL, NULL, '1222', 19, '2021-06-07 14:54:28'),
(91, 'withdraw', NULL, '891000', NULL, NULL, '1221', 19, '2021-06-07 15:07:19'),
(92, 'deposit', '1000', NULL, NULL, NULL, '122', 19, '2021-06-07 15:08:27'),
(93, 'withdraw', NULL, '1100', NULL, NULL, '10000', 19, '2021-06-07 15:08:40'),
(94, 'deposit', NULL, '100', NULL, NULL, '5254', 19, '2021-06-07 15:10:27'),
(95, 'withdraw', NULL, '1000', NULL, NULL, '152', 19, '2021-06-07 15:10:39'),
(96, 'deposit', NULL, '2000', NULL, NULL, '545', 19, '2021-06-07 15:11:24'),
(97, 'withdraw', NULL, '1000', NULL, NULL, '754', 19, '2021-06-07 15:11:46'),
(98, 'withdraw', NULL, '1000', NULL, NULL, '1000', 19, '2021-06-07 15:18:33'),
(99, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:18:58'),
(100, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:11'),
(101, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(102, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(103, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(104, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(105, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(106, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(107, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(108, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(109, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(110, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:27'),
(111, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(112, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(113, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(114, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(115, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(116, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(117, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(118, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:28'),
(119, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:29'),
(120, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:29'),
(121, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:29'),
(122, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:29'),
(123, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:29'),
(124, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:29'),
(125, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(126, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(127, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(128, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(129, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(130, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(131, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(132, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(133, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(134, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:30'),
(135, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(136, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(137, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(138, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(139, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(140, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(141, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(142, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(143, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(144, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(145, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(146, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(147, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(148, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:31'),
(149, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(150, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(151, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(152, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(153, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(154, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(155, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(156, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(157, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(158, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(159, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(160, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:32'),
(161, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(162, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(163, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(164, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(165, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(166, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(167, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(168, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(169, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(170, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(171, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:33'),
(172, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(173, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(174, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(175, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(176, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(177, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(178, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(179, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:34'),
(180, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(181, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(182, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(183, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(184, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(185, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(186, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(187, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(188, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(189, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(190, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(191, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(192, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(193, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(194, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(195, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(196, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(197, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(198, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(199, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:35'),
(200, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(201, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(202, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(203, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(204, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(205, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(206, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(207, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(208, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(209, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(210, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(211, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(212, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(213, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(214, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(215, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(216, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(217, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(218, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(219, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:36'),
(220, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(221, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(222, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(223, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(224, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(225, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(226, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(227, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(228, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(229, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(230, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(231, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(232, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(233, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(234, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(235, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(236, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(237, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(238, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:37'),
(239, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(240, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(241, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(242, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(243, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(244, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(245, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(246, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(247, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(248, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(249, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(250, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(251, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(252, 'withdraw', NULL, '1000', NULL, NULL, '100', 19, '2021-06-07 15:19:38'),
(253, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:11'),
(254, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:11'),
(255, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:11'),
(256, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:11'),
(257, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:11'),
(258, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:11'),
(259, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(260, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(261, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(262, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(263, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(264, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(265, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(266, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(267, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(268, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(269, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:12'),
(270, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(271, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(272, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(273, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(274, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(275, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(276, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(277, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(278, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(279, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(280, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(281, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(282, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(283, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:13'),
(284, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:14'),
(285, 'withdraw', NULL, '1000', NULL, NULL, '65', 19, '2021-06-07 15:28:14'),
(286, 'withdraw', NULL, '1000', NULL, NULL, '51515', 19, '2021-06-07 15:32:33'),
(287, 'deposit', NULL, '161000', NULL, NULL, '656', 19, '2021-06-07 16:30:46'),
(288, 'deposit', NULL, '1000', NULL, NULL, '1000', 19, '2021-06-07 16:31:17'),
(289, 'deposit', NULL, '100000', NULL, NULL, '100000', 19, '2021-06-07 16:31:35'),
(290, 'deposit', NULL, '100000', NULL, NULL, '100000', 19, '2021-06-07 16:31:35'),
(291, 'withdraw', NULL, '10000', NULL, NULL, '5268', 19, '2021-06-07 16:46:37'),
(292, 'withdraw', NULL, '10000', NULL, NULL, '5268', 19, '2021-06-07 16:47:17'),
(293, 'withdraw', NULL, '10000', NULL, NULL, '5268', 19, '2021-06-07 16:48:11'),
(294, 'withdraw', NULL, '1000', NULL, NULL, '122', 19, '2021-06-07 16:48:56'),
(295, 'withdraw', NULL, '1000', NULL, NULL, '5233', 19, '2021-06-07 17:06:00'),
(296, 'withdraw', NULL, '1000', NULL, NULL, '55', 19, '2021-06-07 17:32:26'),
(297, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:08'),
(298, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:08'),
(299, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:08'),
(300, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:08'),
(301, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:08'),
(302, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:08'),
(303, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:08'),
(304, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(305, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(306, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(307, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(308, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(309, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(310, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(311, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:09'),
(312, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:10'),
(313, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:10'),
(314, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:10'),
(315, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:10'),
(316, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:10'),
(317, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:10'),
(318, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:33:10'),
(319, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:07'),
(320, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:07'),
(321, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:07'),
(322, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:08'),
(323, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:08'),
(324, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:08'),
(325, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:08'),
(326, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:08'),
(327, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:08'),
(328, 'withdraw', NULL, '1000', NULL, NULL, '56356', 19, '2021-06-07 17:39:08'),
(329, 'withdraw', NULL, '1000', NULL, NULL, '554', 19, '2021-06-07 17:40:00'),
(330, 'withdraw', NULL, '1000', NULL, NULL, '55', 19, '2021-06-07 17:40:46'),
(331, 'withdraw', NULL, '1000', NULL, NULL, '75555555', 19, '2021-06-07 17:56:47'),
(332, 'withdraw', NULL, '1000', NULL, NULL, '75555555', 19, '2021-06-07 18:05:21'),
(333, 'withdraw', NULL, '1000', NULL, NULL, '75555555', 19, '2021-06-07 18:05:27'),
(334, 'withdraw', NULL, '1000', NULL, NULL, '4555', 19, '2021-06-07 18:05:49'),
(335, 'withdraw', NULL, '1000', NULL, NULL, '455', 19, '2021-06-07 18:17:24'),
(336, 'withdraw', NULL, '1000', NULL, NULL, '455', 19, '2021-06-07 18:52:53'),
(337, 'deposit', NULL, '2000', NULL, NULL, '545', 19, '2021-06-07 19:30:52'),
(338, 'transfer', NULL, '1000', NULL, NULL, '12001124', 21, '2021-06-09 06:43:30'),
(339, 'transfer', NULL, '1000', NULL, NULL, '12001124', 21, '2021-06-09 06:52:26'),
(340, 'transfer', NULL, '1000', NULL, NULL, '12001124', 21, '2021-06-09 07:01:05'),
(341, 'deposit', NULL, '5000', NULL, NULL, '1222', 21, '2021-06-09 07:03:17'),
(342, 'withdraw', NULL, '2000', NULL, NULL, '45566', 21, '2021-06-09 07:03:35');

-- --------------------------------------------------------

--
-- Table structure for table `useraccounts`
--

CREATE TABLE `useraccounts` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `cnic` varchar(111) NOT NULL,
  `number` varchar(111) NOT NULL,
  `city` varchar(111) NOT NULL,
  `address` varchar(111) NOT NULL,
  `source` varchar(111) NOT NULL,
  `accountNo` varchar(111) NOT NULL DEFAULT 'unique',
  `branch` varchar(111) NOT NULL,
  `accountType` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraccounts`
--

INSERT INTO `useraccounts` (`id`, `email`, `password`, `name`, `balance`, `cnic`, `number`, `city`, `address`, `source`, `accountNo`, `branch`, `accountType`, `date`) VALUES
(20, 'starkinitiative@gmail.com', '1233456', 'Tony Stark ', '10000000', '15256555665', '1345688884', 'Khandwa', 'khandwa', 'Stark Industries', '1556074472', '2', 'saving', '2021-06-08 20:18:25'),
(21, 'jatan@gmail.com', '12345', 'Jatan Choudhary', '10000', '113345655665', '1234567899', 'Khandwa', 'khandwa', 'Programmer', '713315019', '2', 'current', '2021-06-09 06:18:15'),
(22, 'starkinitiative@gmail.com', '12345', 'Tony Stark ', '1000000', '1021232353', '125564566', 'newyork', 'USA', 'Stark Industries', '780475391', '2', 'current', '2021-06-09 06:54:45'),
(23, 'stark@gmail.com', '12334', 'stark', '100000', '14554456', '564545454', 'newyork', 'USA', 'Stark Industries', '645775789', '2', 'current', '2021-06-09 07:05:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionId`);

--
-- Indexes for table `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `otheraccounts`
--
ALTER TABLE `otheraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
