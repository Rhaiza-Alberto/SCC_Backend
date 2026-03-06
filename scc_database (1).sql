-- ============================================================
-- SCC-CCS Syllabus Portal — Full Schema (v2 - Final Fixed)
-- Adds: password_resets table for OTP-based password recovery
-- Fixes: dean role routing (was mapped to 'admin', now 'dean')
-- ============================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `scc_database`
    CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `scc_database`;

-- --------------------------------------------------------
-- colleges
-- --------------------------------------------------------
DROP TABLE IF EXISTS `colleges`;
CREATE TABLE `colleges` (
  `id`           int(11)      NOT NULL,
  `college_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `colleges` VALUES (1, 'College of Computing Studies');

-- --------------------------------------------------------
-- departments
-- --------------------------------------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id`              int(11)      NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `college_id`      int(11)      NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `departments` VALUES
(1, 'Department of Computer Science',        1),
(2, 'Department of Information Technology',  1),
(3, 'Department of Information Systems',     1);

-- --------------------------------------------------------
-- courses
-- --------------------------------------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id`            int(11)      NOT NULL,
  `course_code`   varchar(50)  NOT NULL,
  `course_title`  varchar(255) NOT NULL,
  `description`   text         DEFAULT NULL,
  `department_id` int(11)      NOT NULL,
  `created_at`    datetime     NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `courses` VALUES
(1,  'CS101',   'Introduction to Computing',               'Fundamentals of computing concepts',       1, '2026-03-04 11:26:42'),
(2,  'CS102',   'Computer Programming 1',                  'Basic programming using C++',               1, '2026-03-04 11:26:42'),
(3,  'CS103',   'Discrete Mathematics',                    'Logic, sets, and discrete structures',      1, '2026-03-04 11:26:42'),
(4,  'IT101',   'Introduction to Information Technology',  'Overview of IT concepts and practices',     2, '2026-03-04 11:26:42'),
(5,  'IT102',   'Computer Programming',                    'Programming fundamentals',                  2, '2026-03-04 11:26:42'),
(6,  'IT103',   'Web Development 1',                       'HTML, CSS, and basic JavaScript',           2, '2026-03-04 11:26:42'),
(7,  'IS101',   'Introduction to Information Systems',     'Overview of information systems',           3, '2026-03-04 11:26:42'),
(8,  'IS102',   'Systems Analysis and Design',             'SDLC methodologies and system modeling',    3, '2026-03-04 11:26:42'),
(9,  'IS103',   'Database Management Systems',             'Relational databases and SQL',              3, '2026-03-04 11:26:42'),
(10, 'MATH101', 'College Algebra',                         'Algebra fundamentals',                      1, '2026-03-04 11:26:42'),
(11, 'GE101',   'Understanding the Self',                  'General Education core subject',            1, '2026-03-04 11:26:42');

-- --------------------------------------------------------
-- roles
-- NOTE: 'dean' is its own role — NOT aliased as 'admin'
-- --------------------------------------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id`        int(11)                                        NOT NULL,
  `role_name` enum('dean','department_head','faculty','vpaa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `roles` VALUES
(1, 'dean'),
(2, 'department_head'),
(3, 'faculty'),
(4, 'vpaa');

-- --------------------------------------------------------
-- users
-- --------------------------------------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id`              int(11)               NOT NULL,
  `first_name`      varchar(100)          NOT NULL,
  `middle_name`     varchar(100)          DEFAULT NULL,
  `last_name`       varchar(100)          NOT NULL,
  `birthdate`       date                  DEFAULT NULL,
  `sex`             enum('Male','Female') DEFAULT NULL,
  `email`           varchar(150)          NOT NULL,
  `password`        varchar(255)          NOT NULL,
  `role_id`         int(11)               NOT NULL,
  `department_id`   int(11)               DEFAULT NULL,
  `created_at`      timestamp             NOT NULL DEFAULT current_timestamp(),
  `is_deleted`      tinyint(1)            DEFAULT 0,
  `is_approved`     tinyint(1)            NOT NULL DEFAULT 0,
  `reset_requested` tinyint(1)            DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- All plain-text passwords = "password" (auto-upgraded to bcrypt on first login)
INSERT INTO `users` VALUES
(1, 'Jaymie',   NULL,       'Tuble',    '2006-03-21', 'Female', 'faculty@gmail.com',   '$2y$10$dECFlCjYcwoUxUMD0E776eknmlTgb2uZUVXCpsWuqYbt3HPZIx46.', 3, 1, '2026-03-04 11:26:42', 0, 1, 0),
(2, 'Pilgrim',  'B',        'Manahan',  '2003-02-22', 'Male',   'dept@gmail.com',      '$2y$10$q9KytmRQ3C/pChB4YZ07jOjaj5YbDLiTueCF0csMdeEuePR.y3Wyq', 2, 1, '2026-03-04 11:26:42', 0, 1, 0),
(3, 'Vince',    NULL,       'Guerra',   '2002-02-07', 'Male',   'dean@gmail.com',      '$2y$10$ans8AfweCSRzFd.FZA0zPu9B.wOKWFQwjIX1UsUgOvh.Scflo86pu', 1, 1, '2026-03-04 11:26:42', 0, 1, 0),
(4, 'Jose',     NULL,       'Rizal',    '2000-06-19', 'Male',   'vpaa@gmail.com',      '$2y$10$6zPVOIV5.CRzZT3MVcBqDucRxBqVtt34WHKlewsL4bUo11egjLHxG', 4, 1, '2026-03-04 11:26:42', 0, 1, 0),
(5, 'Floralyn', 'Hipolani', 'Bernardo', '2006-03-24', 'Female', 'floralyn@gmail.com',  '$2y$10$1hWnjBXyHJHYEgdvfQFq6uHMiZD5SB4R/JlAJfRvdBVtrqddy2Z0m', 3, 3, '2026-03-04 11:26:42', 0, 0, 0),
(8, 'Lexa',     NULL,       'Al',       '2006-07-02', 'Female', 'lexaai725@gmail.com', '$2y$10$oIxo165.vGPnr9POgqrgX.AG.i5apuuy7ZP3L8Bo/r7jphcf59IFO', 3, 1, '2026-03-05 15:35:10', 0, 1, 0);

-- --------------------------------------------------------
-- syllabus
-- Free-text course_code/course_title stored at upload time.
-- course_id is an optional FK if the code matches a courses row.
-- --------------------------------------------------------
DROP TABLE IF EXISTS `syllabus`;
CREATE TABLE `syllabus` (
  `id`           int(11)                               NOT NULL,
  `uploaded_by`  int(11)                               NOT NULL,
  `course_id`    int(11)                               DEFAULT NULL,
  `course_code`  varchar(50)                           NOT NULL DEFAULT '',
  `course_title` varchar(255)                          NOT NULL DEFAULT '',
  `course_name`  varchar(255)                          DEFAULT NULL,
  `subject_type` varchar(100)                          DEFAULT NULL,
  `semester`     varchar(50)                           DEFAULT NULL,
  `file_path`    varchar(255)                          DEFAULT NULL,
  `school_year`  varchar(20)                           DEFAULT NULL,
  `status`       enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `submitted_at` timestamp                             NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- syllabus_workflow
-- --------------------------------------------------------
DROP TABLE IF EXISTS `syllabus_workflow`;
CREATE TABLE `syllabus_workflow` (
  `id`          int(11)                               NOT NULL,
  `syllabus_id` int(11)                               NOT NULL,
  `step_order`  int(11)                               NOT NULL,
  `role_id`     int(11)                               NOT NULL,
  `reviewer_id` int(11)                               DEFAULT NULL,
  `action`      enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `comment`     text                                  DEFAULT NULL,
  `action_at`   timestamp                             NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- notifications
-- --------------------------------------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id`          int(11)    NOT NULL,
  `user_id`     int(11)    NOT NULL,
  `syllabus_id` int(11)    DEFAULT NULL,
  `message`     text       NOT NULL,
  `is_read`     tinyint(1) DEFAULT 0,
  `created_at`  datetime   NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `notifications` VALUES
(1, 1, NULL, 'Your registration has been approved by the Department Head. You may now log in.', 0, '2026-03-05 23:18:24'),
(2, 2, NULL, 'New faculty registration request from Lexa Al.', 0, '2026-03-05 23:35:10'),
(3, 8, NULL, 'Your registration has been approved by the Department Head. You may now log in.', 0, '2026-03-05 23:35:35');

-- --------------------------------------------------------
-- password_resets  ← NEW TABLE for forgot-password OTP flow
-- --------------------------------------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `id`         int(11)     NOT NULL,
  `user_id`    int(11)     NOT NULL,
  `token`      varchar(10) NOT NULL,          -- 6-digit OTP
  `expires_at` datetime    NOT NULL,          -- valid for 15 minutes
  `created_at` datetime    NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- PRIMARY KEYS
-- ============================================================
ALTER TABLE `colleges`          ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `college_name` (`college_name`);
ALTER TABLE `courses`           ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `course_code` (`course_code`), ADD KEY `department_id` (`department_id`);
ALTER TABLE `departments`       ADD PRIMARY KEY (`id`), ADD KEY `college_id` (`college_id`);
ALTER TABLE `notifications`     ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `syllabus_id` (`syllabus_id`);
ALTER TABLE `password_resets`   ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);
ALTER TABLE `roles`             ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `role_name` (`role_name`);
ALTER TABLE `syllabus`          ADD PRIMARY KEY (`id`), ADD KEY `uploaded_by` (`uploaded_by`), ADD KEY `course_id` (`course_id`);
ALTER TABLE `syllabus_workflow` ADD PRIMARY KEY (`id`), ADD KEY `syllabus_id` (`syllabus_id`), ADD KEY `role_id` (`role_id`), ADD KEY `reviewer_id` (`reviewer_id`);
ALTER TABLE `users`             ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`), ADD KEY `role_id` (`role_id`), ADD KEY `department_id` (`department_id`);

-- ============================================================
-- AUTO_INCREMENT
-- ============================================================
ALTER TABLE `colleges`          MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `courses`           MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
ALTER TABLE `departments`       MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `notifications`     MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `password_resets`   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `roles`             MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `syllabus`          MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `syllabus_workflow` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `users`             MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

-- ============================================================
-- FOREIGN KEYS
-- ============================================================
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`id`);

ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`)     REFERENCES `users`    (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabus` (`id`) ON DELETE SET NULL;

ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `syllabus`
  ADD CONSTRAINT `syllabus_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users`   (`id`),
  ADD CONSTRAINT `syllabus_ibfk_2` FOREIGN KEY (`course_id`)   REFERENCES `courses` (`id`) ON DELETE SET NULL;

ALTER TABLE `syllabus_workflow`
  ADD CONSTRAINT `syllabus_workflow_ibfk_1` FOREIGN KEY (`syllabus_id`)  REFERENCES `syllabus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `syllabus_workflow_ibfk_2` FOREIGN KEY (`role_id`)      REFERENCES `roles`    (`id`),
  ADD CONSTRAINT `syllabus_workflow_ibfk_3` FOREIGN KEY (`reviewer_id`)  REFERENCES `users`    (`id`);

ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`)       REFERENCES `roles`       (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;