-- MySQL Script generated by MySQL Workbench
-- mar. 03 déc. 2019 11:22:33 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema auto_entrepreneur
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema auto_entrepreneur
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `auto_entrepreneur` DEFAULT CHARACTER SET utf8 ;
USE `auto_entrepreneur` ;

-- -----------------------------------------------------
-- Table `auto_entrepreneur`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_entrepreneur`.`clients` (
  `CL_ID` INT NOT NULL AUTO_INCREMENT,
  `CL_nom` VARCHAR(45) NULL,
  `CL_prénom` VARCHAR(45) NULL,
  `CL_tél` VARCHAR(10) NULL,
  PRIMARY KEY (`CL_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auto_entrepreneur`.`matériels en panne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_entrepreneur`.`matériels en panne` (
  `MA_ID` INT NOT NULL AUTO_INCREMENT,
  `MA_réf` VARCHAR(255) NULL,
  `MA_type` VARCHAR(255) NULL,
  `CL_ID` INT NOT NULL,
  PRIMARY KEY (`MA_ID`),
  CONSTRAINT `fk_matériels_clients`
    FOREIGN KEY (`CL_ID`)
    REFERENCES `auto_entrepreneur`.`clients` (`CL_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_matériels_clients_idx` ON `auto_entrepreneur`.`matériels en panne` (`CL_ID` ASC);


-- -----------------------------------------------------
-- Table `auto_entrepreneur`.`type d'entretien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_entrepreneur`.`type d'entretien` (
  `TP_ID` INT NOT NULL AUTO_INCREMENT,
  `TP_type` VARCHAR(255) NULL,
  `TP_prix_horaire` TINYINT(4) NULL,
  PRIMARY KEY (`TP_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auto_entrepreneur`.`intérvention`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_entrepreneur`.`intérvention` (
  `IN_ID` INT NOT NULL AUTO_INCREMENT,
  `IN_date` DATE NULL,
  `IN_durée` TIME(1) NULL,
  `IN_prix_total` TINYINT(4) NULL,
  `TP_ID` INT NOT NULL,
  `MA_ID` INT NOT NULL,
  PRIMARY KEY (`IN_ID`),
  CONSTRAINT `fk_intérvention_type d'entretien1`
    FOREIGN KEY (`TP_ID`)
    REFERENCES `auto_entrepreneur`.`type d'entretien` (`TP_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_intérvention_matériels en panne1`
    FOREIGN KEY (`MA_ID`)
    REFERENCES `auto_entrepreneur`.`matériels en panne` (`MA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_intérvention_type d'entretien1_idx` ON `auto_entrepreneur`.`intérvention` (`TP_ID` ASC);

CREATE INDEX `fk_intérvention_matériels en panne1_idx` ON `auto_entrepreneur`.`intérvention` (`MA_ID` ASC);


-- -----------------------------------------------------
-- Table `auto_entrepreneur`.`piéce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_entrepreneur`.`piéce` (
  `PI_réf` INT NOT NULL,
  `PI_prix` TINYINT(4) NULL,
  PRIMARY KEY (`PI_réf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `auto_entrepreneur`.`piéce utilisé`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_entrepreneur`.`piéce utilisé` (
  `IN_ID` INT NOT NULL,
  `PI_réf` INT NOT NULL,
  PRIMARY KEY (`IN_ID`, `PI_réf`),
  CONSTRAINT `fk_intérvention_has_piéce_intérvention1`
    FOREIGN KEY (`IN_ID`)
    REFERENCES `auto_entrepreneur`.`intérvention` (`IN_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_intérvention_has_piéce_piéce1`
    FOREIGN KEY (`PI_réf`)
    REFERENCES `auto_entrepreneur`.`piéce` (`PI_réf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_intérvention_has_piéce_piéce1_idx` ON `auto_entrepreneur`.`piéce utilisé` (`PI_réf` ASC);

CREATE INDEX `fk_intérvention_has_piéce_intérvention1_idx` ON `auto_entrepreneur`.`piéce utilisé` (`IN_ID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;