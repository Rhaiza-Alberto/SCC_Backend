-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2026 at 08:20 AM
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
-- Database: `scc_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `college_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `college_name`) VALUES
(1, 'College of Computing Studies');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_title`, `description`, `department_id`, `created_at`) VALUES
(1, 'CS101', 'Introduction to Computing', 'Fundamentals of computing concepts', 1, '2026-03-04 11:26:42'),
(2, 'CS102', 'Computer Programming 1', 'Basic programming using C++', 1, '2026-03-04 11:26:42'),
(3, 'CS103', 'Discrete Mathematics', 'Logic, sets, and discrete structures', 1, '2026-03-04 11:26:42'),
(4, 'IT101', 'Introduction to Information Technology', 'Overview of IT concepts and practices', 2, '2026-03-04 11:26:42'),
(5, 'IT102', 'Computer Programming', 'Programming fundamentals', 2, '2026-03-04 11:26:42'),
(6, 'IT103', 'Web Development 1', 'HTML, CSS, and basic JavaScript', 2, '2026-03-04 11:26:42'),
(7, 'IS101', 'Introduction to Information Systems', 'Overview of information systems', 3, '2026-03-04 11:26:42'),
(8, 'IS102', 'Systems Analysis and Design', 'SDLC methodologies and system modeling', 3, '2026-03-04 11:26:42'),
(9, 'IS103', 'Database Management Systems', 'Relational databases and SQL', 3, '2026-03-04 11:26:42'),
(10, 'MATH101', 'College Algebra', 'Algebra fundamentals', 1, '2026-03-04 11:26:42'),
(11, 'GE101', 'Understanding the Self', 'General Education core subject', 1, '2026-03-04 11:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `college_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `college_id`) VALUES
(1, 'Department of Computer Science', 1),
(2, 'Department of Information Technology', 1),
(3, 'Department of Information Systems', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `syllabus_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `syllabus_id`, `message`, `is_read`, `created_at`) VALUES
(1, 1, NULL, 'Your registration has been approved by the Department Head. You may now log in.', 1, '2026-03-05 23:18:24'),
(2, 2, NULL, 'New faculty registration request from Lexa Al.', 1, '2026-03-05 23:35:10'),
(3, 8, NULL, 'Your registration has been approved by the Department Head. You may now log in.', 0, '2026-03-05 23:35:35'),
(4, 2, 1, '[NEW] New syllabus awaiting your approval: CS101', 1, '2026-03-06 11:10:15'),
(5, 3, 1, '[NEW] New syllabus awaiting your approval: CS101', 1, '2026-03-06 11:10:39'),
(6, 2, 2, '[NEW] New syllabus awaiting your approval: CS101', 1, '2026-03-06 14:18:24'),
(7, 3, 2, '[NEW] New syllabus awaiting your approval: CS101', 1, '2026-03-06 14:22:27'),
(8, 2, 1, 'New syllabus awaiting your approval: CS101', 0, '2026-03-18 22:32:27'),
(9, 1, 1, 'Your syllabus (CS101) has been fully approved by VPAA', 1, '2026-03-18 22:49:42'),
(10, 1, 1, 'Your syllabus (CS101) has been fully approved by VPAA', 1, '2026-03-18 22:49:50'),
(11, 1, 1, 'Your syllabus (CS101) has been fully approved by VPAA', 1, '2026-03-18 22:49:58'),
(12, 2, 2, 'Your syllabus (CS101) has been fully approved by VPAA', 0, '2026-03-18 22:51:22'),
(13, 1, 1, 'Your syllabus (CS101) has been fully approved by VPAA', 1, '2026-03-18 22:59:59'),
(14, 2, 2, 'Your syllabus (CS101) has been fully approved by VPAA', 0, '2026-03-18 23:00:22'),
(38, 4, 3, 'New syllabus awaiting your approval: CS101', 1, '2026-03-19 00:54:37'),
(39, 5, NULL, 'Your registration has been approved by the Dean. You may now log in.', 1, '2026-03-25 07:57:58'),
(40, 4, 4, '[NEW] New syllabus awaiting your approval: IM 101', 1, '2026-03-25 08:51:28'),
(41, 3, 3, 'Your syllabus (CS101) was rejected by the Vpaa', 1, '2026-03-25 09:10:03'),
(42, 5, 4, 'Your syllabus (IM 101) has been fully approved by VPAA', 1, '2026-03-25 09:32:12'),
(43, 3, 5, 'New syllabus awaiting your approval: IM 101', 1, '2026-05-10 13:43:27'),
(44, 4, 5, 'New syllabus awaiting your approval: IM 101', 1, '2026-05-10 13:48:32'),
(45, 1, 5, 'Your syllabus (IM 101) has been fully approved by VPAA', 0, '2026-05-10 13:49:29'),
(46, 3, NULL, 'New faculty registration request from Neil Angeles.', 0, '2026-05-10 13:51:06'),
(47, 10, NULL, 'Your registration has been approved by the Dean. You may now log in.', 1, '2026-05-10 13:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(10) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` enum('dean','faculty','vpaa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'dean'),
(2, 'faculty'),
(3, 'vpaa');

-- --------------------------------------------------------

--
-- Table structure for table `syllabus`
--

CREATE TABLE `syllabus` (
  `id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_code` varchar(50) NOT NULL DEFAULT '',
  `course_title` varchar(255) NOT NULL DEFAULT '',
  `course_name` varchar(255) DEFAULT NULL,
  `subject_type` varchar(100) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `school_year` varchar(20) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `syllabus`
--

INSERT INTO `syllabus` (`id`, `uploaded_by`, `course_id`, `course_code`, `course_title`, `course_name`, `subject_type`, `semester`, `file_path`, `school_year`, `status`, `submitted_at`) VALUES
(1, 1, 1, 'CS101', 'Computer Programming', 'Computer Science', 'Core Subject', '1st Semester', 'uploads/syllabi/CS101_1st_Semester_2026_69aa459740bb1.pdf', '2025-2026', 'Approved', '2026-03-06 03:10:15'),
(2, 2, 1, 'CS101', 'Computer Programming', 'Computer Science', 'Core Subject', '2nd Semester', 'uploads/syllabi/CS101_2nd_Semester_2026_69aa71b092a7b.pdf', '2025-2026', 'Approved', '2026-03-06 06:18:24'),
(3, 3, 1, 'CS101', 'Computer Programming 1', 'Computer Science', 'Core Subject', '1st Semester', 'uploads/syllabi/CS101_1st_Semester_2026_69bac7d32f579.pdf', '2025-2026', 'Rejected', '2026-03-18 15:42:11'),
(4, 5, NULL, 'IM 101', 'Information Management', 'Computer Science', 'Core Subject', '1st Semester', 'uploads/syllabi/IM_101_1st_Semester_2026_69c3312c7fc2c.pdf', '2025-2026', 'Approved', '2026-03-25 00:49:48'),
(5, 1, NULL, 'IM 101', 'Information Management', 'Computer Science', 'Institutional Subject', '1st Semester', 'uploads/syllabi/IM_101_1st_Semester_2026_6a001affa09bb.pdf', '2025–2026', 'Approved', '2026-05-10 05:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `syllabus_workflow`
--

CREATE TABLE `syllabus_workflow` (
  `id` int(11) NOT NULL,
  `syllabus_id` int(11) NOT NULL,
  `step_order` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `action` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `comment` text DEFAULT NULL,
  `action_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `syllabus_workflow`
--

INSERT INTO `syllabus_workflow` (`id`, `syllabus_id`, `step_order`, `role_id`, `reviewer_id`, `action`, `comment`, `action_at`) VALUES
(2, 1, 1, 1, 3, 'Approved', NULL, '2026-03-18 15:05:43'),
(4, 2, 1, 1, 3, 'Approved', NULL, '2026-03-18 15:04:20'),
(6, 1, 2, 3, 4, 'Approved', NULL, '2026-03-18 15:49:58'),
(7, 2, 2, 3, 4, 'Approved', NULL, '2026-03-18 15:00:22'),
(17, 3, 2, 3, 4, 'Rejected', 'mali', '2026-03-25 01:10:03'),
(18, 3, 1, 1, 3, 'Approved', NULL, '2026-03-18 16:54:37'),
(29, 4, 1, 1, 3, 'Approved', NULL, '2026-03-25 00:51:28'),
(30, 4, 2, 3, 4, 'Approved', NULL, '2026-03-25 01:32:12'),
(31, 5, 1, 1, 3, 'Approved', NULL, '2026-05-10 05:48:32'),
(32, 5, 2, 3, 4, 'Approved', NULL, '2026-05-10 05:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `sex` enum('Male','Female') DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `reset_requested` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `birthdate`, `sex`, `email`, `password`, `role_id`, `department_id`, `created_at`, `is_deleted`, `is_approved`, `reset_requested`) VALUES
(1, 'Jaymie', NULL, 'Tuble', '2006-03-21', 'Female', 'faculty@gmail.com', '$2y$10$dECFlCjYcwoUxUMD0E776eknmlTgb2uZUVXCpsWuqYbt3HPZIx46.', 2, 1, '2026-03-04 11:26:42', 0, 1, 0),
(2, 'Pilgrim', 'B', 'Manahan', '2003-02-22', 'Male', 'dept@gmail.com', '$2y$10$q9KytmRQ3C/pChB4YZ07jOjaj5YbDLiTueCF0csMdeEuePR.y3Wyq', 2, 1, '2026-03-04 11:26:42', 0, 1, 0),
(3, 'Vince', NULL, 'Guerra', '2002-02-07', 'Male', 'dean@gmail.com', '$2y$10$ans8AfweCSRzFd.FZA0zPu9B.wOKWFQwjIX1UsUgOvh.Scflo86pu', 1, 1, '2026-03-04 11:26:42', 0, 1, 0),
(4, 'Jose', NULL, 'Rizal', '2000-06-19', 'Male', 'vpaa@gmail.com', '$2y$10$6zPVOIV5.CRzZT3MVcBqDucRxBqVtt34WHKlewsL4bUo11egjLHxG', 3, 1, '2026-03-04 11:26:42', 0, 1, 0),
(5, 'Floralyn', 'Hipolani', 'Bernardo', '2006-03-24', 'Female', 'floralyn@gmail.com', '$2y$10$qNGDmAjbkfpcvy3MdvE3Cu5jBUPtqlM4.ozsLXcknoaEhWD1VbBXe', 2, 3, '2026-03-04 11:26:42', 0, 1, 0),
(8, 'Lexa', NULL, 'Al', '2006-07-02', 'Female', 'lexaai725@gmail.com', '$2y$10$oIxo165.vGPnr9POgqrgX.AG.i5apuuy7ZP3L8Bo/r7jphcf59IFO', 2, 1, '2026-03-05 15:35:10', 0, 1, 0),
(9, 'Rhaiza', NULL, 'Alberto', '2006-07-02', 'Female', 'alberto@gmail.com', '$2y$10$UI862e3weqS0AENcCwzNUuZp8REJtkv2JjrLTWzXhMigU4KyUmJsW', 2, 3, '2026-03-06 06:08:26', 0, 1, 0),
(10, 'Neil', NULL, 'Angeles', '2005-02-10', 'Male', 'neil@gmail.com', '$2y$10$ymWZ.8nxQTe62yRZl4q52Ocg3a.OANL8RKrPr2oRABRbKwL50E/3u', 2, 2, '2026-05-10 05:51:06', 0, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `college_name` (`college_name`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_code` (`course_code`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `college_id` (`college_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `syllabus_id` (`syllabus_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `syllabus`
--
ALTER TABLE `syllabus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `syllabus_workflow`
--
ALTER TABLE `syllabus_workflow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_syllabus_role` (`syllabus_id`,`role_id`),
  ADD KEY `syllabus_id` (`syllabus_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `syllabus`
--
ALTER TABLE `syllabus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `syllabus_workflow`
--
ALTER TABLE `syllabus_workflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabus` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `syllabus`
--
ALTER TABLE `syllabus`
  ADD CONSTRAINT `syllabus_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `syllabus_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `syllabus_workflow`
--
ALTER TABLE `syllabus_workflow`
  ADD CONSTRAINT `syllabus_workflow_ibfk_1` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `syllabus_workflow_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `syllabus_workflow_ibfk_3` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
