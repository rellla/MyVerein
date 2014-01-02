SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE DATABASE `myverein` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON myverein.* TO 'mvdbuser'@'localhost' IDENTIFIED BY 'mvdbpassword';
USE `myverein`;

CREATE TABLE IF NOT EXISTS `abteilung` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `abteilung` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

INSERT INTO `abteilung` (`id`, `abteilung`) VALUES
(1, 'Hauptverein (Fußball)'),
(2, 'Tennis'),
(3, 'Stock'),
(4, 'Gymnastik');

CREATE TABLE IF NOT EXISTS `auth_roles` (
  `id` int(11) NOT NULL,
  `role` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `auth_roles` (`id`, `role`) VALUES
(1, 'user'),
(2, 'admin');

CREATE TABLE IF NOT EXISTS `auth_user_roles` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `auth_user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2);

CREATE TABLE IF NOT EXISTS `auth_users` (
  `id` int(11) NOT NULL,
  `username` text,
  `password` text,
  `email_address` text,
  `first_name` text,
  `last_name` text,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `auth_users` (`id`, `username`, `password`, `email_address`, `first_name`, `last_name`, `active`) VALUES
(1, 'admin', '', '', '', '', 1);

CREATE TABLE IF NOT EXISTS `beitrag` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `beitrag` smallint(5) unsigned NOT NULL,
  `bemerkung` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

INSERT INTO `beitrag` (`id`, `beitrag`, `bemerkung`) VALUES
(1, 55, 'Männer (ab 18)'),
(2, 30, 'Frauen (ab 18)'),
(3, 25, 'Jugendliche (14-17)'),
(4, 15, 'Kinder (bis 13)'),
(5, 30, 'Rentner (ab 65)'),
(6, 0, 'beitragsfrei');

CREATE TABLE IF NOT EXISTS `jubilaeum` (
  `jalter` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`jalter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jubilaeum` (`jalter`) VALUES
(60),
(70),
(80),
(90),
(100);

CREATE TABLE IF NOT EXISTS `mitglied` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vorname` varchar(30) NOT NULL,
  `nachname` varchar(30) NOT NULL,
  `geburtstag` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `geschlecht` varchar(1) CHARACTER SET utf16 NOT NULL,
  `firma` tinyint(1) NOT NULL DEFAULT '0',
  `strasse` smallint(5) unsigned NOT NULL,
  `ort` tinyint(3) unsigned NOT NULL,
  `hausnummer` varchar(4) NOT NULL,
  `eintritt` date DEFAULT NULL,
  `austritt` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `bemerkung` varchar(30) DEFAULT NULL,
  `kontonr` varchar(11) DEFAULT NULL,
  `blz` varchar(11) DEFAULT NULL,
  `kreditinstitut` varchar(50) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

INSERT INTO `mitglied` (`mid`, `vorname`, `nachname`, `geburtstag`, `status`, `geschlecht`, `firma`, `strasse`, `ort`, `hausnummer`, `eintritt`, `austritt`, `email`, `telefon`, `bemerkung`, `kontonr`, `blz`, `kreditinstitut`, `lastmodified`) VALUES
(1, 'Hans', 'Wuschl', '1974-04-17', 1, 'm', 0, 15, 1, '4', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:23:56'),
(2, 'Franz', 'Beckenbauer', '1949-06-24', 1, 'm', 0, 35, 1, '3', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:23:56'),
(3, 'Jack', 'Daniels', '1947-08-02', 1, 'm', 1, 22, 1, '4', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:23:56'),
(4, 'Angela', 'Merkel', '1998-09-11', 1, 'w', 0, 21, 1, '6', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:23:56'),
(5, 'Horst', 'Seehofer', '1996-10-14', 1, 'm', 0, 35, 1, '3', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:25:50'),
(6, 'Jim', 'Beam', '2002-12-17', 1, 'm', 0, 23, 1, '2', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:23:56'),
(7, 'James', 'Bond', '1953-05-03', 1, 'm', 0, 7, 1, '12', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:23:56'),
(8, 'Hercule', 'Poirot', '1933-02-27', 1, 'm', 0, 10, 1, '14', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:23:56'),
(9, 'Angus', 'Young', '1961-04-16', 1, 'm', 1, 37, 1, '3', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:26:15'),
(10, 'Winni', 'Puh', '0000-00-00', 1, 'm', 0, 28, 1, '13', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:25:21'),
(11, 'James', 'Brown', '1960-05-22', 1, 'm', 0, 25, 1, '4', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:25:21'),
(12, 'Steffi', 'Graf', '2007-02-18', 1, 'w', 0, 19, 1, '13', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:25:21'),
(13, 'Yoko', 'Ono', '2001-09-24', 1, 'w', 0, 11, 1, '3', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, '2014-01-02 15:25:21');

CREATE TABLE IF NOT EXISTS `mitglied_abteilung` (
  `mitglied` smallint(5) unsigned NOT NULL,
  `abteilung` tinyint(3) unsigned NOT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mitglied`,`abteilung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mitglied_abteilung` (`mitglied`, `abteilung`, `lastmodified`) VALUES
(1, 1, '0000-00-00 00:00:00'),
(2, 1, '0000-00-00 00:00:00'),
(2, 2, '0000-00-00 00:00:00'),
(2, 3, '0000-00-00 00:00:00'),
(3, 1, '0000-00-00 00:00:00'),
(3, 4, '0000-00-00 00:00:00'),
(4, 1, '0000-00-00 00:00:00'),
(4, 3, '0000-00-00 00:00:00'),
(5, 1, '0000-00-00 00:00:00'),
(5, 2, '0000-00-00 00:00:00'),
(6, 1, '0000-00-00 00:00:00'),
(7, 1, '0000-00-00 00:00:00'),
(7, 2, '0000-00-00 00:00:00'),
(7, 3, '0000-00-00 00:00:00'),
(8, 1, '0000-00-00 00:00:00'),
(9, 1, '0000-00-00 00:00:00'),
(9, 2, '0000-00-00 00:00:00'),
(10, 1, '0000-00-00 00:00:00'),
(11, 1, '0000-00-00 00:00:00'),
(11, 2, '0000-00-00 00:00:00'),
(11, 3, '0000-00-00 00:00:00'),
(12, 1, '0000-00-00 00:00:00'),
(13, 1, '0000-00-00 00:00:00');

CREATE TABLE IF NOT EXISTS `mitglied_beitrag` (
  `mitglied` smallint(5) unsigned NOT NULL,
  `jahr` smallint(5) unsigned NOT NULL,
  `betrag` smallint(5) unsigned NOT NULL,
  `bezahlt` tinyint(1) NOT NULL DEFAULT '0',
  `bezahlt_am` date DEFAULT NULL,
  `zahlungsart` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mitglied`,`jahr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mitglied_beitrag` (`mitglied`, `jahr`, `betrag`, `bezahlt`, `bezahlt_am`, `zahlungsart`, `lastmodified`) VALUES
(2, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(2, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(4, 2011, 30, 1, NULL, 0, '0000-00-00 00:00:00'),
(4, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(5, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(5, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(6, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(6, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(7, 2011, 55, 0, NULL, 0, '0000-00-00 00:00:00'),
(7, 2012, 55, 0, NULL, 0, '0000-00-00 00:00:00'),
(8, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(8, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(9, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(9, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(10, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(10, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(11, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(11, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(12, 2011, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(12, 2012, 30, 0, NULL, 0, '0000-00-00 00:00:00'),
(13, 2011, 55, 0, NULL, 0, '0000-00-00 00:00:00'),
(13, 2012, 55, 0, NULL, 0, '0000-00-00 00:00:00');

CREATE TABLE IF NOT EXISTS `ort` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `plz` mediumint(5) unsigned NOT NULL,
  `ortname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

INSERT INTO `ort` (`id`, `plz`, `ortname`) VALUES
(0, 0, 'nicht zugeordnet'),
(1, 86571, 'Langenmosen'),
(2, 86529, 'Schrobenhausen');

CREATE TABLE IF NOT EXISTS `route` (
  `id` tinyint(3) unsigned NOT NULL,
  `route` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `route` (`id`, `route`) VALUES
(0, 'nicht zugeordnet'),
(1, 'Siedlung Nord-Ost'),
(2, 'Bereich Kirche'),
(3, 'Siedlung Süd-West'),
(4, 'Winkelhausen/ Malzhausen'),
(5, 'Langenmosen Ost'),
(6, 'Siedlung Süd-Ost'),
(7, 'Ortsdurchfahrt'),
(8, 'Langenmosen Mitte'),
(9, 'Firmen');

CREATE TABLE IF NOT EXISTS `status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'aktiv'),
(2, 'ausgetreten'),
(3, 'verstorben'),
(4, 'kein Mitglied'),
(7, 'ungeklärt');

CREATE TABLE IF NOT EXISTS `strasse` (
  `id` tinyint(3) unsigned NOT NULL,
  `strassenname` varchar(100) NOT NULL,
  `route` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `strasse` (`id`, `strassenname`, `route`) VALUES
(0, 'nicht zugeordnet', 0),
(1, 'Aitlingweg', 7),
(2, 'Am Anger', 5),
(3, 'Am Brucksaum', 1),
(4, 'Am Saum', 1),
(5, 'Amselweg', 6),
(6, 'Berg im Gauer Straße ', 2),
(7, 'Blumenstraße', 1),
(8, 'Burgstraße', 5),
(9, 'Columbusstraße', 6),
(10, 'Dantestraße', 6),
(11, 'Dekan-Singer-Straße', 3),
(12, 'Eichenstraße', 6),
(13, 'Finkenweg', 6),
(14, 'Gartenstraße', 6),
(15, 'Goethestraße', 3),
(16, 'Hochfeldstraße', 1),
(17, 'Kapellenweg', 6),
(18, 'Kastanienweg', 6),
(19, 'Kirchweg', 3),
(20, 'Lindenstraße', 6),
(21, 'Bürgermeister-Bader-Straße', 4),
(22, 'Ortsstraße', 4),
(23, 'Neuburger Straße', 3),
(24, 'Ostendstraße', 1),
(25, 'Pfarrer-Utz-Straße', 5),
(26, 'Pfarrstraße', 2),
(27, 'Raiffeisenstraße', 8),
(28, 'Schillerstraße', 3),
(29, 'Schrobenhausener Straße', 7),
(30, 'Schulgasse', 8),
(31, 'Sonnenstraße', 3),
(32, 'St.-Andreas-Straße', 2),
(33, 'St.-Ulrich-Straße', 3),
(34, 'Tannenweg', 1),
(35, 'Von-Mergenthal-Straße', 8),
(36, 'An der Fretz', 4),
(37, 'Flurstraße', 4),
(38, 'Römerstraße', 4),
(39, 'Sandizeller Straße', 4),
(40, 'Webergasse', 8),
(41, 'Grabmühle', 4),
(42, 'Winkelhausener Straße', 4);

CREATE TABLE IF NOT EXISTS `zahlungsart` (
  `id` tinyint(3) unsigned NOT NULL,
  `zahlungsart` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `zahlungsart` (`id`, `zahlungsart`) VALUES
(1, 'Lastschrift'),
(2, 'Barzahler'),
(3, 'Dauerauftrag'),
(4, 'Überweisung'),
(5, 'Zahlung sonstiges'),
(8, 'beitragsfrei Schiedsrichter'),
(9, 'beitragsfrei Ehrenmitglied'),
(10, 'beitragsfrei Sonstiges');


ALTER TABLE `auth_user_roles`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `auth_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
