-- Configurações iniciais para evitar conflitos de chaves únicas e estrangeiras durante a criação das tabelas
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Criação do schema 'sabordigitaldb' se não existir
CREATE SCHEMA IF NOT EXISTS `sabordigitaldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sabordigitaldb` ;

-- Criação da tabela 'categorias'
CREATE TABLE IF NOT EXISTS `sabordigitaldb`.`categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT, -- Chave primária
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Criação da tabela 'dishes'
CREATE TABLE IF NOT EXISTS `sabordigitaldb`.`dishes` (
  `id` BIGINT NOT NULL AUTO_INCREMENT, -- Chave primária
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  `url_image` VARCHAR(255) NULL DEFAULT NULL,
  `categoria_id` BIGINT NULL DEFAULT NULL, -- Chave estrangeira
  PRIMARY KEY (`id`),
  INDEX `FKs5mreusxypujg4bj2xa7ja0bd` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `FKs5mreusxypujg4bj2xa7ja0bd`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `sabordigitaldb`.`categorias` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Criação da tabela 'order_status'
CREATE TABLE IF NOT EXISTS `sabordigitaldb`.`order_status` (
  `id` BIGINT NOT NULL AUTO_INCREMENT, -- Chave primária
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UKbh2e1xhrxgk9lff9b5pa73t8p` (`name` ASC) VISIBLE) -- Índice único
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Criação da tabela 'orders'
CREATE TABLE IF NOT EXISTS `sabordigitaldb`.`orders` (
  `id` BIGINT NOT NULL AUTO_INCREMENT, -- Chave primária
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `customer_name` VARCHAR(255) NULL DEFAULT NULL,
  `order_name` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `dish_id` BIGINT NULL DEFAULT NULL, -- Chave estrangeira
  `status_id` BIGINT NULL DEFAULT NULL, -- Chave estrangeira
  PRIMARY KEY (`id`),
  INDEX `FK9jv57worcx6rqcdenldm4gant` (`dish_id` ASC) VISIBLE,
  INDEX `FK1abokg3ghque9pf2ujbxakng` (`status_id` ASC) VISIBLE,
  CONSTRAINT `FK1abokg3ghque9pf2ujbxakng`
    FOREIGN KEY (`status_id`)
    REFERENCES `sabordigitaldb`.`order_status` (`id`),
  CONSTRAINT `FK9jv57worcx6rqcdenldm4gant`
    FOREIGN KEY (`dish_id`)
    REFERENCES `sabordigitaldb`.`dishes` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Restaurando as configurações originais
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
