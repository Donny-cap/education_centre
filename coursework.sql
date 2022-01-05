-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2022 at 05:34 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coursework`
--

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `subject_id` int(11) NOT NULL,
  `exam_date` date DEFAULT NULL,
  `consult_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `subject_id` int(11) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `first_colloqium` double DEFAULT NULL,
  `second_colloqium` double DEFAULT NULL,
  `third_colloqium` double DEFAULT NULL,
  `exam` double NOT NULL,
  `offset` double DEFAULT NULL,
  `final score` double DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `exam_consultdate` date DEFAULT NULL,
  `offset_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`subject_id`, `student_id`, `first_colloqium`, `second_colloqium`, `third_colloqium`, `exam`, `offset`, `final score`, `exam_date`, `exam_consultdate`, `offset_date`) VALUES
(1, '1', 5, 5, 5, 5, 5, 5, '2001-04-02', '2001-01-01', '2001-02-04'),
(2, '1', 5, 5, 5, 5, 5, 5, '2001-04-02', '2001-01-01', NULL),
(3, '1', 4, 4, 5, 4, 5, 5, '2001-04-02', '2001-01-01', NULL),
(4, '1', 4, 5, 6, 5, 4, 3, '2001-04-02', '2001-01-01', NULL),
(5, '1', 4, 4, 4, 4, 5, 5, '2001-04-02', '2001-01-01', NULL),
(6, '1', 5, 5, 5, 5, 5, 5, '2001-04-02', '2001-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `name` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`name`) VALUES
('Ain'),
('Min'),
('Win');

-- --------------------------------------------------------

--
-- Table structure for table `home_tasks`
--

CREATE TABLE `home_tasks` (
  `group` varchar(30) NOT NULL,
  `descr` longtext NOT NULL,
  `subject_id` int(11) NOT NULL,
  `deadline_date` date DEFAULT NULL,
  `num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_tasks`
--

INSERT INTO `home_tasks` (`group`, `descr`, `subject_id`, `deadline_date`, `num`) VALUES
('1', '4', 4, '2001-01-15', 12),
('Ain', 'fara', 6, '2002-02-02', 13),
('Ain', 'fara', 6, '2002-02-02', 14),
('Ain', 'fara', 6, '2002-02-02', 15),
('Ain', 'fara', 6, '2002-02-02', 16),
('Ain', 'fara', 6, '2002-02-02', 17),
('Min', 'SQL', 6, '2002-10-02', 18),
('Ain', 'sdelat', 6, '2021-02-12', 19),
('Ain', 'sdelat', 2, '2020-03-03', 20),
('Ain', 'gg', 1, '2020-12-12', 21);

-- --------------------------------------------------------

--
-- Table structure for table `home_tasks_has_students`
--

CREATE TABLE `home_tasks_has_students` (
  `home_tasks_subject_id` int(11) NOT NULL,
  `students_id` varchar(30) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'undone',
  `hw_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_tasks_has_students`
--

INSERT INTO `home_tasks_has_students` (`home_tasks_subject_id`, `students_id`, `status`, `hw_num`) VALUES
(22, '3', 'bad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `num` int(11) NOT NULL,
  `id` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `group` varchar(8) NOT NULL,
  `date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`num`, `id`, `first_name`, `last_name`, `user_name`, `password`, `group`, `date_of_birth`) VALUES
(1, '1', 'Fara', 'Adilov', 'fara', '12345', 'Ain', '2001-03-03'),
(10, '10', 'Samat', 'Suchpula', 'ss', '123', 'Win', '2001-01-01'),
(11, '11', 'Adil', 'Chermashew', 'Adi', '123', 'Ain', '2001-01-01'),
(2, '2', 'Madina', 'Turabaeva', 'Madi', '123', 'Win', '2001-01-01'),
(3, '3', 'Sultan ', 'Imankulov', 'sula', '12345', 'Ain', '2003-04-04'),
(4, '4', 'Aruuke', 'Toktosunova', 'Aruu', '12345', 'Min', '2001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `students_has_subjects`
--

CREATE TABLE `students_has_subjects` (
  `students_id` varchar(30) NOT NULL,
  `subjects_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students_has_subjects`
--

INSERT INTO `students_has_subjects` (`students_id`, `subjects_id`) VALUES
('', 2),
('1', 1),
('1', 2),
('1', 3),
('1', 4),
('1', 5),
('1', 6),
('10', 1),
('10', 2),
('10', 3),
('10', 6),
('11', 1),
('11', 2),
('11', 3),
('11', 4),
('11', 5),
('12', 1),
('2', 1),
('2', 2),
('2', 3),
('2', 4),
('2', 5),
('3', 1),
('3', 2),
('3', 4),
('3', 5),
('3', 6),
('4', 1),
('4', 2),
('4', 3),
('4', 4),
('4', 5),
('5', 1),
('5', 2),
('5', 3),
('5', 4),
('5', 5),
('6', 1),
('6', 2),
('6', 4),
('7', 1),
('7', 2),
('7', 3),
('7', 4),
('8', 1),
('8', 2),
('8', 3),
('8', 4),
('9', 1),
('9', 2),
('9', 3);

-- --------------------------------------------------------

--
-- Table structure for table `students_tookbook`
--

CREATE TABLE `students_tookbook` (
  `num` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `author` varchar(255) NOT NULL,
  `book` varchar(255) NOT NULL,
  `date_of_took` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students_tookbook`
--

INSERT INTO `students_tookbook` (`num`, `first_name`, `last_name`, `author`, `book`, `date_of_took`) VALUES
(1, 'Fara', 'Adilov', 'Remark', '3000 birds', '2001-03-03'),
(2, 'aman', 'atarov', 'Sara Jio', 'Ejevichnay Zima', '2001-01-01'),
(3, 'Sultan ', 'Imankulov', 'Ch Aitmatov', 'Krasnay Yablako', '2003-04-04'),
(4, 'Rahim', 'Madira', 'Lev Tolstoy', 'Voina i Mir', '2001-01-01'),
(5, 'holand', 'tomas', 'Pushkin', 'Ruslan i Ludmila', '2001-01-01'),
(6, 'endry', 'anobis', 'Almasovich', 'Java Beginners ', '2001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name_s` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name_s`) VALUES
(1, 'math'),
(2, 'Logic'),
(3, 'Programming Languages'),
(4, 'English'),
(5, 'German'),
(6, 'Software Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `num` int(11) NOT NULL,
  `id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_of_birth` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `subjects_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`num`, `id`, `first_name`, `last_name`, `date_of_birth`, `phone`, `user_name`, `password`, `subjects_id`) VALUES
(1, '123', 'Mariya', 'Abramova', '12.12.12', '4445', 'Mariya', '12345', 1),
(2, '321', 'Daniyar', 'Durov', '03.04.02', '4455', 'Dan', '12345', 2),
(4, '222', 'Askar', 'Almazovich', '15.03.02', '2132', 'Tech', '12345', 3),
(5, 't-5', 'Amanbek', 'Checheibaev', '18.04.20', '4425', 'Aman', '12345', 4);

-- --------------------------------------------------------

--
-- Table structure for table `teachers_tookbook`
--

CREATE TABLE `teachers_tookbook` (
  `num` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_of_took` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `book` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers_tookbook`
--

INSERT INTO `teachers_tookbook` (`num`, `first_name`, `last_name`, `date_of_took`, `author`, `book`) VALUES
(1, 'Mariy', 'Abramova', '12.12.12', 'Zik Frame', 'Povelitel Much'),
(2, 'Daniyar', 'Durov', '03.04.02', 'Tekneznaet', 'Samurai bez Mecha'),
(4, 'Askar', 'Almazovich', '15.03.02', 'Djek London', 'Martin Iden'),
(7, 'Aruke', 'Herego', '12.12.02', 'Skazka', 'Marchen');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(10) NOT NULL,
  `account_type` varchar(40) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `account_type`, `firstname`, `lastname`, `login`, `password`) VALUES
(1, 'student', 'Aruuke', 'Toktosunova', 'Aru', '250502'),
(2, 'student', 'Madina', 'Turabaeva', 'Madi', '231002'),
(3, 'director', 'Aida', 'Tologonova', 'dir', '1234'),
(6, 'librarian', 'John', 'William', 'lib', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`subject_id`,`exam`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `home_tasks`
--
ALTER TABLE `home_tasks`
  ADD PRIMARY KEY (`num`);

--
-- Indexes for table `home_tasks_has_students`
--
ALTER TABLE `home_tasks_has_students`
  ADD PRIMARY KEY (`home_tasks_subject_id`,`students_id`,`hw_num`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_has_subjects`
--
ALTER TABLE `students_has_subjects`
  ADD PRIMARY KEY (`students_id`,`subjects_id`);

--
-- Indexes for table `students_tookbook`
--
ALTER TABLE `students_tookbook`
  ADD PRIMARY KEY (`num`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`,`name_s`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`num`);

--
-- Indexes for table `teachers_tookbook`
--
ALTER TABLE `teachers_tookbook`
  ADD PRIMARY KEY (`num`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `home_tasks`
--
ALTER TABLE `home_tasks`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `students_tookbook`
--
ALTER TABLE `students_tookbook`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
