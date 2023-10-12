-- phpMyAdmin SQL Dump
-- version 5.1.0-rc1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 29, 2022 at 12:29 PM
-- Server version: 5.7.36-0ubuntu0.18.04.1
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ceriakan`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `user_update` int(11) DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  `id_teacher` varchar(255) DEFAULT NULL,
  `isVisible` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`id`, `title`, `description`, `date_created`, `due_date`, `user_update`, `date_update`, `id_teacher`, `isVisible`) VALUES
(1, 'Buat deret', 'blablabla', '2022-09-22', '2022-09-29', 3, '2022-09-22', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `id_class` int(11) DEFAULT NULL,
  `nomor_induk` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status_kehadiran` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bulletin`
--

CREATE TABLE `bulletin` (
  `id` int(11) NOT NULL,
  `update_date` date DEFAULT NULL,
  `approval_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `user_update` int(11) DEFAULT NULL,
  `isApproved` tinyint(1) DEFAULT NULL,
  `comment` longtext,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `nomor_induk` varchar(255) NOT NULL,
  `nik_parent` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `notification_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`nomor_induk`, `nik_parent`, `id_kelas`, `nama`, `notification_token`) VALUES
('116130', '1571621407750054', 1, 'Alice', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `kelas` varchar(255) DEFAULT NULL,
  `thn_akademik` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `nomor_pegawai` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `periode_awal` varchar(255) DEFAULT NULL,
  `periode_akhir` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `kelas`, `thn_akademik`, `status`, `nomor_pegawai`, `foto`, `deskripsi`, `periode_awal`, `periode_akhir`) VALUES
(1, 'Matematika', '2022', 1, '116130', NULL, 'Pelajaran matematika', '2022-08-01', '2023-07-31');

-- --------------------------------------------------------

--
-- Table structure for table `class_assignment`
--

CREATE TABLE `class_assignment` (
  `id` int(11) NOT NULL,
  `id_class` int(11) DEFAULT NULL,
  `id_assignment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_assignment`
--

INSERT INTO `class_assignment` (`id`, `id_class`, `id_assignment`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class_event`
--

CREATE TABLE `class_event` (
  `id` int(11) NOT NULL,
  `id_class` int(11) DEFAULT NULL,
  `id_event` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discussion`
--

CREATE TABLE `discussion` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_assignment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `user_upload` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `id_event` int(11) DEFAULT NULL,
  `id_submission` int(11) DEFAULT NULL,
  `id_assignment` int(11) DEFAULT NULL,
  `id_bulletin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_class` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `date_upload` datetime DEFAULT NULL,
  `user_upload` int(11) DEFAULT NULL,
  `id_folder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `folder`
--

CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `user_create` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `id_indicator` int(11) DEFAULT NULL,
  `id_submission` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_chat`
--

CREATE TABLE `group_chat` (
  `id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_sender` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_class` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indicator`
--

CREATE TABLE `indicator` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2022_08_30_140335_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `nik` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raport`
--

CREATE TABLE `raport` (
  `id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `nis` varchar(255) DEFAULT NULL,
  `id_tema` int(11) DEFAULT NULL,
  `id_subtema` int(11) DEFAULT NULL,
  `id_indicator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2022-08-30 18:40:36', '2022-08-30 18:40:36'),
(2, 'orang_tua', 'web', '2022-08-30 18:40:36', '2022-08-30 18:40:36'),
(3, 'guru', 'web', '2022-08-30 18:40:36', '2022-08-30 18:40:36'),
(4, 'siswa', 'web', '2022-08-30 18:40:36', '2022-08-30 18:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `id` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `files` varchar(255) DEFAULT NULL,
  `nim_siswa` varchar(255) DEFAULT NULL,
  `id_assignment` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `user_update` int(11) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subtema`
--

CREATE TABLE `subtema` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id_tema` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `nomor_pegawai` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tema_indicator`
--

CREATE TABLE `tema_indicator` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id_tema` int(11) DEFAULT NULL,
  `id_subtema` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nomor_induk` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `nomor_induk`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Burhan Mafazi', '216105', 'burhanburdev@gmail.com', NULL, '$2y$10$4/gn7S3k3QfqhpQeGG7wJe21iT1Wt.qKq145EjcwluidsSUzS3pu.', NULL, '2022-08-30 18:40:36', '2022-08-30 18:40:36'),
(2, 'Meredita Susanty', '116020', 'orangtua@gmail.com', NULL, '$2y$10$AaCvYZRqKD1LrNTGn9Mi4.LagnatI2A6PM6Ypehs9vgsdOAPIXLlK', NULL, '2022-08-30 18:40:37', '2022-08-30 18:40:37'),
(3, 'Ade Irawan', '116130', 'guru@gmail.com', NULL, '$2y$10$LYhIkyuGTDSIzyPGbH/8DucO8k3pls12JpYlD1EjPfK./OhT/b0Y2', NULL, '2022-08-30 18:40:37', '2022-08-30 18:40:37'),
(4, 'Bayu Wicaksono', '219059', 'siswa@gmail.com', NULL, '$2y$10$iZbGphPx9tWQW.PqPhg4OeBE/.z5hOAYTazTJcTkgKhQ2Zju7VsOC', NULL, '2022-08-30 18:40:37', '2022-08-30 18:40:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_update` (`user_update`),
  ADD KEY `id_teacher` (`id_teacher`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_class` (`id_class`);

--
-- Indexes for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_update` (`user_update`);

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`nomor_induk`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_assignment`
--
ALTER TABLE `class_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_class` (`id_class`),
  ADD KEY `id_assignment` (`id_assignment`);

--
-- Indexes for table `class_event`
--
ALTER TABLE `class_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_class` (`id_class`),
  ADD KEY `id_event` (`id_event`);

--
-- Indexes for table `discussion`
--
ALTER TABLE `discussion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_assignment` (`id_assignment`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_upload` (`user_upload`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `id_submission` (`id_submission`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_bulletin` (`id_bulletin`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_class` (`id_class`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_upload` (`user_upload`),
  ADD KEY `id_folder` (`id_folder`);

--
-- Indexes for table `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_create` (`user_create`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_indicator` (`id_indicator`),
  ADD KEY `id_submission` (`id_submission`);

--
-- Indexes for table `group_chat`
--
ALTER TABLE `group_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_class` (`id_class`);

--
-- Indexes for table `indicator`
--
ALTER TABLE `indicator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `raport`
--
ALTER TABLE `raport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tema` (`id_tema`),
  ADD KEY `id_subtema` (`id_subtema`),
  ADD KEY `id_indicator` (`id_indicator`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `user_update` (`user_update`);

--
-- Indexes for table `subtema`
--
ALTER TABLE `subtema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`nomor_pegawai`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tema_indicator`
--
ALTER TABLE `tema_indicator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tema` (`id_tema`),
  ADD KEY `id_subtema` (`id_subtema`);

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
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulletin`
--
ALTER TABLE `bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_assignment`
--
ALTER TABLE `class_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_event`
--
ALTER TABLE `class_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussion`
--
ALTER TABLE `discussion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `folder`
--
ALTER TABLE `folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_chat`
--
ALTER TABLE `group_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indicator`
--
ALTER TABLE `indicator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raport`
--
ALTER TABLE `raport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `submission`
--
ALTER TABLE `submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subtema`
--
ALTER TABLE `subtema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tema_indicator`
--
ALTER TABLE `tema_indicator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`user_update`) REFERENCES `users` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`);

--
-- Constraints for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `bulletin_ibfk_1` FOREIGN KEY (`user_update`) REFERENCES `users` (`id`);

--
-- Constraints for table `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `child_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `class` (`id`);

--
-- Constraints for table `class_assignment`
--
ALTER TABLE `class_assignment`
  ADD CONSTRAINT `class_assignment_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `class_assignment_ibfk_2` FOREIGN KEY (`id_assignment`) REFERENCES `assignment` (`id`);

--
-- Constraints for table `class_event`
--
ALTER TABLE `class_event`
  ADD CONSTRAINT `class_event_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `class_event_ibfk_2` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`);

--
-- Constraints for table `discussion`
--
ALTER TABLE `discussion`
  ADD CONSTRAINT `discussion_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `discussion_ibfk_2` FOREIGN KEY (`id_assignment`) REFERENCES `assignment` (`id`);

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`user_upload`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `document_ibfk_3` FOREIGN KEY (`id_submission`) REFERENCES `submission` (`id`),
  ADD CONSTRAINT `document_ibfk_4` FOREIGN KEY (`id_assignment`) REFERENCES `assignment` (`id`),
  ADD CONSTRAINT `document_ibfk_5` FOREIGN KEY (`id_bulletin`) REFERENCES `bulletin` (`id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`);

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`user_upload`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `file_ibfk_2` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id`);

--
-- Constraints for table `folder`
--
ALTER TABLE `folder`
  ADD CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`user_create`) REFERENCES `users` (`id`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`id_indicator`) REFERENCES `indicator` (`id`),
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`id_submission`) REFERENCES `submission` (`id`);

--
-- Constraints for table `group_chat`
--
ALTER TABLE `group_chat`
  ADD CONSTRAINT `group_chat_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `raport`
--
ALTER TABLE `raport`
  ADD CONSTRAINT `raport_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  ADD CONSTRAINT `raport_ibfk_2` FOREIGN KEY (`id_subtema`) REFERENCES `subtema` (`id`),
  ADD CONSTRAINT `raport_ibfk_3` FOREIGN KEY (`id_indicator`) REFERENCES `indicator` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `submission`
--
ALTER TABLE `submission`
  ADD CONSTRAINT `submission_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `submission_ibfk_2` FOREIGN KEY (`id_assignment`) REFERENCES `assignment` (`id`),
  ADD CONSTRAINT `submission_ibfk_3` FOREIGN KEY (`user_update`) REFERENCES `users` (`id`);

--
-- Constraints for table `subtema`
--
ALTER TABLE `subtema`
  ADD CONSTRAINT `subtema_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`);

--
-- Constraints for table `tema_indicator`
--
ALTER TABLE `tema_indicator`
  ADD CONSTRAINT `tema_indicator_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  ADD CONSTRAINT `tema_indicator_ibfk_2` FOREIGN KEY (`id_subtema`) REFERENCES `subtema` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
