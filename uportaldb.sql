-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2014 at 11:28 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uportaldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminrequests`
--

CREATE TABLE IF NOT EXISTS `adminrequests` (
  `userid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  KEY `fk_re_userid` (`userid`),
  KEY `fk_re_typeid` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` varchar(6) NOT NULL,
  `category_name` varchar(140) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
('AAS', 'Administration and Support'),
('AC', 'Asian Center'),
('AIT', 'Asian Institute of Tourism'),
('ARKI', 'College of Architecture'),
('ASP', 'Archaeolohgical Studies Program'),
('CAL', 'College of Arts and Letters'),
('CBA', 'College of Business Administration/ Cesar E.A. Virata School of Business'),
('CFA', 'College of Fine Arts'),
('CHE', 'College of Home Economics'),
('CHK', 'College of Human Kinetics'),
('CMC', 'College of Mass Communication'),
('COM', 'Community Services'),
('CS', 'College of Science'),
('CSSP', 'College of Social Sciences and Philosophy'),
('CSWCD', 'College of Social Work and Community Development'),
('DEPP', 'UP Diliman Extension Program in Pampanga'),
('DRM', 'Dormitories'),
('EDUC', 'College of Education'),
('ENGG', 'College of Engineering'),
('FSH', 'Faculty and Staff Housing'),
('IIS', 'Institute of Islamic Studies'),
('ISSI', 'Institute of Small Scale Industries'),
('JPS', 'Jeepney Stops'),
('LAW', 'College of Law'),
('LIB', 'Libraries'),
('MUS', 'College of Music'),
('NCPAG', 'National College of Public Administration and Governance'),
('NONE', 'None'),
('RGF', 'Resource Generation Facilities'),
('RST', 'Restaurants'),
('SE', 'School of Economics'),
('SLIS', 'School of Library and Information Studies'),
('SLR', 'School of Labor and Industrial Relations'),
('SS', 'School of Statistics'),
('STP', 'Science and Technology Park'),
('SURP', 'School of Urban and Regional Planning'),
('TMC', 'Technology Management Center'),
('UTH', 'UP Theater Complex');

-- --------------------------------------------------------

--
-- Table structure for table `chatconvo`
--

CREATE TABLE IF NOT EXISTS `chatconvo` (
  `chatConvoID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  PRIMARY KEY (`chatConvoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `chatconvo`
--

INSERT INTO `chatconvo` (`chatConvoID`, `title`) VALUES
(29, 'Testing'),
(30, 'Chatting myseeeeelf'),
(31, 'forealz'),
(32, 'hiiiiiiii'),
(33, 'Random chat'),
(34, 'Hi Hi'),
(35, ' '),
(36, ''),
(37, '  '),
(38, 'Let''s chat some more'),
(39, 'NoSQL'),
(40, 'CS145 MP'),
(41, 'Hi Kat!');

-- --------------------------------------------------------

--
-- Table structure for table `chatmember`
--

CREATE TABLE IF NOT EXISTS `chatmember` (
  `chatMemberID` int(11) NOT NULL AUTO_INCREMENT,
  `chatConvoID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`chatMemberID`),
  KEY `chatmemberFK` (`chatConvoID`),
  KEY `chatmemberFK2` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `chatmember`
--

INSERT INTO `chatmember` (`chatMemberID`, `chatConvoID`, `userID`) VALUES
(59, 29, 1),
(61, 30, 5),
(62, 31, 1),
(64, 32, 1),
(66, 33, 8),
(67, 33, 5),
(68, 34, 7),
(69, 34, 6),
(70, 34, 8),
(71, 34, 5),
(72, 35, 6),
(73, 35, 5),
(74, 35, 9),
(75, 35, 7),
(76, 33, 6),
(77, 38, 6),
(78, 38, 5),
(79, 34, 1),
(80, 38, 7),
(81, 39, 5),
(82, 39, 7),
(83, 39, 6),
(84, 39, 8),
(85, 40, 8),
(86, 40, 7),
(87, 39, 1),
(88, 40, 5),
(89, 40, 6),
(90, 41, 6);

-- --------------------------------------------------------

--
-- Table structure for table `chatmessage`
--

CREATE TABLE IF NOT EXISTS `chatmessage` (
  `chatMessageID` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `messageDate` date NOT NULL,
  `userID` int(11) NOT NULL,
  `chatConvoID` int(11) NOT NULL,
  PRIMARY KEY (`chatMessageID`),
  KEY `chatmessageFK` (`userID`),
  KEY `chatmessageFK2` (`chatConvoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=150 ;

--
-- Dumping data for table `chatmessage`
--

INSERT INTO `chatmessage` (`chatMessageID`, `message`, `messageDate`, `userID`, `chatConvoID`) VALUES
(46, 'hi', '2014-04-10', 5, 29),
(47, 'hi', '2014-04-10', 5, 31),
(48, 'hey', '2014-04-11', 5, 30),
(49, 'I', '2014-04-11', 5, 30),
(50, 'am', '2014-04-11', 5, 30),
(51, 'talking', '2014-04-11', 5, 30),
(52, 'to', '2014-04-11', 5, 30),
(53, 'myself', '2014-04-11', 5, 30),
(54, 'that', '2014-04-11', 5, 30),
(55, 'is', '2014-04-11', 5, 30),
(56, 'sad', '2014-04-11', 5, 30),
(57, 'haha', '2014-04-11', 5, 30),
(58, 'haha', '2014-04-11', 5, 30),
(59, 'haha', '2014-04-11', 5, 30),
(60, 'haha', '2014-04-11', 5, 30),
(61, 'hellooooo', '2014-04-11', 5, 30),
(62, 'hiiiiiii', '2014-04-11', 5, 30),
(63, 'nice talking to you', '2014-04-11', 5, 30),
(64, 'weeeeeeeeeeee', '2014-04-11', 5, 30),
(65, 'yo', '2014-04-11', 5, 30),
(66, 'hellooooooooo', '2014-04-11', 5, 33),
(67, 'Hello', '2014-04-11', 6, 34),
(68, 'Hi', '2014-04-11', 6, 34),
(69, 'hiiii', '2014-04-11', 6, 34),
(70, 'hiiii', '2014-04-11', 6, 34),
(71, 'hiiii', '2014-04-11', 6, 34),
(72, 'ijdoarhigpoeirhg', '2014-04-11', 6, 34),
(73, 'jshdfuwhiu', '2014-04-11', 6, 34),
(74, 'hello again', '2014-04-11', 6, 34),
(75, 'hello again', '2014-04-11', 6, 34),
(76, 'filling', '2014-04-11', 6, 34),
(77, 'the', '2014-04-11', 6, 34),
(78, 'convo', '2014-04-11', 6, 34),
(79, 'up', '2014-04-11', 6, 34),
(80, 'with', '2014-04-11', 6, 34),
(81, 'lots', '2014-04-11', 6, 34),
(82, 'and', '2014-04-11', 6, 34),
(83, 'lots', '2014-04-11', 6, 34),
(84, 'of', '2014-04-11', 6, 34),
(85, 'stuff', '2014-04-11', 6, 34),
(86, 'to', '2014-04-11', 6, 34),
(87, 'see', '2014-04-11', 6, 34),
(88, 'if', '2014-04-11', 6, 34),
(89, 'scroll', '2014-04-11', 6, 34),
(90, 'works', '2014-04-11', 6, 34),
(91, '', '2014-04-11', 5, 30),
(92, 'hahahaha', '2014-04-12', 5, 34),
(93, 'hello', '2014-04-12', 5, 34),
(94, 'yup', '2014-04-12', 5, 34),
(95, 'yup', '2014-04-12', 5, 34),
(96, 'jaskdjfhsjkdf', '2014-04-12', 5, 34),
(97, 'jaskdjfhsjkdf', '2014-04-12', 5, 34),
(98, 'eraert', '2014-04-12', 5, 34),
(99, 'asdfsadf', '2014-04-12', 5, 34),
(100, '', '2014-04-12', 5, 34),
(101, '', '2014-04-12', 5, 34),
(102, 'asfadfg', '2014-04-12', 5, 34),
(103, 'xxcnf,msdnfmsd', '2014-04-12', 5, 34),
(104, 'something', '2014-04-12', 5, 34),
(105, 'sdfsdf', '2014-04-12', 5, 34),
(106, 'sdfsdf', '2014-04-12', 5, 34),
(107, 'masndmasnd', '2014-04-12', 5, 34),
(108, '', '2014-04-12', 5, 34),
(109, 'kkzjlczkdjflkdfj', '2014-04-12', 5, 34),
(110, 'gjhgjhg', '2014-04-12', 5, 34),
(111, '', '2014-04-12', 5, 30),
(112, '', '2014-04-12', 5, 30),
(113, 'w', '2014-04-12', 5, 30),
(114, '', '2014-04-12', 6, 34),
(115, 'sdffhjgiwurht', '2014-04-12', 6, 34),
(116, 'sdffhjgiwurht', '2014-04-12', 6, 34),
(117, 'asd', '2014-04-12', 6, 34),
(118, 'lalalala', '2014-04-12', 6, 34),
(119, 'yod', '2014-04-12', 6, 34),
(120, 'jhfksjhr', '2014-04-12', 5, 34),
(121, 'sdfgh', '2014-04-12', 5, 34),
(122, 'hello', '2014-04-12', 5, 34),
(123, 'kat', '2014-04-12', 5, 34),
(124, 'sdfghjk', '2014-04-12', 5, 34),
(125, 'huuhuh', '2014-04-12', 5, 34),
(126, 'gi', '2014-04-12', 5, 34),
(127, 'testing', '2014-04-12', 5, 30),
(128, 'hi', '2014-04-12', 5, 30),
(129, 'i lost you', '2014-04-12', 5, 30),
(130, 'we weren''t right', '2014-04-12', 5, 30),
(131, 'starting....', '2014-04-12', 5, 38),
(132, 'hello', '2014-04-12', 6, 38),
(133, 'wew', '2014-04-12', 5, 38),
(134, '', '2014-04-12', 6, 38),
(135, 'hi', '2014-04-12', 6, 38),
(136, 'hello', '2014-04-12', 6, 38),
(137, 'what', '2014-04-12', 5, 38),
(138, 'hmmm', '2014-04-12', 5, 38),
(139, 'hellllllllllllo', '2014-04-12', 6, 38),
(140, 'Guuuuuys!! Magstart na tayo sa presentation', '2014-04-12', 7, 39),
(141, 'Game~', '2014-04-12', 5, 39),
(142, 'na-pressure na rin ako sa kabilang group e', '2014-04-12', 5, 39),
(143, 'hahahahaha', '2014-04-12', 5, 39),
(144, 'Emiiiiiiiiiiiir', '2014-04-12', 7, 40),
(145, 'Laraaaaa', '2014-04-12', 7, 39),
(146, 'Hi', '2014-04-12', 7, 39),
(147, 'Hiiiiiiii', '2014-04-12', 7, 40),
(148, 'Hellooooo', '2014-04-12', 7, 41),
(149, 'Hellooooo', '2014-04-12', 7, 41);

-- --------------------------------------------------------

--
-- Table structure for table `chatonline`
--

CREATE TABLE IF NOT EXISTS `chatonline` (
  `chatOnlineID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`chatOnlineID`),
  KEY `chatonlineFK` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=130 ;

--
-- Dumping data for table `chatonline`
--

INSERT INTO `chatonline` (`chatOnlineID`, `userID`) VALUES
(129, 5),
(127, 6),
(122, 8);

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE IF NOT EXISTS `colleges` (
  `collegeid` int(11) NOT NULL AUTO_INCREMENT,
  `collegename` varchar(50) NOT NULL,
  PRIMARY KEY (`collegeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`collegeid`, `collegename`) VALUES
(1, 'College of Arts and Letters'),
(2, 'College of Fine Arts'),
(3, 'College of Human Kinetics'),
(4, 'College of Mass Communications'),
(5, 'College of Music'),
(6, 'Asian Center'),
(7, 'College of Education'),
(8, 'Institute of Islamic Studies'),
(9, 'College of Law'),
(10, 'College of Social Work and Community Development'),
(11, 'College of Social Sciences and Philosophy'),
(12, 'Asian Institute of Tourism'),
(13, 'College of Business Administration'),
(14, 'School of Economics'),
(15, 'School of Labor and Industrial Relations'),
(16, 'School of Urban and Regional Planning'),
(17, 'National College of Public Administration & Govern'),
(18, 'Technology Management Center'),
(19, 'College of Architecture'),
(20, 'College of Engineering'),
(21, 'College of Home Economics'),
(22, 'College of Science'),
(23, 'Statistical Center'),
(24, 'School of Library and Information Studies'),
(25, 'Archaeological Studies Program');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `deptid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(50) NOT NULL,
  PRIMARY KEY (`courseid`),
  KEY `fk_deptid` (`deptid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=158 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`deptid`, `courseid`, `coursename`) VALUES
(1, 1, 'BS Architecture'),
(1, 2, 'B Landscape Architecture'),
(1, 3, 'M Architecture'),
(1, 4, 'M Tropical Landscape Architecture'),
(2, 5, 'BS Business Administration'),
(2, 6, 'BS Business Administration and Accountancy'),
(2, 7, 'M Business Administration'),
(2, 8, 'MS Finance'),
(2, 9, 'Ph.D Business Administration'),
(3, 10, 'BS Economics'),
(3, 11, 'BS Business Economics'),
(3, 12, 'MA Economics'),
(3, 13, 'M Development Economics'),
(3, 14, 'Ph.D Economics'),
(4, 15, 'B Laws'),
(5, 16, 'Diploma in Librarianship'),
(5, 17, 'B Library and Information Science'),
(5, 18, 'M Library and Information Science'),
(6, 19, 'BS Community Development'),
(6, 20, 'BS Social Work'),
(6, 21, 'MS Community Development'),
(6, 22, 'MS Social Work'),
(6, 23, 'Diploma in Community Development'),
(6, 24, 'Diploma in Social Work'),
(7, 25, 'BS Statistics'),
(7, 26, 'M Statistics'),
(7, 27, 'MS Statistics'),
(7, 28, 'Ph.D Statistics'),
(8, 29, 'BS Tourism'),
(9, 30, 'Diploma in Archaeology'),
(9, 31, 'MS Archaeology'),
(9, 32, 'MA Archaeology'),
(9, 33, 'Ph.D Archaeology'),
(10, 34, 'MA Asian Studies'),
(10, 35, 'M Asian Studies'),
(10, 36, 'MA Philippne Studies'),
(10, 37, 'M Philippne Studies'),
(10, 38, 'Ph.D Philippne Studies'),
(11, 39, 'MA Islamic Studies'),
(12, 40, 'Certificate in Sports'),
(12, 41, 'Bachelor of Physical Education'),
(12, 42, 'Bachelor of Sports Science'),
(12, 43, 'Diploma in Physical Education'),
(12, 44, 'M Physical Education'),
(12, 45, 'MS Physical Education'),
(13, 46, 'Diploma in Industrial Relations'),
(13, 47, 'M Industrial Relations'),
(14, 48, 'Diploma in Urban and Regional Planning'),
(14, 49, 'MA Urban and Regional Planning'),
(14, 50, 'Ph.D Urban and Regional Planning'),
(15, 51, 'Diploma in Technology Management'),
(15, 52, 'M Technology Management'),
(16, 53, 'BA Art Studies'),
(16, 54, 'MA Art Studies'),
(17, 55, 'BA English Studies'),
(17, 56, 'BA Comparative Literature'),
(17, 57, 'BA Creative Writing'),
(17, 58, 'MA English Studies'),
(17, 59, 'MA Comparative Literature'),
(17, 60, 'MA Creative Writing'),
(17, 61, 'Ph.D English Studies'),
(17, 62, 'Ph.D Comparative Literature'),
(17, 63, 'Ph.D Creative Writing'),
(18, 64, 'BA European Languages'),
(18, 65, 'MA Spanish'),
(18, 66, 'MA French'),
(18, 67, 'MA German'),
(18, 68, 'Ph.D Hispanic Literature'),
(19, 69, 'Sertipiko sa Malikhaing Pagsulat sa Filipino'),
(19, 70, 'BA Filipino'),
(19, 71, 'BA Araling Pilipino'),
(19, 72, 'BA Malikhaing Pagsulat'),
(19, 73, 'MA Araling Pilipino'),
(19, 74, 'MA Filipino'),
(19, 75, 'Ph.D Filipino'),
(20, 76, 'Certificate in Theater Arts'),
(20, 77, 'BA Speech Communication'),
(20, 78, 'BA Theater Arts'),
(20, 79, 'MA Speech Communication'),
(20, 80, 'MA Theater Arts'),
(21, 81, ''),
(22, 82, 'B Elementary Education'),
(22, 83, 'B Secondary Education'),
(23, 84, 'MA Education'),
(23, 85, 'Ph.D Education'),
(24, 86, 'BS Chemical Engineering'),
(24, 87, 'MS Chemical Engineering'),
(24, 88, 'Ph.D Chemical Engineering'),
(24, 89, 'E.D Chemical'),
(25, 90, 'BS Civil Engineering'),
(25, 91, 'MS Civil Engineering'),
(26, 92, 'BS Computer Science'),
(26, 93, 'MS Computer Science'),
(28, 94, 'Diploma in Engineering'),
(27, 95, 'BS Computer Engineering'),
(27, 96, 'BS Electrical Engineering'),
(27, 97, 'BS Electronics and Communications Engineering'),
(29, 98, 'BS Geodetic Engineering'),
(30, 99, 'BS Industrial Engineering'),
(31, 100, 'BS Mechanical Engineering'),
(32, 101, 'BS Mining Engineering'),
(32, 102, 'BS Metallurgical Engineering'),
(32, 103, 'BS Materials Engineering'),
(33, 104, 'BFA Painting'),
(33, 105, 'BFA Sculpture'),
(34, 106, 'BFA Industrial Design'),
(34, 107, 'BFA Visual Communication'),
(35, 108, 'BFA Art Education'),
(35, 109, 'BFA Art History'),
(36, 110, 'BS Food Technology'),
(36, 111, 'BS Community Nutrition'),
(37, 112, 'BS Hotel & Restaurant Administration'),
(38, 113, 'BS Clothing Technology'),
(38, 114, 'BS Interior Design'),
(39, 115, 'BS Family Life and Child Development'),
(40, 116, 'BS Home Economics'),
(41, 117, 'BA Broadcast Communication'),
(42, 118, 'BA Communication Research'),
(43, 119, 'BA Communication, Major in Film and Audio-Visual C'),
(44, 120, 'BA Journalism'),
(45, 121, 'MA Communication'),
(45, 122, 'MA Media Studies'),
(46, 123, 'BM Dance'),
(46, 124, 'BM Voice'),
(47, 125, 'BM Keyboard'),
(48, 126, 'BM Strings'),
(49, 127, 'BM Winds'),
(49, 128, 'BM Percussion'),
(50, 129, 'BM Music Education'),
(51, 130, 'BM Musicology'),
(52, 131, 'BM Choral/Orchestral Conducting'),
(53, 132, 'BM Composition'),
(54, 133, 'BA Public Administration'),
(55, 134, 'MPA Public Policy and Program Administration'),
(56, 135, 'MPA Local Government and Regional Administration'),
(57, 136, 'MPA Organization Studies, Public Enterprise Manage'),
(58, 137, 'BS Biology'),
(59, 138, 'BS Chemistry'),
(60, 139, 'Diploma in Environmental Science'),
(61, 140, 'BS Geology'),
(62, 141, 'BS Physics'),
(63, 142, 'BS Applied Physics'),
(64, 143, 'BS Mathematics'),
(65, 144, 'BS Molecular Biology and Biotechnology'),
(66, 145, ''),
(67, 146, ''),
(68, 147, ''),
(69, 148, ''),
(70, 149, 'BA Anthropology'),
(71, 150, 'BS Geography'),
(72, 151, 'BA History'),
(73, 152, 'BA Linguistics'),
(74, 153, 'BA Philosophy'),
(75, 154, 'BA Political Science'),
(76, 155, 'BA Psychology'),
(76, 156, 'BS Psychology'),
(77, 157, 'BA Sociology');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `collegeid` int(11) NOT NULL,
  `deptid` int(11) NOT NULL AUTO_INCREMENT,
  `deptname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`deptid`),
  KEY `fk_collegeid` (`collegeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`collegeid`, `deptid`, `deptname`) VALUES
(19, 1, ''),
(13, 2, ''),
(14, 3, ''),
(9, 4, ''),
(24, 5, ''),
(10, 6, ''),
(23, 7, ''),
(12, 8, ''),
(25, 9, ''),
(6, 10, ''),
(8, 11, ''),
(3, 12, ''),
(15, 13, ''),
(16, 14, ''),
(18, 15, ''),
(1, 16, 'Department of Art Studies'),
(1, 17, 'Department of English and Comparative Literature'),
(1, 18, 'Department of European Languages'),
(1, 19, 'Department of Filipino and Philippine Literature'),
(1, 20, 'Department of Speech Communication and Theater Art'),
(1, 21, 'Institute of Creative Writing'),
(7, 22, 'Division of Curriculum and Instruction'),
(7, 23, 'Division of Educational Leadership and Professiona'),
(20, 24, 'Department of Chemical Engineering'),
(20, 25, 'Institute of Civil Engineering'),
(20, 26, 'Department of Computer Science'),
(20, 27, 'Electrical and Electronics Engineering Institute'),
(20, 28, 'Department of Engineering Sciences'),
(20, 29, 'Department of Geodetic Engineering'),
(20, 30, 'Department of Industrial Engineering and Operation'),
(20, 31, 'Department of Mechanical Engineering'),
(20, 32, 'Department of Mining, Metallurgical and Materials '),
(2, 33, 'Department of Studio Arts'),
(2, 34, 'Department of Visual Communication'),
(2, 35, 'Department of Art Theory'),
(21, 36, 'Department of Food Science and Nutrition'),
(21, 37, 'Department of Hotel, Restaurant and Institution Ma'),
(21, 38, 'Department of Clothing, Textiles and Interior Desi'),
(21, 39, 'Department of Family Life and Child Development'),
(21, 40, 'Home Economics Education Department'),
(4, 41, 'Department of Broadcast Communication'),
(4, 42, 'Department of Communication Research'),
(4, 43, 'Department of Film'),
(4, 44, 'Department of Journalism'),
(4, 45, 'Graduate Studies'),
(5, 46, 'Voice / Theater and Dance Department'),
(5, 47, 'Keyboard Department'),
(5, 48, 'Strings Department'),
(5, 49, 'Winds & Percussion Department'),
(5, 50, 'Music Education Department'),
(5, 51, 'Musicology Department'),
(5, 52, 'Conducting and Choral Ensemble Department'),
(5, 53, 'Composition and Theory Department'),
(17, 54, 'Center for Public Administration and Governance Ed'),
(17, 55, 'Center for Policy and Executive Development'),
(17, 56, 'Center for Local and Regional Governance'),
(17, 57, 'Center for Leadership, Citizenship and Democracy'),
(22, 58, 'Institute of Biology'),
(22, 59, 'Institute of Chemistry'),
(22, 60, 'Institute of Environmental Science and Meteorology'),
(22, 61, 'National Institute of Geological Sciences'),
(22, 62, 'National Institute of Physics'),
(22, 63, 'Marine Science Institute'),
(22, 64, 'Institute of Mathematics'),
(22, 65, 'National Institute of Molecular Biology & Biotechn'),
(22, 66, 'Natural Sciences Research Institute'),
(22, 67, 'Materials Science and Engineering Program'),
(22, 68, 'Science and Society Program'),
(22, 69, 'Computational Science Research Center'),
(11, 70, 'Department of Anthropology'),
(11, 71, 'Department of Geography'),
(11, 72, 'Department of History'),
(11, 73, 'Department of Linguistics'),
(11, 74, 'Department of Philosophy'),
(11, 75, 'Department of Political Science'),
(11, 76, 'Department of Psychology'),
(11, 77, 'Department of Sociology');

-- --------------------------------------------------------

--
-- Table structure for table `fcategory`
--

CREATE TABLE IF NOT EXISTS `fcategory` (
  `fcategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  PRIMARY KEY (`fcategoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fcategory`
--

INSERT INTO `fcategory` (`fcategoryID`, `category`) VALUES
(0, 'General');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `fcomment`
--

INSERT INTO `fcomment` (`fcommentID`, `content`, `commentDate`, `fpostID`, `userID`) VALUES
(7, 'Boo', '2014-04-15', 69, 6);

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
  `fcategoryID` int(11) NOT NULL,
  PRIMARY KEY (`fpostID`),
  KEY `fpostFK` (`userID`),
  KEY `fpostFK2` (`fcategoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `fpost`
--

INSERT INTO `fpost` (`fpostID`, `title`, `content`, `commentCount`, `postDate`, `userID`, `fcategoryID`) VALUES
(69, 'Mei you ni Wo hui shi shui Xin ting zi na li Do bu dui', 'Na jin tian Ca dao zuo tian Kong bai yi pian Na yi tian Zai na yi tian Ke yi ji xu Wei wa qing jie Zai zhe jiao Zha pian shui pei Zai ni shen bian', 1, '2014-04-11', 7, 0),
(70, 'How do I add modals in JSP?', 'I need to be able to add modals in my JSP code.', 0, '2014-04-11', 5, 0),
(71, 'How to auto-refresh a jsp?', 'I need my jsp file to auto-refresh...', 0, '2014-04-11', 5, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ftag`
--

CREATE TABLE IF NOT EXISTS `ftag` (
  `ftagID` int(11) NOT NULL AUTO_INCREMENT,
  `tag` text NOT NULL,
  PRIMARY KEY (`ftagID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `ftag`
--

INSERT INTO `ftag` (`ftagID`, `tag`) VALUES
(31, 'ching'),
(32, 'chong'),
(33, 'chang'),
(34, 'jsp'),
(35, 'modal'),
(36, 'modal jsp'),
(37, 'oioaushgpui'),
(38, 'dhiurhgoeiurh'),
(39, 'ksjhffsjkhdf'),
(40, 'sdjhfkjsdhf'),
(41, 'fdfgdfgd'),
(42, 'ksjdhfhfkjzhgf'),
(43, 'sjdbbfksjdfh'),
(44, 'shdgfjshdgf'),
(45, 'sdfsdf'),
(46, 'hellooooo'),
(47, 'hi'),
(48, 'kajhf'),
(49, 'hglkahdkfls'),
(50, 'jhgjhgjhg'),
(51, 'asdf'),
(52, 'asdfghjkl;''\\'),
(53, '\\''''\\''\\\\''''\\''\\'''),
(54, 'tag\\tag'),
(55, '''tag'''),
(56, 'bla'),
(57, 'asdfg'),
(58, 'this-is-a-tag'),
(59, 'tag-tag-tag'),
(60, 'something'),
(61, 'a-tag'),
(62, 'another-tag'),
(63, 'tag'),
(64, 'werghjxcv'),
(65, 'blah');

-- --------------------------------------------------------

--
-- Table structure for table `hitcounter`
--

CREATE TABLE IF NOT EXISTS `hitcounter` (
  `page` varchar(50) NOT NULL,
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hitcounter`
--

INSERT INTO `hitcounter` (`page`, `views`) VALUES
('homepage', 123);

-- --------------------------------------------------------

--
-- Table structure for table `hotlines`
--

CREATE TABLE IF NOT EXISTS `hotlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `info` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hotlines`
--

INSERT INTO `hotlines` (`id`, `name`, `info`) VALUES
(1, 'UP Diliman Police', '9283615*9818500 loc 4008 (Radio Room)*113 (Helpdesk)'),
(2, 'University Health Service', '9818500 loc 111'),
(3, 'Bureau of Fire Protection', '928-8363 (Quezon City Hall)*924-1922*441-8279 (Libis)*492-7576 (Loyola Heights)*931-9894 (New Era)'),
(4, 'Bomb Squad', '436-0948*924-3101'),
(5, 'Philippne National Red Cross Quezon City Chapter', '920-3672*433-6568 (Blood Bank)*433-2151 to 52*434-3751'),
(6, 'Meralco', '631-1111*162-11'),
(7, 'PLDT', '173*171');

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
  `fileDesc` text,
  PRIMARY KEY (`matFileID`),
  KEY `matfileFK2` (`matSubjectID`),
  KEY `matfileFK` (`matFolderID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `matfile`
--

INSERT INTO `matfile` (`matFileID`, `fileName`, `fileType`, `fileSize`, `uploadDate`, `path`, `matSubjectID`, `matFolderID`, `userID`, `fileDesc`) VALUES
(80, 'CS 130 - Lesson 1.pdf', 'pdf', 474982, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 5, NULL),
(81, 'CS 130 - Lesson 2.pdf', 'pdf', 273616, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 5, NULL),
(82, 'CS 130 - Lesson 3.pdf', 'pdf', 431795, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 5, NULL),
(83, 'CS 130 - Lesson 4.pdf', 'pdf', 236032, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 5, NULL),
(84, 'CS 130 - Lesson 5.pdf', 'pdf', 333960, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 5, NULL),
(85, 'CS 130 - Lesson 6.pdf', 'pdf', 162288, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 5, NULL),
(86, 'CS 130 - Lesson 7.pdf', 'pdf', 440491, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Slides\\', 7, 1, 5, NULL),
(92, 'CS 130 - First Order ODE - Exercises - Part 1.pdf', 'pdf', 94974, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 6, NULL),
(93, 'CS 130 - First Order ODE - Exercises - Part 2.pdf', 'pdf', 70965, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 6, NULL),
(94, 'CS 130 - Fourier Series - Exercises.pdf', 'pdf', 82168, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 6, NULL),
(96, 'CS 130 - Linear Algebra Examples.pdf', 'pdf', 159015, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 6, NULL),
(97, 'CS 130 - Simultaneous ODEs - Exercises.pdf', 'pdf', 82659, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Samplex\\', 7, 2, 6, NULL),
(98, 'toolbox_general.zip', 'zip', 78422, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 5, NULL),
(99, '1560412_10201229725497910_106132362_n.jpg', 'jpg', 54235, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 5, NULL),
(100, '1618398_10201229725617913_265344154_n.jpg', 'jpg', 57020, '2014-04-12', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 130\\Miscellaneous\\', 7, 3, 5, NULL),
(102, '1463646_10200772623192476_1640500034_n.jpg', 'jpg', 62248, '2014-04-21', 'C:\\Users\\lara312\\Documents\\GitHub\\coffee\\BCOnlineClassroom\\WebContent\\downloads\\CS 11\\Slides\\', 1, 1, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matfiletag`
--

CREATE TABLE IF NOT EXISTS `matfiletag` (
  `matFileTagID` int(11) NOT NULL AUTO_INCREMENT,
  `matFileID` int(11) NOT NULL,
  `matTagID` int(11) NOT NULL,
  PRIMARY KEY (`matFileTagID`),
  KEY `matfiletagFK` (`matFileID`),
  KEY `matfiletagFK2` (`matTagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
-- Table structure for table `mattag`
--

CREATE TABLE IF NOT EXISTS `mattag` (
  `matTagID` int(11) NOT NULL AUTO_INCREMENT,
  `matTag` text NOT NULL,
  PRIMARY KEY (`matTagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleid`, `rolename`) VALUES
(1, 'ROLE_GENERAL'),
(2, 'ROLE_STUDENT'),
(3, 'ROLE_FACULTY'),
(4, 'ROLE_ADMIN'),
(5, 'ROLE_ADMIN_PORTAL'),
(6, 'ROLE_ADMIN_MAPS'),
(7, 'ROLE_ADMIN_BUDDY'),
(8, 'ROLE_ADMIN_CLASS'),
(9, 'ROLE_ADMIN_GYM'),
(10, 'ROLE_GOD');

-- --------------------------------------------------------

--
-- Table structure for table `rolespertype`
--

CREATE TABLE IF NOT EXISTS `rolespertype` (
  `roleid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  KEY `fk_typeid` (`typeid`),
  KEY `fk_roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rolespertype`
--

INSERT INTO `rolespertype` (`roleid`, `typeid`) VALUES
(1, 1),
(1, 2),
(2, 2),
(1, 3),
(3, 3),
(1, 4),
(4, 4),
(5, 4),
(1, 5),
(4, 5),
(6, 5),
(1, 6),
(4, 6),
(7, 6),
(1, 7),
(4, 7),
(8, 7),
(1, 8),
(4, 8),
(9, 8),
(1, 9),
(4, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE IF NOT EXISTS `userroles` (
  `userid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  KEY `fk_ur_userid` (`userid`),
  KEY `fk_ur_typeid` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`userid`, `typeid`) VALUES
(1, 2),
(2, 9),
(1, 6),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(5, 7),
(6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `collegeid` int(11) DEFAULT NULL,
  `departmentid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `firstname`, `lastname`, `email`, `username`, `password`, `enabled`, `collegeid`, `departmentid`, `courseid`) VALUES
(1, 'Sherlyne', 'Francia', 'shefrancia@gmail.com', 'shefrancia', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 1, 20, 26, 92),
(2, 'Sher', 'Francia', 'sharin@furanshia.com', 'goddessher', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 1, NULL, NULL, NULL),
(5, 'Lara Eunice', 'Pacumio', 'lara.pacumio@gmail.com', 'leapacumio', '5fa339bbbb1eeaced3b52e54f44576aaf0d77d96', 1, 20, 26, 92),
(6, 'Katrina Grace', 'Lorenzo', 'kgdlorenzo@gmail.com', 'kgdlorenzo', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 1, 20, 26, 92),
(7, 'Sharmaine', 'Yap', 'sharmaine.yap@gmail.com', 'sharmaineyap', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 1, 20, 26, 92),
(8, 'Emir', 'Mercado', 'emircado@gmail.com', 'emircado', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 1, 20, 26, 92),
(9, 'Nikka', 'Octavo', 'niks.octavo@gmail.com', 'niksoctavo', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', 1, 20, 26, 92);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE IF NOT EXISTS `usertypes` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(15) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`typeid`, `typename`) VALUES
(1, 'GENERAL'),
(2, 'STUDENT'),
(3, 'FACULTY'),
(4, 'ADMIN_PORTAL'),
(5, 'ADMIN_MAPS'),
(6, 'ADMIN_BUDDY'),
(7, 'ADMIN_CLASS'),
(8, 'ADMIN_GYM'),
(9, 'GOD');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminrequests`
--
ALTER TABLE `adminrequests`
  ADD CONSTRAINT `fk_re_typeid` FOREIGN KEY (`typeid`) REFERENCES `usertypes` (`typeid`),
  ADD CONSTRAINT `fk_re_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `chatmember`
--
ALTER TABLE `chatmember`
  ADD CONSTRAINT `chatmemberFK` FOREIGN KEY (`chatConvoID`) REFERENCES `chatconvo` (`chatConvoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatmemberFK2` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatmessage`
--
ALTER TABLE `chatmessage`
  ADD CONSTRAINT `chatmessageFK` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatmessageFK2` FOREIGN KEY (`chatConvoID`) REFERENCES `chatconvo` (`chatConvoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatonline`
--
ALTER TABLE `chatonline`
  ADD CONSTRAINT `chatonlineFK` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_deptid` FOREIGN KEY (`deptid`) REFERENCES `departments` (`deptid`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_collegeid` FOREIGN KEY (`collegeid`) REFERENCES `colleges` (`collegeid`);

--
-- Constraints for table `fcomment`
--
ALTER TABLE `fcomment`
  ADD CONSTRAINT `fcommentFK` FOREIGN KEY (`fpostID`) REFERENCES `fpost` (`fpostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fcommentFK2` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fpost`
--
ALTER TABLE `fpost`
  ADD CONSTRAINT `fpostFK2` FOREIGN KEY (`fcategoryID`) REFERENCES `fcategory` (`fcategoryID`),
  ADD CONSTRAINT `fpostFK` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fpostag`
--
ALTER TABLE `fpostag`
  ADD CONSTRAINT `fpostagFK` FOREIGN KEY (`ftagID`) REFERENCES `ftag` (`ftagID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fpostagFK2` FOREIGN KEY (`fpostID`) REFERENCES `fpost` (`fpostID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matfile`
--
ALTER TABLE `matfile`
  ADD CONSTRAINT `matfileFK` FOREIGN KEY (`matSubjectID`) REFERENCES `matsubject` (`matSubjectID`),
  ADD CONSTRAINT `matfileFK2` FOREIGN KEY (`matFolderID`) REFERENCES `matfolder` (`matFolderID`),
  ADD CONSTRAINT `matfileFK3` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matfiletag`
--
ALTER TABLE `matfiletag`
  ADD CONSTRAINT `matfiletagFK` FOREIGN KEY (`matFileID`) REFERENCES `matfile` (`matFileID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matfiletagFK2` FOREIGN KEY (`matTagID`) REFERENCES `mattag` (`matTagID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rolespertype`
--
ALTER TABLE `rolespertype`
  ADD CONSTRAINT `fk_roleid` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`),
  ADD CONSTRAINT `fk_typeid` FOREIGN KEY (`typeid`) REFERENCES `usertypes` (`typeid`);

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `fk_ur_typeid` FOREIGN KEY (`typeid`) REFERENCES `usertypes` (`typeid`),
  ADD CONSTRAINT `fk_ur_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
