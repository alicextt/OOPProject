# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: frugal
# Generation Time: 2014-12-10 03:50:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Admin`;

CREATE TABLE `Admin` (
  `UserName` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;

INSERT INTO `Admin` (`UserName`)
VALUES
	('txu');

/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Budget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Budget`;

CREATE TABLE `Budget` (
  `IdBudget` int(10) NOT NULL DEFAULT '0',
  `Description` text,
  `IdProject` int(10) DEFAULT NULL,
  `ProjectedAmount` int(10) DEFAULT NULL,
  `ActualAmount` int(10) DEFAULT NULL,
  PRIMARY KEY (`IdBudget`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Budget` WRITE;
/*!40000 ALTER TABLE `Budget` DISABLE KEYS */;

INSERT INTO `Budget` (`IdBudget`, `Description`, `IdProject`, `ProjectedAmount`, `ActualAmount`)
VALUES
	(401,'Travel to Uganda',201,2000,2200),
	(402,'Team Dinners',201,500,450),
	(403,'Hotel in Jan. 2014',202,500,600),
	(404,'Water',202,100,50),
	(405,'Rental',203,450,500),
	(406,'Travel to meet potential customers',203,1000,900),
	(407,'Team Lunches',203,300,200),
	(408,'Travel to meet potential customers',204,500,1000),
	(409,'Hotels',204,300,300),
	(410,'Team Dinners',204,100,85),
	(411,'Phonecard',205,10,10),
	(412,'Laptop purchased',205,800,1000),
	(413,'Party',202,1000,1335),
	(414,'Phonecard to make long distance calls',202,50,50),
	(415,'Team Lunches',202,200,340),
	(416,'Team Dinners',202,400,450),
	(417,'Laptops for testing the project',202,3000,3450),
	(418,'Travel to meet customers',202,1000,1150),
	(419,'Music',202,100,50),
	(420,'Equipments for testing',202,1400,1150),
	(421,'Rental',202,300,450),
	(422,'Hotel in Mar 2014',202,1000,670),
	(423,'Celebration lunch',202,600,650),
	(424,'Celebration dinner',202,1000,1050),
	(425,'Visiting customers to fix bugs',202,100,90);
	

/*!40000 ALTER TABLE `Budget` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Communication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Communication`;

CREATE TABLE `Communication` (
  `IdCommunication` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Summary` text,
  PRIMARY KEY (`IdCommunication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Communication` WRITE;
/*!40000 ALTER TABLE `Communication` DISABLE KEYS */;

INSERT INTO `Communication` (`IdCommunication`, `Date`, `Summary`)
VALUES
	(501,'2014-02-28',' These applications can be pre-installed on phones during manufacturing, downloaded by customers from various mobile software distribution platforms, or delivered as web applications using server-side or client-side processing (e.g. JavaScript) to provide an \"application-like\" experience within a Web browser. Application software developers also have to consider a lengthy array of screen sizes, hardware specifications and configurations because of intense competition in mobile software and changes within each of the platforms.[1] Mobile app development has been steadily growing, both in terms of revenues and jobs created. A 2013 analyst report estimates there are 529,000 direct App Economy jobs within the EU 28 members, 60% of which are mobile app developers'),
	(502,'2014-01-14','As part of the development process, mobile user interface (UI) design is also an essential in the creation of mobile apps. Mobile UI considers constraints & contexts, screen, input and mobility as outlines for design. The user is often the focus of interaction with their device, and the interface entails components of both hardware and software. User input allows for the users to manipulate a system, and device\'s output allows the system to indicate the effects of the users\' manipulation.');

/*!40000 ALTER TABLE `Communication` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table communicationjoinuser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communicationjoinuser`;

CREATE TABLE `communicationjoinuser` (
  `UserName` varchar(255) NOT NULL,
  `IdCommunication` int(11) NOT NULL,
  PRIMARY KEY (`UserName`,`IdCommunication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `communicationjoinuser` WRITE;
/*!40000 ALTER TABLE `communicationjoinuser` DISABLE KEYS */;

INSERT INTO `communicationjoinuser` (`UserName`, `IdCommunication`)
VALUES
	('admin',501),
	('admin',502),
	('googlepart',502),
	('partener',501),
	('student1',501),
	('student2',501);

/*!40000 ALTER TABLE `communicationjoinuser` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Faculty
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Faculty`;

CREATE TABLE `Faculty` (
  `UserName` varchar(55) NOT NULL DEFAULT '',
  `Department` varchar(55) DEFAULT '',
  `title` varchar(55) DEFAULT '',
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;

INSERT INTO `Faculty` (`UserName`, `Department`, `title`)
VALUES
	('admin','Electrical Engineering','Associate Professor'),
	('faculty','Computer Engineering','Associate Professor');

/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Partener
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Partener`;

CREATE TABLE `Partener` (
  `UserName` varchar(55) NOT NULL,
  `Company` varchar(55) DEFAULT NULL,
  `CompanyAddress` text,
  `Representative` varchar(55) DEFAULT '',
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Partener` WRITE;
/*!40000 ALTER TABLE `Partener` DISABLE KEYS */;

INSERT INTO `Partener` (`UserName`, `Company`, `CompanyAddress`, `Representative`)
VALUES
	('googlepart','google','1600 Amphitheatre Parkway\nMountain View, CA 94043\nPhone: +1 650-253-0000','Tom, Joseph'),
	('partener','Cisco','170 West Tasman Dr.\nSan Jose, CA 95134\nUSA','Joe, David');

/*!40000 ALTER TABLE `Partener` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Project`;

CREATE TABLE `Project` (
  `IdProject` int(10) NOT NULL DEFAULT '0',
  `Name` varchar(40) DEFAULT NULL,
  `Description` text,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `LastModifiedDate` date DEFAULT NULL,
  `ProjectOutcome` text,
  `ProjectStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdProject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;

INSERT INTO `Project` (`IdProject`, `Name`, `Description`, `StartDate`, `EndDate`, `LastModifiedDate`, `ProjectOutcome`, `ProjectStatus`)
VALUES
	(201,'Energy Made in Uganda','This project is a result of the collaboration between Santa clara University and Energy Made in Uganda, a comunity based organizaiton in Mpigi, Ugada. Four Ugandan students trained in solar manufacturing, installation, and servicing, are continuing solar trainings at local Scolar Technology Centers to manufactur Solar Home systems whic are sold in Uganda communities. This method ensures that if a solar product breaks, there is a community representative available to servie it. In partership with these four students, this senior design project to design the elctronic system that is efficient, affordable, safe, serviceable and that meets the end users\' needs.','2014-01-01','2015-01-01','2014-06-01','If a solar product breaks, there is a community representative available to serve it.','In progress'),
	(202,'Dynamic Poverty Heat Map','Our Dynamic Poverty Heat Map web application proposes to eliminate the issue for Fundacion Paraguaya by visually representing same amount of data gathered ina simpler, easier way of analyzing through the use of a heat map. Our web application helps facilitate the process of narrowing down the data to certain departments and survey questions for the means of easy analysis and comparison.','2014-01-01','2015-01-01','2014-06-01','Generate a poverty heat map','In progress'),
	(203,'Mobile app development',' These applications can be pre-installed on phones during manufacturing, downloaded by customers from various mobile software distribution platforms, or delivered as web applications using server-side or client-side processing (e.g. JavaScript) to provide an \"application-like\" experience within a Web browser. Application software developers also have to consider a lengthy array of screen sizes, hardware specifications and configurations because of intense competition in mobile software and changes within each of the platforms.[1] Mobile app development has been steadily growing, both in terms of revenues and jobs created. A 2013 analyst report estimates there are 529,000 direct App Economy jobs within the EU 28 members, 60% of which are mobile app developers','2014-02-05','2015-05-30','2014-03-22','Develop a mobile application','initialization'),
	(204,'Date visualization','P1 descript','2014-01-02','2015-01-28','2014-11-23','Data visulizaiton','initialization'),
	(205,'Next generation car','description1','2014-01-01','2015-01-24','2014-11-24','A model of next generation car.','initialization');

/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Student`;

CREATE TABLE `Student` (
  `student` varchar(55) NOT NULL DEFAULT '',
  `Department` varchar(55) DEFAULT NULL,
  `AcdemicYear` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`student`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;

INSERT INTO `Student` (`student`, `Department`, `AcdemicYear`)
VALUES
	('student1','Computer Engineering','Sophomore'),
	('student2','Computer Engineering','Graduate'),
	('student3','Electrical Engineering','Freshman'),
	('student4','Civil Engineering','Graduate'),
	('student5','Civil Engineering','Senior'),
	('student6','Law','Freshman');

/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Task`;

CREATE TABLE `Task` (
  `IdTask` int(11) NOT NULL,
  `UserName` varchar(55) DEFAULT NULL,
  `IdProject` int(11) NOT NULL,
  `Description` text,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdTask`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;

INSERT INTO `Task` (`IdTask`, `UserName`, `IdProject`, `Description`, `StartDate`, `EndDate`, `Status`)
VALUES
	(301,'student1',201,'Testing external conditions under all loads.','2014-01-01','2014-04-01','started'),
	(302,'student3',201,'Sending System components to EMIU','2014-04-01','2014-04-07','not started'),
	(303,'admin',201,'Teach Surface Mount Soldering Technique','2014-01-01','2014-02-02','started'),
	(304,'student1',201,'Include Manufacturing plan','2014-10-01','2014-11-16','not started'),
	(305,'student3',202,'Create Android Mobile Application','2014-01-01','2014-02-28','finished'),
	(306,'student3',202,'Create GPS functionality','2014-02-20','2014-04-01','started'),
	(307,'faculty',202,'Create Pie Chart Functionality','2014-05-01','2014-06-10','finished'),
	(308,'admin',203,'Gather Date','2014-08-03','2014-08-18','not started'),
	(309,'admin',203,'mobile application','2014-02-02','2014-03-14','finished'),
	(310,'student1',204,'Create Chart','2014-01-12','2014-01-27','not started'),
	(311,'admin',205,'complete date gathering','2014-04-10','2014-05-16','started'),
	(312,'student2',205,'Documentation preparation','2014-01-01','2014-01-29','started'),
	(313,'student2',205,'finish PPT preparation','2014-02-19','2014-02-28','started'),
	(314,'student2',205,'test the dropdown list','2014-03-04','2014-03-28','started'),
	(315,'student5',205,'finish some testing','2014-07-03','2014-08-29','not started'),
	(317,'admin',205,'Gather information','2014-01-09','2014-05-14','started'),
	(318,'student4',203,'testing on functionality','2014-11-04','2015-02-13','finished'),
	(319,'student3',202,'Contact Google for project kick-off.','2014-01-01','2014-01-01','finished');

/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Team`;

CREATE TABLE `Team` (
  `IdProject` int(11) NOT NULL,
  `UserName` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdProject`,`UserName`),
  KEY `User-team` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;

INSERT INTO `Team` (`IdProject`, `UserName`)
VALUES
	(201,'admin'),
	(202,'admin'),
	(203,'admin'),
	(205,'admin'),
	(202,'faculty'),
	(205,'faculty'),
	(202,'googlepart'),
	(201,'partener'),
	(203,'partener'),
	(203,'student1'),
	(204,'student1'),
	(205,'student2'),
	(201,'student3'),
	(202,'student3'),
	(201,'student4'),
	(203,'student4'),
	(205,'student5'),
	(205,'student6');

/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `FirstName` varchar(55) DEFAULT NULL,
  `LastName` varchar(55) DEFAULT NULL,
  `Email` varchar(55) DEFAULT NULL,
  `UserName` varchar(255) NOT NULL,
  `PassWord` varchar(255) NOT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`FirstName`, `LastName`, `Email`, `UserName`, `PassWord`)
VALUES
	('Silvia','Figueira','Figueira@scu.edu','admin','admin'),
	('Shoba','Krishnan','Krishnan@scu.edu','faculty','faculty'),
	(NULL,NULL,'tom@google.com','googlepart','g'),
	('David','Steven','dste@google.com','partener','p'),
	('Ryan','Davidson',' Davidson@scu.edu','student1','1'),
	('Kirsten','Petersen','Petersen@scu.edu','student2','2'),
	('Ian','Dougherty','Dougherty@scu.edu','student3','3'),
	('Jaqueline','Barbosa',' Barbosa@scu.edu','student4','4'),
	('Joe','Chen','try!@iwjero','student5','5'),
	('Laura','Hope','l@scu.edu','student6','6'),
	('Tingting','Xu','txu@scu.edu','txu','txu'),
	('f','l','fl@yahoo.com','whatsup','w'),
	('xu','you','xu@you.com','xu','1234');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
