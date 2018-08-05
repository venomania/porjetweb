-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 03 août 2018 à 15:10
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_ad_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nam_admin` varchar(250) DEFAULT NULL,
  `useur_admin` varchar(250) DEFAULT NULL,
  `pass_admin` varchar(250) DEFAULT NULL,
  `mail_admin` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_ad_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `artile_article` text DEFAULT NULL,
  `date_article` date DEFAULT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `id_gener` int(11) NOT NULL,
  PRIMARY KEY (`id_article`,`id_gener`),
  KEY `FK_avoir_id_gener` (`id_gener`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gener`
--

DROP TABLE IF EXISTS `gener`;
CREATE TABLE IF NOT EXISTS `gener` (
  `id_gener` int(11) NOT NULL AUTO_INCREMENT,
  `nom_gener` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_gener`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `postée`
--

DROP TABLE IF EXISTS `postée`;
CREATE TABLE IF NOT EXISTS `postée` (
  `id_Utilistateur` int(11) NOT NULL AUTO_INCREMENT,
  `id_article` int(11) NOT NULL,
  `date_postée` date DEFAULT NULL,
  PRIMARY KEY (`id_Utilistateur`,`id_article`),
  KEY `FK_postée_id_article` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilistateur`
--

DROP TABLE IF EXISTS `utilistateur`;
CREATE TABLE IF NOT EXISTS `utilistateur` (
  `id_Utilistateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_Utilistateur` varchar(250) DEFAULT NULL,
  `pass_Utilistateur` varchar(2501) DEFAULT NULL,
  `mail_Utilistateur` varchar(250) DEFAULT NULL,
  `img_Utilistateur` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_Utilistateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `FK_avoir_id_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `FK_avoir_id_gener` FOREIGN KEY (`id_gener`) REFERENCES `gener` (`id_gener`);

--
-- Contraintes pour la table `postée`
--
ALTER TABLE `postée`
  ADD CONSTRAINT `FK_postée_id_Utilistateur` FOREIGN KEY (`id_Utilistateur`) REFERENCES `utilistateur` (`id_Utilistateur`),
  ADD CONSTRAINT `FK_postée_id_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
