-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2021 at 05:03 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `path_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` varchar(15) NOT NULL,
  `password` char(32) DEFAULT NULL,
  `emailid` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `password`, `emailid`) VALUES
('ADM001', '25d55ad283aa400af464c76d713c07ad', 'admin1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8341ba2g9i26bel1qs4j5hx4wrxpfxju', 'e30:1mKHZA:rL4vDGcUfwcY9Ow-XEtcOSXgkL9gV0bUej0xrrcEfo4', '2021-09-12 09:57:28.045074'),
('lfka5s3bpqpjgbczk17q7n4wdrkqwqpl', 'eyJ1c2VyIjoiTjExOCJ9:1mjwhC:Zi5FR_nXEHD0irtnTwpu5XR5TaSmIBKEz0ip8Ipwuk8', '2021-11-22 04:55:50.926347');

-- --------------------------------------------------------

--
-- Table structure for table `lab_test`
--

CREATE TABLE `lab_test` (
  `ID` varchar(10) NOT NULL,
  `TestID` varchar(10) NOT NULL,
  `LabID` varchar(10) NOT NULL,
  `Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab_test`
--

INSERT INTO `lab_test` (`ID`, `TestID`, `LabID`, `Cost`) VALUES
('LT001', 'T001', 'L002', 200),
('LT002', 'T002', 'L003', 150),
('LT003', 'T003', 'L001', 250),
('LT004', 'T004', 'L005', 350),
('LT005', 'T005', 'L003', 300),
('LT006', 'T006', 'L002', 300),
('LT007', 'T007', 'L001', 200),
('LT008', 'T008', 'L001', 400),
('LT009', 'T009', 'L004', 100),
('LT010', 'T010', 'L005', 200);

-- --------------------------------------------------------

--
-- Table structure for table `pathologist`
--

CREATE TABLE `pathologist` (
  `ID` varchar(10) NOT NULL,
  `FName` varchar(15) NOT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `DOB` varchar(255) NOT NULL,
  `Age` varchar(11) DEFAULT NULL,
  `Gender` varchar(6) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(11) DEFAULT NULL,
  `phno` varchar(255) NOT NULL,
  `emailid` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `working` varchar(3) DEFAULT 'YES'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pathologist`
--

INSERT INTO `pathologist` (`ID`, `FName`, `Lname`, `DOB`, `Age`, `Gender`, `Address`, `zipcode`, `phno`, `emailid`, `password`, `working`) VALUES
('A001', 'Dewane', 'Bravo', '1986-12-12', '20', 'Male', 'CA', '111112', '7091317209', 'pathologist1@lab.com', '25d55ad283aa400af464c76d713c07ad', 'YES'),
('A002', 'Adam', 'Stive', '1991-12-15', '30', 'Male', '123, Street-A, California, USA', '154623', '789654123', 'pathologist2@lab.com', '25d55ad283aa400af464c76d713c07ad', 'YES');

--
-- Triggers `pathologist`
--
DELIMITER $$
CREATE TRIGGER `agent_ins` BEFORE INSERT ON `pathologist` FOR EACH ROW BEGIN
IF NEW.ID = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.emailid = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.password = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF (NEW.phno REGEXP '^(\+?[0-9]{1,4}-)?[0-9]{3,10}$' ) = 0 THEN
SIGNAL SQLSTATE '12345';
END IF;
IF NEW.emailid NOT LIKE '%_@%_.__%' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.Age > 50 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.Age < 18 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.DOB > NOW() THEN
SIGNAL SQLSTATE '45000';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `agent_upd` BEFORE UPDATE ON `pathologist` FOR EACH ROW BEGIN
IF NEW.ID = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.emailid = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.password = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF (NEW.phno REGEXP '^(\+?[0-9]{1,4}-)?[0-9]{3,10}$' ) = 0 THEN
SIGNAL SQLSTATE '12345';
END IF;
IF NEW.Age > 50 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.Age < 18 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.emailid NOT LIKE '%_@%_.__%' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.DOB > NOW() THEN
SIGNAL SQLSTATE '45000';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID` varchar(10) NOT NULL,
  `FName` varchar(15) NOT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(6) NOT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `phno` char(15) NOT NULL,
  `emailid` varchar(25) NOT NULL,
  `password` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `FName`, `Lname`, `DOB`, `Age`, `Gender`, `Address`, `zipcode`, `phno`, `emailid`, `password`) VALUES
('N118', 'John', 'Smith', '1996-06-28', 26, 'Male', 'Street ABC, London, ', 111111, '7896541230', 'patient1@lab.com', '25d55ad283aa400af464c76d713c07ad'),
('N119', 'Andrew', 'Marley', '1987-12-01', 29, 'male', 'ABC', 221006, '9835307221', 'patient2@lab.com', '25d55ad283aa400af464c76d713c07ad'),
('N120', 'Henry', 'Ford', '1987-12-01', 29, 'male', 'ASC', 221006, '9835307221', 'patient3@lab.com', '25d55ad283aa400af464c76d713c07ad'),
('N121', 'Jacub', 'Johnson', '1987-12-01', 29, 'male', 'ASED', 221006, '9835307221', 'patient4@lab.com', '25d55ad283aa400af464c76d713c07ad'),
('N122', 'Karlin', 'Smith', '1987-12-01', 29, 'female', 'SDE', 221006, '9835307221', 'patient5@lab.com', '25d55ad283aa400af464c76d713c07ad'),
('N123', 'Maria', 'Smith', '1987-12-01', 29, 'female', 'DDED', 221006, '9835307221', 'patient6@lab.com', '25d55ad283aa400af464c76d713c07ad');

--
-- Triggers `patient`
--
DELIMITER $$
CREATE TRIGGER `user_ins` BEFORE INSERT ON `patient` FOR EACH ROW BEGIN
IF NEW.ID = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.emailid = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.password = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF (NEW.phno REGEXP '^(\+?[0-9]{1,4}-)?[0-9]{3,10}$' ) = 0 THEN
SIGNAL SQLSTATE '12345';
END IF;
IF NEW.emailid NOT LIKE '%_@%_.__%' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.Age > 100 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.Age < 0 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.DOB > NOW() THEN
SIGNAL SQLSTATE '45000';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_upd` BEFORE UPDATE ON `patient` FOR EACH ROW BEGIN
IF NEW.ID = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.emailid = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.password = '' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF (NEW.phno REGEXP '^(\+?[0-9]{1,4}-)?[0-9]{3,10}$' ) = 0 THEN
SIGNAL SQLSTATE '12345';
END IF;
IF NEW.Age > 100 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.Age < 0 THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.emailid NOT LIKE '%_@%_.__%' THEN
SIGNAL SQLSTATE '45000';
END IF;
IF NEW.DOB > NOW() THEN
SIGNAL SQLSTATE '45000';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reg_tests`
--

CREATE TABLE `reg_tests` (
  `ID` int(11) NOT NULL,
  `LTID` varchar(10) NOT NULL,
  `UserID` varchar(10) NOT NULL,
  `PatientID` varchar(10) NOT NULL,
  `AgentID` varchar(10) NOT NULL,
  `RegDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `cost` int(11) NOT NULL,
  `paid` int(11) NOT NULL,
  `rep_gen` char(3) DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_tests`
--

INSERT INTO `reg_tests` (`ID`, `LTID`, `UserID`, `PatientID`, `AgentID`, `RegDate`, `DueDate`, `cost`, `paid`, `rep_gen`) VALUES
(7, 'LT001', 'N120', 'N120', 'A001', '2020-10-21', '2016-10-23', 150, 150, 'YES'),
(9, 'LT002', 'N119', 'N119', 'A001', '2020-10-21', '2016-10-23', 150, 0, 'YES'),
(10, 'LT005', 'N120', 'N120', 'A003', '2020-10-21', '2016-10-23', 300, 300, 'YES'),
(11, 'LT005', 'N121', 'N121', 'A003', '2020-10-21', '2016-10-23', 300, 50, 'NO'),
(12, 'LT005', 'N119', 'N119', 'A001', '2020-10-21', '2016-10-23', 300, 0, 'NO'),
(13, 'LT003', 'N119', 'N119', 'A003', '2020-10-21', '2016-10-23', 250, 0, 'NO'),
(14, 'LT010', 'N120', 'N120', 'A001', '2020-10-21', '2016-10-23', 200, 200, 'YES'),
(15, 'LT006', 'N122', 'N122', 'A003', '2020-10-21', '2016-10-24', 300, 0, 'NO'),
(16, 'LT009', 'N119', 'N119', 'A002', '2020-10-21', '2016-10-24', 100, 0, 'NO'),
(17, 'LT010', 'N119', 'N119', 'A001', '2020-10-22', '2016-10-26', 300, 0, 'NO'),
(18, 'LT005', 'N123', 'N123', 'A002', '2020-10-24', '2016-10-29', 300, 200, 'YES'),
(19, 'LT005', 'N122', 'N122', 'A001', '2020-12-08', '2016-12-13', 300, 0, 'NO'),
(20, 'LT004', 'N120', 'N120', 'A1022', '2021-08-12', '2016-08-16', 450, 0, 'NO'),
(21, 'LT010', 'N120', 'N120', 'A002', '2020-12-08', '2016-12-12', 300, 100, 'NO'),
(22, 'LT001', 'N118', 'N118', 'A001', '2021-09-01', '2021-09-02', 200, 0, 'NO'),
(23, 'LT001', 'N118', 'N118', 'A001', '2021-08-30', '2021-09-03', 200, 0, 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `ID` varchar(10) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`ID`, `Type`, `Name`) VALUES
('T001', 'Diabetes', 'Glucose'),
('T002', 'Diabetes', 'Fructosamine'),
('T003', 'Allergy', 'Allergy Screen'),
('T004', 'Allergy', 'Home Dust'),
('T005', 'Drugs', 'Cocaine'),
('T006', 'Drugs', 'Nicotene'),
('T007', 'Viral', 'Dengue'),
('T008', 'Viral', 'Rubella'),
('T009', 'Poison', 'Arsenic'),
('T010', 'Poison', 'Osmolal Gap');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `emailid` (`emailid`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `lab_test`
--
ALTER TABLE `lab_test`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pathologist`
--
ALTER TABLE `pathologist`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `emailid` (`emailid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `emailid` (`emailid`);

--
-- Indexes for table `reg_tests`
--
ALTER TABLE `reg_tests`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_USERID` (`UserID`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reg_tests`
--
ALTER TABLE `reg_tests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `lab_test`
--
ALTER TABLE `lab_test`
  ADD CONSTRAINT `fk_lab` FOREIGN KEY (`LabID`) REFERENCES `labs` (`ID`),
  ADD CONSTRAINT `fk_test` FOREIGN KEY (`TestID`) REFERENCES `tests` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
