-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2025 at 11:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_giggear`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_checked_out` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `is_checked_out`, `updated_at`) VALUES
(3, 3, 2, 1, 0, '2025-05-14 08:27:28'),
(11, 2, 2, 4, 1, '2025-05-04 14:56:51'),
(13, 2, 1, 3, 1, '2025-05-04 14:56:48'),
(14, 2, 3, 2, 1, '2025-05-04 15:02:28'),
(15, 2, 1, 1, 1, '2025-05-04 15:02:28'),
(16, 2, 2, 1, 1, '2025-05-04 15:02:28'),
(18, 5, 15, 1, 1, '2025-05-04 16:40:29'),
(20, 5, 15, 2, 1, '2025-05-04 16:46:01'),
(21, 5, 1, 1, 1, '2025-05-04 16:46:01'),
(22, 5, 15, 1, 0, NULL),
(23, 2, 15, 2, 1, '2025-05-05 05:10:41'),
(24, 2, 10, 1, 1, '2025-05-05 05:10:41'),
(25, 2, 3, 1, 1, '2025-05-05 05:15:03'),
(26, 2, 15, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'alat musik', 'alat musik'),
(2, 'alat elektronik', 'alat elektronik yang kecil kecil'),
(4, 'perabot', 'perabot untuk menunjang bermusik');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guestbook`
--

CREATE TABLE `guestbook` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guestbook`
--

INSERT INTO `guestbook` (`id`, `name`, `message`, `created_at`) VALUES
(1, 'demeks', 'terimakasih.. websitenya keren', '2025-05-03 03:26:26'),
(2, 'yuka', 'bagusss', '2025-05-03 06:24:55'),
(3, 'faiq', 'coba website ini', '2025-05-04 16:36:03');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` enum('packaging','shipped','cancelled','completed') DEFAULT 'packaging',
  `payment_method` enum('debit','credit','cod') DEFAULT 'debit',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `payment_method`, `created_at`, `updated_at`) VALUES
(1, 2, 150000.00, 'completed', 'cod', '2025-05-04 13:31:55', '2025-05-04 14:43:08'),
(2, 2, 1200000.00, 'completed', 'cod', '2025-05-04 14:49:18', '2025-05-04 14:49:30'),
(3, 2, 2350000.00, 'completed', 'cod', '2025-05-04 15:02:28', '2025-05-04 15:03:50'),
(9, 5, 300000.00, 'cancelled', 'cod', '2025-05-04 16:40:29', '2025-05-04 16:45:18'),
(10, 5, 1800000.00, 'completed', 'debit', '2025-05-04 16:46:01', '2025-05-04 16:46:21'),
(11, 2, 5600000.00, 'completed', 'cod', '2025-05-05 05:10:41', '2025-05-05 05:14:08'),
(12, 2, 500000.00, 'packaging', 'cod', '2025-05-05 05:15:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, 1, 150000.00),
(2, 2, 1, 1, 1200000.00),
(3, 3, 3, 2, 500000.00),
(4, 3, 1, 1, 1200000.00),
(5, 3, 2, 1, 150000.00),
(18, 9, 15, 1, 300000.00),
(19, 10, 15, 2, 300000.00),
(20, 10, 1, 1, 1200000.00),
(21, 11, 15, 2, 300000.00),
(22, 11, 10, 1, 5000000.00),
(23, 12, 3, 1, 500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `image_url`, `category_id`, `created_at`) VALUES
(1, 'gitar', 1200000.00, 'gitar listrik scorpion stereocaster', 'scorpion.jpg', 1, '2025-04-29 08:21:14'),
(2, 'Kabel', 150000.00, 'kabel 1 roll', 'kabelroll.jpg', 2, '2025-04-29 12:15:18'),
(3, 'drum elektrik', 500000.00, 'drum elektrik yamaha dtx450', 'drum.jpg', 1, '2025-04-29 12:15:56'),
(5, 'Gitar Akustik', 800000.00, 'Gitar akustik Yamaha F310, suara jernih dan mudah dimainkan', 'gitar_akustik.jpg', 1, '2025-05-04 03:00:00'),
(6, 'Piano Digital', 6000000.00, 'Piano digital Casio, 88 tuts, cocok untuk pemula', 'piano_digital.jpg', 1, '2025-05-04 03:10:00'),
(7, 'Microphone Wireless', 150000.00, 'Microphone wireless untuk performance dan rekaman', 'mic_wireless.jpg', 2, '2025-05-04 03:20:00'),
(8, 'Headphone Sony', 1200000.00, 'Headphone Sony Noise Cancelling, nyaman untuk mendengarkan musik', 'headphone_sony.jpg', 2, '2025-05-04 03:30:00'),
(9, 'Speaker Bluetooth', 450000.00, 'Speaker portable bluetooth dengan suara bass yang kuat', 'speaker_bluetooth.jpg', 2, '2025-05-04 03:40:00'),
(10, 'Drum Kit Elektrik', 5000000.00, 'Drum kit elektrik Roland TD-17, ideal untuk latihan di rumah', 'drum_roland.jpg', 1, '2025-05-04 03:50:00'),
(11, 'Mixer Audio', 2200000.00, 'Mixer audio 8 kanal dengan efek built-in', 'mixer_audio.jpg', 2, '2025-05-04 04:00:00'),
(12, 'Keyboard Elektrik', 2000000.00, 'Keyboard Casio CT-X700 dengan suara organ dan piano', 'keyboard_casio.jpg', 1, '2025-05-04 04:10:00'),
(13, 'Gitar Bass', 3500000.00, 'Gitar bass Ibanez SR300E, mudah dimainkan dan nyaman', 'gitar_bass.jpg', 1, '2025-05-04 04:20:00'),
(15, 'kursi drum', 300000.00, 'kursi drum merk DW', 'kursi-drum.jpg', 4, '2025-05-04 16:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `shop_requests`
--

CREATE TABLE `shop_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_name` varchar(150) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `role` enum('customer','admin') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `date_of_birth`, `gender`, `address`, `city`, `contact_no`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '2004-08-12', 'Laki-laki', 'Petemon Kuburan 88a', 'surabaya', '085174316699', 'admin', '2025-04-30 11:59:29'),
(2, 'demeks', 'demek@gmail.com', '1212', '2000-03-23', 'Perempuan', 'Sidoarjo, Kahuripan Nirwarna', 'Sidoarjo', '083663661636', 'customer', '2025-05-02 08:17:10'),
(3, 'yuka', 'yuka@gmail.com', 'yuka', '2025-05-02', 'Perempuan', 'wonrejo', 'surabaya', '0816271271', 'customer', '2025-05-03 03:06:25'),
(4, 'rizal', 'rizal@gmail.com', 'rizal', '2004-12-08', 'Laki-laki', 'perum pondok jati', 'Sidoarjo', '0877366251312', 'admin', '2025-05-04 16:33:38'),
(5, 'faiq', 'faiq@gmail.com', 'faiq', '2012-12-12', 'Laki-laki', 'puncak bromo', 'Pasuruan', '083766471313', 'customer', '2025-05-04 16:34:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `guestbook`
--
ALTER TABLE `guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `shop_requests`
--
ALTER TABLE `shop_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guestbook`
--
ALTER TABLE `guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shop_requests`
--
ALTER TABLE `shop_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `shop_requests`
--
ALTER TABLE `shop_requests`
  ADD CONSTRAINT `shop_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
