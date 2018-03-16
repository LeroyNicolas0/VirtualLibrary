-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql-negorigin.alwaysdata.net
-- Généré le :  ven. 16 mars 2018 à 13:51
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `negorigin_virtuallibrary`
--
CREATE DATABASE IF NOT EXISTS `negorigin_virtuallibrary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `negorigin_virtuallibrary`;

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

CREATE TABLE `abonnement` (
  `abonnement_id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `forfait_id_fk` int(11) NOT NULL,
  `lecteur_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lien entre lecteur et forfait';

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `administrateur_id` int(11) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` int(11) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `date_inscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `document_id` int(11) NOT NULL,
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
  `type_document_id_fk` int(11) DEFAULT NULL,
  `lien_couverture` text,
  `nombre_exemplaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`document_id`, `titre`, `date_parution`, `description`, `nombre_pages`, `isbn`, `langue`, `editeur`, `validation`, `maison_disque`, `nombre_piste`, `societe_production`, `maison_edition`, `duree`, `public_vise`, `type_periodique`, `issn`, `numero_magazine`, `visible_lecteur`, `type_document_id_fk`, `lien_couverture`, `nombre_exemplaire`) VALUES
(1, 'Coeur d\'acier', '2013-01-01', 'On les appelle les Épiques. Il y a dix ans, ils ont été frappés par un éclair. Depuis ils possèdent d’incroyables pouvoirs. Mais leurs intentions ne sont pas bonnes…\r\n', 350, '9782360511037', 'francais', 'livre de poche', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'https://images-na.ssl-images-amazon.com/images/I/51ik2quOw8L._SX210_.jpg', 4);

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `emprunt_id` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour` date NOT NULL,
  `lecteur_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `forfait`
--

CREATE TABLE `forfait` (
  `forfait_id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `tarif` float NOT NULL,
  `duree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Un tuple pour chaque type de forfait existant';

--
-- Déchargement des données de la table `forfait`
--

INSERT INTO `forfait` (`forfait_id`, `nom`, `tarif`, `duree`) VALUES
(2, 'forfi', 15.5, 20),
(4, 'forfa', 14.5, 30);

-- --------------------------------------------------------

--
-- Structure de la table `lecteur`
--

CREATE TABLE `lecteur` (
  `lecteur_id` int(11) NOT NULL,
  `est_bibliothecaire` tinyint(1) NOT NULL DEFAULT '0',
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `date_inscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lecteur`
--

INSERT INTO `lecteur` (`lecteur_id`, `est_bibliothecaire`, `prenom`, `nom`, `date_naissance`, `login`, `password`, `mail`, `date_inscription`) VALUES
(1, 0, 'nicolas', 'leroy', '1996-02-13', 'atylan', 'password', 'atylan@exemple.com', '2018-03-15'),
(2, 0, 'ueygfwuyg', '3ruhruwih3r3', '2018-02-26', 'assasas', '1234567', 'h2@exmeple.com', '2018-02-26'),
(3, 0, 'huklij', 'gvhj', '2018-03-04', 'lkjgj', 'poiu', 'h@exmeple.comit', '2018-03-04'),
(4, 0, 'zert', 'azert', '2018-02-26', 'azert', 'azert', 'aze@exemple.com', '2018-02-26'),
(5, 0, 'prÃ©non', 'non', '2018-03-06', 'oui', '$2a$12$0GcnEY4anT39mS9NCDVfGuABETytm9iEUiuTDBjVOw.Y2SveG.B5y', 'mail@oui.fr', '2018-03-06'),
(6, 0, 'non', 'non', '2018-03-05', 'non', '$2a$12$J8kEplrmJ7bnuvjF2tySRe/FkxB8qkQ47M9DbSNC33nfCCXibatH6', 'oui@non.pouet', '2018-03-05'),
(7, 0, 'chat', 'chat', '2018-03-07', 'chat', 'a8d85a852aa16adf19160f5e7e7d58490737b27f9dd0eeebd63f65171261d3fd', 'sha@mail.fr', '2018-03-07'),
(8, 0, 'pppppp', 'ooooo', '2018-02-27', 'nicppp', 'b2e9f5adc07e8c10c69f9f3c63f75d5d32af6b9e734bd46c0aac542cc9a9ec55', 'aze@exe.com', '2018-02-27');

-- --------------------------------------------------------

--
-- Structure de la table `lien_document_mot_cle`
--

CREATE TABLE `lien_document_mot_cle` (
  `document_id_fk` int(11) NOT NULL,
  `mot_cle_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lien_document_mot_cle`
--

INSERT INTO `lien_document_mot_cle` (`document_id_fk`, `mot_cle_id_fk`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `lien_document_participant`
--

CREATE TABLE `lien_document_participant` (
  `participant_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lien_document_participant`
--

INSERT INTO `lien_document_participant` (`participant_id_fk`, `document_id_fk`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `lien_document_pays`
--

CREATE TABLE `lien_document_pays` (
  `pays_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mot_cle`
--

CREATE TABLE `mot_cle` (
  `mot_cle_id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mot_cle`
--

INSERT INTO `mot_cle` (`mot_cle_id`, `nom`) VALUES
(1, 'science-fiction'),
(2, 'fantastique');

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `participant_id` int(11) NOT NULL,
  `pseudonyme` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `date_naissance` date NOT NULL,
  `type_particpant_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`participant_id`, `pseudonyme`, `prenom`, `nom`, `date_naissance`, `type_particpant_id_fk`) VALUES
(1, 'SBr', 'Brandon', 'Sanderson', '1975-12-19', 1),
(4, 'poivron', 'pablo', 'leroy', '2018-02-28', 1),
(6, 'jgs', 'JeanGuy', 'Sayous', '2018-02-26', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pays_interdit`
--

CREATE TABLE `pays_interdit` (
  `pays_id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pays_interdit`
--

INSERT INTO `pays_interdit` (`pays_id`, `nom`) VALUES
(1, 'allemagne'),
(2, 'france'),
(3, 'canada');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `date_reservation` date NOT NULL,
  `lecteur_id_fk` int(11) NOT NULL,
  `document_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `SEQUENCE`
--

CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `SEQUENCE`
--

INSERT INTO `SEQUENCE` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

-- --------------------------------------------------------

--
-- Structure de la table `type_document`
--

CREATE TABLE `type_document` (
  `type_document_id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_document`
--

INSERT INTO `type_document` (`type_document_id`, `nom`) VALUES
(1, 'roman');

-- --------------------------------------------------------

--
-- Structure de la table `type_participant`
--

CREATE TABLE `type_participant` (
  `type_participant_id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_participant`
--

INSERT INTO `type_participant` (`type_participant_id`, `nom`) VALUES
(1, 'auteur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`abonnement_id`),
  ADD KEY `fk_abonnement_lecteur` (`lecteur_id_fk`),
  ADD KEY `fk_abonnement_forfait` (`forfait_id_fk`);

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`administrateur_id`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `fk_document_type_doc_type_doc` (`type_document_id_fk`);

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`emprunt_id`),
  ADD KEY `fk_emprunt_lecteur` (`lecteur_id_fk`),
  ADD KEY `fk_emprunt_document` (`document_id_fk`);

--
-- Index pour la table `forfait`
--
ALTER TABLE `forfait`
  ADD PRIMARY KEY (`forfait_id`);

--
-- Index pour la table `lecteur`
--
ALTER TABLE `lecteur`
  ADD PRIMARY KEY (`lecteur_id`);

--
-- Index pour la table `lien_document_mot_cle`
--
ALTER TABLE `lien_document_mot_cle`
  ADD PRIMARY KEY (`document_id_fk`,`mot_cle_id_fk`),
  ADD KEY `fk_doc_keyword_mot_cle` (`mot_cle_id_fk`);

--
-- Index pour la table `lien_document_participant`
--
ALTER TABLE `lien_document_participant`
  ADD PRIMARY KEY (`participant_id_fk`,`document_id_fk`),
  ADD KEY `fk_doc_part_doc` (`document_id_fk`);

--
-- Index pour la table `lien_document_pays`
--
ALTER TABLE `lien_document_pays`
  ADD PRIMARY KEY (`pays_id_fk`,`document_id_fk`),
  ADD KEY `fk_doc_pays_document` (`document_id_fk`);

--
-- Index pour la table `mot_cle`
--
ALTER TABLE `mot_cle`
  ADD PRIMARY KEY (`mot_cle_id`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participant_id`),
  ADD KEY `fk_particpant_type_part_type_part` (`type_particpant_id_fk`);

--
-- Index pour la table `pays_interdit`
--
ALTER TABLE `pays_interdit`
  ADD PRIMARY KEY (`pays_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_reservation_lecteur` (`lecteur_id_fk`),
  ADD KEY `fk_reservation_document` (`document_id_fk`);

--
-- Index pour la table `SEQUENCE`
--
ALTER TABLE `SEQUENCE`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Index pour la table `type_document`
--
ALTER TABLE `type_document`
  ADD PRIMARY KEY (`type_document_id`);

--
-- Index pour la table `type_participant`
--
ALTER TABLE `type_participant`
  ADD PRIMARY KEY (`type_participant_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnement`
--
ALTER TABLE `abonnement`
  MODIFY `abonnement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `administrateur_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `emprunt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `forfait`
--
ALTER TABLE `forfait`
  MODIFY `forfait_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lecteur`
--
ALTER TABLE `lecteur`
  MODIFY `lecteur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `mot_cle`
--
ALTER TABLE `mot_cle`
  MODIFY `mot_cle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `pays_interdit`
--
ALTER TABLE `pays_interdit`
  MODIFY `pays_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_document`
--
ALTER TABLE `type_document`
  MODIFY `type_document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `type_participant`
--
ALTER TABLE `type_participant`
  MODIFY `type_participant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD CONSTRAINT `fk_abonnement_forfait` FOREIGN KEY (`forfait_id_fk`) REFERENCES `abonnement` (`abonnement_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_abonnement_lecteur` FOREIGN KEY (`lecteur_id_fk`) REFERENCES `lecteur` (`lecteur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_document_type_doc_type_doc` FOREIGN KEY (`type_document_id_fk`) REFERENCES `type_document` (`type_document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `fk_emprunt_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprunt_lecteur` FOREIGN KEY (`lecteur_id_fk`) REFERENCES `lecteur` (`lecteur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `lien_document_mot_cle`
--
ALTER TABLE `lien_document_mot_cle`
  ADD CONSTRAINT `fk_doc_keyword_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doc_keyword_mot_cle` FOREIGN KEY (`mot_cle_id_fk`) REFERENCES `mot_cle` (`mot_cle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `lien_document_participant`
--
ALTER TABLE `lien_document_participant`
  ADD CONSTRAINT `fk_doc_part_doc` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doc_part_participant` FOREIGN KEY (`participant_id_fk`) REFERENCES `participant` (`participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `lien_document_pays`
--
ALTER TABLE `lien_document_pays`
  ADD CONSTRAINT `fk_doc_pays_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doc_pays_pays` FOREIGN KEY (`pays_id_fk`) REFERENCES `pays_interdit` (`pays_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `fk_particpant_type_part_type_part` FOREIGN KEY (`type_particpant_id_fk`) REFERENCES `type_participant` (`type_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_document` FOREIGN KEY (`document_id_fk`) REFERENCES `document` (`document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservation_lecteur` FOREIGN KEY (`lecteur_id_fk`) REFERENCES `lecteur` (`lecteur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
