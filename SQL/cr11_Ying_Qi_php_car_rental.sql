-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 18. Feb 2018 um 20:46
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr11_Ying_Qi_php_car_rental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carComp`
--

CREATE TABLE `carComp` (
  `compId` int(11) NOT NULL,
  `compName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `carComp`
--

INSERT INTO `carComp` (`compId`, `compName`) VALUES
(1, 'BMW'),
(2, 'Audi'),
(3, 'Ford'),
(4, 'Fiat'),
(5, 'Skoda'),
(6, 'Toyota');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `carId` int(55) NOT NULL,
  `carImage` varchar(130) NOT NULL,
  `carStatus` varchar(30) NOT NULL,
  `horsepower` varchar(60) NOT NULL,
  `carYear` int(60) NOT NULL,
  `cost` int(155) NOT NULL,
  `fk_colorId` int(11) NOT NULL,
  `fk_compId` int(11) NOT NULL,
  `fk_locationId` int(11) NOT NULL,
  `carModel` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`carId`, `carImage`, `carStatus`, `horsepower`, `carYear`, `cost`, `fk_colorId`, `fk_compId`, `fk_locationId`, `carModel`) VALUES
(1, 'https://imgd.aeplcdn.com/1056x594/n/45qdpra_1422141.jpg?q=80', 'new', '250 PS', 2018, 200, 5, 1, 1, 'BMW 3 Series GT'),
(2, 'https://img2.carmax.com/stock/mm-mini-cooper/500', 'new', '184 PS', 2018, 150, 2, 1, 1, 'Mini Cooper S'),
(3, 'https://buyersguide.caranddriver.com/media/assets/submodel/8232.jpg', 'new', '150 PS', 2018, 180, 3, 2, 1, 'A3 e-tron'),
(4, 'https://ymimg1.b8cdn.com/uploads/car_model/3419/pictures/3240772/Capture1.PNG', 'new', '97 PS', 2018, 120, 4, 6, 2, 'corolla'),
(5, 'https://www.osv.ltd.uk/images/cars/cap2/mini/hatchback_3.jpg', 'new', '95 PS', 2018, 100, 5, 1, 2, 'Mini Hatchback Lease'),
(6, 'http://st.motortrend.com/uploads/sites/10/2016/06/2017-ford-mustang-v6-coupe-angular-front.png', 'new', '305 PS', 2018, 250, 8, 3, 3, 'Mustang v6 Coupe'),
(7, 'https://d1ek71enupal89.cloudfront.net/images/blocks_png/SKODA/OCTAVIA/5DR/17SkoOct5drGryFL1_800.jpg', 'new', '110 PS', 2018, 80, 9, 5, 3, 'octavia'),
(8, 'https://i.ebayimg.com/images/g/LF0AAOSww9xZIxOc/s-l450.png', 'new', '431 PS', 2017, 290, 1, 1, 3, 'M3 Limousine (F80) '),
(9, 'http://octopus-finance.co.uk/wp-content/uploads/2014/07/BMW-1-SERIES-SPORT-HATCH.jpg', 'new', '150 PS', 2018, 250, 1, 1, 3, '1er BMW'),
(10, 'https://www.toyota.com/imgix/responsive/images/mlp/colorizer/2018/yaris/040/1.png?q=85&fm=jpg&w=1024&fit=max&cs=strip&bg=fff', 'new', '120 PS', 2018, 250, 1, 6, 4, 'Yaris'),
(11, 'https://www.parkers.co.uk/Images/Cache/Archive/325x0/LCV/Ford/Ranger%2011-on/ford_2016_ranger.jpg', 'new', '150 PS', 2018, 250, 5, 3, 4, 'Ranger Reviews '),
(12, 'http://www.pngmart.com/files/1/Audi-A7-S-Line-PNG.png', 'new', '190 PS', 2018, 210, 7, 2, 4, 'A7 S-Line');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `colors`
--

CREATE TABLE `colors` (
  `colorId` int(11) NOT NULL,
  `colorName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `colors`
--

INSERT INTO `colors` (`colorId`, `colorName`) VALUES
(1, 'white'),
(2, 'cream'),
(3, 'black'),
(4, 'silver'),
(5, 'grey'),
(6, 'turquoise'),
(7, 'orange'),
(8, 'red'),
(9, 'petrolium');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `insuranceId` int(20) NOT NULL,
  `type` varchar(40) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `insurance`
--

INSERT INTO `insurance` (`insuranceId`, `type`, `price`) VALUES
(1, 'mini', 10),
(2, 'basic', 20),
(3, 'full', 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `locationId` int(55) NOT NULL,
  `name` varchar(100) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `city` varchar(60) NOT NULL,
  `country` varchar(60) NOT NULL,
  `zipCode` int(155) NOT NULL,
  `locaEmail` varchar(60) NOT NULL,
  `phone` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`locationId`, `name`, `adress`, `city`, `country`, `zipCode`, `locaEmail`, `phone`) VALUES
(1, 'Landstraße', 'Marxergasse 4', 'Vienna', 'Austria', 1030, 'landstraße@car_rent.at', '01 12345678'),
(2, 'Karlsplatz', 'Kaertner Ring 1', 'Vienna', 'Austria', 1010, 'kaertner@car_rent.at', '01 56781234'),
(3, 'Westbahnhof', 'Europa Platz1', 'Vienna', 'Austria', 1150, 'westbahnhof@car_rent.at', '01 81234567'),
(4, 'Hauptbahnhof', 'Johannitergasse 7', 'Vienna', 'Austria', 1100, 'hauptbahnhof@car_rent.at', '01 78123456');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservId` int(55) NOT NULL,
  `days` int(20) NOT NULL,
  `start_date` date NOT NULL,
  `return_date` date NOT NULL,
  `rentDays` int(55) NOT NULL,
  `totalAmount` int(55) NOT NULL,
  `fk_carId` int(20) NOT NULL,
  `fk_userId` int(6) NOT NULL,
  `fk_pickupLoca` int(20) NOT NULL,
  `fk_dropOffLoca` int(20) NOT NULL,
  `fk_insuranceId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`userId`, `userName`, `firstname`, `lastname`, `userEmail`, `userPass`) VALUES
(1, '', 'Ying', 'Qi', 'qying23@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `carComp`
--
ALTER TABLE `carComp`
  ADD PRIMARY KEY (`compId`);

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`carId`),
  ADD KEY `fk_colorId` (`fk_colorId`),
  ADD KEY `fk_compId` (`fk_compId`),
  ADD KEY `fk_locationId` (`fk_locationId`);

--
-- Indizes für die Tabelle `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`colorId`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insuranceId`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationId`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservId`),
  ADD KEY `fk_carId` (`fk_carId`),
  ADD KEY `fk_userId` (`fk_userId`),
  ADD KEY `fk_pickupLoca` (`fk_pickupLoca`),
  ADD KEY `fk_dropOffLoca` (`fk_dropOffLoca`),
  ADD KEY `fk_insuranceId` (`fk_insuranceId`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservId` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_colorId`) REFERENCES `colors` (`colorId`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fk_compId`) REFERENCES `carComp` (`compId`),
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`fk_locationId`) REFERENCES `location` (`locationId`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_carId`) REFERENCES `cars` (`carId`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_pickupLoca`) REFERENCES `location` (`locationId`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_dropOffLoca`) REFERENCES `location` (`locationId`),
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`fk_insuranceId`) REFERENCES `insurance` (`insuranceId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
