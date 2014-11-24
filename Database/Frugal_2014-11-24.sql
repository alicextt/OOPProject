# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: Frugal
# Generation Time: 2014-11-24 17:54:13 +0000
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
	(401,'Travel',201,1000,1200),
	(402,'Meals',201,500,450),
	(403,'Lodging',202,500,600),
	(404,'Supplies',202,100,50);

/*!40000 ALTER TABLE `Budget` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Communication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Communication`;

CREATE TABLE `Communication` (
  `IdCommunication` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Summary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdCommunication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Faculty
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Faculty`;

CREATE TABLE `Faculty` (
  `UserName` varchar(55) NOT NULL DEFAULT '',
  `Department` varchar(55) NOT NULL DEFAULT '',
  `title` varchar(55) NOT NULL DEFAULT '',
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
	(201,'Energy Made in Uganda','This project is a result of the collaboration between Santa clara University and Energy Made in Uganda, a comunity based organizaiton in Mpigi, Ugada. Four Ugandan students trained in solar manufacturing, installation, and servicing, are continuing solar trainings at local Scolar Technology Centers to manufactur Solar Home systems whic are sold in Uganda communities. This method ensures that if a solar product breaks, there is a community representative available to servie it. In partership with these four students, this senior design project to design the elctronic system that is efficient, affordable, safe, serviceable and that meets the end users\' needs.','2014-01-01','2015-01-01','2014-06-01','List','In progress'),
	(202,'Dynamic Poverty Heat Map','Our Dynamic Poverty Heat Map web application proposes to eliminate the issue for Fundacion Paraguaya by visually representing same amount of data gathered ina simpler, easier way of analyzing through the use of a heat map. Our web application helps facilitate the process of narrowing down the data to certain departments and survey questions for the means of easy analysis and comparison.','2014-01-01','2015-01-01','2014-06-01','Map','In progress'),
	(203,'mobile','dfwerer','2014-01-02','2014-01-21','2014-11-22','outcome','initialization'),
	(204,'Project1','P1 descript','2014-01-02','2014-01-28','2014-11-23','outcome1','initialization'),
	(205,'example1','description1','2014-01-01','2014-01-24','2014-11-24','outcome1','initialization');

/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
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
	(306,'student3',202,'Create GPS functionality','2014-02-01','2014-03-30','started'),
	(307,'faculty',202,'Create Pie Chart Functionality','2014-01-01','2014-03-30','finished'),
	(308,'admin',203,'308','2014-01-05','2014-01-27','308'),
	(309,'admin',203,'309','2014-01-01','2014-01-26','309'),
	(310,'student1',204,'','2014-01-12','2014-01-27','not started'),
	(311,'admin',205,'begin project','2014-01-01','2014-01-22','1');

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
	(201,'student1'),
	(204,'student1'),
	(201,'student3'),
	(202,'student3'),
	(201,'student4');

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
	('jank','er2','dweir','a','1234'),
	('Silvia','Figueira','Figueira@scu.edu','admin','admin'),
	('Shoba','Krishnan','Krishnan@scu.edu','faculty','faculty'),
	('Kai','Yao','kyao@sjsu.edu','kyao','121'),
	('Ryan','Davidson',' Davidson@scu.edu','student1','1'),
	('Kirsten','Petersen','Petersen@scu.edu','student2','2'),
	('Ian','Dougherty','Dougherty@scu.edu','student3','3'),
	('Jaqueline','Barbosa',' Barbosa@scu.edu','student4','4'),
	('try','try','try!@iwjero','student5','5'),
	('Tingting','Xu','txu@scu.edu','txu','txu'),
	('xu','you','xu@you.com','xu','1234');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
