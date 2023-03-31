-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 31, 2023 at 07:03 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'hallo', '2023-03-24 05:55:00', '2023-03-24 05:55:00'),
(55, 1, 'fsdfsf', '2023-03-24 05:52:20', '2023-03-24 05:52:20'),
(54, 1, 'dsds', '2023-03-24 05:50:59', '2023-03-24 05:50:59'),
(53, 2, 'dfsdfs', '2023-03-24 05:44:35', '2023-03-24 05:44:35'),
(52, 2, 'dsfsdf', '2023-03-24 05:44:30', '2023-03-24 05:44:30'),
(51, 2, 'fsdfdsf', '2023-03-24 05:44:28', '2023-03-24 05:44:28'),
(50, 2, 'fsdfsdfsdf', '2023-03-24 05:44:26', '2023-03-24 05:44:26'),
(49, 2, 'fsafsdfsf', '2023-03-24 05:44:22', '2023-03-24 05:44:22'),
(48, 2, 'dasd', '2023-03-24 05:44:08', '2023-03-24 05:44:08'),
(47, 1, 'sadsad', '2023-03-24 05:37:23', '2023-03-24 05:37:23'),
(46, 2, 'fsdfsdf', '2023-03-24 05:37:17', '2023-03-24 05:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '0000_00_00_000000_create_websockets_statistics_entries_table', 2),
(7, '2022_01_08_110616_create_messages_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'admin@gmail.com', '756b593216b44dae8bfb8efbb20433378f33669e6a5a6474bef0797672b4c7f4', '[\"*\"]', NULL, NULL, '2023-03-27 23:35:34', '2023-03-27 23:35:34'),
(2, 'App\\Models\\User', 1, 'admin@gmail.com', '070d4fa3e1256592684892d214450883f9dce84b2d4002d12e84d5e5f919d23d', '[\"*\"]', NULL, NULL, '2023-03-27 23:39:03', '2023-03-27 23:39:03'),
(3, 'App\\Models\\User', 1, 'admin@gmail.com', '6614ee5062fb32c061c84d58251549224429285538d380e4ddf1ad1e71e8055a', '[\"*\"]', NULL, NULL, '2023-03-27 23:39:51', '2023-03-27 23:39:51'),
(4, 'App\\Models\\User', 1, 'admin@gmail.com', '832f45e4c0e36ff5ab16f675ffbaba39c8753207b3a9e61026b4af75624a2f91', '[\"*\"]', NULL, NULL, '2023-03-27 23:40:02', '2023-03-27 23:40:02'),
(5, 'App\\Models\\User', 1, 'admin@gmail.com', 'a7ee8c9f22490bba96cdbcac508ae56f46e1267f663dbe391f4179b6e9dc349a', '[\"*\"]', NULL, NULL, '2023-03-27 23:40:57', '2023-03-27 23:40:57'),
(6, 'App\\Models\\User', 1, 'admin@gmail.com', '2f5d3cda0ccc33935effa9058fcc21122949cf5f7be483786df96fb1da8aa70a', '[\"*\"]', NULL, NULL, '2023-03-27 23:44:50', '2023-03-27 23:44:50'),
(7, 'App\\Models\\User', 1, 'admin@gmail.com', '5871649a0b08cd2a73a20a2809c7c1662bb970fee72aa76226fca486edb77efe', '[\"*\"]', NULL, NULL, '2023-03-27 23:45:50', '2023-03-27 23:45:50'),
(8, 'App\\Models\\User', 1, 'admin@gmail.com', '425654b5f958260ed28c7c72e1255f08b3fca1812d81d08f98e58f68ed21a490', '[\"*\"]', NULL, NULL, '2023-03-28 00:14:50', '2023-03-28 00:14:50'),
(9, 'App\\Models\\User', 1, 'admin@gmail.com', 'a45fec20aef48dc297ab065366aafcd3e439c4ca306b2706a2b0903b4c19c2bd', '[\"*\"]', NULL, NULL, '2023-03-28 00:15:39', '2023-03-28 00:15:39'),
(10, 'App\\Models\\User', 1, 'admin@gmail.com', 'fdc32bddf30847627d9f70743debae9c89ffc89690bded319fddf7bf83ef3ef1', '[\"*\"]', NULL, NULL, '2023-03-28 00:18:05', '2023-03-28 00:18:05'),
(11, 'App\\Models\\User', 1, 'admin@gmail.com', '8c745c011d5556ed542c8cbf0c98a17d4d576d52c6af0f69aef548ab1ab764ab', '[\"*\"]', NULL, NULL, '2023-03-28 00:18:08', '2023-03-28 00:18:08'),
(12, 'App\\Models\\User', 1, 'admin@gmail.com', 'c0d7376c1f3248183f0945dd85b2dc80c84132cbc1c39157408061dd2964158c', '[\"*\"]', NULL, NULL, '2023-03-28 00:18:16', '2023-03-28 00:18:16'),
(13, 'App\\Models\\User', 1, 'admin@gmail.com', '327f01b684191e222a177897a00c5b2477b92d974530c77162a44ea34a62306d', '[\"*\"]', NULL, NULL, '2023-03-28 00:18:16', '2023-03-28 00:18:16'),
(14, 'App\\Models\\User', 1, 'admin@gmail.com', '3c0baed0dd65453ae0de4b294258b00918eb963f1728927e6c6ad7e4ad88b6ac', '[\"*\"]', NULL, NULL, '2023-03-28 00:18:17', '2023-03-28 00:18:17'),
(15, 'App\\Models\\User', 1, 'admin@gmail.com', 'f01090f5cc07b7fb293c712a4e39ab5391857e564799987827fca6764b9f385f', '[\"*\"]', NULL, NULL, '2023-03-28 00:18:20', '2023-03-28 00:18:20'),
(16, 'App\\Models\\User', 1, 'admin@gmail.com', 'f5cf3d241856e0e04d84c5219a4c0b00cfb0b439430de2cfd55438efacdc9b9b', '[\"*\"]', NULL, NULL, '2023-03-28 00:58:21', '2023-03-28 00:58:21'),
(17, 'App\\Models\\User', 1, 'admin@gmail.com', '486412d39ede73664d247286674daa574124435052a003d651b14ef94c2206ab', '[\"*\"]', NULL, NULL, '2023-03-28 01:00:56', '2023-03-28 01:00:56'),
(18, 'App\\Models\\User', 1, 'admin@gmail.com', '36c366b72e74e09950a3cd0d2798397245d52eeddf060445dd7a99d4b355851b', '[\"*\"]', NULL, NULL, '2023-03-28 05:13:34', '2023-03-28 05:13:34'),
(19, 'App\\Models\\User', 1, 'admin@gmail.com', '1ecadb2a4c1ba8cdbb4f5a0541744950532d20122cd09e35c631c84ec5761895', '[\"*\"]', NULL, NULL, '2023-03-28 05:14:46', '2023-03-28 05:14:46'),
(20, 'App\\Models\\User', 1, 'admin@gmail.com', '05503944f1871de3942f182af69d3e310ad513c5487c99c42ebe7c02030f4b49', '[\"*\"]', NULL, NULL, '2023-03-28 05:14:51', '2023-03-28 05:14:51'),
(21, 'App\\Models\\User', 1, 'admin@gmail.com', 'cf66923bb85936bd1791b154e214d8fb4acff851731271aacc62e2d7582f0a85', '[\"*\"]', NULL, NULL, '2023-03-28 05:15:59', '2023-03-28 05:15:59'),
(22, 'App\\Models\\User', 1, 'admin@gmail.com', '933c6b7763f1266fe1b605a7e244df9e79c0d1432fbe6d2b1d6465353a90a93f', '[\"*\"]', NULL, NULL, '2023-03-28 05:17:20', '2023-03-28 05:17:20'),
(23, 'App\\Models\\User', 1, 'admin@gmail.com', '69d76e9102184d3584eae3a270ff311d94cd5b26142398e55216ce9ca2531422', '[\"*\"]', NULL, NULL, '2023-03-28 05:20:25', '2023-03-28 05:20:25'),
(24, 'App\\Models\\User', 1, 'admin@gmail.com', '82e30ed4d4691803d50c1a47aab9bdb24616ccc9c53671602b0add4a887fefac', '[\"*\"]', NULL, NULL, '2023-03-28 05:24:37', '2023-03-28 05:24:37'),
(25, 'App\\Models\\User', 1, 'admin@gmail.com', 'ed9b48657aa50c450dd0d84e205096536b25d1338edfa8728ded91cce21d40b9', '[\"*\"]', NULL, NULL, '2023-03-28 05:25:31', '2023-03-28 05:25:31'),
(26, 'App\\Models\\User', 1, 'admin@gmail.com', '95d00048296c198ad02794c79f4fb6a1e8ddc3ed706c3d5ff2758832a861dcc3', '[\"*\"]', NULL, NULL, '2023-03-28 05:37:05', '2023-03-28 05:37:05'),
(27, 'App\\Models\\User', 1, 'admin@gmail.com', '2f1122a57972042b79c5bf723c4b049042123c0bcf258b731ae028ca47037ad1', '[\"*\"]', NULL, NULL, '2023-03-28 05:50:27', '2023-03-28 05:50:27'),
(28, 'App\\Models\\User', 1, 'admin@gmail.com', '1d348f04948a0c80fab524bc4219ff9dc06d5c57102672d26601915221618e3d', '[\"*\"]', NULL, NULL, '2023-03-28 05:50:48', '2023-03-28 05:50:48'),
(29, 'App\\Models\\User', 1, 'admin@gmail.com', '7b686a9fffad97f5462cac0aa206d0cf6aa814314bdd12ac3657fcba6ec06348', '[\"*\"]', NULL, NULL, '2023-03-28 05:52:58', '2023-03-28 05:52:58'),
(30, 'App\\Models\\User', 1, 'admin@gmail.com', '72bf607baaae9d47901a70755e28de3e5eac1dc0124a07373fd5c94c6fe35dfe', '[\"*\"]', NULL, NULL, '2023-03-28 23:45:52', '2023-03-28 23:45:52'),
(31, 'App\\Models\\User', 1, 'admin@gmail.com', 'a0c6464ed6974b7864a1d9dc498d2b8e332d835db79b5cd45f32f9ba74fbad99', '[\"*\"]', NULL, NULL, '2023-03-28 23:45:54', '2023-03-28 23:45:54'),
(32, 'App\\Models\\User', 1, 'admin@gmail.com', '6b33e277319027dc7fac9edae0cf104930ffd7965eeeeb50c76544f2c63d9aca', '[\"*\"]', NULL, NULL, '2023-03-28 23:45:59', '2023-03-28 23:45:59'),
(33, 'App\\Models\\User', 1, 'admin@gmail.com', '9c24bcb1e265e22633fbd7bc9ce09299b7cbd23d26e7b154d998defd005893a4', '[\"*\"]', NULL, NULL, '2023-03-28 23:46:18', '2023-03-28 23:46:18'),
(34, 'App\\Models\\User', 1, 'admin@gmail.com', 'fee30ac5564adb866fbc8d8d3ded92fd999b1ad6feba2d4379d54108bbf36b6d', '[\"*\"]', NULL, NULL, '2023-03-28 23:47:31', '2023-03-28 23:47:31'),
(35, 'App\\Models\\User', 1, 'admin@gmail.com', 'da73576143985041cfdf8d7c85d479fc985c31123d10eeb9ceaf9f869f2cfc9f', '[\"*\"]', NULL, NULL, '2023-03-28 23:48:52', '2023-03-28 23:48:52'),
(36, 'App\\Models\\User', 1, 'admin@gmail.com', '5b6fa1e471953d99f658a60319f743a93c5981ade1f8e60c7896ff8bb83e2704', '[\"*\"]', NULL, NULL, '2023-03-28 23:53:32', '2023-03-28 23:53:32'),
(37, 'App\\Models\\User', 1, 'admin@gmail.com', 'b6d6a5253d1ae87c34d04809937dacbbc22e836a573e035c0a05849e4f965b01', '[\"*\"]', NULL, NULL, '2023-03-29 00:01:43', '2023-03-29 00:01:43'),
(38, 'App\\Models\\User', 1, 'admin@gmail.com', '42c7e5bdbe1633f169d2b9ea5539400bc3e6d4f0a220bf0aa447957901766c48', '[\"*\"]', NULL, NULL, '2023-03-29 00:06:31', '2023-03-29 00:06:31'),
(39, 'App\\Models\\User', 1, 'admin@gmail.com', '7065127d808f55b5f065621f8330e4f5fd86164da44efe345e87a9bd47022871', '[\"*\"]', NULL, NULL, '2023-03-29 00:14:41', '2023-03-29 00:14:41'),
(40, 'App\\Models\\User', 1, 'admin@gmail.com', 'f3e6539119c2df533338fc470d7dbae5977a815c568bae6491aec34ad3fda965', '[\"*\"]', NULL, NULL, '2023-03-29 00:26:17', '2023-03-29 00:26:17'),
(41, 'App\\Models\\User', 1, 'admin@gmail.com', '84516e1cc94fa953483f2eb463badcd9f0fdb0a7f7605c88392b576fcb1b77f7', '[\"*\"]', NULL, NULL, '2023-03-29 00:37:17', '2023-03-29 00:37:17'),
(42, 'App\\Models\\User', 1, 'admin@gmail.com', '0ff696c42ffac59172c975b8f8b56e31981e5a3e132f78fb06d0fb44b48d9757', '[\"*\"]', NULL, NULL, '2023-03-29 00:38:25', '2023-03-29 00:38:25'),
(43, 'App\\Models\\User', 1, 'admin@gmail.com', 'b1926a0c41d61a3a1add297f37bc017659d2e8a76356ed6d43e8cc6aaaf96258', '[\"*\"]', NULL, NULL, '2023-03-29 00:40:05', '2023-03-29 00:40:05'),
(44, 'App\\Models\\User', 1, 'admin@gmail.com', '81790d2db546f3c400686cc203a311525755a1dfff76eaa820bba652793dfbb1', '[\"*\"]', NULL, NULL, '2023-03-29 00:47:02', '2023-03-29 00:47:02'),
(45, 'App\\Models\\User', 1, 'admin@gmail.com', 'ec74575e7cc2b7e86aad08ddb2d486acf962c37551838f73d55fffa8e0e62f6a', '[\"*\"]', NULL, NULL, '2023-03-30 06:22:01', '2023-03-30 06:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'dsad', 'admin@gmail.com', NULL, '$2y$10$wAlqpHnjd1c8oTb0TtMVpe4ZuJ9ickJb1uuZfKYV7ElOmAGXgMrxq', 'i2Pq8dy2URISHPiyjQBsbC0f31ksJu0i6EArHNSmBqQvGaadvFVkAdlLbtx0', '2023-03-23 00:48:35', '2023-03-23 07:26:27'),
(2, 'test', 'test@gmail.com', NULL, '$2y$10$1flfr7vUihxJMkqKfhwgiOB2JOhbxn/xlykIcCnYJkYJdozKVeAHq', NULL, '2023-03-24 03:43:11', '2023-03-24 03:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
CREATE TABLE IF NOT EXISTS `websockets_statistics_entries` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int NOT NULL,
  `websocket_message_count` int NOT NULL,
  `api_message_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
