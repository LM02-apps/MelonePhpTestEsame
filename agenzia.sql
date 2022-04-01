-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 01, 2022 alle 10:30
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agenzia`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `appartamenti`
--

CREATE TABLE `appartamenti` (
  `codice` int(8) NOT NULL,
  `indirizzo` varchar(40) DEFAULT NULL,
  `prezzogiorno` double DEFAULT NULL,
  `numerocamere` int(2) DEFAULT NULL,
  `postiletto` int(2) DEFAULT NULL,
  `usocucina` char(1) DEFAULT NULL,
  `parcheggio` char(1) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `codicequartiere` int(8) DEFAULT NULL,
  `codiceproprietario` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `appartamenti`
--

INSERT INTO `appartamenti` (`codice`, `indirizzo`, `prezzogiorno`, `numerocamere`, `postiletto`, `usocucina`, `parcheggio`, `note`, `codicequartiere`, `codiceproprietario`) VALUES
(1, 'Via Reggio Emilia 2', 50.2, 2, 4, 'S', 'N', 'sample text', 1, 'TDDCLT55R14H754T');

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `codicefiscale` char(16) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `indirizzo` varchar(60) DEFAULT NULL,
  `nomeutente` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cellulare` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `disponibilità`
--

CREATE TABLE `disponibilità` (
  `codice` int(8) NOT NULL,
  `data` date DEFAULT NULL,
  `disponibile` char(1) DEFAULT NULL,
  `codiceriga` int(8) DEFAULT NULL,
  `codiceappartamento` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `foto`
--

CREATE TABLE `foto` (
  `codice` int(8) NOT NULL,
  `didascalia` varchar(50) DEFAULT NULL,
  `urlfoto` varchar(255) DEFAULT NULL,
  `codiceappartamento` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `codice` int(8) NOT NULL,
  `dataprenotazione` date DEFAULT NULL,
  `codicecliente` char(16) DEFAULT NULL,
  `confermaprenotazione` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `proprietari`
--

CREATE TABLE `proprietari` (
  `codicefiscale` char(16) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `indirizzo` varchar(60) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cellulare` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `codiceiban` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `proprietari`
--

INSERT INTO `proprietari` (`codicefiscale`, `nome`, `indirizzo`, `telefono`, `cellulare`, `email`, `codiceiban`) VALUES
('TDDCLT55R14H754T', 'Giuliana', 'Via Appia Nuova 0100 Roma', '386 2737394', '386 2737394', 'GiulianaRusso@dayrep.com', 'IT70H0300203280754498595186');

-- --------------------------------------------------------

--
-- Struttura della tabella `quartieri`
--

CREATE TABLE `quartieri` (
  `codice` int(8) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `urlmappa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `quartieri`
--

INSERT INTO `quartieri` (`codice`, `nome`, `urlmappa`) VALUES
(1, 'Salario', 'https://www.google.com/maps/place/Quartiere+IV+Salario,+00198+Roma+RM/@41.9144851,12.4972754,16z/data=!3m1!4b1!4m5!3m4!1s0x132f610e70d57a1d:0x4866aae87fc856bf!8m2!3d41.9146918!4d12.4996909');

-- --------------------------------------------------------

--
-- Struttura della tabella `righe`
--

CREATE TABLE `righe` (
  `codice` int(8) NOT NULL,
  `datainiziale` date DEFAULT NULL,
  `datafinale` date DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `confermariga` char(1) DEFAULT NULL,
  `codiceprenotazione` int(8) DEFAULT NULL,
  `codiceappartamento` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `appartamenti`
--
ALTER TABLE `appartamenti`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codicequartiere` (`codicequartiere`),
  ADD KEY `codiceproprietario` (`codiceproprietario`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`codicefiscale`);

--
-- Indici per le tabelle `disponibilità`
--
ALTER TABLE `disponibilità`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codiceriga` (`codiceriga`),
  ADD KEY `codiceappartamento` (`codiceappartamento`);

--
-- Indici per le tabelle `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codiceappartamento` (`codiceappartamento`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codicecliente` (`codicecliente`);

--
-- Indici per le tabelle `proprietari`
--
ALTER TABLE `proprietari`
  ADD PRIMARY KEY (`codicefiscale`);

--
-- Indici per le tabelle `quartieri`
--
ALTER TABLE `quartieri`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `righe`
--
ALTER TABLE `righe`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codiceprenotazione` (`codiceprenotazione`),
  ADD KEY `codiceappartamento` (`codiceappartamento`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `appartamenti`
--
ALTER TABLE `appartamenti`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `disponibilità`
--
ALTER TABLE `disponibilità`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `foto`
--
ALTER TABLE `foto`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `quartieri`
--
ALTER TABLE `quartieri`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `righe`
--
ALTER TABLE `righe`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `appartamenti`
--
ALTER TABLE `appartamenti`
  ADD CONSTRAINT `appartamenti_ibfk_1` FOREIGN KEY (`codicequartiere`) REFERENCES `quartieri` (`codice`),
  ADD CONSTRAINT `appartamenti_ibfk_2` FOREIGN KEY (`codiceproprietario`) REFERENCES `proprietari` (`codicefiscale`);

--
-- Limiti per la tabella `disponibilità`
--
ALTER TABLE `disponibilità`
  ADD CONSTRAINT `disponibilità_ibfk_1` FOREIGN KEY (`codiceriga`) REFERENCES `righe` (`codice`),
  ADD CONSTRAINT `disponibilità_ibfk_2` FOREIGN KEY (`codiceappartamento`) REFERENCES `appartamenti` (`codice`);

--
-- Limiti per la tabella `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`codiceappartamento`) REFERENCES `appartamenti` (`codice`);

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`codicecliente`) REFERENCES `clienti` (`codicefiscale`);

--
-- Limiti per la tabella `righe`
--
ALTER TABLE `righe`
  ADD CONSTRAINT `righe_ibfk_1` FOREIGN KEY (`codiceprenotazione`) REFERENCES `prenotazioni` (`codice`),
  ADD CONSTRAINT `righe_ibfk_2` FOREIGN KEY (`codiceappartamento`) REFERENCES `appartamenti` (`codice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
