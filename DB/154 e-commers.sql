-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.6-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6318
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- ec 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `ec` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `ec`;

-- 테이블 ec.categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.categories:~5 rows (대략적) 내보내기
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'consequatur accusamus', 'consequatur-accusamus', '2021-09-18 12:11:58', '2021-09-18 12:11:58'),
	(2, 'omnis et', 'omnis-et', '2021-09-18 12:11:58', '2021-09-18 12:11:58'),
	(3, 'accusantium fuga', 'accusantium-fuga', '2021-09-18 12:11:58', '2021-09-18 12:11:58'),
	(4, 'cupiditate est', 'cupiditate-est', '2021-09-18 12:11:58', '2021-09-18 12:11:58'),
	(5, 'tempora officiis', 'tempora-officiis', '2021-09-18 12:11:58', '2021-09-18 12:11:58'),
	(10, 'New Category3', 'new-category3', '2021-09-28 12:21:53', '2021-09-28 12:21:53');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- 테이블 ec.contacts 구조 내보내기
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.contacts:~2 rows (대략적) 내보내기
DELETE FROM `contacts`;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
	(1, '아이유', 'IU@IU.com', '01053788798', '연습용 메세지', '2021-10-10 13:30:43', '2021-10-10 13:30:43'),
	(2, '김고은', 'KimKoEun@Kim.com', '01053788798', '또다른 연습용 메세지', '2021-10-10 13:34:29', '2021-10-10 13:34:29');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

-- 테이블 ec.coupons 구조 내보내기
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.coupons:~2 rows (대략적) 내보내기
DELETE FROM `coupons`;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
	(1, 'OFF100', 'fixed', 100.00, 1000.00, '2021-10-03 02:20:33', '2021-10-05 08:20:34', '2021-10-03'),
	(2, 'OFF20P', 'percent', 20.00, 1200.00, '2021-10-03 06:12:22', '2021-10-03 06:12:46', '2021-10-05'),
	(5, 'OFF30P', 'percent', 30.00, 1300.00, '2021-10-05 06:11:04', '2021-10-05 08:13:27', '2021-10-09');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

-- 테이블 ec.failed_jobs 구조 내보내기
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.failed_jobs:~0 rows (대략적) 내보내기
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- 테이블 ec.home_categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `home_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.home_categories:~0 rows (대략적) 내보내기
DELETE FROM `home_categories`;
/*!40000 ALTER TABLE `home_categories` DISABLE KEYS */;
INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
	(1, '1,2,3,4,6', 8, '2021-09-26 16:23:29', '2021-09-26 11:58:15');
/*!40000 ALTER TABLE `home_categories` ENABLE KEYS */;

-- 테이블 ec.home_sliders 구조 내보내기
CREATE TABLE IF NOT EXISTS `home_sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.home_sliders:~1 rows (대략적) 내보내기
DELETE FROM `home_sliders`;
/*!40000 ALTER TABLE `home_sliders` DISABLE KEYS */;
INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
	(3, 'First Slide Title', 'First Slide Subtitle', '200', 'http://127.0.0.1:8000/shop', '1632542934.jpg', 1, '2021-09-25 04:08:54', '2021-09-25 04:08:54'),
	(4, 'Second Slide Title', 'Second Slide Subtitle', '500', 'http://127.0.0.1:8000/shop', '1632543828.jpg', 0, '2021-09-25 04:23:48', '2021-09-25 04:25:39');
/*!40000 ALTER TABLE `home_sliders` ENABLE KEYS */;

-- 테이블 ec.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.migrations:~16 rows (대략적) 내보내기
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2021_09_17_090811_create_sessions_table', 1),
	(7, '2021_09_18_110832_create_categories_table', 2),
	(8, '2021_09_18_111003_create_products_table', 2),
	(9, '2021_09_24_232649_create_home_sliders_table', 3),
	(10, '2021_09_26_070325_create_home_categories_table', 4),
	(11, '2021_09_27_044112_create_sales_table', 5),
	(12, '2021_10_02_231858_create_coupons_table', 6),
	(13, '2021_10_05_052642_add_expiry_date_to_coupons_table', 7),
	(14, '2021_10_05_082909_create_orders_table', 8),
	(15, '2021_10_05_083056_create_order_items_table', 8),
	(16, '2021_10_05_083504_create_shippings_table', 8),
	(17, '2021_10_05_083646_create_transactions_table', 8),
	(18, '2021_10_08_122020_add_delivered_canceled_date_to_orders_table', 9),
	(19, '2021_10_09_002414_create_reviews_table', 10),
	(20, '2021_10_09_003638_add_rstatus_to_order_items_table', 10),
	(21, '2021_10_10_081748_create_contacts_table', 11),
	(22, '2021_10_10_223426_create_settings_table', 12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- 테이블 ec.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.orders:~5 rows (대략적) 내보내기
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
	(1, 2, 454.00, 0.00, 95.34, 549.34, 'IU', 'IU', '01053788798', 'IU@IU.com', 'test line1', 'test line2', 'Seoul', 'sung-nam', 'Korea', '123456', 'delivered', 1, '2021-10-06 04:16:08', '2021-10-08 13:24:11', '2021-10-08', NULL),
	(2, 2, 691.00, 0.00, 145.11, 836.11, 'IU', 'IU', '01053788798', 'IU@IU.com', 'Nit-3', NULL, 'sung', 'bun', 'Korea', '121001', 'canceled', 0, '2021-10-07 00:29:16', '2021-10-08 13:40:29', NULL, '2021-10-08'),
	(3, 2, 221.00, 0.00, 46.41, 267.41, 'IU', 'IU', '01053788798', 'IU@IU.com', 'Nit-3', NULL, 'sung', 'bun', 'Korea', '121002', 'ordered', 0, '2021-10-09 00:01:38', '2021-10-09 00:01:38', NULL, NULL),
	(4, 2, 221.00, 0.00, 46.41, 267.41, 'IU', 'IU', '01053788798', 'IU@IU.com', 'Nit-3', NULL, 'sung', 'bun', 'Korea', '121001', 'canceled', 0, '2021-10-09 00:06:04', '2021-10-09 00:11:52', NULL, '2021-10-09'),
	(5, 2, 1034.00, 0.00, 217.14, 1251.14, 'IU', 'IU', '01053788798', 'IU@IU.com', 'Nit-3', NULL, 'sung', 'bun', 'Korea', '121001', 'ordered', 0, '2021-10-09 05:21:41', '2021-10-09 05:21:41', NULL, NULL),
	(6, 2, 1034.00, 0.00, 217.14, 1251.14, 'IU', 'IU', '01053788798', 'IU@IU.com', 'Nit-3', NULL, 'sung', 'bun', 'Korea', '121001', 'delivered', 0, '2021-10-09 05:22:46', '2021-10-09 05:24:02', '2021-10-09', NULL),
	(7, 2, 601.00, 0.00, 126.21, 727.21, 'IU', 'IU', '01053788798', 'IU@IU.com', 'Nit-3', 'Nit-3', 'sung', 'bun', 'Korea', '121001', 'ordered', 0, '2021-10-16 10:05:11', '2021-10-16 10:05:11', NULL, NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 테이블 ec.order_items 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.order_items:~19 rows (대략적) 내보내기
DELETE FROM `order_items`;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`, `rstatus`) VALUES
	(1, 9, 1, 415.00, 1, '2021-10-06 04:16:08', '2021-10-09 05:00:55', 1),
	(2, 8, 1, 39.00, 1, '2021-10-06 04:16:08', '2021-10-09 05:05:40', 1),
	(3, 9, 2, 415.00, 1, '2021-10-07 00:29:16', '2021-10-07 00:29:16', 0),
	(4, 7, 2, 94.00, 1, '2021-10-07 00:29:16', '2021-10-07 00:29:16', 0),
	(5, 12, 2, 182.00, 1, '2021-10-07 00:29:16', '2021-10-07 00:29:16', 0),
	(6, 8, 3, 39.00, 1, '2021-10-09 00:01:38', '2021-10-09 00:01:38', 0),
	(7, 12, 3, 182.00, 1, '2021-10-09 00:01:38', '2021-10-09 00:01:38', 0),
	(8, 8, 4, 39.00, 1, '2021-10-09 00:06:04', '2021-10-09 00:06:04', 0),
	(9, 12, 4, 182.00, 1, '2021-10-09 00:06:04', '2021-10-09 00:06:04', 0),
	(10, 1, 5, 54.00, 1, '2021-10-09 05:21:41', '2021-10-09 05:21:41', 0),
	(11, 2, 5, 337.00, 1, '2021-10-09 05:21:41', '2021-10-09 05:21:41', 0),
	(12, 3, 5, 207.00, 1, '2021-10-09 05:21:41', '2021-10-09 05:21:41', 0),
	(13, 4, 5, 304.00, 1, '2021-10-09 05:21:41', '2021-10-09 05:21:41', 0),
	(14, 5, 5, 132.00, 1, '2021-10-09 05:21:41', '2021-10-09 05:21:41', 0),
	(15, 1, 6, 54.00, 1, '2021-10-09 05:22:46', '2021-10-09 05:22:46', 0),
	(16, 2, 6, 337.00, 1, '2021-10-09 05:22:46', '2021-10-09 05:22:46', 0),
	(17, 3, 6, 207.00, 1, '2021-10-09 05:22:46', '2021-10-09 05:22:46', 0),
	(18, 4, 6, 304.00, 1, '2021-10-09 05:22:46', '2021-10-09 05:22:46', 0),
	(19, 5, 6, 132.00, 1, '2021-10-09 05:22:46', '2021-10-09 05:28:58', 1),
	(20, 1, 7, 54.00, 1, '2021-10-16 10:05:11', '2021-10-16 10:05:11', 0),
	(21, 5, 7, 132.00, 1, '2021-10-16 10:05:11', '2021-10-16 10:05:11', 0),
	(22, 9, 7, 415.00, 1, '2021-10-16 10:05:11', '2021-10-16 10:05:11', 0);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;

-- 테이블 ec.password_resets 구조 내보내기
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.password_resets:~1 rows (대략적) 내보내기
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('th2eul@gmail.com', '$2y$10$FAHUvjdlUY/CQf2Km3ZBT.07Erx8nTiOryyGSgpxbwtvj9PKQTVQy', '2021-10-13 00:12:21');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- 테이블 ec.personal_access_tokens 구조 내보내기
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.personal_access_tokens:~0 rows (대략적) 내보내기
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- 테이블 ec.products 구조 내보내기
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) unsigned NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.products:~22 rows (대략적) 내보내기
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 'totam nisi consequatur sed', 'totam-nisi-consequatur-sed', 'Sed repellendus maiores doloribus excepturi qui cupiditate. Quos voluptate enim qui eum. Et ut cupiditate consequatur et. Odio in ex similique doloribus inventore.', 'Illo repellendus nam ipsum provident ipsam. Et dolores qui et doloribus repellat est consequatur non. Aut dolores sed voluptatem porro nulla veritatis. Iusto accusantium impedit mollitia omnis minima qui ut facere. Reprehenderit eaque alias quo nam dolore ratione autem. Doloremque eligendi iure qui quidem nesciunt. Sit dolore et eos voluptates. Nesciunt tempora doloremque ea odio architecto ut quia. Ipsum fugiat dolores non rem quas molestiae.', 54.00, 50.00, 'DIGI495', 'instock', 0, 140, 'digital_3.jpg', ',16342112180.jpg,16342112181.jpg,16342112182.jpg,16342112183.jpg', 2, '2021-09-18 12:11:58', '2021-10-14 11:33:38'),
	(2, 'est itaque est quia', 'est-itaque-est-quia', 'Ab et dignissimos pariatur libero ex. Cum accusamus qui delectus aliquam fugiat. Iste quisquam vero eaque explicabo. Amet aliquid quo sed rerum ut et pariatur.', 'Quia quaerat ut molestiae blanditiis officiis eveniet est. Distinctio quae minus quo reiciendis fugit. Adipisci ex omnis et ipsam non autem. Delectus blanditiis tempora nulla voluptatem. Neque explicabo vel voluptas facere natus ratione esse nostrum. Velit occaecati dolor quod vel et inventore iure doloremque. Nam libero laborum praesentium. Veniam labore aut velit beatae sed odit. Commodi in molestiae iusto. Quae at adipisci totam doloremque.', 337.00, 300.00, 'DIGI171', 'instock', 0, 109, 'digital_22.jpg', NULL, 1, '2021-09-18 12:11:59', '2021-09-27 00:03:27'),
	(3, 'ut sint est voluptatibus', 'ut-sint-est-voluptatibus', 'Sunt molestiae in maxime non sit reiciendis. Rem nihil dolores dolorum enim. Quia assumenda omnis tempore quod hic culpa quis. Fuga repudiandae non excepturi.', 'Pariatur nihil rerum sit id quia inventore sed. Expedita eum ea qui dolores nisi dolore ut vel. Repellendus similique vel magni voluptatem est non. Sunt corporis est et quidem. Ut fugit qui ipsa quibusdam dolorem et. Et itaque accusantium consequatur exercitationem. Quia vitae necessitatibus placeat sed. Facere sit vero nihil perferendis aut adipisci. Dolores tempore quia eos ut.', 207.00, 200.00, 'DIGI462', 'instock', 0, 116, 'digital_10.jpg', NULL, 5, '2021-09-18 12:11:59', '2021-09-27 00:04:10'),
	(4, 'nostrum quas delectus maxime', 'nostrum-quas-delectus-maxime', 'Voluptates consequatur consequuntur eaque sit earum corrupti. Sed omnis sunt magni optio id asperiores. Quia esse impedit hic quia sunt odit. Vero culpa quia enim quo sint accusantium.', 'Omnis ducimus similique sit commodi ex sunt modi. Rerum dolores esse voluptatem sit. Vitae debitis ut et possimus architecto facilis. Quidem facere accusamus quo qui. Consequatur cum cumque nam consequatur iste rerum. Voluptas est quasi non est. Delectus eligendi odit quia aut aliquid voluptate.', 304.00, 300.00, 'DIGI163', 'instock', 0, 155, 'digital_17.jpg', NULL, 2, '2021-09-18 12:11:59', '2021-09-27 00:04:27'),
	(5, 'quibusdam error explicabo eaque', 'quibusdam-error-explicabo-eaque', 'Quia dicta iure ea pariatur sed. Doloribus placeat quasi libero est quibusdam quis. Alias et qui eligendi iste est. Ex odio adipisci incidunt ipsa sint quibusdam neque.', 'Et qui vero odio voluptatem sit eos laboriosam voluptas. Harum quod temporibus at sit vel deleniti nam. Eveniet dolor enim laborum nostrum neque fuga. Earum odit blanditiis voluptatibus voluptatem vel. Officia ut adipisci odio eius distinctio animi ea. Qui vitae repellat minus nostrum sit neque. Necessitatibus illum nemo quaerat architecto id quia atque.', 132.00, 100.00, 'DIGI174', 'instock', 0, 149, 'digital_16.jpg', NULL, 5, '2021-09-18 12:11:59', '2021-09-27 00:04:47'),
	(6, 'dolor ex corporis quasi', 'dolor-ex-corporis-quasi', 'Enim veniam nulla magni nihil. Ipsum explicabo eveniet distinctio ratione. Consectetur omnis tempora alias aliquam quia dignissimos.', 'Commodi distinctio blanditiis quasi voluptate nesciunt excepturi. Ea repellendus consequatur et. Similique facere itaque accusamus eos eligendi nisi. Ipsa deserunt recusandae qui molestiae ut. Possimus unde maiores deleniti aut iure id doloribus. Unde dolores qui molestiae sunt est. Perferendis labore ut est excepturi placeat possimus magni aut. Aut possimus dolore consectetur quas quae blanditiis vel excepturi. Est similique possimus sed accusamus praesentium ut.', 157.00, 150.00, 'DIGI482', 'instock', 0, 190, 'digital_18.jpg', NULL, 5, '2021-09-18 12:11:59', '2021-09-27 00:06:57'),
	(7, 'fuga aut cupiditate omnis', 'fuga-aut-cupiditate-omnis', 'Quo quia ut ut voluptas voluptatem ratione voluptatem. Eligendi et sed ut consequuntur autem fugit molestiae. Saepe ducimus id possimus perferendis.', 'Incidunt ullam ad iusto earum molestias maxime veritatis. Pariatur sequi ad sint sed. Sapiente maxime aut voluptas natus. Voluptatum voluptatibus odit harum esse tempore laboriosam. Quia necessitatibus labore facere. Incidunt iste et iusto fuga ut placeat eos. Consequatur eveniet porro placeat earum. Aut deserunt repellendus sed ipsum nostrum ducimus molestiae. Commodi adipisci sed repellendus omnis. Pariatur tenetur dolorum rerum autem libero eos optio odio. Saepe at aut eos ex rem.', 94.00, NULL, 'DIGI466', 'instock', 0, 130, 'digital_4.jpg', NULL, 1, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(8, 'nostrum nihil quo velit', 'nostrum-nihil-quo-velit', 'Id et nam placeat distinctio id odit sint maiores. Eos eaque at adipisci id suscipit eos voluptatem. Voluptates similique aut cumque. Et voluptatem illum recusandae quasi iste hic.', 'Velit a et facere et. Qui dolorem harum nihil aut ut. Explicabo quaerat molestias aut harum nam inventore aut. Id et quia eaque voluptate mollitia blanditiis animi magni. Placeat voluptatem qui dolore impedit. Aut labore quia debitis rerum. Ipsam dolores et in enim eum quod id officiis. Quia est et non ad. Modi sint rerum voluptatem ducimus nesciunt illo.', 39.00, NULL, 'DIGI256', 'instock', 0, 184, 'digital_21.jpg', NULL, 5, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(9, 'molestiae ratione quas voluptas', 'molestiae-ratione-quas-voluptas', 'Dolores rerum quod eligendi. Incidunt dolorem maxime voluptate molestiae. Sit quis voluptas perferendis consectetur quisquam incidunt unde et. Dolor dicta ut quo aspernatur ut aut ducimus.', 'Incidunt alias qui sint cumque nulla laborum suscipit nisi. Facilis cumque et nulla delectus et ratione modi. Molestiae dolorem impedit quisquam aut laboriosam dolorem voluptatem dignissimos. Sint mollitia ut qui. Enim qui quo adipisci quisquam. Sit atque laudantium voluptatum beatae necessitatibus sit consequatur. Quo laudantium molestias expedita minima qui quis. Veniam modi et cum est et molestias. Enim dolor explicabo quis ut et quos.', 415.00, NULL, 'DIGI293', 'instock', 0, 164, 'digital_9.jpg', NULL, 4, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(10, 'ad quidem nihil saepe', 'ad-quidem-nihil-saepe', 'Nihil temporibus exercitationem sit repudiandae nemo deleniti. Repudiandae est perferendis quia nemo. In recusandae rem quos praesentium mollitia adipisci velit. Beatae vero voluptatem id et.', 'Reiciendis tempora excepturi corrupti. Fuga itaque dolorem sit pariatur magni perspiciatis officia. Molestiae officia harum ut placeat. Autem laboriosam amet maiores veniam velit. Ut voluptatibus rem eos et. Et accusamus sequi inventore adipisci earum. Explicabo aut qui facere temporibus necessitatibus. Molestiae magni rerum sit. Aut ducimus voluptas sequi. Distinctio sed ab ex quidem explicabo et nisi. Est omnis reprehenderit deleniti quos ut.', 362.00, NULL, 'DIGI279', 'instock', 0, 103, 'digital_6.jpg', NULL, 2, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(11, 'sit molestiae et qui', 'sit-molestiae-et-qui', 'Architecto asperiores placeat quia sunt earum qui molestias. Quis soluta et sint in ullam. Ratione sed impedit dicta quis dolore.', 'Facere in magnam delectus modi qui hic quis. Perferendis facere saepe qui quasi similique. Vitae nisi tenetur ipsam fugiat quasi iusto rerum aut. Assumenda minima velit repellat quaerat fuga. Pariatur molestiae vel at aut accusamus. Accusantium vel nihil quam quis officia modi exercitationem. Occaecati deleniti qui magni consequatur ipsa eum facere. Tempora dignissimos eius vero enim molestiae quibusdam at. Et rerum ullam nihil aut qui eius.', 34.00, NULL, 'DIGI433', 'instock', 0, 183, 'digital_20.jpg', NULL, 1, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(12, 'ut amet tempore tenetur', 'ut-amet-tempore-tenetur', 'Nobis suscipit quia necessitatibus est. Debitis laboriosam illum est porro ut. Enim corporis natus qui nesciunt dolorem sequi.', 'Necessitatibus autem voluptates nihil asperiores debitis dicta. Corrupti eveniet aut qui fugit qui enim laudantium soluta. Molestiae molestiae omnis voluptatem cupiditate veniam sequi eos. Aut sed dolorum aliquam nam. Et nulla ab est accusamus quis dolor velit. Quia et qui voluptas. Aut fugit doloribus quod ut quis dolor dicta. In veniam voluptatem velit ex ut est. Qui voluptatibus reiciendis ipsum nihil error ut sit omnis.', 182.00, NULL, 'DIGI488', 'instock', 0, 184, 'digital_11.jpg', NULL, 4, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(13, 'quia quis vero repellendus', 'quia-quis-vero-repellendus', 'Ipsam expedita consequatur laborum quisquam aut corporis. Dolores aliquam tempore est. Rerum dignissimos explicabo cum deleniti odio numquam dolor.', 'At inventore alias vero debitis. Ducimus iste impedit dolorem saepe aut. Quas ullam vero vero et. Quisquam commodi et laudantium doloremque. Atque quibusdam consequuntur mollitia quos est. Tempore pariatur error consectetur ut voluptas quis alias. Necessitatibus ipsum sequi et eum voluptas minima natus. Aut maiores voluptas id repellat sit. Sint magni voluptatibus qui at voluptatum. Ut eum officiis repudiandae molestiae sit sequi. Ipsum quae est id mollitia.', 197.00, NULL, 'DIGI208', 'instock', 0, 127, 'digital_15.jpg', NULL, 2, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(14, 'perferendis temporibus ab totam', 'perferendis-temporibus-ab-totam', 'Sed culpa molestiae impedit. Et eaque quas explicabo nemo ut quo aut. Sed ea aut et voluptates. Sit accusamus aut maxime reiciendis consequatur est.', 'Ea consequuntur necessitatibus omnis qui ipsa ipsa reiciendis. Similique perferendis et ea voluptatem officia nesciunt. Velit corrupti enim consequatur reprehenderit assumenda natus. A quo vitae omnis. Sit quo enim est aut soluta. Et non nulla et ullam autem occaecati sunt. Pariatur repellat dignissimos possimus quidem doloribus distinctio. Est nam hic sint maiores et quod modi minus. Est exercitationem aut aut officiis.', 455.00, NULL, 'DIGI406', 'instock', 0, 118, 'digital_14.jpg', NULL, 1, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(15, 'facilis tenetur vel id', 'facilis-tenetur-vel-id', 'Aut qui rerum ea ex assumenda quidem. Saepe ut omnis sapiente totam. Vero accusamus est quos harum error nostrum.', 'Est doloremque fugit sed minima ex est possimus. Quo sit dolor ad vel eius suscipit. Illum eos est et ducimus voluptas doloribus. Dicta sit facere cupiditate accusamus reprehenderit ipsam deserunt. Iure corporis at excepturi maiores possimus nisi. Tempore sed cupiditate velit vero. Magnam repellat reiciendis recusandae laudantium. Nostrum quibusdam quibusdam sunt omnis quis dolores cumque.', 133.00, NULL, 'DIGI301', 'instock', 0, 153, 'digital_7.jpg', NULL, 2, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(16, 'placeat ut ab modi', 'placeat-ut-ab-modi', 'Necessitatibus id dicta voluptatem accusantium. Et tempora dicta veniam fugiat necessitatibus aut debitis. Perferendis aut voluptas fugit mollitia.', 'Quidem omnis voluptatem in aliquid quia totam autem vitae. Quo ut rerum nemo. Eveniet saepe culpa saepe aut aliquam. Sit atque non voluptas aut voluptas consequatur sunt. Consequuntur fuga quis vero eos laboriosam dolorem sint. Reiciendis ullam qui magnam eligendi minus non unde. Accusantium vero tenetur aspernatur et quia est. Consequuntur eius consectetur consequuntur earum sed reiciendis. Minima ut cum aut sit quas.', 339.00, NULL, 'DIGI307', 'instock', 0, 135, 'digital_8.jpg', NULL, 5, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(17, 'accusantium rem vero sunt', 'accusantium-rem-vero-sunt', 'Consequatur aspernatur iste perferendis voluptatibus et. Natus reprehenderit qui deleniti quod ex. Repellat necessitatibus et qui consectetur. Itaque assumenda illum eius.', 'Dolore mollitia deleniti consequuntur et ullam nesciunt quaerat repudiandae. Deleniti voluptas quo ipsa quis ut libero ipsum. Nesciunt veritatis qui perferendis. Animi consectetur velit ducimus aut. Et ut vero voluptas expedita necessitatibus enim. Pariatur voluptas eligendi enim qui. Omnis aut amet et dicta tempore ut. Laudantium molestiae labore fuga facilis maxime ipsum. Architecto et delectus illum. Cumque est et et quo.', 112.00, NULL, 'DIGI248', 'instock', 0, 165, 'digital_2.jpg', NULL, 4, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(18, 'eius ullam voluptatem qui', 'eius-ullam-voluptatem-qui', 'Consequatur ipsam perferendis doloremque vel recusandae quia natus quasi. Officia est alias illum rerum. Sequi rerum quo rerum vero. Qui quia similique deleniti.', 'Possimus possimus non quam molestiae fuga. Iste ducimus autem qui quae ut odit dolore. Fuga qui sed eius repellat excepturi. Nesciunt itaque error voluptatem voluptatibus rerum mollitia. Quia ut quasi ab sapiente. Accusantium eum qui enim consequatur voluptatibus ullam repudiandae. Numquam iusto nam voluptas ut dolorum qui ut. Nulla porro odit qui.', 16.00, NULL, 'DIGI297', 'instock', 0, 150, 'digital_1.jpg', NULL, 4, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(19, 'quia at et excepturi', 'quia-at-et-excepturi', 'Et enim sed nobis est est sed. Necessitatibus sequi totam ab labore. Error in excepturi commodi voluptatibus deserunt quia ut. Voluptatem est quia et ad. Sed qui molestiae dolore et natus iste.', 'Eveniet amet atque accusantium amet aut quia. Impedit est quisquam id voluptatum quam maxime et. Sunt ut explicabo consequatur eos animi optio. Molestiae veritatis aperiam labore tempore. Velit minus nisi incidunt alias. Consequatur esse mollitia nulla adipisci molestiae. Blanditiis laboriosam dignissimos repellat totam doloremque explicabo exercitationem. Earum minus quo non dignissimos at ipsam. Nemo hic sit sit illo.', 328.00, NULL, 'DIGI274', 'instock', 0, 152, 'digital_19.jpg', NULL, 3, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(20, 'facere nostrum molestiae voluptas', 'facere-nostrum-molestiae-voluptas', 'Aut consequatur iure maxime qui est adipisci. Eos assumenda aut excepturi illo temporibus. Voluptatem aut laudantium numquam et est ex.', 'Rem omnis amet ipsa maxime sed recusandae optio id. Sit eos perspiciatis harum dicta officia voluptatem. Hic amet nulla et eaque fugiat nesciunt earum placeat. Distinctio ea rerum consequatur. Modi tempora voluptas minus harum consequatur. Sint ipsa quo minus libero qui consequatur. Natus explicabo omnis cupiditate similique. Quia eligendi itaque quo minima ut laborum aspernatur.', 86.00, NULL, 'DIGI472', 'instock', 0, 145, 'digital_5.jpg', NULL, 4, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(21, 'libero perspiciatis mollitia quos', 'libero-perspiciatis-mollitia-quos', 'Quisquam corporis harum omnis ipsum. Eum atque corporis non iure voluptas sint iure. Sunt veniam ipsa et qui sed et.', 'Iusto eligendi at officia reiciendis ut itaque. Magnam non iusto provident illo. Accusantium animi facilis iste culpa ea. Eos molestiae voluptatem dolores et. Consectetur minus consectetur id labore voluptatem id. Soluta quis omnis dolorum qui sequi quia autem vel. Est ducimus fuga beatae ut modi autem ad nemo. Facere dolorem accusantium possimus exercitationem non. Veniam quae similique voluptates doloribus vitae repellendus deserunt.', 47.00, NULL, 'DIGI361', 'instock', 0, 191, 'digital_13.jpg', NULL, 3, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(22, 'omnis numquam in temporibus', 'omnis-numquam-in-temporibus', 'Vel necessitatibus quo aliquid facere aut. Amet totam qui maiores molestiae. Veritatis natus et vero quo. Voluptates reiciendis nemo est voluptas nostrum delectus.', 'Voluptates non repudiandae enim quo eaque. Eveniet facilis minima aut dolores eligendi officiis. Laboriosam reprehenderit aut cupiditate. Ut in aut cum enim. Voluptas sit fuga est harum. Voluptate ut voluptatem pariatur necessitatibus tempora voluptas. Repudiandae nihil blanditiis eveniet aut. Eligendi quae qui qui voluptatem sed accusamus. Nesciunt et labore rerum ut quo. Facilis placeat facilis corrupti deserunt maxime ullam a. Facilis autem debitis id exercitationem ullam.', 143.00, NULL, 'DIGI410', 'instock', 0, 125, 'digital_12.jpg', NULL, 5, '2021-09-18 12:11:59', '2021-09-18 12:11:59'),
	(28, 'New Product 1', 'new-product-1', '<p>New Product 1 Short Description.</p>', '<p>New Product 1 Description.</p>', 597.00, 550.00, 'DIGI43534', 'instock', 0, 11, '1633932621.jpg', ',16339326210.jpg,16339326211.jpg', 3, '2021-10-11 06:10:21', '2021-10-11 06:10:21');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- 테이블 ec.reviews 구조 내보내기
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.reviews:~2 rows (대략적) 내보내기
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `rating`, `comment`, `order_item_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 'Nice product', 1, '2021-10-09 05:00:55', '2021-10-09 05:00:55'),
	(2, 5, 'Very Nice Cellphone Camera', 2, '2021-10-09 05:05:40', '2021-10-09 05:05:40'),
	(3, 1, '핵 창렬', 19, '2021-10-09 05:28:58', '2021-10-09 05:28:58');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- 테이블 ec.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.sales:~0 rows (대략적) 내보내기
DELETE FROM `sales`;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
	(1, '2021-09-15 04:08:18', 1, NULL, '2021-09-27 23:44:44');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

-- 테이블 ec.sessions 구조 내보내기
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.sessions:~8 rows (대략적) 내보내기
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('2C2zQGtyydOPf2nbU3dM1BkXXNXgqew5vh2tQ2eS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT211MHNtMlZyR1ZwUUFZa3RKSk5wSlNjQ29lSGtlRk44S3o2NGFyaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1634337284),
	('CrUOTU4bzPi7d2KpSOZ1yyr7RxXW9fn3O5fHROHZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1pHdFAyeDBqQ0pnS3U1czViQjRuMzJtYUl0MlZVdmdnNU40SUJ5VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1634520409),
	('HmtjqzNMB3JLpdRrw5EPwVaRtnd1jKal9ORqSvdo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS05hbEpmdWR6Q01acjMxNzNzS2xHWG1aS2U2bEk5a2lzc05wNFhkTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1634344731),
	('mgwYT2o6xCSiNTJkHt3EzJEWwQ89epJCCGJXTlSJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidjdoNjdCMEVTaUxZQzhqa2o2V3lYcHlLTDlLNXljckZERVFPWk9NbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1634520408),
	('mM9SrScuHGh3FyVyx04ef3PgsVjytSJaBvRfuK1T', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSjVFU2dhQmRnZ3JMMEJucVptOFJuMHZkOEc3WGpRbE53emlNNFlUVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGVja291dCI7fXM6NDoiY2FydCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGJXWjJHUGNjc2ZLNHpLczdMQzNmOHUvc2lldVh5cFB1TjVSaWdWY0hBZUJZM3NiTm45U0lhIjt9', 1634378711),
	('rDGz1t075Poqz7yP0deil7p4iHZgFJZGzgt8YmOC', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiY0RFRm5WREc0NFlVZTlVYVZtRTA1dHhBWHZLMzdWQ3Jhd2VpeUVSRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cz9wYWdlPTMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkNEgvVkpMUWZTSEQwNFFPWXBESzJXT3NZWEw5ei8wUUN3em9iU1lHeTN5YmtTOXlEWjY5dGkiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDRIL1ZKTFFmU0hEMDRRT1lwREsyV09zWVhMOXovMFFDd3pvYlNZR3kzeWJrUzl5RFo2OXRpIjt9', 1634253448),
	('VOuyggxielT3KH2Rcfy1q8wbatEZKUMcANC8r9B1', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMWF2a1hpVmo2VUZJTklnR2JYbEhzRVRsZE9UUmJseHZQNm5xR2Y4RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NDoiY2FydCI7YToxOntzOjQ6ImNhcnQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoxOntzOjg6IgAqAGl0ZW1zIjthOjM6e3M6MzI6IjAyN2M5MTM0MWZkNWNmNGQyNTc5YjQ5YzRiNmE5MGRhIjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6OTp7czo1OiJyb3dJZCI7czozMjoiMDI3YzkxMzQxZmQ1Y2Y0ZDI1NzliNDljNGI2YTkwZGEiO3M6MjoiaWQiO2k6MTtzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czoyNjoidG90YW0gbmlzaSBjb25zZXF1YXR1ciBzZWQiO3M6NToicHJpY2UiO2Q6NTQ7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjE6e3M6ODoiACoAaXRlbXMiO2E6MDp7fX1zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjIxO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBpc1NhdmVkIjtiOjA7fXM6MzI6IjQ2ODM5OTU4MTM0MjUwNWM0N2Y0NjE1YjgxYmVkYWE5IjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6OTp7czo1OiJyb3dJZCI7czozMjoiNDY4Mzk5NTgxMzQyNTA1YzQ3ZjQ2MTViODFiZWRhYTkiO3M6MjoiaWQiO2k6NTtzOjM6InF0eSI7aToyO3M6NDoibmFtZSI7czozMToicXVpYnVzZGFtIGVycm9yIGV4cGxpY2FibyBlYXF1ZSI7czo1OiJwcmljZSI7ZDoxMzI7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjE6e3M6ODoiACoAaXRlbXMiO2E6MDp7fX1zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjIxO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBpc1NhdmVkIjtiOjA7fXM6MzI6ImM0MmY2YmVlYzljOTNmZDZhZmVhNmViMDY4NGFhOTlhIjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6OTp7czo1OiJyb3dJZCI7czozMjoiYzQyZjZiZWVjOWM5M2ZkNmFmZWE2ZWIwNjg0YWE5OWEiO3M6MjoiaWQiO2k6OTtzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czozMToibW9sZXN0aWFlIHJhdGlvbmUgcXVhcyB2b2x1cHRhcyI7czo1OiJwcmljZSI7ZDo0MTU7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjE6e3M6ODoiACoAaXRlbXMiO2E6MDp7fX1zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjIxO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBpc1NhdmVkIjtiOjA7fX19fXM6ODoiY2hlY2tvdXQiO2E6NDp7czo4OiJkaXNjb3VudCI7aTowO3M6ODoic3VidG90YWwiO3M6NjoiNzMzLjAwIjtzOjM6InRheCI7czo2OiIxNTMuOTMiO3M6NToidG90YWwiO3M6NjoiODg2LjkzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1634378266),
	('X37mnrNrh9EB7C1kNgQ0iZJcRAF7FbTYbhKWte5g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQzVOdmtWU21ldE9KZWRXbm9hQ2R3QloyRzQ2RTN1d0xWTm1KVFJQSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1634344725);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- 테이블 ec.settings 구조 내보내기
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.settings:~0 rows (대략적) 내보내기
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `email`, `phone`, `phone2`, `address`, `map`, `twitter`, `facebook`, `pinterest`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
	(1, 'IU@IU.com', '01053788798', '01012341234', 'Bundang.Sungnam,Korea', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25358.724564413333!2d127.07989906829468!3d37.39360245913073!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b586e8fcd215d%3A0x72245ba96811e40c!2sPangyo-dong%2C%20Bundang-gu%2C%20Seongnam-si%2C%20Gyeonggi-do!5e0!3m2!1sen!2skr!4v1633915921846!5m2!1sen!2skr', '#', '#', '#', '#', '#', '2021-10-11 00:40:35', '2021-10-11 01:37:18');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- 테이블 ec.shippings 구조 내보내기
CREATE TABLE IF NOT EXISTS `shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shippings_order_id_foreign` (`order_id`),
  CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.shippings:~0 rows (대략적) 내보내기
DELETE FROM `shippings`;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;
INSERT INTO `shippings` (`id`, `order_id`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
	(1, 1, 'kim', 'Love', '01053788888', 'KimLove@Kim.com', 'test line1', 'test line2', 'Seoul', 'shin-lim', 'Korea', '654321', '2021-10-06 04:16:08', '2021-10-06 04:16:08');
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;

-- 테이블 ec.transactions 구조 내보내기
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.transactions:~4 rows (대략적) 내보내기
DELETE FROM `transactions`;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, 'cod', 'pending', '2021-10-06 04:16:08', '2021-10-06 04:16:08'),
	(2, 2, 2, 'card', 'approved', '2021-10-07 00:29:19', '2021-10-07 00:29:19'),
	(3, 2, 4, 'card', 'approved', '2021-10-09 00:06:07', '2021-10-09 00:06:07'),
	(4, 2, 6, 'card', 'approved', '2021-10-09 05:22:49', '2021-10-09 05:22:49'),
	(5, 2, 7, 'cod', 'pending', '2021-10-16 10:05:11', '2021-10-16 10:05:11');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- 테이블 ec.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 ec.users:~2 rows (대략적) 내보내기
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$4H/VJLQfSHD04QOYpDK2WOsYXL9z/0QCwzobSYGy3ybkS9yDZ69ti', NULL, NULL, NULL, NULL, NULL, 'ADM', '2021-09-17 10:32:08', '2021-09-17 10:32:08'),
	(2, 'User', 'user@user.com', NULL, '$2y$10$bWZ2GPccsfK4zKs7LC3f8u/sieuXypPuN5RigVcHAeBY3sbNn9SIa', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-09-17 10:33:46', '2021-10-10 03:00:00'),
	(3, '아이유', 'IU@IU.com', NULL, '$2y$10$UGNUiC.kZ7tYXURJON91wOUWc7roOLgGJd5UJFNUtN72jeN5U1WKm', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-09-18 06:20:40', '2021-09-18 06:20:40'),
	(4, '김고은', 'user2@user.com', NULL, '$2y$10$.UTxkdIHg7YYD7R/Wg7Ku.x//i1qZs7c6fpC46sETB1rbQDbM4pm.', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-10-08 06:49:50', '2021-10-08 06:49:50'),
	(5, 'Admin', 'th2eul@gmail.com', NULL, '$2y$10$CXuiNlDMACHuXjNgciBFoOxtiicpomutQ1cQ6lav0qBOQHXWvCMnW', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-10-12 15:16:47', '2021-10-12 15:16:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
