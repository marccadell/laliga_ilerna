-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 17-01-2026 a las 17:05:02
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
-- Base de datos: `proyectogit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competitions`
--

CREATE TABLE `competitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `country_code` char(2) NOT NULL,
  `rules` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `name`, `country_code`, `rules`, `created_at`, `updated_at`) VALUES
(1, 'laliga-easports', 'LALIGA EA SPORTS', 'ES', '{\"points\":{\"win\":3,\"draw\":1,\"loss\":0},\"total_matchdays\":38,\"teams\":20,\"tiebreakers\":[\"points\",\"head_to_head_points\",\"head_to_head_goal_difference\",\"goal_difference\",\"goals_for\",\"fair_play\"]}', '2026-01-17 15:57:59', '2026-01-17 15:57:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matches`
--

CREATE TABLE `matches` (
  `id` int(10) UNSIGNED NOT NULL,
  `season_id` int(10) UNSIGNED NOT NULL,
  `matchday` smallint(5) UNSIGNED NOT NULL,
  `utc_date` datetime DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `local_date` datetime DEFAULT NULL,
  `venue` varchar(128) DEFAULT NULL,
  `home_team_id` int(10) UNSIGNED NOT NULL,
  `away_team_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'scheduled',
  `ft_home` tinyint(3) UNSIGNED DEFAULT NULL,
  `ft_away` tinyint(3) UNSIGNED DEFAULT NULL,
  `ht_home` tinyint(3) UNSIGNED DEFAULT NULL,
  `ht_away` tinyint(3) UNSIGNED DEFAULT NULL,
  `winner` varchar(8) DEFAULT NULL,
  `points_home` tinyint(3) UNSIGNED DEFAULT NULL,
  `points_away` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `matches`
--

INSERT INTO `matches` (`id`, `season_id`, `matchday`, `utc_date`, `timezone`, `local_date`, `venue`, `home_team_id`, `away_team_id`, `status`, `ft_home`, `ft_away`, `ht_home`, `ht_away`, `winner`, `points_home`, `points_away`, `updated_at`) VALUES
(1, 20252026, 1, '2025-08-15 17:00:00', 'Europe/Madrid', '2025-08-15 19:00:00', 'Estadio Municipal de Montilivi', 9, 11, 'finished', 1, 3, 0, 3, 'away', 0, 3, '2026-01-17 16:02:02'),
(2, 20252026, 1, '2025-08-15 19:30:00', 'Europe/Madrid', '2025-08-15 21:30:00', 'Estadio de la Cerámica', 20, 16, 'finished', 2, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(3, 20252026, 1, '2025-08-16 19:30:00', 'Europe/Madrid', '2025-08-16 21:30:00', 'Mendizorroza', 5, 10, 'finished', 2, 1, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(4, 20252026, 1, '2025-08-16 17:30:00', 'Europe/Madrid', '2025-08-16 19:30:00', 'Estadi Mallorca Son Moix', 13, 7, 'finished', 0, 3, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(5, 20252026, 1, '2025-08-16 19:30:00', 'Europe/Madrid', '2025-08-16 21:30:00', 'Camp de Mestalla', 19, 17, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(6, 20252026, 1, '2025-08-17 15:00:00', 'Europe/Madrid', '2025-08-17 17:00:00', 'Estadio ABANCA Balaídos', 4, 8, 'finished', 0, 2, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(7, 20252026, 1, '2025-08-17 17:30:00', 'Europe/Madrid', '2025-08-17 19:30:00', 'Estadio San Mamés', 1, 18, 'finished', 3, 2, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(8, 20252026, 1, '2025-08-17 19:30:00', 'Europe/Madrid', '2025-08-17 21:30:00', 'RCDE Stadium', 12, 2, 'finished', 2, 1, 0, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(9, 20252026, 1, '2025-08-18 19:00:00', 'Europe/Madrid', '2025-08-18 21:00:00', 'Estadio Martínez Valero', 6, 14, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(10, 20252026, 1, '2025-08-19 19:00:00', 'Europe/Madrid', '2025-08-19 21:00:00', 'Estadio Santiago Bernabéu', 15, 3, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(11, 20252026, 2, '2025-08-25 17:30:00', 'Europe/Madrid', '2025-08-25 19:30:00', 'Estadio San Mamés', 1, 11, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(12, 20252026, 2, '2025-08-23 17:30:00', 'Europe/Madrid', '2025-08-23 19:30:00', 'Riyadh Air Metropolitano', 2, 6, 'finished', 1, 1, 1, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(13, 20252026, 2, '2025-08-24 15:00:00', 'Europe/Madrid', '2025-08-24 17:00:00', 'Estadio El Sadar', 3, 19, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(14, 20252026, 2, '2025-08-24 19:30:00', 'Europe/Madrid', '2025-08-24 21:30:00', 'Estadio Carlos Tartiere', 16, 15, 'finished', 0, 3, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(15, 20252026, 2, '2025-08-22 19:30:00', 'Europe/Madrid', '2025-08-22 21:30:00', 'Estadio Olímpico de La Cartuja', 14, 5, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(16, 20252026, 2, '2025-08-23 19:30:00', 'Europe/Madrid', '2025-08-23 21:30:00', 'Estadio Ciutat de València', 10, 7, 'finished', 2, 3, 2, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(17, 20252026, 2, '2025-08-23 15:00:00', 'Europe/Madrid', '2025-08-23 17:00:00', 'Estadi Mallorca Son Moix', 13, 4, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(18, 20252026, 2, '2025-08-24 17:30:00', 'Europe/Madrid', '2025-08-24 19:30:00', 'Anoeta', 17, 12, 'finished', 2, 2, 0, 2, 'draw', 1, 1, '2026-01-17 16:02:02'),
(19, 20252026, 2, '2025-08-25 19:30:00', 'Europe/Madrid', '2025-08-25 21:30:00', 'Ramón Sánchez-Pizjuán', 18, 8, 'finished', 1, 2, 1, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(20, 20252026, 2, '2025-08-24 17:30:00', 'Europe/Madrid', '2025-08-24 19:30:00', 'Estadio de la Cerámica', 20, 9, 'finished', 5, 0, 4, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(21, 20252026, 3, '2025-08-30 15:00:00', 'Europe/Madrid', '2025-08-30 17:00:00', 'Mendizorroza', 5, 2, 'finished', 1, 1, 1, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(22, 20252026, 3, '2025-08-31 15:00:00', 'Europe/Madrid', '2025-08-31 17:00:00', 'Estadio ABANCA Balaídos', 4, 20, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(23, 20252026, 3, '2025-08-29 17:30:00', 'Europe/Madrid', '2025-08-29 19:30:00', 'Estadio Martínez Valero', 6, 10, 'finished', 2, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(24, 20252026, 3, '2025-08-31 17:30:00', 'Europe/Madrid', '2025-08-31 19:30:00', 'RCDE Stadium', 12, 3, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(25, 20252026, 3, '2025-08-30 17:30:00', 'Europe/Madrid', '2025-08-30 19:30:00', 'Estadio Municipal de Montilivi', 9, 18, 'finished', 0, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(26, 20252026, 3, '2025-08-30 17:00:00', 'Europe/Madrid', '2025-08-30 19:00:00', 'Estadio Carlos Tartiere', 16, 17, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(27, 20252026, 3, '2025-08-31 17:00:00', 'Europe/Madrid', '2025-08-31 19:00:00', 'Estadio Olímpico de La Cartuja', 14, 1, 'finished', 1, 2, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(28, 20252026, 3, '2025-08-31 19:30:00', 'Europe/Madrid', '2025-08-31 21:30:00', 'Estadio de Vallecas', 11, 7, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(29, 20252026, 3, '2025-08-29 19:30:00', 'Europe/Madrid', '2025-08-29 21:30:00', 'Camp de Mestalla', 19, 8, 'finished', 3, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(30, 20252026, 3, '2025-08-30 19:30:00', 'Europe/Madrid', '2025-08-30 21:30:00', 'Estadio Santiago Bernabéu', 15, 13, 'finished', 2, 1, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(31, 20252026, 4, '2025-09-13 19:00:00', 'Europe/Madrid', '2025-09-13 21:00:00', 'Riyadh Air Metropolitano', 2, 20, 'finished', 2, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(32, 20252026, 4, '2025-09-14 19:00:00', 'Europe/Madrid', '2025-09-14 21:00:00', 'Estadi Johan Cruyff', 7, 19, 'finished', 6, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(33, 20252026, 4, '2025-09-14 12:00:00', 'Europe/Madrid', '2025-09-14 14:00:00', 'Estadio ABANCA Balaídos', 4, 9, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(34, 20252026, 4, '2025-09-15 19:00:00', 'Europe/Madrid', '2025-09-15 21:00:00', 'RCDE Stadium', 12, 13, 'finished', 3, 2, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(35, 20252026, 4, '2025-09-13 12:00:00', 'Europe/Madrid', '2025-09-13 14:00:00', 'Coliseum', 8, 16, 'finished', 2, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(36, 20252026, 4, '2025-09-14 16:30:00', 'Europe/Madrid', '2025-09-14 18:30:00', 'Estadio El Sadar', 3, 11, 'finished', 2, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(37, 20252026, 4, '2025-09-13 16:30:00', 'Europe/Madrid', '2025-09-13 18:30:00', 'Estadio San Mamés', 1, 5, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(38, 20252026, 4, '2025-09-14 14:15:00', 'Europe/Madrid', '2025-09-14 16:15:00', 'Estadio Ciutat de València', 10, 14, 'finished', 2, 2, 2, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(39, 20252026, 4, '2025-09-12 19:00:00', 'Europe/Madrid', '2025-09-12 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 6, 'finished', 2, 2, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(40, 20252026, 4, '2025-09-13 14:15:00', 'Europe/Madrid', '2025-09-13 16:15:00', 'Anoeta', 17, 15, 'finished', 1, 2, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(41, 20252026, 5, '2025-09-20 16:30:00', 'Europe/Madrid', '2025-09-20 18:30:00', 'Mendizorroza', 5, 18, 'finished', 1, 2, 1, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(42, 20252026, 5, '2025-09-21 19:00:00', 'Europe/Madrid', '2025-09-21 21:00:00', 'Estadi Johan Cruyff', 7, 8, 'finished', 3, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(43, 20252026, 5, '2025-09-19 19:00:00', 'Europe/Madrid', '2025-09-19 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 17, 'finished', 3, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(44, 20252026, 5, '2025-09-21 16:15:00', 'Europe/Madrid', '2025-09-21 18:15:00', 'Estadio Martínez Valero', 6, 16, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(45, 20252026, 5, '2025-09-20 12:00:00', 'Europe/Madrid', '2025-09-20 14:00:00', 'Estadio Municipal de Montilivi', 9, 10, 'finished', 0, 4, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(46, 20252026, 5, '2025-09-20 19:00:00', 'Europe/Madrid', '2025-09-20 21:00:00', 'Camp de Mestalla', 19, 1, 'finished', 2, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(47, 20252026, 5, '2025-09-21 14:15:00', 'Europe/Madrid', '2025-09-21 16:15:00', 'Estadi Mallorca Son Moix', 13, 2, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(48, 20252026, 5, '2025-09-21 12:00:00', 'Europe/Madrid', '2025-09-21 14:00:00', 'Estadio de Vallecas', 11, 4, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(49, 20252026, 5, '2025-09-20 14:15:00', 'Europe/Madrid', '2025-09-20 16:15:00', 'Estadio Santiago Bernabéu', 15, 12, 'finished', 2, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(50, 20252026, 5, '2025-09-20 16:30:00', 'Europe/Madrid', '2025-09-20 18:30:00', 'Estadio de la Cerámica', 20, 3, 'finished', 2, 1, 0, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(51, 20252026, 6, '2025-09-23 17:00:00', 'Europe/Madrid', '2025-09-23 19:00:00', 'Estadio San Mamés', 1, 9, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(52, 20252026, 6, '2025-09-24 19:30:00', 'Europe/Madrid', '2025-09-24 21:30:00', 'Riyadh Air Metropolitano', 2, 11, 'finished', 3, 2, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(53, 20252026, 6, '2025-09-23 17:00:00', 'Europe/Madrid', '2025-09-23 19:00:00', 'RCDE Stadium', 12, 19, 'finished', 2, 2, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(54, 20252026, 6, '2025-09-23 19:30:00', 'Europe/Madrid', '2025-09-23 21:30:00', 'Estadio Ciutat de València', 10, 15, 'finished', 1, 4, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(55, 20252026, 6, '2025-09-23 19:30:00', 'Europe/Madrid', '2025-09-23 21:30:00', 'Ramón Sánchez-Pizjuán', 18, 20, 'finished', 1, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(56, 20252026, 6, '2025-09-24 17:00:00', 'Europe/Madrid', '2025-09-24 19:00:00', 'Coliseum', 8, 5, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(57, 20252026, 6, '2025-09-25 19:30:00', 'Europe/Madrid', '2025-09-25 21:30:00', 'Estadio Carlos Tartiere', 16, 7, 'finished', 1, 3, 1, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(58, 20252026, 6, '2025-08-27 19:00:00', 'Europe/Madrid', '2025-08-27 21:00:00', 'Estadio ABANCA Balaídos', 4, 14, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(59, 20252026, 6, '2025-09-25 17:30:00', 'Europe/Madrid', '2025-09-25 19:30:00', 'Estadio El Sadar', 3, 6, 'finished', 1, 1, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(60, 20252026, 6, '2025-09-24 19:30:00', 'Europe/Madrid', '2025-09-24 21:30:00', 'Anoeta', 17, 13, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(61, 20252026, 7, '2025-09-27 14:15:00', 'Europe/Madrid', '2025-09-27 16:15:00', 'Riyadh Air Metropolitano', 2, 15, 'finished', 5, 2, 2, 2, 'home', 3, 0, '2026-01-17 16:02:02'),
(62, 20252026, 7, '2025-09-28 16:30:00', 'Europe/Madrid', '2025-09-28 18:30:00', 'Estadi Olímpic Lluís Companys', 7, 17, 'finished', 2, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(63, 20252026, 7, '2025-09-28 19:00:00', 'Europe/Madrid', '2025-09-28 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 3, 'finished', 2, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(64, 20252026, 7, '2025-09-27 12:00:00', 'Europe/Madrid', '2025-09-27 14:00:00', 'Coliseum', 8, 10, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(65, 20252026, 7, '2025-09-28 12:00:00', 'Europe/Madrid', '2025-09-28 14:00:00', 'Estadio de Vallecas', 11, 18, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(66, 20252026, 7, '2025-09-27 16:30:00', 'Europe/Madrid', '2025-09-27 18:30:00', 'Estadi Mallorca Son Moix', 13, 5, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(67, 20252026, 7, '2025-09-27 19:00:00', 'Europe/Madrid', '2025-09-27 21:00:00', 'Estadio de la Cerámica', 20, 1, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(68, 20252026, 7, '2025-09-28 14:15:00', 'Europe/Madrid', '2025-09-28 16:15:00', 'Estadio Martínez Valero', 6, 4, 'finished', 2, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(69, 20252026, 7, '2025-09-26 19:00:00', 'Europe/Madrid', '2025-09-26 21:00:00', 'Estadio Municipal de Montilivi', 9, 12, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(70, 20252026, 7, '2025-09-30 18:00:00', 'Europe/Madrid', '2025-09-30 20:00:00', 'Camp de Mestalla', 19, 16, 'finished', 1, 2, 1, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(71, 20252026, 8, '2025-10-05 12:00:00', 'Europe/Madrid', '2025-10-05 14:00:00', 'Mendizorroza', 5, 6, 'finished', 3, 1, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(72, 20252026, 8, '2025-10-04 16:30:00', 'Europe/Madrid', '2025-10-04 18:30:00', 'Estadio San Mamés', 1, 13, 'finished', 2, 1, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(73, 20252026, 8, '2025-10-04 14:15:00', 'Europe/Madrid', '2025-10-04 16:15:00', 'Estadio Municipal de Montilivi', 9, 19, 'finished', 2, 1, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(74, 20252026, 8, '2025-10-04 19:00:00', 'Europe/Madrid', '2025-10-04 21:00:00', 'Estadio Santiago Bernabéu', 15, 20, 'finished', 3, 1, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(75, 20252026, 8, '2025-10-05 19:00:00', 'Europe/Madrid', '2025-10-05 21:00:00', 'Estadio ABANCA Balaídos', 4, 2, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(76, 20252026, 8, '2025-10-05 14:15:00', 'Europe/Madrid', '2025-10-05 16:15:00', 'Ramón Sánchez-Pizjuán', 18, 7, 'finished', 4, 1, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(77, 20252026, 8, '2025-10-05 16:30:00', 'Europe/Madrid', '2025-10-05 18:30:00', 'RCDE Stadium', 12, 14, 'finished', 1, 2, 1, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(78, 20252026, 8, '2025-10-03 19:00:00', 'Europe/Madrid', '2025-10-03 21:00:00', 'Estadio El Sadar', 3, 8, 'finished', 2, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(79, 20252026, 8, '2025-10-04 12:00:00', 'Europe/Madrid', '2025-10-04 14:00:00', 'Estadio Carlos Tartiere', 16, 10, 'finished', 0, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(80, 20252026, 8, '2025-10-05 16:30:00', 'Europe/Madrid', '2025-10-05 18:30:00', 'Anoeta', 17, 11, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(81, 20252026, 9, '2025-10-20 19:00:00', 'Europe/Madrid', '2025-10-20 21:00:00', 'Mendizorroza', 5, 19, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(82, 20252026, 9, '2025-10-18 19:00:00', 'Europe/Madrid', '2025-10-18 21:00:00', 'Riyadh Air Metropolitano', 2, 3, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(83, 20252026, 9, '2025-10-18 14:15:00', 'Europe/Madrid', '2025-10-18 16:15:00', 'Estadi Olímpic Lluís Companys', 7, 9, 'finished', 2, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(84, 20252026, 9, '2025-10-19 14:15:00', 'Europe/Madrid', '2025-10-19 16:15:00', 'Estadio ABANCA Balaídos', 4, 17, 'finished', 1, 1, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(85, 20252026, 9, '2025-10-19 19:00:00', 'Europe/Madrid', '2025-10-19 21:00:00', 'Coliseum', 8, 15, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(86, 20252026, 9, '2025-10-19 16:30:00', 'Europe/Madrid', '2025-10-19 18:30:00', 'Estadio Ciutat de València', 10, 11, 'finished', 0, 3, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(87, 20252026, 9, '2025-10-19 12:00:00', 'Europe/Madrid', '2025-10-19 14:00:00', 'Estadio Martínez Valero', 6, 1, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(88, 20252026, 9, '2025-10-18 16:30:00', 'Europe/Madrid', '2025-10-18 18:30:00', 'Estadio de la Cerámica', 20, 14, 'finished', 2, 2, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(89, 20252026, 9, '2025-10-17 19:00:00', 'Europe/Madrid', '2025-10-17 21:00:00', 'Estadio Carlos Tartiere', 16, 12, 'finished', 0, 2, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(90, 20252026, 9, '2025-10-18 12:00:00', 'Europe/Madrid', '2025-10-18 14:00:00', 'Ramón Sánchez-Pizjuán', 18, 13, 'finished', 1, 3, 1, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(91, 20252026, 10, '2025-10-25 16:30:00', 'Europe/Madrid', '2025-10-25 18:30:00', 'Estadio San Mamés', 1, 8, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(92, 20252026, 10, '2025-10-25 12:00:00', 'Europe/Madrid', '2025-10-25 14:00:00', 'Estadio Municipal de Montilivi', 9, 16, 'finished', 3, 3, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(93, 20252026, 10, '2025-10-24 19:00:00', 'Europe/Madrid', '2025-10-24 21:00:00', 'Anoeta', 17, 18, 'finished', 2, 1, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(94, 20252026, 10, '2025-10-25 19:00:00', 'Europe/Madrid', '2025-10-25 21:00:00', 'Camp de Mestalla', 19, 20, 'finished', 0, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(95, 20252026, 10, '2025-10-26 20:00:00', 'Europe/Madrid', '2025-10-26 21:00:00', 'Estadio de Vallecas', 11, 5, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(96, 20252026, 10, '2025-10-27 20:00:00', 'Europe/Madrid', '2025-10-27 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 2, 'finished', 0, 2, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(97, 20252026, 10, '2025-10-26 15:15:00', 'Europe/Madrid', '2025-10-26 16:15:00', 'Estadio Santiago Bernabéu', 15, 7, 'finished', 2, 1, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(98, 20252026, 10, '2025-10-26 17:30:00', 'Europe/Madrid', '2025-10-26 18:30:00', 'Estadio El Sadar', 3, 4, 'finished', 2, 3, 2, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(99, 20252026, 10, '2025-10-25 14:15:00', 'Europe/Madrid', '2025-10-25 16:15:00', 'RCDE Stadium', 12, 6, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(100, 20252026, 10, '2025-10-26 13:00:00', 'Europe/Madrid', '2025-10-26 14:00:00', 'Estadi Mallorca Son Moix', 13, 10, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(101, 20252026, 11, '2025-11-02 15:15:00', 'Europe/Madrid', '2025-11-02 16:15:00', 'Mendizorroza', 5, 12, 'finished', 2, 1, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(102, 20252026, 11, '2025-11-01 15:15:00', 'Europe/Madrid', '2025-11-01 16:15:00', 'Riyadh Air Metropolitano', 2, 18, 'finished', 3, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(103, 20252026, 11, '2025-11-02 17:30:00', 'Europe/Madrid', '2025-11-02 18:30:00', 'Estadi Olímpic Lluís Companys', 7, 6, 'finished', 3, 1, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(104, 20252026, 11, '2025-11-02 20:00:00', 'Europe/Madrid', '2025-11-02 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 13, 'finished', 3, 0, 3, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(105, 20252026, 11, '2025-10-31 20:00:00', 'Europe/Madrid', '2025-10-31 21:00:00', 'Coliseum', 8, 9, 'finished', 2, 1, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(106, 20252026, 11, '2025-11-01 20:00:00', 'Europe/Madrid', '2025-11-01 21:00:00', 'Estadio Santiago Bernabéu', 15, 19, 'finished', 4, 0, 3, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(107, 20252026, 11, '2025-11-01 17:30:00', 'Europe/Madrid', '2025-11-01 18:30:00', 'Anoeta', 17, 1, 'finished', 3, 2, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(108, 20252026, 11, '2025-11-02 13:00:00', 'Europe/Madrid', '2025-11-02 14:00:00', 'Estadio Ciutat de València', 10, 4, 'finished', 1, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(109, 20252026, 11, '2025-11-03 20:00:00', 'Europe/Madrid', '2025-11-03 21:00:00', 'Estadio Carlos Tartiere', 16, 3, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(110, 20252026, 11, '2025-11-01 13:00:00', 'Europe/Madrid', '2025-11-01 14:00:00', 'Estadio de la Cerámica', 20, 11, 'finished', 4, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(111, 20252026, 12, '2025-11-09 13:00:00', 'Europe/Madrid', '2025-11-09 14:00:00', 'Estadio San Mamés', 1, 16, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(112, 20252026, 12, '2025-11-08 17:30:00', 'Europe/Madrid', '2025-11-08 18:30:00', 'Riyadh Air Metropolitano', 2, 10, 'finished', 3, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(113, 20252026, 12, '2025-11-07 20:00:00', 'Europe/Madrid', '2025-11-07 21:00:00', 'Estadio Martínez Valero', 6, 17, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(114, 20252026, 12, '2025-11-08 20:00:00', 'Europe/Madrid', '2025-11-08 21:00:00', 'RCDE Stadium', 12, 20, 'finished', 0, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(115, 20252026, 12, '2025-11-09 15:15:00', 'Europe/Madrid', '2025-11-09 16:15:00', 'Estadio de Vallecas', 11, 15, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(116, 20252026, 12, '2025-11-08 13:00:00', 'Europe/Madrid', '2025-11-08 14:00:00', 'Estadio Municipal de Montilivi', 9, 5, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(117, 20252026, 12, '2025-11-09 20:00:00', 'Europe/Madrid', '2025-11-09 21:00:00', 'Estadio ABANCA Balaídos', 4, 7, 'finished', 2, 4, 2, 3, 'away', 0, 3, '2026-01-17 16:02:02'),
(118, 20252026, 12, '2025-11-09 17:30:00', 'Europe/Madrid', '2025-11-09 18:30:00', 'Camp de Mestalla', 19, 14, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(119, 20252026, 12, '2025-11-09 17:30:00', 'Europe/Madrid', '2025-11-09 18:30:00', 'Estadi Mallorca Son Moix', 13, 8, 'finished', 1, 1, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(120, 20252026, 12, '2025-11-08 15:15:00', 'Europe/Madrid', '2025-11-08 16:15:00', 'Ramón Sánchez-Pizjuán', 18, 3, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(121, 20252026, 13, '2025-11-22 13:00:00', 'Europe/Madrid', '2025-11-22 14:00:00', 'Mendizorroza', 5, 4, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(122, 20252026, 13, '2025-11-23 15:15:00', 'Europe/Madrid', '2025-11-23 16:15:00', 'Estadio Olímpico de La Cartuja', 14, 9, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(123, 20252026, 13, '2025-11-23 20:00:00', 'Europe/Madrid', '2025-11-23 21:00:00', 'Estadio Martínez Valero', 6, 15, 'finished', 2, 2, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(124, 20252026, 13, '2025-11-24 20:00:00', 'Europe/Madrid', '2025-11-24 21:00:00', 'RCDE Stadium', 12, 18, 'finished', 2, 1, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(125, 20252026, 13, '2025-11-22 17:30:00', 'Europe/Madrid', '2025-11-22 18:30:00', 'Estadio El Sadar', 3, 17, 'finished', 1, 3, 1, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(126, 20252026, 13, '2025-11-23 13:00:00', 'Europe/Madrid', '2025-11-23 14:00:00', 'Estadio Carlos Tartiere', 16, 11, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(127, 20252026, 13, '2025-11-22 15:15:00', 'Europe/Madrid', '2025-11-22 16:15:00', 'Spotify Camp Nou', 7, 1, 'finished', 4, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(128, 20252026, 13, '2025-11-23 17:30:00', 'Europe/Madrid', '2025-11-23 18:30:00', 'Coliseum', 8, 2, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(129, 20252026, 13, '2025-11-21 20:00:00', 'Europe/Madrid', '2025-11-21 21:00:00', 'Camp de Mestalla', 19, 10, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(130, 20252026, 13, '2025-11-22 20:00:00', 'Europe/Madrid', '2025-11-22 21:00:00', 'Estadio de la Cerámica', 20, 13, 'finished', 2, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(131, 20252026, 14, '2025-11-29 20:00:00', 'Europe/Madrid', '2025-11-29 21:00:00', 'Riyadh Air Metropolitano', 2, 16, 'finished', 2, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(132, 20252026, 14, '2025-11-30 17:30:00', 'Europe/Madrid', '2025-11-30 18:30:00', 'Estadio ABANCA Balaídos', 4, 12, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(133, 20252026, 14, '2025-11-30 20:00:00', 'Europe/Madrid', '2025-11-30 21:00:00', 'Estadio Municipal de Montilivi', 9, 15, 'finished', 1, 1, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(134, 20252026, 14, '2025-11-29 13:00:00', 'Europe/Madrid', '2025-11-29 14:00:00', 'Estadi Mallorca Son Moix', 13, 3, 'finished', 2, 2, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(135, 20252026, 14, '2025-12-01 20:00:00', 'Europe/Madrid', '2025-12-01 21:00:00', 'Estadio de Vallecas', 11, 19, 'finished', 1, 1, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(136, 20252026, 14, '2025-11-30 13:00:00', 'Europe/Madrid', '2025-11-30 14:00:00', 'Anoeta', 17, 20, 'finished', 2, 3, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(137, 20252026, 14, '2025-11-29 15:15:00', 'Europe/Madrid', '2025-11-29 16:15:00', 'Spotify Camp Nou', 7, 5, 'finished', 3, 1, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(138, 20252026, 14, '2025-11-29 17:30:00', 'Europe/Madrid', '2025-11-29 18:30:00', 'Estadio Ciutat de València', 10, 1, 'finished', 0, 2, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(139, 20252026, 14, '2025-11-30 15:15:00', 'Europe/Madrid', '2025-11-30 16:15:00', 'Ramón Sánchez-Pizjuán', 18, 14, 'finished', 0, 2, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(140, 20252026, 14, '2025-11-28 20:00:00', 'Europe/Madrid', '2025-11-28 21:00:00', 'Coliseum', 8, 6, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(141, 20252026, 15, '2025-12-06 15:15:00', 'Europe/Madrid', '2025-12-06 16:15:00', 'Mendizorroza', 5, 17, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(142, 20252026, 15, '2025-12-06 20:00:00', 'Europe/Madrid', '2025-12-06 21:00:00', 'Estadio San Mamés', 1, 2, 'finished', 1, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(143, 20252026, 15, '2025-12-07 13:00:00', 'Europe/Madrid', '2025-12-07 14:00:00', 'Estadio Martínez Valero', 6, 9, 'finished', 3, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(144, 20252026, 15, '2025-12-07 17:30:00', 'Europe/Madrid', '2025-12-07 18:30:00', 'RCDE Stadium', 12, 11, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(145, 20252026, 15, '2025-12-06 17:30:00', 'Europe/Madrid', '2025-12-06 18:30:00', 'Estadio Olímpico de La Cartuja', 14, 7, 'finished', 3, 5, 1, 4, 'away', 0, 3, '2026-01-17 16:02:02'),
(146, 20252026, 15, '2025-12-07 20:00:00', 'Europe/Madrid', '2025-12-07 21:00:00', 'Estadio Santiago Bernabéu', 15, 4, 'finished', 0, 2, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(147, 20252026, 15, '2025-12-06 13:00:00', 'Europe/Madrid', '2025-12-06 14:00:00', 'Estadio de la Cerámica', 20, 8, 'finished', 2, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(148, 20252026, 15, '2025-12-08 20:00:00', 'Europe/Madrid', '2025-12-08 21:00:00', 'Estadio El Sadar', 3, 10, 'finished', 2, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(149, 20252026, 15, '2025-12-05 20:00:00', 'Europe/Madrid', '2025-12-05 21:00:00', 'Estadio Carlos Tartiere', 16, 13, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(150, 20252026, 15, '2025-12-07 15:15:00', 'Europe/Madrid', '2025-12-07 16:15:00', 'Camp de Mestalla', 19, 18, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(151, 20252026, 16, '2025-12-14 20:00:00', 'Europe/Madrid', '2025-12-14 21:00:00', 'Mendizorroza', 5, 15, 'finished', 1, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(152, 20252026, 16, '2025-12-13 13:00:00', 'Europe/Madrid', '2025-12-13 14:00:00', 'Riyadh Air Metropolitano', 2, 19, 'finished', 2, 1, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(153, 20252026, 16, '2025-12-13 17:30:00', 'Europe/Madrid', '2025-12-13 18:30:00', 'Spotify Camp Nou', 7, 3, 'finished', 2, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(154, 20252026, 16, '2025-12-14 17:30:00', 'Europe/Madrid', '2025-12-14 18:30:00', 'Estadio Ciutat de València', 10, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(155, 20252026, 16, '2025-12-14 15:15:00', 'Europe/Madrid', '2025-12-14 16:15:00', 'Estadio ABANCA Balaídos', 4, 1, 'finished', 2, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(156, 20252026, 16, '2025-12-15 20:00:00', 'Europe/Madrid', '2025-12-15 21:00:00', 'Estadio de Vallecas', 11, 14, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(157, 20252026, 16, '2025-12-13 15:15:00', 'Europe/Madrid', '2025-12-13 16:15:00', 'Estadi Mallorca Son Moix', 13, 6, 'finished', 3, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(158, 20252026, 16, '2025-12-13 20:00:00', 'Europe/Madrid', '2025-12-13 21:00:00', 'Coliseum', 8, 12, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(159, 20252026, 16, '2025-12-12 20:00:00', 'Europe/Madrid', '2025-12-12 21:00:00', 'Anoeta', 17, 9, 'finished', 1, 2, 1, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(160, 20252026, 16, '2025-12-14 13:00:00', 'Europe/Madrid', '2025-12-14 14:00:00', 'Ramón Sánchez-Pizjuán', 18, 16, 'finished', 4, 0, 2, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(161, 20252026, 17, '2025-12-22 20:00:00', 'Europe/Madrid', '2025-12-22 21:00:00', 'Estadio San Mamés', 1, 12, 'finished', 1, 2, 1, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(162, 20252026, 17, '2025-12-21 20:00:00', 'Europe/Madrid', '2025-12-21 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 8, 'finished', 4, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(163, 20252026, 17, '2025-12-21 17:30:00', 'Europe/Madrid', '2025-12-21 18:30:00', 'Estadio Martínez Valero', 6, 11, 'finished', 4, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(164, 20252026, 17, '2025-12-20 15:15:00', 'Europe/Madrid', '2025-12-20 16:15:00', 'Estadio Ciutat de València', 10, 17, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(165, 20252026, 17, '2025-12-20 20:00:00', 'Europe/Madrid', '2025-12-20 21:00:00', 'Estadio Santiago Bernabéu', 15, 18, 'finished', 2, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(166, 20252026, 17, '2025-12-20 17:30:00', 'Europe/Madrid', '2025-12-20 18:30:00', 'Estadio El Sadar', 3, 5, 'finished', 3, 0, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(167, 20252026, 17, '2025-12-21 13:00:00', 'Europe/Madrid', '2025-12-21 14:00:00', 'Estadio Municipal de Montilivi', 9, 2, 'finished', 0, 3, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(168, 20252026, 17, '2025-12-21 15:15:00', 'Europe/Madrid', '2025-12-21 16:15:00', 'Estadio de la Cerámica', 20, 7, 'finished', 0, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(169, 20252026, 17, '2025-12-20 13:00:00', 'Europe/Madrid', '2025-12-20 14:00:00', 'Estadio Carlos Tartiere', 16, 4, 'finished', 0, 0, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(170, 20252026, 17, '2025-12-19 20:00:00', 'Europe/Madrid', '2025-12-19 21:00:00', 'Camp de Mestalla', 19, 13, 'finished', 1, 1, 0, 1, 'draw', 1, 1, '2026-01-17 16:02:02'),
(171, 20252026, 18, '2026-01-04 17:30:00', 'Europe/Madrid', '2026-01-04 18:30:00', 'Mendizorroza', 5, 16, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(172, 20252026, 18, '2026-01-03 13:00:00', 'Europe/Madrid', '2026-01-03 14:00:00', 'Estadio ABANCA Balaídos', 4, 19, 'finished', 4, 1, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(173, 20252026, 18, '2026-01-03 17:30:00', 'Europe/Madrid', '2026-01-03 18:30:00', 'Estadio Martínez Valero', 6, 20, 'finished', 1, 3, 1, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(174, 20252026, 18, '2026-01-03 15:15:00', 'Europe/Madrid', '2026-01-03 16:15:00', 'Estadio El Sadar', 3, 1, 'finished', 1, 1, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(175, 20252026, 18, '2026-01-04 20:00:00', 'Europe/Madrid', '2026-01-04 21:00:00', 'Anoeta', 17, 2, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(176, 20252026, 18, '2026-01-03 20:00:00', 'Europe/Madrid', '2026-01-03 21:00:00', 'RCDE Stadium', 12, 7, 'finished', 0, 2, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(177, 20252026, 18, '2026-01-04 15:15:00', 'Europe/Madrid', '2026-01-04 16:15:00', 'Estadio Santiago Bernabéu', 15, 14, 'finished', 5, 1, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(178, 20252026, 18, '2026-01-02 20:00:00', 'Europe/Madrid', '2026-01-02 21:00:00', 'Estadio de Vallecas', 11, 8, 'finished', 1, 1, 1, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(179, 20252026, 18, '2026-01-04 17:30:00', 'Europe/Madrid', '2026-01-04 18:30:00', 'Estadi Mallorca Son Moix', 13, 9, 'finished', 1, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(180, 20252026, 18, '2026-01-04 13:00:00', 'Europe/Madrid', '2026-01-04 14:00:00', 'Ramón Sánchez-Pizjuán', 18, 10, 'finished', 0, 3, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(181, 20252026, 19, '2025-12-03 18:00:00', 'Europe/Madrid', '2025-12-03 19:00:00', 'Estadio San Mamés', 1, 15, 'finished', 0, 3, 0, 2, 'away', 0, 3, '2026-01-17 16:02:02'),
(182, 20252026, 19, '2026-01-09 20:00:00', 'Europe/Madrid', '2026-01-09 21:00:00', 'Coliseum', 8, 17, 'finished', 1, 2, 0, 1, 'away', 0, 3, '2026-01-17 16:02:02'),
(183, 20252026, 19, '2026-01-10 17:30:00', 'Europe/Madrid', '2026-01-10 18:30:00', 'Estadio Municipal de Montilivi', 9, 3, 'finished', 1, 0, 1, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(184, 20252026, 19, '2026-01-10 15:15:00', 'Europe/Madrid', '2026-01-10 16:15:00', 'Estadio de la Cerámica', 20, 5, 'finished', 3, 1, 0, 0, 'home', 3, 0, '2026-01-17 16:02:02'),
(185, 20252026, 19, '2025-12-02 20:00:00', 'Europe/Madrid', '2025-12-02 21:00:00', 'Spotify Camp Nou', 7, 2, 'finished', 3, 1, 1, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(186, 20252026, 19, '2026-01-10 13:00:00', 'Europe/Madrid', '2026-01-10 14:00:00', 'Estadio Carlos Tartiere', 16, 14, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(187, 20252026, 19, '2026-01-12 20:00:00', 'Europe/Madrid', '2026-01-12 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 4, 'finished', 0, 1, 0, 0, 'away', 0, 3, '2026-01-17 16:02:02'),
(188, 20252026, 19, '2026-01-10 20:00:00', 'Europe/Madrid', '2026-01-10 21:00:00', 'Camp de Mestalla', 19, 6, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(189, 20252026, 19, '2026-01-11 15:15:00', 'Europe/Madrid', '2026-01-11 16:15:00', 'Estadio Ciutat de València', 10, 12, 'finished', 1, 1, 0, 0, 'draw', 1, 1, '2026-01-17 16:02:02'),
(190, 20252026, 19, '2026-01-11 13:00:00', 'Europe/Madrid', '2026-01-11 14:00:00', 'Estadio de Vallecas', 11, 13, 'finished', 2, 1, 2, 1, 'home', 3, 0, '2026-01-17 16:02:02'),
(191, 20252026, 20, '2026-01-17 20:00:00', 'Europe/Madrid', '2026-01-17 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(192, 20252026, 20, '2026-01-18 17:30:00', 'Europe/Madrid', '2026-01-18 18:30:00', 'Estadio ABANCA Balaídos', 4, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(193, 20252026, 20, '2026-01-19 20:00:00', 'Europe/Madrid', '2026-01-19 21:00:00', 'Estadio Martínez Valero', 6, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(194, 20252026, 20, '2026-01-16 20:00:00', 'Europe/Madrid', '2026-01-16 21:00:00', 'RCDE Stadium', 12, 9, 'finished', 0, 2, NULL, NULL, 'away', 0, 3, '2026-01-17 16:02:02'),
(195, 20252026, 20, '2026-01-18 13:00:00', 'Europe/Madrid', '2026-01-18 14:00:00', 'Coliseum', 8, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(196, 20252026, 20, '2026-01-17 17:30:00', 'Europe/Madrid', '2026-01-17 18:30:00', 'Estadio El Sadar', 3, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(197, 20252026, 20, '2026-01-18 15:15:00', 'Europe/Madrid', '2026-01-18 16:15:00', 'Riyadh Air Metropolitano', 2, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(198, 20252026, 20, '2026-01-17 15:15:00', 'Europe/Madrid', '2026-01-17 16:15:00', 'Estadi Mallorca Son Moix', 13, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(199, 20252026, 20, '2026-01-18 20:00:00', 'Europe/Madrid', '2026-01-18 21:00:00', 'Anoeta', 17, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(200, 20252026, 20, '2026-01-17 13:00:00', 'Europe/Madrid', '2026-01-17 14:00:00', 'Estadio Santiago Bernabéu', 15, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(201, 20252026, 21, '2026-01-25 20:00:00', 'Europe/Madrid', '2026-01-25 21:00:00', 'Mendizorroza', 5, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(202, 20252026, 21, '2026-01-25 13:00:00', 'Europe/Madrid', '2026-01-25 14:00:00', 'Riyadh Air Metropolitano', 2, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(203, 20252026, 21, '2026-01-25 15:15:00', 'Europe/Madrid', '2026-01-25 16:15:00', 'Spotify Camp Nou', 7, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(204, 20252026, 21, '2026-01-24 17:30:00', 'Europe/Madrid', '2026-01-24 18:30:00', 'Ramón Sánchez-Pizjuán', 18, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(205, 20252026, 21, '2026-01-25 17:30:00', 'Europe/Madrid', '2026-01-25 18:30:00', 'Anoeta', 17, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(206, 20252026, 21, '2026-01-23 20:00:00', 'Europe/Madrid', '2026-01-23 21:00:00', 'Estadio Ciutat de València', 10, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(207, 20252026, 21, '2026-01-24 15:15:00', 'Europe/Madrid', '2026-01-24 16:15:00', 'Camp de Mestalla', 19, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(208, 20252026, 21, '2026-01-26 20:00:00', 'Europe/Madrid', '2026-01-26 21:00:00', 'Estadio Municipal de Montilivi', 9, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(209, 20252026, 21, '2026-01-24 13:00:00', 'Europe/Madrid', '2026-01-24 14:00:00', 'Estadio de Vallecas', 11, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(210, 20252026, 21, '2026-01-24 20:00:00', 'Europe/Madrid', '2026-01-24 21:00:00', 'Estadio de la Cerámica', 20, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(211, 20252026, 22, '2026-02-01 20:00:00', 'Europe/Madrid', '2026-02-01 21:00:00', 'Estadio San Mamés', 1, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(212, 20252026, 22, '2026-02-01 15:15:00', 'Europe/Madrid', '2026-02-01 16:15:00', 'Estadio Olímpico de La Cartuja', 14, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(213, 20252026, 22, '2026-02-02 20:00:00', 'Europe/Madrid', '2026-02-02 21:00:00', 'Estadi Mallorca Son Moix', 13, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(214, 20252026, 22, '2026-01-31 15:15:00', 'Europe/Madrid', '2026-01-31 16:15:00', 'Estadio El Sadar', 3, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(215, 20252026, 22, '2026-01-30 20:00:00', 'Europe/Madrid', '2026-01-30 21:00:00', 'RCDE Stadium', 12, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(216, 20252026, 22, '2026-01-31 17:30:00', 'Europe/Madrid', '2026-01-31 18:30:00', 'Estadio Ciutat de València', 10, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(217, 20252026, 22, '2026-01-31 17:30:00', 'Europe/Madrid', '2026-01-31 18:30:00', 'Estadio Martínez Valero', 6, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(218, 20252026, 22, '2026-02-01 17:30:00', 'Europe/Madrid', '2026-02-01 18:30:00', 'Coliseum', 8, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(219, 20252026, 22, '2026-01-31 13:00:00', 'Europe/Madrid', '2026-01-31 14:00:00', 'Estadio Carlos Tartiere', 16, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(220, 20252026, 22, '2026-02-01 13:00:00', 'Europe/Madrid', '2026-02-01 14:00:00', 'Estadio Santiago Bernabéu', 15, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(221, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Mendizorroza', 5, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(222, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Estadio San Mamés', 1, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(223, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Riyadh Air Metropolitano', 2, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(224, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Spotify Camp Nou', 7, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(225, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Estadio ABANCA Balaídos', 4, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(226, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Anoeta', 17, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(227, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Estadio de la Cerámica', 20, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(228, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(229, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Camp de Mestalla', 19, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(230, 20252026, 23, '2026-02-08 20:00:00', 'Europe/Madrid', '2026-02-08 21:00:00', 'Estadio de Vallecas', 11, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(231, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Estadio Martínez Valero', 6, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(232, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Coliseum', 8, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(233, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Estadio Ciutat de València', 10, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(234, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Estadio Santiago Bernabéu', 15, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(235, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(236, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Estadio Carlos Tartiere', 16, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(237, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Estadio de Vallecas', 11, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(238, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Estadio Municipal de Montilivi', 9, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(239, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'Estadi Mallorca Son Moix', 13, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(240, 20252026, 24, '2026-02-15 20:00:00', 'Europe/Madrid', '2026-02-15 21:00:00', 'RCDE Stadium', 12, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(241, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Mendizorroza', 5, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(242, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Estadio San Mamés', 1, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(243, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Riyadh Air Metropolitano', 2, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(244, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Spotify Camp Nou', 7, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(245, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(246, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Estadio ABANCA Balaídos', 4, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(247, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Coliseum', 8, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(248, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Estadio El Sadar', 3, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(249, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Estadio de la Cerámica', 20, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(250, 20252026, 25, '2026-02-22 20:00:00', 'Europe/Madrid', '2026-02-22 21:00:00', 'Anoeta', 17, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(251, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Spotify Camp Nou', 7, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(252, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(253, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadio Martínez Valero', 6, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(254, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadi Mallorca Son Moix', 13, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(255, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadio Ciutat de València', 10, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(256, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadio de Vallecas', 11, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(257, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadio Carlos Tartiere', 16, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(258, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadio Municipal de Montilivi', 9, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(259, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Estadio Santiago Bernabéu', 15, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(260, 20252026, 26, '2026-03-01 20:00:00', 'Europe/Madrid', '2026-03-01 21:00:00', 'Camp de Mestalla', 19, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(261, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Estadio San Mamés', 1, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(262, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Riyadh Air Metropolitano', 2, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(263, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Estadio ABANCA Balaídos', 4, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(264, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'RCDE Stadium', 12, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(265, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Camp de Mestalla', 19, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(266, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Coliseum', 8, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(267, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Estadio de la Cerámica', 20, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(268, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Estadio Ciutat de València', 10, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(269, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Estadio El Sadar', 3, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(270, 20252026, 27, '2026-03-08 20:00:00', 'Europe/Madrid', '2026-03-08 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(271, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Mendizorroza', 5, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(272, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Riyadh Air Metropolitano', 2, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(273, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Spotify Camp Nou', 7, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(274, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(275, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Estadio Carlos Tartiere', 16, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(276, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Estadio Municipal de Montilivi', 9, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(277, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Estadio Santiago Bernabéu', 15, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(278, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Estadi Mallorca Son Moix', 13, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02');
INSERT INTO `matches` (`id`, `season_id`, `matchday`, `utc_date`, `timezone`, `local_date`, `venue`, `home_team_id`, `away_team_id`, `status`, `ft_home`, `ft_away`, `ht_home`, `ht_away`, `winner`, `points_home`, `points_away`, `updated_at`) VALUES
(279, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Estadio de Vallecas', 11, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(280, 20252026, 28, '2026-03-15 20:00:00', 'Europe/Madrid', '2026-03-15 21:00:00', 'Anoeta', 17, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(281, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Estadio San Mamés', 1, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(282, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Spotify Camp Nou', 7, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(283, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Estadio Martínez Valero', 6, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(284, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'RCDE Stadium', 12, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(285, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Estadio Ciutat de València', 10, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(286, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(287, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Estadio ABANCA Balaídos', 4, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(288, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Estadio Santiago Bernabéu', 15, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(289, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Estadio El Sadar', 3, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(290, 20252026, 29, '2026-03-22 20:00:00', 'Europe/Madrid', '2026-03-22 21:00:00', 'Estadio de la Cerámica', 20, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(291, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Mendizorroza', 5, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(292, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Riyadh Air Metropolitano', 2, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(293, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(294, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Estadio Municipal de Montilivi', 9, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(295, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Estadi Mallorca Son Moix', 13, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(296, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Estadio Carlos Tartiere', 16, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(297, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Coliseum', 8, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(298, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Camp de Mestalla', 19, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(299, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Estadio de Vallecas', 11, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(300, 20252026, 30, '2026-04-05 19:00:00', 'Europe/Madrid', '2026-04-05 21:00:00', 'Anoeta', 17, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(301, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Estadio San Mamés', 1, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(302, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Spotify Camp Nou', 7, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(303, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Estadio ABANCA Balaídos', 4, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(304, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Estadio Martínez Valero', 6, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(305, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Estadi Mallorca Son Moix', 13, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(306, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Anoeta', 17, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(307, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(308, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Estadio El Sadar', 3, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(309, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Estadio Ciutat de València', 10, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(310, 20252026, 31, '2026-04-12 19:00:00', 'Europe/Madrid', '2026-04-12 21:00:00', 'Estadio Santiago Bernabéu', 15, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(311, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Mendizorroza', 5, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(312, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(313, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'RCDE Stadium', 12, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(314, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Estadio El Sadar', 3, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(315, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Estadio de Vallecas', 11, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(316, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Riyadh Air Metropolitano', 2, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(317, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Coliseum', 8, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(318, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Estadio de la Cerámica', 20, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(319, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Estadio Carlos Tartiere', 16, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(320, 20252026, 32, '2026-04-19 19:00:00', 'Europe/Madrid', '2026-04-19 21:00:00', 'Camp de Mestalla', 19, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(321, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadio San Mamés', 1, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(322, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Spotify Camp Nou', 7, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(323, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadio Ciutat de València', 10, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(324, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadi Mallorca Son Moix', 13, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(325, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadio Carlos Tartiere', 16, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(326, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadio Santiago Bernabéu', 15, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(327, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadio Martínez Valero', 6, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(328, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadio Municipal de Montilivi', 9, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(329, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Estadio de Vallecas', 11, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(330, 20252026, 33, '2026-04-22 19:00:00', 'Europe/Madrid', '2026-04-22 21:00:00', 'Anoeta', 17, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(331, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Mendizorroza', 5, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(332, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(333, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Estadio ABANCA Balaídos', 4, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(334, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'RCDE Stadium', 12, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(335, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Coliseum', 8, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(336, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Estadio Municipal de Montilivi', 9, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(337, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Camp de Mestalla', 19, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(338, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Estadio El Sadar', 3, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(339, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Estadio de la Cerámica', 20, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(340, 20252026, 34, '2026-05-03 19:00:00', 'Europe/Madrid', '2026-05-03 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(341, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Estadio San Mamés', 1, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(342, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Riyadh Air Metropolitano', 2, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(343, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Spotify Camp Nou', 7, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(344, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Estadio Ciutat de València', 10, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(345, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Estadi Mallorca Son Moix', 13, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(346, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Estadio Martínez Valero', 6, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(347, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Anoeta', 17, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(348, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(349, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Estadio Carlos Tartiere', 16, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(350, 20252026, 35, '2026-05-10 19:00:00', 'Europe/Madrid', '2026-05-10 21:00:00', 'Estadio de Vallecas', 11, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(351, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Mendizorroza', 5, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(352, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(353, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Estadio ABANCA Balaídos', 4, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(354, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Coliseum', 8, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(355, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Estadio Municipal de Montilivi', 9, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(356, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'RCDE Stadium', 12, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(357, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Estadio El Sadar', 3, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(358, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Camp de Mestalla', 19, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(359, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Estadio de la Cerámica', 20, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(360, 20252026, 36, '2026-05-13 19:00:00', 'Europe/Madrid', '2026-05-13 21:00:00', 'Estadio Santiago Bernabéu', 15, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(361, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Estadio San Mamés', 1, 4, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(362, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Riyadh Air Metropolitano', 2, 9, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(363, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Spotify Camp Nou', 7, 14, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(364, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Estadio Martínez Valero', 6, 8, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(365, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Estadio Ciutat de València', 10, 13, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(366, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Estadio de Vallecas', 11, 20, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(367, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Anoeta', 17, 19, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(368, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Estadio Carlos Tartiere', 16, 5, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(369, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Estadio El Sadar', 3, 12, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(370, 20252026, 37, '2026-05-17 19:00:00', 'Europe/Madrid', '2026-05-17 21:00:00', 'Ramón Sánchez-Pizjuán', 18, 15, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(371, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Mendizorroza', 5, 11, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(372, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Estadio Olímpico de La Cartuja', 14, 10, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(373, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Estadio ABANCA Balaídos', 4, 18, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(374, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'RCDE Stadium', 12, 17, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(375, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Coliseum', 8, 3, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(376, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Estadi Mallorca Son Moix', 13, 16, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(377, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Estadio Santiago Bernabéu', 15, 1, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(378, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Estadio de la Cerámica', 20, 2, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(379, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Camp de Mestalla', 19, 7, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02'),
(380, 20252026, 38, '2026-05-24 19:00:00', 'Europe/Madrid', '2026-05-24 21:00:00', 'Estadio Municipal de Montilivi', 9, 6, 'scheduled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-17 16:02:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seasons`
--

CREATE TABLE `seasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `competition_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `year_start` smallint(5) UNSIGNED NOT NULL,
  `year_end` smallint(5) UNSIGNED NOT NULL,
  `total_matchdays` tinyint(3) UNSIGNED NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seasons`
--

INSERT INTO `seasons` (`id`, `competition_id`, `name`, `year_start`, `year_end`, `total_matchdays`, `updated_at`) VALUES
(20252026, 1, '2025-2026', 2025, 2026, 38, '2026-01-17 15:57:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `simulations`
--

CREATE TABLE `simulations` (
  `id` int(10) UNSIGNED NOT NULL,
  `season_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `rules_override` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `simulation_overrides`
--

CREATE TABLE `simulation_overrides` (
  `simulation_id` int(10) UNSIGNED NOT NULL,
  `match_id` int(10) UNSIGNED NOT NULL,
  `home_score` tinyint(3) UNSIGNED NOT NULL,
  `away_score` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `standings_rows`
--

CREATE TABLE `standings_rows` (
  `snapshot_id` int(10) UNSIGNED NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `pj` smallint(5) UNSIGNED NOT NULL,
  `pg` smallint(5) UNSIGNED NOT NULL,
  `pe` smallint(5) UNSIGNED NOT NULL,
  `pp` smallint(5) UNSIGNED NOT NULL,
  `gf` smallint(5) UNSIGNED NOT NULL,
  `gc` smallint(5) UNSIGNED NOT NULL,
  `dg` smallint(6) NOT NULL,
  `pts` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `standings_rows`
--

INSERT INTO `standings_rows` (`snapshot_id`, `team_id`, `position`, `pj`, `pg`, `pe`, `pp`, `gf`, `gc`, `dg`, `pts`) VALUES
(1, 1, 8, 19, 7, 3, 9, 17, 25, -8, 24),
(1, 2, 4, 19, 11, 5, 3, 34, 17, 17, 38),
(1, 3, 15, 19, 5, 4, 10, 18, 22, -4, 19),
(1, 4, 7, 19, 7, 8, 4, 25, 20, 5, 29),
(1, 5, 16, 19, 5, 4, 10, 16, 24, -8, 19),
(1, 6, 10, 19, 5, 8, 6, 25, 24, 1, 23),
(1, 7, 1, 19, 16, 1, 2, 53, 20, 33, 49),
(1, 8, 13, 19, 6, 3, 10, 15, 25, -10, 21),
(1, 9, 9, 20, 6, 6, 8, 20, 34, -14, 24),
(1, 10, 19, 19, 3, 6, 10, 21, 30, -9, 15),
(1, 11, 11, 19, 5, 7, 7, 16, 22, -6, 22),
(1, 12, 5, 20, 10, 4, 6, 23, 22, 1, 34),
(1, 13, 17, 19, 4, 6, 9, 21, 28, -7, 18),
(1, 14, 6, 19, 7, 8, 4, 31, 25, 6, 29),
(1, 15, 2, 20, 14, 4, 2, 41, 17, 24, 46),
(1, 16, 20, 19, 2, 7, 10, 9, 28, -19, 13),
(1, 17, 12, 19, 5, 6, 8, 24, 27, -3, 21),
(1, 18, 14, 19, 6, 2, 11, 24, 30, -6, 20),
(1, 19, 18, 19, 3, 8, 8, 18, 31, -13, 17),
(1, 20, 3, 18, 13, 2, 3, 37, 17, 20, 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `standings_snapshots`
--

CREATE TABLE `standings_snapshots` (
  `id` int(10) UNSIGNED NOT NULL,
  `season_id` int(10) UNSIGNED NOT NULL,
  `matchday_ref` smallint(5) UNSIGNED DEFAULT NULL,
  `type` varchar(16) NOT NULL DEFAULT 'calculated',
  `source_name` varchar(128) DEFAULT NULL,
  `source_url` text DEFAULT NULL,
  `generated_at` datetime NOT NULL,
  `tie_break_rules` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `standings_snapshots`
--

INSERT INTO `standings_snapshots` (`id`, `season_id`, `matchday_ref`, `type`, `source_name`, `source_url`, `generated_at`, `tie_break_rules`) VALUES
(1, 20252026, 20, 'official', 'LALIGA', 'https://www.laliga.com/en-GB/laliga-easports/standing', '2026-01-17 16:02:22', '[\"points\",\"head_to_head_points\",\"head_to_head_goal_difference\",\"goal_difference\",\"goals_for\",\"fair_play\"]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `season_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `short_name` varchar(32) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `slug` varchar(64) NOT NULL,
  `crest_url` text DEFAULT NULL,
  `stadium` varchar(96) DEFAULT NULL,
  `stadium_capacity` int(10) UNSIGNED DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `stadium_lat` decimal(9,6) DEFAULT NULL,
  `stadium_lng` decimal(9,6) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `teams`
--

INSERT INTO `teams` (`id`, `season_id`, `name`, `short_name`, `code`, `slug`, `crest_url`, `stadium`, `stadium_capacity`, `city`, `stadium_lat`, `stadium_lng`, `updated_at`) VALUES
(1, 20252026, 'Athletic Club', 'Athletic', 'ATH', 'athletic-club', 'https://assets.laliga.com/assets/2019/06/07/xsmall/athletic.png', 'Estadio San Mamés', 53331, 'Bilbao', 43.264300, -2.950400, '2026-01-17 16:00:23'),
(2, 20252026, 'Atlético de Madrid', 'Atleti', 'ATM', 'atletico-de-madrid', 'https://assets.laliga.com/assets/2024/06/17/xsmall/cbc5c8cc8c3e8abd0e175c00ee53b723.png', 'Riyadh Air Metropolitano', 70692, 'Madrid', 40.436110, -3.599440, '2026-01-17 16:00:23'),
(3, 20252026, 'CA Osasuna', 'Osasuna', 'OSA', 'ca-osasuna', 'https://assets.laliga.com/assets/2019/06/07/xsmall/osasuna.png', 'Estadio El Sadar', 23516, 'Pamplona', 42.796810, -1.636510, '2026-01-17 16:00:23'),
(4, 20252026, 'RC Celta', 'Celta', 'CEL', 'rc-celta', 'https://assets.laliga.com/assets/2019/06/07/small/celta.png', 'Estadio de Balaídos', 24870, 'Vigo', 42.211800, -8.739700, '2026-01-17 16:00:23'),
(5, 20252026, 'Deportivo Alavés', 'Alavés', 'ALA', 'deportivo-alaves', 'https://assets.laliga.com/assets/2020/09/01/small/27002754a98bf535807fe49a24cc63ea.png', 'Estadio de Mendizorrotza', 19840, 'Vitoria-Gasteiz', 42.837111, -2.688044, '2026-01-17 16:00:23'),
(6, 20252026, 'Elche CF', 'Elche', 'ELC', 'elche-cf', 'https://assets.laliga.com/assets/2019/06/07/small/elche.png', 'Estadio Martínez Valero', 31388, 'Elche', 38.266940, -0.663330, '2026-01-17 16:00:23'),
(7, 20252026, 'FC Barcelona', 'Barça', 'FCB', 'fc-barcelona', 'https://assets.laliga.com/assets/2019/06/07/xsmall/barcelona.png', 'Spotify Camp Nou', 99354, 'Barcelona', 41.380900, 2.122800, '2026-01-17 16:00:23'),
(8, 20252026, 'Getafe CF', 'Getafe', 'GET', 'getafe-cf', 'https://assets.laliga.com/assets/2023/05/12/xsmall/dc59645c96bc2c9010341c16dd6d4bfa.png', 'Coliseum', 17393, 'Getafe', 40.325870, -3.714120, '2026-01-17 16:00:23'),
(9, 20252026, 'Girona FC', 'Girona', 'GIR', 'girona-fc', 'https://assets.laliga.com/assets/2022/06/22/xsmall/8f43addbb29e4a72f5e90b6edfe4728f.png', 'Estadio Municipal de Montilivi', 14624, 'Girona', 41.961390, 2.821110, '2026-01-17 16:00:23'),
(10, 20252026, 'Levante UD', 'Levante', 'LEV', 'levante-ud', 'https://assets.laliga.com/assets/2019/06/07/xsmall/levante.png', 'Estadio Ciutat de València', 26354, 'Valencia', 39.494440, -0.364170, '2026-01-17 16:00:23'),
(11, 20252026, 'Rayo Vallecano', 'Rayo', 'RAY', 'rayo-vallecano', 'https://assets.laliga.com/assets/2023/04/27/xsmall/57d9950a8745ead226c04d37235c0786.png', 'Estadio de Vallecas', 14708, 'Madrid', 40.391940, -3.658890, '2026-01-17 16:00:23'),
(12, 20252026, 'RCD Espanyol', 'Espanyol', 'ESP', 'rcd-espanyol', 'https://assets.laliga.com/assets/2025/07/02/xsmall/e9177f6edd72c6360602adbca85e442f.png', 'RCDE Stadium', 40000, 'Barcelona', 41.347780, 2.075560, '2026-01-17 16:00:23'),
(13, 20252026, 'RCD Mallorca', 'Mallorca', 'MLL', 'rcd-mallorca', 'https://assets.laliga.com/assets/2023/03/22/xsmall/013ae97735bc8e519dcf30f6826168ca.png', 'Estadi Mallorca Son Moix', 26020, 'Palma de Mallorca', 39.590000, 2.630000, '2026-01-17 16:00:23'),
(14, 20252026, 'Real Betis', 'Betis', 'BET', 'real-betis', 'https://assets.laliga.com/assets/2022/09/15/xsmall/e4a09419d3bd115b8f3dab73d480e146.png', 'Estadio Olímpico de La Cartuja', 70000, 'Sevilla', 37.417236, -6.004564, '2026-01-17 16:00:23'),
(15, 20252026, 'Real Madrid', 'Real Madrid', 'RMA', 'real-madrid', 'https://assets.laliga.com/assets/2019/06/07/xsmall/real-madrid.png', 'Estadio Santiago Bernabéu', 81044, 'Madrid', 40.453060, -3.688330, '2026-01-17 16:00:23'),
(16, 20252026, 'Real Oviedo', 'Oviedo', 'OVI', 'real-oviedo', 'https://assets.laliga.com/assets/2019/06/07/xsmall/oviedo.png', 'Estadio Carlos Tartiere', 30500, 'Oviedo', 43.360783, -5.870222, '2026-01-17 16:00:23'),
(17, 20252026, 'Real Sociedad', 'Real Sociedad', 'RSO', 'real-sociedad', 'https://assets.laliga.com/assets/2019/06/07/xsmall/real-sociedad.png', 'Anoeta (Reale Arena)', 40000, 'San Sebastián', 43.301390, -1.973610, '2026-01-17 16:00:23'),
(18, 20252026, 'Sevilla FC', 'Sevilla', 'SEV', 'sevilla-fc', 'https://assets.laliga.com/assets/2019/06/07/xsmall/sevilla.png', 'Ramón Sánchez-Pizjuán', 43883, 'Sevilla', 37.384060, -5.970560, '2026-01-17 16:00:23'),
(19, 20252026, 'Valencia CF', 'Valencia', 'VAL', 'valencia-cf', 'https://assets.laliga.com/assets/2019/06/07/xsmall/valencia.png', 'Camp de Mestalla', 49430, 'Valencia', 39.474720, -0.358060, '2026-01-17 16:00:23'),
(20, 20252026, 'Villarreal CF', 'Villarreal', 'VIL', 'villarreal-cf', 'https://assets.laliga.com/assets/2019/06/07/xsmall/villarreal.png', 'Estadio de la Cerámica', 23500, 'Villarreal', 39.944440, -0.103610, '2026-01-17 16:00:23');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_matches_with_teams`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_matches_with_teams` (
`id` int(10) unsigned
,`season_id` int(10) unsigned
,`matchday` smallint(5) unsigned
,`utc_date` datetime
,`timezone` varchar(64)
,`local_date` datetime
,`venue` varchar(128)
,`home_team_id` int(10) unsigned
,`away_team_id` int(10) unsigned
,`status` varchar(16)
,`ft_home` tinyint(3) unsigned
,`ft_away` tinyint(3) unsigned
,`ht_home` tinyint(3) unsigned
,`ht_away` tinyint(3) unsigned
,`winner` varchar(8)
,`points_home` tinyint(3) unsigned
,`points_away` tinyint(3) unsigned
,`updated_at` datetime
,`home_team_name` varchar(64)
,`away_team_name` varchar(64)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_matches_with_teams`
--
DROP TABLE IF EXISTS `v_matches_with_teams`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_matches_with_teams`  AS SELECT `m`.`id` AS `id`, `m`.`season_id` AS `season_id`, `m`.`matchday` AS `matchday`, `m`.`utc_date` AS `utc_date`, `m`.`timezone` AS `timezone`, `m`.`local_date` AS `local_date`, `m`.`venue` AS `venue`, `m`.`home_team_id` AS `home_team_id`, `m`.`away_team_id` AS `away_team_id`, `m`.`status` AS `status`, `m`.`ft_home` AS `ft_home`, `m`.`ft_away` AS `ft_away`, `m`.`ht_home` AS `ht_home`, `m`.`ht_away` AS `ht_away`, `m`.`winner` AS `winner`, `m`.`points_home` AS `points_home`, `m`.`points_away` AS `points_away`, `m`.`updated_at` AS `updated_at`, `ht`.`name` AS `home_team_name`, `at`.`name` AS `away_team_name` FROM ((`matches` `m` join `teams` `ht` on(`ht`.`id` = `m`.`home_team_id`)) join `teams` `at` on(`at`.`id` = `m`.`away_team_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_competitions_slug` (`slug`);

--
-- Indices de la tabla `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_matches_season_matchday` (`season_id`,`matchday`),
  ADD KEY `ix_matches_team_home` (`home_team_id`),
  ADD KEY `ix_matches_team_away` (`away_team_id`);

--
-- Indices de la tabla `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `simulations`
--
ALTER TABLE `simulations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_simulations_season` (`season_id`);

--
-- Indices de la tabla `simulation_overrides`
--
ALTER TABLE `simulation_overrides`
  ADD PRIMARY KEY (`simulation_id`,`match_id`),
  ADD KEY `ix_overrides_match` (`match_id`);

--
-- Indices de la tabla `standings_rows`
--
ALTER TABLE `standings_rows`
  ADD PRIMARY KEY (`snapshot_id`,`team_id`),
  ADD KEY `ix_rows_snapshot_position` (`snapshot_id`,`position`),
  ADD KEY `ix_rows_team` (`team_id`);

--
-- Indices de la tabla `standings_snapshots`
--
ALTER TABLE `standings_snapshots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_snapshots_season` (`season_id`);

--
-- Indices de la tabla `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_teams_season` (`season_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `simulations`
--
ALTER TABLE `simulations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `standings_snapshots`
--
ALTER TABLE `standings_snapshots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `fk_matches_seasons` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matches_team_away` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matches_team_home` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `simulations`
--
ALTER TABLE `simulations`
  ADD CONSTRAINT `fk_simulations_seasons` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `simulation_overrides`
--
ALTER TABLE `simulation_overrides`
  ADD CONSTRAINT `fk_overrides_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_overrides_sim` FOREIGN KEY (`simulation_id`) REFERENCES `simulations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `standings_rows`
--
ALTER TABLE `standings_rows`
  ADD CONSTRAINT `fk_rows_snapshot` FOREIGN KEY (`snapshot_id`) REFERENCES `standings_snapshots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rows_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `standings_snapshots`
--
ALTER TABLE `standings_snapshots`
  ADD CONSTRAINT `fk_snapshots_seasons` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `fk_teams_seasons` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
