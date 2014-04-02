-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2014 at 12:09 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `online_classroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `fcomment`
--

CREATE TABLE IF NOT EXISTS `fcomment` (
  `fcommentID` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `commentDate` date NOT NULL,
  `fpostID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`fcommentID`),
  KEY `fcommentFK` (`userID`),
  KEY `fcommentFK2` (`fpostID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `fcomment`
--

INSERT INTO `fcomment` (`fcommentID`, `content`, `commentDate`, `fpostID`, `userID`) VALUES
(1, 'lalalalala', '2014-03-28', 1, 1),
(2, 'helloooooo', '2014-03-28', 1, 1),
(6, 'yow', '2014-03-28', 1, 1),
(7, 'yo', '2014-03-28', 3, 1),
(8, 'mehehehe', '2014-03-28', 3, 1),
(9, 'lalalalala', '2014-03-28', 4, 1),
(10, 'hey', '2014-03-29', 5, 1),
(11, 'hjjhg', '2014-03-29', 5, 1),
(12, 'Mehehe', '2014-03-29', 1, 1),
(13, 'Wahaha', '2014-03-29', 1, 1),
(14, 'looool', '2014-03-29', 10, 1),
(15, 'lalalalala', '2014-03-29', 1, 1),
(16, 'lalalalala', '2014-03-29', 1, 1),
(17, 'Yaaaay', '2014-03-30', 15, 0),
(18, 'hi', '2014-04-01', 26, 0),
(19, 'You Google', '2014-04-01', 17, 0),
(20, 'bye', '2014-04-02', 42, 1),
(21, 'answer', '2014-04-02', 43, 1),
(22, 'yow', '2014-04-02', 44, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fpost`
--

CREATE TABLE IF NOT EXISTS `fpost` (
  `fpostID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `commentCount` int(11) NOT NULL,
  `postDate` date NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`fpostID`),
  KEY `fpostFK` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `fpost`
--

INSERT INTO `fpost` (`fpostID`, `title`, `content`, `commentCount`, `postDate`, `userID`) VALUES
(1, 'title1', 'question question question question', 7, '2014-03-28', 1),
(2, 'title2', 'question question question question', 0, '2014-03-28', 1),
(3, 'What should I do?', 'CS is hard', 2, '2014-03-28', 1),
(4, 'Title title title title', 'content content content content', 0, '2014-03-28', 1),
(5, 'Whyyyyy?', ':(', 0, '2014-03-29', 1),
(6, 'Whyyyyy?', ':(', 0, '2014-03-29', 1),
(7, 'Whyyyyy?', ':(', 0, '2014-03-29', 1),
(8, 'What am I doing?', 'I don''t knkow what I''m doing.', 0, '2014-03-29', 1),
(9, 'This is a question', 'These are question details', 0, '2014-03-29', 1),
(10, 'Why am I in CS?', 'ahahahahaha :((', 0, '2014-03-29', 1),
(11, 'This is a question', 'This is a detail about a question', 0, '2014-03-29', 1),
(12, 'This is a question', 'This is a detail about a question', 0, '2014-03-29', 1),
(13, 'This is a question', 'This is a detail', 0, '2014-03-29', 1),
(14, 'Hellooooo', 'lalalalalala', 0, '2014-03-30', 0),
(15, 'What to do?', 'Yeah, what to do', 1, '2014-03-30', 0),
(16, 'How do I set text alignment in HTML? I need help, badly.', 'I have a text, and I want to set it''s alignment to right. How do I do it?', 0, '2014-04-01', 0),
(17, 'How do I set text alignment in HTML? I need help, badly.', 'I have a text, and I want to set it''s alignment to right. How do I do it?', 1, '2014-04-01', 0),
(18, 'hi', 'lololol', 0, '2014-04-01', 0),
(19, 'testing', 'wew', 0, '2014-04-01', 0),
(20, 'agsdas', 'wewewew', 0, '2014-04-01', 0),
(21, 'such wow', 'testing', 0, '2014-04-01', 0),
(22, 'What''', 'hitag', 0, '2014-04-01', 0),
(23, '''', 'ha', 0, '2014-04-01', 0),
(24, '\\''', 'ha', 0, '2014-04-01', 0),
(25, 'what\\'' what', 'what', 0, '2014-04-01', 0),
(26, 'what''s life?', 'uesfsf', 1, '2014-04-01', 0),
(27, 'what what', 'testing'' po', 0, '2014-04-01', 0),
(28, 'what what', 'testing'' po', 0, '2014-04-01', 0),
(29, 'what what', '''', 0, '2014-04-01', 0),
(30, 'testing\\''lalala', 'lskjdkfjnaeorng;aosdfna', 0, '2014-04-01', 0),
(31, 'lalalala\\''', 'LLALALA', 0, '2014-04-01', 0),
(32, 'lalalal''', 'LLALALA', 0, '2014-04-01', 0),
(33, 'lalalal''', 'LLALALA', 0, '2014-04-01', 0),
(34, 'lalalal''a', 'LLALALA', 0, '2014-04-01', 0),
(35, 'lalalal\\''a', 'LLALALA', 0, '2014-04-01', 0),
(36, 'lalala\\''', 'yow', 0, '2014-04-01', 0),
(37, 'lalala\\''j', 'yow', 0, '2014-04-01', 0),
(38, 'lalala\\''', 'yow', 0, '2014-04-01', 0),
(39, 'lalala\\\\''', 'yow', 0, '2014-04-01', 0),
(40, 'lalala\\\\', 'yow', 0, '2014-04-01', 0),
(41, 'lalala\\', 'yow', 0, '2014-04-01', 0),
(42, 'question', 'hi', 1, '2014-04-02', 1),
(43, 'yow', 'a;sldkjff', 1, '2014-04-02', 3),
(44, 'hellooooooo', 'do you wanna build a snowman', 1, '2014-04-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fpostag`
--

CREATE TABLE IF NOT EXISTS `fpostag` (
  `fpostagID` int(11) NOT NULL AUTO_INCREMENT,
  `fpostID` int(11) NOT NULL,
  `ftagID` int(11) NOT NULL,
  PRIMARY KEY (`fpostagID`),
  KEY `fpostagFK` (`fpostID`),
  KEY `fpostagFK2` (`ftagID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `fpostag`
--

INSERT INTO `fpostag` (`fpostagID`, `fpostID`, `ftagID`) VALUES
(1, 13, 1),
(2, 13, 2),
(3, 13, 3),
(4, 14, 4),
(5, 15, 5),
(6, 15, 6),
(7, 18, 4),
(8, 19, 7),
(9, 20, 8),
(10, 21, 9),
(11, 21, 10),
(12, 21, 11),
(13, 21, 12),
(14, 23, 13),
(15, 34, 7),
(16, 42, 7),
(17, 43, 14),
(18, 44, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ftag`
--

CREATE TABLE IF NOT EXISTS `ftag` (
  `ftagID` int(11) NOT NULL AUTO_INCREMENT,
  `tag` text NOT NULL,
  PRIMARY KEY (`ftagID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ftag`
--

INSERT INTO `ftag` (`ftagID`, `tag`) VALUES
(1, 'lalalalala'),
(2, 'hello world'),
(3, 'CS11'),
(4, ''),
(5, 'what-am-I-doing'),
(6, 'bored'),
(7, 'tag'),
(8, 'this-is-a-tag'),
(9, 'this-is-a-test'),
(10, 'wew-hi'),
(11, 'what'),
(12, 'wow'),
(13, 'he'),
(14, 'asl;jgdf'),
(15, 'frozen');

-- --------------------------------------------------------

--
-- Table structure for table `matfile`
--

CREATE TABLE IF NOT EXISTS `matfile` (
  `matFileID` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) NOT NULL,
  `fileType` varchar(10) NOT NULL,
  `fileSize` bigint(20) NOT NULL,
  `uploadDate` date NOT NULL,
  `path` varchar(200) NOT NULL,
  `matSubjectID` int(11) NOT NULL,
  `matFolderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`matFileID`),
  KEY `matfileFK2` (`matSubjectID`),
  KEY `matfileFK` (`matFolderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `matfile`
--

INSERT INTO `matfile` (`matFileID`, `fileName`, `fileType`, `fileSize`, `uploadDate`, `path`, `matSubjectID`, `matFolderID`, `userID`) VALUES
(24, 'CS 130 - Lesson 1.pdf', 'pdf', 474982, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 1),
(25, 'CS 130 - Lesson 2.pdf', 'pdf', 273616, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 1),
(26, 'CS 130 - Lesson 3.pdf', 'pdf', 431795, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(27, 'CS 130 - Lesson 4.pdf', 'pdf', 236032, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(28, 'CS 130 - Lesson 5.pdf', 'pdf', 333960, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(29, 'CS 130 - Lesson 6.pdf', 'pdf', 162288, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(30, 'CS 130 - Lesson 7.pdf', 'pdf', 440491, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(31, 'CS 130 - Lesson 8.pdf', 'pdf', 610494, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(32, 'CS 130 - Lesson 9.pdf', 'pdf', 655607, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(33, 'CS 130 - Lesson 10.pdf', 'pdf', 647676, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 1),
(34, 'CS 130 - Long Exam 1 - Answer Key.pdf', 'pdf', 127894, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 0),
(35, 'CS 130 - Long Exam 2 - Answer Key.pdf', 'pdf', 146305, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 0),
(36, 'CS 130 - Long Exam 3 - Answer Key.pdf', 'pdf', 126077, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 0),
(37, 'CS 130 - Simultaneous ODEs - Exercises.pdf', 'pdf', 82659, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 0),
(38, 'CS 130 - Problem Set 2.pdf', 'pdf', 160734, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 0),
(39, 'CS 130 - Fourier Series - Exercises.pdf', 'pdf', 82168, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 0),
(40, 'CS 130 - First Order ODE - Exercises - Part 2.pdf', 'pdf', 70965, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 0),
(41, 'CS 130 - Linear Algebra Examples.pdf', 'pdf', 159015, '2014-03-15', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 0),
(42, '00 Introduction.pdf', 'pdf', 78087, '2014-03-20', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 1),
(43, '01 Introduction to Computer Programming.pdf', 'pdf', 516561, '2014-03-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 1),
(44, '02 Introduction to Java.pdf', 'pdf', 147976, '2014-03-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 1),
(45, '00 Introduction.pdf', 'pdf', 78087, '2014-03-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 1),
(46, '01 Introduction to Computer Programming.pdf', 'pdf', 516561, '2014-03-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 1),
(47, '02 Introduction to Java.pdf', 'pdf', 147976, '2014-03-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 1),
(48, '02 Introduction to Java.pdf', 'pdf', 147976, '2014-03-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 1),
(49, '04 Programming Fundamentals.pdf', 'pdf', 538647, '2014-03-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 1),
(50, '03 Getting to know your Programming Environment.pdf', 'pdf', 246046, '2014-03-22', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 1),
(51, '06 Control Structures.pdf', 'pdf', 251477, '2014-03-22', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 1),
(52, '11 Inheritance Polymorphism Interface.pdf', 'pdf', 195688, '2014-03-22', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 1),
(53, '20140203 CS 130 - Problem Set 2.pdf', 'pdf', 161562, '2014-03-28', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(54, 'CS 130 - First Order ODE - Exercises - Part 1.pdf', 'pdf', 94974, '2014-03-28', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 0),
(55, 'CS11Lab-1 (handout).pdf', 'pdf', 405013, '2014-03-29', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Samplex\\', 1, 2, 0),
(56, 'CS 11 Machine Problem.pdf', 'pdf', 292459, '2014-03-29', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 0),
(57, 'MIT6_087IAP10_lec05.pdf', 'pdf', 305477, '2014-03-29', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 0),
(58, 'ME7.docx', 'docx', 14826, '2014-03-29', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 0),
(59, '20131210 CS 130 - Problem Set 1.pdf', 'pdf', 141541, '2014-03-29', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 0),
(60, 'Chapter_2_V6.3.ppt', '3', 3262464, '2014-04-01', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 145\\Slides\\', 14, 1, 0),
(61, 'Chapter_3_V6.01.pdf', '01', 1999441, '2014-04-01', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 145\\Slides\\', 14, 1, 0),
(62, 'Exam 1 Reviewer.pdf', 'pdf', 27513, '2014-04-01', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 145\\Samplex\\', 14, 2, 0),
(63, 'CS 145 Syllabus.pdf', 'pdf', 53077, '2014-04-01', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 145\\Miscellaneous\\', 14, 3, 0),
(64, 'ComputerProgramDevelopment.pdf', 'pdf', 1266063, '2014-04-02', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Miscellaneous\\', 1, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `matfolder`
--

CREATE TABLE IF NOT EXISTS `matfolder` (
  `matFolderID` int(11) NOT NULL AUTO_INCREMENT,
  `folderName` varchar(20) NOT NULL,
  PRIMARY KEY (`matFolderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `matfolder`
--

INSERT INTO `matfolder` (`matFolderID`, `folderName`) VALUES
(1, 'Slides'),
(2, 'Samplex'),
(3, 'Miscellaneous');

-- --------------------------------------------------------

--
-- Table structure for table `matsubject`
--

CREATE TABLE IF NOT EXISTS `matsubject` (
  `matSubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(30) NOT NULL,
  `subjectDesc` varchar(100) NOT NULL,
  PRIMARY KEY (`matSubjectID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `matsubject`
--

INSERT INTO `matsubject` (`matSubjectID`, `subjectName`, `subjectDesc`) VALUES
(1, 'CS 11', 'Computer Programming I'),
(2, 'CS 12', 'Computer Programming II'),
(3, 'CS 21', 'Computer Organization & Assembly Language Programming'),
(4, 'CS 30', 'Discrete Mathematics for Computer Science'),
(5, 'CS 32', 'Data Structures'),
(6, 'CS 120', 'Internet Technologies'),
(7, 'CS 130', 'Mathematical Methods In Computer Science'),
(8, 'CS 131', 'Numerical Methods'),
(9, 'CS 133', 'Automata Theory & Computability'),
(10, 'CS 134', 'Computational Complexity'),
(11, 'CS 135', 'Algorithm Design & Analysis'),
(12, 'CS 137', 'Computer Algebra'),
(13, 'CS 140', 'Operating Systems'),
(14, 'CS 145', 'Computer Networks'),
(15, 'CS 150', 'Programming Languages'),
(16, 'CS 153', 'Introduction to Computer Security'),
(17, 'CS 155', 'Compiler Construction	'),
(18, 'CS 160', 'File Processing'),
(19, 'CS 165', 'Database Systems'),
(20, 'CS 171', 'Topics in Theoretical Computer Science'),
(21, 'CS 172', 'Topics in Net-Centric Computing'),
(22, 'CS 173', 'Topics in Software Technology'),
(23, 'CS 174', 'Topics in Computer Systems'),
(24, 'CS 175', 'Topics In Computational Science'),
(25, 'CS 176', 'Topics in Intelligent Systems'),
(26, 'CS 180', 'Artificial Intelligence'),
(27, 'CS 191', 'Software Engineering I'),
(28, 'CS 192', 'Software Engineering'),
(29, 'CS 194', 'Undergraduate Research Seminar'),
(30, 'CS 195', 'Practicum'),
(31, 'CS 196', 'Seminar on Ethical Professional Issues in Computing'),
(32, 'CS 197', 'Special Topics'),
(33, 'CS 198', 'Special Problems I'),
(34, 'CS 199', 'Special Problems II');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `lastName`, `firstName`, `email`) VALUES
(0, 'kgdlorenzo', 'Lorenzo', 'Kat', 'kgdlorenzo@gmail.com'),
(1, 'lapacumio', 'Pacumio', 'Lara Eunice', 'lara.pacumio@gmail.com'),
(2, 'noctavo', 'Octavo', 'Nikka', 'niksoctavo@gmail.com'),
(3, 'agcodera', 'Codera', 'Ginette', 'ginettecodera@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fcomment`
--
ALTER TABLE `fcomment`
  ADD CONSTRAINT `fcommentFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `fcommentFK2` FOREIGN KEY (`fpostID`) REFERENCES `fpost` (`fpostID`);

--
-- Constraints for table `fpost`
--
ALTER TABLE `fpost`
  ADD CONSTRAINT `fpostFK` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `fpostag`
--
ALTER TABLE `fpostag`
  ADD CONSTRAINT `fpostagFK` FOREIGN KEY (`fpostID`) REFERENCES `fpost` (`fpostID`),
  ADD CONSTRAINT `fpostagFK2` FOREIGN KEY (`ftagID`) REFERENCES `ftag` (`ftagID`);

--
-- Constraints for table `matfile`
--
ALTER TABLE `matfile`
  ADD CONSTRAINT `matfileFK` FOREIGN KEY (`matFolderID`) REFERENCES `matfolder` (`matFolderID`),
  ADD CONSTRAINT `matfileFK2` FOREIGN KEY (`matSubjectID`) REFERENCES `matsubject` (`matSubjectID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
