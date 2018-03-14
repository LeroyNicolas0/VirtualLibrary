-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 14, 2018 at 12:37 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `virtual library`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonnement`
--

DROP TABLE IF EXISTS `abonnement`;
CREATE TABLE IF NOT EXISTS `abonnement` (
  `abonnement_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `forfait_id_fk` int(11) NOT NULL,
  `lecteur_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`abonnement_id`),
  KEY `fk_abonnement_lecteur` (`lecteur_id_fk`),
  KEY `fk_abonnement_forfait` (`forfait_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lien entre lecteur et forfait';

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `administrateur_id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` int(11) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`administrateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `date_parution` date NOT NULL,
  `description` text NOT NULL,
  `nombre_pages` int(11) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `langue` varchar(20) NOT NULL,
  `editeur` varchar(20) DEFAULT NULL,
  `validation` tinyint(1) DEFAULT NULL,
  `maison_disque` varchar(30) DEFAULT NULL,
  `nombre_piste` int(11) DEFAULT NULL,
  `societe_production` varchar(30) DEFAULT NULL,
  `maison_edition` varchar(30) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `public_vise` varchar(20) DEFAULT NULL,
  `type_periodique` varchar(20) DEFAULT NULL,
  `issn` varchar(13) DEFAULT NULL,
  `numero_magazine` int(11) DEFAULT NULL,
  `visible_lecteur` tinyint(1) NOT NULL,
  `type_document_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`document_id`),
  KEY `fk_document_type_doc_type_doc` (`type_document_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `emprunt_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_emprunt` date NOT NULL,
  `date_retour` date NOT NULL,
  `lecteur_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`emprunt_id`),
  KEY `fk_emprunt_lecteur` (`lecteur_id_fk`),
  KEY `fk_emprunt_document` (`document_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forfait`
--

DROP TABLE IF EXISTS `forfait`;
CREATE TABLE IF NOT EXISTS `forfait` (
  `forfait_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `tarif` float NOT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`forfait_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Un tuple pour chaque type de forfait existant';

-- --------------------------------------------------------

--
-- Table structure for table `lecteur`
--

DROP TABLE IF EXISTS `lecteur`;
CREATE TABLE IF NOT EXISTS `lecteur` (
  `lecteur_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_bibliothecaire` tinyint(1) NOT NULL DEFAULT '0',
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` int(11) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`lecteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lien_document_mot_cle`
--

DROP TABLE IF EXISTS `lien_document_mot_cle`;
CREATE TABLE IF NOT EXISTS `lien_document_mot_cle` (
  `document_id_fk` int(11) NOT NULL,
  `mot_cle_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`document_id_fk`,`mot_cle_id_fk`),
  KEY `fk_doc_keyword_mot_cle` (`mot_cle_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lien_document_participant`
--

DROP TABLE IF EXISTS `lien_document_participant`;
CREATE TABLE IF NOT EXISTS `lien_document_participant` (
  `participant_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`participant_id_fk`,`document_id_fk`),
  KEY `fk_doc_part_doc` (`document_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lien_document_pays`
--

DROP TABLE IF EXISTS `lien_document_pays`;
CREATE TABLE IF NOT EXISTS `lien_document_pays` (
  `pays_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`pays_id_fk`,`document_id_fk`),
  KEY `fk_doc_pays_document` (`document_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mot_cle`
--

DROP TABLE IF EXISTS `mot_cle`;
CREATE TABLE IF NOT EXISTS `mot_cle` (
  `mot_cle_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`mot_cle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
CREATE TABLE IF NOT EXISTS `participant` (
  `participant_id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudonyme` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `date_naissance` date NOT NULL,
  `type_particpant_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `fk_particpant_type_part_type_part` (`type_particpant_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pays_interdit`
--

DROP TABLE IF EXISTS `pays_interdit`;
CREATE TABLE IF NOT EXISTS `pays_interdit` (
  `pays_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`pays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_reservation` date NOT NULL,
  `lecteur_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_reservation_lecteur` (`lecteur_id_fk`),
  KEY `fk_reservation_document` (`document_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_document`
--

DROP TABLE IF EXISTS `type_document`;
CREATE TABLE IF NOT EXISTS `type_document` (
  `type_document_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`type_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_participant`
--

DROP TABLE IF EXISTS `type_participant`;
CREATE TABLE IF NOT EXISTS `type_participant` (
  `type_participant_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`type_participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abonnement`
--
ALTER TABLE `abonnement`
  ADD CONSTRAINT `fk_abonnement_forfait` FOREIGN KEY (`forfait_id_fk`) REFERENCES `abonnement` (`abonnement_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_abonnement_lecteur` FOREIGN KEY (`lecteur_id_fk`) REFERENCES `lecteur` (`lecteur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_document_type_doc_type_doc` FOREIGN KEY (`type_document_id_fk`) REFERENCES `type_document` (`type_document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `fk_emprunt_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprunt_lecteur` FOREIGN KEY (`lecteur_id_fk`) REFERENCES `lecteur` (`lecteur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lien_document_mot_cle`
--
ALTER TABLE `lien_document_mot_cle`
  ADD CONSTRAINT `fk_doc_keyword_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doc_keyword_mot_cle` FOREIGN KEY (`mot_cle_id_fk`) REFERENCES `mot_cle` (`mot_cle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lien_document_participant`
--
ALTER TABLE `lien_document_participant`
  ADD CONSTRAINT `fk_doc_part_doc` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doc_part_participant` FOREIGN KEY (`participant_id_fk`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lien_document_pays`
--
ALTER TABLE `lien_document_pays`
  ADD CONSTRAINT `fk_doc_pays_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doc_pays_pays` FOREIGN KEY (`pays_id_fk`) REFERENCES `pays_interdit` (`pays_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `fk_particpant_type_part_type_part` FOREIGN KEY (`type_particpant_id_fk`) REFERENCES `type_participant` (`type_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservation_lecteur` FOREIGN KEY (`lecteur_id_fk`) REFERENCES `lecteur` (`lecteur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
