-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db1.kevinchr.com:3306
-- Generation Time: Nov 23, 2024 at 06:15 PM
-- Server version: 11.6.2-MariaDB-ubu2404
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `uuid` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publish_year` year(4) NOT NULL,
  `member_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`uuid`, `title`, `author`, `publish_year`, `member_uuid`, `created_at`, `updated_at`, `deleted_at`) VALUES
('17d2cd15-cd21-4e35-aec3-c6a5adda6784', 'The Diary of a Young Girl', 'Anne Frank', '1947', 'b026ce35-1998-42e7-8f2b-124fd0b4f003', '2024-11-23 14:29:46', '2024-11-23 14:31:02', NULL),
('1c00d991-8016-476d-9f05-d7fceb3fbd1e', '1984', 'George Orwell', '1949', '4897ab01-63ca-44e6-9ea1-0500bf8a239f', '2024-11-23 14:09:59', '2024-11-23 14:31:12', NULL),
('38747586-b84a-49ae-a4b5-cb2c86d2d099', 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', '2008', '3558fd6d-22a6-4d5a-8131-e3988390d1b4', '2024-11-23 14:15:52', '2024-11-23 14:31:21', NULL),
('3a249869-9564-4855-a228-c737bd2ab839', 'Cooking Basics for Dummies', 'Bryan Miller', '2000', NULL, '2024-11-23 14:14:34', '2024-11-23 14:14:34', NULL),
('9a51eaa1-7c2b-4f21-a348-c3486453fb21', 'A Brief History of Time', 'Stephen Hawking', '1988', '04fa0911-fc2c-4381-9d31-8b6da11bd567', '2024-11-23 14:08:52', '2024-11-23 14:31:32', NULL),
('9f2e96bc-db1d-48b3-80fd-46db4b6f363a', 'To Kill a Mockingbird', 'Harper Lee', '1960', '04fa0911-fc2c-4381-9d31-8b6da11bd567', '2024-11-23 14:07:45', '2024-11-23 14:31:41', NULL),
('a04d3d56-df0f-4966-8729-fd3e63506b91', 'The Art of War', 'Sun Tzu', '1985', '3558fd6d-22a6-4d5a-8131-e3988390d1b4', '2024-11-23 14:13:11', '2024-11-23 14:31:51', NULL),
('c9554013-1f4f-49fe-b619-caf1e77209c9', 'The Great Gatsby', 'F. Scott Fitzgerald', '1925', NULL, '2024-11-23 14:09:24', '2024-11-23 14:09:24', NULL),
('dc13a3b3-d682-470c-9905-6760909b11ec', 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', '1997', 'ee3e1177-ba21-4fcc-9c33-d0b334139684', '2024-11-23 14:30:42', '2024-11-23 14:32:03', NULL),
('de89f883-a401-4306-86c6-976bbf17e1d7', 'The Catcher in the Rye', 'J.D. Salinger', '1951', 'ee3e1177-ba21-4fcc-9c33-d0b334139684', '2024-11-23 14:15:16', '2024-11-23 14:32:47', '2024-11-23 14:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `book_uuid` char(36) NOT NULL,
  `category_uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`book_uuid`, `category_uuid`, `created_at`, `updated_at`, `deleted_at`) VALUES
('17d2cd15-cd21-4e35-aec3-c6a5adda6784', '221ad9ce-4aab-4c10-ad3a-21bb4077842c', '2024-11-23 14:29:46', '2024-11-23 14:29:46', NULL),
('17d2cd15-cd21-4e35-aec3-c6a5adda6784', '39e32dc1-cf17-4c9a-a14e-5f9225e1274c', '2024-11-23 14:30:03', '2024-11-23 14:30:03', NULL),
('17d2cd15-cd21-4e35-aec3-c6a5adda6784', 'ceba6701-9ded-4072-ad73-682ae176480b', '2024-11-23 14:29:46', '2024-11-23 14:29:46', NULL),
('1c00d991-8016-476d-9f05-d7fceb3fbd1e', 'c24979cd-c129-4ce4-9f5c-99582b98a6ce', '2024-11-23 14:09:59', '2024-11-23 14:09:59', NULL),
('1c00d991-8016-476d-9f05-d7fceb3fbd1e', 'ceba6701-9ded-4072-ad73-682ae176480b', '2024-11-23 14:09:59', '2024-11-23 14:09:59', NULL),
('38747586-b84a-49ae-a4b5-cb2c86d2d099', '6339f72c-db4d-491f-bc1b-779d21214014', '2024-11-23 14:15:52', '2024-11-23 14:15:52', NULL),
('38747586-b84a-49ae-a4b5-cb2c86d2d099', '9f7b1eb8-6a3b-492c-b385-337ca96b77d2', '2024-11-23 14:15:52', '2024-11-23 14:15:52', NULL),
('38747586-b84a-49ae-a4b5-cb2c86d2d099', 'c8ddc8b7-8801-4b46-b0c5-e5bbbfce8f2c', '2024-11-23 14:15:52', '2024-11-23 14:15:52', NULL),
('3a249869-9564-4855-a228-c737bd2ab839', '6339f72c-db4d-491f-bc1b-779d21214014', '2024-11-23 14:14:34', '2024-11-23 14:14:34', NULL),
('9a51eaa1-7c2b-4f21-a348-c3486453fb21', '221ad9ce-4aab-4c10-ad3a-21bb4077842c', '2024-11-23 14:08:52', '2024-11-23 14:08:52', NULL),
('9a51eaa1-7c2b-4f21-a348-c3486453fb21', '356ea741-b65b-478d-bb8c-e81d5d18a1ae', '2024-11-23 14:08:52', '2024-11-23 14:08:52', NULL),
('9a51eaa1-7c2b-4f21-a348-c3486453fb21', '37c2291b-ab2b-4dcb-a750-35776dbbc5ff', '2024-11-23 14:08:52', '2024-11-23 14:08:52', NULL),
('9f2e96bc-db1d-48b3-80fd-46db4b6f363a', '6c6bceb7-6d21-4638-afa5-17a6010e9a6d', '2024-11-23 14:07:45', '2024-11-23 14:07:45', NULL),
('9f2e96bc-db1d-48b3-80fd-46db4b6f363a', 'c24979cd-c129-4ce4-9f5c-99582b98a6ce', '2024-11-23 14:07:45', '2024-11-23 14:07:45', NULL),
('9f2e96bc-db1d-48b3-80fd-46db4b6f363a', 'd9126a4f-7aab-473a-93b0-56058f33ae90', '2024-11-23 14:07:45', '2024-11-23 14:07:45', NULL),
('a04d3d56-df0f-4966-8729-fd3e63506b91', '39e32dc1-cf17-4c9a-a14e-5f9225e1274c', '2024-11-23 14:13:11', '2024-11-23 14:13:11', NULL),
('a04d3d56-df0f-4966-8729-fd3e63506b91', '6339f72c-db4d-491f-bc1b-779d21214014', '2024-11-23 14:13:11', '2024-11-23 14:13:11', NULL),
('a04d3d56-df0f-4966-8729-fd3e63506b91', 'ceba6701-9ded-4072-ad73-682ae176480b', '2024-11-23 14:13:11', '2024-11-23 14:13:11', NULL),
('c9554013-1f4f-49fe-b619-caf1e77209c9', '4ed86432-9fee-4fd0-9c1e-72300b32d1fd', '2024-11-23 14:09:24', '2024-11-23 14:09:24', NULL),
('c9554013-1f4f-49fe-b619-caf1e77209c9', '6c6bceb7-6d21-4638-afa5-17a6010e9a6d', '2024-11-23 14:09:24', '2024-11-23 14:09:24', NULL),
('dc13a3b3-d682-470c-9905-6760909b11ec', '356ea741-b65b-478d-bb8c-e81d5d18a1ae', '2024-11-23 14:30:42', '2024-11-23 14:30:42', NULL),
('de89f883-a401-4306-86c6-976bbf17e1d7', '39e32dc1-cf17-4c9a-a14e-5f9225e1274c', '2024-11-23 14:15:16', '2024-11-23 14:15:16', NULL),
('de89f883-a401-4306-86c6-976bbf17e1d7', '4ed86432-9fee-4fd0-9c1e-72300b32d1fd', '2024-11-23 14:15:16', '2024-11-23 14:15:16', NULL),
('de89f883-a401-4306-86c6-976bbf17e1d7', '6c6bceb7-6d21-4638-afa5-17a6010e9a6d', '2024-11-23 14:15:16', '2024-11-23 14:15:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `uuid` char(36) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`uuid`, `category_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0fef02f1-cc03-491b-978c-0df0d650e312', 'Ilmu Sosial', '2024-11-23 14:03:26', '2024-11-23 14:05:09', '2024-11-23 14:05:09'),
('135fca7b-fb4f-456a-8819-c1ea71474e36', 'Cerpen', '2024-11-23 14:00:53', '2024-11-23 14:05:01', '2024-11-23 14:05:01'),
('1e469f09-a9b1-426b-8eed-83d749888126', 'Puisi', '2024-11-23 14:01:01', '2024-11-23 14:01:01', NULL),
('221ad9ce-4aab-4c10-ad3a-21bb4077842c', 'Biografi dan Otobiografi', '2024-11-23 14:02:05', '2024-11-23 14:02:05', NULL),
('2b91ce39-c70f-48d0-8747-40f7b8a97fcf', 'Ekonomi dan Bisnis', '2024-11-23 14:02:55', '2024-11-23 14:02:55', NULL),
('356ea741-b65b-478d-bb8c-e81d5d18a1ae', 'Fantasi', '2024-11-23 14:01:15', '2024-11-23 14:01:15', NULL),
('37c2291b-ab2b-4dcb-a750-35776dbbc5ff', 'Ilmu Alam (Biologi, Fisika, Kimia)', '2024-11-23 14:03:39', '2024-11-23 14:03:39', NULL),
('39e32dc1-cf17-4c9a-a14e-5f9225e1274c', 'Novel', '2024-11-23 14:00:44', '2024-11-23 14:00:44', NULL),
('41deecfc-05d4-45be-afa3-8e1f1a09c4cd', 'Matematika', '2024-11-23 14:03:52', '2024-11-23 14:03:52', NULL),
('4c77786d-2be4-4b5f-b289-6ba554d04ff7', 'Drama', '2024-11-23 14:01:08', '2024-11-23 14:04:47', '2024-11-23 14:04:47'),
('4ed86432-9fee-4fd0-9c1e-72300b32d1fd', 'Fiksi Sejarah', '2024-11-23 14:01:55', '2024-11-23 14:01:55', NULL),
('6339f72c-db4d-491f-bc1b-779d21214014', 'Pendidikan dan Pengajaran', '2024-11-23 14:03:19', '2024-11-23 14:03:19', NULL),
('67609345-5be3-4a49-8e01-952dc31a4187', 'Horor', '2024-11-23 14:01:39', '2024-11-23 14:01:39', NULL),
('6c6bceb7-6d21-4638-afa5-17a6010e9a6d', 'Sastra', '2024-11-23 14:04:34', '2024-11-23 14:04:34', NULL),
('96582af6-de9c-4e44-a7e3-a135cc6df877', 'Politik dan Pemerintahan', '2024-11-23 14:02:47', '2024-11-23 14:02:47', NULL),
('9b7df0f0-0b78-4abc-862f-da6bdd0c344e', 'Agama dan Spiritualitas', '2024-11-23 14:03:03', '2024-11-23 14:03:03', NULL),
('9c70636a-781c-4ad3-adc4-8fe915ed14b4', 'Bahasa', '2024-11-23 14:04:42', '2024-11-23 14:04:42', NULL),
('9f7b1eb8-6a3b-492c-b385-337ca96b77d2', 'Teknologi dan Komputer', '2024-11-23 14:03:46', '2024-11-23 14:03:46', NULL),
('a7b3c5bb-bb96-4360-a35c-b79350686aad', 'Geografi dan Lingkungan', '2024-11-23 14:03:59', '2024-11-23 14:03:59', NULL),
('c24979cd-c129-4ce4-9f5c-99582b98a6ce', 'Fiksi Ilmiah', '2024-11-23 14:01:34', '2024-11-23 14:01:34', NULL),
('c8ddc8b7-8801-4b46-b0c5-e5bbbfce8f2c', 'Psikologi dan Pengembangan Diri', '2024-11-23 14:03:13', '2024-11-23 14:03:13', NULL),
('cb886719-5274-47bd-9646-5e21f9886e5e', 'Romansa', '2024-11-23 14:01:48', '2024-11-23 14:01:48', NULL),
('ceba6701-9ded-4072-ad73-682ae176480b', 'Sejarah', '2024-11-23 14:02:38', '2024-11-23 14:02:38', NULL),
('d599ef49-9491-4eef-9dda-bd0638feb6aa', 'Kedokteran dan Kesehatan', '2024-11-23 14:04:12', '2024-11-23 14:04:12', NULL),
('d9126a4f-7aab-473a-93b0-56058f33ae90', 'Misteri dan Detektif', '2024-11-23 14:01:24', '2024-11-23 14:01:24', NULL),
('dfc8299d-cf8f-4463-85e5-f7d3461071f0', 'Seni dan Desain', '2024-11-23 14:04:20', '2024-11-23 14:04:20', NULL),
('f8bdcdad-ccf8-432c-823e-56647f24996f', 'Hukum', '2024-11-23 14:04:05', '2024-11-23 14:04:05', NULL);

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`uuid`, `name`, `address`, `phone`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
('04fa0911-fc2c-4381-9d31-8b6da11bd567', 'Kevin', 'bali', '082345678912', 'kevin@mail.com', '2024-11-23 13:37:47', '2024-11-23 13:37:47', NULL),
('3558fd6d-22a6-4d5a-8131-e3988390d1b4', 'Yobel', 'antasura', '081234567890', 'yobel@mail.com', '2024-11-23 13:37:23', '2024-11-23 13:37:23', NULL),
('4897ab01-63ca-44e6-9ea1-0500bf8a239f', 'Jason', 'jepara', '083456789123', 'jason@mail.com', '2024-11-23 13:38:08', '2024-11-23 13:57:00', NULL),
('b026ce35-1998-42e7-8f2b-124fd0b4f003', 'Sabrina', 'cbd', '08456789123', 'sabrina@mail.com', '2024-11-23 13:57:55', '2024-11-23 13:57:55', NULL),
('b1a7ea87-379c-400c-b6f5-3d1088df9fd4', 'Manuel', 'Citraland', '081234567893', 'manuel@mail.com', '2024-11-23 13:58:47', '2024-11-23 13:58:47', NULL),
('bb327866-41c4-40ee-877a-1b2ba8323ff2', 'Barto', 'papua', '082337654478', 'barto@mail.com', '2024-11-23 13:59:55', '2024-11-23 14:00:01', '2024-11-23 14:00:01'),
('ee3e1177-ba21-4fcc-9c33-d0b334139684', 'Chandra', 'rinjani', '098723457652', 'chandra@mail.com', '2024-11-23 13:59:15', '2024-11-23 13:59:15', NULL);

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
(1, '001_create_users_table', 1),
(2, '002_create_cache_table', 1),
(3, '003_create_jobs_table', 1),
(4, '004_add_two_factor_columns_to_users_table', 1),
(5, '005_create_personal_access_tokens_table', 1),
(6, '006_create_members_table', 1),
(7, '007_create_categories_table', 1),
(8, '008_create_books_table', 1),
(9, '009_create_book_category_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2B3JMj1Uiq3Rc4ZajIupMqXDaSgSujRKrftjgTmT', NULL, '52.16.245.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU1YU0tranl3MUZsV0NRdnlaRTlWV2ZCdjBQcHJ5a1ByQmo3aFg5bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732384754),
('acK1ci3XlgwJj48h8v7T3FCAGoPj6B7QPLRcWflL', NULL, '34.28.228.114', 'Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWVuelB1S3BiWWdCM2NZOXkyTlhOVDQ4SGNNdTd0SVZjZ2NIMGtLQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732384124),
('fa5jGyGIDTDMDXn7BmDtBwX2Wq4O3hbSuAlXmJsA', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWhibklKUTRXQ1g4Q3lLSXBHZHlqRHJ1U3k5VmtPSE5hdUJNZ3B1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LnNlcnRpZmlrYXNpLm5ldGR4Yy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732384772),
('KcY4BKoutdUmc8GGQZjtcpJNdinrVV4TuQttqFji', NULL, '51.81.46.212', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUElERVdvSER3QjExWVo3aHJCUlFtdXlpNkNDenJONUk1STdLSmh3NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LnNlcnRpZmlrYXNpLm5ldGR4Yy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732385248),
('Knffds01D7aCTt5TikUpgp9dHeDBODVBelN9cguL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmMwd2VzUDFuSmJCcTN5eGdjZ1lwY2hjVEZXWkdFU0dFQTk1M0p1SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732377083),
('LoNqDMCjsNI78Mcd59bsitBvoC7euHKDD09P2DVY', NULL, '34.123.170.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibG9uSEh2NVY4bnVOc0c0UGhBaGcxaWVlbFc4aGFxdGpxNG1KMUVCMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732384627),
('ltpcIP0roQjNgdOBX0UgPYmq5qVn4vEiVWCEc070', NULL, '52.16.245.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjd5V0RRbk5maUt5MFA1VWNReVRjM1NNZlRIMmF0d0VkNXJDd0VpMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LnNlcnRpZmlrYXNpLm5ldGR4Yy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732384774),
('mbZgMKm7zHpW1vYuSxMYTyepPDIL6iwfV9hVv3rN', NULL, '195.211.77.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUFxOEU5UDRqYjFHTEFKYnlSbTdGNjNHQThndXBuZ1huTk5EZUNOUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732385258),
('NluigmQTeYBOVFL5gPXnuoFwIhfGTQxconTCVaDB', NULL, '205.169.39.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFBQT2xsUHlpU2FSUHN0cGEzVDVKTG15MUxGVEdtRlFjS29ubUtnQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732384729),
('nur46S3uA3r2vJoZollvAteS9bP18ILpTlT1ouBz', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWM1VGJiaDJUSTNIaERGNWIzSnlCcGtsdVMyRHhhQUJ2dlR5ekRlVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732384752),
('oH5Q7uTJs9TjudQuR102xkPxXtN4pvREtxrqBHN2', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEJYUWNmWlZVYTNHa0NhVnhYNVdCSUNCREVpWTB0UTRlZnBOOXpqcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732384749),
('PZkzxcRuOSJDKzkyriy7kYuHmsT6O4UkFX6OrdUe', NULL, '139.195.138.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFQyell4QUt0U1Z1MjFTdGtrbWswY2RUR21vU0VrT0g5UXVpemlTZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vc2VydGlmaWthc2kua2V2aW5jaHIuY29tL2Jvb2tzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732384070),
('S31whUHXJBoiTyntVNp798lEPl0sGa4hclgplFGf', NULL, '195.211.77.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZTA3N2RnNEdXZjM2dUxEQ3kwZGFLU0UySzN5ZkhEV1BxSnVDeFVubiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732385248),
('unJQZ2iWn7iOavL5m23qLeeLWkffPyWQN3vS3kNs', NULL, '34.71.77.167', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOG1KMktQZDlNQ2FMR3o3QnpVUUlsUXJ2Z3Bvc3RabXdJQ3dabUJVaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LnNlcnRpZmlrYXNpLm5ldGR4Yy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732384160),
('V25Qcumavt6TWOkyoaDgUQpYtPj7AW5wHmaZLKn6', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWdhNlFBaFZYMnZ2YjNabFk3czJCTU9zUElBdEVFZ2loTFhDa2pEZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LnNlcnRpZmlrYXNpLm5ldGR4Yy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732384769),
('V8WUVsq50l7SKIdJuqVPMrZU42fpzIp79nxOjFsK', NULL, '139.195.138.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmhkdXVBb1FRTDVxMldpZmQ4aGRDZmUyQzV6ZUxhWUtOakNOYlRDUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9zZXJ0aWZpa2FzaS5uZXRkeGMuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732384086),
('VGQRx9kTHamu8LWKuGXSlTpDr95DPLSRbQICwEBx', NULL, '88.99.26.177', 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.5993.80 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVpuQnV5SXhkT3dEeUtaVjluRmR0bDB5UmozNjZEYVJXdzNxWlhpTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vc2VydGlmaWthc2kubmV0ZHhjLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732384473);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `books_title_unique` (`title`),
  ADD KEY `books_member_uuid_foreign` (`member_uuid`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`book_uuid`,`category_uuid`),
  ADD KEY `book_category_category_uuid_foreign` (`category_uuid`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `members_phone_unique` (`phone`),
  ADD UNIQUE KEY `members_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_member_uuid_foreign` FOREIGN KEY (`member_uuid`) REFERENCES `members` (`uuid`) ON DELETE SET NULL;

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_uuid_foreign` FOREIGN KEY (`book_uuid`) REFERENCES `books` (`uuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_category_category_uuid_foreign` FOREIGN KEY (`category_uuid`) REFERENCES `categories` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
