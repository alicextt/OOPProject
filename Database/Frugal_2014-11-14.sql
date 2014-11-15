# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: Frugal
# Generation Time: 2014-11-15 00:05:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Faculty
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Faculty`;

CREATE TABLE `Faculty` (
  `IdUser` int(11) NOT NULL,
  `Department` varchar(55) NOT NULL DEFAULT '',
  `title` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `1` FOREIGN KEY (`IdUser`) REFERENCES `User` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;

INSERT INTO `Faculty` (`IdUser`, `Department`, `title`)
VALUES
	(3,'Computer Engineering','Associate Professor'),
	(4,'Electrical Engineering','Associate Professor');

/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Team`;

CREATE TABLE `Team` (
  `IdTeam` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL,
  PRIMARY KEY (`IdTeam`,`IdUser`),
  KEY `User-team` (`IdUser`),
  CONSTRAINT `User-team` FOREIGN KEY (`IdUser`) REFERENCES `User` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;

INSERT INTO `Team` (`IdTeam`, `IdUser`)
VALUES
	(1,1),
	(2,2),
	(1,3),
	(2,3),
	(2,4),
	(1,5),
	(2,6);

/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `IdUser` int(11) NOT NULL,
  `FirstName` varchar(55) DEFAULT NULL,
  `LastName` varchar(55) DEFAULT NULL,
  `Email` varchar(55) DEFAULT NULL,
  `UserName` varchar(255) NOT NULL,
  `PassWord` varchar(255) NOT NULL,
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`IdUser`, `FirstName`, `LastName`, `Email`, `UserName`, `PassWord`)
VALUES
	(1,'Ryan','Davidson',' Davidson@scu.edu','student1','1'),
	(2,'Kirsten','Petersen','Petersen@scu.edu','student2','2'),
	(3,'Silvia','Figueira','Figueira@scu.edu','admin','admin'),
	(4,'Shoba','Krishnan','Krishnan@scu.edu','faculty','faculty'),
	(5,'Ian','Dougherty','Dougherty@scu.edu','student3','3'),
	(6,'Jaqueline','Barbosa',' Barbosa@scu.edu','student4','4');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
