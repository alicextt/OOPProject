-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema FIL_Task
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FIL_Task
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FIL_Task` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fil_task
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fil_task
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fil_task` DEFAULT CHARACTER SET utf8 ;
USE `FIL_Task` ;

-- -----------------------------------------------------
-- Table `FIL_Task`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIL_Task`.`Project` (
  `IdProject` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(1000) NULL,
  `StartDate` DATE NULL,
  `EndDate` DATE NULL,
  `ProjectStatus` INT NULL,
  `ProjectOutcome` VARCHAR(45) NULL,
  PRIMARY KEY (`IdProject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIL_Task`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIL_Task`.`User` (
  `IdUser` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `UserName` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`IdUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIL_Task`.`Task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIL_Task`.`Task` (
  `IdTask` INT NOT NULL,
  `IdUser` INT NULL,
  `IdProject` INT NULL,
  `Description` VARCHAR(1000) NULL,
  `StartDate` DATE NULL,
  `EndDate` DATE NULL,
  `Status` INT NULL,
  PRIMARY KEY (`IdTask`),
  CONSTRAINT `IdProject`
    FOREIGN KEY (`IdTask`)
    REFERENCES `FIL_Task`.`Project` (`IdProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdUser`
    FOREIGN KEY (`IdTask`)
    REFERENCES `FIL_Task`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIL_Task`.`Communication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIL_Task`.`Communication` (
  `IdCommunication` INT NOT NULL,
  `Date` DATE NULL,
  `Summary` VARCHAR(1000) NULL,
  PRIMARY KEY (`IdCommunication`),
  CONSTRAINT `IdTask`
    FOREIGN KEY (`IdCommunication`)
    REFERENCES `FIL_Task`.`Task` (`IdTask`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `fil_task` ;

-- -----------------------------------------------------
-- Table `fil_task`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_task`.`project` (
  `IdProject` INT(11) NOT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Description` VARCHAR(1000) NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `ProjectStatus` INT(11) NULL DEFAULT NULL,
  `ProjectOutcome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdProject`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fil_task`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_task`.`user` (
  `IdUser` INT(11) NOT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `UserName` VARCHAR(45) NULL DEFAULT NULL,
  `Password` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fil_task`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_task`.`task` (
  `IdTask` INT(11) NOT NULL,
  `IdUser` INT(11) NULL DEFAULT NULL,
  `IdProject` INT(11) NULL DEFAULT NULL,
  `Description` VARCHAR(1000) NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `Status` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IdTask`),
  CONSTRAINT `IdProject`
    FOREIGN KEY (`IdTask`)
    REFERENCES `fil_task`.`project` (`IdProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdUser`
    FOREIGN KEY (`IdTask`)
    REFERENCES `fil_task`.`user` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fil_task`.`communication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fil_task`.`communication` (
  `IdCommunication` INT(11) NOT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `Summary` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`IdCommunication`),
  CONSTRAINT `IdTask`
    FOREIGN KEY (`IdCommunication`)
    REFERENCES `fil_task`.`task` (`IdTask`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
