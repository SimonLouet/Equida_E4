-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 21 Mai 2019 à 13:46
-- Version du serveur :  5.7.26-0ubuntu0.18.04.1
-- Version de PHP :  7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Equida18_G1`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `ach_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

CREATE TABLE `avoir` (
  `com_id` int(11) NOT NULL,
  `rol_code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

CREATE TABLE `categvente` (
  `code` varchar(5) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  `archiver` binary(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

CREATE TABLE `cheval` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `sire` varchar(13) NOT NULL,
  `pere` int(11) DEFAULT NULL,
  `mere` int(11) DEFAULT NULL,
  `typ_id` int(11) DEFAULT NULL,
  `archiver` int(11) DEFAULT '0',
  `cli_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `rue` varchar(60) NOT NULL,
  `copos` varchar(5) NOT NULL,
  `ville` varchar(40) NOT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `codePays` varchar(3) DEFAULT NULL,
  `titre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `clientcategvente`
--

CREATE TABLE `clientcategvente` (
  `codeClient` int(11) NOT NULL,
  `codeCategVente` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `mdp` varchar(50) DEFAULT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'CLIENT',
  `cli_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `concerner`
--

CREATE TABLE `concerner` (
  `ven_id` int(11) NOT NULL,
  `typ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `courriel`
--

CREATE TABLE `courriel` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `objet` varchar(100) NOT NULL,
  `corps` varchar(500) NOT NULL,
  `ven_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `lieu` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `donner`
--

CREATE TABLE `donner` (
  `per_code` varchar(5) NOT NULL,
  `rol_code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `enchere`
--

CREATE TABLE `enchere` (
  `id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `lotvent_id` int(11) NOT NULL,
  `ach_id` int(11) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joindre`
--

CREATE TABLE `joindre` (
  `pie_id` int(11) NOT NULL,
  `cou_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `id` int(11) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `nbBoxes` int(11) NOT NULL,
  `commentaire` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `id` int(11) NOT NULL,
  `vent_id` int(11) NOT NULL,
  `che_id` int(11) DEFAULT NULL,
  `vend_id` int(11) DEFAULT NULL,
  `archiver` int(11) DEFAULT NULL,
  `prixDepart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `che_id` int(11) NOT NULL,
  `cour_id` int(11) NOT NULL,
  `place` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `code` varchar(3) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `archiver` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `code` varchar(5) NOT NULL,
  `nom` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `piecejointe`
--

CREATE TABLE `piecejointe` (
  `id` int(11) NOT NULL,
  `chemin` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `code` varchar(5) NOT NULL,
  `nom` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typecheval`
--

CREATE TABLE `typecheval` (
  `id` int(11) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `ven_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `dateDebut` date NOT NULL,
  `codeCategVente` varchar(5) NOT NULL,
  `lie_id` int(11) DEFAULT NULL,
  `dateFinVente` date DEFAULT NULL,
  `dateDebutInscrip` date DEFAULT NULL,
  `archiver` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`ach_id`);

--
-- Index pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD PRIMARY KEY (`com_id`,`rol_code`),
  ADD KEY `rol_code` (`rol_code`);

--
-- Index pour la table `categvente`
--
ALTER TABLE `categvente`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PERE` (`pere`),
  ADD KEY `FK_MERE` (`mere`),
  ADD KEY `FK_TYPE` (`typ_id`),
  ADD KEY `FK_CLIent_Cheval` (`cli_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cli_pays` (`codePays`);

--
-- Index pour la table `clientcategvente`
--
ALTER TABLE `clientcategvente`
  ADD PRIMARY KEY (`codeClient`,`codeCategVente`),
  ADD KEY `FK_cliCat_Categ` (`codeCategVente`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cli_id` (`cli_id`);

--
-- Index pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD PRIMARY KEY (`ven_id`,`typ_id`),
  ADD KEY `typ_id` (`typ_id`);

--
-- Index pour la table `courriel`
--
ALTER TABLE `courriel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ven_id` (`ven_id`);

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `donner`
--
ALTER TABLE `donner`
  ADD PRIMARY KEY (`per_code`,`rol_code`),
  ADD KEY `rol_code` (`rol_code`);

--
-- Index pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD PRIMARY KEY (`id`,`lot_id`,`lotvent_id`),
  ADD KEY `lot_id` (`lot_id`,`lotvent_id`),
  ADD KEY `ach_id` (`ach_id`);

--
-- Index pour la table `joindre`
--
ALTER TABLE `joindre`
  ADD PRIMARY KEY (`cou_id`,`pie_id`),
  ADD KEY `pie_id` (`pie_id`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`id`,`vent_id`),
  ADD KEY `vent_id` (`vent_id`),
  ADD KEY `che_id` (`che_id`),
  ADD KEY `vend_id` (`vend_id`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`che_id`,`cour_id`),
  ADD KEY `cour_id` (`cour_id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `piecejointe`
--
ALTER TABLE `piecejointe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `typecheval`
--
ALTER TABLE `typecheval`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`ven_id`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Ven_Categ` (`codeCategVente`),
  ADD KEY `lie_id` (`lie_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cheval`
--
ALTER TABLE `cheval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `courriel`
--
ALTER TABLE `courriel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `enchere`
--
ALTER TABLE `enchere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `lot`
--
ALTER TABLE `lot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT pour la table `participer`
--
ALTER TABLE `participer`
  MODIFY `che_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `piecejointe`
--
ALTER TABLE `piecejointe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `typecheval`
--
ALTER TABLE `typecheval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
