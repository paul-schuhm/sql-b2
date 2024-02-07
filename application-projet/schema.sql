-- MySQL Workbench Forward Engineering
-- Le schéma a été généré avec MySQL Workbench à partir d'un modèle

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema game
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema game
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `game` ;
USE `game` ;

-- -----------------------------------------------------
-- Table `game`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game`.`user` ;

CREATE TABLE IF NOT EXISTS `game`.`user` (
  `user_id` INT NOT NULL,
  `pseudo` VARCHAR(32) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `pseudo_UNIQUE` (`pseudo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game`.`criterion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game`.`criterion` ;

CREATE TABLE IF NOT EXISTS `game`.`criterion` (
  `criterion_id` INT NOT NULL,
  `label` VARCHAR(22) NULL,
  PRIMARY KEY (`criterion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game`.`game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game`.`game` ;

CREATE TABLE IF NOT EXISTS `game`.`game` (
  `game_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`game_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game`.`rate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game`.`rate` ;

CREATE TABLE IF NOT EXISTS `game`.`rate` (
  `user_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `criterion_id` INT NOT NULL,
  `value` VARCHAR(45) NOT NULL CHECK (value BETWEEN 0 AND 5),
  PRIMARY KEY (`user_id`, `game_id`, `criterion_id`),
  INDEX `fk_user_has_game_game1_idx` (`game_id` ASC) VISIBLE,
  INDEX `fk_user_has_game_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_rate_criterion1_idx` (`criterion_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_game_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `game`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_game_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `game`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rate_criterion1`
    FOREIGN KEY (`criterion_id`)
    REFERENCES `game`.`criterion` (`criterion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

