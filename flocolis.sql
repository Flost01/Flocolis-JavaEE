-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 31 juil. 2024 à 12:34
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `flocolis`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('Flost', 'jojobizare');

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

CREATE TABLE `agence` (
  `id_agence` int(11) NOT NULL,
  `NomAg` varchar(255) NOT NULL,
  `NomPDG` varchar(255) NOT NULL,
  `Descrption` varchar(255) NOT NULL,
  `SiegeP` varchar(255) NOT NULL,
  `Passord` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL,
  `create_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`id_agence`, `NomAg`, `NomPDG`, `Descrption`, `SiegeP`, `Passord`, `site`, `create_at`) VALUES
(5, 'Finex voyage', 'M. ABELA', 'Agence de voyage', 'Yaoundé', '000000', 'www.finex.com', '2023-09-26'),
(6, 'Buca voyage', 'M. KAMONTE', 'agence de voyage', 'Yaoundé', '000000', 'www.buca.com', '2023-09-27');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_cat` int(11) NOT NULL,
  `Nom_cat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_cat`, `Nom_cat`) VALUES
(1, 'Produits alimentaires'),
(2, 'Produits élèctroniques'),
(3, 'Produits mobiliers'),
(4, 'Produits sensibles'),
(5, 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_clent` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Phone` bigint(20) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `create_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_clent`, `Nom`, `Prenom`, `Email`, `Password`, `Phone`, `Adresse`, `create_at`) VALUES
(11, 'Daze', 'Azert', 'azert@gmail.com', '000000', 75765765, 'Garoua', '2023-09-08'),
(12, 'KOMO', 'ali', 'ali@gmail.com', '000000', 76675765876, 'Douala', '2023-09-08'),
(13, 'TIANI', 'Ange', 'tiani@gmail.com', '000000', 12345678, 'Douala', '2023-09-12'),
(14, 'Poiu', 'tyu', 'tyu@gmail.com', '000000', 689087446, 'Yaoundé', '2023-09-13'),
(15, 'DJABO', 'Ange', 'djaboa@gmail.com', '000000', 4767657657, 'Ndokoti DOUALA', '2023-09-16'),
(20, 'Koumedom', 'Franck', 'franck@gmail.com', '000000', 686584568, 'yaounde', '2024-04-24'),
(21, 'BEYENE', 'chel', 'beyene@gmail.com', '000000', 64557568, 'Bertoua', '2024-04-30'),
(22, 'lauren', 'lauren', 'lauren@gmail.xom', '000000', 693745239, 'Bertoua', '2024-05-09');

-- --------------------------------------------------------

--
-- Structure de la table `colis`
--

CREATE TABLE `colis` (
  `id_colis` int(11) NOT NULL,
  `id_clent` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `id_livreur` int(11) DEFAULT NULL,
  `id_agence` int(11) DEFAULT NULL,
  `Descrition` varchar(255) NOT NULL,
  `date_creation` date NOT NULL,
  `delai_livraison` date NOT NULL,
  `NomDes` varchar(255) NOT NULL,
  `EmailDes` varchar(255) NOT NULL,
  `PhoneDes` int(11) NOT NULL,
  `Destination` varchar(255) NOT NULL,
  `status_colis` varchar(255) DEFAULT 'save'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `colis`
--

INSERT INTO `colis` (`id_colis`, `id_clent`, `id_cat`, `id_livreur`, `id_agence`, `Descrition`, `date_creation`, `delai_livraison`, `NomDes`, `EmailDes`, `PhoneDes`, `Destination`, `status_colis`) VALUES
(38, 13, 1, 10, 5, 'Sac de riz de50kg', '2023-10-04', '2023-10-04', 'BELLA', 'bella@gmail.com', 67798989, 'Yaoundé', 'take'),
(39, 11, 1, 11, 6, 'Bidon de 20 d\'huile', '2023-10-04', '2023-10-04', 'Dominique', 'do@gmail.com', 67798898, 'Douala', 'take'),
(41, 12, 4, NULL, NULL, 'Miroir', '2023-10-04', '2023-10-04', 'GATU', 'ga@gmail.com', 65656578, 'Ebolowa', 'save'),
(42, 14, 4, 13, 6, 'Plaque à gaz', '2023-10-04', '2023-10-04', 'ABEN', 'ben@gmail.com', 656543444, 'Ebolowa', 'take'),
(43, 13, 1, 10, 5, 'regime de bananes', '2024-04-30', '2024-05-01', 'LOM', 'lom@gmail.com', 6868769, 'Garoua', 'take'),
(44, 21, 1, 12, 6, 'Sac de 50kg de cacao', '2024-04-30', '2024-05-17', 'mony', 'mon@gmail.com', 6868769, 'Douala', 'take'),
(45, 21, 4, 12, 6, 'Miroir', '2024-04-30', '2024-05-31', 'lape', 'lape@gmail.com', 6868769, 'Yaoundé', 'take'),
(46, 20, 1, NULL, NULL, 'banane', '2024-05-09', '2024-05-24', 'kop', 'kop@gmail.com', 6868769, 'Ebolowa', 'save'),
(49, 22, 4, 13, 6, 'télévision', '2024-05-19', '2024-05-24', 'kop', 'kop@gmail.com', 6548568, 'Douala', 'Livré'),
(52, 13, 5, NULL, NULL, 'moto', '2024-07-02', '2024-07-17', 'lipo', 'lip@gmail.com', 678798, 'Yaoundé', 'save'),
(53, 13, 5, 14, 5, 'carton de livres', '2024-07-04', '2024-07-06', 'lipo', 'lip@gmail.com', 68798987, 'Yaoundé', 'Livré');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `id_livreur` int(11) NOT NULL,
  `id_agence` int(11) DEFAULT NULL,
  `NomL` varchar(255) NOT NULL,
  `PrenomL` varchar(255) NOT NULL,
  `EmailL` varchar(255) NOT NULL,
  `PhoneL` int(11) NOT NULL,
  `PasswordL` varchar(100) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `create_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id_livreur`, `id_agence`, `NomL`, `PrenomL`, `EmailL`, `PhoneL`, `PasswordL`, `ville`, `create_at`) VALUES
(10, 5, 'BEKE', 'Hans', 'hans@gmail.com', 12345678, '000000', 'Douala', '2023-09-27'),
(11, 6, 'CHONTCHA', 'Landry', 'chont@gmail.com', 6878789, '000000', 'Garoua', '2023-09-27'),
(12, 6, 'KEGOUM', 'Fabrice', 'fabrice@gmail.com', 68989890, '000000', 'Bertoua', '2023-09-28'),
(13, 6, 'gomba', 'hkj', 'hkjhjk@gmail.com', 6879997, '000000', 'Douala', '2023-09-28'),
(14, 5, 'MBELLA', 'Hilary', 'hila@gmail.com', 6908978, '000000', 'Yaoundé', '2023-10-03'),
(15, 6, 'MBELLA', 'Dominique', 'do@gmail.com', 6789989, '000000', 'Ebolowa', '2023-10-04');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`id_agence`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_cat`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_clent`);

--
-- Index pour la table `colis`
--
ALTER TABLE `colis`
  ADD PRIMARY KEY (`id_colis`),
  ADD KEY `fk_client` (`id_clent`),
  ADD KEY `fk_cat` (`id_cat`),
  ADD KEY `fk_livreur` (`id_livreur`),
  ADD KEY `fk_agence` (`id_agence`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id_livreur`),
  ADD KEY `fk_part` (`id_agence`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_clent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `colis`
--
ALTER TABLE `colis`
  MODIFY `id_colis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
