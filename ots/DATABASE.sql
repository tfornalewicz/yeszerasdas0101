-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 31 Sie 2017, 12:32
-- Wersja serwera: 10.1.25-MariaDB
-- Wersja PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `global`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `coins` int(12) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL,
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0',
  `passed` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `refresh` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premdays`, `coins`, `lastday`, `email`, `creation`, `vote`, `key`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vip_time`, `guild_points`, `guild_points_stats`, `passed`, `block`, `refresh`) VALUES
(1, '1', 'e4e088f4eaa96db85e11ba491a189f96f2e11793', NULL, 1, 0, 0, 0, '', 0, 0, '0', '', 0, '', '', 3, '', 0, 0, 0, 0, 1504160617, 'unknown', 0, 0, 0, 0, 0, 0),
(8, 'god', '21298df8a3277357ee55b01df9530b535cf08ec1', NULL, 5, 0, 0, 0, '', 1465696163, 0, 'BSLH5EYDNW', '', 0, 'Jonathan', 'SÃ£o Paulo', 9999, '', 0, 99, 0, 0, 1473105428, '', 0, 0, 0, 0, 0, 0),
(9, 'ERICKZIN', '802744e3204358bd52d2b8e4d39724ed62331fb3', NULL, 1, 0, 0, 0, 'erick@erick.com', 1493217954, 0, '', '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0),
(19, 'TESTOWE', '7839e0d1e93148d384881adfbe3c61d55cf1081a', NULL, 1, 999, 20, 1504063307, 'tfornalewicz@yahoo.com', 1504063307, 0, '', '', 0, '', '', 0, '', 0, 0, 0, 2130706433, 0, 'unknown', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `account_viplist`
--

INSERT INTO `account_viplist` (`account_id`, `player_id`, `description`, `icon`, `notify`) VALUES
(19, 167, '', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blessings_history`
--

CREATE TABLE `blessings_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `blessing` tinyint(4) NOT NULL,
  `loss` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `last_execute_points` int(11) NOT NULL DEFAULT '0',
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Wyzwalacze `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT '0',
  `targetguild` int(11) NOT NULL DEFAULT '0',
  `warid` int(11) NOT NULL DEFAULT '0',
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT '0',
  `guild2` int(11) NOT NULL DEFAULT '0',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `started` bigint(15) NOT NULL DEFAULT '0',
  `ended` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `bid` int(11) NOT NULL DEFAULT '0',
  `bid_end` int(11) NOT NULL DEFAULT '0',
  `last_bid` int(11) NOT NULL DEFAULT '0',
  `highest_bidder` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `beds` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `houses`
--

INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `beds`) VALUES
(1, 0, 0, 0, 'ul. Kinerowa 1', 3900, 1, 0, 0, 0, 0, 87, 2),
(2, 0, 0, 0, 'ul. Kinerowa 5', 8500, 1, 0, 0, 0, 0, 177, 4),
(3, 0, 0, 0, 'ul. Kinerowa 6', 6400, 1, 0, 0, 0, 0, 164, 4),
(4, 0, 0, 0, 'Jeziorna 5', 2300, 1, 0, 0, 0, 0, 43, 1),
(5, 0, 0, 0, 'Jeziorna 4', 2300, 1, 0, 0, 0, 0, 48, 1),
(155, 0, 0, 0, 'Os. Polnocna Brama 1', 3000, 1, 0, 0, 0, 0, 55, 1),
(156, 0, 0, 0, 'Os. Polnocna Brama 2', 3000, 1, 0, 0, 0, 0, 72, 1),
(157, 0, 0, 0, 'Os. Polnocna Brama 3', 6200, 1, 0, 0, 0, 0, 110, 2),
(158, 0, 0, 0, 'Os. Polnocna Brama 5', 3400, 1, 0, 0, 0, 0, 82, 1),
(159, 0, 0, 0, 'Os. Polnocna Brama 7', 3400, 1, 0, 0, 0, 0, 80, 1),
(160, 0, 0, 0, 'Os. Polnocna Brama 9', 4800, 1, 0, 0, 0, 0, 126, 2),
(161, 0, 0, 0, 'Os. Polnocna Brama 8', 5800, 1, 0, 0, 0, 0, 156, 4),
(162, 0, 0, 0, 'Os. Polnocna Brama 10', 5600, 1, 0, 0, 0, 0, 132, 2),
(163, 0, 0, 0, 'Os. Polnocna Brama 11', 6600, 1, 0, 0, 0, 0, 150, 2),
(164, 0, 0, 0, 'Os. Polnocna Brama 14', 2700, 1, 0, 0, 0, 0, 84, 2),
(165, 0, 0, 0, 'Os. Polnocna Brama 16', 3000, 1, 0, 0, 0, 0, 72, 1),
(166, 0, 0, 0, 'Os. Polnocna Brama 17', 3000, 1, 0, 0, 0, 0, 60, 1),
(167, 0, 0, 0, 'Os. Polnocna Brama 15', 4100, 1, 0, 0, 0, 0, 112, 2),
(168, 0, 0, 0, 'Os. Polnocna Brama 13', 4400, 1, 0, 0, 0, 0, 90, 2),
(169, 0, 0, 0, 'Os. Polnocna Brama 12', 4400, 1, 0, 0, 0, 0, 108, 2),
(170, 0, 0, 0, 'Os. Polnocna Brama 6', 1600, 1, 0, 0, 0, 0, 40, 1),
(171, 0, 0, 0, 'Os. Polnocna Brama 4', 1600, 1, 0, 0, 0, 0, 40, 1),
(172, 0, 0, 0, 'ul. Kinerowa 4', 1800, 1, 0, 0, 0, 0, 36, 1),
(173, 0, 0, 0, 'ul. Kinerowa 3', 1400, 1, 0, 0, 0, 0, 36, 1),
(174, 0, 0, 0, 'ul. Kinerowa 2', 1800, 1, 0, 0, 0, 0, 42, 1),
(176, 0, 0, 0, 'ul. Bialkowa 1', 5700, 1, 0, 0, 0, 0, 83, 1),
(177, 0, 0, 0, 'ul. Bialkowa 2', 5700, 1, 0, 0, 0, 0, 83, 1),
(178, 0, 0, 0, 'ul. Bialkowa 4', 5700, 1, 0, 0, 0, 0, 83, 1),
(179, 0, 0, 0, 'ul. Bialkowa 3', 6700, 1, 0, 0, 0, 0, 94, 1),
(180, 0, 0, 0, 'ul. Bialkowa 6', 5500, 1, 0, 0, 0, 0, 83, 2),
(181, 0, 0, 0, 'ul. Bialkowa 8', 5700, 1, 0, 0, 0, 0, 83, 1),
(182, 0, 0, 0, 'ul. Bialkowa 7', 6700, 1, 0, 0, 0, 0, 93, 1),
(183, 0, 0, 0, 'ul. Bialkowa 9', 5700, 1, 0, 0, 0, 0, 83, 1),
(184, 0, 0, 0, 'ul. Bialkowa 10', 5700, 1, 0, 0, 0, 0, 83, 1),
(185, 0, 0, 0, 'ul. Bialkowa 12', 8600, 1, 0, 0, 0, 0, 172, 3),
(186, 0, 0, 0, 'ul. Bialkowa 11', 7400, 1, 0, 0, 0, 0, 140, 2),
(187, 0, 0, 0, 'ul. Bialkowa 13', 6300, 1, 0, 0, 0, 0, 133, 2),
(188, 0, 0, 0, 'Walesa Street 12', 6100, 1, 0, 0, 0, 0, 132, 2),
(189, 0, 0, 0, 'Walesa Street 14', 2700, 1, 0, 0, 0, 0, 61, 2),
(190, 0, 0, 0, 'Walesa Street 18', 1900, 1, 0, 0, 0, 0, 39, 2),
(191, 0, 0, 0, 'Walesa Street 19', 2100, 1, 0, 0, 0, 0, 60, 2),
(192, 0, 0, 0, 'Walesa Street 16', 6700, 1, 0, 0, 0, 0, 148, 4),
(193, 0, 0, 0, 'Walesa Street 17', 4000, 1, 0, 0, 0, 0, 88, 1),
(194, 0, 0, 0, 'Walesa Street 15', 4300, 1, 0, 0, 0, 0, 93, 1),
(195, 0, 0, 0, 'Walesa Street 13', 9500, 1, 0, 0, 0, 0, 185, 2),
(196, 0, 0, 0, 'Walesa Street 11', 8000, 1, 0, 0, 0, 0, 154, 2),
(197, 0, 0, 0, 'Walesa Street 9', 4000, 1, 0, 0, 0, 0, 76, 2),
(198, 0, 0, 0, 'Walesa Street 7', 6500, 1, 0, 0, 0, 0, 135, 2),
(199, 0, 0, 0, 'Walesa Street 6', 2200, 1, 0, 0, 0, 0, 48, 1),
(200, 0, 0, 0, 'Walesa Street 8', 6800, 1, 0, 0, 0, 0, 98, 2),
(201, 0, 0, 0, 'Walesa Street 10', 6800, 1, 0, 0, 0, 0, 98, 2),
(202, 0, 0, 0, 'Walesa Street 5', 9500, 1, 0, 0, 0, 0, 180, 2),
(203, 0, 0, 0, 'Walesa Street 4', 9500, 1, 0, 0, 0, 0, 180, 2),
(204, 0, 0, 0, 'Walesa Street 3', 9500, 1, 0, 0, 0, 0, 180, 2),
(205, 0, 0, 0, 'Walesa Street 2', 9300, 1, 0, 0, 0, 0, 180, 3),
(206, 166, 1504693565, 0, 'Walesa\'s Ranch', 8700, 1, 0, 0, 0, 0, 200, 2),
(207, 0, 0, 0, 'Walesa Street 0/1', 2800, 1, 0, 0, 0, 0, 56, 1),
(208, 0, 0, 0, 'Walesa Street 0/2', 2800, 1, 0, 0, 0, 0, 56, 1),
(209, 0, 0, 0, 'Walesa Street 1/2', 1000, 1, 0, 0, 0, 0, 30, 1),
(210, 0, 0, 0, 'Walesa Street 1/4', 1300, 1, 0, 0, 0, 0, 27, 1),
(211, 0, 0, 0, 'Walesa Street 1/5', 1000, 1, 0, 0, 0, 0, 25, 1),
(212, 0, 0, 0, 'Walesa Street 1/3', 1300, 1, 0, 0, 0, 0, 25, 1),
(213, 0, 0, 0, 'Walesa Street 1/1', 1000, 1, 0, 0, 0, 0, 30, 1),
(214, 0, 0, 0, 'Walesa Street 1/6', 1000, 1, 0, 0, 0, 0, 27, 1),
(215, 0, 0, 0, 'Walesa Street 1/8', 1300, 1, 0, 0, 0, 0, 25, 1),
(216, 0, 0, 0, 'Walesa Street 1/10', 1000, 1, 0, 0, 0, 0, 25, 1),
(217, 0, 0, 0, 'Walesa Street 1/9', 1300, 1, 0, 0, 0, 0, 30, 1),
(218, 0, 0, 0, 'Walesa Street 1/7', 1000, 1, 0, 0, 0, 0, 30, 1),
(219, 0, 0, 0, 'Walesa Street 1/15', 1000, 1, 0, 0, 0, 0, 30, 1),
(220, 0, 0, 0, 'Walesa Street 1/14', 1300, 1, 0, 0, 0, 0, 30, 1),
(221, 0, 0, 0, 'Walesa Street 1/13', 1000, 1, 0, 0, 0, 0, 25, 1),
(222, 0, 0, 0, 'Walesa Street 1/12', 1300, 1, 0, 0, 0, 0, 25, 1),
(223, 0, 0, 0, 'Walesa Street 1/11', 1000, 1, 0, 0, 0, 0, 30, 1),
(224, 0, 0, 0, 'Walesa Street 1/16', 1800, 1, 0, 0, 0, 0, 35, 1),
(225, 0, 0, 0, 'Walesa Street 1/17', 1900, 1, 0, 0, 0, 0, 37, 1),
(226, 0, 0, 0, 'Walesa Street 1/Schowek na miotly', 1800, 1, 0, 0, 0, 0, 35, 1),
(227, 0, 0, 0, 'ul. Cenzodudy 6', 8700, 1, 0, 0, 0, 0, 130, 2),
(228, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 17', 700, 1, 0, 0, 0, 0, 25, 1),
(229, 0, 0, 0, 'ul. Cenzodudy 5', 2600, 1, 0, 0, 0, 0, 64, 2),
(230, 0, 0, 0, 'ul. Cenzodudy 3', 5300, 1, 0, 0, 0, 0, 117, 2),
(231, 0, 0, 0, 'ul. Cenzodudy 4', 2000, 1, 0, 0, 0, 0, 45, 2),
(232, 0, 0, 0, 'ul. Cenzodudy 2', 10400, 1, 0, 0, 0, 0, 167, 2),
(233, 0, 0, 0, 'ul. Cenzodudy 1', 7400, 1, 0, 0, 0, 0, 147, 2),
(234, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 1', 700, 1, 0, 0, 0, 0, 23, 1),
(235, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 2', 700, 1, 0, 0, 0, 0, 20, 1),
(236, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 3', 700, 1, 0, 0, 0, 0, 20, 1),
(237, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 4', 600, 1, 0, 0, 0, 0, 18, 1),
(238, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 5', 600, 1, 0, 0, 0, 0, 24, 1),
(239, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 6', 700, 1, 0, 0, 0, 0, 25, 1),
(240, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 7', 700, 1, 0, 0, 0, 0, 20, 1),
(241, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 8', 700, 1, 0, 0, 0, 0, 20, 1),
(242, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 9', 700, 1, 0, 0, 0, 0, 25, 1),
(243, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 10', 1000, 1, 0, 0, 0, 0, 30, 1),
(244, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 11', 700, 1, 0, 0, 0, 0, 25, 1),
(245, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 12', 700, 1, 0, 0, 0, 0, 17, 1),
(246, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 13', 700, 1, 0, 0, 0, 0, 20, 1),
(247, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 14', 700, 1, 0, 0, 0, 0, 20, 1),
(248, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 15', 700, 1, 0, 0, 0, 0, 20, 1),
(249, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 18', 700, 1, 0, 0, 0, 0, 20, 1),
(250, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 16', 700, 1, 0, 0, 0, 0, 25, 1),
(251, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 19', 700, 1, 0, 0, 0, 0, 20, 1),
(252, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 20', 700, 1, 0, 0, 0, 0, 20, 1),
(253, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 21', 700, 1, 0, 0, 0, 0, 20, 1),
(254, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 22', 700, 1, 0, 0, 0, 0, 25, 1),
(257, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 23', 700, 1, 0, 0, 0, 0, 25, 1),
(258, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 24', 700, 1, 0, 0, 0, 0, 20, 1),
(259, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 25', 700, 1, 0, 0, 0, 0, 20, 1),
(260, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 26', 700, 1, 0, 0, 0, 0, 20, 1),
(261, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 27', 700, 1, 0, 0, 0, 0, 20, 1),
(262, 0, 0, 0, 'Mieszkanie socjalne \"Piotr M. Luszcz\" 28', 700, 1, 0, 0, 0, 0, 25, 1),
(263, 0, 0, 0, 'Sklepowa 1', 8700, 1, 0, 0, 0, 0, 174, 2),
(264, 0, 0, 0, 'Sklepowa 2', 6900, 1, 0, 0, 0, 0, 162, 3),
(265, 0, 0, 0, 'Sklepowa 3', 6600, 1, 0, 0, 0, 0, 145, 2),
(266, 0, 0, 0, 'Kamienny Klasztor', 8200, 1, 0, 0, 0, 0, 211, 3),
(267, 0, 0, 0, 'Willa Mirko', 20000, 1, 0, 0, 0, 0, 935, 14),
(268, 0, 0, 0, 'Jeziorna 1/1', 3100, 1, 0, 0, 0, 0, 71, 2),
(269, 0, 0, 0, 'Jeziorna 1/2', 3600, 1, 0, 0, 0, 0, 73, 2),
(270, 0, 0, 0, 'Jeziorna 2/1', 3400, 1, 0, 0, 0, 0, 78, 2),
(271, 0, 0, 0, 'Jeziorna 2/2', 2800, 1, 0, 0, 0, 0, 68, 2),
(272, 0, 0, 0, 'Jeziorna 3/1', 700, 1, 0, 0, 0, 0, 25, 1),
(273, 0, 0, 0, 'Jeziorna 3/2', 400, 1, 0, 0, 0, 0, 16, 1),
(274, 0, 0, 0, 'Jeziorna 3/3', 700, 1, 0, 0, 0, 0, 20, 1),
(275, 0, 0, 0, 'Jeziorna 3/4', 400, 1, 0, 0, 0, 0, 20, 1),
(276, 0, 0, 0, 'Jezirona 3/5', 1500, 1, 0, 0, 0, 0, 33, 1),
(277, 0, 0, 0, 'Jeziorna 3/6', 2000, 1, 0, 0, 0, 0, 54, 2),
(278, 0, 0, 0, 'Os. Zielonki 1', 5200, 1, 0, 0, 0, 0, 103, 1),
(279, 0, 0, 0, 'Os. Zielonki 2', 5400, 1, 0, 0, 0, 0, 105, 1),
(280, 0, 0, 0, 'Os. Zielonki 3', 5700, 1, 0, 0, 0, 0, 129, 2),
(281, 0, 0, 0, 'Os. Zielonki 4', 5700, 1, 0, 0, 0, 0, 127, 2),
(282, 0, 0, 0, 'Os. Zielonki 5/1', 6300, 1, 0, 0, 0, 0, 122, 1),
(283, 0, 0, 0, 'Os. Zielonki 5/2', 5400, 1, 0, 0, 0, 0, 118, 3),
(284, 0, 0, 0, 'Os. Zielonki 6/1', 3600, 1, 0, 0, 0, 0, 78, 2),
(285, 0, 0, 0, 'Os. Zielonki 6/2', 2000, 1, 0, 0, 0, 0, 49, 2),
(286, 0, 0, 0, 'Os. Zielonki 6/3', 2200, 1, 0, 0, 0, 0, 60, 1),
(287, 0, 0, 0, 'Os. Zielonki 7/1', 5300, 1, 0, 0, 0, 0, 112, 2),
(288, 0, 0, 0, 'Os. Zielonki 7/2', 4800, 1, 0, 0, 0, 0, 101, 2),
(289, 0, 0, 0, 'Os. Zielonki 7/3', 2200, 1, 0, 0, 0, 0, 52, 1),
(290, 0, 0, 0, 'Os. Zielonki 8/1', 2500, 1, 0, 0, 0, 0, 58, 1),
(291, 0, 0, 0, 'Os. Zielonki 8/2', 4000, 1, 0, 0, 0, 0, 91, 1),
(292, 0, 0, 0, 'Os. Zielonki 9/1', 4200, 1, 0, 0, 0, 0, 82, 1),
(293, 0, 0, 0, 'Os. Zielonki 9/2', 3500, 1, 0, 0, 0, 0, 84, 2),
(295, 0, 0, 0, 'Wieza Widokowa', 7300, 6, 0, 0, 0, 0, 166, 1),
(296, 0, 0, 0, 'Mostowa 1', 5500, 5, 0, 0, 0, 0, 103, 1),
(297, 0, 0, 0, 'Mostowa 2', 5000, 5, 0, 0, 0, 0, 115, 2),
(298, 0, 0, 0, 'Mostowa 3', 6500, 5, 0, 0, 0, 0, 130, 2),
(299, 0, 0, 0, 'Mostowa 4', 1000, 5, 0, 0, 0, 0, 30, 1),
(300, 0, 0, 0, 'Mostowa 5', 1000, 5, 0, 0, 0, 0, 30, 1),
(301, 0, 0, 0, 'Mostowa 6', 1000, 5, 0, 0, 0, 0, 27, 1),
(302, 0, 0, 0, 'Mlyn', 800, 5, 0, 0, 0, 0, 36, 1),
(303, 0, 0, 0, 'Farma Mirkowo', 2500, 5, 0, 0, 0, 0, 60, 2),
(304, 0, 0, 0, 'Pozioma 1', 1000, 5, 0, 0, 0, 0, 30, 1),
(305, 0, 0, 0, 'Pozioma 2', 1400, 5, 0, 0, 0, 0, 36, 1),
(306, 0, 0, 0, 'Pozioma 3', 4300, 5, 0, 0, 0, 0, 96, 2),
(307, 0, 0, 0, 'Pozioma 4', 6300, 5, 0, 0, 0, 0, 139, 2),
(308, 0, 0, 0, 'Pozioma 5', 4300, 5, 0, 0, 0, 0, 91, 2),
(309, 0, 0, 0, 'Pozioma 6', 2600, 5, 0, 0, 0, 0, 54, 1),
(310, 0, 0, 0, 'Pozioma 7', 3800, 5, 0, 0, 0, 0, 88, 1),
(311, 0, 0, 0, 'Pozioma 8', 3500, 5, 0, 0, 0, 0, 84, 2),
(312, 0, 0, 0, 'Pozioma 10', 4500, 5, 0, 0, 0, 0, 82, 1),
(313, 0, 0, 0, 'Pozioma 9', 3500, 5, 0, 0, 0, 0, 84, 2),
(314, 0, 0, 0, 'Farma', 6500, 6, 0, 0, 0, 0, 163, 3),
(315, 0, 0, 0, 'Mokra 2', 2800, 5, 0, 0, 0, 0, 72, 1),
(316, 0, 0, 0, 'Mokra 1', 3300, 5, 0, 0, 0, 0, 53, 1),
(317, 0, 0, 0, 'Mokra 3', 4400, 5, 0, 0, 0, 0, 106, 2),
(318, 0, 0, 0, 'Mokra 4', 3000, 5, 0, 0, 0, 0, 71, 2),
(319, 0, 0, 0, 'Slonecznikowa 1', 1800, 5, 0, 0, 0, 0, 42, 1),
(320, 0, 0, 0, 'Slonecznikowa 2', 1800, 5, 0, 0, 0, 0, 42, 1),
(321, 0, 0, 0, 'Slonecznikowa 3', 1000, 5, 0, 0, 0, 0, 30, 1),
(322, 0, 0, 0, 'Slonecznikowa 4', 1000, 5, 0, 0, 0, 0, 30, 1),
(323, 0, 0, 0, 'Slonecznikowa 5', 2200, 5, 0, 0, 0, 0, 48, 1),
(325, 0, 0, 0, 'Slonecznikowa 6', 5300, 5, 0, 0, 0, 0, 132, 2),
(326, 0, 0, 0, 'Domek na drzewie', 2100, 6, 0, 0, 0, 0, 48, 2),
(327, 0, 0, 0, 'Rybacka 1/1', 400, 4, 0, 0, 0, 0, 15, 1),
(328, 0, 0, 0, 'Rybacka 1/2', 400, 4, 0, 0, 0, 0, 15, 1),
(329, 0, 0, 0, 'Rybacka 1/3', 5300, 4, 0, 0, 0, 0, 99, 2),
(330, 0, 0, 0, 'Rybacka 1/4', 400, 4, 0, 0, 0, 0, 15, 1),
(331, 0, 0, 0, 'Rybacka 1/5', 400, 4, 0, 0, 0, 0, 20, 1),
(332, 0, 0, 0, 'Rybacka 2', 6600, 4, 0, 0, 0, 0, 134, 2),
(333, 0, 0, 0, 'Rybacka 3', 1000, 4, 0, 0, 0, 0, 30, 1),
(334, 0, 0, 0, 'Rybacka 4', 7800, 4, 0, 0, 0, 0, 147, 2),
(335, 0, 0, 0, 'Rybacka 5', 3100, 4, 0, 0, 0, 0, 72, 2),
(336, 0, 0, 0, 'Rynek 1', 5100, 4, 0, 0, 0, 0, 103, 2),
(337, 0, 0, 0, 'Rynek 2', 7700, 4, 0, 0, 0, 0, 143, 2),
(338, 0, 0, 0, 'Rynek 3', 5300, 4, 0, 0, 0, 0, 105, 2),
(339, 0, 0, 0, 'Rynek 4', 4300, 4, 0, 0, 0, 0, 93, 2),
(340, 0, 0, 0, 'Rynek 5', 8100, 4, 0, 0, 0, 0, 166, 2),
(341, 0, 0, 0, 'Wilcza 1', 1400, 4, 0, 0, 0, 0, 32, 2),
(342, 0, 0, 0, 'Wilcza 2', 1400, 4, 0, 0, 0, 0, 40, 2),
(343, 0, 0, 0, 'Wilcza 3', 2100, 4, 0, 0, 0, 0, 42, 2),
(344, 0, 0, 0, 'Wilcza 4/1', 400, 4, 0, 0, 0, 0, 15, 1),
(345, 0, 0, 0, 'Wilcza 4/2', 700, 4, 0, 0, 0, 0, 25, 1),
(346, 0, 0, 0, 'Wilcza 4/3', 700, 4, 0, 0, 0, 0, 20, 1),
(347, 0, 0, 0, 'Wilcza 4/4', 700, 4, 0, 0, 0, 0, 25, 1),
(348, 0, 0, 0, 'Wilcza 4/5', 1600, 4, 0, 0, 0, 0, 35, 2),
(349, 0, 0, 0, 'Wilcza 4/6', 1600, 4, 0, 0, 0, 0, 42, 2),
(350, 0, 0, 0, 'Wilcza 5/1', 700, 4, 0, 0, 0, 0, 20, 1),
(351, 0, 0, 0, 'Wilcza 5/2', 700, 4, 0, 0, 0, 0, 25, 1),
(352, 0, 0, 0, 'Wilcza 5/3', 700, 4, 0, 0, 0, 0, 25, 1),
(353, 0, 0, 0, 'Wilcza 5/4', 700, 4, 0, 0, 0, 0, 20, 1),
(354, 0, 0, 0, 'Wilcza 5/5', 700, 4, 0, 0, 0, 0, 20, 1),
(355, 0, 0, 0, 'Wilcza 5/6', 1100, 4, 0, 0, 0, 0, 35, 2),
(356, 0, 0, 0, 'Wilcza 5/7', 700, 4, 0, 0, 0, 0, 20, 1),
(357, 0, 0, 0, 'Wilcza 5/8', 700, 4, 0, 0, 0, 0, 20, 1),
(358, 0, 0, 0, 'Wilcza 5/9', 1100, 4, 0, 0, 0, 0, 35, 2),
(359, 0, 0, 0, 'Wilcza 5/10', 700, 4, 0, 0, 0, 0, 20, 1),
(360, 0, 0, 0, 'Wilcza 5/11', 1100, 4, 0, 0, 0, 0, 24, 1),
(361, 0, 0, 0, 'Wilcza 5/12', 1100, 4, 0, 0, 0, 0, 34, 2),
(362, 0, 0, 0, 'Wykleta 1', 3100, 4, 0, 0, 0, 0, 72, 2),
(363, 0, 0, 0, 'Wykleta 2', 2600, 4, 0, 0, 0, 0, 61, 2),
(364, 0, 0, 0, 'Wykleta 3', 2700, 4, 0, 0, 0, 0, 64, 2),
(365, 0, 0, 0, 'Wykleta 4/1', 700, 4, 0, 0, 0, 0, 20, 1),
(366, 0, 0, 0, 'Wykleta 4/2', 1400, 4, 0, 0, 0, 0, 30, 1),
(367, 0, 0, 0, 'Wykleta 4/3', 2400, 4, 0, 0, 0, 0, 60, 2),
(368, 0, 0, 0, 'Wykleta 4/4', 700, 4, 0, 0, 0, 0, 23, 1),
(369, 0, 0, 0, 'Wykleta 4/5', 2600, 4, 0, 0, 0, 0, 58, 1),
(370, 0, 0, 0, 'Wykleta 4/6', 1800, 4, 0, 0, 0, 0, 46, 1),
(371, 0, 0, 0, 'Wykleta 5', 8800, 4, 0, 0, 0, 0, 152, 2),
(372, 0, 0, 0, 'Wykleta 6', 7700, 4, 0, 0, 0, 0, 132, 2),
(373, 0, 0, 0, 'Wykleta 7', 4000, 4, 0, 0, 0, 0, 66, 0),
(374, 0, 0, 0, 'Wykleta 8/1', 700, 4, 0, 0, 0, 0, 25, 1),
(375, 0, 0, 0, 'Wykleta 8/2', 700, 4, 0, 0, 0, 0, 25, 1),
(376, 0, 0, 0, 'Wykleta 8/3', 1000, 4, 0, 0, 0, 0, 25, 1),
(377, 0, 0, 0, 'Wykleta 8/4', 1000, 4, 0, 0, 0, 0, 30, 1),
(378, 0, 0, 0, 'Wykleta 8/5', 1400, 4, 0, 0, 0, 0, 30, 1),
(379, 0, 0, 0, 'Wykleta 8/6', 2900, 4, 0, 0, 0, 0, 61, 2),
(380, 0, 0, 0, 'Palac 1', 1900, 2, 0, 0, 0, 0, 69, 1),
(381, 0, 0, 0, 'Palac 2', 2400, 2, 0, 0, 0, 0, 75, 1),
(382, 0, 0, 0, 'Palac 3', 1900, 2, 0, 0, 0, 0, 76, 1),
(383, 0, 0, 0, 'Palac 4', 2400, 2, 0, 0, 0, 0, 83, 1),
(384, 0, 0, 0, 'Sloneczna 1', 5700, 2, 0, 0, 0, 0, 109, 1),
(385, 0, 0, 0, 'Sloneczna 2', 5700, 2, 0, 0, 0, 0, 108, 1),
(386, 0, 0, 0, 'Sloneczna 3', 2800, 2, 0, 0, 0, 0, 70, 1),
(387, 0, 0, 0, 'Sloneczna 4', 3000, 2, 0, 0, 0, 0, 72, 1),
(388, 0, 0, 0, 'Sloneczna 5', 5400, 2, 0, 0, 0, 0, 90, 1),
(389, 0, 0, 0, 'Sloneczna 6', 5600, 2, 0, 0, 0, 0, 119, 1),
(390, 0, 0, 0, 'Os. Gorace 1/1', 2400, 2, 0, 0, 0, 0, 64, 1),
(391, 0, 0, 0, 'Os. Gorace 1/2', 3200, 2, 0, 0, 0, 0, 64, 1),
(392, 0, 0, 0, 'Os. Gorace 1/3', 3200, 2, 0, 0, 0, 0, 64, 1),
(393, 0, 0, 0, 'Os. Gorace 2/1', 7900, 2, 0, 0, 0, 0, 145, 1),
(394, 0, 0, 0, 'Os. Gorace 2/2', 5200, 2, 0, 0, 0, 0, 100, 1),
(395, 0, 0, 0, 'Os. Gorace 3', 6200, 2, 0, 0, 0, 0, 145, 2),
(396, 0, 0, 0, 'Os. Gorace 4/1', 2400, 2, 0, 0, 0, 0, 62, 1),
(397, 0, 0, 0, 'Os. Gorace 4/2', 3200, 2, 0, 0, 0, 0, 63, 1),
(398, 0, 0, 0, 'Os. Gorace 4/3', 3200, 2, 0, 0, 0, 0, 61, 1),
(400, 0, 0, 0, 'Piaskowa 1/1', 2600, 2, 0, 0, 0, 0, 64, 1),
(401, 0, 0, 0, 'Piaskowa 1/2', 1600, 2, 0, 0, 0, 0, 40, 1),
(402, 0, 0, 0, 'Piaskowa 2/1', 3700, 2, 0, 0, 0, 0, 71, 0),
(403, 0, 0, 0, 'Piaskowa 2/2', 2100, 2, 0, 0, 0, 0, 51, 2),
(404, 0, 0, 0, 'Piaskowa 3', 4700, 2, 0, 0, 0, 0, 104, 2),
(405, 0, 0, 0, 'Piaskowa 4', 8700, 2, 0, 0, 0, 0, 153, 2),
(406, 0, 0, 0, 'Os. Palmowe 1/1', 3700, 2, 0, 0, 0, 0, 85, 2),
(407, 0, 0, 0, 'Os. Palmowe 1/2', 2700, 2, 0, 0, 0, 0, 64, 2),
(408, 0, 0, 0, 'Os. Palmowe 1/3', 3700, 2, 0, 0, 0, 0, 85, 2),
(409, 0, 0, 0, 'Os. Palmowe 1/4', 2700, 2, 0, 0, 0, 0, 64, 2),
(410, 0, 0, 0, 'Os. Palmowe 2/1', 7100, 2, 0, 0, 0, 0, 146, 2),
(411, 0, 0, 0, 'Os. Palmowe 2/2', 3800, 2, 0, 0, 0, 0, 91, 1),
(412, 0, 0, 0, 'Os. Palmowe 3', 3200, 2, 0, 0, 0, 0, 70, 4),
(413, 0, 0, 0, 'Os. Palmowe 4', 3200, 2, 0, 0, 0, 0, 84, 4),
(414, 0, 0, 0, 'Os. Palmowe 5', 7100, 2, 0, 0, 0, 0, 138, 2),
(415, 0, 0, 0, 'Os. Palmowe 6', 4300, 2, 0, 0, 0, 0, 98, 1),
(416, 0, 0, 0, 'Plazowa 1', 700, 3, 0, 0, 0, 0, 20, 1),
(417, 0, 0, 0, 'Plazowa 2', 2800, 3, 0, 0, 0, 0, 66, 2),
(418, 0, 0, 0, 'Plazowa 3', 700, 3, 0, 0, 0, 0, 25, 1),
(419, 0, 0, 0, 'Plazowa 4', 700, 3, 0, 0, 0, 0, 20, 1),
(420, 0, 0, 0, 'Plazowa 5', 700, 3, 0, 0, 0, 0, 25, 1),
(422, 0, 0, 0, 'Jaglana 1', 1000, 3, 0, 0, 0, 0, 30, 1),
(423, 0, 0, 0, 'Jaglana 2', 3600, 3, 0, 0, 0, 0, 85, 1),
(424, 0, 0, 0, 'Jaglana 3', 8000, 3, 0, 0, 0, 0, 163, 2),
(425, 0, 0, 0, 'Jaglana 4', 4300, 3, 0, 0, 0, 0, 98, 2),
(426, 0, 0, 0, 'Zrodlo 1', 1300, 3, 0, 0, 0, 0, 77, 3),
(427, 0, 0, 0, 'Zrodlo 2', 4300, 3, 0, 0, 0, 0, 150, 1),
(428, 0, 0, 0, 'Zrodlo 3', 2900, 3, 0, 0, 0, 0, 137, 1),
(429, 0, 0, 0, 'Zrodlo 4', 4900, 3, 0, 0, 0, 0, 134, 1),
(430, 0, 0, 0, 'Bambusowa 1', 1800, 3, 0, 0, 0, 0, 51, 2),
(431, 0, 0, 0, 'Bambusowa 2', 5300, 3, 0, 0, 0, 0, 124, 2),
(432, 0, 0, 0, 'Bambusowa 3', 3600, 3, 0, 0, 0, 0, 97, 2),
(433, 0, 0, 0, 'Bambusowa 4', 900, 3, 0, 0, 0, 0, 33, 1),
(434, 0, 0, 0, 'Bambusowa 5', 1900, 3, 0, 0, 0, 0, 57, 2),
(435, 0, 0, 0, 'Bambusowa 6', 2200, 3, 0, 0, 0, 0, 51, 1),
(436, 0, 0, 0, 'Bambusowa 7', 2200, 3, 0, 0, 0, 0, 51, 1),
(437, 0, 0, 0, 'Bambusowa 8', 4600, 3, 0, 0, 0, 0, 93, 1),
(438, 0, 0, 0, 'Jaszczurza 1/1', 2700, 3, 0, 0, 0, 0, 57, 1),
(439, 0, 0, 0, 'Jaszczurza 1/2', 2900, 3, 0, 0, 0, 0, 50, 1),
(440, 0, 0, 0, 'Jaszczurza 1/3', 2900, 3, 0, 0, 0, 0, 56, 1),
(441, 0, 0, 0, 'Jaszczurza 1/4', 2700, 3, 0, 0, 0, 0, 57, 1),
(442, 0, 0, 0, 'Jaszczurza 1/5', 2300, 3, 0, 0, 0, 0, 49, 1),
(443, 0, 0, 0, 'Jaszczurza 1/6', 2300, 3, 0, 0, 0, 0, 49, 1),
(444, 0, 0, 0, 'Jaszczurza 1/7', 2300, 3, 0, 0, 0, 0, 49, 1),
(445, 0, 0, 0, 'Jaszczurza 1/8', 2300, 3, 0, 0, 0, 0, 49, 1),
(446, 0, 0, 0, 'Sklepowa 4', 2000, 1, 0, 0, 0, 0, 49, 2),
(447, 0, 0, 0, 'Cela wiezienna 1', 600, 1, 0, 0, 0, 0, 6, 1),
(448, 0, 0, 0, 'Cela wiezienna 2', 600, 1, 0, 0, 0, 0, 7, 1),
(449, 0, 0, 0, 'Cela wiezienna 3', 600, 1, 0, 0, 0, 0, 9, 1),
(450, 0, 0, 0, 'Cela wiezienna 4', 600, 1, 0, 0, 0, 0, 6, 1),
(451, 0, 0, 0, 'Cela wiezienna 5', 600, 1, 0, 0, 0, 0, 6, 1),
(452, 0, 0, 0, 'Cela wiezienna 6', 600, 1, 0, 0, 0, 0, 9, 1),
(453, 0, 0, 0, 'Cela wiezienna 7', 600, 1, 0, 0, 0, 0, 6, 1),
(454, 0, 0, 0, 'Cela wiezienna 8', 600, 1, 0, 0, 0, 0, 9, 1),
(455, 0, 0, 0, 'Cela wiezienna 9', 600, 1, 0, 0, 0, 0, 6, 1),
(456, 0, 0, 0, 'Cela wiezienna 10', 600, 1, 0, 0, 0, 0, 12, 1),
(457, 0, 0, 0, 'Cela wiezienna 11', 600, 1, 0, 0, 0, 0, 12, 1),
(458, 0, 0, 0, 'Cela wiezienna 12', 600, 1, 0, 0, 0, 0, 12, 1),
(459, 0, 0, 0, 'Cela wiezienna 13', 600, 1, 0, 0, 0, 0, 12, 1),
(460, 0, 0, 0, 'Cela wiezienna 14', 600, 1, 0, 0, 0, 0, 12, 1),
(461, 0, 0, 0, 'Cela wiezienna 16', 600, 1, 0, 0, 0, 0, 12, 1),
(462, 0, 0, 0, 'Cela wiezienna 15', 600, 1, 0, 0, 0, 0, 9, 1),
(463, 0, 0, 0, 'Cela wiezienna 17', 600, 1, 0, 0, 0, 0, 9, 1),
(464, 0, 0, 0, 'Cela wiezienna 18', 600, 1, 0, 0, 0, 0, 12, 1),
(465, 0, 0, 0, 'Palac 5', 2400, 2, 0, 0, 0, 0, 75, 1),
(466, 0, 0, 0, 'Palac 6', 2400, 2, 0, 0, 0, 0, 78, 1),
(467, 0, 0, 0, 'Palac 7', 2400, 2, 0, 0, 0, 0, 72, 1),
(468, 0, 0, 0, 'Palac 8', 2400, 2, 0, 0, 0, 0, 74, 1),
(469, 0, 0, 0, 'Palac', 20000, 2, 0, 0, 0, 0, 683, 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `market_history`
--

INSERT INTO `market_history` (`id`, `player_id`, `sale`, `itemtype`, `amount`, `price`, `expires_at`, `inserted`, `state`) VALUES
(2, 166, 0, 2182, 1, 100, 1506658906, 1504066920, 255),
(3, 166, 1, 2182, 1, 100, 1506658906, 1504066920, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `newsticker`
--

CREATE TABLE `newsticker` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pagsegurotransacoes`
--

CREATE TABLE `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(5) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `blessings1` tinyint(4) NOT NULL DEFAULT '0',
  `blessings2` tinyint(4) NOT NULL DEFAULT '0',
  `blessings3` tinyint(4) NOT NULL DEFAULT '0',
  `blessings4` tinyint(4) NOT NULL DEFAULT '0',
  `blessings5` tinyint(4) NOT NULL DEFAULT '0',
  `blessings6` tinyint(4) NOT NULL DEFAULT '0',
  `blessings7` tinyint(4) NOT NULL DEFAULT '0',
  `blessings8` tinyint(4) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT '2520',
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `cast` tinyint(1) NOT NULL DEFAULT '0',
  `skill_critical_hit_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_damage` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `prey_stamina_1` int(11) DEFAULT NULL,
  `prey_stamina_2` int(11) DEFAULT NULL,
  `prey_stamina_3` int(11) DEFAULT NULL,
  `prey_column` smallint(6) NOT NULL DEFAULT '1',
  `bonus_reroll` int(11) NOT NULL DEFAULT '0',
  `xpboost_stamina` smallint(5) DEFAULT NULL,
  `xpboost_value` tinyint(4) DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `hide_skills` int(11) DEFAULT NULL,
  `hide_set` int(11) DEFAULT NULL,
  `former` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `cast`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `prey_stamina_1`, `prey_stamina_2`, `prey_stamina_3`, `prey_column`, `bonus_reroll`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `hide_skills`, `hide_set`, `former`) VALUES
(1, 'Rook Sample', 1, 1, 1, 0, 150, 150, 0, 106, 95, 78, 116, 128, 0, 0, 5, 5, 0, 0, 2, 32104, 32191, 6, '', 400, 0, 1407021967, 1793873073, 1, 0, 0, 1407021968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 203, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, '-'),
(150, 'ADM Suporte', 5, 8, 160, 2, 940, 940, 65751800, 123, 118, 95, 9, 130, 0, 0, 4595, 4595, 200, 100, 1, 5912, 1552, 7, '', 1920, 1, 1504172230, 16777343, 1, 0, 0, 1504172300, 63, 0, 0, 0, 0, 0, 0, 0, 0, 274127, 0, 1215801, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 71, 0, 0, '', '', 2147483647, 1472930428, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7200, 7200, 0, 1, 0, 0, 0, 0, NULL, NULL, '-'),
(153, 'Erick Nunes', 1, 9, 8, 2, 150, 150, 4200, 123, 118, 95, 9, 130, 0, 0, 3, 5, 6, 0, 2, 32347, 32219, 7, '', 400, 1, 1494264897, 16777343, 1, 0, 0, 1494264914, 63, 0, 0, 0, 0, 0, 0, 0, 0, 1977, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 1493218372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7200, 7200, 0, 1, 0, 0, 0, 0, NULL, NULL, '-'),
(161, 'Account Manager', 1, 1, 8, 0, 185, 185, 4200, 44, 98, 15, 76, 136, 0, 0, 35, 35, 0, 100, 1, 5836, 1502, 7, '', 420, 0, 1504146715, 16777343, 1, 0, 0, 1504146769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, NULL, '-'),
(162, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 2, 5836, 1502, 7, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, '-'),
(163, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, 44, 98, 54, 76, 136, 0, 0, 35, 35, 0, 100, 2, 5836, 1502, 7, '', 420, 0, 1504147781, 16777343, 1, 0, 0, 1504147788, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, NULL, '-'),
(164, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 2, 5836, 1502, 7, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, '-'),
(165, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 44, 98, 15, 76, 138, 0, 0, 35, 35, 0, 100, 1, 5836, 1502, 7, '', 420, 0, 1504146615, 16777343, 1, 0, 0, 1504146628, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, NULL, '-'),
(166, 'Nicckoo', 1, 19, 140, 2, 830, 845, 44631560, 44, 98, 112, 76, 130, 3, 62, 2880, 3995, 33410, 100, 3, 5913, 1552, 7, 0x010004000002ffffffff03e88000001a001b00000000fe, 1740, 1, 1504172319, 16777343, 1, 0, 0, 1504172325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 336657, 0, 311580, 43200, -1, 2484, 10, 7, 10, 0, 10, 0, 10, 0, 10, 0, 14, 135, 10, 0, 0, '', '', 2130706433, 1504063328, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, NULL, '-'),
(167, 'Samouczek', 1, 19, 8, 3, 108, 185, 4350, 44, 98, 111, 76, 136, 0, 0, 35, 35, 0, 100, 2, 5901, 1556, 7, 0x010100000002000000000398b101001a001b00000000080119000000000ad0070000feffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff881300000a88130000ffffffff88130000fe010004000002ffffffff03c0da00001a001b00000000fe, 420, 0, 1504120202, 16777343, 1, 0, 0, 1504120216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35590, 0, 0, 41498, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 15, 41, 13, 100, 10, 0, 0, '', '', 2130706433, 1504064055, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, NULL, '-'),
(168, 'Aad', 1, 1, 8, 1, 185, 185, 4200, 44, 98, 13, 76, 131, 0, 0, 35, 35, 0, 100, 2, 5836, 1502, 7, '', 420, 1, 1504146522, 16777343, 1, 0, 0, 1504146564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483647, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 1, '', '', 2130706433, 1504145564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, NULL, '-');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `players_online`
--

INSERT INTO `players_online` (`player_id`) VALUES
(150);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT '1',
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) NOT NULL DEFAULT '0',
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_depotitems`
--

INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(166, 101, 1, 1987, 1, ''),
(166, 102, 101, 7636, 1, 0x0f01),
(166, 103, 101, 7620, 26, 0x0f1a),
(166, 104, 101, 7620, 100, 0x0f64),
(166, 105, 101, 7620, 99, 0x0f63),
(166, 106, 101, 2160, 88, 0x0f58);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_inboxitems`
--

INSERT INTO `player_inboxitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(166, 101, 0, 2596, 1, ''),
(166, 102, 101, 2599, 1, 0x0607004e6963636b6f6f12ba1da7591307004e6963636b6f6f),
(166, 103, 101, 2148, 49, 0x0f31);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL DEFAULT '0',
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(153, 1, 101, 2461, 1, ''),
(153, 2, 102, 2661, 1, ''),
(153, 3, 103, 5926, 1, ''),
(153, 4, 104, 2651, 1, ''),
(153, 5, 105, 2175, 1, ''),
(153, 6, 106, 23721, 1, ''),
(153, 7, 107, 2649, 1, ''),
(153, 8, 108, 2643, 1, ''),
(153, 11, 109, 26052, 1, ''),
(153, 103, 110, 1988, 1, ''),
(153, 103, 111, 2661, 1, ''),
(153, 103, 112, 2643, 1, ''),
(153, 103, 113, 2468, 1, ''),
(153, 103, 114, 8820, 1, ''),
(153, 103, 115, 8819, 1, ''),
(153, 103, 116, 2182, 1, ''),
(153, 103, 117, 2175, 1, ''),
(153, 103, 118, 8704, 21, 0x0f15),
(153, 103, 119, 2554, 1, ''),
(153, 103, 120, 2120, 1, ''),
(153, 110, 121, 7620, 1, 0x0f01),
(153, 110, 122, 2120, 1, ''),
(167, 1, 101, 2480, 1, ''),
(167, 2, 102, 2661, 1, ''),
(167, 3, 103, 1988, 1, ''),
(167, 4, 104, 2660, 1, ''),
(167, 5, 105, 2525, 1, ''),
(167, 6, 106, 2389, 5, 0x0f05),
(167, 7, 107, 8923, 1, ''),
(167, 8, 108, 2643, 1, ''),
(167, 11, 109, 26052, 1, ''),
(167, 103, 110, 18559, 1, ''),
(167, 103, 111, 7620, 5, 0x0f05),
(167, 103, 112, 7618, 5, 0x0f05),
(167, 103, 113, 2152, 20, 0x0f14),
(168, 1, 101, 8820, 1, ''),
(168, 2, 102, 2661, 1, ''),
(168, 3, 103, 1988, 1, ''),
(168, 4, 104, 8819, 1, ''),
(168, 5, 105, 2175, 1, ''),
(168, 6, 106, 2190, 1, ''),
(168, 7, 107, 2468, 1, ''),
(168, 8, 108, 2643, 1, ''),
(168, 11, 109, 26052, 1, ''),
(168, 103, 110, 1988, 1, ''),
(168, 103, 111, 2661, 1, ''),
(168, 103, 112, 2643, 1, ''),
(168, 103, 113, 2468, 1, ''),
(168, 103, 114, 8820, 1, ''),
(168, 103, 115, 8819, 1, ''),
(168, 103, 116, 2190, 1, ''),
(168, 103, 117, 2175, 1, ''),
(168, 103, 118, 1988, 1, ''),
(168, 103, 119, 2661, 1, ''),
(168, 103, 120, 2643, 1, ''),
(168, 103, 121, 2468, 1, ''),
(168, 103, 122, 8820, 1, ''),
(168, 103, 123, 8819, 1, ''),
(168, 103, 124, 2190, 1, ''),
(168, 103, 125, 2175, 1, ''),
(168, 103, 126, 18559, 1, ''),
(168, 103, 127, 7620, 5, 0x0f05),
(168, 103, 128, 2152, 20, 0x0f14),
(168, 110, 129, 18559, 1, ''),
(168, 110, 130, 2152, 20, 0x0f14),
(168, 118, 131, 18559, 1, ''),
(168, 118, 132, 7620, 5, 0x0f05),
(168, 118, 133, 2152, 20, 0x0f14),
(165, 1, 101, 2460, 1, ''),
(165, 2, 102, 2661, 1, ''),
(165, 3, 103, 1988, 1, ''),
(165, 4, 104, 2465, 1, ''),
(165, 5, 105, 2525, 1, ''),
(165, 6, 106, 8601, 1, ''),
(165, 7, 107, 2478, 1, ''),
(165, 8, 108, 2643, 1, ''),
(165, 11, 109, 26052, 1, ''),
(165, 103, 110, 18559, 1, ''),
(165, 103, 111, 7620, 5, 0x0f05),
(165, 103, 112, 7618, 5, 0x0f05),
(165, 103, 113, 2439, 1, ''),
(165, 103, 114, 8602, 1, ''),
(165, 103, 115, 2152, 20, 0x0f14),
(161, 3, 101, 1988, 1, ''),
(161, 11, 102, 26052, 1, ''),
(161, 101, 103, 2120, 1, ''),
(163, 1, 101, 8820, 1, ''),
(163, 2, 102, 2661, 1, ''),
(163, 3, 103, 1988, 1, ''),
(163, 4, 104, 8819, 1, ''),
(163, 5, 105, 2175, 1, ''),
(163, 6, 106, 2182, 1, ''),
(163, 7, 107, 2468, 1, ''),
(163, 8, 108, 2643, 1, ''),
(163, 11, 109, 26052, 1, ''),
(163, 103, 110, 18559, 1, ''),
(163, 103, 111, 7620, 5, 0x0f05),
(163, 103, 112, 2152, 20, 0x0f14),
(150, 1, 101, 2461, 1, ''),
(150, 3, 102, 1988, 1, ''),
(150, 4, 103, 2651, 1, ''),
(150, 5, 104, 2175, 1, ''),
(150, 6, 105, 23721, 1, ''),
(150, 7, 106, 2649, 1, ''),
(150, 8, 107, 2643, 1, ''),
(150, 10, 108, 16619, 1, ''),
(150, 11, 109, 26052, 1, ''),
(150, 102, 110, 7636, 2, 0x0f02),
(150, 102, 111, 2148, 50, 0x0f32),
(150, 102, 112, 8704, 21, 0x0f15),
(150, 102, 113, 22421, 1, ''),
(166, 1, 101, 2323, 1, ''),
(166, 2, 102, 2171, 1, ''),
(166, 3, 103, 1988, 1, ''),
(166, 4, 104, 8871, 1, ''),
(166, 5, 105, 8918, 1, ''),
(166, 6, 106, 2183, 1, ''),
(166, 7, 107, 7730, 1, ''),
(166, 8, 108, 2640, 1, 0x10289c54001101),
(166, 10, 109, 7635, 2, 0x0f02),
(166, 11, 110, 26052, 1, ''),
(166, 103, 111, 2148, 22, 0x0f16),
(166, 103, 112, 2152, 80, 0x0f50),
(166, 103, 113, 7590, 89, 0x0f59),
(166, 103, 114, 2195, 1, ''),
(166, 103, 115, 5908, 1, ''),
(166, 103, 116, 2120, 1, ''),
(166, 103, 117, 7589, 68, 0x0f44),
(166, 103, 118, 2293, 12, 0x0f0c),
(166, 103, 119, 2268, 6, 0x0f06),
(166, 103, 120, 2268, 100, 0x0f64),
(166, 103, 121, 7635, 100, 0x0f64),
(166, 103, 122, 7590, 100, 0x0f64),
(166, 103, 123, 2268, 100, 0x0f64),
(166, 103, 124, 2160, 16, 0x0f10),
(166, 103, 125, 7618, 20, 0x0f14),
(166, 103, 126, 18559, 1, ''),
(166, 110, 127, 9778, 1, ''),
(166, 110, 128, 12645, 1, ''),
(166, 110, 129, 18403, 1, ''),
(166, 110, 130, 9778, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_kills`
--

CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_misc`
--

CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_prey`
--

CREATE TABLE `player_prey` (
  `player_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mindex` smallint(6) NOT NULL,
  `mcolumn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_prey`
--

INSERT INTO `player_prey` (`player_id`, `name`, `mindex`, `mcolumn`) VALUES
(150, 'mechanical fighter', 0, 0),
(150, 'scarab', 1, 0),
(150, 'kollos', 2, 0),
(150, 'brimstone bug', 4, 0),
(150, 'frazzlemaw', 5, 0),
(150, 'spitter', 6, 0),
(150, 'troll-trained salamander', 7, 0),
(150, 'killer rabbit', 8, 0),
(150, 'banshee', 0, 1),
(150, 'greater death minion', 1, 1),
(150, 'rahemos', 2, 1),
(150, 'minotaur amazon', 3, 1),
(150, 'clay guardian', 5, 1),
(150, 'valkyrie', 6, 1),
(150, 'sacred spider', 7, 1),
(150, 'lizard zaogun', 8, 1),
(150, 'enslaved dwarf', 0, 1),
(150, 'kraknaknork', 1, 1),
(150, 'mountain troll', 2, 1),
(150, 'crystal wolf', 3, 1),
(150, 'cave rat', 4, 1),
(150, 'swampling', 5, 1),
(150, 'monk', 6, 1),
(150, 'spark of destruction', 7, 1),
(150, 'slick water elemental', 8, 1),
(166, 'midnight asura', 0, 0),
(166, 'betrayed wraith', 1, 0),
(166, 'wyvern', 2, 0),
(166, 'dragon lord hatchling', 3, 0),
(166, 'terramite', 4, 0),
(166, 'marsh stalker', 5, 0),
(166, 'young sea serpent', 6, 0),
(166, 'mutated rat', 7, 0),
(166, 'insectoid worker', 8, 0),
(166, 'terror bird', 0, 1),
(166, 'clomp', 1, 1),
(166, 'wild warrior', 2, 1),
(166, 'bone beast', 3, 1),
(166, 'morguthis', 4, 1),
(166, 'blazing fire elemental', 5, 1),
(166, 'hand of cursed fate', 6, 1),
(166, 'forest fury', 7, 1),
(166, 'infected weeper', 8, 1),
(167, 'orc berserker', 0, 0),
(167, 'dwarf', 1, 0),
(167, 'orc spearman', 2, 0),
(167, 'terrorsleep', 3, 0),
(167, 'vampire viscount', 4, 0),
(167, 'charged energy elemental', 5, 0),
(167, 'crawler', 6, 0),
(167, 'polar bear', 7, 0),
(167, 'boar', 8, 0),
(167, 'witch', 0, 1),
(167, 'cobra', 1, 1),
(167, 'spectre', 2, 1),
(167, 'cave rat', 3, 1),
(167, 'quara pincher scout', 4, 1),
(167, 'terramite', 5, 1),
(167, 'spidris', 6, 1),
(167, 'frost giantess', 7, 1),
(167, 'shark', 8, 1),
(168, 'spitter', 0, 0),
(168, 'betrayed wraith', 1, 0),
(168, 'hellflayer', 2, 0),
(168, 'glooth bandit', 3, 0),
(168, 'infernal frog', 4, 0),
(168, 'corym skirmisher', 5, 0),
(168, 'green djinn', 6, 0),
(168, 'bone beast', 7, 0),
(168, 'yeti', 8, 0),
(168, 'lava golem', 0, 1),
(168, 'renegade knight', 1, 1),
(168, 'madareth', 2, 1),
(168, 'medusa', 3, 1),
(168, 'frost giant', 4, 1),
(168, 'ogre brute', 5, 1),
(168, 'crystalcrusher', 6, 1),
(168, 'sea serpent', 7, 1),
(168, 'killer rabbit', 8, 1),
(165, 'sandcrawler', 0, 0),
(165, 'slime', 1, 0),
(165, 'mercury blob', 2, 0),
(165, 'omnivora', 3, 0),
(165, 'worm priestess', 4, 0),
(165, 'pirate buccaneer', 5, 0),
(165, 'badger', 6, 0),
(165, 'eternal guardian', 7, 0),
(165, 'mutated bat', 8, 0),
(165, 'hideous fungus', 0, 1),
(165, 'gnarlhound', 1, 1),
(165, 'lost soul', 2, 1),
(165, 'deepling brawler', 3, 1),
(165, 'gladiator', 4, 1),
(165, 'undead dragon', 5, 1),
(165, 'lost thrower', 6, 1),
(165, 'draken elite', 7, 1),
(165, 'witch', 8, 1),
(163, 'lizard snakecharmer', 0, 0),
(163, 'gargoyle', 1, 0),
(163, 'blood hand', 2, 0),
(163, 'troll champion', 3, 0),
(163, 'minotaur amazon', 4, 0),
(163, 'destroyer', 5, 0),
(163, 'war wolf', 6, 0),
(163, 'scorpion', 7, 0),
(163, 'frost giantess', 8, 0),
(163, 'mooh\'tah warrior', 0, 1),
(163, 'glooth blob', 1, 1),
(163, 'rot elemental', 2, 1),
(163, 'stampor', 3, 1),
(163, 'blood beast', 4, 1),
(163, 'mutated human', 5, 1),
(163, 'doom deer', 6, 1),
(163, 'priestess', 7, 1),
(163, 'adept of the cult', 8, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_preytimes`
--

CREATE TABLE `player_preytimes` (
  `player_id` int(11) NOT NULL,
  `bonus_type1` int(11) NOT NULL,
  `bonus_value1` int(11) NOT NULL,
  `bonus_name1` varchar(50) NOT NULL,
  `bonus_type2` int(11) NOT NULL,
  `bonus_value2` int(11) NOT NULL,
  `bonus_name2` varchar(50) NOT NULL,
  `bonus_type3` int(11) NOT NULL,
  `bonus_value3` int(11) NOT NULL,
  `bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_preytimes`
--

INSERT INTO `player_preytimes` (`player_id`, `bonus_type1`, `bonus_value1`, `bonus_name1`, `bonus_type2`, `bonus_value2`, `bonus_name2`, `bonus_type3`, `bonus_value3`, `bonus_name3`) VALUES
(150, 2, 16, 'Azure Frog', 3, 16, 'Morguthis', 0, 0, ''),
(166, 0, 0, '', 0, 0, '', 0, 0, ''),
(167, 0, 0, '', 0, 0, '', 0, 0, ''),
(168, 0, 0, '', 0, 0, '', 0, 0, ''),
(165, 0, 0, '', 0, 0, '', 0, 0, ''),
(161, 0, 0, '', 0, 0, '', 0, 0, ''),
(163, 0, 0, '', 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(150, 1, 1172),
(150, 4687, 1),
(150, 10030, 1),
(150, 10031, 1),
(150, 10034, 1),
(150, 10035, 1),
(150, 10038, 1),
(150, 10039, 1),
(150, 10042, 1),
(150, 10043, 1),
(150, 11019, 1),
(150, 20279, 3),
(150, 50722, 0),
(150, 99963, 1),
(150, 99964, 1),
(150, 99965, 1),
(150, 99966, 1),
(150, 99969, 1),
(150, 99970, 1),
(150, 110002, 1),
(150, 5042021, 1495498638),
(150, 8420390, 0),
(150, 8420391, 0),
(150, 8420392, 0),
(150, 10002011, 1),
(153, 4687, 1),
(153, 10030, 1),
(153, 10031, 1),
(153, 10034, 1),
(153, 10035, 1),
(153, 10038, 1),
(153, 10039, 1),
(153, 10042, 1),
(153, 10043, 1),
(153, 18870, 1),
(153, 50463, 1),
(153, 50464, 1),
(153, 50465, 1),
(153, 50466, 1),
(153, 50722, 0),
(153, 8420390, 0),
(153, 8420391, 0),
(153, 8420392, 0),
(161, 11019, 1),
(161, 50722, 1504146725),
(163, 11019, 1),
(163, 50722, 1504147791),
(163, 8420390, 0),
(163, 8420391, 0),
(165, 11019, 1),
(165, 50722, 1504146625),
(165, 8420390, 0),
(165, 8420391, 0),
(166, 1, 1504156221),
(166, 200, 0),
(166, 236, 0),
(166, 238, 0),
(166, 292, 38),
(166, 293, 36),
(166, 299, 39),
(166, 300, 10),
(166, 301, 2),
(166, 302, 2),
(166, 4028, 1),
(166, 4029, 1),
(166, 4043, 1),
(166, 4044, 1),
(166, 6030, 1),
(166, 6045, 1),
(166, 6050, 1),
(166, 6059, 1),
(166, 6061, 1),
(166, 7364, 1),
(166, 7380, 1),
(166, 7384, 1),
(166, 7389, 1),
(166, 7392, 1),
(166, 7406, 1),
(166, 7415, 1),
(166, 11019, 1),
(166, 12571, 1),
(166, 20003, 234),
(166, 20020, 5),
(166, 20024, 10),
(166, 20038, 141),
(166, 20279, 187),
(166, 26100, 1),
(166, 26101, 1),
(166, 50722, 1504172329),
(166, 99963, 100),
(166, 300014, 1),
(166, 8420390, 0),
(166, 8420391, 0),
(166, 10001001, 8388611),
(166, 10001002, 8519683),
(166, 10001003, 8650753),
(166, 10001004, 9175041),
(166, 10002001, 65537),
(166, 10002004, 3162624),
(166, 10002011, 1),
(167, 11019, 1),
(167, 50722, 0),
(167, 8420390, 0),
(167, 8420391, 0),
(168, 11019, 1),
(168, 50722, 0),
(168, 8420390, 0),
(168, 8420391, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sellchar`
--

CREATE TABLE `sellchar` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `vocation` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(40) NOT NULL,
  `oldid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '28'),
('double', 'desactived'),
('motd_hash', 'd40f8dcfa99c13f947571211f86d3e1edd1b329c'),
('motd_num', '2'),
('players_record', '2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `store_history`
--

CREATE TABLE `store_history` (
  `account_id` int(11) NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT '0',
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `store_history`
--

INSERT INTO `store_history` (`account_id`, `mode`, `description`, `coin_amount`, `time`, `timestamp`, `id`, `coins`) VALUES
(19, 0, 'Widow Queen', -30, 1504065089, 0, 0, 0),
(19, 0, '1x Yalahari Mask', -10, 1504065354, 0, 0, 0),
(19, 0, '1x Prismatic Helmet', -10, 1504065691, 0, 0, 0),
(19, 0, 'Citizen Addon', -20, 1504065890, 0, 0, 0),
(19, 0, '1x Elite Draken Helmet', -10, 1504066102, 0, 0, 0),
(19, 0, '1x Cat in a Basket', -150, 1504066218, 0, 0, 0),
(19, 0, '1x Yalahari Mask', -10, 1504066288, 0, 0, 0),
(19, 0, 'Character Sex Change', -20, 1504066387, 0, 0, 0),
(19, 0, 'Character Sex Change', -20, 1504066403, 0, 0, 0),
(19, 0, 'Character Name Change', -20, 1504066418, 0, 0, 0),
(19, 0, 'Emerald Sphinx', -60, 1504066495, 0, 0, 0),
(19, 0, 'War Horse', -30, 1504069481, 0, 0, 0),
(19, 0, 'War Bear', -30, 1504078057, 0, 0, 0),
(19, 0, 'Draptor', -60, 1504078641, 0, 0, 0),
(19, 0, 'Flamesteed', -60, 1504079134, 0, 0, 0),
(19, 0, '1x Yalahari Mask', -10, 1504079291, 0, 0, 0),
(19, 0, '1x Baby Dragon', -250, 1504079921, 0, 0, 0),
(19, 0, 'Elephant', -1, 1504080119, 0, 0, 0),
(19, 0, 'Elephant', -1, 1504080395, 0, 0, 0),
(19, 0, 'Prismatic Unicorn', -1, 1504080993, 0, 0, 0),
(19, 0, 'Arctic Unicorn', -1, 1504081078, 0, 0, 0),
(19, 0, 'Jackalope', -60, 1504082249, 0, 0, 0),
(19, 0, 'Mage Addon', -100, 1504085727, 0, 0, 0),
(19, 0, 'Hunter Addon', -20, 1504085790, 0, 0, 0),
(19, 0, 'Mage Addon', -100, 1504086349, 0, 0, 0),
(19, 0, '1x Parrot', -180, 1504132353, 0, 0, 0),
(19, 0, '1x Boots of Haste', -3, 1504140462, 0, 0, 0),
(19, 0, '1x Boots of Haste', -3, 1504143363, 0, 0, 0),
(19, 0, '1x Boots of Haste', -3, 1504148264, 0, 0, 0),
(19, 0, '1x Boots of Haste', -3, 1504148301, 0, 0, 0),
(19, 0, '1x Demon Legs', -30, 1504148872, 0, 0, 0),
(19, 0, '1x Pair Soft Boots', -15, 1504149156, 0, 0, 0),
(19, 0, '1x Parrot', -180, 1504168471, 0, 0, 0),
(19, 0, '1x Baby Dragon', -250, 1504168620, 0, 0, 0),
(19, 0, '1x Cat in a Basket', -150, 1504169271, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_subject` varchar(255) NOT NULL,
  `ticket_author` varchar(255) NOT NULL,
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(255) NOT NULL,
  `ticket_admin_reply` varchar(255) NOT NULL,
  `ticket_date` int(11) NOT NULL,
  `ticket_ended` int(11) NOT NULL,
  `ticket_status` int(11) NOT NULL,
  `ticket_category` varchar(255) NOT NULL,
  `ticket_description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tickets_reply`
--

CREATE TABLE `tickets_reply` (
  `ticket_id` int(11) NOT NULL,
  `reply_message` varchar(255) NOT NULL,
  `reply_author` varchar(255) NOT NULL,
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(255) NOT NULL,
  `ticket_admin_reply` varchar(255) NOT NULL,
  `reply_date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(1, 0xed160e0606020000002d19002d1900),
(1, 0xee160e060601000000871e00),
(1, 0xee160f060601000000881e00),
(1, 0xed160e0607010000002d1900),
(1, 0xee160e0607010000008b1e00),
(1, 0xee160f0607010000008c1e00),
(1, 0xf0160b060601000000241900),
(1, 0xf1160b060601000000241900),
(1, 0xf0160b060701000000c50400),
(1, 0xf1160b060701000000241900),
(1, 0xf3160e060601000000ba0400),
(1, 0xf3160e0607010000002d1900),
(1, 0xf01610060601000000241900),
(1, 0xf11610060601000000241900),
(1, 0xf01610060701000000241900),
(1, 0xf11610060701000000241900),
(2, 0xf716ff050701000000182800),
(2, 0xef1604060601000000871e00),
(2, 0xef1605060601000000881e00),
(2, 0xf316010606010000001c2800),
(2, 0xf71600060601000000871e00),
(2, 0xf71601060601000000881e00),
(2, 0xf41600060701000000831e00),
(2, 0xf41601060701000000841e00),
(2, 0xf616020607010000001f2800),
(2, 0xf71600060701000000831e00),
(2, 0xf71601060701000000841e00),
(2, 0xf11606060601000000182800),
(2, 0xf316040606010000001c2800),
(2, 0xf316050606010000001c2800),
(2, 0xf316040607010000001d2800),
(2, 0xf51606060701000000182800),
(2, 0xf616060607010000001f2800),
(2, 0xf716060607010000001f2800),
(2, 0xf816050607010000001b2800),
(3, 0xfa16ff050601000000891e00),
(3, 0xfb16ff0506010000008a1e00),
(3, 0xff16ff050701000000871e00),
(3, 0x0117fe050602000000261900261900),
(3, 0x0017fe050701000000241900),
(3, 0x0117ff0507010000008b1e00),
(3, 0xfa16010606010000008d1e00),
(3, 0xfb16010606010000008e1e00),
(3, 0xfb1602060601000000261900),
(3, 0xf91600060701000000251900),
(3, 0xfd1600060601000000ba0400),
(3, 0xfe1602060601000000bc0400),
(3, 0xfc1602060701000000bc0400),
(3, 0xff1600060701000000881e00),
(3, 0xff1603060701000000bc0400),
(3, 0xff1606060601000000261900),
(3, 0xfc1606060701000000241900),
(3, 0xfd1605060701000000c30400),
(3, 0xff1606060701000000bc0400),
(3, 0x001703060701000000130700),
(3, 0x0117000607010000008c1e00),
(3, 0x021701060701000000251900),
(3, 0x001706060701000000241900),
(3, 0x021705060701000000251900),
(4, 0xf61644060701000000050600),
(4, 0xf61647060701000000242800),
(4, 0xf31648060701000000da0600),
(4, 0xf31649060701000000db0600),
(4, 0xf816490607010000001b2800),
(4, 0xf8164a0607010000001b2800),
(5, 0xee1644060701000000050600),
(5, 0xee1647060701000000242800),
(5, 0xeb1648060701000000da0600),
(5, 0xeb1649060701000000db0600),
(155, 0xdb16f3050601000000871e00),
(155, 0xd716f50506010000002d1900),
(155, 0xd716f50507010000002d1900),
(155, 0xda16f7050601000000241900),
(155, 0xdb16f4050601000000881e00),
(155, 0xda16f7050701000000c50400),
(156, 0xdf16f7050601000000241900),
(156, 0xdf16f7050701000000241900),
(156, 0xe016f3050601000000831e00),
(156, 0xe016f4050601000000841e00),
(156, 0xe116f40506010000002d1900),
(156, 0xe116f50506010000002d1900),
(156, 0xe116f40507010000002d1900),
(156, 0xe116f50507010000006f1800),
(157, 0xd916ed050601000000241900),
(157, 0xd916ed050701000000241900),
(157, 0xde16ee0506010000008b1e00),
(157, 0xde16ef0506010000008c1e00),
(157, 0xdf16ed050601000000241900),
(157, 0xdf16ed050701000000241900),
(157, 0xe016ee050601000000831e00),
(157, 0xe016ef050601000000841e00),
(157, 0xd716f00506010000002d1900),
(157, 0xd716f00507010000002d1900),
(157, 0xdb16f0050601000000630600),
(157, 0xdb16f0050701000000630600),
(157, 0xe116f00506010000002d1900),
(157, 0xe116f00507010000006f1800),
(158, 0xe416e50506010000008b1e00),
(158, 0xe416e60506010000008c1e00),
(158, 0xe516e6050701000000192800),
(158, 0xe216eb050701000000182800),
(158, 0xe316e8050701000000640600),
(158, 0xe416e80506010000001f2800),
(158, 0xe416eb0507010000001f2800),
(158, 0xe516ea050701000000192800),
(159, 0xe716eb050601000000192800),
(159, 0xe916e9050601000000182800),
(159, 0xea16ea050601000000871e00),
(159, 0xea16eb050601000000881e00),
(159, 0xeb16eb050601000000192800),
(159, 0xeb16eb050701000000192800),
(159, 0xea16ed0506010000001f2800),
(159, 0xe916ed050701000000640600),
(159, 0xeb16ef050701000000192800),
(159, 0xe816f0050701000000182800),
(159, 0xea16f00507010000001f2800),
(160, 0xee16eb050701000000871e00),
(160, 0xee16ee0506010000008b1e00),
(160, 0xee16ef0506010000008c1e00),
(160, 0xee16ec050701000000881e00),
(160, 0xf016ed0506010000001f2800),
(160, 0xf316ed0506010000001f2800),
(160, 0xf016ed0507010000001f2800),
(160, 0xf316ed0507010000001f2800),
(160, 0xf516ec050601000000192800),
(160, 0xf516ef050601000000192800),
(160, 0xf516ec050701000000192800),
(160, 0xf516ef050701000000192800),
(160, 0xef16f0050601000000182800),
(160, 0xef16f0050701000000182800),
(160, 0xf316f00507010000001f2800),
(160, 0xf416f0050601000000182800),
(160, 0xf416f0050701000000182800),
(161, 0xef16f7050701000000de0600),
(161, 0xef16f8050701000000df0600),
(161, 0xf316f70506010000001c2800),
(161, 0xf016f7050701000000de0600),
(161, 0xf116f5050701000000182800),
(161, 0xf316f70507010000001c2800),
(161, 0xf616f6050601000000dc0600),
(161, 0xf616f7050601000000dc0600),
(161, 0xf716f6050601000000dd0600),
(161, 0xf716f7050601000000dd0600),
(161, 0xf516f50507010000001f2800),
(161, 0xf616f70507010000001c2800),
(161, 0xf016f90506010000001f2800),
(161, 0xf116fb0506010000001c2800),
(161, 0xf016f8050701000000df0600),
(161, 0xf316fa0507010000001c2800),
(161, 0xf516f8050601000000182800),
(161, 0xf516f8050701000000182800),
(161, 0xf016fc050601000000182800),
(161, 0xf016fc050701000000182800),
(162, 0xf816eb0506010000008b1e00),
(162, 0xfa16ea050601000000182800),
(162, 0xfa16ea050701000000182800),
(162, 0xff16ea050602000000182800182800),
(162, 0xff16ea050701000000182800),
(162, 0xf716ed050601000000192800),
(162, 0xf716ed050701000000192800),
(162, 0xf816ec0506010000008c1e00),
(162, 0xfa16ef050601000000182800),
(162, 0xfb16ed050601000000222800),
(162, 0xfa16ef050701000000182800),
(162, 0xfb16ed050701000000222800),
(162, 0xff16ef050601000000182800),
(162, 0xfc16ef050701000000242800),
(162, 0xfd16ed050701000000222800),
(162, 0xff16ef050701000000182800),
(162, 0x0017eb050601000000871e00),
(162, 0x0017ec050601000000881e00),
(162, 0x0117ed050601000000192800),
(162, 0x0117ed050701000000192800),
(163, 0xfa16f7050501000000192800),
(163, 0xfa16f7050601000000192800),
(163, 0xfa16f7050701000000192800),
(163, 0xfd16f5050501000000182800),
(163, 0xfe16f7050501000000192800),
(163, 0xfe16f7050601000000222800),
(163, 0xfd16f5050701000000182800),
(163, 0xfe16f7050701000000222800),
(163, 0xfa16fa050601000000192800),
(163, 0xfa16fa050701000000192800),
(163, 0xfd16f8050601000000242800),
(163, 0xfe16fa050701000000222800),
(163, 0xfd16fc050601000000182800),
(163, 0xfd16fc050701000000182800),
(163, 0x0017f9050601000000871e00),
(163, 0x0017fa050601000000881e00),
(163, 0x0117f8050601000000182800),
(163, 0x0217f90506010000008b1e00),
(163, 0x0217fa0506010000008c1e00),
(163, 0x0317fb050601000000192800),
(163, 0x0117f8050701000000182800),
(163, 0x0317fb050701000000192800),
(163, 0x0117fc050601000000182800),
(163, 0x0117fc050701000000182800),
(164, 0xfc16e4050601000000891e00),
(164, 0xfd16e40506010000008a1e00),
(164, 0xfc16e40507010000008d1e00),
(164, 0xfd16e40507010000008e1e00),
(164, 0xfd16e8050601000000182800),
(164, 0xfd16e8050701000000182800),
(164, 0x0217e70507010000001c2800),
(164, 0x0017e8050601000000182800),
(164, 0x0017e8050701000000182800),
(165, 0xfd16e00506010000008d1e00),
(165, 0xfe16e00506010000008e1e00),
(165, 0xff16e10506010000001a2800),
(165, 0x0117de050601000000192800),
(165, 0x0117df0507010000001c2800),
(165, 0x0017e1050701000000182800),
(165, 0x0117e0050701000000192800),
(166, 0xfd16db050601000000891e00),
(166, 0xfe16db0506010000008a1e00),
(166, 0x0117da050601000000192800),
(166, 0x0117d9050701000000192800),
(166, 0x0117da0507010000001c2800),
(167, 0x0b17de050701000000241900),
(167, 0x0e17de050701000000241900),
(167, 0x0917e1050701000000c30400),
(167, 0x0917e3050701000000251900),
(167, 0x0c17e0050601000000ba0400),
(167, 0x0e17e1050701000000c50400),
(167, 0x0a17e40507010000008d1e00),
(167, 0x0b17e40507010000008e1e00),
(167, 0x0c17e4050601000000ba0400),
(167, 0x0d17e5050601000000241900),
(167, 0x0d17e4050701000000891e00),
(167, 0x0d17e5050701000000241900),
(167, 0x0e17e40507010000008a1e00),
(168, 0x0b17e80506010000008b1e00),
(168, 0x0b17e90506010000008c1e00),
(168, 0x0a17ea0507010000001c2800),
(168, 0x0d17e8050601000000871e00),
(168, 0x0d17e9050601000000881e00),
(168, 0x0e17eb0506010000001c2800),
(168, 0x0e17ea0507010000001c2800),
(168, 0x1217ea050601000000192800),
(168, 0x1217ea050701000000192800),
(169, 0x0b17ed050601000000871e00),
(169, 0x0b17ee050601000000881e00),
(169, 0x0a17ef0507010000001c2800),
(169, 0x0d17ed0506010000008b1e00),
(169, 0x0d17ee0506010000008c1e00),
(169, 0x0e17ef0506010000001c2800),
(169, 0x0e17ef0507010000001c2800),
(169, 0x1217ef050601000000192800),
(169, 0x1217ef050701000000192800),
(169, 0x0d17f10506010000001a2800),
(169, 0x0d17f1050701000000182800),
(169, 0x1017f10506010000001a2800),
(169, 0x1017f1050701000000182800),
(170, 0xe816f5050601000000261900),
(170, 0xe916f6050601000000871e00),
(170, 0xe916f7050601000000881e00),
(170, 0xe616fa050601000000c30400),
(170, 0xe816fc050601000000261900),
(171, 0xe816f5050701000000241900),
(171, 0xe916f6050701000000871e00),
(171, 0xe916f7050701000000881e00),
(171, 0xea16f7050701000000251900),
(171, 0xe616f8050701000000251900),
(171, 0xea16f9050701000000c30400),
(171, 0xea16fb050701000000251900),
(171, 0xe816fc050701000000241900),
(172, 0xe616ff050601000000241900),
(172, 0xe41601060601000000251900),
(172, 0xe41603060601000000251900),
(172, 0xe81600060601000000831e00),
(172, 0xe81601060601000000841e00),
(172, 0xe91602060601000000251900),
(172, 0xe91604060601000000c30400),
(173, 0xe516060606010000008b1e00),
(173, 0xe516070606010000008c1e00),
(173, 0xe91606060601000000c30400),
(173, 0xe7160a060601000000261900),
(173, 0xe91609060601000000251900),
(174, 0xe41606060701000000271900),
(174, 0xe61604060701000000241900),
(174, 0xe81605060701000000871e00),
(174, 0xe81606060701000000881e00),
(174, 0xe7160a060701000000261900),
(174, 0xe91609060701000000c30400),
(176, 0x0e17f4050701000000871e00),
(176, 0x0e17f5050701000000881e00),
(176, 0x0d17fa050701000000c50400),
(177, 0x0d17ff050701000000c50400),
(177, 0x0b1705060701000000851e00),
(177, 0x0c1705060701000000861e00),
(178, 0x1417ff050701000000c50400),
(178, 0x151704060701000000831e00),
(178, 0x151705060701000000841e00),
(179, 0x1517f4050701000000871e00),
(179, 0x1517f5050701000000881e00),
(179, 0x1617f7050701000000b90400),
(179, 0x1417fa050701000000c50400),
(180, 0x191702060701000000851e00),
(180, 0x1a1702060701000000861e00),
(180, 0x1c1701060701000000c50400),
(180, 0x191705060701000000851e00),
(180, 0x1a1705060701000000861e00),
(181, 0x2417ff050701000000c50400),
(181, 0x251700060701000000831e00),
(181, 0x251701060701000000841e00),
(182, 0x2117f7050701000000b90400),
(182, 0x2517f4050701000000871e00),
(182, 0x2517f5050701000000881e00),
(182, 0x2417fa050701000000c50400),
(183, 0x2c17f4050701000000831e00),
(183, 0x2c17f5050701000000841e00),
(183, 0x2b17fa050701000000c50400),
(184, 0x2b17ff050701000000c50400),
(184, 0x291704060701000000871e00),
(184, 0x291705060701000000881e00),
(185, 0x3717ff050601000000261900),
(185, 0x3717ff050701000000c50400),
(185, 0x2f1704060601000000271900),
(185, 0x2f17040607010000002f1900),
(185, 0x301702060601000000871e00),
(185, 0x301703060601000000881e00),
(185, 0x321701060601000000261900),
(185, 0x3017020607010000008b1e00),
(185, 0x3017030607010000008c1e00),
(185, 0x321702060701000000871e00),
(185, 0x321703060701000000881e00),
(185, 0x3a1701060601000000271900),
(185, 0x3a17010607010000002f1900),
(185, 0x321706060601000000261900),
(185, 0x3217060607010000002e1900),
(185, 0x341704060601000000c30400),
(185, 0x371706060601000000261900),
(185, 0x341704060701000000c30400),
(185, 0x3717060607010000002e1900),
(185, 0x3a1705060601000000271900),
(185, 0x3a17050607010000002f1900),
(186, 0x3017f5050601000000851e00),
(186, 0x3017f7050601000000851e00),
(186, 0x3117f5050601000000861e00),
(186, 0x3117f7050601000000861e00),
(186, 0x3717f6050601000000271900),
(186, 0x3717f5050701000000251900),
(186, 0x3117f8050701000000261900),
(186, 0x3317f8050701000000c50400),
(186, 0x3417f8050601000000261900),
(187, 0x3c17f30506010000008d1e00),
(187, 0x3d17f30506010000008e1e00),
(187, 0x3c17f50506010000008d1e00),
(187, 0x3d17f50506010000008e1e00),
(187, 0x3e17f6050601000000261900),
(187, 0x3d17f4050701000000c30400),
(187, 0x3b17f8050701000000c50400),
(187, 0x3c17f8050701000000261900),
(187, 0x4217f3050701000000271900),
(187, 0x4217f4050601000000251900),
(188, 0x3d17ed050601000000261900),
(188, 0x3f17ef050701000000241900),
(188, 0x4217e90506010000008b1e00),
(188, 0x4217ea0506010000008c1e00),
(188, 0x4217eb050601000000871e00),
(188, 0x4317eb050601000000271900),
(188, 0x4017eb050701000000c50400),
(188, 0x4117ed050601000000241900),
(188, 0x4217ec050601000000881e00),
(188, 0x4417ec050701000000251900),
(188, 0x4417ed050701000000c30400),
(189, 0x3e17e2050701000000871e00),
(189, 0x3e17e3050701000000881e00),
(189, 0x3e17e5050701000000891e00),
(189, 0x3f17e50507010000008a1e00),
(189, 0x3f17e6050701000000241900),
(189, 0x4417e3050701000000c30400),
(189, 0x4417e5050701000000271900),
(190, 0x4417d40506010000008b1e00),
(190, 0x4417d50506010000008c1e00),
(190, 0x4617d40506010000008b1e00),
(190, 0x4617d50506010000008c1e00),
(190, 0x4317d8050601000000c50400),
(191, 0x4817d4050601000000831e00),
(191, 0x4817d5050601000000841e00),
(191, 0x4917d7050601000000c50400),
(191, 0x4a17d4050601000000831e00),
(191, 0x4a17d5050601000000841e00),
(191, 0x4b17d6050601000000251900),
(191, 0x4517da050601000000c30400),
(191, 0x4b17da050601000000271900),
(191, 0x4817dc050601000000261900),
(192, 0x4717d7050701000000c50400),
(192, 0x4c17d40507010000008b1e00),
(192, 0x4c17d50507010000008c1e00),
(192, 0x4d17d6050701000000271900),
(192, 0x4217db050701000000871e00),
(192, 0x4317da050701000000c50400),
(192, 0x4417db050701000000871e00),
(192, 0x4517d9050701000000c30400),
(192, 0x4817da050701000000c30400),
(192, 0x4d17db050701000000251900),
(192, 0x4217dc050701000000881e00),
(192, 0x4317dd050701000000241900),
(192, 0x4417dc050701000000881e00),
(192, 0x4717dc050701000000c50400),
(192, 0x4917dc050701000000851e00),
(192, 0x4a17dc050701000000861e00),
(192, 0x4b17dd050701000000261900),
(193, 0x4c17e3050601000000871e00),
(193, 0x4b17e5050701000000c30400),
(193, 0x4c17e4050601000000881e00),
(193, 0x4f17e7050601000000261900),
(193, 0x4d17e8050701000000241900),
(193, 0x5117e5050601000000271900),
(193, 0x5117e5050701000000271900),
(194, 0x4c17eb0506010000008b1e00),
(194, 0x4b17ec050701000000c30400),
(194, 0x4c17ec0506010000008c1e00),
(194, 0x4f17ef050601000000241900),
(194, 0x4e17ef050701000000261900),
(194, 0x5117ed050601000000271900),
(195, 0x4b17f1050601000000851e00),
(195, 0x4c17f1050601000000861e00),
(195, 0x4b17f6050601000000851e00),
(195, 0x4a17f5050701000000c30400),
(195, 0x4c17f6050601000000861e00),
(195, 0x4d17f7050601000000241900),
(195, 0x4f17f4050601000000c30400),
(195, 0x4f17f5050701000000c30400),
(195, 0x4f17f9050701000000241900),
(195, 0x5417f3050601000000271900),
(195, 0x5417f5050701000000251900),
(196, 0x4a17ff050701000000c30400),
(196, 0x4f17ff0506010000008d1e00),
(196, 0x4f17ff050701000000c30400),
(196, 0x5017ff0506010000008e1e00),
(196, 0x5417fc050601000000251900),
(196, 0x5417fe050701000000251900),
(196, 0x4f17010606010000008d1e00),
(196, 0x4e1702060701000000261900),
(196, 0x5017010606010000008e1e00),
(196, 0x511702060601000000241900),
(196, 0x541700060601000000251900),
(197, 0x4b1707060701000000c30400),
(197, 0x4d170a060701000000241900),
(197, 0x511704060701000000871e00),
(197, 0x511705060701000000881e00),
(197, 0x531704060701000000871e00),
(197, 0x531705060701000000881e00),
(197, 0x541706060701000000271900),
(197, 0x51170a060701000000261900),
(198, 0x49170f060701000000c30400),
(198, 0x4e170d060601000000851e00),
(198, 0x4f170d060601000000861e00),
(198, 0x4e170f060701000000c30400),
(198, 0x53170f060601000000271900),
(198, 0x4e1711060601000000851e00),
(198, 0x4f1711060601000000861e00),
(198, 0x4d1712060701000000241900),
(198, 0x501712060601000000261900),
(198, 0x531710060701000000271900),
(199, 0x3c170e060701000000851e00),
(199, 0x3d170e060701000000861e00),
(199, 0x3e1712060701000000261900),
(199, 0x421710060701000000c30400),
(200, 0x3d17070607010000008d1e00),
(200, 0x3e17070607010000008e1e00),
(200, 0x3d170b0607010000008d1e00),
(200, 0x3e170b0607010000008e1e00),
(200, 0x3f170c060701000000261900),
(200, 0x431709060701000000c30400),
(200, 0x43170b060701000000251900),
(201, 0x3d1700060701000000871e00),
(201, 0x3d1701060701000000881e00),
(201, 0x3f1700060701000000871e00),
(201, 0x3f1701060701000000881e00),
(201, 0x431701060701000000271900),
(201, 0x431702060701000000c30400),
(201, 0x401705060701000000241900),
(202, 0x3f171c060701000000251900),
(202, 0x421719060601000000241900),
(202, 0x431719060701000000c50400),
(202, 0x45171a0606010000008b1e00),
(202, 0x45171b0606010000008c1e00),
(202, 0x43171e060601000000241900),
(202, 0x42171e060701000000c50400),
(202, 0x46171c060701000000c30400),
(202, 0x401721060701000000871e00),
(202, 0x401722060701000000881e00),
(202, 0x421723060701000000241900),
(202, 0x441721060701000000c30400),
(203, 0x32171b060701000000251900),
(203, 0x351718060601000000241900),
(203, 0x361718060701000000c50400),
(203, 0x3817190606010000008b1e00),
(203, 0x38171a0606010000008c1e00),
(203, 0x39171b060701000000c30400),
(203, 0x35171d060601000000241900),
(203, 0x35171d060701000000c50400),
(203, 0x331720060701000000871e00),
(203, 0x331721060701000000881e00),
(203, 0x351722060701000000241900),
(203, 0x371720060701000000c30400),
(204, 0x281719060601000000241900),
(204, 0x2b171a0606010000008b1e00),
(204, 0x2b171b0606010000008c1e00),
(204, 0x291719060701000000c50400),
(204, 0x25171c060701000000251900),
(204, 0x28171e060601000000241900),
(204, 0x28171e060701000000c50400),
(204, 0x2c171c060701000000c30400),
(204, 0x261721060701000000871e00),
(204, 0x261722060701000000881e00),
(204, 0x281723060701000000241900),
(204, 0x2a1721060701000000c30400),
(205, 0x1b1718060601000000241900),
(205, 0x18171b060701000000251900),
(205, 0x1e17190606010000008b1e00),
(205, 0x1e171a0606010000008c1e00),
(205, 0x1c1718060701000000c50400),
(205, 0x1f171b060701000000c30400),
(205, 0x1b171d060601000000241900),
(205, 0x1b171d060701000000c50400),
(205, 0x191720060701000000871e00),
(205, 0x191721060701000000881e00),
(205, 0x1b1720060701000000871e00),
(205, 0x1b1721060701000000881e00),
(205, 0x1b1722060701000000241900),
(205, 0x1d1720060701000000c30400),
(206, 0x15170b0606010000008b1e00),
(206, 0x17170a060601000000241900),
(206, 0x1b170b060601000000871e00),
(206, 0x1b170a060701000000241900),
(206, 0x1d170a060601000000241900),
(206, 0x1c170a060701000000bc0400),
(206, 0x14170c060601000000251900),
(206, 0x15170c0606010000008c1e00),
(206, 0x16170d060701000000c30400),
(206, 0x18170e060601000000be0400),
(206, 0x1a170f060601000000bb0400),
(206, 0x1b170c060601000000881e00),
(206, 0x18170f060701000000bc0400),
(206, 0x1e170d060601000000251900),
(206, 0x1e170f060601000000271900),
(206, 0x1c170e060701000000bc0400),
(206, 0x1e170d060701000000271900),
(206, 0x161711060601000000271900),
(206, 0x161711060701000000c40400),
(206, 0x191712060601000000261900),
(206, 0x1a1712060701000000241900),
(206, 0x1c1710060601000000be0400),
(206, 0x1d1710060601000000261900),
(206, 0x1e1711060701000000251900),
(207, 0x26170d060701000000831e00),
(207, 0x26170e060701000000841e00),
(207, 0x251712060701000000c50400),
(207, 0x261712060701000000261900),
(208, 0x26170d060601000000871e00),
(208, 0x26170e060601000000881e00),
(208, 0x221712060601000000c50400),
(209, 0x35170f060701000000871e00),
(209, 0x321711060701000000f71a00),
(209, 0x341713060701000000731b00),
(209, 0x351710060701000000881e00),
(209, 0x361711060701000000741b00),
(210, 0x341708060701000000731b00),
(210, 0x3517090607010000008b1e00),
(210, 0x35170a0607010000008c1e00),
(210, 0x36170a060701000000741b00),
(210, 0x32170d060701000000f71a00),
(211, 0x301708060701000000731b00),
(211, 0x301709060701000000851e00),
(211, 0x311709060701000000861e00),
(211, 0x30170c060701000000ee1a00),
(212, 0x29170a060701000000741b00),
(212, 0x2a1709060701000000871e00),
(212, 0x2a170a060701000000881e00),
(212, 0x2b1708060701000000731b00),
(212, 0x2d170d060701000000f71a00),
(213, 0x2a170f0607010000008b1e00),
(213, 0x291711060701000000741b00),
(213, 0x2a17100607010000008c1e00),
(213, 0x2c1713060701000000731b00),
(213, 0x2d1711060701000000f71a00),
(214, 0x2a170f060601000000831e00),
(214, 0x291711060601000000741b00),
(214, 0x2a1710060601000000841e00),
(214, 0x2d1710060601000000f71a00),
(215, 0x29170b060601000000741b00),
(215, 0x2a1709060601000000871e00),
(215, 0x2a170a060601000000881e00),
(215, 0x2d170d060601000000f71a00),
(216, 0x2e1709060601000000831e00),
(216, 0x2e170a060601000000841e00),
(216, 0x301708060601000000711b00),
(216, 0x30170c060601000000ee1a00),
(217, 0x3517090606010000008b1e00),
(217, 0x35170a0606010000008c1e00),
(217, 0x36170b060601000000741b00),
(217, 0x32170d060601000000f71a00),
(218, 0x35170f0606010000008b1e00),
(218, 0x321710060601000000f71a00),
(218, 0x3517100606010000008c1e00),
(218, 0x361711060601000000741b00),
(219, 0x35170f060501000000871e00),
(219, 0x321710060501000000f71a00),
(219, 0x351710060501000000881e00),
(219, 0x361711060501000000741b00),
(220, 0x351709060501000000871e00),
(220, 0x35170a060501000000881e00),
(220, 0x36170b060501000000741b00),
(220, 0x32170d060501000000f71a00),
(221, 0x301708060501000000711b00),
(221, 0x3117090605010000008b1e00),
(221, 0x31170a0605010000008c1e00),
(221, 0x30170c060501000000ee1a00),
(222, 0x29170b060501000000741b00),
(222, 0x2a1709060501000000831e00),
(222, 0x2a170a060501000000841e00),
(222, 0x2d170d060501000000f71a00),
(223, 0x2a170f060501000000871e00),
(223, 0x291711060501000000741b00),
(223, 0x2a1710060501000000881e00),
(223, 0x2d1710060501000000f71a00),
(224, 0x2f1709060401000000871e00),
(224, 0x2f170a060401000000881e00),
(224, 0x2d170f060401000000ee1a00),
(225, 0x3117090604010000008b1e00),
(225, 0x31170a0604010000008c1e00),
(225, 0x32170f060401000000ee1a00),
(226, 0x2e1709060301000000871e00),
(226, 0x2e170a060301000000881e00),
(226, 0x2f170e060301000000ee1a00),
(227, 0x1c1728060701000000222800),
(227, 0x1e172e060701000000182800),
(227, 0x1f172c060701000000871e00),
(227, 0x1f172d060701000000881e00),
(227, 0x221728060701000000192800),
(227, 0x21172c060701000000871e00),
(227, 0x21172d060701000000881e00),
(227, 0x21172e060701000000182800),
(227, 0x22172d060701000000192800),
(228, 0xea16370604010000008b1e00),
(228, 0xea16380604010000008c1e00),
(228, 0xec163a0604010000002c1900),
(228, 0xed16380604010000006f1800),
(229, 0x18172d0606010000002c1900),
(229, 0x18172d060701000000242800),
(229, 0x19172d060701000000182800),
(229, 0x1717310606010000008b1e00),
(229, 0x1717320606010000008c1e00),
(229, 0x1817330606010000002c1900),
(229, 0x191731060601000000871e00),
(229, 0x191732060601000000881e00),
(229, 0x1a17310606010000002d1900),
(229, 0x1a17300607010000002d1900),
(230, 0x14172d0606010000002c1900),
(230, 0x14172d060701000000711800),
(230, 0x15172d0607010000002c1900),
(230, 0x131731060601000000871e00),
(230, 0x131732060601000000881e00),
(230, 0x1417330606010000002c1900),
(230, 0x151733060601000000711800),
(230, 0x141733060701000000242800),
(230, 0x191733060701000000182800),
(230, 0x1317350607010000008b1e00),
(230, 0x1317360607010000008c1e00),
(230, 0x161735060701000000691800),
(230, 0x1617360607010000002d1900),
(231, 0x10172f060701000000242800),
(231, 0x11172f060701000000182800),
(231, 0x0e17300607010000008b1e00),
(231, 0x0e17310607010000008c1e00),
(231, 0x111730060701000000871e00),
(231, 0x111731060701000000881e00),
(231, 0x101735060701000000182800),
(231, 0x1117350607010000001f2800),
(232, 0x0b17270606010000001b2800),
(232, 0x0817250607010000001f2800),
(232, 0x0a1725060701000000182800),
(232, 0x061729060601000000871e00),
(232, 0x06172a060601000000881e00),
(232, 0x06172b060601000000182800),
(232, 0x07172b060701000000182800),
(232, 0x081729060601000000871e00),
(232, 0x08172a060601000000881e00),
(232, 0x0b172a0606010000001c2800),
(232, 0x0b172a0607010000001c2800),
(232, 0x0d1728060701000000182800),
(232, 0x0e172a060701000000192800),
(233, 0xfe16290606020000002c19002c1900),
(233, 0xff16290606020000002c19002c1900),
(233, 0xfe1629060701000000711800),
(233, 0xff1629060701000000711800),
(233, 0xfc162f060602000000291900291900),
(233, 0xfe162c060601000000242800),
(233, 0xfd162e0607010000008b1e00),
(233, 0xfd162f0607010000008c1e00),
(233, 0xfe162c060701000000711800),
(233, 0xfe1630060701000000182800),
(233, 0xff1630060701000000182800),
(233, 0x021727060701000000871e00),
(233, 0x021728060701000000881e00),
(233, 0x00172e060601000000291900),
(233, 0x00172f060601000000291900),
(234, 0xea1637060701000000831e00),
(234, 0xea1638060701000000841e00),
(234, 0xeb163a0607010000002c1900),
(234, 0xed16380607010000006f1800),
(235, 0xea1633060701000000871e00),
(235, 0xe916350607010000002d1900),
(235, 0xea1634060701000000881e00),
(235, 0xed16340607010000006f1800),
(236, 0xea162f0607010000008b1e00),
(236, 0xec162e0607010000002c1900),
(236, 0xea16300607010000008c1e00),
(236, 0xed16300607010000006f1800),
(237, 0xf4162f060701000000831e00),
(237, 0xf016300607010000006f1800),
(237, 0xf41630060701000000841e00),
(238, 0xf016330607010000006f1800),
(238, 0xf41632060701000000871e00),
(238, 0xf41633060701000000881e00),
(238, 0xf516320607010000002d1900),
(239, 0xea1637060601000000831e00),
(239, 0xea1638060601000000841e00),
(239, 0xed16380606010000006f1800),
(240, 0xea1633060601000000871e00),
(240, 0xea1634060601000000881e00),
(240, 0xed16340606010000006f1800),
(241, 0xea162f0606010000008b1e00),
(241, 0xea16300606010000008c1e00),
(241, 0xed16300606010000006f1800),
(242, 0xf4162f060601000000871e00),
(242, 0xf31632060601000000711800),
(242, 0xf41630060601000000881e00),
(242, 0xf516300606010000002d1900),
(243, 0xf41637060601000000871e00),
(243, 0xf016380606010000006f1800),
(243, 0xf41638060601000000881e00),
(243, 0xf516380606010000002f1900),
(244, 0xea1637060501000000831e00),
(244, 0xea1638060501000000841e00),
(244, 0xec163a0605010000002c1900),
(244, 0xed16380605010000006f1800),
(245, 0xea1633060501000000871e00),
(245, 0xea1634060501000000881e00),
(245, 0xed16340605010000006f1800),
(246, 0xea162f060501000000871e00),
(246, 0xea1630060501000000881e00),
(246, 0xed16300605010000006f1800),
(247, 0xf4162f0605010000008b1e00),
(247, 0xf116300605010000006f1800),
(247, 0xf416300605010000008c1e00),
(247, 0xf516310605010000002d1900),
(248, 0xf316320605010000002c1900),
(248, 0xf41633060501000000831e00),
(248, 0xf116340605010000006f1800),
(248, 0xf41634060501000000841e00),
(249, 0xea1633060401000000871e00),
(249, 0xea1634060401000000881e00),
(249, 0xed16340604010000006f1800),
(250, 0xf41637060501000000871e00),
(250, 0xf116380605010000006f1800),
(250, 0xf2163a0605010000002e1900),
(250, 0xf41638060501000000881e00),
(250, 0xf516380605010000002d1900),
(251, 0xea162f060401000000831e00),
(251, 0xea1630060401000000841e00),
(251, 0xed16300604010000006f1800),
(252, 0xf4162f060401000000871e00),
(252, 0xf116300604010000006f1800),
(252, 0xf41630060401000000881e00),
(252, 0xf516310604010000002d1900),
(253, 0xf316320604010000002c1900),
(253, 0xf416330604010000008b1e00),
(253, 0xf116340604010000006f1800),
(253, 0xf416340604010000008c1e00),
(254, 0xf41637060401000000871e00),
(254, 0xf116380604010000006f1800),
(254, 0xf2163a0604010000002e1900),
(254, 0xf41638060401000000881e00),
(254, 0xf516380604010000002d1900),
(257, 0xea1637060301000000871e00),
(257, 0xea1638060301000000881e00),
(257, 0xec163a0603010000002c1900),
(257, 0xed16380603010000006f1800),
(258, 0xea1633060301000000871e00),
(258, 0xea1634060301000000881e00),
(258, 0xed16340603010000006f1800),
(259, 0xea162f0603010000008b1e00),
(259, 0xea16300603010000008c1e00),
(259, 0xed16300603010000006f1800),
(260, 0xf116300603010000006f1800),
(260, 0xf21631060301000000891e00),
(260, 0xf316310603010000008a1e00),
(260, 0xf516310603010000002d1900),
(261, 0xf316320603010000002c1900),
(261, 0xf41633060301000000871e00),
(261, 0xf116340603010000006f1800),
(261, 0xf41634060301000000881e00),
(262, 0xf41637060301000000831e00),
(262, 0xf116380603010000006f1800),
(262, 0xf2163a0603010000002e1900),
(262, 0xf41638060301000000841e00),
(262, 0xf516380603010000002f1900),
(263, 0xbf161d060701000000c30400),
(263, 0xbf1622060601000000251900),
(263, 0xbf1622060701000000251900),
(263, 0xc2161b060601000000241900),
(263, 0xc3161f060701000000871e00),
(263, 0xc5161d060701000000c30400),
(263, 0xc11620060601000000c50400),
(263, 0xc11623060601000000281900),
(263, 0xc11620060701000000c50400),
(263, 0xc31620060701000000881e00),
(263, 0xc31623060701000000281900),
(263, 0xc41621060601000000831e00),
(263, 0xc41622060601000000841e00),
(263, 0xc41623060601000000241900),
(264, 0xc5160d060601000000831e00),
(264, 0xc5160e060601000000841e00),
(264, 0xc4160f060701000000251900),
(264, 0xc6160c060701000000241900),
(264, 0xc7160c060701000000130700),
(264, 0xc8160f060601000000c30400),
(264, 0xca160c060701000000241900),
(264, 0xcc160f060701000000251900),
(264, 0xc516110606010000008b1e00),
(264, 0xc516120606010000008c1e00),
(264, 0xc41611060701000000251900),
(264, 0xc81612060601000000c30400),
(264, 0xc81612060701000000c30400),
(264, 0xca1610060701000000c50400),
(264, 0xcb1611060701000000871e00),
(264, 0xcb1612060701000000881e00),
(264, 0xcc1612060701000000251900),
(264, 0xc61614060701000000241900),
(264, 0xc71614060701000000c50400),
(264, 0xca1614060701000000241900),
(265, 0xbe160e060601000000c30400),
(265, 0xbc160d0607010000008b1e00),
(265, 0xbc160e0607010000008c1e00),
(265, 0xbd160c060701000000241900),
(265, 0xbe160e060701000000c30400),
(265, 0xbb1612060701000000251900),
(265, 0xbd1610060601000000241900),
(265, 0xbd1610060701000000c50400),
(265, 0xbd1614060701000000241900),
(265, 0xbf1614060701000000c50400),
(265, 0xc1160c060701000000241900),
(265, 0xc1160d060701000000871e00),
(265, 0xc1160e060701000000881e00),
(265, 0xc01610060601000000241900),
(265, 0xc11610060601000000c50400),
(265, 0xc01610060701000000130700),
(265, 0xc21611060701000000251900),
(265, 0xc11614060701000000241900),
(266, 0xbd16f7050701000000831e00),
(266, 0xbf16f8050601000000b90400),
(266, 0xbd16f8050701000000841e00),
(266, 0xbd16ff0507010000008b1e00),
(266, 0xc516f7050701000000871e00),
(266, 0xc016f9050701000000bc0400),
(266, 0xc116fb050701000000ba0400),
(266, 0xc516f8050701000000881e00),
(266, 0xc016fe050701000000bc0400),
(266, 0xc116fc050701000000ba0400),
(266, 0xbe16010606010000002e1900),
(266, 0xbf1600060601000000b90400),
(266, 0xbd16000607010000008c1e00),
(266, 0xbe16010607010000002e1900),
(267, 0x9d16e60505010000001c2800),
(267, 0x9d16e60506010000001b2800),
(267, 0x9316e9050401000000e00600),
(267, 0x9316e9050501000000e00600),
(267, 0x9316e9050601000000e00600),
(267, 0x9416e9050401000000e10600),
(267, 0x9616eb0504010000001c2800),
(267, 0x9416e9050501000000e10600),
(267, 0x9616eb0505010000001c2800),
(267, 0x9416e9050601000000e10600),
(267, 0x9616eb0506010000001c2800),
(267, 0x9a16e80504010000001f2800),
(267, 0x9b16e80505010000001f2800),
(267, 0x9c16e8050401000000182800),
(267, 0x9d16ea0506010000001c2800),
(267, 0x9e16eb050601000000e00600),
(267, 0x9f16eb050601000000e10600),
(267, 0x9316ec050401000000e00600),
(267, 0x9316ec050501000000e00600),
(267, 0x9316ec050601000000e00600),
(267, 0x9416ec050401000000e10600),
(267, 0x9416ed0504010000001a2800),
(267, 0x9416ec050501000000e10600),
(267, 0x9416ed0505010000001a2800),
(267, 0x9416ec050601000000e10600),
(267, 0x9a16ed0504010000001f2800),
(267, 0x9a16ef0506010000001c2800),
(267, 0x9f16ee050601000000222800),
(267, 0xa116e9050601000000da0600),
(267, 0xa116ea050601000000db0600),
(267, 0xa216e9050601000000da0600),
(267, 0xa216ea050601000000db0600),
(267, 0xa316ea0506010000001b2800),
(267, 0xa316eb050601000000192800),
(267, 0xa316ea050701000000691800),
(267, 0x9716f2050401000000da0600),
(267, 0x9716f3050401000000db0600),
(267, 0x9816f10504010000001f2800),
(267, 0x9916f2050401000000da0600),
(267, 0x9916f3050401000000db0600),
(267, 0x9d16f1050601000000da0600),
(267, 0x9d16f2050601000000db0600),
(267, 0x9e16f00506010000001f2800),
(267, 0x9f16f00507010000006c1800),
(267, 0x9816f40504010000001a2800),
(267, 0x9916f40504010000001a2800),
(267, 0x9a16f40506010000001f2800),
(267, 0xa116f1050601000000da0600),
(267, 0xa116f2050601000000db0600),
(267, 0xa216f1050601000000da0600),
(267, 0xa216f2050601000000db0600),
(267, 0xa316f20506010000001b2800),
(267, 0xa316f3050601000000192800),
(267, 0xa316f30507010000002f1900),
(267, 0xa116f40506010000001f2800),
(267, 0xa216f40507010000006c1800),
(268, 0xc01627060701000000da0600),
(268, 0xc11627060701000000da0600),
(268, 0xc01628060701000000db0600),
(268, 0xc11628060701000000db0600),
(268, 0xc3162a060701000000bc0400),
(268, 0xc2162f060701000000261900),
(268, 0xc5162f060701000000261900),
(268, 0xc6162d060701000000c30400),
(268, 0xc6162e060701000000271900),
(269, 0xc3162a060601000000bc0400),
(269, 0xc51628060601000000c30400),
(269, 0xc51629060601000000271900),
(269, 0xc1162c060601000000e00600),
(269, 0xc1162e060601000000e00600),
(269, 0xc2162c060601000000e10600),
(269, 0xc2162e060601000000e10600),
(269, 0xc2162f060601000000261900),
(269, 0xc5162f060601000000261900),
(270, 0xce162d0607010000001c2800),
(270, 0xd4162f0607010000001c2800),
(270, 0xd6162e060701000000da0600),
(270, 0xd6162f060701000000db0600),
(270, 0xd7162e060701000000da0600),
(270, 0xd7162f060701000000db0600),
(270, 0xd11630060701000000242800),
(270, 0xd616320607010000001a2800),
(270, 0xd716320607010000001a2800),
(271, 0xd4162f0606010000001c2800),
(271, 0xd6162e060601000000da0600),
(271, 0xd6162f060601000000db0600),
(271, 0xd7162e060601000000da0600),
(271, 0xd7162f060601000000db0600),
(271, 0xd21630060601000000242800),
(272, 0xdf1637060701000000222800),
(272, 0xdc1638060701000000e00600),
(272, 0xdd1638060701000000e10600),
(272, 0xde16390607010000001a2800),
(273, 0xde1633060701000000222800),
(273, 0xdc1634060701000000e00600),
(273, 0xdd1634060701000000e10600),
(274, 0xe11633060701000000222800),
(274, 0xe41632060701000000da0600),
(274, 0xe41633060701000000db0600),
(275, 0xe21637060701000000222800),
(275, 0xe31638060701000000e00600),
(275, 0xe41638060701000000e10600),
(275, 0xe416390607010000001a2800),
(276, 0xdd1635060601000000242800),
(276, 0xdf1635060601000000e00600),
(276, 0xde16390606010000001a2800),
(276, 0xe01635060601000000e10600),
(276, 0xe016390606010000001a2800),
(277, 0xde1633060601000000222800),
(277, 0xe21636060601000000da0600),
(277, 0xe21637060601000000db0600),
(277, 0xe316350606010000001f2800),
(277, 0xe41636060601000000da0600),
(277, 0xe41637060601000000db0600),
(277, 0xe416390606010000001a2800),
(278, 0x0c17d10507010000001f2800),
(278, 0x0a17d6050601000000e00600),
(278, 0x0b17d6050601000000e10600),
(278, 0x0b17d70506010000001a2800),
(278, 0x0d17d7050601000000182800),
(278, 0x0c17d7050701000000242800),
(278, 0x0c17d8050701000000050600),
(279, 0x1317d10507010000001f2800),
(279, 0x1117d6050601000000e00600),
(279, 0x1217d6050601000000e10600),
(279, 0x1217d7050601000000182800),
(279, 0x1317d7050701000000242800),
(279, 0x1417d70506010000001a2800),
(279, 0x1317d8050701000000050600),
(280, 0x1b17d20506010000001c2800),
(280, 0x1b17d20507010000001c2800),
(280, 0x1d17d30506010000001f2800),
(280, 0x1e17d1050601000000da0600),
(280, 0x1e17d2050601000000db0600),
(280, 0x1e17d1050701000000da0600),
(280, 0x1e17d2050701000000db0600),
(280, 0x1917d70506010000001a2800),
(280, 0x1a17d7050601000000182800),
(280, 0x1b17d5050601000000192800),
(280, 0x1917d40507010000001f2800),
(280, 0x1917d7050701000000242800),
(280, 0x1d17d40507010000001f2800),
(281, 0x2517d20506010000001c2800),
(281, 0x2717d30506010000001f2800),
(281, 0x2517d20507010000001c2800),
(281, 0x2817d1050601000000da0600),
(281, 0x2817d2050601000000db0600),
(281, 0x2817d1050701000000da0600),
(281, 0x2817d2050701000000db0600),
(281, 0x2317d7050601000000182800),
(281, 0x2317d40507010000001f2800),
(281, 0x2317d7050701000000242800),
(281, 0x2417d70506010000001a2800),
(281, 0x2517d5050601000000192800),
(281, 0x2717d40507010000001f2800),
(282, 0x1217e2050701000000192800),
(282, 0x1317e1050701000000da0600),
(282, 0x1317e2050701000000db0600),
(282, 0x1517e30507010000001c2800),
(282, 0x1c17e3050701000000222800),
(282, 0x1417e4050701000000182800),
(282, 0x1817e50507010000001f2800),
(282, 0x1f17e7050701000000192800),
(282, 0x1717eb050701000000182800),
(282, 0x1917eb050701000000182800),
(282, 0x1d17e90507010000001f2800),
(283, 0x1317e1050601000000da0600),
(283, 0x1317e2050601000000db0600),
(283, 0x1517e20506010000001c2800),
(283, 0x1817e0050601000000182800),
(283, 0x1c17e2050601000000222800),
(283, 0x1417e4050601000000182800),
(283, 0x1517e7050601000000251900),
(283, 0x1817e40506010000001f2800),
(283, 0x1a17e70506010000001c2800),
(283, 0x1b17e5050601000000e00600),
(283, 0x1c17e5050601000000e10600),
(283, 0x1f17e5050601000000192800),
(283, 0x1717e9050601000000241900),
(283, 0x1817e9050601000000bc0400),
(283, 0x1b17e8050601000000e00600),
(283, 0x1c17e8050601000000e10600),
(283, 0x1d17e9050601000000182800),
(283, 0x1f17e8050601000000192800),
(284, 0x2817da0507010000001a2800),
(284, 0x2a17dc0507010000001c2800),
(284, 0x2d17de050701000000242800),
(284, 0x2517e00507010000001b2800),
(284, 0x2617e0050701000000e00600),
(284, 0x2617e1050701000000e00600),
(284, 0x2717e0050701000000e10600),
(284, 0x2717e1050701000000e10600),
(284, 0x2817e20507010000001a2800),
(285, 0x2617db050601000000da0600),
(285, 0x2917db050601000000da0600),
(285, 0x2517de050601000000192800),
(285, 0x2617dc050601000000db0600),
(285, 0x2817dd0506010000001f2800),
(285, 0x2917dc050601000000db0600),
(285, 0x2517e0050601000000192800),
(285, 0x2817e2050601000000182800),
(285, 0x2a17e0050601000000222800),
(286, 0x2b17dd050501000000e00600),
(286, 0x2c17dd050501000000e10600),
(286, 0x2d17de0505010000001a2800),
(286, 0x2e17dc0505010000001b2800),
(286, 0x2c17de050601000000242800),
(287, 0x3117da050701000000e00600),
(287, 0x3217da050701000000e10600),
(287, 0x3417db0507010000001c2800),
(287, 0x3a17db0507010000001b2800),
(287, 0x3117dd050701000000e00600),
(287, 0x3217dd050701000000e10600),
(287, 0x3417e1050701000000222800),
(287, 0x3917e20507010000001f2800),
(287, 0x3b17e00507010000001b2800),
(287, 0x3b17e10507010000001b2800),
(288, 0x3517da050501000000e00600),
(288, 0x3617da050501000000e10600),
(288, 0x3a17db0506010000001b2800),
(288, 0x3317de050601000000242800),
(288, 0x3517dd050501000000e00600),
(288, 0x3617dd050501000000e10600),
(288, 0x3417dc0506010000001c2800),
(288, 0x3a17dd0506010000001b2800),
(289, 0x3a17df050601000000da0600),
(289, 0x3717e2050601000000242800),
(289, 0x3917e20506010000001f2800),
(289, 0x3a17e0050601000000db0600),
(289, 0x3b17e00506010000001b2800),
(289, 0x3b17e10506010000001b2800),
(290, 0x3417e9050701000000222800),
(290, 0x3817e90506010000001b2800),
(290, 0x3817e9050701000000192800),
(290, 0x3617ec050601000000e00600),
(290, 0x3717ec050601000000e10600),
(290, 0x3817ec0506010000001b2800),
(290, 0x3817ec050701000000192800),
(291, 0x3217eb050701000000242800),
(291, 0x3017ef050701000000e00600),
(291, 0x3117ef050701000000e10600),
(291, 0x3517ef0506010000001c2800),
(291, 0x3717ed0506010000001a2800),
(292, 0x2a17e8050701000000222800),
(292, 0x2c17ec050701000000da0600),
(292, 0x2c17ed050701000000db0600),
(293, 0x2817eb0506010000001f2800),
(293, 0x2a17e8050601000000192800),
(293, 0x2a17e9050601000000222800),
(293, 0x2617ed0506010000001c2800),
(293, 0x2a17ee0506010000001c2800),
(293, 0x2b17ec050601000000e00600),
(293, 0x2b17ef050601000000e00600),
(293, 0x2c17ec050601000000e10600),
(293, 0x2c17ef050601000000e10600),
(293, 0x2917f0050601000000182800),
(293, 0x2c17f0050601000000182800),
(295, 0x591602060201000000891e00),
(295, 0x5a16020602010000008a1e00),
(295, 0x5716040603010000006f1800),
(295, 0x5a16060602010000002c1900),
(295, 0x5a16060603010000002c1900),
(295, 0x5a16060604010000002e1900),
(295, 0x5d16040602010000002d1900),
(295, 0x5d16040603010000002f1900),
(295, 0x5d16040604010000002d1900),
(296, 0x0b1756060601000000e00600),
(296, 0x0c1756060601000000e10600),
(296, 0x0c1757060601000000241900),
(296, 0x0c1757060701000000241900),
(296, 0x111756060701000000c50400),
(296, 0x1317540607010000002d1900),
(296, 0x1317550607010000002d1900),
(296, 0x10175a060701000000050600),
(297, 0x0a1761060701000000e00600),
(297, 0x0a1763060701000000e00600),
(297, 0x0b1761060701000000e10600),
(297, 0x0b1763060701000000e10600),
(297, 0x0c17620606010000001c2800),
(297, 0x0b1764060701000000281900),
(297, 0x0c1766060701000000222800),
(297, 0x0e1764060701000000ea1300),
(297, 0x1017620606010000001b2800),
(297, 0x1017620607010000002b1900),
(297, 0x1017630607010000002b1900),
(297, 0x1017660606010000001b2800),
(297, 0x1017670606010000001b2800),
(297, 0x1017670607010000001b2800),
(298, 0x0a176c060701000000e00600),
(298, 0x0a176e060701000000e00600),
(298, 0x0b176c060701000000e10600),
(298, 0x0b176e060701000000e10600),
(298, 0x0c176d0606010000001c2800),
(298, 0x0e176f0607010000001f2800),
(298, 0x10176d0607010000001c2800),
(298, 0x0e17730606010000001a2800),
(298, 0x0f17730606010000001a2800),
(298, 0x0c1771060701000000222800),
(298, 0x0e17730607010000001a2800),
(298, 0x0f17730607010000001a2800),
(299, 0xfe1667060701000000da0600),
(299, 0xfe1668060701000000db0600),
(299, 0x00176a060701000000242800),
(299, 0x0217680607010000001b2800),
(299, 0x0217690607010000001b2800),
(300, 0xfe1670060701000000da0600),
(300, 0xfe1671060701000000db0600),
(300, 0x00176f060701000000242800),
(300, 0x0217710607010000001b2800),
(300, 0x0217720607010000001b2800),
(301, 0xfb166e060701000000050600),
(301, 0xfa1673060701000000e00600),
(301, 0xfb1670060701000000ea1300),
(301, 0xfb1673060701000000e10600),
(301, 0xfc1670060701000000281900),
(301, 0xfb16740607010000002a1900),
(302, 0x1d177b060601000000281900),
(302, 0x1c177c060601000000da0600),
(302, 0x1c177d060601000000db0600),
(302, 0x1d177f060601000000ed1300),
(302, 0x1e177c060601000000f61300),
(302, 0x1e177f060601000000281900),
(303, 0xb61667060701000000222800),
(303, 0xb3166b060701000000192800),
(303, 0xb51668060701000000212800),
(303, 0xb81669060701000000da0600),
(303, 0xb8166a060701000000db0600),
(303, 0xb91669060701000000da0600),
(303, 0xb9166a060701000000db0600),
(303, 0xba166a060701000000192800),
(303, 0xb5166d060701000000182800),
(303, 0xb9166d060701000000182800),
(303, 0xba166c060701000000192800),
(304, 0xfe1661060701000000da0600),
(304, 0xfe1662060701000000db0600),
(304, 0x011760060701000000242800),
(304, 0x0217620607010000001b2800),
(304, 0x0217630607010000001b2800),
(304, 0x0017640607010000001a2800),
(305, 0xf71661060701000000da0600),
(305, 0xf71662060701000000db0600),
(305, 0xf91660060701000000242800),
(305, 0xf816650607010000001a2800),
(305, 0xfa16650607010000001a2800),
(306, 0xdd1657060601000000e00600),
(306, 0xde1657060601000000e10600),
(306, 0xdd1658060601000000e00600),
(306, 0xde1658060601000000e10600),
(306, 0xde1659060701000000182800),
(306, 0xdf1659060701000000242800),
(306, 0xe116550606010000001b2800),
(306, 0xe116570606010000001b2800),
(306, 0xe116550607010000001b2800),
(306, 0xe116570607010000001b2800),
(307, 0xeb16570606010000001a2800),
(307, 0xe816570607010000001f2800),
(307, 0xeb1654060701000000da0600),
(307, 0xeb1655060701000000db0600),
(307, 0xec16570606010000001f2800),
(307, 0xec1654060701000000da0600),
(307, 0xec1655060701000000db0600),
(307, 0xeb16590607010000001a2800),
(307, 0xec1659060701000000242800),
(308, 0xd61657060601000000e00600),
(308, 0xd71657060601000000e10600),
(308, 0xd61658060601000000e00600),
(308, 0xd71658060601000000e10600),
(308, 0xd71659060701000000182800),
(308, 0xd81659060701000000242800),
(309, 0xd81660060701000000242800),
(309, 0xdc1661060701000000da0600),
(309, 0xdc1662060701000000db0600),
(309, 0xdd16620607010000001b2800),
(309, 0xd916650607010000001a2800),
(309, 0xda16650607010000001a2800),
(309, 0xdd16640607010000001b2800),
(310, 0xcf165a0606010000001f2800),
(310, 0xcf165a0607010000001f2800),
(310, 0xd11657060601000000da0600),
(310, 0xd11658060601000000db0600),
(310, 0xd21658060601000000192800),
(310, 0xd21659060601000000192800),
(310, 0xd0165c060701000000222800),
(311, 0xcc1661060601000000e00600),
(311, 0xcc1662060601000000e00600),
(311, 0xcd1661060601000000e10600),
(311, 0xcd1662060601000000e10600),
(311, 0xcd16630606010000001a2800),
(311, 0xcf16630606010000001a2800),
(311, 0xce1663060701000000242800),
(312, 0xc4166a060701000000192800),
(312, 0xc61668060701000000242800),
(312, 0xc9166b060701000000192800),
(312, 0xc4166c060701000000192800),
(312, 0xc5166c060701000000e00600),
(312, 0xc6166c060701000000e10600),
(312, 0xc6166d060701000000182800),
(312, 0xc7166d0607010000001f2800),
(312, 0xc8166d060701000000182800),
(313, 0xc51661060601000000e00600),
(313, 0xc51662060601000000e00600),
(313, 0xc61661060601000000e10600),
(313, 0xc61662060601000000e10600),
(313, 0xc616630606010000001a2800),
(313, 0xc71663060701000000242800),
(313, 0xc816630606010000001a2800),
(314, 0x771626060701000000491900),
(314, 0x7a1624060701000000481900),
(314, 0x7d1626060701000000491900),
(314, 0x76162a060601000000dc0600),
(314, 0x77162a060601000000dd0600),
(314, 0x7a162a060601000000271900),
(314, 0x7916280607010000009e1400),
(314, 0x7a162a060701000000c30400),
(314, 0x7c16280607010000009e1400),
(314, 0x7f162a060701000000c50400),
(314, 0x76162d060601000000dc0600),
(314, 0x77162d060601000000dd0600),
(314, 0x77162e060701000000261900),
(314, 0x78162e060601000000261900),
(314, 0x7a162d060601000000c30400),
(314, 0x7b162e060601000000481900),
(314, 0x79162f060701000000de0600),
(314, 0x7c162d060601000000491900),
(314, 0x7c162d0607010000009e1400),
(314, 0x7d162c060701000000491900),
(314, 0x7d162f060701000000491900),
(314, 0x791630060701000000df0600),
(314, 0x7b1631060701000000481900),
(315, 0xcb166b060701000000192800),
(315, 0xcd1668060701000000182800),
(315, 0xcc166c060701000000e00600),
(315, 0xcd166c060701000000e10600),
(315, 0xcd166d060701000000182800),
(315, 0xce166d060701000000182800),
(315, 0xd0166b060701000000222800),
(316, 0xd5166b060701000000222800),
(316, 0xda166b060701000000da0600),
(316, 0xdb166a0607010000001c2800),
(316, 0xd8166d0607010000001a2800),
(316, 0xd9166d0607010000001a2800),
(316, 0xda166c060701000000db0600),
(317, 0xca16720606010000001b2800),
(317, 0xcf16720606010000001b2800),
(317, 0xcf1671060701000000222800),
(317, 0xcf16720607010000001b2800),
(317, 0xcd16740606010000001f2800),
(317, 0xcc1675060701000000da0600),
(317, 0xcc1676060701000000db0600),
(317, 0xcd16740607010000001f2800),
(317, 0xcf1675060701000000da0600),
(317, 0xcf1676060701000000db0600),
(317, 0xd016760607010000001b2800),
(318, 0xd51673060701000000222800),
(318, 0xdb16720607010000001c2800),
(318, 0xd81676060701000000da0600),
(318, 0xd81677060701000000db0600),
(318, 0xd916750607010000001f2800),
(318, 0xda1676060701000000da0600),
(318, 0xda1677060701000000db0600),
(318, 0xdb16740607010000001b2800),
(318, 0xd916780607010000001a2800),
(318, 0xda16780607010000001a2800),
(319, 0xe21661060701000000da0600),
(319, 0xe21662060701000000db0600),
(319, 0xe41660060701000000182800),
(319, 0xe51660060701000000182800),
(319, 0xe71663060701000000222800),
(319, 0xe11664060701000000192800),
(319, 0xe71664060701000000192800),
(320, 0xee1663060701000000222800),
(320, 0xee1664060701000000192800),
(320, 0xf11660060701000000182800),
(320, 0xf31661060701000000da0600),
(320, 0xf31662060701000000db0600),
(320, 0xf11665060701000000182800),
(320, 0xf21665060701000000182800),
(320, 0xf41664060701000000192800),
(321, 0xe31669060701000000192800),
(321, 0xe4166a060701000000e00600),
(321, 0xe5166a060701000000e10600),
(321, 0xe5166b060701000000182800),
(321, 0xe71668060701000000192800),
(321, 0xe71669060701000000222800),
(322, 0xee1669060701000000222800),
(322, 0xef166a060701000000e00600),
(322, 0xf0166a060701000000e10600),
(322, 0xf0166b060701000000182800),
(322, 0xf21669060701000000192800),
(322, 0xf2166a060701000000192800),
(323, 0xe4166f060701000000da0600),
(323, 0xe316720607010000001c2800),
(323, 0xe41670060701000000db0600),
(323, 0xe516730607010000001f2800),
(323, 0xe71671060701000000222800),
(323, 0xe51675060701000000461900),
(325, 0xf016700606010000001c2800),
(325, 0xf416720606010000001f2800),
(325, 0xf51670060601000000192800),
(325, 0xf416720607010000001f2800),
(325, 0xf516700607010000001b2800),
(325, 0xf31675060701000000222800),
(325, 0xf41675060601000000e00600),
(325, 0xf41676060601000000e00600),
(325, 0xf51675060601000000e10600),
(325, 0xf51676060601000000e10600),
(325, 0xf71674060601000000192800),
(325, 0xf71676060601000000192800),
(325, 0xf71675060701000000192800),
(326, 0x8c178e070601000000dc0600),
(326, 0x8d178d070601000000341900),
(326, 0x8d178e070601000000dd0600),
(326, 0x90178e070601000000de0600),
(326, 0x90178f070601000000df0600),
(326, 0x91178f070601000000251900),
(326, 0x8d1793070601000000381800),
(326, 0x8f1793070601000000341900),
(326, 0x911791070601000000251900),
(327, 0x8f1504060701000000e00600),
(327, 0x901504060701000000e10600),
(327, 0x921505060701000000c30400),
(328, 0x8f1507060701000000e00600),
(328, 0x901507060701000000e10600),
(328, 0x921508060701000000c30400),
(329, 0x8f150b060601000000c30400),
(329, 0x8c150b060701000000251900),
(329, 0x8c150e060701000000251900),
(329, 0x92150b060601000000c30400),
(329, 0x95150b060601000000251900),
(329, 0x90150e060601000000e00600),
(329, 0x91150e060601000000e10600),
(329, 0x93150e060601000000e00600),
(329, 0x93150f060601000000241900),
(329, 0x92150c060701000000c30400),
(329, 0x94150e060601000000e10600),
(329, 0x95150e060601000000251900),
(330, 0x8f1510060701000000e00600),
(330, 0x901510060701000000e10600),
(330, 0x921511060701000000c30400),
(331, 0x8f1513060701000000e00600),
(331, 0x901513060701000000e10600),
(331, 0x921514060701000000c30400),
(332, 0x9e1502060701000000da0600),
(332, 0x9e1503060701000000db0600),
(332, 0x9b15070606010000001b2800),
(332, 0x9b15060607010000001b2800),
(332, 0x9b1507060701000000222800),
(332, 0x9f15040606010000001a2800),
(332, 0x9f1504060701000000242800),
(332, 0x9b15090606010000001b2800),
(332, 0x9e150a060601000000242800),
(332, 0xa01502060701000000da0600),
(332, 0xa01503060701000000db0600),
(332, 0xa01504060601000000242800),
(332, 0xa015090606010000001b2800),
(333, 0x9b150a060701000000222800),
(333, 0x9b150b0607010000001b2800),
(333, 0x9c150b060701000000e00600),
(333, 0x9d150b060701000000e10600),
(333, 0x9e150c0607010000001a2800),
(334, 0xa6150f0607010000001a2800),
(334, 0x9d1513060701000000030600),
(334, 0xa31511060601000000192800),
(334, 0xa31513060601000000192800),
(334, 0xa31513060701000000222800),
(334, 0xa71512060601000000242800),
(334, 0xa71512060701000000242800),
(334, 0xa81513060601000000192800),
(334, 0xa31515060601000000192800),
(334, 0xa315150607010000001b2800),
(334, 0xa41514060601000000e00600),
(334, 0xa41516060601000000e00600),
(334, 0xa51514060601000000e10600),
(334, 0xa51516060601000000e10600),
(334, 0xa615170607010000001a2800),
(335, 0x94151a060701000000c50400),
(335, 0x90151f060701000000251900),
(335, 0x91151e060701000000e00600),
(335, 0x92151e060701000000e10600),
(335, 0x94151f060701000000c30400),
(335, 0x98151d060701000000251900),
(335, 0x98151f060701000000251900),
(335, 0x911520060701000000e00600),
(335, 0x921520060701000000e10600),
(335, 0x931521060701000000241900),
(335, 0x971521060701000000241900),
(336, 0xa815fa0506010000001a2800),
(336, 0xa815fa0507010000001a2800),
(336, 0xa515fd0506010000001b2800),
(336, 0xa515fe050601000000222800),
(336, 0xa515ff0506010000001b2800),
(336, 0xa615ff050601000000e00600),
(336, 0xa715ff050601000000e10600),
(336, 0xa515fd0507010000001b2800),
(336, 0xa515ff0507010000001b2800),
(336, 0xaa15ff0506010000001b2800),
(336, 0xaa15ff0507010000001b2800),
(336, 0xa61500060601000000e00600),
(336, 0xa71500060601000000e10600),
(336, 0xa815010606010000001a2800),
(336, 0xa815010607010000001a2800),
(336, 0xaa1500060701000000222800),
(337, 0xba15f7050701000000242800),
(337, 0xb515f8050701000000da0600),
(337, 0xb515f9050701000000db0600),
(337, 0xb615f8050701000000da0600),
(337, 0xb615f9050701000000db0600),
(337, 0xb615fb0507010000001a2800),
(337, 0xb715fa0507010000001e2800),
(337, 0xb715fd050701000000222800),
(337, 0xba15fc0506010000001f2800),
(337, 0xbb15fc0506010000001a2800),
(337, 0xb915fe0507010000001a2800),
(337, 0xbc15fe0507010000001a2800),
(338, 0xc415fe0507010000001b2800),
(338, 0xc415ff0507010000001b2800),
(338, 0xbc15020607010000001b2800),
(338, 0xbd1501060701000000e00600),
(338, 0xbd1503060701000000e00600),
(338, 0xbe1501060701000000e10600),
(338, 0xbe1503060701000000e10600),
(338, 0xbc1505060701000000232800),
(338, 0xbc15060607010000001b2800),
(338, 0xbe15080607010000001a2800),
(338, 0xc01503060701000000222800),
(338, 0xc415030607010000001b2800),
(338, 0xc415060607010000001b2800),
(338, 0xc115080607010000001a2800),
(339, 0xbf15fe0506010000001b2800),
(339, 0xc015fd050601000000da0600),
(339, 0xc015fe050601000000db0600),
(339, 0xc315fd050601000000da0600),
(339, 0xc315fe050601000000db0600),
(339, 0xbf1502060601000000222800),
(339, 0xbc15060606010000001b2800),
(339, 0xbe15080606010000001a2800),
(339, 0xc415030606010000001b2800),
(339, 0xc215040606010000001f2800),
(339, 0xc415060606010000001b2800),
(339, 0xc115080606010000001a2800),
(340, 0xa415070606010000001b2800),
(340, 0xa51505060601000000da0600),
(340, 0xa51506060601000000db0600),
(340, 0xa71505060601000000da0600),
(340, 0xa71506060601000000db0600),
(340, 0xa415060607010000001b2800),
(340, 0xab15060606010000001b2800),
(340, 0xab1507060601000000222800);
INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(340, 0xab1507060701000000222800),
(340, 0xa2150b0606010000001b2800),
(340, 0xa61509060601000000242800),
(340, 0xa7150b060601000000222800),
(340, 0xa61509060701000000242800),
(340, 0xab15080606010000001b2800),
(340, 0xab15080607010000001b2800),
(340, 0xa2150c0606010000001b2800),
(340, 0xa2150c0607010000001b2800),
(340, 0xa5150d0606010000001a2800),
(340, 0xa7150c0606010000001b2800),
(340, 0xa5150d0607010000001a2800),
(341, 0xa8151a060701000000da0600),
(341, 0xa8151b060701000000db0600),
(341, 0xaa151a060701000000da0600),
(341, 0xaa151b060701000000db0600),
(341, 0xa91520060701000000182800),
(341, 0xaa1520060701000000242800),
(342, 0xac151a060701000000da0600),
(342, 0xac151b060701000000db0600),
(342, 0xae151a060701000000da0600),
(342, 0xae151b060701000000db0600),
(342, 0xaf151c0607010000001b2800),
(342, 0xaf151e0607010000001b2800),
(342, 0xad1520060701000000242800),
(343, 0xbc151b060701000000242800),
(343, 0xb8151e0607010000001b2800),
(343, 0xb9151e060701000000e00600),
(343, 0xba151e060701000000e10600),
(343, 0xb91520060701000000e00600),
(343, 0xba1520060701000000e10600),
(343, 0xbe1520060701000000192800),
(344, 0xc2150e060701000000da0600),
(344, 0xc2150f060701000000db0600),
(344, 0xc21511060701000000242800),
(345, 0xc6150e060701000000da0600),
(345, 0xc6150f060701000000db0600),
(345, 0xc7150f060701000000192800),
(345, 0xc51511060701000000242800),
(346, 0xc21513060701000000242800),
(346, 0xc21515060701000000da0600),
(346, 0xc21516060701000000db0600),
(346, 0xc21517060701000000182800),
(347, 0xc51513060701000000242800),
(347, 0xc51516060701000000e00600),
(347, 0xc51517060701000000182800),
(347, 0xc61516060701000000e10600),
(347, 0xc71515060701000000192800),
(348, 0xc4150e060601000000da0600),
(348, 0xc4150f060601000000db0600),
(348, 0xc5150d060601000000182800),
(348, 0xc6150e060601000000da0600),
(348, 0xc6150f060601000000db0600),
(348, 0xc7150f060601000000192800),
(348, 0xc11510060601000000222800),
(348, 0xc71511060601000000192800),
(349, 0xc41513060601000000da0600),
(349, 0xc61513060601000000da0600),
(349, 0xc11515060601000000222800),
(349, 0xc31517060601000000182800),
(349, 0xc41514060601000000db0600),
(349, 0xc51517060601000000182800),
(349, 0xc61514060601000000db0600),
(349, 0xc71514060601000000192800),
(349, 0xc71516060601000000192800),
(350, 0xac150b060701000000241900),
(350, 0xab150c060701000000da0600),
(350, 0xab150d060701000000db0600),
(350, 0xad150f060701000000c50400),
(351, 0xaf150c060701000000da0600),
(351, 0xaf150d060701000000db0600),
(351, 0xb0150b060701000000241900),
(351, 0xb1150f060701000000c50400),
(352, 0xb6150b060701000000241900),
(352, 0xb5150c060701000000da0600),
(352, 0xb5150d060701000000db0600),
(352, 0xb6150f060701000000c50400),
(352, 0xb8150e060701000000271900),
(353, 0xad1512060701000000c50400),
(353, 0xab1514060701000000da0600),
(353, 0xab1515060701000000db0600),
(353, 0xac1516060701000000241900),
(353, 0xad1516060701000000241900),
(354, 0xaf1514060701000000da0600),
(354, 0xaf1515060701000000db0600),
(354, 0xb11512060701000000c50400),
(355, 0xb61512060701000000c50400),
(355, 0xb31514060701000000da0600),
(355, 0xb31515060701000000db0600),
(355, 0xb41514060701000000da0600),
(355, 0xb41515060701000000db0600),
(355, 0xb51516060701000000241900),
(355, 0xb61516060701000000261900),
(355, 0xb81514060701000000271900),
(356, 0xac150b060601000000241900),
(356, 0xab150c060601000000da0600),
(356, 0xab150d060601000000db0600),
(356, 0xad150f060601000000c50400),
(357, 0xaf150c060601000000da0600),
(357, 0xaf150d060601000000db0600),
(357, 0xb0150b060601000000241900),
(357, 0xb1150f060601000000c50400),
(358, 0xb5150b060601000000241900),
(358, 0xb3150c060601000000da0600),
(358, 0xb3150d060601000000db0600),
(358, 0xb4150f060601000000c50400),
(358, 0xb7150c060601000000da0600),
(358, 0xb7150d060601000000db0600),
(358, 0xb8150e060601000000271900),
(359, 0xad1512060601000000c50400),
(359, 0xab1514060601000000da0600),
(359, 0xab1515060601000000db0600),
(359, 0xac1516060601000000241900),
(359, 0xad1516060601000000241900),
(360, 0xaf1514060601000000da0600),
(360, 0xaf1515060601000000db0600),
(360, 0xb11512060601000000c50400),
(360, 0xb01516060601000000261900),
(360, 0xb11516060601000000c50400),
(361, 0xb41512060601000000c50400),
(361, 0xb51516060601000000241900),
(361, 0xb61514060601000000da0600),
(361, 0xb61515060601000000db0600),
(361, 0xb61516060601000000241900),
(361, 0xb71514060601000000da0600),
(361, 0xb71515060601000000db0600),
(361, 0xb81514060601000000271900),
(362, 0xad15eb050701000000241900),
(362, 0xae15ee050701000000c30400),
(362, 0xb015ed050701000000da0600),
(362, 0xb015ee050701000000db0600),
(362, 0xb115ed050701000000da0600),
(362, 0xb115ee050701000000db0600),
(362, 0xb215ee050701000000251900),
(362, 0xb215ef050701000000251900),
(362, 0xaa15f0050701000000251900),
(362, 0xac15f3050701000000241900),
(362, 0xae15f3050701000000c50400),
(363, 0xbf15e5050701000000251900),
(363, 0xbf15e7050701000000251900),
(363, 0xc215e2050701000000261900),
(363, 0xc215e3050701000000da0600),
(363, 0xc415e3050701000000da0600),
(363, 0xc215e4050701000000db0600),
(363, 0xc315e5050701000000be0400),
(363, 0xc415e4050701000000db0600),
(363, 0xc215ea050701000000c50400),
(363, 0xc315ea050701000000261900),
(364, 0xc815e3050701000000e00600),
(364, 0xc915e2050701000000241900),
(364, 0xc915e3050701000000e10600),
(364, 0xcd15e2050701000000241900),
(364, 0xc815e4050701000000e00600),
(364, 0xc915e4050701000000e10600),
(364, 0xcb15e4050701000000bb0400),
(364, 0xce15e5050701000000251900),
(364, 0xce15e7050701000000251900),
(364, 0xca15e9050701000000241900),
(364, 0xcb15e9050701000000c50400),
(364, 0xcc15e9050701000000241900),
(365, 0xbc15f3050701000000da0600),
(365, 0xbb15f4050701000000192800),
(365, 0xbc15f4050701000000db0600),
(365, 0xbf15f5050701000000222800),
(366, 0xc215f6050701000000242800),
(366, 0xc015fa050701000000e00600),
(366, 0xc115fa050701000000e10600),
(366, 0xc215fb050701000000182800),
(367, 0xc415f4050701000000222800),
(367, 0xc715f5050701000000242800),
(367, 0xc915f4050701000000192800),
(367, 0xc515f9050701000000da0600),
(367, 0xc515fa050701000000db0600),
(367, 0xc615f9050701000000da0600),
(367, 0xc615fa050701000000db0600),
(367, 0xc715fb050701000000182800),
(367, 0xc915f8050701000000192800),
(368, 0xbc15f3050601000000da0600),
(368, 0xbb15f4050601000000192800),
(368, 0xbc15f4050601000000db0600),
(368, 0xbf15f4050601000000222800),
(369, 0xc215f5050601000000242800),
(369, 0xc415fa050601000000222800),
(369, 0xc715f9050601000000e00600),
(369, 0xc715fb050601000000182800),
(369, 0xc815f9050601000000e10600),
(369, 0xc915fa050601000000192800),
(370, 0xc715f2050601000000182800),
(370, 0xc415f4050601000000222800),
(370, 0xc715f5050601000000242800),
(370, 0xc715f7050601000000e00600),
(370, 0xc815f7050601000000e10600),
(370, 0xc915f4050601000000192800),
(370, 0xc915f7050601000000192800),
(371, 0xd215ea0506010000001b2800),
(371, 0xd215ea0507010000001b2800),
(371, 0xd515e80506010000001a2800),
(371, 0xd615e80506010000001a2800),
(371, 0xd715ea050601000000222800),
(371, 0xd515e80507010000001a2800),
(371, 0xd615e80507010000001a2800),
(371, 0xd915e80506010000001a2800),
(371, 0xd915eb050601000000242800),
(371, 0xda15e80506010000001a2800),
(371, 0xd915e80507010000001a2800),
(371, 0xda15e80507010000001a2800),
(371, 0xdc15eb0507010000001b2800),
(371, 0xd215ee0506010000001b2800),
(371, 0xd215ec050701000000222800),
(371, 0xd215ed0507010000001b2800),
(371, 0xd815ed050601000000da0600),
(371, 0xd815ee050601000000db0600),
(371, 0xdb15ed050601000000da0600),
(371, 0xdb15ee050601000000db0600),
(371, 0xdc15ee0506010000001b2800),
(371, 0xdc15ec050701000000222800),
(371, 0xdc15ee0507010000001b2800),
(372, 0xd215f10506010000001b2800),
(372, 0xd215f2050701000000222800),
(372, 0xd215f30507010000001b2800),
(372, 0xd715f1050601000000222800),
(372, 0xd815f3050601000000da0600),
(372, 0xd915f2050601000000242800),
(372, 0xdb15f3050601000000da0600),
(372, 0xdc15f10506010000001b2800),
(372, 0xdc15f10507010000001b2800),
(372, 0xdc15f3050701000000222800),
(372, 0xd215f40506010000001b2800),
(372, 0xd815f4050601000000db0600),
(372, 0xdb15f4050601000000db0600),
(372, 0xdc15f40506010000001b2800),
(372, 0xdc15f40507010000001b2800),
(373, 0xd215f8050701000000222800),
(373, 0xd215f90507010000001b2800),
(373, 0xdc15f8050701000000222800),
(373, 0xdc15f90507010000001b2800),
(374, 0xca15ff050701000000da0600),
(374, 0xcc15fe050701000000241900),
(374, 0xc91500060701000000251900),
(374, 0xca1500060701000000db0600),
(374, 0xcc1502060701000000c50400),
(375, 0xd115fe050701000000241900),
(375, 0xd215ff050701000000da0600),
(375, 0xd11502060701000000c50400),
(375, 0xd21500060701000000db0600),
(375, 0xd31500060701000000251900),
(376, 0xcc1505060701000000c50400),
(376, 0xc91508060701000000251900),
(376, 0xca1508060701000000e00600),
(376, 0xcb1508060701000000e10600),
(376, 0xcc1509060701000000241900),
(377, 0xcf1508060701000000e00600),
(377, 0xd11505060701000000c50400),
(377, 0xd01508060701000000e10600),
(377, 0xd11509060701000000241900),
(377, 0xd31508060701000000251900),
(378, 0xc91506060601000000251900),
(378, 0xcd1504060601000000c50400),
(378, 0xca1508060601000000e00600),
(378, 0xcb1508060601000000e10600),
(378, 0xcc1509060601000000241900),
(379, 0xcf1503060601000000c30400),
(379, 0xcf1506060601000000e00600),
(379, 0xcf1508060601000000e00600),
(379, 0xd11501060601000000c50400),
(379, 0xd21501060601000000241900),
(379, 0xd01506060601000000e10600),
(379, 0xd31505060601000000251900),
(379, 0xd31506060601000000251900),
(379, 0xd01508060601000000e10600),
(379, 0xd01509060601000000241900),
(379, 0xd21509060601000000241900),
(380, 0x2b1a3e050701000000804d00),
(380, 0x2d1a3d050701000000e00600),
(380, 0x2e1a3d050701000000e10600),
(380, 0x301a41050701000000894d00),
(381, 0x391a3d050701000000894d00),
(381, 0x391a3f050701000000e00600),
(381, 0x3a1a3f050701000000e10600),
(381, 0x341a41050701000000894d00),
(382, 0x2b1a46050701000000804d00),
(382, 0x2d1a47050701000000e00600),
(382, 0x2e1a47050701000000e10600),
(382, 0x301a44050701000000894d00),
(383, 0x341a44050701000000894d00),
(383, 0x371a47050701000000e00600),
(383, 0x381a47050701000000e10600),
(383, 0x3a1a46050701000000804d00),
(384, 0x161a35050601000000834d00),
(384, 0x181a340506010000008c4d00),
(384, 0x1a1a35050701000000894d00),
(384, 0x151a38050601000000e00600),
(384, 0x161a38050601000000e10600),
(385, 0x191a2b0506010000008c4d00),
(385, 0x161a2f050601000000e00600),
(385, 0x171a2c050601000000834d00),
(385, 0x171a2f050601000000e10600),
(385, 0x1b1a2d050701000000894d00),
(386, 0x241a2b050701000000894d00),
(386, 0x251a2d050601000000e00600),
(386, 0x261a2d050601000000e10600),
(387, 0x1b1a22050601000000da0600),
(387, 0x1b1a23050601000000db0600),
(387, 0x1c1a23050701000000894d00),
(388, 0x1c1a1d050601000000da0600),
(388, 0x1c1a1e050601000000db0600),
(388, 0x1d1a1f050701000000894d00),
(389, 0x231a1f050701000000894d00),
(389, 0x261a22050601000000804d00),
(389, 0x261a22050701000000804d00),
(389, 0x251a24050701000000e00600),
(389, 0x261a24050701000000e10600),
(390, 0x471a2e050701000000da0600),
(390, 0x471a2f050701000000db0600),
(390, 0x481a30050701000000804d00),
(390, 0x4a1a32050701000000894d00),
(390, 0x4d1a32050701000000894d00),
(391, 0x471a33050601000000e00600),
(391, 0x481a33050601000000e10600),
(391, 0x4d1a32050601000000894d00),
(392, 0x471a33050501000000e00600),
(392, 0x481a33050501000000e10600),
(392, 0x4d1a32050501000000894d00),
(393, 0x561a32050601000000804d00),
(393, 0x561a30050701000000804d00),
(393, 0x541a37050601000000e00600),
(393, 0x551a37050601000000e10600),
(393, 0x551a36050701000000804d00),
(394, 0x581a2d0507010000008a4d00),
(394, 0x5c1a31050701000000e00600),
(394, 0x5d1a31050701000000e10600),
(395, 0x571a23050601000000894d00),
(395, 0x551a25050601000000804d00),
(395, 0x551a25050701000000804d00),
(395, 0x551a27050701000000804d00),
(395, 0x571a24050701000000894d00),
(395, 0x581a26050601000000e00600),
(395, 0x591a26050601000000e10600),
(395, 0x581a28050601000000e00600),
(395, 0x591a28050601000000e10600),
(396, 0x4a1a23050701000000894d00),
(396, 0x471a26050701000000da0600),
(396, 0x471a27050701000000db0600),
(396, 0x481a25050701000000804d00),
(396, 0x4d1a24050701000000894d00),
(397, 0x471a22050601000000e00600),
(397, 0x481a22050601000000e10600),
(397, 0x4d1a23050601000000894d00),
(398, 0x4d1a23050501000000894d00),
(398, 0x471a27050501000000e00600),
(398, 0x481a27050501000000e10600),
(400, 0x3a1a1b050701000000da0600),
(400, 0x391a1e050701000000894d00),
(400, 0x3a1a1c050701000000db0600),
(400, 0x3b1a21050701000000894d00),
(401, 0x3b1a1e050601000000894d00),
(401, 0x381a22050601000000e00600),
(401, 0x391a22050601000000e10600),
(402, 0x481a1c050701000000804d00),
(402, 0x4d1a1c050701000000804d00),
(403, 0x4a1a1a050601000000894d00),
(403, 0x4b1a1d050601000000e00600),
(403, 0x4b1a1f050601000000e00600),
(403, 0x4c1a1d050601000000e10600),
(403, 0x4c1a1f050601000000e10600),
(403, 0x4d1a1c050601000000804d00),
(404, 0x3a1a15050601000000e00600),
(404, 0x3a1a17050601000000e00600),
(404, 0x3b1a15050601000000e10600),
(404, 0x3b1a17050601000000e10600),
(404, 0x3d1a14050701000000894d00),
(404, 0x3d1a150507010000008a4d00),
(405, 0x471a130506010000008c4d00),
(405, 0x451a130507010000008a4d00),
(405, 0x481a16050601000000e00600),
(405, 0x491a16050601000000e10600),
(405, 0x4b1a16050601000000e00600),
(405, 0x4c1a16050601000000e10600),
(406, 0x251a02050701000000894d00),
(406, 0x2b1a02050701000000894d00),
(406, 0x261a05050701000000da0600),
(406, 0x261a06050701000000db0600),
(406, 0x271a04050701000000804d00),
(406, 0x281a05050701000000da0600),
(406, 0x281a06050701000000db0600),
(407, 0x2e1a02050701000000894d00),
(407, 0x311a05050701000000da0600),
(407, 0x311a06050701000000db0600),
(407, 0x321a04050701000000804d00),
(407, 0x331a05050701000000da0600),
(407, 0x331a06050701000000db0600),
(408, 0x251a02050601000000894d00),
(408, 0x2b1a02050601000000894d00),
(408, 0x261a05050601000000da0600),
(408, 0x261a06050601000000db0600),
(408, 0x271a04050601000000804d00),
(408, 0x281a05050601000000da0600),
(408, 0x281a06050601000000db0600),
(409, 0x2e1a020506010000008b4d00),
(409, 0x311a05050601000000da0600),
(409, 0x311a06050601000000db0600),
(409, 0x321a04050601000000824d00),
(409, 0x331a05050601000000da0600),
(409, 0x331a06050601000000db0600),
(410, 0x281a12050501000000e00600),
(410, 0x281a13050501000000e00600),
(410, 0x291a12050501000000e10600),
(410, 0x291a13050501000000e10600),
(410, 0x2d1a12050701000000894d00),
(411, 0x251a11050601000000e00600),
(411, 0x261a11050601000000e10600),
(411, 0x261a15050601000000804d00),
(411, 0x261a15050701000000804d00),
(411, 0x271a18050701000000894d00),
(412, 0x2f1a1d050701000000804d00),
(412, 0x2d1a22050601000000e00600),
(412, 0x2e1a22050601000000e10600),
(412, 0x2d1a22050701000000e00600),
(412, 0x2e1a22050701000000e10600),
(412, 0x301a21050601000000da0600),
(412, 0x301a22050601000000db0600),
(412, 0x301a21050701000000da0600),
(412, 0x301a22050701000000db0600),
(413, 0x341a1d050701000000804d00),
(413, 0x321a22050601000000e00600),
(413, 0x331a22050601000000e10600),
(413, 0x321a22050701000000e00600),
(413, 0x331a22050701000000e10600),
(413, 0x351a21050601000000da0600),
(413, 0x351a22050601000000db0600),
(413, 0x351a21050701000000da0600),
(413, 0x351a22050701000000db0600),
(414, 0x331a12050701000000894d00),
(414, 0x341a12050501000000e00600),
(414, 0x341a13050501000000e00600),
(414, 0x351a12050501000000e10600),
(414, 0x351a13050501000000e10600),
(415, 0x391a07050601000000e00600),
(415, 0x3a1a07050601000000e10600),
(415, 0x3c1a050506010000008c4d00),
(415, 0x3b1a08050701000000814d00),
(416, 0x741b25030601000000da0600),
(416, 0x741b26030601000000db0600),
(416, 0x751b240306010000003c1900),
(416, 0x771b26030601000000db0d00),
(416, 0x771b270306010000003b1900),
(417, 0x711b2a0305010000003d1900),
(417, 0x711b2b0305010000003d1900),
(417, 0x751b29030501000000da0600),
(417, 0x751b2a030501000000db0600),
(417, 0x761b29030501000000da0600),
(417, 0x761b2a030501000000db0600),
(417, 0x771b2a0305010000003d1900),
(417, 0x771b2a030601000000db0d00),
(417, 0x771b2b0306010000003b1900),
(418, 0x741b2d030601000000da0600),
(418, 0x741b2e030601000000db0600),
(418, 0x771b2e030601000000db0d00),
(418, 0x771b2f0306010000003b1900),
(419, 0x7d1b26030601000000db0d00),
(419, 0x7f1b240306010000003c1900),
(419, 0x801b25030601000000da0600),
(419, 0x801b26030601000000db0600),
(419, 0x811b260306010000003b1900),
(420, 0x7d1b2a030601000000db0d00),
(420, 0x7f1b2c0306010000003c1900),
(420, 0x801b29030601000000da0600),
(420, 0x801b2a030601000000db0600),
(422, 0x551b0f0306010000003d1900),
(422, 0x561b0e030601000000da0600),
(422, 0x561b0f030601000000db0600),
(422, 0x581b0d030601000000d20d00),
(422, 0x5a1b0f0306010000003d1900),
(422, 0x551b100306010000003d1900),
(422, 0x581b110306010000003c1900),
(422, 0x5a1b100306010000003d1900),
(423, 0x4e1b0a0305010000003c1900),
(423, 0x4e1b0a030601000000d20d00),
(423, 0x4f1b0a0306010000003a1900),
(423, 0x4c1b0c0305010000003d1900),
(423, 0x4c1b0e0305010000003d1900),
(423, 0x501b0e030501000000d80d00),
(423, 0x511b0d030601000000da0600),
(423, 0x511b0e030601000000db0600),
(423, 0x521b0e0306010000003d1900),
(424, 0x431bfc020601000000da0600),
(424, 0x431bfd020601000000db0600),
(424, 0x451bfe020501000000cf0d00),
(424, 0x451bfc020601000000da0600),
(424, 0x451bfd020601000000db0600),
(424, 0x461b01030601000000d80d00),
(424, 0x481b02030501000000cf0d00),
(424, 0x4a1b000306010000003d1900),
(424, 0x4a1b01030601000000db0d00),
(425, 0x471bf2020501000000e00600),
(425, 0x481bf2020501000000e10600),
(425, 0x491bf10205010000009e1400),
(425, 0x4a1bf3020501000000a11400),
(425, 0x481bf0020601000000491900),
(425, 0x4a1bf10206010000009e1400),
(425, 0x471bf4020501000000e00600),
(425, 0x441bf4020601000000491900),
(425, 0x481bf4020501000000e10600),
(425, 0x481bf5020501000000481900),
(425, 0x481bf6020601000000a61400),
(426, 0x6d1b1f0306010000003d1900),
(426, 0x6e1b1e030601000000da0600),
(426, 0x6e1b1f030601000000db0600),
(426, 0x701b1d030601000000d20d00),
(426, 0x711b1d0306010000003c1900),
(426, 0x731b1f0306010000003d1900),
(426, 0x6d1b200306010000003d1900),
(426, 0x6f1b210306010000003a1900),
(426, 0x721b210306010000003a1900),
(426, 0x731b200306010000003d1900),
(426, 0xc71b1f0306010000003d1900),
(426, 0xc81b1e030601000000da0600),
(426, 0xc81b1f030601000000db0600),
(426, 0xca1b1d030601000000d20d00),
(426, 0xcb1b1d0306010000003c1900),
(426, 0xcd1b1f0306010000003d1900),
(426, 0xca1b2f030601000000d20d00),
(426, 0xcb1b2f0306010000003c1900),
(426, 0xc71b310306010000003d1900),
(426, 0xc81b30030601000000da0600),
(426, 0xc81b31030601000000db0600),
(426, 0xcd1b310306010000003d1900),
(427, 0x701b0f0305010000003c1900),
(427, 0x701b0f0306010000003c1900),
(427, 0x6f1b13030501000000cf0d00),
(427, 0x6d1b14030501000000da0600),
(427, 0x6d1b15030501000000db0600),
(427, 0x701b13030601000000cf0d00),
(427, 0x701b17030601000000d20d00),
(427, 0x711b170306010000003c1900),
(427, 0x731b150306010000003d1900),
(427, 0x731b160306010000003d1900),
(427, 0xca1b17030601000000d20d00),
(427, 0xcb1b170306010000003c1900),
(427, 0xcd1b150306010000003d1900),
(427, 0xcd1b160306010000003d1900),
(427, 0xcd1b270306010000003d1900),
(427, 0xca1b29030601000000d20d00),
(427, 0xcb1b290306010000003c1900),
(427, 0xcd1b280306010000003d1900),
(428, 0x621b1e0306010000003b1900),
(428, 0x621b1f0306010000003b1900),
(428, 0x661b1c030601000000d20d00),
(428, 0x671b1c0306010000003c1900),
(428, 0x691b1e0306010000003b1900),
(428, 0x691b1f0306010000003b1900),
(428, 0x631b21030601000000da0600),
(428, 0x631b22030601000000db0600),
(428, 0x641b20030501000000cf0d00),
(428, 0x641b20030601000000cf0d00),
(428, 0x641b230306010000003c1900),
(428, 0x671b200306010000003c1900),
(428, 0xbc1b1e0306010000003b1900),
(428, 0xbc1b1f0306010000003b1900),
(428, 0xbc1b300306010000003b1900),
(428, 0xbc1b310306010000003b1900),
(428, 0xc01b1c030601000000d20d00),
(428, 0xc11b1c0306010000003c1900),
(428, 0xc31b1e0306010000003b1900),
(428, 0xc31b1f0306010000003b1900),
(428, 0xc01b2e030601000000d20d00),
(428, 0xc11b2e0306010000003c1900),
(428, 0xc31b300306010000003b1900),
(428, 0xc31b310306010000003b1900),
(429, 0x621b0f0306010000003d1900),
(429, 0x641b0d0306010000003c1900),
(429, 0x651b0e030601000000da0600),
(429, 0x651b0f030601000000db0600),
(429, 0x621b130306010000003d1900),
(429, 0x661b110305010000003d1900),
(429, 0x641b11030601000000cf0d00),
(429, 0x681b110306010000003c1900),
(429, 0x681b15030601000000d20d00),
(429, 0x691b150306010000003c1900),
(429, 0xc21b15030601000000d20d00),
(429, 0xc31b150306010000003c1900),
(429, 0xc21b27030601000000d20d00),
(429, 0xc31b270306010000003c1900),
(430, 0x8f1bf5020501000000db0d00),
(430, 0x931bf5020501000000d80d00),
(430, 0x951bf4020501000000da0600),
(430, 0x951bf5020501000000db0600),
(430, 0x961bf50205010000003d1900),
(430, 0x901bf8020501000000e00600),
(430, 0x911bf8020501000000e10600),
(430, 0x911bf90205010000003a1900),
(431, 0x961be70205010000003c1900),
(431, 0x981be70205010000003c1900),
(431, 0x931be90205010000003c1900),
(431, 0x941beb020501000000d80d00),
(431, 0x991beb020501000000d80d00),
(431, 0x931bed020501000000d20d00),
(431, 0x951bec020401000000e00600),
(431, 0x961bec020401000000e10600),
(431, 0x961bed020501000000cf0d00),
(431, 0x971bee020501000000da0600),
(431, 0x971bef020501000000db0600),
(431, 0x981bef0205010000003d1900),
(431, 0x971bf00205010000003c1900),
(432, 0x8a1be70204010000003c1900),
(432, 0x891be70205010000003c1900),
(432, 0x8b1be70205010000003c1900),
(432, 0x871be90204010000003d1900),
(432, 0x871beb020501000000d80d00),
(432, 0x891beb0204010000003c1900),
(432, 0x8a1be8020401000000da0600),
(432, 0x8a1be9020401000000db0600),
(432, 0x8a1beb0204010000003c1900),
(432, 0x8b1be8020401000000da0600),
(432, 0x8b1be9020401000000db0600),
(432, 0x8c1be90204010000003d1900),
(432, 0x8c1beb020501000000d80d00),
(432, 0x8f1beb0205010000003d1900),
(432, 0x8a1bec020501000000d20d00),
(433, 0x851bf50205010000003d1900),
(433, 0x861bf4020501000000da0600),
(433, 0x861bf5020501000000db0600),
(433, 0x871bf7020501000000cf0d00),
(433, 0x891bf5020501000000db0d00),
(434, 0x741bef020501000000da0600),
(434, 0x761bef020501000000da0600),
(434, 0x741bf0020501000000db0600),
(434, 0x761bf0020501000000db0600),
(434, 0x771bf2020501000000d80d00),
(434, 0x791bf10205010000003c1900),
(434, 0x7a1bf1020501000000d20d00),
(434, 0x7c1bf30205010000003d1900),
(434, 0x791bf50205010000003c1900),
(435, 0x641be70205010000003d1900),
(435, 0x691be6020501000000da0600),
(435, 0x691be7020501000000db0600),
(435, 0x671be9020501000000d20d00),
(436, 0x5b1be70205010000003d1900),
(436, 0x5d1be50205010000003c1900),
(436, 0x5f1be50205010000003c1900),
(436, 0x5e1be9020501000000d20d00),
(436, 0x601be6020501000000da0600),
(436, 0x601be7020501000000db0600),
(437, 0x571be6020501000000481900),
(437, 0x521bea020501000000da0600),
(437, 0x521beb020501000000db0600),
(437, 0x551be90204010000009e1400),
(437, 0x551be90205010000009e1400),
(437, 0x581bea020501000000d20d00),
(437, 0x511bec020501000000491900),
(437, 0x541bed020501000000481900),
(437, 0x561bec020501000000491900),
(438, 0x711b00030601000000081400),
(438, 0x721b02030601000000da0600),
(438, 0x721b03030601000000db0600),
(439, 0x6e1bf8020601000000da0600),
(439, 0x6e1bf9020601000000db0600),
(439, 0x741bfb020601000000ff1300),
(440, 0x771bfb020601000000ff1300),
(440, 0x7c1bf8020601000000da0600),
(440, 0x7c1bf9020601000000db0600),
(441, 0x781b02030601000000da0600),
(441, 0x781b03030601000000db0600),
(441, 0x791b00030601000000081400),
(442, 0x6e1b05030501000000e00600),
(442, 0x6f1b05030501000000e10600),
(442, 0x711b00030501000000ff1300),
(443, 0x6e1bf8020501000000e00600),
(443, 0x6f1bf8020501000000e10600),
(443, 0x711bfd020501000000ff1300),
(444, 0x781bf8020501000000e00600),
(444, 0x791bf8020501000000e10600),
(444, 0x7a1bfd020501000000ff1300),
(445, 0x7a1b00030501000000ff1300),
(445, 0x781b05030501000000e00600),
(445, 0x791b05030501000000e10600),
(446, 0xd81627060601000000c50400),
(446, 0xda1625060601000000871e00),
(446, 0xda1626060601000000881e00),
(446, 0xdc1625060601000000831e00),
(446, 0xdc1626060601000000841e00),
(446, 0xdd1626060601000000251900),
(446, 0xd91629060601000000c30400),
(446, 0xdd162a060601000000251900),
(447, 0xb116e7050601000000641600),
(447, 0xb016e8050601000000de0600),
(447, 0xb016e9050601000000df0600),
(448, 0xb016e3050601000000de0600),
(448, 0xb016e4050601000000df0600),
(448, 0xb116e5050601000000641600),
(449, 0xb416e7050601000000641600),
(449, 0xb316e8050601000000de0600),
(449, 0xb316e9050601000000df0600),
(450, 0xb316e3050601000000de0600),
(450, 0xb316e4050601000000df0600),
(450, 0xb416e5050601000000641600),
(451, 0xb616e3050601000000de0600),
(451, 0xb616e4050601000000df0600),
(451, 0xb716e5050601000000641600),
(452, 0xba16e7050601000000641600),
(452, 0xb916e8050601000000de0600),
(452, 0xb916e9050601000000df0600),
(453, 0xb916e3050601000000de0600),
(453, 0xb916e4050601000000df0600),
(453, 0xba16e5050601000000641600),
(454, 0xbd16e7050601000000641600),
(454, 0xbc16e8050601000000de0600),
(454, 0xbc16e9050601000000df0600),
(455, 0xbc16e3050601000000de0600),
(455, 0xbc16e4050601000000df0600),
(455, 0xbd16e5050601000000641600),
(456, 0xb116e7050501000000641600),
(456, 0xb016e8050501000000de0600),
(456, 0xb016e9050501000000df0600),
(457, 0xb016e3050501000000de0600),
(457, 0xb016e4050501000000df0600),
(457, 0xb116e5050501000000641600),
(458, 0xb416e7050501000000641600),
(458, 0xb316e8050501000000de0600),
(458, 0xb316e9050501000000df0600),
(459, 0xb316e3050501000000de0600),
(459, 0xb316e4050501000000df0600),
(459, 0xb416e5050501000000641600),
(460, 0xb616e3050501000000de0600),
(460, 0xb616e4050501000000df0600),
(460, 0xb716e5050501000000641600),
(461, 0xb916e3050501000000de0600),
(461, 0xb916e4050501000000df0600),
(461, 0xba16e5050501000000641600),
(462, 0xba16e7050501000000641600),
(462, 0xb916e8050501000000de0600),
(462, 0xb916e9050501000000df0600),
(463, 0xbd16e7050501000000641600),
(463, 0xbc16e8050501000000de0600),
(463, 0xbc16e9050501000000df0600),
(464, 0xbc16e3050501000000de0600),
(464, 0xbc16e4050501000000df0600),
(464, 0xbd16e5050501000000641600),
(465, 0x2b1a3f050601000000e00600),
(465, 0x2c1a3d050601000000894d00),
(465, 0x2c1a3f050601000000e10600),
(465, 0x311a41050601000000894d00),
(466, 0x2b1a45050601000000e00600),
(466, 0x2c1a45050601000000e10600),
(466, 0x2c1a47050601000000894d00),
(466, 0x311a44050601000000894d00),
(467, 0x391a3d050601000000894d00),
(467, 0x391a3f050601000000e00600),
(467, 0x3a1a3f050601000000e10600),
(467, 0x341a41050601000000894d00),
(468, 0x341a44050601000000894d00),
(468, 0x391a45050601000000e00600),
(468, 0x391a47050601000000894d00),
(468, 0x3a1a45050601000000e10600),
(469, 0x251ad6040401000000da0600),
(469, 0x251ad7040401000000db0600),
(469, 0x271ad6040401000000da0600),
(469, 0x271ad7040401000000db0600),
(469, 0x241ad7040601000000671600),
(469, 0x251ad6040601000000e00600),
(469, 0x261ad6040601000000e10600),
(469, 0x291ad6040401000000da0600),
(469, 0x291ad7040401000000db0600),
(469, 0x241ad8040601000000671600),
(469, 0x251ad9040601000000e00600),
(469, 0x261ad9040601000000e10600),
(469, 0x281ad9040601000000e00600),
(469, 0x291ad9040601000000e10600),
(469, 0x291adf040701000000e00600),
(469, 0x2a1adf040701000000e10600),
(469, 0x231ae10406010000008d1500),
(469, 0x251ae10406010000008d1500),
(469, 0x281ae1040701000000671600),
(469, 0x291ae3040701000000dc0600),
(469, 0x2a1ae3040701000000dd0600),
(469, 0x2c1ae0040701000000da0600),
(469, 0x2c1ae1040701000000db0600),
(469, 0x281ae5040701000000671600),
(469, 0x281ae7040701000000671600),
(469, 0x2d1ae7040701000000dc0600),
(469, 0x2e1ae7040701000000dd0600),
(469, 0x281ae9040701000000de0600),
(469, 0x281aea040701000000df0600);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` int(11) NOT NULL,
  `link` varchar(11) NOT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `videos_categorias`
--

CREATE TABLE `videos_categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `videos_comentarios`
--

CREATE TABLE `videos_comentarios` (
  `id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `character` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `topico` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_changelog`
--

CREATE TABLE `z_changelog` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `icon_id`) VALUES
(1, 1, 1504160617, 1, 0, 2, 1, 161, 'Witam w mojej kuchni.', 'Siemanko', 0, 1504160617, 0, 0, '127.0.0.1', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_helpdesk`
--

CREATE TABLE `z_helpdesk` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `registered` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_ots_guildcomunication`
--

CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_shopguild_history_item`
--

CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `offer_category` int(11) NOT NULL,
  `offer_new` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`);

--
-- Indexes for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `account_id_3` (`account_id`),
  ADD KEY `account_id_4` (`account_id`),
  ADD KEY `account_id_5` (`account_id`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Indexes for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `live_casts`
--
ALTER TABLE `live_casts`
  ADD UNIQUE KEY `player_id_2` (`player_id`);

--
-- Indexes for table `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indexes for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `newsticker`
--
ALTER TABLE `newsticker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagsegurotransacoes`
--
ALTER TABLE `pagsegurotransacoes`
  ADD UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`),
  ADD KEY `Referencia` (`Referencia`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Indexes for table `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Indexes for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Indexes for table `sellchar`
--
ALTER TABLE `sellchar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Indexes for table `store_history`
--
ALTER TABLE `store_history`
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_categorias`
--
ALTER TABLE `videos_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_comentarios`
--
ALTER TABLE `videos_comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_changelog`
--
ALTER TABLE `z_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `z_helpdesk`
--
ALTER TABLE `z_helpdesk`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT dla tabeli `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;
--
-- AUTO_INCREMENT dla tabeli `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `newsticker`
--
ALTER TABLE `newsticker`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT dla tabeli `sellchar`
--
ALTER TABLE `sellchar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT dla tabeli `videos_categorias`
--
ALTER TABLE `videos_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `videos_comentarios`
--
ALTER TABLE `videos_comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_changelog`
--
ALTER TABLE `z_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `z_helpdesk`
--
ALTER TABLE `z_helpdesk`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT dla tabeli `z_network_box`
--
ALTER TABLE `z_network_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13382;
--
-- AUTO_INCREMENT dla tabeli `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `live_casts`
--
ALTER TABLE `live_casts`
  ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
