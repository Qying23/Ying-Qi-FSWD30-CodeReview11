
SQL Code for PHP Rental Car


//1 
CREATE DATABASE cr11_Ying_Qi-php-car_rental DEFAULT CHARACTER SET utf8;


//2 users
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `driversLicence` int(111) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userEmail` (`userEmail`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

//3 color of cars
CREATE TABLE  `colors` (`colorId` int(11) NOT NULL,
                      `colorName` varchar(30) NOT NULL,
                      PRIMARY KEY (`colorId`));
//4 fill color tab
INSERT INTO colors VALUES(1,'red'),(2,'blue'),(3,'black'),(4,'silver'),(5,'grey');

//5 company that makes the cars
CREATE TABLE  `carComp` (`compId` int(11) NOT NULL,
                      `compName` varchar(30) NOT NULL,
                      PRIMARY KEY (`compId`));

//6 fill the table company cars (//5)
INSERT INTO carComp VALUES(1,'BMW'),(2,'Audi'),(3,'Ford'),(4,'Fiat'),(5,'Skoda'),(6,'Toyota');

//7 cars
CREATE TABLE  cars(carId int(55) NOT NULL,
                   carStatus varchar(30) NOT NULL,
                   horsepower varchar(60)NOT NULL,
                   carYear int(60)NOT NULL,
                   cost int(155)NOT NULL,
                   fk_colorId int(11) NOT NULL,
                   fk_compId int(11) NOT NULL,
                   PRIMARY KEY (carId),
                   FOREIGN KEY (fk_colorId) REFERENCES colors(colorId),
                   FOREIGN KEY (fk_compId) REFERENCES carComp(compId));

//8 insert car (weiß nicht wo der fehler liegt aber man muss einzeln eintragen)
INSERT INTO cars VALUES (1,'new','150 PS', 2018, 250, 5, 1),
                        (2,'new','130 PS', 2018, 150, 4, 2), 
                        (3,'new','140 PS', 2018, 190, 3, 3),
                        (4,'new','110 PS', 2018, 180, 2, 4),
                        (5,'new','100 PS', 2018, 170, 1, 5),
                        (6,'new','120 PS', 2018, 120, 5, 1),
                        (7,'new','150 PS', 2018, 240, 4, 1),
                        (8,'new','110 PS', 2018, 190, 3, 2),
                        (9,'new','150 PS', 2018, 200, 2, 2),
                        (10,'new','150 PS', 2018, 230, 1, 1),
                        (11,'new','150 PS', 2018, 200, 6, 2),
                        (12,'new','120 PS', 2018, 200, 4, 2),
                        (13,'new','110 PS', 2018, 220, 3, 1),
                        (14,'new','150 PS', 2018, 220, 2, 1),
                        (15,'new','150 PS', 2018, 230, 1, 1),
                        (16,'new','100 PS', 2018, 200, 5, 2),
                        (17,'new','110 PS', 2018, 190, 6, 3),
                        (18,'new','100 PS', 2018, 170, 3, 4),
                        (19,'new','150 PS', 2018, 150, 2, 5),
                        (20,'new','120 PS', 2018, 190, 1, 1);                    

//9 Rental location
CREATE TABLE  location(locationId int(55) NOT NULL,
                    adress varchar(100) NOT NULL,
                    city varchar(60) NOT NULL,
                    country varchar(60) NOT NULL,
                    zipCode int(155) NOT NULL,
                    locaEmail varchar(60) NOT NULL,
                    phone varchar(60) NOT NULL,
                    PRIMARY KEY (locationId));

//10 fill location
INSERT INTO location VALUES(1,'Landstraße-Hauptstraße 1/1','Vienna','Austria','1030','landstraße@car_rent.at','01 12345678'),(2,'Kaertner Ring 1' ,'Vienna' ,'Austria', '1010','kaertner@car_rent.at','01 56781234'),(3,'Westbahnhof', 'Vienna', 'Austria', '1150', 'westbahnhof@car_rent.at','01 81234567'), (4,'Hauptbahnhof' ,'Vienna' ,'Austria', '1100','hauptbahnhof@car_rent.at','01 78123456');

//11 Create Table Reservation
CREATE TABLE IF NOT EXISTS reservation(reservId int(55) NOT NULL AUTO_INCREMENT,
                    adress varchar(100) NOT NULL,
                    city varchar(60) NOT NULL,
                    country varchar(60) NOT NULL,
                    zipCode int(155) NOT NULL,
                    locaEmail varchar(60) NOT NULL,
                    phone varchar(60) NOT NULL,
                    PRIMARY KEY (locationId));

//11 Create Table payment/invoice
CREATE TABLE IF NOT EXISTS reservation(reservId int(55) NOT NULL AUTO_INCREMENT,
                    adress varchar(100) NOT NULL,
                    city varchar(60) NOT NULL,
                    country varchar(60) NOT NULL,
                    zipCode int(155) NOT NULL,
                    locaEmail varchar(60) NOT NULL,
                    phone varchar(60) NOT NULL,
                    PRIMARY KEY (locationId));

