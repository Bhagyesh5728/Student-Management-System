-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2023 at 12:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sssdiit`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStud` (IN `name` VARCHAR(100), IN `email` TEXT, IN `stream` VARCHAR(10), IN `role` VARCHAR(10), IN `sem` VARCHAR(5), IN `class` VARCHAR(5), IN `rollnumber` VARCHAR(5), IN `address` VARCHAR(50), IN `fee` VARCHAR(10), IN `mobile` BIGINT(10), IN `photo` TEXT)   begin

insert into member(name,mobile,email,role,cource,sem,class,rollno,address,photo,fees) values(name,mobile,email,role,stream,sem,class,rollnumber,address,photo,fee);


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `mobile` BIGINT(10), IN `pass` TEXT)   begin
INSERT into login(mobile,pass) values(mobile,pass);
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('Bhagyesh', '5728');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) NOT NULL,
  `datee` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL COMMENT '1 = Present and 0 =Absent',
  `rollno` varchar(5) DEFAULT NULL,
  `cource` varchar(20) DEFAULT NULL,
  `sem` varchar(5) DEFAULT NULL,
  `class` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `datee`, `status`, `rollno`, `cource`, `sem`, `class`) VALUES
(16, '2023-09-07', '1', '45', '', '', ''),
(17, '2023-09-07', '1', '96', '', '', ''),
(20, '2023-09-07', '1', '78', 'BSCIT', '1', 'C'),
(21, '2023-09-07', '1', '45', 'BCA', '1', 'A'),
(22, '2023-09-07', '1', '46', 'BCA', '1', 'A'),
(23, '2023-09-07', '0 ', '96', 'BCA', '1', 'A'),
(24, '2023-09-08', '1', '78', 'BSCIT', '1', 'C'),
(25, '2023-09-08', '0 ', '46', 'BCA', '1', 'A'),
(26, '2023-09-08', '0 ', '45', 'BCA', '1', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_id` text DEFAULT NULL,
  `book_name` varchar(40) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_id`, `book_name`, `stock`) VALUES
(10, 'kjadfk', 'kvk', 5),
(11, 'AS', 'KJ', 2),
(12, 'JAVA#Jbk', 'JAVA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `id` int(11) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `book_id` varchar(10) DEFAULT NULL,
  `book_name` varchar(20) DEFAULT NULL,
  `taken_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`id`, `mobile`, `book_id`, `book_name`, `taken_date`, `return_date`) VALUES
(8, 9409101759, 'JAVS#555', 'JAVA', '2023-09-04', '2023-09-04'),
(9, 9687557344, 'JAVA#Jbk', 'JAVA', '2023-09-06', '2023-09-13'),
(10, 9727216416, 'AS', 'KJ', '2023-08-30', '2023-09-06'),
(11, 9409101759, 'kjadfk', 'kvk', '2023-09-06', '2023-09-13'),
(12, 9409101759, 'AS', 'KJ', '2023-09-06', '2023-09-05'),
(13, 9727216416, 'JAVA#Jbk', 'JAVA', '2023-09-20', '2023-09-07');

--
-- Triggers `library`
--
DELIMITER $$
CREATE TRIGGER `updateStock` AFTER INSERT ON `library` FOR EACH ROW begin
UPDATE books set stock=(SELECT stock from books where book_name=NEW.book_name)-1 where book_name=NEW.book_name;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `pass` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `mobile`, `pass`) VALUES
(21, 9409101759, '5728'),
(22, 9687557344, '123456'),
(23, 9727216416, '5728');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `name` varchar(50) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `email` text NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  `cource` varchar(10) DEFAULT NULL,
  `sem` varchar(11) DEFAULT NULL,
  `class` varchar(5) DEFAULT NULL,
  `rollno` varchar(5) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `photo` text DEFAULT 'gurukul.png',
  `fees` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`name`, `mobile`, `email`, `role`, `cource`, `sem`, `class`, `rollno`, `address`, `photo`, `fees`) VALUES
('keval lk ksn', 7894561230, 'kevl@gmail.com', 'student', 'BCA', '1', 'A', '96', 'JND', 'gurukul.png', '0'),
('Bhagyesh M Morvadiya', 9409101759, 'bhayesh@gmail.com', 'student', 'BCA', '1', 'A', '46', 'Junagadh', 'Bhagyesh.png', '0'),
('Raj M Malhotra', 9687557344, 'raj@gmail.com', 'student', 'BCA', '1', 'A', '45', 'jungad', 'gurukul.png', '12500'),
('Mohan m Kkb', 9727216416, 'mohan@gmail.com', 'teacher', 'BSCIT', '2', 'A', '78', 'Junagadh', 'gurukul.png', '0');

--
-- Triggers `member`
--
DELIMITER $$
CREATE TRIGGER `addResult` AFTER INSERT ON `member` FOR EACH ROW BEGIN
INSERT into result(mobile) values(NEW.mobile);   
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(20) NOT NULL,
  `message` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `message`) VALUES
(6, 'fjwefweHello'),
(7, 'hdsfvdsfds');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(2) NOT NULL,
  `mobile` bigint(10) DEFAULT NULL,
  `c_language` int(3) DEFAULT NULL,
  `networking` int(3) DEFAULT NULL,
  `computer_fundamental` int(3) DEFAULT NULL,
  `english` int(3) DEFAULT NULL,
  `data_structure` int(3) DEFAULT NULL,
  `php` int(3) DEFAULT NULL,
  `maths` int(3) DEFAULT NULL,
  `coa` int(3) DEFAULT NULL,
  `wordpress` int(3) DEFAULT NULL,
  `oracle` int(3) DEFAULT NULL,
  `oop_c` int(3) DEFAULT NULL,
  `seo` int(3) DEFAULT NULL,
  `java` int(3) DEFAULT NULL,
  `csharp` int(3) DEFAULT NULL,
  `sad_se` int(3) DEFAULT NULL,
  `linux` int(3) DEFAULT NULL,
  `asp` int(3) DEFAULT NULL,
  `jsp` int(3) DEFAULT NULL,
  `python` int(30) DEFAULT NULL,
  `android` int(3) DEFAULT NULL,
  `djengo` int(3) DEFAULT NULL,
  `data_werehouse` int(3) DEFAULT NULL,
  `exam_title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `mobile`, `c_language`, `networking`, `computer_fundamental`, `english`, `data_structure`, `php`, `maths`, `coa`, `wordpress`, `oracle`, `oop_c`, `seo`, `java`, `csharp`, `sad_se`, `linux`, `asp`, `jsp`, `python`, `android`, `djengo`, `data_werehouse`, `exam_title`) VALUES
(12, 9409101759, 50, 99, 56, 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MidTerm'),
(13, 9687557344, 78, 87, 95, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MidTerm'),
(14, 9727216416, NULL, NULL, NULL, NULL, 10, 0, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MidTerm'),
(16, 7894561230, 0, 0, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MidTerm');

-- --------------------------------------------------------

--
-- Table structure for table `sticky_note`
--

CREATE TABLE `sticky_note` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `mobile` bigint(10) DEFAULT NULL,
  `date` text DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sticky_note`
--

INSERT INTO `sticky_note` (`id`, `title`, `description`, `mobile`, `date`) VALUES
(16, 'Hh', 'jvsv,sdkjgbsdkjfd', 9727216416, '2023-09-04 01:24:23'),
(17, 'Hh', 'jvsv,sdkjgbsdkjfd', 9727216416, '2023-09-04 02:19:29'),
(20, 'Java Framwork', 'Spring Boot.\r\nHibernet\r\nStruct', 9409101759, '2023-09-04 18:36:54'),
(21, 'ASP', 'ASP.NET\r\nC#.NET\r\nVB.NET', 9409101759, '2023-09-04 21:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(4) NOT NULL,
  `cource` varchar(5) DEFAULT NULL,
  `sem` int(2) DEFAULT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  `subject_code` text DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `cource`, `sem`, `subject_name`, `subject_code`, `link`) VALUES
(1, 'BCA', 1, 'C Language', 'CHDJS#JH', NULL),
(2, 'BCA', 1, 'HTML & CSS', 'HVCS#GFYSA', NULL),
(3, 'BSCIT', 2, 'C++', 'DSW#F', 'Resume.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `todo_list`
--

CREATE TABLE `todo_list` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `mobile` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `todo_list`
--

INSERT INTO `todo_list` (`id`, `name`, `date`, `start_time`, `end_time`, `status`, `mobile`) VALUES
(20, 'Do Assignment', '2023-09-03', '20:16', '23:18', 'Complete..', 9409101759),
(22, 'JAyg', '2023-09-06', '23:02', '20:02', 'Complete..', 9409101759);

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `id` int(3) NOT NULL,
  `subject_name` varchar(20) DEFAULT NULL,
  `work_detail` text DEFAULT NULL,
  `submit_date` date DEFAULT NULL,
  `cource` varchar(20) DEFAULT NULL,
  `sem` varchar(5) DEFAULT NULL,
  `class` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`id`, `subject_name`, `work_detail`, `submit_date`, `cource`, `sem`, `class`) VALUES
(4, 'Python', 'pdfAttachment-clm8wpb610zxero64xpt2fxvf.pdf', '2023-09-09', 'BCA', '1', 'A'),
(5, 'Java', 'Resume (3).pdf', '2023-09-08', 'BSCIT', '2', 'A'),
(6, 'j', 'pdfAttachment-clm8wpb610zxero64xpt2fxvf.pdf', '2023-09-20', 'BCA', '2', 'B'),
(7, 'j', 'pdfAttachment-clm8wpb610zxero64xpt2fxvf.pdf', '2023-09-20', 'BCA', '2', 'B'),
(8, 'jb', 'pdfAttachment-clm8wpb610zxero64xpt2fxvf.pdf', '2023-09-07', 'BSCIT', '2', 'B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mobile`),
  ADD UNIQUE KEY `rollno` (`rollno`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `sticky_note`
--
ALTER TABLE `sticky_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo_list`
--
ALTER TABLE `todo_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sticky_note`
--
ALTER TABLE `sticky_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `todo_list`
--
ALTER TABLE `todo_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`mobile`) REFERENCES `member` (`mobile`) ON DELETE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`mobile`) REFERENCES `member` (`mobile`) ON DELETE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`mobile`) REFERENCES `member` (`mobile`) ON DELETE CASCADE;

--
-- Constraints for table `sticky_note`
--
ALTER TABLE `sticky_note`
  ADD CONSTRAINT `sticky_note_ibfk_1` FOREIGN KEY (`mobile`) REFERENCES `member` (`mobile`) ON DELETE CASCADE;

--
-- Constraints for table `todo_list`
--
ALTER TABLE `todo_list`
  ADD CONSTRAINT `todo_list_ibfk_1` FOREIGN KEY (`mobile`) REFERENCES `member` (`mobile`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
