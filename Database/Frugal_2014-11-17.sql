# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: Frugal
# Generation Time: 2014-11-18 05:58:12 +0000
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


# Dump of table Team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Team`;

CREATE TABLE `Team` (
  `IdTeam` int(11) NOT NULL,
  `UserName` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdTeam`,`UserName`),
  KEY `User-team` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;

INSERT INTO `Team` (`IdTeam`, `UserName`)
VALUES
	(1,'admin'),
	(2,'admin'),
	(2,'faculty'),
	(1,'student1'),
	(2,'student2'),
	(1,'student3'),
	(2,'student4');

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
	('Kai','Yao','kyao@sjsu.edu','kyao','121'),
	('Ryan','Davidson',' Davidson@scu.edu','student1','1'),
	('Kirsten','Petersen','Petersen@scu.edu','student2','2'),
	('Ian','Dougherty','Dougherty@scu.edu','student3','3'),
	('Jaqueline','Barbosa',' Barbosa@scu.edu','student4','4'),
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
