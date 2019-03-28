-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 26, 2019 at 01:23 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facefly`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
CREATE TABLE IF NOT EXISTS `airlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `airline_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`id`, `airline_name`, `airline_code`) VALUES
(1, 'Vietnam Ailrlines', 'VN'),
(2, 'VietJet Airlines', 'VJ'),
(3, 'Quatar Airways', 'QR'),
(4, 'China Southern Airlines', 'CN');

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
CREATE TABLE IF NOT EXISTS `airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`id`, `airport_name`) VALUES
(1, 'Tan Son Nhat  International  Airport'),
(2, 'Noi Bai  International  Airport'),
(3, 'Phu Quoc Airport'),
(4, 'Da Nang Airport');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `city_airport_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_name`, `city_code`, `city_airport_id`, `created_at`, `updated_at`) VALUES
(1, 'TP. Hồ Chí Minh', 'SGN', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Hà Nội', 'HAN', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Phu Quoc', 'PQC', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Đà Nẵng', 'DAD', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_user_id` int(11) NOT NULL,
  `customer_book_id` int(11) NOT NULL,
  `customer_first_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_title` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_transfer` tinyint(4) NOT NULL DEFAULT '0',
  `customer_paypal` tinyint(4) NOT NULL DEFAULT '0',
  `customer_credit_card` tinyint(4) NOT NULL DEFAULT '0',
  `customer_credit_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_credit_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_credit_ccv` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_user_id`, `customer_book_id`, `customer_first_name`, `customer_last_name`, `customer_title`, `customer_transfer`, `customer_paypal`, `customer_credit_card`, `customer_credit_number`, `customer_credit_name`, `customer_credit_ccv`, `token`, `created_at`, `updated_at`) VALUES
(34, 18, 19, 'phuc', 'nguyen', 'mr', 1, 0, 0, '', '', '', 'k0ZkkW1hNQjzBd4EB2Cb3n4FaWulqZo9oGsaSqzp', '2019-03-25 18:15:40', '2019-03-25 18:15:40'),
(35, 20, 20, 'phuc', 'nguyen', 'mr', 1, 0, 0, '', '', '', 'k0ZkkW1hNQjzBd4EB2Cb3n4FaWulqZo9oGsaSqzp', '2019-03-25 18:16:48', '2019-03-25 18:16:48'),
(36, 20, 20, 'Hanh', 'nguyen', 'mr', 1, 0, 0, '', '', '', 'k0ZkkW1hNQjzBd4EB2Cb3n4FaWulqZo9oGsaSqzp', '2019-03-25 18:16:48', '2019-03-25 18:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `flight_booking`
--

DROP TABLE IF EXISTS `flight_booking`;
CREATE TABLE IF NOT EXISTS `flight_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_user_id` int(11) NOT NULL,
  `fb_fl_to_id` int(11) NOT NULL,
  `fb_fl_return_id` int(11) NOT NULL DEFAULT '0',
  `fb_class_id` tinyint(4) NOT NULL,
  `fb_total_person` int(11) NOT NULL,
  `fb_total_cost_to` float NOT NULL,
  `fb_total_cost_return` float NOT NULL DEFAULT '0',
  `fb_time_book` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_booking`
--

INSERT INTO `flight_booking` (`id`, `fb_user_id`, `fb_fl_to_id`, `fb_fl_return_id`, `fb_class_id`, `fb_total_person`, `fb_total_cost_to`, `fb_total_cost_return`, `fb_time_book`, `created_at`, `updated_at`) VALUES
(19, 18, 3, 0, 2, 1, 1650000, 0, '2019-03-26 01:15:40', '2019-03-25 18:15:40', '2019-03-25 18:15:40'),
(20, 20, 4, 2, 3, 2, 3120000, 3640000, '2019-03-26 01:16:48', '2019-03-25 18:16:48', '2019-03-25 18:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `flight_class`
--

DROP TABLE IF EXISTS `flight_class`;
CREATE TABLE IF NOT EXISTS `flight_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fc_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flight_class`
--

INSERT INTO `flight_class` (`id`, `fc_name`) VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'Premium Economy');

-- --------------------------------------------------------

--
-- Table structure for table `flight_lists`
--

DROP TABLE IF EXISTS `flight_lists`;
CREATE TABLE IF NOT EXISTS `flight_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fl_city_from_id` int(11) NOT NULL,
  `fl_city_to_id` int(11) NOT NULL,
  `fl_departure_date` datetime NOT NULL,
  `fl_landing_date` datetime NOT NULL,
  `fl_airline_id` int(11) NOT NULL,
  `fl_seat_limit` int(11) NOT NULL,
  `fl_total_seat` int(11) NOT NULL,
  `fl_cost` float NOT NULL,
  `fl_transit_count` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flight_lists`
--

INSERT INTO `flight_lists` (`id`, `fl_city_from_id`, `fl_city_to_id`, `fl_departure_date`, `fl_landing_date`, `fl_airline_id`, `fl_seat_limit`, `fl_total_seat`, `fl_cost`, `fl_transit_count`, `created_at`, `updated_at`) VALUES
(1, 3, 2, '2019-04-06 07:00:00', '2019-04-06 19:00:00', 1, 600, 0, 900000, 2, '2019-03-14 07:37:07', '0000-00-00 00:00:00'),
(2, 2, 1, '2019-03-06 06:00:00', '2019-03-06 08:00:00', 2, 600, 4, 1400000, 0, '2019-03-26 01:16:48', '2019-03-25 18:16:48'),
(3, 1, 2, '2019-03-30 07:30:00', '2019-03-30 10:00:00', 2, 2, 2, 1000000, 0, '2019-03-26 01:15:40', '2019-03-25 18:15:40'),
(4, 1, 2, '2019-03-20 11:30:00', '2019-03-20 15:00:00', 1, 600, 4, 1200000, 0, '2019-03-26 01:16:48', '2019-03-25 18:16:48'),
(5, 1, 2, '2019-04-16 08:00:00', '2019-04-16 15:30:00', 1, 600, 0, 1300000, 1, '2019-03-14 07:37:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transits`
--

DROP TABLE IF EXISTS `transits`;
CREATE TABLE IF NOT EXISTS `transits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transit_fl_city_from_id` int(11) NOT NULL,
  `transit_fl_departure_date` datetime NOT NULL,
  `transit_city_id` int(11) NOT NULL,
  `transit_date` datetime NOT NULL,
  `transit_time` time NOT NULL,
  `transit_landing_date` datetime NOT NULL,
  `transit_fl_id` int(11) NOT NULL,
  `transit_city_to_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transits`
--

INSERT INTO `transits` (`id`, `transit_fl_city_from_id`, `transit_fl_departure_date`, `transit_city_id`, `transit_date`, `transit_time`, `transit_landing_date`, `transit_fl_id`, `transit_city_to_id`) VALUES
(1, 3, '2019-04-06 07:00:00', 1, '2019-04-06 09:00:00', '02:00:00', '2019-04-06 15:00:00', 1, 4),
(2, 1, '2019-04-06 11:00:00', 4, '2019-04-06 15:00:00', '01:00:00', '2019-04-06 19:00:00', 1, 2),
(3, 1, '2019-04-16 08:00:00', 4, '2019-04-16 10:00:00', '01:30:00', '2019-04-16 15:30:00', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_access` datetime NOT NULL,
  `attempt` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `gender`, `birthdate`, `address`, `last_access`, `attempt`, `remember_token`, `created_at`, `updated_at`) VALUES
(17, 'phuc', 'nguyen', 'phuc.nv995@gmail.com', '$2y$10$Q6E5XEnhLun7DcQsJgPl5OcSBXGzBUD6Wtw0.15KLDUb7ufSfkAHq', '01676093546', 1, '2019-03-01', '48, 48', '0000-00-00 00:00:00', 0, 'V3327pYOWeQoJOWCQ8eN8RfFq3j8bhRBowRCnzKM1j8SiCR2iv1Sg0c2WnS7', '2019-03-05 08:13:06', '2019-03-05 08:16:24'),
(18, 'Phuc', 'Nguyen', 'phuc@gmail.com', '$2y$10$z3MXd//uD5a0HOPkTOpgN.AlQ0oIhzhMaqDQh9Nb9Z1CC/tC0Bw9m', '01676093546', 1, '2019-02-28', '48, 48', '2019-03-26 07:23:43', 0, 'kxXk3SsCzdnaEq92ssv6aQHKVrcnK9HQa0lYS87RHq3S1QJOUKiVAdO6kHVH', '2019-03-05 08:15:42', '2019-03-25 18:16:07'),
(20, 'hanh', 'Nguyen', 'hanh@gmail.com', '$2y$10$To2FQC1dORt8L.f3l3VT6.HcW84Ctgce8IuJKThiBHA5AB8x5LTdW', '01676093546', 0, '2019-03-01', 'Ho chi minh', '2019-03-26 08:16:17', 0, 'kbDIxnvj0o1z6D5WMBxBnJlB5JkBxtRItjAc6O4O0Q1OhBBhPAumu6ICcGbf', '2019-03-10 05:02:33', '2019-03-25 17:23:37'),
(21, 'Abc', 'XYZ', 'abc@gmail.com', '$2y$10$lDuUvniOkYr75G.2YOYEAeiu3kFbmaoNSP5rDb2kRNCH4Rjm3VQuW', '01676093546', 1, '2012-12-12', 'asasasasasasasasasa', '2019-03-11 19:03:48', 2, '4a6ki5wGzB3EYzusMKyV8j5QDCC0Zqa6QEXfVEY52aYCdmunogwsJD3UoUpg', '2019-03-11 04:59:26', '2019-03-11 05:02:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
