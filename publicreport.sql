-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2023 at 04:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `publicreport`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(4) NOT NULL,
  `firstname` varchar(24) NOT NULL,
  `lastname` varchar(24) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `authorityuser`
--

CREATE TABLE `authorityuser` (
  `id` int(4) NOT NULL,
  `autorityId` int(4) NOT NULL,
  `firstname` varchar(24) NOT NULL,
  `lastname` varchar(24) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `localauthority`
--

CREATE TABLE `localauthority` (
  `id` int(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `geodata` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `localauthority`
--

INSERT INTO `localauthority` (`id`, `name`, `geodata`) VALUES
(1, 'sdfsdf', 'sdf'),
(2, 'asdasd', 'asdasda');

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `id` int(4) NOT NULL,
  `firstname` varchar(24) NOT NULL,
  `lastname` varchar(24) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(4) NOT NULL,
  `ipDevice` varchar(24) NOT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `descriprion` varchar(255) NOT NULL,
  `geodata` varchar(255) NOT NULL,
  `anonymously` int(4) NOT NULL,
  `firstname` varchar(24) DEFAULT NULL,
  `lastname` varchar(24) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `email` varchar(24) DEFAULT NULL,
  `status` int(4) NOT NULL DEFAULT 1,
  `declinedCount` int(4) NOT NULL DEFAULT 0,
  `localAuthorityId` int(4) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `ipDevice`, `imgUrl`, `category`, `descriprion`, `geodata`, `anonymously`, `firstname`, `lastname`, `phone`, `email`, `status`, `declinedCount`, `localAuthorityId`, `createDate`, `updateDate`) VALUES
(1, '234rew', '', 'ewer', 'werwer', 'wer', 1, NULL, NULL, NULL, NULL, 1, 0, 1, '2023-04-01 14:33:54', '2023-04-01 14:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `reportimg`
--

CREATE TABLE `reportimg` (
  `id` int(4) NOT NULL,
  `reportId` int(4) NOT NULL,
  `imgUrl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reportimg`
--

INSERT INTO `reportimg` (`id`, `reportId`, `imgUrl`) VALUES
(1, 1, 'asddaa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authorityuser`
--
ALTER TABLE `authorityuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorityfk` (`autorityId`);

--
-- Indexes for table `localauthority`
--
ALTER TABLE `localauthority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_fk` (`localAuthorityId`);

--
-- Indexes for table `reportimg`
--
ALTER TABLE `reportimg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reportimg_fk` (`reportId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authorityuser`
--
ALTER TABLE `authorityuser`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localauthority`
--
ALTER TABLE `localauthority`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reportimg`
--
ALTER TABLE `reportimg`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorityuser`
--
ALTER TABLE `authorityuser`
  ADD CONSTRAINT `authorityfk` FOREIGN KEY (`autorityId`) REFERENCES `localauthority` (`id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_fk` FOREIGN KEY (`localAuthorityId`) REFERENCES `localauthority` (`id`);

--
-- Constraints for table `reportimg`
--
ALTER TABLE `reportimg`
  ADD CONSTRAINT `reportimg_fk` FOREIGN KEY (`reportId`) REFERENCES `report` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
