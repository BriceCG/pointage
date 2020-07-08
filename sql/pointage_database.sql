-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 08 Juillet 2020 à 19:32
-- Version du serveur :  5.7.30-0ubuntu0.18.04.1
-- Version de PHP :  7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `api_pointage`
--

-- --------------------------------------------------------

--
-- Structure de la table `pt_presences`
--

CREATE TABLE `pt_presences` (
  `id` int(11) NOT NULL,
  `presence_date` datetime NOT NULL,
  `pt_user_user_id_presence` int(11) DEFAULT NULL,
  `pt_departement_departement_id_presence` int(11) DEFAULT NULL,
  `presence_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `pt_presences`
--

INSERT INTO `pt_presences` (`id`, `presence_date`, `pt_user_user_id_presence`, `pt_departement_departement_id_presence`, `presence_type`) VALUES
(1, '2020-07-08 17:05:32', 1, NULL, 'present'),
(2, '2020-07-08 17:30:00', 2, NULL, 'present');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `pt_presences`
--
ALTER TABLE `pt_presences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pt_presence_pt_user1_idx` (`pt_user_user_id_presence`),
  ADD KEY `fk_pt_presence_pt_departement1_idx` (`pt_departement_departement_id_presence`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `pt_presences`
--
ALTER TABLE `pt_presences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `pt_presences`
--
ALTER TABLE `pt_presences`
  ADD CONSTRAINT `fk_pt_presence_pt_departement1` FOREIGN KEY (`pt_departement_departement_id_presence`) REFERENCES `pt_departements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pt_presence_pt_user1` FOREIGN KEY (`pt_user_user_id_presence`) REFERENCES `pt_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
