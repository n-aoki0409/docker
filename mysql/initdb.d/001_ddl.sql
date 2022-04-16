SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=1;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=1;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Create schema `test_db`
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS test_db;
CREATE SCHEMA test_db;

-- -----------------------------------------------------
-- Use schema `test_db`
-- -----------------------------------------------------
use test_db

-- -----------------------------------------------------
-- Table `USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `USER_LOGIN_ID_UNIQUE` (`login_id`))
  ENGINE=InnoDB;