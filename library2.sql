-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 08:27 AM
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
-- Database: `library2`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_image` mediumtext DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `book_category` varchar(255) DEFAULT NULL,
  `book_stock` int(10) UNSIGNED DEFAULT NULL,
  `book_status` enum('enable','disable') NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_image`, `book_name`, `description`, `book_category`, `book_stock`, `book_status`) VALUES
(11, '681c76f5311ce_brainstorm (3).png', 'Nebulaaaaaaaaaa', 'ตาราง', 'ไร้สาระ', 10, 'enable'),
(12, '681d9cd754fd2_brainstorm (4).png', '123', 'asdasd', 'asdasd', 4545, 'enable'),
(13, '681d9ceae563b_4cc977554b91a63a.png', '456', '456456', '45645', 655, 'enable'),
(14, '681d9cf30519f_brainstorm (4).png', '456', '456456', '456456', 45645, 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `borrow_date` timestamp NULL DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL,
  `status` enum('wait','borrowing','deny','returned','missing','acknowledge','received','cancle') NOT NULL,
  `confirmer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `book_id`, `user_id`, `borrow_date`, `return_date`, `status`, `confirmer`) VALUES
(20, 11, 7, NULL, NULL, 'cancle', NULL),
(21, 11, 7, '2025-05-08 09:38:36', '2025-05-08 09:47:54', 'received', 'f_name l_name'),
(22, 11, 7, NULL, NULL, 'cancle', NULL),
(23, 11, 7, NULL, NULL, 'deny', 'f_name l_name'),
(24, 11, 7, '2025-05-08 09:48:43', '2025-05-08 09:52:45', 'acknowledge', 'f_name l_name'),
(25, 11, 7, '2025-05-08 12:43:52', '2025-05-09 05:56:32', 'received', 'f_name l_name'),
(26, 11, 7, '2025-05-08 12:45:39', NULL, 'missing', 'f_name l_name'),
(27, 11, 7, '2025-05-09 05:58:51', NULL, 'returned', 'f_name l_name'),
(28, 11, 7, '2025-05-09 05:59:13', NULL, 'returned', 'f_name l_name'),
(29, 11, 7, '2025-05-09 05:59:15', NULL, 'returned', 'f_name l_name');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `std_id` varchar(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` enum('user','moderator','admin','') NOT NULL DEFAULT 'user',
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `std_id`, `username`, `password`, `f_name`, `l_name`, `email`, `role`, `status`) VALUES
(7, '11111111111', 'admin', '$2y$10$O6MVNpKCRm.Rih.zWjuw4.51xbYlV68uKIOZLGxcjUZWATr6JJYFO', 'f_name', 'l_name', '1@gmail.com', 'admin', 'enable'),
(8, '22222222222', 'moderator', '$2y$10$EpENPoXHU/3H0ysEIe.gGedVfDmPf/xlOMlC2Tg8dMPAgrAn3/0k6', 'f_name', 'l_name', '2@gmail.com', 'moderator', 'enable'),
(9, '33333333333', 'user', '$2y$10$.ODJeQEqSIxDEsHZSxTCAusOrebmZ5kPTCVcWaaYVkk0TfnKoH.RG', 'f_name', 'l_name', '3@gmail.com', 'user', 'enable'),
(11, '66209010031', 'Nebula', '$2y$10$KFQsMO1qF7D5AgW3G88xkO0nLwjtdLIdyS8JD4H39rvVAs7mly0ly', 'panupong', 'suriyan', 'panupongsuriyan6@gmail.com', 'admin', 'enable');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `history_user` (`user_id`),
  ADD KEY `history_book` (`book_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `std_id` (`std_id`,`username`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `history_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
