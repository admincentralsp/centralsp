-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.18.0.7304
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para rshopv7
CREATE DATABASE IF NOT EXISTS `rshopv7` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rshopv7`;

-- Copiando estrutura para tabela rshopv7.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Whitelist` tinyint(1) NOT NULL DEFAULT '0',
  `Characters` int NOT NULL DEFAULT '1',
  `Gemstone` int NOT NULL DEFAULT '0',
  `Premium` int NOT NULL DEFAULT '0',
  `Discord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`),
  KEY `Discord` (`Discord`),
  KEY `License` (`License`),
  KEY `idx_accounts_license` (`License`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.accounts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.arena_config
CREATE TABLE IF NOT EXISTS `arena_config` (
  `arena_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `minutes` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `max_players` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`arena_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.arena_config: ~4 rows (aproximadamente)
INSERT INTO `arena_config` (`arena_number`, `price`, `minutes`, `type`, `name`, `max_players`) VALUES
	('1', 5000, 10, 'all', 'Arena Airsoft', 8),
	('2', 5000, 8, 'pistol', 'Arena Pistola', 6),
	('3', 5000, 12, 'rifle', 'Arena Rifle', 8),
	('4', 5000, 15, 'sniper', 'Arena Sniper', 4);

-- Copiando estrutura para tabela rshopv7.arena_history
CREATE TABLE IF NOT EXISTS `arena_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `arena_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `winner_passport` int NOT NULL,
  `winner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kills` int DEFAULT '0',
  `money` int DEFAULT '0',
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_arena_history_number_id` (`arena_number`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.arena_history: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.arena_notifications
CREATE TABLE IF NOT EXISTS `arena_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `arena_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `killer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_arena_notifications_number_time` (`arena_number`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.arena_notifications: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.arena_rankings
CREATE TABLE IF NOT EXISTS `arena_rankings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `passport` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `arena_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kills` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `passport_arena_type` (`passport`,`arena_type`),
  KEY `idx_arena_rankings_type_kills` (`arena_type`,`kills`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.arena_rankings: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.avatars
CREATE TABLE IF NOT EXISTS `avatars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Passport` (`Passport`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.avatars: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.banneds
CREATE TABLE IF NOT EXISTS `banneds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Time` int NOT NULL DEFAULT '0',
  `Reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idx_banneds_license` (`License`),
  KEY `idx_banneds_token` (`Token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.banneds: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.blips
CREATE TABLE IF NOT EXISTS `blips` (
  `id` int NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `sprite` int DEFAULT '1',
  `color` int DEFAULT '0',
  `scale` float DEFAULT '0.6',
  `label` varchar(255) DEFAULT 'Novo Blip',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela rshopv7.blips: ~85 rows (aproximadamente)
INSERT INTO `blips` (`id`, `x`, `y`, `z`, `sprite`, `color`, `scale`, `label`, `created_at`) VALUES
	(1, -545.31, -203.74, 38.22, 267, 5, 0.6, 'Prefeitura', '2026-03-30 20:09:14'),
	(2, 1153.56, -1521.27, 34.85, 80, 1, 0.5, 'Hospital', '2026-03-30 20:09:14'),
	(4, -1150.9, -2285.65, 14.42, 60, 1, 0.6, 'Policia Rota', '2026-03-30 20:09:14'),
	(7, -2665.13, 2379.43, 23.64, 60, 10, 0.6, 'Policia Prf', '2026-03-30 20:09:14'),
	(9, -1129.34, -1721.27, 5.04, 60, 10, 0.6, 'Bombeiro', '2026-03-30 20:09:14'),
	(10, 939.84, -968.61, 44.28, 402, 18, 0.8, 'Mecânica', '2026-03-30 20:09:14'),
	(11, 1961.61, 5179.26, 47.94, 285, 10, 0.6, 'Lenhador', '2026-03-30 20:09:14'),
	(12, 963.13, -2215.33, 30.55, 77, 32, 0.5, 'Leiteiro', '2026-03-30 20:09:14'),
	(13, 264.74, 219.99, 101.67, 67, 4, 0.6, 'Transportador', '2026-03-30 20:09:14'),
	(14, 1239.87, -3257.2, 7.09, 67, 4, 0.6, 'Caminhoneiro', '2026-03-30 20:09:14'),
	(15, 453.47, -602.34, 28.59, 513, 4, 0.6, 'Motorista', '2026-03-30 20:09:14'),
	(17, 901.97, -167.97, 74.07, 198, 70, 0.6, 'Taxista', '2026-03-30 20:09:14'),
	(18, 68.99, 127.46, 79.21, 478, 20, 0.6, 'Go Postal', '2026-03-30 20:09:14'),
	(19, -628.79, -238.7, 38.05, 617, 26, 0.6, 'Joalheria', '2026-03-30 20:09:14'),
	(20, 2953.93, 2787.49, 41.5, 617, 56, 0.6, 'Minerador', '2026-03-30 20:09:14'),
	(21, 1990.99, 4857.66, 43.84, 88, 56, 0.6, 'Fazendeiro', '2026-03-30 20:09:14'),
	(22, -679.13, 5839.52, 17.3, 141, 51, 0.7, 'Cabana de Caça', '2026-03-30 20:09:14'),
	(23, 827.1, 5426.91, 485.51, 141, 51, 0.7, 'Área de Caça', '2026-03-30 20:09:14'),
	(24, -2080.6, 1357.4, 257.87, 141, 51, 0.7, 'Área de Caça', '2026-03-30 20:09:14'),
	(25, 1529.16, 3776.59, 34.51, 68, 4, 0.7, 'Loja Pesca', '2026-03-30 20:09:14'),
	(26, -1175.67, -886.91, 13.88, 106, 4, 0.6, 'BurgerShop', '2026-03-30 20:09:14'),
	(27, 46.7, -1749.71, 29.62, 78, 30, 0.5, 'Mega Mall', '2026-03-30 20:09:14'),
	(28, 1110.8, -2008.75, 31.43, 648, 44, 0.6, 'Refinaria', '2026-03-30 20:09:14'),
	(29, -345.38, -1555.59, 25.22, 318, 39, 0.7, 'Catador de Reciclagem', '2026-03-30 20:09:14'),
	(30, 321.99, -1075.87, 29.47, 403, 5, 0.7, 'Farmácia', '2026-03-30 20:09:14'),
	(31, 94.88, -229.1, 54.66, 403, 5, 0.7, 'Farmácia', '2026-03-30 20:09:14'),
	(32, -772.76, 312.81, 85.7, 475, 36, 0.7, 'Hotel', '2026-03-30 20:09:14'),
	(33, 127.24, -149.6, 54.8, 225, 62, 0.6, 'Concessionária', '2026-03-30 20:09:14'),
	(34, 966.47, -1914.76, 31.14, 467, 11, 0.7, 'Recicladora', '2026-03-30 20:09:14'),
	(35, -178.19, 6261.09, 31.49, 467, 11, 0.7, 'Recicladora', '2026-03-30 20:09:14'),
	(36, 270.14, 2858.27, 43.64, 467, 11, 0.7, 'Recicladora', '2026-03-30 20:09:14'),
	(37, 149.64, -1041.36, 29.59, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(38, 313.95, -279.74, 54.39, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(39, -351.2, -50.57, 49.26, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(40, -2961.85, 482.87, 15.92, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(41, 1175.09, 2707.53, 38.31, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(42, -1212.37, -331.37, 38, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(43, -112.86, 6470.46, 31.85, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(44, 235.36, 216.94, 106.29, 108, 82, 0.7, 'Banco', '2026-03-30 20:09:14'),
	(45, 1692.27, 3760.91, 34.69, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(46, 253.8, -50.47, 69.94, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(47, 842.54, -1035.25, 28.19, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(48, -331.67, 6084.86, 31.46, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(49, -662.37, -933.58, 21.82, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(50, -1304.12, -394.56, 36.7, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(51, -1118.98, 2699.73, 18.55, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(52, 2567.98, 292.62, 108.73, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(53, -3173.51, 1088.35, 20.84, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(54, 22.53, -1105.52, 29.79, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(55, 810.22, -2158.99, 29.62, 76, 35, 0.5, 'Loja de Armas', '2026-03-30 20:09:14'),
	(56, 1327.98, -1654.78, 52.03, 75, 13, 0.6, 'Loja de Tatuagem', '2026-03-30 20:09:14'),
	(57, -1149.04, -1428.64, 4.71, 75, 13, 0.6, 'Loja de Tatuagem', '2026-03-30 20:09:14'),
	(58, 322.01, 186.24, 103.34, 75, 13, 0.6, 'Loja de Tatuagem', '2026-03-30 20:09:14'),
	(59, -3175.64, 1075.54, 20.58, 75, 13, 0.6, 'Loja de Tatuagem', '2026-03-30 20:09:14'),
	(60, 1866.01, 3748.07, 32.79, 75, 13, 0.6, 'Loja de Tatuagem', '2026-03-30 20:09:14'),
	(61, -295.51, 6199.21, 31.24, 75, 13, 0.6, 'Loja de Tatuagem', '2026-03-30 20:09:14'),
	(62, 76.99, -194.58, 54.49, 357, 32, 0.6, 'Garagem', '2026-03-30 20:09:14'),
	(63, -1686.58, 26.39, 64.38, 357, 32, 0.6, 'Garagem', '2026-03-30 20:09:14'),
	(65, 964.11, -1035.85, 40.83, 357, 32, 0.6, 'Garagem', '2026-03-30 20:09:14'),
	(66, 1700.43, 3766.2, 34.42, 357, 32, 0.6, 'Garagem', '2026-03-30 20:09:14'),
	(67, -197.57, 6233.16, 31.49, 357, 32, 0.6, 'Garagem', '2026-03-30 20:09:14'),
	(68, 1109.02, 2660.88, 37.98, 357, 32, 0.6, 'Garagem', '2026-03-30 20:09:14'),
	(69, 562.12, 2740.82, 42.78, 59, 4, 0.6, 'Pet Shop', '2026-03-30 20:09:14'),
	(70, 171.75, 663.47, 207.45, 84, 1, 0.6, 'Favela', '2026-03-30 20:09:14'),
	(71, 1255.5, -205.76, 98.96, 84, 1, 0.6, 'Favela', '2026-03-30 20:09:14'),
	(72, 1270.62, -908.38, 82.83, 84, 1, 0.6, 'Favela', '2026-03-30 20:09:14'),
	(73, 1404.18, -2419.09, 77.22, 84, 1, 0.6, 'Favela', '2026-03-30 20:09:14'),
	(74, -2375.6, 1769.31, 212.12, 84, 1, 0.6, 'Favela', '2026-03-30 20:09:14'),
	(75, -1760.25, -206.51, 64.16, 84, 1, 0.6, 'Favela', '2026-03-30 20:09:14'),
	(76, -148.77, 2729.6, 56.18, 84, 1, 0.6, 'Favela', '2026-03-30 20:09:14'),
	(77, 1440.55, -2614.48, 48.27, 176, 3, 0.6, 'Ponte', '2026-03-30 20:09:14'),
	(78, -1980.1, -209.78, 34.98, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(79, 838.34, 3221.7, 39.97, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(80, -2709.54, -71.3, 16.77, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(81, 1587.58, -2601.78, 53.35, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(82, 3418.32, 4897.64, 35.97, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(83, -2795.78, 1449.35, 100.91, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(84, -3306.92, 515.29, 12.27, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(85, -1252.86, 817.48, 193.37, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(86, -734.83, 488.13, 109.56, 40, 5, 0.6, 'Manssao', '2026-03-30 20:09:14'),
	(93, -757.772, -2600.39, 13.8285, 60, 3, 0.6, 'Policia Pmesp', '2026-08-14 19:43:01'),
	(94, 1031.14, -2346.24, 30.5292, 60, 3, 0.6, 'Policia Baep', '2026-08-14 19:47:45'),
	(95, -482.542, 270.399, 83.1945, 60, 3, 0.6, 'Gcm', '2026-08-14 20:04:05'),
	(96, -2027.06, -504.649, 11.7053, 60, 3, 0.6, 'Policia Pcesp', '2026-08-14 20:20:46'),
	(99, -1658.16, -778.185, 10.4029, 225, 3, 0.6, 'Detran', '2026-08-15 04:52:59');

-- Copiando estrutura para tabela rshopv7.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Native',
  `Lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Store',
  `Sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Skin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'mp_m_freemode_01',
  `Bank` int NOT NULL DEFAULT '10000',
  `Blood` int NOT NULL DEFAULT '1',
  `Prison` int NOT NULL DEFAULT '0',
  `Wanted` int NOT NULL DEFAULT '0',
  `Avatar` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'https://media.discordapp.net/attachments/1343936315116228689/1347874509197283398/bg512x512.png?ex=67d5fb35&is=67d4a9b5&hm=9fa00b3d9356884c050ef00f2a6583d7383ef6207e5572fd1089142832ee6d09&=&format=webp&quality=lossless&width=410&height=410',
  `Likes` int NOT NULL DEFAULT '0',
  `Unlikes` int NOT NULL DEFAULT '0',
  `Badge` int NOT NULL DEFAULT '0',
  `Created` int NOT NULL DEFAULT '0',
  `Login` int NOT NULL DEFAULT '0',
  `Deleted` int NOT NULL DEFAULT '0',
  `StarterVehicle` tinyint(1) NOT NULL DEFAULT '0',
  `driverlicense` tinyint NOT NULL DEFAULT '0',
  `Age` int NOT NULL DEFAULT '20',
  `Tattoos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `license` (`License`),
  KEY `id` (`id`),
  KEY `idx_characters_license_deleted` (`License`,`Deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.characters: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.chests
CREATE TABLE IF NOT EXISTS `chests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Weight` int NOT NULL DEFAULT '2000',
  `Slots` int NOT NULL DEFAULT '50',
  `Permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Admin',
  `Premium` int NOT NULL DEFAULT '0',
  `Bank` int NOT NULL DEFAULT '0',
  `Logs` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.chests: ~36 rows (aproximadamente)
INSERT INTO `chests` (`id`, `Name`, `Weight`, `Slots`, `Permission`, `Premium`, `Bank`, `Logs`) VALUES
	(1, 'Prf', 2000, 50, 'Prf', 0, 0, 1),
	(10, 'Families', 2000, 50, 'Families', 0, 0, 1),
	(11, 'Mecanico', 2000, 50, 'Default', 0, 0, 1),
	(16, 'BurgerShot', 2000, 50, 'BurgerShot', 0, 0, 1),
	(17, 'Paramedico', 2000, 50, 'Default', 0, 0, 1),
	(18, 'Mafia', 2000, 50, 'Mafia', 0, 0, 1),
	(19, 'Motoclub', 2000, 50, 'Motoclub', 0, 0, 1),
	(21, 'Mansao01', 2000, 50, 'Mansao01', 0, 0, 1),
	(24, 'Massao02', 2000, 50, 'Massao02', 0, 0, 1),
	(25, 'Massao03', 2000, 50, 'Massao03', 0, 0, 1),
	(26, 'Massao04', 2000, 50, 'Massao04', 0, 0, 1),
	(27, 'Massao05', 2000, 50, 'Massao05', 0, 0, 1),
	(28, 'Massao06', 2000, 50, 'Massao06', 0, 0, 1),
	(29, 'Massao07', 2000, 50, 'Massao07', 0, 0, 1),
	(30, 'Massao08', 2000, 50, 'Massao08', 0, 0, 1),
	(31, 'Massao09', 2000, 50, 'Massao09', 0, 0, 1),
	(41, 'Vanilla', 2000, 50, 'Vanilla', 0, 0, 1),
	(43, 'Favela01', 2000, 50, 'Favela01', 0, 0, 1),
	(44, 'Favela02', 2000, 50, 'Favela02', 0, 0, 1),
	(45, 'Favela03', 2000, 50, 'Favela03', 0, 0, 1),
	(46, 'Favela04', 2000, 50, 'Favela04', 0, 0, 1),
	(47, 'Favela05', 2000, 50, 'Favela05', 0, 0, 1),
	(48, 'Favela06', 2000, 50, 'Favela06', 0, 0, 1),
	(49, 'Favela07', 2000, 50, 'Favela07', 0, 0, 1),
	(50, 'Favela08', 2000, 50, 'Favela08', 0, 0, 1),
	(51, 'Favela09', 2000, 50, 'Favela09', 0, 0, 1),
	(52, 'Favela10', 2000, 50, 'Favela10', 0, 0, 1),
	(53, 'Favela11', 2000, 50, 'Favela11', 0, 0, 1),
	(54, 'Favela12', 2000, 50, 'Favela12', 0, 0, 1),
	(55, 'Favela13', 2000, 50, 'Favela13', 0, 0, 1),
	(56, 'Favela14', 2000, 50, 'Favela14', 0, 0, 1),
	(57, 'Favela15', 2000, 50, 'Favela15', 0, 0, 1),
	(58, 'Pmesp', 2000, 50, 'Pmesp', 0, 0, 1),
	(59, 'Baep', 2000, 50, 'Baep', 0, 0, 1),
	(60, 'Gcm', 2000, 50, 'Gcm', 0, 0, 1),
	(61, 'Pcesp', 2000, 50, 'Pcesp', 0, 0, 1);

-- Copiando estrutura para tabela rshopv7.daily
CREATE TABLE IF NOT EXISTS `daily` (
  `Passport` int NOT NULL,
  `Last_Reward` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.daily: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.entitydata
CREATE TABLE IF NOT EXISTS `entitydata` (
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Name`),
  KEY `Information` (`Name`) USING BTREE,
  KEY `idx_entitydata_name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.entitydata: ~1 rows (aproximadamente)
INSERT INTO `entitydata` (`Name`, `Information`) VALUES
	('Permissions:Admin', '{"1":1}');

-- Copiando estrutura para tabela rshopv7.estoque
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `item` varchar(100) NOT NULL,
  `quantidade` int NOT NULL DEFAULT '0',
  `preco` int NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_item` (`store_id`,`item`),
  KEY `idx_store_id` (`store_id`),
  CONSTRAINT `fk_estoque_store` FOREIGN KEY (`store_id`) REFERENCES `lojas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela rshopv7.estoque: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.fines
CREATE TABLE IF NOT EXISTS `fines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Passport` int NOT NULL DEFAULT '0',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Hour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` int NOT NULL,
  `Message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.fines: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.gas_station_balance
CREATE TABLE IF NOT EXISTS `gas_station_balance` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `income` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int unsigned NOT NULL,
  `date` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.gas_station_balance: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.gas_station_business
CREATE TABLE IF NOT EXISTS `gas_station_business` (
  `gas_station_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int unsigned NOT NULL DEFAULT '0',
  `price` int unsigned NOT NULL DEFAULT '0',
  `stock_upgrade` tinyint unsigned NOT NULL DEFAULT '0',
  `truck_upgrade` tinyint unsigned NOT NULL DEFAULT '0',
  `relationship_upgrade` tinyint unsigned NOT NULL DEFAULT '0',
  `money` int unsigned NOT NULL DEFAULT '0',
  `total_money_earned` int unsigned NOT NULL DEFAULT '0',
  `total_money_spent` int unsigned NOT NULL DEFAULT '0',
  `gas_bought` int unsigned NOT NULL DEFAULT '0',
  `gas_sold` int unsigned NOT NULL DEFAULT '0',
  `distance_traveled` double unsigned NOT NULL DEFAULT '0',
  `total_visits` int unsigned NOT NULL DEFAULT '0',
  `customers` int unsigned NOT NULL DEFAULT '0',
  `timer` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gas_station_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.gas_station_business: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.gas_station_jobs
CREATE TABLE IF NOT EXISTS `gas_station_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reward` int unsigned NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '0',
  `progress` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.gas_station_jobs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.investments
CREATE TABLE IF NOT EXISTS `investments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int NOT NULL DEFAULT '0',
  `Liquid` int NOT NULL DEFAULT '0',
  `Monthly` int NOT NULL DEFAULT '0',
  `Deposit` int NOT NULL DEFAULT '0',
  `Last` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`),
  KEY `idx_investments_passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.investments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int NOT NULL DEFAULT '0',
  `Received` int NOT NULL DEFAULT '0',
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Holder` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`),
  KEY `idx_invoices_passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.invoices: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.lojas
CREATE TABLE IF NOT EXISTS `lojas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_code` varchar(32) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `coords` longtext NOT NULL,
  `balance` bigint NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `last_tax_paid` date DEFAULT NULL,
  `auto_debit` tinyint(1) NOT NULL DEFAULT '0',
  `tax_debt` bigint NOT NULL DEFAULT '0',
  `last_tax_update` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_code` (`store_code`),
  UNIQUE KEY `uk_lojas_owner` (`owner`),
  KEY `idx_owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela rshopv7.lojas: ~20 rows (aproximadamente)
INSERT INTO `lojas` (`id`, `store_code`, `owner`, `coords`, `balance`, `blocked`, `last_tax_paid`, `auto_debit`, `tax_debt`, `last_tax_update`, `created_at`) VALUES
	(1, 'loja_01', NULL, '{"x":25.71999931335449,"y":-1346.9200439453126,"z":29.5}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(2, 'loja_02', NULL, '{"x":-48.38000106811523,"y":-1757.8599853515626,"z":29.42000007629394}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(3, 'loja_03', NULL, '{"x":1135.6700439453126,"y":-982.4400024414063,"z":46.41999816894531}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(4, 'loja_04', NULL, '{"x":1163.3900146484376,"y":-323.80999755859377,"z":69.20999908447266}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(5, 'loja_05', NULL, '{"x":-1222.9100341796876,"y":-906.8400268554688,"z":12.32999992370605}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(6, 'loja_06', NULL, '{"x":1728.97998046875,"y":6414.72021484375,"z":35.02999877929687}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(7, 'loja_07', NULL, '{"x":2557.050048828125,"y":382.0799865722656,"z":108.61000061035156}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(8, 'loja_08', NULL, '{"x":-707.4099731445313,"y":-914.4000244140625,"z":19.20999908447265}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(9, 'loja_09', NULL, '{"x":373.75,"y":326.1499938964844,"z":103.55999755859375}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(10, 'loja_10', NULL, '{"x":-3242.10009765625,"y":1001.3099975585938,"z":12.81999969482421}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(11, 'loja_11', NULL, '{"x":547.72998046875,"y":2671.02001953125,"z":42.15999984741211}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(12, 'loja_12', NULL, '{"x":1961.1500244140626,"y":3740.679931640625,"z":32.33000183105469}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(13, 'loja_13', NULL, '{"x":2678.469970703125,"y":3280.6201171875,"z":55.22999954223633}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(14, 'loja_14', NULL, '{"x":1698.1199951171876,"y":4924.43994140625,"z":42.06000137329101}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(15, 'loja_15', NULL, '{"x":-1820.5699462890626,"y":792.8099975585938,"z":138.10000610351563}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(16, 'loja_16', NULL, '{"x":1391.989990234375,"y":3604.7900390625,"z":34.97999954223633}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(17, 'loja_17', NULL, '{"x":-2967.7900390625,"y":391.5299987792969,"z":15.05000019073486}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(18, 'loja_18', NULL, '{"x":-3039.43994140625,"y":585.739990234375,"z":7.90000009536743}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(19, 'loja_19', NULL, '{"x":1165.1500244140626,"y":2709.429931640625,"z":38.1500015258789}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32'),
	(20, 'loja_20', NULL, '{"x":-1488.0,"y":-378.3399963378906,"z":40.1500015258789}', 0, 0, NULL, 0, 0, NULL, '2026-08-14 19:07:32');

-- Copiando estrutura para tabela rshopv7.mdt_creative_arrest
CREATE TABLE IF NOT EXISTS `mdt_creative_arrest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Officer` int DEFAULT NULL,
  `Officers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Timestamp` int DEFAULT NULL,
  `Infractions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Arrest` int DEFAULT '0',
  `Fine` int DEFAULT '0',
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_arrest: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_board
CREATE TABLE IF NOT EXISTS `mdt_creative_board` (
  `Permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_board: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_fines
CREATE TABLE IF NOT EXISTS `mdt_creative_fines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Officer` int DEFAULT NULL,
  `Timestamp` int DEFAULT NULL,
  `Infractions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Fine` int DEFAULT '0',
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Paid` int DEFAULT '0',
  `Arrest` int DEFAULT NULL,
  `Date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Hour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Officer` (`Officer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_fines: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_internalaffairs
CREATE TABLE IF NOT EXISTS `mdt_creative_internalaffairs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Suspect` int DEFAULT NULL,
  `Officer` int DEFAULT NULL,
  `Timestamp` int DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Archive` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_internalaffairs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_medals
CREATE TABLE IF NOT EXISTS `mdt_creative_medals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Officers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_medals: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_penalcode_articles
CREATE TABLE IF NOT EXISTS `mdt_creative_penalcode_articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Section` int NOT NULL DEFAULT '0',
  `Article` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Contravention` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Fine` int NOT NULL DEFAULT '0',
  `Bail` int NOT NULL DEFAULT '0',
  `Arrest` int NOT NULL DEFAULT '0',
  `Order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Section` (`Section`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_penalcode_articles: ~13 rows (aproximadamente)
INSERT INTO `mdt_creative_penalcode_articles` (`id`, `Section`, `Article`, `Contravention`, `Fine`, `Bail`, `Arrest`, `Order`) VALUES
	(1, 1, 'Art. 1', 'Alta Velocidade', 5000, 0, 0, 1),
	(2, 1, 'Art. 2', 'Direção Perigosa', 8000, 0, 0, 2),
	(3, 1, 'Art. 3', 'Estacionamento Irregular', 2000, 0, 0, 3),
	(4, 1, 'Art. 4', 'Fuga de Abordagem', 15000, 0, 20, 4),
	(5, 2, 'Art. 5', 'Agressão', 10000, 5000, 15, 1),
	(6, 2, 'Art. 6', 'Tentativa de Homicídio', 50000, 0, 60, 2),
	(7, 2, 'Art. 7', 'Homicídio Doloso', 100000, 0, 120, 3),
	(8, 3, 'Art. 8', 'Roubo a Loja', 20000, 0, 30, 1),
	(9, 3, 'Art. 9', 'Roubo a Banco', 150000, 0, 100, 2),
	(10, 3, 'Art. 10', 'Furto de Veículo', 15000, 5000, 25, 3),
	(11, 4, 'Art. 11', 'Desacato', 10000, 2000, 20, 1),
	(12, 4, 'Art. 12', 'Porte Ilegal de Armas', 30000, 0, 40, 2),
	(13, 4, 'Art. 13', 'Tráfico de Drogas', 40000, 0, 50, 3);

-- Copiando estrutura para tabela rshopv7.mdt_creative_penalcode_sections
CREATE TABLE IF NOT EXISTS `mdt_creative_penalcode_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_penalcode_sections: ~3 rows (aproximadamente)
INSERT INTO `mdt_creative_penalcode_sections` (`id`, `Title`, `Description`, `Type`, `Order`) VALUES
	(2, 'Crimes Contra a Pessoa', 'Infrações que atentam contra a integridade física ou moral de terceiros.', 'Crime', 2),
	(3, 'Crimes Contra o Patrimônio', 'Infrações relacionadas a bens materiais e propriedade.', 'Crime', 3),
	(4, 'Crimes Contra a Ordem Pública', 'Infrações que perturbam a paz e a ordem social.', 'Crime', 4);

-- Copiando estrutura para tabela rshopv7.mdt_creative_reports
CREATE TABLE IF NOT EXISTS `mdt_creative_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Suspects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Officer` int DEFAULT NULL,
  `Timestamp` int DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Archive` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_reports: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_units
CREATE TABLE IF NOT EXISTS `mdt_creative_units` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Officers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_units: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_vehicles
CREATE TABLE IF NOT EXISTS `mdt_creative_vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Vehicle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Plate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Timestamp` int DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Officer` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_vehicles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_wanted
CREATE TABLE IF NOT EXISTS `mdt_creative_wanted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Accusations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Officer` int DEFAULT NULL,
  `Timestamp` int DEFAULT NULL,
  `HowLong` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_wanted: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.mdt_creative_warning
CREATE TABLE IF NOT EXISTS `mdt_creative_warning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT NULL,
  `Officer` int DEFAULT NULL,
  `Timestamp` int DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.mdt_creative_warning: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.moneywash
CREATE TABLE IF NOT EXISTS `moneywash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Number` int NOT NULL DEFAULT '0',
  `Passport` int NOT NULL DEFAULT '0',
  `Item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'moneywash',
  `Hash` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'bkr_prop_prtmachine_dryer_spin',
  `Coords` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '[]',
  `Route` int NOT NULL DEFAULT '0',
  `Timer` int NOT NULL DEFAULT '0',
  `Washed` int NOT NULL DEFAULT '0',
  `Monthly` int NOT NULL DEFAULT '0',
  `Money` int NOT NULL DEFAULT '0',
  `Last` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Number` (`Number`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`),
  KEY `idx_moneywash_number` (`Number`),
  KEY `idx_moneywash_last` (`Last`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.moneywash: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.nation_concessionaria
CREATE TABLE IF NOT EXISTS `nation_concessionaria` (
  `vehicle` varchar(64) NOT NULL,
  `estoque` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`vehicle`),
  KEY `idx_nation_conce_estoque` (`estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.nation_concessionaria: ~512 rows (aproximadamente)
INSERT INTO `nation_concessionaria` (`vehicle`, `estoque`) VALUES
	('1500ghoul', 100),
	('16charger', 100),
	('16topcargle', 100),
	('17m760i', 100),
	('17mansorypnmr', 100),
	('18performante', 100),
	('18rs7', 100),
	('2019m5', 100),
	('21rsq8', 100),
	('21sierra', 100),
	('22arturac', 100),
	('22g63', 100),
	('22m5', 100),
	('2ncsbmwm8', 100),
	('2ncsx7', 100),
	('350z', 100),
	('356a', 100),
	('488', 100),
	('600ltwb', 100),
	('6x6', 100),
	('adder', 100),
	('agerars', 100),
	('akuma', 100),
	('alpha', 100),
	('amggt16', 100),
	('amgone', 100),
	('asbo', 100),
	('asea', 100),
	('asterope', 100),
	('autarch', 100),
	('autobio', 99),
	('avarus', 100),
	('bagger', 100),
	('baller', 100),
	('baller2', 100),
	('baller3', 100),
	('baller4', 100),
	('baller5', 100),
	('baller6', 100),
	('banshee', 100),
	('banshee2', 100),
	('bati', 100),
	('bati2', 100),
	('ben17', 100),
	('bentaygam', 100),
	('bestiagts', 100),
	('bf400', 100),
	('bfinjection', 100),
	('bifta', 100),
	('bison', 100),
	('bjxl', 100),
	('blade', 100),
	('blazer', 100),
	('blazer3', 100),
	('blazer4', 100),
	('blista', 100),
	('blista2', 100),
	('blista3', 100),
	('bmw8mm', 100),
	('bmwg07', 100),
	('bmx', 100),
	('bobcatxl', 100),
	('bodhi2', 100),
	('brawler', 100),
	('brioso', 100),
	('brioso2', 100),
	('brioso3', 100),
	('brz13varis', 100),
	('btype', 100),
	('btype2', 100),
	('btype3', 100),
	('buccaneer', 100),
	('buccaneer2', 100),
	('buffalo', 100),
	('buffalo2', 100),
	('buffalo3', 100),
	('buffalo4', 100),
	('bullet', 100),
	('burrito', 100),
	('burrito2', 100),
	('burrito3', 100),
	('burrito4', 100),
	('c8p1', 100),
	('calico', 100),
	('camper', 100),
	('caracara2', 100),
	('carbonizzare', 100),
	('carbonrs', 100),
	('casco', 100),
	('cavalcade', 100),
	('cavalcade2', 100),
	('cb650r', 100),
	('cheburek', 100),
	('cheetah', 100),
	('chimera', 100),
	('chino', 100),
	('chino2', 100),
	('chironsuper', 100),
	('choilambo', 100),
	('ckbmwm4offwhite', 100),
	('cliffhanger', 100),
	('clique', 100),
	('club', 100),
	('cog55', 100),
	('cog552', 100),
	('cogcabrio', 100),
	('cognoscenti', 100),
	('cognoscenti2', 100),
	('comet2', 100),
	('comet3', 99),
	('comet4', 100),
	('comet5', 100),
	('comet6', 100),
	('contender', 100),
	('coquette', 100),
	('coquette2', 100),
	('coquette3', 100),
	('coquette4', 100),
	('corsita', 100),
	('cruiser', 100),
	('cyclone', 100),
	('cypher', 100),
	('daemon', 100),
	('daemon2', 100),
	('defiler', 100),
	('demon', 100),
	('deviant', 100),
	('diablous', 100),
	('diablous2', 100),
	('dilettante', 100),
	('dloader', 100),
	('dlr34um', 100),
	('dlrs6um', 100),
	('dominator', 100),
	('dominator2', 100),
	('dominator3', 100),
	('dominator7', 100),
	('double', 100),
	('drafter', 100),
	('draugur', 100),
	('dubsta', 100),
	('dubsta2', 100),
	('dubsta3', 100),
	('dukes', 100),
	('dvc63darwin', 100),
	('dynasty', 100),
	('e63s', 100),
	('elegy', 100),
	('elegy2', 100),
	('ellie', 100),
	('emerus', 100),
	('emperor', 100),
	('emperor2', 100),
	('enduro', 100),
	('entity2', 100),
	('entityxf', 100),
	('esskey', 100),
	('euros', 100),
	('eve', 100),
	('everon', 100),
	('evo9', 100),
	('evox', 100),
	('exemplar', 100),
	('f12rp', 100),
	('f620', 100),
	('f812', 100),
	('faction', 100),
	('faction2', 100),
	('faction3', 100),
	('fagaloa', 100),
	('faggio', 100),
	('faggio2', 100),
	('faggio3', 100),
	('fcr', 100),
	('fcr2', 100),
	('felon', 100),
	('felon2', 100),
	('feltzer2', 100),
	('feltzer3', 100),
	('fenyrsupersport', 100),
	('ferrari812super', 100),
	('fixter', 100),
	('fk8', 100),
	('flashgt', 100),
	('fmj', 100),
	('fnfmk4', 100),
	('fpaceprior', 100),
	('fq2', 100),
	('freecrawler', 100),
	('fugitive', 100),
	('furia', 100),
	('furoregt', 100),
	('fusilade', 100),
	('futo', 100),
	('futo2', 100),
	('fxxkevo', 100),
	('g81hr', 100),
	('gargoyle', 100),
	('gauntlet', 100),
	('gauntlet3', 100),
	('gauntlet4', 100),
	('gauntlet5', 100),
	('gb200', 100),
	('gburrito', 100),
	('gcmlamboultimae', 100),
	('gcram1500', 100),
	('gemera', 100),
	('gfuckedsupra', 100),
	('giulia_2021', 100),
	('glendale', 100),
	('glendale2', 100),
	('golf7', 100),
	('gp1', 100),
	('granger', 100),
	('greenwood', 100),
	('gresley', 100),
	('growler', 100),
	('gt17', 100),
	('gt2rs', 100),
	('gt3demon', 100),
	('gt3hycade', 100),
	('gt500', 100),
	('gt86trust', 100),
	('gta5rp_veh_ferrari19', 100),
	('gtr50', 100),
	('gtrh', 100),
	('gtz34be', 100),
	('habanero', 99),
	('hakuchou', 100),
	('hakuchou2', 100),
	('hellion', 99),
	('hermes', 100),
	('hexer', 100),
	('hotknife', 100),
	('hotring', 100),
	('huntley', 100),
	('huracanpriorbeast', 100),
	('hustler', 100),
	('hycadesti', 100),
	('hycadeurus', 100),
	('hyundaiveloster', 100),
	('imorgon', 100),
	('impaler', 100),
	('infernus', 100),
	('infernus2', 100),
	('ingot', 100),
	('innovation', 100),
	('intruder', 100),
	('issi2', 100),
	('issi3', 100),
	('issi7', 100),
	('italigtb', 100),
	('italigtb2', 100),
	('italigto', 100),
	('italirsx', 100),
	('jackal', 100),
	('jesko', 100),
	('jester', 100),
	('jester2', 100),
	('jester3', 100),
	('jester4', 100),
	('jugular', 100),
	('kalahari', 100),
	('kamacho', 100),
	('kanjo', 100),
	('kanjosj', 100),
	('kawagala', 100),
	('kgjoker', 100),
	('khamelion', 100),
	('km1000rr', 100),
	('komoda', 100),
	('krieger', 100),
	('kuruma', 100),
	('landstalker', 100),
	('landstalker2', 100),
	('lbwk35', 100),
	('lectro', 100),
	('lm87', 100),
	('locust', 100),
	('lynx', 100),
	('m3e46', 100),
	('m3g80', 100),
	('mamba', 100),
	('manana', 100),
	('manana2', 100),
	('manchez', 100),
	('manhartx7', 100),
	('massacro', 100),
	('massacro2', 100),
	('mesa', 100),
	('mesa3', 100),
	('mi8', 100),
	('michelli', 100),
	('minivan', 100),
	('minivan2', 100),
	('mk4hycade', 100),
	('monroe', 100),
	('moonbeam', 100),
	('moonbeam2', 100),
	('mule', 101),
	('nebula', 100),
	('nemesis', 100),
	('neo', 100),
	('neon', 100),
	('nero', 100),
	('nero2', 100),
	('nightblade', 100),
	('nightshade', 100),
	('ninef', 100),
	('ninef2', 100),
	('nitro11', 100),
	('nitro9', 100),
	('novak', 100),
	('nsx17', 100),
	('omnis', 100),
	('omnisegt', 100),
	('oracle', 100),
	('oracle2', 100),
	('osiris', 100),
	('outlaw', 100),
	('p1lbwk', 100),
	('panto', 100),
	('paradise', 100),
	('paragon', 100),
	('pariah', 100),
	('patriot', 100),
	('patriot2', 100),
	('pcj', 100),
	('penetrator', 100),
	('penumbra', 100),
	('penumbra2', 100),
	('peyote', 100),
	('peyote2', 100),
	('peyote3', 100),
	('pfister811', 100),
	('picador', 100),
	('pigalle', 100),
	('pony', 100),
	('pony2', 100),
	('postlude', 100),
	('prairie', 100),
	('premier', 100),
	('previon', 100),
	('primo', 100),
	('primo2', 100),
	('r34h', 100),
	('radi', 100),
	('raiden', 100),
	('rancherxl', 100),
	('rapidgt', 100),
	('rapidgt2', 100),
	('rapidgt3', 100),
	('ratloader2', 100),
	('rd', 100),
	('reaper', 100),
	('rebel', 100),
	('rebel2', 100),
	('rebla', 100),
	('regina', 100),
	('remus', 100),
	('retinue', 100),
	('retinue2', 100),
	('rhapsody', 100),
	('rhinehart', 100),
	('riata', 100),
	('rmodskyline34', 100),
	('rocoto', 100),
	('romero', 100),
	('rr01', 100),
	('rrocket', 100),
	('rt3000', 100),
	('ruffian', 100),
	('ruiner', 100),
	('ruiner4', 100),
	('rumpo', 100),
	('rumpo2', 100),
	('rumpo3', 100),
	('ruston', 100),
	('sabregt', 100),
	('sabregt2', 100),
	('sanchez', 100),
	('sanchez2', 100),
	('sanctus', 100),
	('sandking', 100),
	('sandking2', 100),
	('savestra', 100),
	('sc1', 100),
	('schafter2', 100),
	('schafter3', 100),
	('schafter4', 100),
	('schafter5', 100),
	('schafter6', 100),
	('schlagen', 100),
	('schwarzer', 100),
	('scorcher', 100),
	('seminole', 100),
	('seminole2', 100),
	('sentinel', 100),
	('sentinel2', 100),
	('sentinel3', 100),
	('sentinel4', 100),
	('serrano', 100),
	('seven70', 100),
	('sheava', 100),
	('skyline', 100),
	('slamvan', 100),
	('slamvan2', 100),
	('slamvan3', 100),
	('sm722', 100),
	('specter', 100),
	('specter2', 100),
	('speedo', 100),
	('stafford', 100),
	('stalion', 100),
	('stalion2', 100),
	('stanier', 100),
	('stinger', 100),
	('stingergt', 100),
	('stratum', 100),
	('streiter', 100),
	('stretch', 100),
	('sugoi', 100),
	('sultan', 100),
	('sultan2', 100),
	('sultan3', 100),
	('sultanrs', 100),
	('superd', 100),
	('surano', 100),
	('surfer', 100),
	('surfer2', 100),
	('surge', 100),
	('swinger', 100),
	('t20', 101),
	('taco', 100),
	('tailgater', 100),
	('tailgater2', 100),
	('taipan', 100),
	('tampa', 100),
	('tampa2', 100),
	('tempesta', 100),
	('tenf', 100),
	('tenf2', 100),
	('tezeract', 100),
	('thrax', 100),
	('thrust', 100),
	('tigon', 100),
	('tornado', 100),
	('tornado2', 100),
	('tornado5', 100),
	('toros', 100),
	('tribike', 100),
	('tribike2', 100),
	('tribike3', 100),
	('trophytruck', 100),
	('tropos', 100),
	('tulip', 100),
	('turismo2', 100),
	('turismor', 100),
	('tyrant', 100),
	('tyrus', 100),
	('vacca', 100),
	('vader', 100),
	('vagner', 100),
	('vagrant', 100),
	('vamos', 100),
	('vectre', 100),
	('verlierer2', 100),
	('veto', 100),
	('veto2', 100),
	('vigero', 100),
	('vigero2', 100),
	('vindicator', 100),
	('virgo', 100),
	('virgo2', 100),
	('virgo3', 100),
	('visione', 100),
	('voltic', 100),
	('voodoo', 100),
	('voodoo2', 100),
	('vortex', 100),
	('vstr', 100),
	('warrener', 100),
	('washington', 100),
	('weevil', 99),
	('weevil2', 100),
	('windsor', 100),
	('windsor2', 100),
	('wolfsbane', 100),
	('xa21', 100),
	('xls', 100),
	('xls2', 100),
	('yosemite', 100),
	('yosemite2', 100),
	('yosemite3', 100),
	('youga', 100),
	('youga3', 100),
	('yzfr6', 100),
	('yzfr7', 100),
	('z190', 100),
	('z8r', 100),
	('zentorno', 100),
	('zion', 100),
	('zion2', 100),
	('zion3', 100),
	('zlay_gtz35', 100),
	('zombiea', 100),
	('zombieb', 100),
	('zorrusso', 100),
	('zr350', 100),
	('ztype', 100),
	('zx10r', 100),
	('zx6r', 100);

-- Copiando estrutura para tabela rshopv7.night_punicoes
CREATE TABLE IF NOT EXISTS `night_punicoes` (
  `user_id` int DEFAULT NULL,
  `staffid` longtext,
  `motivo` longtext,
  `status` varchar(50) DEFAULT NULL,
  `contagem` longtext,
  `data` longtext,
  `tempo_restante` int DEFAULT NULL,
  KEY `status` (`status`),
  KEY `tempo_restante` (`tempo_restante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.night_punicoes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.night_teleportes
CREATE TABLE IF NOT EXISTS `night_teleportes` (
  `user_id` int DEFAULT NULL,
  `id` longtext,
  `nome` longtext,
  `coords` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.night_teleportes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.painel_creative_announcements
CREATE TABLE IF NOT EXISTS `painel_creative_announcements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date` int unsigned NOT NULL,
  `Updated` int unsigned DEFAULT NULL,
  `Permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_permission` (`Permission`),
  KEY `idx_date` (`Date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.painel_creative_announcements: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.painel_creative_tags
CREATE TABLE IF NOT EXISTS `painel_creative_tags` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Members` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_permission` (`Permission`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.painel_creative_tags: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.painel_creative_transactions
CREATE TABLE IF NOT EXISTS `painel_creative_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Passport` int unsigned NOT NULL,
  `Value` int NOT NULL,
  `Transfer` int unsigned DEFAULT NULL,
  `Date` int unsigned NOT NULL,
  `Permission` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_permission_date` (`Permission`,`Date`),
  KEY `idx_passport` (`Passport`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.painel_creative_transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.painel_staff_warnings
CREATE TABLE IF NOT EXISTS `painel_staff_warnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `staff_user_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `banned` tinyint(1) DEFAULT NULL,
  `banned_time` float DEFAULT NULL,
  `banned_real_time` float DEFAULT NULL,
  `created` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.painel_staff_warnings: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.playerdata
CREATE TABLE IF NOT EXISTS `playerdata` (
  `Passport` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Passport`,`Name`),
  KEY `Passport` (`Passport`),
  KEY `Information` (`Name`) USING BTREE,
  KEY `idx_playerdata_passport_name` (`Passport`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.playerdata: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.police_courses
CREATE TABLE IF NOT EXISTS `police_courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT '0',
  `Police` int DEFAULT '0',
  `Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Segurança',
  `Date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00/00/0000',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.police_courses: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.police_messages
CREATE TABLE IF NOT EXISTS `police_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Individuo Indigente',
  `Message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.police_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.police_prisons
CREATE TABLE IF NOT EXISTS `police_prisons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT '1',
  `Police` int NOT NULL DEFAULT '0',
  `Crimes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Fines` int DEFAULT '0',
  `Services` int DEFAULT '0',
  `Date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '00/00/0000 ás 00:00',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.police_prisons: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.police_wanted
CREATE TABLE IF NOT EXISTS `police_wanted` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Passport` int DEFAULT '1',
  `Police` int NOT NULL DEFAULT '0',
  `Crime` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.police_wanted: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.port
CREATE TABLE IF NOT EXISTS `port` (
  `portId` int NOT NULL AUTO_INCREMENT,
  `identity` longtext,
  `user_id` text,
  `portType` longtext,
  `serial` longtext,
  `nidentity` longtext,
  `exam` longtext,
  `date` text,
  PRIMARY KEY (`portId`),
  KEY `portId` (`portId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.port: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.prison
CREATE TABLE IF NOT EXISTS `prison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `police` varchar(255) DEFAULT '0',
  `nuser_id` int NOT NULL DEFAULT '0',
  `services` int NOT NULL DEFAULT '0',
  `fines` int NOT NULL DEFAULT '0',
  `text` longtext,
  `date` text,
  `cops` longtext NOT NULL,
  `association` longtext NOT NULL,
  `residual` text,
  `url` longtext,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idx_prison_nuser_id_id` (`nuser_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.prison: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.propertys
CREATE TABLE IF NOT EXISTS `propertys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Homes0001',
  `Interior` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Middle',
  `Item` int NOT NULL DEFAULT '3',
  `Tax` int NOT NULL DEFAULT '0',
  `Passport` int NOT NULL DEFAULT '0',
  `Serial` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Vault` int NOT NULL DEFAULT '1',
  `Fridge` int NOT NULL DEFAULT '1',
  `Garage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `Passport` (`Passport`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.propertys: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.races
CREATE TABLE IF NOT EXISTS `races` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Race` int NOT NULL DEFAULT '0',
  `Passport` int NOT NULL DEFAULT '0',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Native',
  `Vehicle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Sultan RS',
  `Points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Race` (`Race`),
  KEY `idx_races_race_passport` (`Race`,`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.races: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `victim_id` text,
  `police_name` text,
  `solved` text,
  `victim_name` text,
  `created_at` text,
  `victim_report` text,
  `updated_at` text,
  PRIMARY KEY (`id`),
  KEY `portId` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.reports: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.rolepass
CREATE TABLE IF NOT EXISTS `rolepass` (
  `id` int NOT NULL AUTO_INCREMENT,
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Points` int DEFAULT '0',
  `Premium` tinyint(1) NOT NULL DEFAULT '0',
  `FreeLevel` int DEFAULT '0',
  `PremiumLevel` int DEFAULT '0',
  `Created` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `License` (`License`),
  KEY `Unique` (`License`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.rolepass: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_bank_invoices
CREATE TABLE IF NOT EXISTS `smartphone_bank_invoices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payee_id` int NOT NULL,
  `payer_id` int NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `value` int NOT NULL,
  `paid` tinyint NOT NULL DEFAULT '0',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_bank_invoices: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_blocks
CREATE TABLE IF NOT EXISTS `smartphone_blocks` (
  `user_id` int NOT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`user_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_blocks: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_calls
CREATE TABLE IF NOT EXISTS `smartphone_calls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `initiator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `target` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `video` tinyint NOT NULL DEFAULT '0',
  `anonymous` tinyint NOT NULL DEFAULT '0',
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_index` (`initiator`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=958 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_calls: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_casino
CREATE TABLE IF NOT EXISTS `smartphone_casino` (
  `user_id` int NOT NULL,
  `balance` bigint NOT NULL DEFAULT '0',
  `double` bigint NOT NULL DEFAULT '0',
  `crash` bigint NOT NULL DEFAULT '0',
  `mine` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_casino: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_contacts
CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_index` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_contacts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_gallery
CREATE TABLE IF NOT EXISTS `smartphone_gallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1044 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_gallery: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_ifood_orders
CREATE TABLE IF NOT EXISTS `smartphone_ifood_orders` (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `worker_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `fee` int DEFAULT NULL,
  `rate` tinyint DEFAULT '0',
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_ifood_orders: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_instagram
CREATE TABLE IF NOT EXISTS `smartphone_instagram` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verified` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_instagram: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_instagram_followers
CREATE TABLE IF NOT EXISTS `smartphone_instagram_followers` (
  `follower_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  PRIMARY KEY (`follower_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_instagram_followers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_instagram_likes
CREATE TABLE IF NOT EXISTS `smartphone_instagram_likes` (
  `post_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  PRIMARY KEY (`post_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_instagram_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_instagram_notifications
CREATE TABLE IF NOT EXISTS `smartphone_instagram_notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `author_id` int NOT NULL,
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `saw` tinyint NOT NULL DEFAULT '0',
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_instagram_notifications: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_instagram_posts
CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `post_id` bigint DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` bigint NOT NULL,
  `comments` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `profile_id_index` (`profile_id`) USING BTREE,
  KEY `post_id_index` (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=629 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.smartphone_instagram_posts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_olx
CREATE TABLE IF NOT EXISTS `smartphone_olx` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `images` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_olx: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_paypal_transactions
CREATE TABLE IF NOT EXISTS `smartphone_paypal_transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `target` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'payment',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` bigint NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_paypal_transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_tinder
CREATE TABLE IF NOT EXISTS `smartphone_tinder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bio` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` tinyint NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `show_gender` tinyint NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `show_tags` tinyint NOT NULL,
  `target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `gender_index` (`gender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_tinder: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_tinder_messages
CREATE TABLE IF NOT EXISTS `smartphone_tinder_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` int NOT NULL,
  `target` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `liked` tinyint NOT NULL DEFAULT '0',
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_tinder_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_tinder_rating
CREATE TABLE IF NOT EXISTS `smartphone_tinder_rating` (
  `profile_id` int NOT NULL,
  `rated_id` int NOT NULL,
  `rating` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_id`,`rated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_tinder_rating: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_tor_messages
CREATE TABLE IF NOT EXISTS `smartphone_tor_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'geral',
  `sender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_index` (`channel`),
  KEY `sender_index` (`sender`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_tor_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_tor_payments
CREATE TABLE IF NOT EXISTS `smartphone_tor_payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` bigint NOT NULL,
  `target` bigint NOT NULL,
  `amount` int NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_tor_payments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_twitter_followers
CREATE TABLE IF NOT EXISTS `smartphone_twitter_followers` (
  `follower_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_twitter_followers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_twitter_likes
CREATE TABLE IF NOT EXISTS `smartphone_twitter_likes` (
  `tweet_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_twitter_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_twitter_profiles
CREATE TABLE IF NOT EXISTS `smartphone_twitter_profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bannerURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verified` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_twitter_profiles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_twitter_tweets
CREATE TABLE IF NOT EXISTS `smartphone_twitter_tweets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `tweet_id` bigint DEFAULT NULL,
  `content` varchar(280) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_twitter_tweets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_uber_trips
CREATE TABLE IF NOT EXISTS `smartphone_uber_trips` (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_rate` tinyint DEFAULT '0',
  `driver_rate` tinyint DEFAULT '0',
  `created_at` int DEFAULT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_uber_trips: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_weazel
CREATE TABLE IF NOT EXISTS `smartphone_weazel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `videoURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_weazel: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_whatsapp
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `read_receipts` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_whatsapp: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_whatsapp_channels
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_channels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `target` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_whatsapp_channels: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_whatsapp_groups
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `members` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_whatsapp_groups: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.smartphone_whatsapp_messages
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint unsigned NOT NULL,
  `sender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `readed` tinyint NOT NULL DEFAULT '0',
  `saw_at` bigint NOT NULL DEFAULT '0',
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `channel_id_index` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.smartphone_whatsapp_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.summerz_vehicles
CREATE TABLE IF NOT EXISTS `summerz_vehicles` (
  `user_id` int NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `tax` int NOT NULL DEFAULT '0',
  `plate` varchar(20) DEFAULT NULL,
  `rental` int NOT NULL DEFAULT '0',
  `rendays` int NOT NULL DEFAULT '0',
  `arrest` int NOT NULL DEFAULT '0',
  `engine` int NOT NULL DEFAULT '1000',
  `body` int NOT NULL DEFAULT '1000',
  `fuel` int unsigned NOT NULL DEFAULT '100',
  `nitro` int NOT NULL DEFAULT '0',
  `work` varchar(5) DEFAULT 'false',
  `doors` varchar(254) NOT NULL,
  `windows` varchar(254) NOT NULL,
  `tyres` varchar(254) NOT NULL,
  `time` int NOT NULL DEFAULT '0',
  `ipva` varchar(50) NOT NULL,
  `alugado` tinyint NOT NULL DEFAULT '0',
  `data_alugado` text,
  `detido` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`vehicle`),
  KEY `user_id` (`user_id`),
  KEY `vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.summerz_vehicles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.taxs
CREATE TABLE IF NOT EXISTS `taxs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int NOT NULL DEFAULT '0',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Hour` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` int NOT NULL,
  `Message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.taxs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int NOT NULL DEFAULT '0',
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` int NOT NULL,
  `Balance` int NOT NULL,
  `Timeset` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`),
  KEY `idx_transactions_timeset` (`Timeset`)
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Passport` int NOT NULL DEFAULT '0',
  `Vehicle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Tax` int NOT NULL DEFAULT '0',
  `Plate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Weight` int NOT NULL DEFAULT '0',
  `Rental` int NOT NULL DEFAULT '0',
  `Arrest` int NOT NULL DEFAULT '0',
  `Block` tinyint(1) NOT NULL DEFAULT '0',
  `Dismantle` int NOT NULL DEFAULT '0',
  `Engine` int NOT NULL DEFAULT '1000',
  `Body` int NOT NULL DEFAULT '1000',
  `Health` int NOT NULL DEFAULT '1000',
  `Fuel` int NOT NULL DEFAULT '100',
  `Nitro` int NOT NULL DEFAULT '0',
  `Work` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `Mode` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal',
  `Doors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Windows` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Tyres` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Brakes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Drift` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Vehicle` (`Vehicle`) USING BTREE,
  KEY `idx_vehicles_passport_work` (`Passport`,`Work`),
  KEY `idx_vehicles_passport_vehicle` (`Passport`,`Vehicle`),
  KEY `idx_vehicles_plate` (`Plate`),
  KEY `idx_vehicles_rental` (`Rental`),
  KEY `idx_vehicles_tax` (`Tax`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.vehicles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `comprador` varchar(64) NOT NULL,
  `item` varchar(100) NOT NULL,
  `quantidade` int NOT NULL DEFAULT '0',
  `valor` int NOT NULL DEFAULT '0',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_data` (`data`),
  CONSTRAINT `fk_vendas_store` FOREIGN KEY (`store_id`) REFERENCES `lojas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela rshopv7.vendas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.vrp_user_missions
CREATE TABLE IF NOT EXISTS `vrp_user_missions` (
  `user_id` int NOT NULL,
  `level` int DEFAULT '1',
  `experience` int DEFAULT '0',
  `active_missions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `completed_missions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_mission_time` bigint DEFAULT '0',
  `taxista_cooldown` bigint DEFAULT '0',
  `onibus_cooldown` bigint DEFAULT '0',
  `encomendas_cooldown` bigint DEFAULT '0',
  `minerador_cooldown` bigint DEFAULT '0',
  `tempo_online_cooldown` bigint DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `idx_vrp_user_missions_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela rshopv7.vrp_user_missions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.warehouse
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Weight` int NOT NULL DEFAULT '50',
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Passport` int NOT NULL DEFAULT '0',
  `Tax` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`),
  KEY `idx_warehouse_name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela rshopv7.warehouse: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela rshopv7.warrants
CREATE TABLE IF NOT EXISTS `warrants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` text,
  `identity` text,
  `status` text,
  `nidentity` text,
  `timeStamp` text,
  `reason` text,
  PRIMARY KEY (`id`),
  KEY `portId` (`id`),
  KEY `idx_warrants_user_id` (`user_id`(64))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela rshopv7.warrants: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
