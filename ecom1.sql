-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2024 at 03:43 PM
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
-- Database: `ecom1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `image`, `is_popular`) VALUES
(1, 'Vegetable', 'vegetable', '2023-04-08 11:08:35', '2023-04-30 21:43:20', '1682353773.webp', 1),
(7, 'Ground Vegetables', 'ground-vegetables', '2023-04-08 11:09:51', '2023-04-24 10:58:51', '1682353731.jpg', 1),
(13, 'Fruits', 'fruits', '2023-04-15 20:50:29', '2023-04-24 10:48:48', '1682353128.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `top_title` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `offer` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `top_title`, `title`, `sub_title`, `offer`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Mango', 'The King Of Friuts', 'Has Arrived', '20% off', 'http://localhost:8000/product/banganapalli-mango-1-kg', '1682912924.webp', 1, '2023-04-23 11:50:16', '2023-05-03 01:21:51'),
(4, 'Apple', 'Today offer', 'Ooty Apple', '30% off', 'http://localhost:8000/product/apple-shimla-4-pcs-approx-550-640-g', '1682912828.jpg', 1, '2023-04-23 12:13:19', '2023-05-03 01:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_08_133349_create_categories_table', 2),
(6, '2023_04_08_133621_create_products_table', 2),
(7, '2023_04_22_153734_create_home_sliders_table', 3),
(8, '2023_04_24_122650_add_image_and_is_popular_column_to_categories_table', 4),
(10, '2023_04_25_124642_create_orders_table', 5),
(11, '2023_04_25_124844_create_order_items_table', 5),
(12, '2023_04_25_124916_create_shippings_table', 5),
(13, '2023_04_25_124942_create_transactions_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `status` enum('ordered','delivered','canceled') NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `country`, `province`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`) VALUES
(19, 1, 200.00, 0.00, 42.00, 242.00, 'vikram', 'm', '6379935271', 'vikram@gmail.com', 'valappady', NULL, 'salem', 'india', 'tamil nadu', '636111', 'ordered', 0, '2023-05-03 01:52:19', '2023-05-03 01:52:19'),
(20, 4, 10.00, 0.00, 2.10, 12.10, 'vikram', 'mklermk', '6379935271', 'vikramathithan2002@gmail.com', 'rkegnkndkk', 'nkfnkdk', 'dkfk', 'dfkka', 'sdfk k', '639524', 'ordered', 0, '2024-05-31 07:13:26', '2024-05-31 07:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(18, 30, 19, 100.00, 2, '2023-05-03 01:52:19', '2023-05-03 01:52:19'),
(19, 21, 20, 10.00, 1, '2024-05-31 07:13:26', '2024-05-31 07:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outoofstock') NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) NOT NULL,
  `images` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`) VALUES
(18, 'Potato high', 'potato-high', 'its new', 'its new', 45.00, 35.00, 'DJKKDS', 'instock', 0, 15, '1681636902.jpg', NULL, 1, '2023-04-16 03:51:42', '2023-04-22 00:32:52'),
(21, 'Carrot - Orange (Loose), 250 g', 'carrot-orange-loose-250-g', 'A popular sweet-tasting root vegetable, Carrots are narrow and cone shaped.', 'A popular sweet-tasting root vegetable, Carrots are narrow and cone shaped.\nThey have thick, fleshy, deeply colored root, which grows underground, and feathery green leaves that emerge above the ground.\nWhile these greens are fresh tasting and slightly bitter, the carrot roots are crunchy textured with a sweet and minty aromatic taste', 10.00, 9.00, 'BCDJS', 'instock', 0, 20, '1682314698.jpg', NULL, 7, '2023-04-24 00:08:18', '2023-04-25 06:53:21'),
(22, 'Cabbage - Organically Grown (Loose), 1 pc (approx. 300-1.3 Kg)', 'cabbage-organically-grown-loose-1-pc-approx-300-13-kg', 'It is organically grown and handpicked from farm', 'It is organically grown and handpicked from farm\nProduct image shown is for representation purpose only, the actually product may vary based on season, produce & availability.', 17.00, 17.00, 'DJKKDS', 'instock', 1, 30, '1682315375.webp', NULL, 1, '2023-04-24 00:16:52', '2023-04-25 06:36:05'),
(23, 'Drumstick  250g', 'drumstick-250g', 'Drumsticks have long, dark green bumpy pods running along the length and fleshy pulp inside the pod encasing each seed.', 'Drumstick pods have a faint bitter taste combined with slight sweetness.\n', 16.00, 14.00, 'DRUM12', 'instock', 0, 13, '1682659954.jpg', NULL, 1, '2023-04-28 00:02:34', '2023-04-28 00:07:19'),
(24, 'Beans - Haricot (Loose), 1 kg', 'beans-haricot-loose-1-kg', 'The beans are very freah and grown organically.', 'Haricot beans are small, oval, plump and creamy-white with a mild flavour and a smooth, buttery texture.', 147.00, 132.00, 'BEAN34', 'instock', 1, 30, '1682660586.jpg', NULL, 1, '2023-04-28 00:13:06', '2023-04-28 00:13:06'),
(25, 'Brinjal - Varikatri (Loose), 1 kg', 'brinjal-varikatri-loose-1-kg', 'One of the bigger varieties, Brinjal Varikatris are egg- shaped with white-purple stripes on the shiny skin.', 'The creamy flesh is enjoyably bitter tasting with several small, soft edible seeds.', 98.00, 74.00, 'BRI56', 'instock', 0, 45, '1682661002.jpg', NULL, 1, '2023-04-28 00:20:02', '2023-05-01 23:49:53'),
(26, 'Radish - White (Loose), 1 kg', 'radish-white-loose-1-kg', 'Radishes are a root crop with a crunchy texture and a sharp, spicy, hot or sweet taste. ', 'They are juicy and sometimes have a pungent smell.', 67.00, 46.00, 'RAD76', 'instock', 1, 30, '1682661239.jpg', NULL, 7, '2023-04-28 00:23:59', '2023-04-28 01:49:28'),
(27, 'Ladies\' Fingers (Loose), 1 kg', 'ladies-fingers-loose-1-kg', 'Ladies\' finger is a green vegetable with a tip at the end and a lighter green head, which is inedible and to be thrown away. It tastes mild and slightly grassy.', 'Ladies\' finger or okra is a popular vegetable that is nutritious and has a high fibre content. It contains both soluble as well as insoluble fibres and is used in various recipes. The best way to select ladies\' finger is to look for smaller pods as they are tender. These also taste better. The brighter coloured ones and those that are unblemished, and firm are the best quality lady\'s finger. The ladies\' fingers are sourced directly from the farmers and brought to the shelves carefully, ensuring that the vegetable maintains its freshness and nutrients.\n', 36.00, 28.00, 'LAD58', 'instock', 0, 23, '1682661399.jpg', NULL, 1, '2023-04-28 00:26:39', '2023-04-28 00:26:39'),
(28, 'Snake Gourd, 1 kg', 'snake-gourd-1-kg', 'Snake gourds are true to their name as they have a long, curved shape with light green speckles and a waxy green skin.', 'Their firm flesh is embedded with seeds and they taste like cucumber and have a slightly bitter taste.\nThe fruits are orange in colour when ripe and pulpy red after complete ripening.', 70.00, 64.00, 'SNA45', 'instock', 0, 45, '1682661719.jpg', NULL, 1, '2023-04-28 00:31:59', '2023-04-28 00:31:59'),
(29, 'Papaya,1 kg', 'papaya1-kg', 'Papayas grow in tropical climates and are also known as papaws or pawpaws.', 'Initially green and slightly bitter in taste, papayas are butter-yellow when fully ripe and shaped like a pear.\nTheir pale-orange flesh has dozens of small, black, sticky seeds at the centre, like a melon', 34.00, 24.00, 'PAP34', 'instock', 0, 20, '1682664431.jpg', NULL, 13, '2023-04-28 01:17:11', '2023-04-28 01:17:11'),
(30, ' Banganapalli Mango, 1 kg', 'banganapalli-mango-1-kg', 'Banganpalli are sourced from Andhra Pradesh and known for their unique sweet and rich taste.', 'They are moderately juicy and aromatic with a maize-yellow colour.', 100.00, 89.00, 'MAN907', 'instock', 1, 25, '1683001108.jpg', NULL, 13, '2023-05-01 22:48:28', '2023-05-01 22:48:28'),
(31, 'Apple - Shimla, 4 pcs (Approx. 550 - 640 g)', 'apple-shimla-4-pcs-approx-550-640-g', 'We source the best apples with residue and wax free peel from the trusted growers.', 'Considered as most commonly grown apples in India, Shimla apples have a light red skin, juicy and crunchy flesh.', 235.00, 200.00, 'AP90', 'instock', 0, 15, '1683001522.jpg', NULL, 13, '2023-05-01 22:55:22', '2023-05-01 22:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(8, 1, 19, 'cod', 'pending', '2023-05-03 01:52:19', '2023-05-03 01:52:19'),
(9, 4, 20, 'cod', 'pending', '2024-05-31 07:13:26', '2024-05-31 07:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for Normal User',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'vikram', 'admin@vikram.com', NULL, '$2y$10$cRumF4JsS13IHBGL3DaVtuVVG1Phx/LzjdU7RpdavyFrcvqy5USbi', 'ADM', NULL, '2023-04-08 06:30:03', '2023-04-08 06:30:03'),
(3, 'dhanya', 'vikramathithan2002@gmail.com', NULL, '$2y$10$4FXzWFpOZk3jwfKhc7er0e8BOb.59UpB2Fq42xIPfNHO7HDdIn4We', 'USR', NULL, '2023-04-08 07:53:40', '2023-04-08 07:53:40'),
(4, 'admin', 'admin1@gmail.com', NULL, '$2y$10$xLYan9IhaAZW3zaNX5MmSeRyfKBG6nTcpaf9btDsgVsdxvxpxWLz2', 'ADM', NULL, '2024-05-31 07:09:06', '2024-05-31 07:09:06'),
(5, 'vikram', 'vikramathithan@gmail.com', NULL, '$2y$10$9DZM7K9uSJBzJp7Zm63O2e.2t1ed8xEsVAYvR5JWeEzv0.pGZg4Ta', 'ADM', NULL, '2024-05-31 08:01:03', '2024-05-31 08:01:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
