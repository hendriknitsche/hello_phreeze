-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.65
-- Erstellungszeit: 29. Mai 2017 um 21:22
-- Server Version: 5.5.50
-- PHP-Version: 5.5.38-1~dotdeb+7.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `phreeze.hendriknitsche.de`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(45) DEFAULT '',
  `c_last_login` timestamp NULL DEFAULT NULL,
  `c_company` varchar(45) DEFAULT '',
  `c_city` varchar(45) DEFAULT '',
  `c_level` enum('Standard','Premium') NOT NULL DEFAULT 'Standard',
  `c_error` varbinary(5) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`c_id`, `c_name`, `c_last_login`, `c_company`, `c_city`, `c_level`, `c_error`) VALUES
(1, 'Jim Jones', '2012-01-07 09:05:00', 'Workers Anonymous', 'New York', 'Premium', 'msg'),
(2, 'Frank, Jimbo', '2012-01-01 10:04:00', 'The Company', 'New York', 'Standard', ''),
(3, 'James, Erika', '2012-01-03 10:04:00', 'Worker Bee', 'Los Angeles', 'Standard', ''),
(4, 'James, Grace', '2012-01-01 10:04:00', 'The Company', 'New York', 'Premium', 'aaa'),
(5, 'Hendrik Nitsche', '2017-05-24 15:00:00', 'ITO Hub GmbH', 'Berlin', 'Standard', '');

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `customer_view`
--
CREATE TABLE IF NOT EXISTS `customer_view` (
`c_id` int(10) unsigned
,`c_name` varchar(45)
,`c_last_login` timestamp
,`c_company` varchar(45)
,`c_city` varchar(45)
,`c_level` enum('Standard','Premium')
,`c_error` varbinary(5)
);
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `favorite`
--

CREATE TABLE IF NOT EXISTS `favorite` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_purchase_id` int(11) DEFAULT NULL,
  `f_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `f_purchase_id` (`f_purchase_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `favorite`
--

INSERT INTO `favorite` (`f_id`, `f_purchase_id`, `f_note`) VALUES
(1, 1, 'favorite'),
(2, 3, 'favorite'),
(3, 3, 'favorite'),
(4, 2, 'favorite');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `no_key`
--

CREATE TABLE IF NOT EXISTS `no_key` (
  `nk_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `p_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `p_ship_date` date DEFAULT NULL,
  `p_ship_time` datetime DEFAULT NULL,
  `p_customer_id` int(10) unsigned DEFAULT NULL,
  `p_tracking_number` varchar(45) DEFAULT NULL,
  `p_description` text,
  `p_service` varchar(10) DEFAULT NULL,
  `p_destination` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `p_customer` (`p_customer_id`),
  KEY `p_service_code` (`p_service`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`p_id`, `p_ship_date`, `p_ship_time`, `p_customer_id`, `p_tracking_number`, `p_description`, `p_service`, `p_destination`) VALUES
(1, '2012-07-06', '2012-11-07 00:00:00', 4, 'CC4567890123', 'office supplies', 'overnight', 'Chicago'),
(2, '2012-01-31', '2013-12-31 18:00:00', 2, 'BB9874567890', 'materials', '2-day', 'New York'),
(3, '2012-01-10', '2012-01-07 17:23:00', 3, 'CC4567890123', 'updated description', 'ground', 'Los Angeles'),
(4, '2011-12-24', '2012-12-04 18:00:00', 3, 'AA1234567890', 'software', 'overnight', 'Chicago'),
(5, '2012-07-01', '2012-11-05 01:49:00', 3, 'BB9874567890', 'more office supplies', 'ground', 'New York'),
(6, '2012-04-29', '2012-12-11 02:24:32', 2, 'CC4567890123', 'fragile cargo', 'overnight', 'Chicago'),
(7, '2012-04-28', '2012-12-11 02:24:32', 3, 'AA1234567890', 'software', '2-day', 'New York'),
(8, '2012-04-29', '2012-11-02 16:40:00', 4, 'BB9874567890', 'office supplies', 'overnight', 'Los Angeles'),
(9, '2012-06-01', '2012-12-11 02:24:32', 3, 'AA1234567890', 'fragile cargo', 'ground', 'Chicago'),
(10, '2012-12-31', '2012-11-02 16:41:00', 2, 'CC4567890123', 'widgets', 'overnight', 'New York'),
(11, '2012-05-01', '2012-08-07 16:41:00', 3, 'BB9874567890', 'fragile cargo', '2-day', 'Chicago'),
(12, '2012-04-28', '2012-12-11 02:24:32', 4, 'AA1234567890', 'office supplies', 'overnight', 'New York'),
(13, '2012-05-29', '2012-12-11 02:24:32', 2, 'BB9874567890', 'fragile cargo', '2-day', 'Los Angeles'),
(14, '2012-04-28', '2012-12-11 02:24:32', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(15, '2012-08-01', '2012-12-11 02:24:32', 3, 'BB9874567890', 'office supplies', 'ground', 'Chicago'),
(16, '2012-05-01', '2012-12-11 02:24:32', 3, 'CC4567890123', 'office supplies', 'overnight', 'Chicago'),
(17, '2012-05-01', '2012-12-11 02:24:32', 4, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(18, '2012-05-01', '2012-12-11 02:24:32', 1, 'BB9874567890', 'office supplies', 'overnight', 'Chicago'),
(19, '2012-05-01', '2012-12-11 02:24:32', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(20, '2012-05-01', '2012-12-11 02:24:32', 3, 'BB9874567890', 'office supplies', 'overnight', 'Chicago'),
(21, '2012-06-01', '2012-12-11 02:24:32', 4, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(22, '2012-05-01', '2012-12-11 02:24:32', 1, 'BB9874567890', 'office supplies', 'overnight', 'Chicago'),
(23, '2012-05-01', '2012-12-11 02:24:32', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(24, '2012-05-01', '2012-12-11 02:24:32', 3, 'CC4567890123', 'office supplies', 'overnight', 'Chicago'),
(25, '2012-06-01', '2012-12-11 02:24:32', 4, 'AA1234567890', 'UPDATED', 'overnight', 'Chicago'),
(26, '2012-05-01', '2012-12-11 02:24:32', 1, 'CC4567890123', 'office supplies', 'overnight', 'Chicago'),
(27, '2012-05-01', '2012-12-11 02:24:32', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(28, '2012-05-01', '2012-12-11 02:24:32', 1, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(29, '2012-05-01', '2012-12-11 02:24:32', 3, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(30, '2012-05-01', '2012-12-11 02:24:32', 4, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(31, '2012-05-01', '2012-12-11 02:24:32', 1, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(32, '2012-06-01', '2012-12-11 02:24:32', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(33, '2012-05-01', '2012-12-11 02:24:32', 3, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(34, '2012-05-01', '2012-12-11 02:24:32', 4, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(35, '2012-05-01', '2012-12-11 02:24:32', 1, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(36, '2012-05-01', '2012-12-11 02:24:32', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(37, '2012-05-01', '2012-12-11 02:24:32', 3, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(38, '2012-05-01', '2012-12-11 02:24:32', 4, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(39, '2012-05-01', '2012-12-11 02:24:32', 1, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(40, '2012-05-01', '2012-12-11 02:24:32', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(41, '2012-05-01', '2012-12-11 02:24:32', 3, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(42, '2012-06-01', '2012-12-11 02:24:32', 3, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(44, '2012-05-02', '2012-11-03 17:23:00', 2, 'AA1234567890', 'office supplies', 'overnight', 'Chicago'),
(45, '2012-05-01', '2012-12-11 02:24:32', 3, 'AA1234567890', 'office supplies', 'overnight', 'Chicago');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_status_code_id` varchar(3) DEFAULT NULL,
  `p_quantity` int(11) DEFAULT '1',
  `p_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `p_status_idx` (`p_status_code_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Daten für Tabelle `purchase`
--

INSERT INTO `purchase` (`p_id`, `p_status_code_id`, `p_quantity`, `p_description`) VALUES
(1, 'B', 25, 'Purchase Order A'),
(2, 'A', 1, 'Purchase Order B'),
(3, 'C', 12, '9876kjhg'),
(4, 'O', 22, 'ds');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `s_id` varchar(10) NOT NULL,
  `s_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `service`
--

INSERT INTO `service` (`s_id`, `s_name`) VALUES
('2-day', '2-Days'),
('book', 'Book Rate'),
('ground', 'Ground2'),
('overnight', 'Overnight');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `status_code`
--

CREATE TABLE IF NOT EXISTS `status_code` (
  `sc_id` varchar(3) NOT NULL,
  `sc_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `status_code`
--

INSERT INTO `status_code` (`sc_id`, `sc_name`) VALUES
('A', 'on hold'),
('B', 'in progress'),
('C', 'Closed'),
('O', 'Open');

-- --------------------------------------------------------

--
-- Struktur des Views `customer_view`
--
DROP TABLE IF EXISTS `customer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`kuehle-srv.boerde.de` SQL SECURITY DEFINER VIEW `customer_view` AS select `customer`.`c_id` AS `c_id`,`customer`.`c_name` AS `c_name`,`customer`.`c_last_login` AS `c_last_login`,`customer`.`c_company` AS `c_company`,`customer`.`c_city` AS `c_city`,`customer`.`c_level` AS `c_level`,`customer`.`c_error` AS `c_error` from `customer`;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`f_purchase_id`) REFERENCES `purchase` (`p_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `p_customer` FOREIGN KEY (`p_customer_id`) REFERENCES `customer` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `p_service_code` FOREIGN KEY (`p_service`) REFERENCES `service` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `p_status_code` FOREIGN KEY (`p_status_code_id`) REFERENCES `status_code` (`sc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
