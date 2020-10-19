-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2020 at 04:39 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab6`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleID`, `roleName`) VALUES
(1, 'Administrator'),
(2, 'Subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `isSendNotification` int(11) NOT NULL,
  `website` varchar(50) NOT NULL,
  `roleID` int(10) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `password`, `firstname`, `lastname`, `isSendNotification`, `website`, `roleID`, `email`) VALUES
('CE130438', '202cb962ac59075b964b07152d234b70', 'Minh Tin', 'Tang', 1, 'www.minhtin.com', 1, 'tin@gmail'),
('khang', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.tin.com', 2, 'minhtintang@gmail.com'),
('khang123', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.tin.com', 2, 'minhtintang@gmail.com'),
('khang12312', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.nhien.com', 2, 'minhtintang@gmail.com'),
('khangnv', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.tin.com', 2, 'minhtintang@gmail.com'),
('knv', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.tin.com', 2, 'minhtintang@gmail.com'),
('nhienht', '202cb962ac59075b964b07152d234b70', 'Nhien', 'Huynh', 0, 'www.nhien.com', 1, 'nhienht@gmail.com'),
('tin', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.tin.com', 1, 'minhtintang@gmail.com'),
('tintang', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.tin.com', 2, 'minhtintang@gmail.com'),
('tintm', '202cb962ac59075b964b07152d234b70', 'Tin', 'Tang', 1, 'www.tin.com', 2, 'tin@gmail'),
('vinh', '202cb962ac59075b964b07152d234b70', 'Minh', 'Tang', 1, 'www.nhien.com', 2, 'minhtintang@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`,`email`),
  ADD KEY `roleID` (`roleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
