-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 07 Juillet 2020 à 19:53
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
-- Structure de la table `pt_demandes`
--

CREATE TABLE `pt_demandes` (
  `id` int(11) NOT NULL,
  `demande_date` datetime NOT NULL,
  `pt_user_user_id` int(11) NOT NULL,
  `pt_departement_departement_id` int(11) NOT NULL,
  `demande_etat` varchar(45) NOT NULL,
  `demande_intervalle` varchar(45) DEFAULT NULL,
  `demande_motif` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pt_departements`
--

CREATE TABLE `pt_departements` (
  `id` int(11) NOT NULL,
  `departement_nom` varchar(255) NOT NULL,
  `departement_chef_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pt_presences`
--

CREATE TABLE `pt_presences` (
  `id` int(11) NOT NULL,
  `presence_date` datetime NOT NULL,
  `pt_user_user_id_presence` int(11) NOT NULL,
  `pt_departement_departement_id_presence` int(11) NOT NULL,
  `presence_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pt_users`
--

CREATE TABLE `pt_users` (
  `id` int(11) NOT NULL,
  `user_username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_departement_id` int(11) DEFAULT NULL,
  `user_etat` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `pt_demandes`
--
ALTER TABLE `pt_demandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pt_demande_pt_user1_idx` (`pt_user_user_id`),
  ADD KEY `fk_pt_demande_pt_departement1_idx` (`pt_departement_departement_id`);

--
-- Index pour la table `pt_departements`
--
ALTER TABLE `pt_departements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pt_departement_pt_user1_idx` (`departement_chef_id`);

--
-- Index pour la table `pt_presences`
--
ALTER TABLE `pt_presences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pt_presence_pt_user1_idx` (`pt_user_user_id_presence`),
  ADD KEY `fk_pt_presence_pt_departement1_idx` (`pt_departement_departement_id_presence`);

--
-- Index pour la table `pt_users`
--
ALTER TABLE `pt_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pt_user_pt_departement1_idx` (`user_departement_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `pt_departements`
--
ALTER TABLE `pt_departements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pt_presences`
--
ALTER TABLE `pt_presences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pt_users`
--
ALTER TABLE `pt_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `pt_demandes`
--
ALTER TABLE `pt_demandes`
  ADD CONSTRAINT `fk_pt_demande_pt_departement1` FOREIGN KEY (`pt_departement_departement_id`) REFERENCES `pt_departements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pt_demande_pt_user1` FOREIGN KEY (`pt_user_user_id`) REFERENCES `pt_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pt_departements`
--
ALTER TABLE `pt_departements`
  ADD CONSTRAINT `fk_pt_departement_pt_user1` FOREIGN KEY (`departement_chef_id`) REFERENCES `pt_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pt_presences`
--
ALTER TABLE `pt_presences`
  ADD CONSTRAINT `fk_pt_presence_pt_departement1` FOREIGN KEY (`pt_departement_departement_id_presence`) REFERENCES `pt_departements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pt_presence_pt_user1` FOREIGN KEY (`pt_user_user_id_presence`) REFERENCES `pt_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pt_users`
--
ALTER TABLE `pt_users`
  ADD CONSTRAINT `fk_pt_user_pt_departement1` FOREIGN KEY (`user_departement_id`) REFERENCES `pt_departements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
