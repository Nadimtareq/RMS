-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2017 at 07:04 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `result_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(10) unsigned NOT NULL,
  `course_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `course_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `semester_code` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `credit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `course_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course_code`, `course_name`, `semester_code`, `status`, `credit`, `course_type`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 'CSE1211', 'Course 2', 2, 1, '60', '2', 1, 1, '2017-03-20 08:35:35', '2017-03-23 23:17:47'),
(4, 'CSE1212', 'Course 3', 2, 1, '80', '1', 1, 1, '2017-03-20 09:27:52', '2017-03-23 23:18:11'),
(5, 'CSE1213', 'Course 4', 2, 1, '3', '1', 1, 1, '2017-03-24 07:06:30', '2017-03-24 07:06:30'),
(6, 'CSE1214', 'Course 4', 2, 1, '3', '2', 1, 1, '2017-03-24 07:06:52', '2017-03-24 07:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE IF NOT EXISTS `examination` (
  `id` int(10) unsigned NOT NULL,
  `examination_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `semester` int(10) unsigned NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `examination`
--

INSERT INTO `examination` (`id`, `examination_name`, `semester`, `year`, `date`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 'Engineering Examination', 2, '2015', '24.03.2017', 1, 1, '2017-03-22 23:15:27', '2017-03-22 23:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_03_20_125510_create_semester_table', 1),
(4, '2017_03_20_125530_create_course_table', 1),
(5, '2017_03_20_125602_create_examination_table', 1),
(6, '2017_03_20_125624_create_student_table', 1),
(7, '2017_03_20_125651_create_student_course_table', 1),
(8, '2017_03_20_125713_create_student_course_mark_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `id` int(10) unsigned NOT NULL,
  `semester_code` int(11) NOT NULL,
  `semester_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `semester_code`, `semester_name`, `created_at`, `updated_at`) VALUES
(1, 11, '1st Year 1st Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00'),
(2, 12, '1st Year 2nd Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00'),
(3, 21, '2nd Year 1st Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00'),
(4, 22, '2nd Year 2nd Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00'),
(5, 31, '3rd Year 1st Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00'),
(6, 32, '3rd Year 2nd Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00'),
(7, 41, '4th Year 1st Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00'),
(8, 42, '4th Year 2nd Semester', '2017-03-19 12:00:00', '2017-03-19 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(10) unsigned NOT NULL,
  `session` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hall` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examination_id` int(10) unsigned DEFAULT NULL,
  `course_id_1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_4` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_5` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_6` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_7` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_8` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_9` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_10` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id_11` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(100) unsigned NOT NULL,
  `updated_by` int(100) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `session`, `student_id`, `student_name`, `hall`, `remarks`, `examination_id`, `course_id_1`, `course_id_2`, `course_id_3`, `course_id_4`, `course_id_5`, `course_id_6`, `course_id_7`, `course_id_8`, `course_id_9`, `course_id_10`, `course_id_11`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(106, '2012-13', 'CE-13023', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(107, '2011-12', 'CE-13024', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(108, '2012-13', 'CE-13025', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(109, '2011-12', 'CE-13026', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(110, '2012-13', 'CE-13027', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(111, '2011-12', 'CE-13028', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(112, '2012-13', 'CE-13029', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(113, '2011-12', 'CE-13030', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(114, '2012-13', 'CE-13031', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(115, '2011-12', 'CE-13032', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(116, '2012-13', 'CE-13033', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(117, '2011-12', 'CE-13034', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(118, '2012-13', 'CE-13035', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(119, '2011-12', 'CE-13036', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(120, '2012-13', 'CE-13037', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(121, '2011-12', 'CE-13038', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(122, '2012-13', 'CE-13039', 'ariful islam', 'MAMH', NULL, 4, '3', '4', '5', '6', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(123, '2011-12', 'CE-13040', 'Shimul', 'SMH', 'Fail', 4, '3', '4', '5', '', '', '', '', '', '', '', NULL, 1, 1, '2017-03-24 20:00:06', '2017-03-24 20:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

CREATE TABLE IF NOT EXISTS `student_course` (
  `id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_course_mark`
--

CREATE TABLE IF NOT EXISTS `student_course_mark` (
  `id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `internal` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `third_exam` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_present` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_test` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viva` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lab_quiz` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_course_mark`
--

INSERT INTO `student_course_mark` (`id`, `course_id`, `student_id`, `internal`, `external`, `third_exam`, `mark`, `class_present`, `class_test`, `viva`, `lab_quiz`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(294, 3, 106, '80', '100', '85', '82.5', '9', '18', NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-25 05:29:17'),
(295, 4, 106, NULL, NULL, NULL, '', '56', NULL, '90', '', 1, 1, '2017-03-24 20:00:03', '2017-03-25 05:33:06'),
(296, 5, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(297, 6, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(298, 3, 107, '', '', '', '0', 'sdfs', '', NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-25 05:29:17'),
(299, 4, 107, NULL, NULL, NULL, '', '90', NULL, '', '', 1, 1, '2017-03-24 20:00:03', '2017-03-25 05:33:06'),
(300, 5, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(301, 3, 108, '', '', '', '0', 'sdfs', '', NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-25 05:29:17'),
(302, 4, 108, NULL, NULL, NULL, '', '', NULL, '30', '', 1, 1, '2017-03-24 20:00:03', '2017-03-25 05:33:06'),
(303, 5, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(304, 6, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:03', '2017-03-24 20:00:03'),
(305, 3, 109, '', '', '', '0', 'sdfs', 'sdfs', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(306, 4, 109, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:33:06'),
(307, 5, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(308, 3, 110, '', '', '', '0', '', 'sdfs', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(309, 4, 110, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:33:06'),
(310, 5, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(311, 6, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(312, 3, 111, '', '', '', '0', 'sdf', '', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(313, 4, 111, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:33:06'),
(314, 5, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(315, 3, 112, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(316, 4, 112, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:33:07'),
(317, 5, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(318, 6, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(319, 3, 113, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(320, 4, 113, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:33:07'),
(321, 5, 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(322, 3, 114, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(323, 4, 114, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:33:07'),
(324, 5, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(325, 6, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(326, 3, 115, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(327, 4, 115, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:33:07'),
(328, 5, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-24 20:00:04'),
(329, 3, 116, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:04', '2017-03-25 05:29:17'),
(330, 4, 116, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:33:07'),
(331, 5, 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(332, 6, 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(333, 3, 117, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:29:17'),
(334, 4, 117, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:33:07'),
(335, 5, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(336, 3, 118, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:29:17'),
(337, 4, 118, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:33:07'),
(338, 5, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(339, 6, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(340, 3, 119, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:29:17'),
(341, 4, 119, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:33:07'),
(342, 5, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(343, 3, 120, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:29:17'),
(344, 4, 120, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:33:07'),
(345, 5, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(346, 6, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(347, 3, 121, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:29:17'),
(348, 4, 121, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:33:07'),
(349, 5, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(350, 3, 122, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:29:18'),
(351, 4, 122, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:05', '2017-03-25 05:33:07'),
(352, 5, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:05', '2017-03-24 20:00:05'),
(353, 6, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:06', '2017-03-24 20:00:06'),
(354, 3, 123, '', '', '', '0', '', '', NULL, NULL, 1, 1, '2017-03-24 20:00:06', '2017-03-25 05:29:18'),
(355, 4, 123, NULL, NULL, NULL, '', '', NULL, '', '', 1, 1, '2017-03-24 20:00:06', '2017-03-25 05:33:07'),
(356, 5, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2017-03-24 20:00:06', '2017-03-24 20:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ariful', 'a@gmail.com', 'asdasd', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_semester_code_foreign` (`semester_code`),
  ADD KEY `course_created_by_foreign` (`created_by`),
  ADD KEY `course_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `examination`
--
ALTER TABLE `examination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examination_semester_foreign` (`semester`),
  ADD KEY `examination_created_by_foreign` (`created_by`),
  ADD KEY `examination_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_examination_id_foreign` (`examination_id`),
  ADD KEY `student_created_by_foreign` (`created_by`),
  ADD KEY `student_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `student_course`
--
ALTER TABLE `student_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_course_course_id_foreign` (`course_id`),
  ADD KEY `student_course_student_id_foreign` (`student_id`),
  ADD KEY `student_course_created_by_foreign` (`created_by`),
  ADD KEY `student_course_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `student_course_mark`
--
ALTER TABLE `student_course_mark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_course_mark_course_id_foreign` (`course_id`),
  ADD KEY `student_course_mark_student_id_foreign` (`student_id`),
  ADD KEY `student_course_mark_created_by_foreign` (`created_by`),
  ADD KEY `student_course_mark_updated_by_foreign` (`updated_by`);

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
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `examination`
--
ALTER TABLE `examination`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `student_course`
--
ALTER TABLE `student_course`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_course_mark`
--
ALTER TABLE `student_course_mark`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=357;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_semester_code_foreign` FOREIGN KEY (`semester_code`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `examination`
--
ALTER TABLE `examination`
  ADD CONSTRAINT `examination_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examination_semester_foreign` FOREIGN KEY (`semester`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examination_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_examination_id_foreign` FOREIGN KEY (`examination_id`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_course`
--
ALTER TABLE `student_course`
  ADD CONSTRAINT `student_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_course_mark`
--
ALTER TABLE `student_course_mark`
  ADD CONSTRAINT `student_course_mark_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_mark_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_mark_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_course_mark_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
