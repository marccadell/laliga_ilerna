-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 13-01-2026 a las 15:39:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto-git`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `id_clasificacion` int(11) NOT NULL,
  `api_id_equipo` varchar(50) NOT NULL,
  `posicion` int(11) NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `jugados` int(11) NOT NULL DEFAULT 0,
  `ganados` int(11) NOT NULL DEFAULT 0,
  `empatados` int(11) NOT NULL DEFAULT 0,
  `perdidos` int(11) NOT NULL DEFAULT 0,
  `goles_favor` int(11) NOT NULL DEFAULT 0,
  `goles_contra` int(11) NOT NULL DEFAULT 0,
  `diferencia_goles` int(11) NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id_contacto` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mensaje` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `api_id_equipo` varchar(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `escudo_url` varchar(255) DEFAULT NULL,
  `estadio` varchar(150) DEFAULT NULL,
  `ciudad` varchar(150) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partido` int(11) NOT NULL,
  `api_id_partido` varchar(50) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `jornada` varchar(100) DEFAULT NULL,
  `equipo_local` varchar(150) NOT NULL,
  `equipo_visitante` varchar(150) NOT NULL,
  `goles_local` int(11) DEFAULT NULL,
  `goles_visitante` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'SCHEDULED',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sync_status`
--

CREATE TABLE `sync_status` (
  `cache_key` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_updating` tinyint(1) NOT NULL DEFAULT 0,
  `updating_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sync_status`
--

INSERT INTO `sync_status` (`cache_key`, `updated_at`, `is_updating`, `updating_at`) VALUES
('events', NULL, 0, NULL),
('standings', NULL, 0, NULL),
('teams', NULL, 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id_clasificacion`),
  ADD UNIQUE KEY `uq_clasificacion_api_id_equipo` (`api_id_equipo`),
  ADD KEY `idx_clasificacion_posicion` (`posicion`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `idx_contactos_email` (`email`),
  ADD KEY `idx_contactos_created_at` (`created_at`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD UNIQUE KEY `uq_equipos_api_id_equipo` (`api_id_equipo`),
  ADD KEY `idx_equipos_nombre` (`nombre`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partido`),
  ADD UNIQUE KEY `uq_partidos_api_id_partido` (`api_id_partido`),
  ADD KEY `idx_partidos_fecha` (`fecha`),
  ADD KEY `idx_partidos_estado` (`estado`),
  ADD KEY `idx_partidos_jornada` (`jornada`),
  ADD KEY `idx_partidos_local` (`equipo_local`),
  ADD KEY `idx_partidos_visitante` (`equipo_visitante`);

--
-- Indices de la tabla `sync_status`
--
ALTER TABLE `sync_status`
  ADD PRIMARY KEY (`cache_key`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `fk_clasificacion_equipos` FOREIGN KEY (`api_id_equipo`) REFERENCES `equipos` (`api_id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
