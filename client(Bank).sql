-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema client
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema client
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `client` DEFAULT CHARACTER SET utf8 ;
USE `client` ;

-- -----------------------------------------------------
-- Table `client`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `client`.`clients` (
  `clientId` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `country` CHAR(15) NOT NULL,
  PRIMARY KEY (`clientId`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
