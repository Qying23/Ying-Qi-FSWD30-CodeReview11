
SQL Code for PHP Rental Car


//1 
CREATE DATABASE cr11_Ying_Qi-php-car_rental DEFAULT CHARACTER SET utf8;


//2 users
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
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

//7 Rental location
CREATE TABLE  location(locationId int(55) NOT NULL,
                        name varchar(100) NOT NULL,
                        adress varchar(100) NOT NULL,
                        city varchar(60) NOT NULL,
                        country varchar(60) NOT NULL,
                        zipCode int(155) NOT NULL,
                        locaEmail varchar(60) NOT NULL,
                        phone varchar(60) NOT NULL,
                        PRIMARY KEY (locationId));

//8 fill location
INSERT INTO location VALUES(1,'Landstraße','Landstraße-Hauptstraße 1/1','Vienna','Austria','1030','landstraße@car_rent.at','01 12345678'), (2,'Karlsplatz','Kaertner Ring 1' ,'Vienna' ,'Austria', '1010','kaertner@car_rent.at','01 56781234'), (3,'Westbahnhof', 'fssda1','Vienna', 'Austria', '1150', 'westbahnhof@car_rent.at','01 81234567'), (4,'Hauptbahnhof' ,'fssda1','Vienna' ,'Austria', '1100','hauptbahnhof@car_rent.at','01 78123456')

//9 cars
CREATE TABLE  cars(carId int(55) NOT NULL,
                     carImage varchar(130) NOT NULL,
                     carStatus varchar(30) NOT NULL,
                     horsepower varchar(60)NOT NULL,
                     carModel varchar(60)NOT NULL,
                     carYear int(60)NOT NULL,
                     cost int(155)NOT NULL, 
                     fk_colorId int(11) NOT NULL,
                     fk_compId int(11) NOT NULL,
                     fk_locationId int(11) NOT NULL,
                     PRIMARY KEY (carId),
                     FOREIGN KEY (fk_colorId) REFERENCES colors(colorId),
                     FOREIGN KEY (fk_compId) REFERENCES carComp(compId), FOREIGN KEY (fk_locationId) REFERENCES location(locationId));

//10 insert car (weiß nicht wo der fehler liegt aber man muss einzeln eintragen)                    
INSERT INTO cars VALUES (1,'https://imgd.aeplcdn.com/1056x594/n/45qdpra_1422141.jpg?q=80','new','150 PS', 2018, 250, 5, 1,1,'3 Series GT');

//11 
CREATE TABLE insurance(insuranceId int(20) NOT NULL,
                        type varchar(40) NOT NULL,
                        price int(20) NOT NULL,
                        PRIMARY KEY (insuranceId));

//12
INSERT INTO insurance VALUES
(1, 'mini', 10),
(2, 'basic', 20),
(3, 'full', 30);



//13Create Table Reservation
CREATE TABLE IF NOT EXISTS reservation(reservId int(55) NOT NULL AUTO_INCREMENT,
                                        days int(20) NOT NULL,
                                        start_date date NOT NULL,
                                        return_date date NOT NULL,
                                        rentDays int(55) NOT NULL,
                                        totalAmount int(55) NOT NULL,
                                        fk_carId int(20) NOT NULL,
                                        fk_userId int(6) NOT NULL,
                                        fk_pickupLoca int(20) NOT NULL,
                                        fk_dropOffLoca int(20) NOT NULL,
                                        fk_insuranceId int(20) NOT NULL,
                                        PRIMARY KEY (reservId),
                     FOREIGN KEY (fk_carId) REFERENCES cars(carId),
                     FOREIGN KEY (fk_userId) REFERENCES users(userId),
                     FOREIGN KEY (fk_pickupLoca) REFERENCES location(locationId), FOREIGN KEY (fk_dropOffLoca) REFERENCES location(locationId),
                     FOREIGN KEY (fk_insuranceId) REFERENCES insurance(insuranceId));

//14 Create Table payment/invoice (das hab ich nicht eingetragen)
CREATE TABLE IF NOT EXISTS payment(paymentId int(55) NOT NULL AUTO_INCREMENT,
                    adress varchar(100) NOT NULL,
                    fk_locationId int(20) NOT NULL,
                    PRIMARY KEY (locationId));

