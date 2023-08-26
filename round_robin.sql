-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 26, 2023 at 09:55 AM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `round_robin`
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
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
CREATE TABLE IF NOT EXISTS `mappings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mappings_teacher_id_foreign` (`teacher_id`),
  KEY `mappings_student_id_foreign` (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mappings`
--

INSERT INTO `mappings` (`id`, `teacher_id`, `student_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-08-26 04:24:22', '2023-08-26 04:24:22'),
(2, 2, 2, '2023-08-26 04:24:22', '2023-08-26 04:24:22'),
(3, 3, 3, '2023-08-26 04:24:22', '2023-08-26 04:24:22'),
(4, 4, 4, '2023-08-26 04:24:22', '2023-08-26 04:24:22'),
(5, 1, 5, '2023-08-26 04:24:22', '2023-08-26 04:24:22'),
(6, 2, 6, '2023-08-26 04:24:22', '2023-08-26 04:24:22'),
(7, 3, 7, '2023-08-26 04:24:22', '2023-08-26 04:24:22'),
(8, 4, 8, '2023-08-26 04:24:22', '2023-08-26 04:24:22');

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_26_051237_create_teachers_table', 1),
(6, '2023_08_26_051245_create_students_table', 1),
(7, '2023_08_26_051251_create_mappings_table', 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `age`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Student 1', 'student1@gmail.com', 15, 'img20230826065440000000.jpg', '2023-08-26 01:24:40', '2023-08-26 01:24:40'),
(2, 'Student 2', 'student2@gmail.com', 15, 'img20230826065449000000.jpg', '2023-08-26 01:24:49', '2023-08-26 01:24:49'),
(3, 'Student 3', 'student3@gmail.com', 15, 'img20230826065456000000.jpg', '2023-08-26 01:24:56', '2023-08-26 01:24:56'),
(4, 'Student 4', 'student4@gmail.com', 15, 'img20230826065502000000.jpg', '2023-08-26 01:25:02', '2023-08-26 01:25:02'),
(5, 'Student 5', 'student5@gmail.com', 15, 'img20230826065508000000.jpg', '2023-08-26 01:25:08', '2023-08-26 01:25:08'),
(6, 'Student 6', 'student6@gmail.com', 15, 'img20230826065512000000.jpg', '2023-08-26 01:25:12', '2023-08-26 01:25:12'),
(7, 'Student 7', 'student7@gmail.com', 15, 'img20230826065518000000.jpg', '2023-08-26 01:25:18', '2023-08-26 01:25:18'),
(8, 'Student 8', 'student8@gmail.com', 15, 'img20230826065525000000.jpg', '2023-08-26 01:25:25', '2023-08-26 01:25:25'),
(9, 'Student 9', 'student9@gmail.com', 15, 'img20230826065531000000.jpg', '2023-08-26 01:25:31', '2023-08-26 01:25:31'),
(10, 'Student 10', 'student10@gmail.com', 15, 'img20230826065538000000.jpg', '2023-08-26 01:25:38', '2023-08-26 01:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `email`, `age`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Teacher 1', 'teacher1@gmail.com', 32, 'img20230826064752000000.jpg', '2023-08-26 01:17:52', '2023-08-26 01:17:52'),
(2, 'Teacher 2', 'teacher2@gmail.com', 37, 'img20230826065201000000.jpg', '2023-08-26 01:22:01', '2023-08-26 01:22:01'),
(3, 'Teacher 3', 'teacher3@gmail.com', 40, 'img20230826065323000000.jpg', '2023-08-26 01:23:23', '2023-08-26 01:23:23'),
(4, 'Teacher 4', 'teacher4@gmail.com', 46, 'img20230826065350000000.jpg', '2023-08-26 01:23:50', '2023-08-26 01:23:50'),
(5, 'Teacher 5', 'teacher5@gmail.com', 38, 'img20230826065407000000.jpg', '2023-08-26 01:24:07', '2023-08-26 01:24:07');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
