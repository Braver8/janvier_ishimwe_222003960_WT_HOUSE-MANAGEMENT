-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 11:52 AM
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
-- Database: `house_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `contract_id` int(11) NOT NULL,
  `landlord_id` int(11) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rent` decimal(10,2) DEFAULT NULL,
  `deposit` decimal(10,2) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landlords`
--

CREATE TABLE `landlords` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `landlords`
--

INSERT INTO `landlords` (`id`, `name`, `email`, `phone`, `address`) VALUES
(2, 'janvier braver', 'juniorrukundo95@gmail.com', '0733320377', '123eg'),
(3, 'janvier braver', 'junior95@gmail.com', '0733320377', '123eg'),
(6, 'sdfgh', 'aaaaa@gmail.com', '0733320377', '123eggh');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `rent` decimal(10,2) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `address`, `rent`, `bedrooms`, `bathrooms`, `description`) VALUES
(1, '', 0.00, 0, 0, ''),
(2, '123eg', 1.00, 2, 2, 'gbnbvhbvhvcdxsxc vgbhngbvfdcxs'),
(3, '123eg', 1.00, 2, 2, 'more too'),
(4, '1we', 123.00, 1, 2, '1222222222dssasdfgfdsa'),
(5, '123eg', 1.00, 2, 2, 'fdfvbg'),
(6, '123eg', 1.00, 2, 2, 'bhn'),
(7, '123eg', 1.00, 2, 2, 'sdfghj');

-- --------------------------------------------------------

--
-- Table structure for table `property_table`
--

CREATE TABLE `property_table` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_src` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_table`
--

INSERT INTO `property_table` (`id`, `title`, `description`, `price`, `image_src`) VALUES
(1, 'Luxurious Mansion', '6 bedrooms | 5 bathrooms', 1500000.00, 'house7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `move_in_date` date NOT NULL,
  `rent_amount` decimal(10,2) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `name`, `email`, `phone`, `move_in_date`, `rent_amount`, `property_id`) VALUES
(3, 'John Doe', 'johndoe@example.com', '123-456-7890', '2024-04-15', 1200.00, 1),
(5, 'braverr', 'bb@gmail.com', '0788888', '2024-04-17', 1234.00, 3),
(6, 'janvier braver', 'juniorrukundo95@gmail.com', '0733320377', '2024-04-27', 123456.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'john_doe', 'john@example.com', 'hashed_password_here', '2024-04-16 13:12:15'),
(2, 'Umuseso', 'aaaaa@gmail.com', '$2y$10$vsbeSWRBaFj60MrVBz.bV.d/.3Ns55HvVrNMfP0LdZfbf/hz6d9CS', '2024-04-16 13:31:33'),
(3, 'Umuseso', 'aaaaa@gmail.com', '$2y$10$yD9KVLcMkMjw4oSkJHZRC.PuOWr2xbyiDCjmc5v1YJyuGxe9IvPDS', '2024-04-16 22:29:36'),
(4, 'Umuseso', 'aaaaa@gmail.com', '$2y$10$Y1.4k685Svn4SV4weEoFvO0Ym/j6bIG2B6Fg1UAi5aCf/PpY2JIn6', '2024-04-16 22:34:11'),
(5, 'Umuseso', 'aaaaa@gmail.com', '$2y$10$ayzc4jg4pN9OSPQ5E4qzoO2jW0IZtLR1q17KyE/7bXnSDI6UB0UPa', '2024-04-16 22:37:34'),
(6, 'Umuseso', 'juniorrukundo95@gmail.com', '$2y$10$E7rCR5WnueBw5nSJIXxob.JcdALTUF/rplr3mSIeNGBdw1k.cJgSC', '2024-04-16 22:37:58'),
(7, 'Umuseso', 'juniorrukundo95@gmail.com', '$2y$10$tcFMsr/51YI1hacTHhTujO4qqVqeRKtII96Mj.OALeY9hAKoSxTVK', '2024-04-16 22:38:54'),
(8, 'janvier', 'Umuseso@gmail.com', '$2y$10$pY.fQebSO1UhtqnN3DcXRuXbb.AMBKoJEWrouT0ujsmnKPKBisxOO', '2024-04-17 09:19:30'),
(9, 'braver', 'braver@gmail.com', '$2y$10$IGd3r.dyWirqUYvdHDkZc.Yr30emDQP3DQ7cOK3vru4vMjokwlnw.', '2024-04-17 09:22:31'),
(10, 'umwana', 'umwana@gmail.com', '$2y$10$NdSrlT/SQpR2MeReV8k/D.X2G9N9XW3VKaypEkivh6aNVpV.Etmc6', '2024-04-17 09:39:05'),
(11, 'ishimwe', 'braver@gmail.com', '$2y$10$y6RvXQyx2GHYfMO/wZSa4.mDHsSPXb3v.97FhPpF7mYc30Wgotvqe', '2024-04-17 09:51:47'),
(12, 'umuryango', 'umuryango@gmail.com', '$2y$10$Nr0/dShNroZSE212DYQso.ppFzXCIio/SRuo3viHrQ/VAFzBB/yrK', '2024-04-17 09:53:37'),
(13, 'Jean', 'jeanpierreniyonshuti71@gmail.com', '$2y$10$pbyIlB1Z4T43i.6BQEZGmOB5rL4OrVxTUhmJDVdP2y5SW9rdQck3K', '2024-04-17 13:15:01'),
(14, 'kigali', 'kkk@gmail.com', '$2y$10$VdGdoQX4XO.Yxtenw8Uike8EK9e.Zh0KRgSwZmZROls9t5nsKv2QO', '2024-04-17 13:54:56'),
(15, 'dodai', 'dodai12@gmail.com', '$2y$10$PjJl1XrZUhKuSeCQz.r8duNaEIJtTUSq3doqzVq4xLTf0lT0Af2Fe', '2024-04-18 13:19:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `landlords`
--
ALTER TABLE `landlords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_contract` (`contract_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_table`
--
ALTER TABLE `property_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landlords`
--
ALTER TABLE `landlords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `property_table`
--
ALTER TABLE `property_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_contract` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`contract_id`);

--
-- Constraints for table `tenants`
--
ALTER TABLE `tenants`
  ADD CONSTRAINT `tenants_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
