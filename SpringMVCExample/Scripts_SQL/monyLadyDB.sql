-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: monylady
-- ------------------------------------------------------
-- Server version	5.1.73-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `UK_e4o36fyfp4h0qgosori7ry67g` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'ACCESSOIRES'),(1,'COSMETIQUES'),(2,'MONTRES'),(3,'SACS');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `dateOfBirth` date DEFAULT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `middleName` varchar(20) DEFAULT NULL,
  `personID` int(11) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `UK_i38ltv4g2ru7chb1jxfky8wus` (`personID`),
  CONSTRAINT `FK_i38ltv4g2ru7chb1jxfky8wus` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_ordered`
--

DROP TABLE IF EXISTS `items_ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_ordered` (
  `itemsOrderedID` int(11) NOT NULL AUTO_INCREMENT,
  `itemQty` int(11) NOT NULL,
  `unitPrice` decimal(10,0) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`itemsOrderedID`),
  UNIQUE KEY `UK_n7cth7ouxppw90d0m333glb6j` (`orderID`,`productID`),
  KEY `FK_niu32ewixvmu6uhlenjjxcnqo` (`productID`),
  CONSTRAINT `FK_niu32ewixvmu6uhlenjjxcnqo` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `FK_p6uy5d7bml2nq9satj6e1yyp7` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_ordered`
--

LOCK TABLES `items_ordered` WRITE;
/*!40000 ALTER TABLE `items_ordered` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_ordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `empOrCust` char(1) NOT NULL,
  `message` longtext NOT NULL,
  `sequence` smallint(6) NOT NULL,
  `personID` int(11) NOT NULL,
  `caseID` int(11) NOT NULL,
  PRIMARY KEY (`messageID`),
  KEY `FK_ekr1nofhrpdh3hogbhhioh1d6` (`personID`),
  KEY `FK_hpouiym3xbp0l4dpb9ggjtlr7` (`caseID`),
  CONSTRAINT `FK_ekr1nofhrpdh3hogbhhioh1d6` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`),
  CONSTRAINT `FK_hpouiym3xbp0l4dpb9ggjtlr7` FOREIGN KEY (`caseID`) REFERENCES `service_case` (`caseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `itemSubtotal` decimal(10,0) NOT NULL,
  `numOfItems` int(11) NOT NULL,
  `salesTaxPaid` decimal(8,0) NOT NULL,
  `shippingTotal` decimal(8,0) NOT NULL,
  `timePlaced` datetime NOT NULL,
  `timeShipped` datetime NOT NULL,
  `transactNumber` varchar(20) DEFAULT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK_sj8isilxn8yi63icsb1wp9p4d` (`customerID`),
  CONSTRAINT `FK_sj8isilxn8yi63icsb1wp9p4d` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personID` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `securityAnswer` varchar(25) NOT NULL,
  `securityQuesID` int(11) NOT NULL,
  PRIMARY KEY (`personID`),
  UNIQUE KEY `UK_3tnwg2lomhbqckauuc1997bx7` (`login`),
  KEY `FK_m2y5d57g03nqqb1kln0h1drky` (`securityQuesID`),
  CONSTRAINT `FK_m2y5d57g03nqqb1kln0h1drky` FOREIGN KEY (`securityQuesID`) REFERENCES `security_question` (`securityQuesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `imagePath` varchar(50) DEFAULT NULL,
  `modelNumber` varchar(25) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `productName` varchar(150) NOT NULL,
  `qtyOnHand` int(11) NOT NULL,
  `subcategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `UK_j6u3b2wrkk61neyxar4imtrel` (`modelNumber`),
  KEY `FK_PRODUCT_TO_SUB` (`subcategoryID`),
  CONSTRAINT `FK_PRODUCT_TO_SUB` FOREIGN KEY (`subcategoryID`) REFERENCES `subcategory` (`subcategoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'test produit1','1.jpg','1',10,'CHU',10,1),(2,'test produit 2','2.jpg','2',20,'smalto montre',5,2),(3,'test produit 3','3.jpg','3',15,'smalto montre',2,2),(4,'test produit 4','4.jpg','4',2,'ryse salor',10,2),(5,'test produit 5','5.jpg','5',10,'ryse salor',5,2),(6,'test produit 6','6.jpg','6',15,'renaissance',10,2),(7,'test produit 7','8.jpg','7',2,'bally lunette',2,4),(8,'test produit 8','10.jpg','8',1,'mascara',20,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_in_wish_list`
--

DROP TABLE IF EXISTS `products_in_wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_in_wish_list` (
  `productsInWishListID` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` smallint(6) NOT NULL,
  `timeAdded` datetime NOT NULL,
  `productID` int(11) NOT NULL,
  `wishListID` int(11) NOT NULL,
  PRIMARY KEY (`productsInWishListID`),
  UNIQUE KEY `UK_f7see7oewrpjl68xt7mj8tx2o` (`wishListID`,`productID`),
  KEY `FK_ntc2iodqvsiky6iol8po5pdo3` (`productID`),
  CONSTRAINT `FK_d8728viapneec63bcvvnhicrh` FOREIGN KEY (`wishListID`) REFERENCES `wish_list` (`wishListID`),
  CONSTRAINT `FK_ntc2iodqvsiky6iol8po5pdo3` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_in_wish_list`
--

LOCK TABLES `products_in_wish_list` WRITE;
/*!40000 ALTER TABLE `products_in_wish_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_in_wish_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `rating` smallint(6) NOT NULL,
  `review` longtext NOT NULL,
  `customerID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`reviewID`),
  KEY `FK_34i2qu7aa54vbnqjovwu6vidm` (`customerID`),
  KEY `FK_2d6xub2n3yawq8xrkjacvu4am` (`productID`),
  CONSTRAINT `FK_2d6xub2n3yawq8xrkjacvu4am` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `FK_34i2qu7aa54vbnqjovwu6vidm` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_tax`
--

DROP TABLE IF EXISTS `sales_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_tax` (
  `state` varchar(2) NOT NULL,
  `percent` decimal(7,5) NOT NULL,
  PRIMARY KEY (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_tax`
--

LOCK TABLES `sales_tax` WRITE;
/*!40000 ALTER TABLE `sales_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_question`
--

DROP TABLE IF EXISTS `security_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_question` (
  `securityQuesID` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(60) NOT NULL,
  PRIMARY KEY (`securityQuesID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_question`
--

LOCK TABLES `security_question` WRITE;
/*!40000 ALTER TABLE `security_question` DISABLE KEYS */;
INSERT INTO `security_question` VALUES (1,'Votre surnom?'),(2,'nom de votre meilleur ami ?'),(3,'nom de jeune fille de votre maman?');
/*!40000 ALTER TABLE `security_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_case`
--

DROP TABLE IF EXISTS `service_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_case` (
  `caseID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`caseID`),
  KEY `FK_q6gfeiiiainnjp4ohj8ry45b0` (`customerID`),
  CONSTRAINT `FK_q6gfeiiiainnjp4ohj8ry45b0` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_case`
--

LOCK TABLES `service_case` WRITE;
/*!40000 ALTER TABLE `service_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `subcategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `subcategoryName` varchar(30) NOT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`subcategoryID`),
  KEY `FK_px5n1kkoks7hbojsak54vgt37` (`categoryID`),
  CONSTRAINT `FK_px5n1kkoks7hbojsak54vgt37` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Maquillage Bio',1),(2,'Cremes',1),(3,'Make up',1),(4,'Parfums',1),(5,'Lunettes',4),(6,'Capillaire',4),(7,'Montre Cuir',2),(8,'Montre Acier',2),(9,'Montre Curren',2);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `mail` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES 
(3,'test','test','test@test','test'),
(4,'test','test','test@test','test'),
(5,'test','test','test@test','test'),
(6,'test','test','test@test','test'),
(7,'dfdfdf','fdsff','dfdf@dfdf.fr','sdsdsdsdsd'),
(8,'sdsdsdsd','sdsd','sds@sdfr.fr','sdsdsdsd'),
(9,'sds','dsdsd','qqze@sdr.fr','sdsdsdsdsd'),
(10,'dfdf','fdfd','dfdf@dfr.fr','dffdf'),(
11,'sdsds','sdsds','sds@dfr.fr','sdsd'),(
12,'dfdf','fdfd','dfd@frt.fr','cxcxcx'),(13,'test','test','test@test.fr','test'),(14,'sdsdsd','sdsdsd','sdsds@st.fr','sdssdsds'),(15,'dfdf','dfdf','xcvxv@gh.gt','aaaaa'),(16,'sdsd','dsds','sdsd@df.fr','xccxc'),(17,'dfdfd','dfdfd','dfdfd@sd.fr','sdsdsdsd'),(18,'Aziz','Abou','abou@free.fr','Abou');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wish_list` (
  `wishListID` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date DEFAULT NULL,
  `lastUpdated` datetime NOT NULL,
  `wishListName` varchar(20) NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`wishListID`),
  KEY `FK_stbmrhb55xxa2e457b5eqagov` (`customerID`),
  CONSTRAINT `FK_stbmrhb55xxa2e457b5eqagov` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-24 17:51:29
