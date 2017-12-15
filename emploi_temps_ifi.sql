-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 16 Novembre 2017 à 16:52
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `emploi_temps_ifi`
--

-- --------------------------------------------------------

--
-- Structure de la table `emploi`
--

CREATE TABLE `emploi` (
  `emploi_id` int(11) NOT NULL,
  `course_name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `color` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `emploi`
--

INSERT INTO `emploi` (`emploi_id`, `course_name`, `start_date`, `end_date`, `color`, `uid`) VALUES
(64, 'BEC', '2017-12-30 09:00:00', '2017-12-30 12:00:00', 'null', 10),
(65, 'GLA', '2017-12-31 09:00:00', '2017-12-31 12:00:00', 'null', 10),
(70, ' GES PRO', '2018-01-03 00:00:00', '2018-01-03 00:05:00', '', 36),
(71, 'GSP', '2018-01-04 09:35:00', '2018-01-04 12:35:00', '#FF6699', 10),
(72, 'SMA', '2018-01-03 14:00:00', '2018-01-03 17:00:00', '#FF6699', 10);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `ID_EV` int(11) NOT NULL,
  `NOM_EV` varchar(100) NOT NULL,
  `DATE_EV` varchar(15) NOT NULL,
  `LIEU_EV` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `events`
--

INSERT INTO `events` (`ID_EV`, `NOM_EV`, `DATE_EV`, `LIEU_EV`) VALUES
(2, '  coference sur master data managment', '  2017-12-22', '  opera hanoi vietnam');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `ID_PROF` int(11) NOT NULL,
  `NOMPRENOM_PROF` varchar(100) NOT NULL,
  `COURS` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `MINICV` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `professeur`
--

INSERT INTO `professeur` (`ID_PROF`, `NOMPRENOM_PROF`, `COURS`, `EMAIL`, `MINICV`) VALUES
(1, '  QUANG NGUYEN', '  REASEAUX  ', '  quangnguyen@ifi.edu.vn', 'DOCTEUR DEPUIS 1991, RESPONSABLE DU MASTER 1 A L\'IFI ET RESPOSABLE DE LABORATOIRE UMMCI'),
(2, 'MANH HUONG', 'SMA ', 'manhhounh@gmail.com', 'phd en france professeur a ussth');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `uid` int(11) NOT NULL,
  `promoname` varchar(200) NOT NULL,
  `cpassword` varchar(200) NOT NULL,
  `status` varchar(10) NOT NULL COMMENT 'check user active or not',
  `position` varchar(10) NOT NULL COMMENT 'check user Admin or normal user',
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `promotion`
--

INSERT INTO `promotion` (`uid`, `promoname`, `cpassword`, `status`, `position`, `password`) VALUES
(8, 'christolivier', '03040047Z', 'A', 'A', ''),
(10, 'promotion 21', '12345678', 'A', 'U', ''),
(36, 'promotion 22', '123', 'A', 'U', '123'),
(37, 'promo10', '12345', 'A', 'U', '12345');

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `uid` int(11) NOT NULL,
  `pdf` varchar(10) NOT NULL,
  `minc` varchar(10) NOT NULL,
  `skin` varchar(10) NOT NULL,
  `language` varchar(30) NOT NULL,
  `map` varchar(10) NOT NULL,
  `agenda` varchar(10) NOT NULL,
  `ical` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `setting`
--

INSERT INTO `setting` (`uid`, `pdf`, `minc`, `skin`, `language`, `map`, `agenda`, `ical`) VALUES
(1, 'pdfA', 'mcA', 'sk1', 'English', 'mapA', 'agA', 'icD'),
(2, 'pdfA', 'mcA', 'sk1', 'English', 'mapA', 'agD', 'icD'),
(3, 'pdfD', 'mcD', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(4, 'pdfD', 'mcD', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(5, 'pdfD', 'mcD', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(6, 'pdfA', 'mcA', 'sk1', 'English', 'mapA', 'agA', 'icA'),
(7, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(8, 'pdfD', 'mcD', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(9, 'pdfA', 'mcA', 'sk1', 'English', 'mapA', 'agA', 'icA'),
(31, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(32, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(33, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(34, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(35, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(36, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD'),
(37, 'pdfD', 'mcA', 'sk1', 'English', 'mapD', 'agD', 'icD');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `emploi`
--
ALTER TABLE `emploi`
  ADD PRIMARY KEY (`emploi_id`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`ID_EV`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`ID_PROF`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `emploi`
--
ALTER TABLE `emploi`
  MODIFY `emploi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `ID_EV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `ID_PROF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
