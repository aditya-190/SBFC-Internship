-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 08, 2020 at 12:30 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Mylms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
                           `FIRSTNAME` varchar(20) NOT NULL,
                           `LASTNAME` varchar(20) NOT NULL,
                           `EMAIL` varchar(50) NOT NULL,
                           `USER_TYPE` varchar(100) NOT NULL,
                           `DOJ` date NOT NULL,
                           `TIMEZONE` varchar(100) NOT NULL,
                           `LANGUAGE` varchar(100) NOT NULL,
                           `PROFILE_IMG` longblob,
                           `USER_ID` varchar(20) NOT NULL,
                           `PASSWORD` varchar(255) NOT NULL,
                           `REGISTRATION` date NOT NULL,
                           `LOGINTIME` time DEFAULT '00:00:00',
                           `DEPARTMENT` varchar(20) NOT NULL,
                           `ROLE` varchar(20) NOT NULL,
                           `STATUS` varchar(15) NOT NULL,
                           `Group_Name` varchar(100) DEFAULT 'Not in Any Group'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`FIRSTNAME`, `LASTNAME`, `EMAIL`, `USER_TYPE`, `DOJ`, `TIMEZONE`, `LANGUAGE`, `PROFILE_IMG`, `USER_ID`, `PASSWORD`, `REGISTRATION`, `LOGINTIME`, `DEPARTMENT`, `ROLE`, `STATUS`, `Group_Name`) VALUES
('ADITYA', 'BHARDWAJ', 'aditya@gmail.com', 'ADMIN', '1970-01-01', 'KOLKATA', 'ENGLISH', NULL, '1', '$2y$10$Kz8fJeS8XKVA6u1IjOpNn.p6RM41V9cM03D27.erR0pSuiCqfZh7u', '2020-09-07', '05:30:21', 'technical', 'help', 'ACTIVE', 'AB');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
                           `NAME` varchar(20) NOT NULL,
                           `COURSE_ID` varchar(20) NOT NULL,
                           `COURSE_IMG` longblob NOT NULL,
                           `DURATION` varchar(20) NOT NULL,
                           `DESCRIPTION` varchar(20) NOT NULL,
                           `VIDEO` longblob NOT NULL,
                           `STATUS` varchar(20) NOT NULL,
                           `UPLOAD_DATE` varchar(20) NOT NULL,
                           `ASSESSMENT` varchar(20) NOT NULL,
                           `CERTIFICATE` longblob NOT NULL,
                           `ASSIGNUSER` varchar(1000) DEFAULT 'No User',
                           `ASSIGNGROUP` varchar(1000) DEFAULT 'Not in Any Group'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`NAME`, `COURSE_ID`, `COURSE_IMG`, `DURATION`, `DESCRIPTION`, `VIDEO`, `STATUS`, `UPLOAD_DATE`, `ASSESSMENT`, `CERTIFICATE`, `ASSIGNUSER`, `ASSIGNGROUP`) VALUES
('PYHON', '2000', 0x66756c6c2d73637265656e2d696d6167652d332e6a7067, '00:12:34', 'VERY GOOD', 0x6d6f7669652e6d7034, 'ACTIVE', '04-09-2020', 'No Assesment', 0x6473686d61696e2e706e67, 'No User', 'Not in Any Group'),
('JAVA & PHP', '2001', 0x66756c6c2d73637265656e2d696d6167652d332e6a7067, '00:34:56', 'NICE', 0x6d6f7669652e6d7034, 'ACTIVE', '04-09-2020', 'No Assesment', 0x6473686d61696e2e706e67, 'No User', 'Not in Any Group');

-- --------------------------------------------------------

--
-- Table structure for table `COURSE_LOG`
--

CREATE TABLE `COURSE_LOG` (
    `COUNTER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course_status`
--

CREATE TABLE `course_status` (
                                 `STATUS` varchar(20) NOT NULL,
                                 `PROGRESS` int(3) NOT NULL,
                                 `USER_ID` varchar(20) NOT NULL,
                                 `COURSE_ID` varchar(20) NOT NULL,
                                 `START_DATE` date NOT NULL,
                                 `END_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_users`
--

CREATE TABLE `group_users` (
                               `Group_ID` int(20) NOT NULL,
                               `Group_Name` varchar(100) NOT NULL DEFAULT 'Not in Any Group'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_users`
--

INSERT INTO `group_users` (`Group_ID`, `Group_Name`) VALUES
(1, 'AB');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
                          `MODULE_ID` int(10) NOT NULL,
                          `VIDEO_NAME` varchar(20) NOT NULL,
                          `VIDEO_LOCATION` text NOT NULL,
                          `MODULE_NAME` varchar(100) NOT NULL,
                          `COURSE_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`MODULE_ID`, `VIDEO_NAME`, `VIDEO_LOCATION`, `MODULE_NAME`, `COURSE_ID`) VALUES
(10001, '', '', 'MODULE 1', '10001'),
(10001, 'VIDEO 1', 'assets/video/movie.mp4', 'MODULE 1', '10001'),
(10001, 'VIDEO 1', 'assets/video/movie.mp4', 'MODULE 1', '10001'),
(10001, 'VIDEO 1', 'assets/video/movie.mp4', 'MODULE 1', '10001'),
(10001, '', '', 'MODULE 1', '10004'),
(10001, 'VIDEO 1', 'assets/video/movie.mp4', 'MODULE 1', '10004'),
(10002, '', '', 'Module 2', '10001'),
(10002, 'VIDEO 2', 'assets/video/movie.mp4', 'Module 2', '10001'),
(10003, '', '', 'hello', '10001'),
(10004, '', '', 'hello', '10001'),
(10005, '', '', 'hi', '10001');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
                            `COUNTER` int(11) NOT NULL,
                            `USER_ID` int(11) NOT NULL,
                            `USER_NAME` varchar(20) NOT NULL,
                            `LOGINTIME` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`COUNTER`, `USER_ID`, `USER_NAME`, `LOGINTIME`) VALUES
(125, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(126, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(127, 10001, 'john watson', '2020-08-28 18:30:00'),
(131, 10002, 'Molly Hooper', '2020-08-29 18:30:00'),
(132, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(133, 10001, 'john watson', '2020-08-28 18:30:00'),
(135, 10002, 'Molly Hooper', '2020-08-29 18:30:00'),
(136, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(137, 10001, 'john watson', '2020-08-28 18:30:00'),
(139, 10002, 'Molly Hooper', '2020-08-29 18:30:00'),
(140, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(141, 10001, 'john watson', '2020-08-28 18:30:00'),
(143, 10002, 'Molly Hooper', '2020-08-30 18:30:00'),
(144, 10002, 'Molly Hooper', '2020-08-30 18:30:00'),
(145, 10001, 'john watson', '2020-08-30 18:30:00'),
(146, 10002, 'Molly Hooper', '2020-08-30 18:30:00'),
(147, 10002, 'Molly Hooper', '2020-08-30 18:30:00'),
(148, 10002, 'Molly Hooper', '2020-08-30 18:30:00'),
(149, 10001, 'john watson', '2020-08-30 18:30:00'),
(150, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(151, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(152, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(159, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(160, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(161, 10001, 'john watson', '2020-08-31 18:30:00'),
(162, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(163, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(164, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(165, 10001, 'john watson', '2020-08-31 18:30:00'),
(166, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(167, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(168, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(169, 10001, 'john watson', '2020-08-31 18:30:00'),
(170, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(171, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(172, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(173, 10001, 'john watson', '2020-08-31 18:30:00'),
(174, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(175, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(176, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(177, 10001, 'john watson', '2020-08-31 18:30:00'),
(178, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(179, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(180, 10002, 'Molly Hooper', '2020-08-31 18:30:00'),
(181, 10001, 'john watson', '2020-08-30 18:30:00'),
(182, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(183, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(184, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(189, 10002, 'Molly Hooper', '2020-09-01 18:30:00'),
(190, 10002, 'Molly Hooper', '2020-09-01 18:30:00'),
(191, 10002, 'Molly Hooper', '2020-09-01 18:30:00'),
(192, 10001, 'john watson', '2020-09-01 18:30:00'),
(193, 10002, 'Molly Hooper', '2020-09-01 18:30:00'),
(194, 10002, 'Molly Hooper', '2020-09-01 18:30:00'),
(195, 10002, 'Molly Hooper', '2020-09-01 18:30:00'),
(201, 10001, 'john watson', '2020-08-28 18:30:00'),
(202, 10001, 'john watson', '2020-08-28 18:30:00'),
(203, 10001, 'john watson', '2020-08-28 18:30:00'),
(204, 10001, 'john watson', '2020-08-28 18:30:00'),
(205, 10001, 'john watson', '2020-08-28 18:30:00'),
(206, 10001, 'john watson', '2020-08-28 18:30:00'),
(207, 10001, 'john watson', '2020-08-28 18:30:00'),
(208, 10001, 'john watson', '2020-08-28 18:30:00'),
(209, 10001, 'john watson', '2020-08-28 18:30:00'),
(210, 10001, 'john watson', '2020-08-28 18:30:00'),
(211, 10003, 'Aditya Bhardwaj', '2020-08-28 18:30:00'),
(212, 10001, 'john watson', '2020-08-28 18:30:00'),
(213, 10001, 'john watson', '2020-08-28 18:30:00'),
(214, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(215, 10001, 'john watson', '2020-08-28 18:30:00'),
(216, 10001, 'john watson', '2020-08-28 18:30:00'),
(217, 10001, 'john watson', '2020-08-28 18:30:00'),
(218, 10002, 'Molly Hooper', '2020-08-28 18:30:00'),
(219, 10001, 'john watson', '2020-08-28 18:30:00'),
(220, 10001, 'john watson', '2020-08-30 18:30:00'),
(221, 10001, 'john watson', '2020-08-30 18:30:00'),
(222, 10001, 'john watson', '2020-08-30 18:30:00'),
(223, 10001, 'john watson', '2020-08-30 18:30:00'),
(224, 10001, 'john watson', '2020-08-30 18:30:00'),
(225, 10001, 'john watson', '2020-08-30 18:30:00'),
(226, 10001, 'john watson', '2020-08-31 18:30:00'),
(227, 10001, 'john watson', '2020-08-31 18:30:00'),
(228, 10001, 'john watson', '2020-08-31 18:30:00'),
(236, 10001, 'john watson', '2020-08-26 18:30:00'),
(238, 10001, 'john watson', '2020-08-31 18:30:00'),
(239, 10001, 'john watson', '2020-08-31 18:30:00'),
(240, 10001, 'john watson', '2020-08-31 18:30:00'),
(241, 10001, 'john watson', '2020-08-31 18:30:00'),
(242, 10001, 'john watson', '2020-08-31 18:30:00'),
(243, 10001, 'john watson', '2020-08-31 18:30:00'),
(244, 10001, 'john watson', '2020-08-31 18:30:00'),
(245, 10001, 'john watson', '2020-08-31 18:30:00'),
(246, 10001, 'john watson', '2020-08-31 18:30:00'),
(247, 10001, 'john watson', '2020-08-31 18:30:00'),
(248, 10001, 'john watson', '2020-08-31 18:30:00'),
(249, 10001, 'john watson', '2020-08-31 18:30:00'),
(250, 10001, 'john watson', '2020-08-31 18:30:00'),
(251, 10001, 'john watson', '2020-08-31 18:30:00'),
(252, 10001, 'john watson', '2020-08-31 18:30:00'),
(253, 10001, 'john watson', '2020-08-31 18:30:00'),
(254, 10001, 'john watson', '2020-08-31 18:30:00'),
(255, 10001, 'john watson', '2020-08-31 18:30:00'),
(256, 10001, 'john watson', '2020-08-31 18:30:00'),
(257, 10001, 'john watson', '2020-08-31 18:30:00'),
(258, 10001, 'john watson', '2020-09-01 18:30:00'),
(259, 10005, 'Aditya Bhardwaj', '2020-09-01 18:30:00'),
(260, 10001, 'john watson', '2020-09-01 18:30:00'),
(261, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(262, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(263, 10002, 'MOLLY HOOPER', '2020-09-01 18:30:00'),
(264, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(265, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(266, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(267, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(268, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(269, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(270, 10002, 'MOLLY HOOPER', '2020-09-01 18:30:00'),
(271, 10001, 'JOHN WATSON', '2020-09-01 18:30:00'),
(272, 10001, 'JOHN WATSON', '2020-09-02 18:30:00'),
(273, 10001, 'JOHN WATSON', '2020-09-02 18:30:00'),
(274, 10001, 'JOHN WATSON', '2020-09-02 18:30:00'),
(275, 10001, 'JOHN WATSON', '2020-09-02 18:30:00'),
(276, 10001, 'JOHN WATSON', '2020-09-03 18:30:00'),
(277, 10002, 'MOLLY HOOPER', '2020-09-03 18:30:00'),
(278, 10001, 'JOHN WATSON', '2020-09-03 18:30:00'),
(279, 10001, 'JOHN WATSON', '2020-09-03 18:30:00'),
(280, 10001, 'JOHN WATSON', '2020-09-03 18:30:00'),
(281, 2000, 'A. BHARDWAJ', '2020-09-03 18:30:00'),
(282, 2000, 'A. BHARDWAJ', '2020-09-03 18:30:00'),
(283, 2000, 'A. BHARDWAJ', '2020-09-03 18:30:00'),
(284, 2001, 'GAURAV SHARMA', '2020-09-03 18:30:00'),
(285, 2000, 'A. BHARDWAJ', '2020-09-03 18:30:00'),
(286, 2000, 'A. BHARDWAJ', '2020-09-03 18:30:00'),
(287, 2000, 'A. BHARDWAJ', '2020-09-05 18:30:00'),
(288, 2000, 'A. BHARDWAJ', '2020-09-05 18:30:00'),
(289, 20001, 'ASDAD ASAD', '2020-09-05 18:30:00'),
(290, 2000, 'ADITY BHARDWAJ', '2020-09-05 18:30:00'),
(291, 11001, 'PRANEVESH SHENOY', '2020-09-05 18:30:00'),
(292, 100, 'AAS ASAS', '2020-09-05 18:30:00'),
(293, 1000, 'ADITYA BHARDWAJ`', '2020-09-05 18:30:00'),
(294, 100, 'AAS ASAS', '2020-09-05 18:30:00'),
(295, 1000, 'ADITYA BHARDWAJ`', '2020-09-05 18:30:00'),
(296, 1, 'ADITYA BHARDWAJ', '2020-09-05 18:30:00'),
(297, 1, 'ADITYA BHARDWAJ', '2020-09-06 18:30:00'),
(298, 1, 'ADITYA BHARDWAJ', '2020-09-06 18:30:00'),
(299, 1, 'ADITYA BHARDWAJ', '2020-09-06 18:30:00'),
(300, 1, 'ADITYA BHARDWAJ', '2020-09-06 18:30:00'),
(301, 1, 'ADITYA BHARDWAJ', '2020-09-06 18:30:00'),
(302, 1, 'ADITYA BHARDWAJ', '2020-09-06 18:30:00'),
(303, 1, 'ADITYA BHARDWAJ', '2020-09-06 18:30:00'),
(304, 1, 'ADITYA BHARDWAJ', '2020-09-07 18:30:00'),
(305, 1, 'ADITYA BHARDWAJ', '2020-09-07 18:30:00'),
(306, 1, 'ADITYA BHARDWAJ', '2020-09-07 18:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
    ADD PRIMARY KEY (`USER_ID`),
    ADD UNIQUE KEY `Group_Name` (`Group_Name`),
    ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
    ADD PRIMARY KEY (`COURSE_ID`);

--
-- Indexes for table `COURSE_LOG`
--
ALTER TABLE `COURSE_LOG`
    ADD PRIMARY KEY (`COUNTER`);

--
-- Indexes for table `course_status`
--
ALTER TABLE `course_status`
    ADD PRIMARY KEY (`COURSE_ID`),
    ADD KEY `COURSE_ID` (`COURSE_ID`),
    ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `group_users`
--
ALTER TABLE `group_users`
    ADD PRIMARY KEY (`Group_ID`),
    ADD UNIQUE KEY `Group_Name` (`Group_Name`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
    ADD KEY `COURSE_ID` (`COURSE_ID`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
    ADD PRIMARY KEY (`COUNTER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `COURSE_LOG`
--
ALTER TABLE `COURSE_LOG`
    MODIFY `COUNTER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_users`
--
ALTER TABLE `group_users`
    MODIFY `Group_ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
    MODIFY `COUNTER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_status`
--
ALTER TABLE `course_status`
    ADD CONSTRAINT `course_status_ibfk_1` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`),
    ADD CONSTRAINT `course_status_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `account` (`USER_ID`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
    ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`);
