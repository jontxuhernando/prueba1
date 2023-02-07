-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-01-2023 a las 08:58:01
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionventas`
--
CREATE DATABASE IF NOT EXISTS `gestionventas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `gestionventas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido1` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido2` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `categoría` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `categoría`) VALUES
(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100),
(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200),
(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300),
(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200),
(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100),
(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300),
(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225),
(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comercial`
--

CREATE TABLE IF NOT EXISTS `comercial` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido1` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido2` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `comisión` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `comercial`
--

INSERT INTO `comercial` (`id`, `nombre`, `apellido1`, `apellido2`, `comisión`) VALUES
(1, 'Daniel', 'Sáez', 'Vega', 0.15),
(2, 'Juan', 'Gómez', 'López', 0.13),
(3, 'Diego', 'Flores', 'Salas', 0.11),
(4, 'Marta', 'Herrera', 'Gil', 0.14),
(5, 'Antonio', 'Carretero', 'Ortega', 0.12),
(6, 'Manuel', 'Domínguez', 'Hernández', 0.13),
(7, 'Antonio', 'Vega', 'Hernández', 0.11),
(8, 'Alfredo', 'Ruiz', 'Flores', 0.05);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_comercial` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_comercial` (`id_comercial`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `total`, `fecha`, `id_cliente`, `id_comercial`) VALUES
(1, 150.5, '2017-10-05', 5, 2),
(2, 270.65, '2016-09-10', 1, 5),
(3, 65.26, '2017-10-05', 2, 1),
(4, 110.5, '2016-08-17', 8, 3),
(5, 948.5, '2017-09-10', 5, 2),
(6, 2400.6, '2016-07-27', 7, 1),
(7, 5760, '2015-09-10', 2, 1),
(8, 1983.43, '2017-10-10', 4, 6),
(9, 2480.4, '2016-10-10', 8, 3),
(10, 250.45, '2015-06-27', 8, 2),
(11, 75.29, '2016-08-17', 3, 7),
(12, 3045.6, '2017-04-25', 2, 1),
(13, 545.75, '2019-01-25', 6, 1),
(14, 145.82, '2017-02-02', 6, 1),
(15, 370.85, '2019-03-11', 1, 5),
(16, 2389.23, '2019-03-11', 1, 5);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_comercial`) REFERENCES `comercial` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
