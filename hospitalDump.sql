-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_auth`
--

DROP TABLE IF EXISTS `admin_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_auth` (
  `index` int NOT NULL AUTO_INCREMENT,
  `id` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_auth`
--

LOCK TABLES `admin_auth` WRITE;
/*!40000 ALTER TABLE `admin_auth` DISABLE KEYS */;
INSERT INTO `admin_auth` VALUES (1,'skeerthana4734@gmail.com','2021'),(2,'mohandanesha@gmail.com','2002');
/*!40000 ALTER TABLE `admin_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `address` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (167,'Guru',18,'Salem','Male'),(1009,'Suriya',20,'Mumbai','Male'),(2003,'Sushma',28,'Salem','Femae'),(2004,'Manthra',23,'Mumbai','Female'),(2006,'Kiran',19,'CBE','Female'),(2007,'Danesha',23,'Salem','Female'),(2008,'Manthra',22,'Chennai','Female'),(2011,'Manthra',20,'Chennai','Female'),(2056,'Keerthana',23,'Salem','Female'),(19000,'Guru',18,'Salem','Male');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inpatient`
--

DROP TABLE IF EXISTS `inpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inpatient` (
  `patient_id` int NOT NULL,
  `room_no` int NOT NULL,
  `date_of_adm` datetime NOT NULL,
  `date_of_dis` datetime NOT NULL,
  `lab_no` int NOT NULL,
  PRIMARY KEY (`room_no`),
  KEY `patient_id_idx` (`patient_id`),
  KEY `labno_idx` (`lab_no`),
  CONSTRAINT `labno` FOREIGN KEY (`lab_no`) REFERENCES `laboratory` (`lab_no`),
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `roomno` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inpatient`
--

LOCK TABLES `inpatient` WRITE;
/*!40000 ALTER TABLE `inpatient` DISABLE KEYS */;
INSERT INTO `inpatient` VALUES (103,705,'2021-08-21 00:00:00','2021-08-23 00:00:00',12),(104,707,'2021-10-09 00:00:00','2021-10-15 00:00:00',13),(101,711,'2021-09-01 00:00:00','2021-09-10 00:00:00',10);
/*!40000 ALTER TABLE `inpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `INST_ID` int NOT NULL AUTO_INCREMENT,
  `INST_FULLNAME` varchar(255) NOT NULL,
  `INST_ADDRESS` varchar(255) NOT NULL,
  `INST_SEX` varchar(20) NOT NULL DEFAULT 'Male',
  `INST_STATUS` varchar(20) NOT NULL DEFAULT 'Single',
  `SPECIALIZATION` text NOT NULL,
  `INST_EMAIL` varchar(255) NOT NULL,
  `EMPLOYMENT_STATUS` varchar(40) NOT NULL DEFAULT 'Probationary',
  `EMPID` int NOT NULL,
  `OFFICELOAD` int NOT NULL,
  `LOADDESCRIPTION` varchar(150) NOT NULL,
  PRIMARY KEY (`INST_ID`),
  KEY `EMPID` (`EMPID`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (2,'Basilio, Riza G., MBA','Tapi, Kabankalan City','F','Married','Marketing','','',20100607,2,'SAC-Business'),(5,'Casumpang, Peter M., MAT-RLL','Kabankalan City','M','Married','English','','',19930601,2,'SAC-Language'),(6,'De la Torre, Marilyn L.','Kabankalan City','F','Married','Education','','',19810601,8,'Principal-Elem'),(9,'Gatoc, Imelda M.,  Ph. D','Salong, Kabankalan City','F','Married','Filipino','','',19880601,9,'Daen-TEA/Assistant SAC-Language'),(10,'Gecosala. Cresenciano G.  Ma. Ed','','M','Single','English','','',19890602,0,''),(11,'Gentugao, Mary Grace V. ','Kabankalan City','F','Single','PE','','',20120604,2,'Coor-Cultural'),(13,'Ibañez, Dolores N., MBA','Kabankalan City','F','Single','Finance','','',19791101,0,''),(14,'Intong, Roger T., MIT','Kabankalan City','M','Married','Computer','','',20100610,2,'SAC-Computer'),(16,'Jonota, Joe-Ann V., MAEd','Kabankalan City','M','Married','Science, Education','','',19920601,8,'VPSM'),(18,'Lumbrado, Lilia B., MA.Ed.','Kabankalan City','F','Married','Filipino','','',19750601,0,''),(20,'Quingking, Remedios G., MA','Kabankalan City','F','Married','Education','','',20110622,8,'Principal-High School'),(21,'Ramos, Annabelle T.','Kabankalan City','F','Married','Filipino','','',19880603,0,''),(22,'Sabidalas, Milagros Aurea A., Ed.D.','Kabankalan City','F','Married','Education','','',19870601,8,'VPAA'),(23,'Tabucon, Kathleen B. ','Kabankalan City','F','','English','','',20040603,2,'SSAO'),(24,'Tabligan, Lezeth Rose T.','Kabankalan City','F','Married','Computer','','',20110603,2,'Liaison Officer'),(25,'Rutchel A. Torrecampo','','F','','English','','',20070604,0,''),(26,'Tantiado, Kerwin F., Ph.D.','Kabankalan City','M','Married','Mathematics','','',2001100,0,''),(27,'Villanueva, Joken E., MIT','Kabankalan City','M','Single','Computer','','',20120607,0,''),(29,'Ynchausti, Jocelyn E., CPA, MBA','Kabankalan City','F','Married','Accounting','','',20020601,8,'VPAF'),(30,'Zamora, Remy E. ','Kabankalan City','M','Married','Management, NSTP','','',19851201,2,'NSTP'),(31,'Batuto, Erick Jason J. MAT-MT','Kabankalan City','M','Married','Mathematics','','',20070605,2,'SAC Math'),(32,'Bocafigura, Jocelyn C., MBA','Kabankalan City','F','Married','Accounting','','',20050705,8,'HRD Officer'),(33,'Coñate, Eric John T., CPA, MBA','Binalbagan','M','Married','Accounting','','',20110719,8,'Dean-Business/ITE'),(34,'Matillano, Evelyn D., CPA, MBA','Binalbagan','F','Married','Accounting','','',20120623,2,'SAC-Accounting'),(35,'Pineda, Enrique S. Rev. Fr. ','','M','','Philosophy','','',20080605,0,''),(36,'Alayon, Raffy C.','','M','Single','English','','Probationary',22001123,0,''),(37,'Briones, Blossom A.','','F','Single','English','Brgy. Talubangi, Kab. City','',22000123,0,''),(38,'Basing, Ma. Teresa, G. MA','','F','Married','Filipino','','',22200134,0,''),(39,'Pedojan, Feleciano O., Ph.D.','Kabankalan City','M','Single','Mathematics','','',20140000,6,'QuaRO'),(40,'Gayomale, Nicolas MAEd','Kabankalan City','M','Married','Social Sciences, Education','','Partime',20150000,0,''),(41,'Luminuque, Vincent MAEd','Kabankalan City','M','Single','Science','','',20130000,2,'SAC-Science/Kadahigan'),(42,'Abunyawan, Ma. Dayma L.','Kabankalan City','M','Married','HELE','','Permanent',1998000,0,''),(43,'Tomo, Sheryl D.','Kabankalan City','F','Married','Psychology','','',20140001,8,'Staff-Guidance Office'),(44,'Monteclaro, Fellame T., MBA','Kabankalan Catholic College','F','Married','Management','','Permanent',19990601,8,'Registrar'),(45,'Guilot, Atty Joy I.','Kabankalan City','F','Married','Law','','Partime',20150001,0,''),(46,'Bosea, Evangeline B.','Kabankalan City','F','Married','Accounting','','Partime',20150002,0,''),(47,'Vasquez, Sr. Meachelle Carm., O.L.','Kabankalan City','F','Single','Theology','','',20150003,2,'SAC-Theology'),(48,'Oyos, Max Frederick','Kabankalan City','M','Married','Psychology','','Partime',20150004,0,''),(49,'Pineda, Enrique Rev. Fr.','Kabankalan City','M','Single','Philosophy','','',20150005,0,''),(50,'Lucerna, Eugene 111 Rev. Fr. ','Kabankalan City','M','Single','Philosophy','','',20150006,8,'Guidance Counselor'),(51,'Dagunan, Ricon Rev. Fr.','Kabankalan City','M','Single','Philosophy','','',20150007,0,''),(52,'Daub, Randy Rev. Fr.','Kabankalan City','M','Single','Philosophy','','',20150008,0,''),(53,'Sina-on, Elsin Rev. Fr.','Kabankalan City','M','Single','Philosophy','','',20150009,0,''),(54,'Paglumotan, Paul Melcar C.','Ilog, Negros Occidental','M','Single','Mathematics','','Permanent',20000015,0,''),(55,'Tabayag, Blas P., MA','Talubangi, Kabankalan City','M','Married','Soc Sci','','Partime',2000016,0,''),(56,'Bayog, Radny T., Ph.D.','Kabankalan City','M','Single','Philosophy','','',2000017,8,'School President'),(57,'Sina-on, Rev. Fr. Elsin ','Kabankalan City','M','Single','Philosophy','','',2000018,0,''),(58,'Dioteles, Richard D.','','M','Single','Information Technology','','Permanent',20130602,0,''),(59,'Castro, Jessica G.','','F','Married','Law','','Partime',20005463,0,''),(60,'Yap, Eiggy D.','','M','Single','Education','','Partime',20005897,0,''),(61,'Esparar, Jon Rey M.','','M','Single','Education','','Partime',20006324,0,''),(62,'De la Torre, Ailyn Mae L., MA','','F','Single','English','','Partime',20001467,0,''),(63,'Villaflor, Ritchie (Rev. Fr.)','','M','Single','Philosophy ','','Partime ',20001982,0,''),(64,'Jun Rey Esparar, MA. Ed.','','M','','Education','','Partime',20009315,0,''),(66,'Gorriceta, Lydia F.','','F','Married','','','',20001474,0,''),(67,'Gaspillo, Dianita F.','','F','Married','','','',20006214,0,''),(68,'Sabiniano, Rev. Fr. Pinsoy Jr. M. ','','M','Single','','','',20004520,0,''),(69,'Apawan, Elviro Jr. E.','','M','Married','','','',20001445,0,''),(70,'Pinsoy, Sabiniano Jr. M. (Rev. Fr.)','','','','','','',20001542,0,''),(71,'Briones, Edward P.','','M','Married','','','',20012315,0,''),(72,'Bueno, Sr. Gemma Catherine C. ,..Carm.O.L.','','F','Single','','','',20001236,0,''),(73,'Villanueva, Rodito','','M','Married','','','',20001245,0,''),(74,'Quintoya, Joyce M.','','F','Single','','','',20016477,0,'');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory` (
  `lab_no` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `date` datetime NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`lab_no`),
  KEY `patient_idx` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
INSERT INTO `laboratory` VALUES (10,101,2001,'2021-09-01 00:00:00',5000),(11,102,2002,'2021-07-23 00:00:00',3500),(12,103,2001,'2021-08-21 00:00:00',3000),(13,104,2003,'2021-10-09 00:00:00',4000),(14,105,2004,'2021-02-12 00:00:00',4500);
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outpatient`
--

DROP TABLE IF EXISTS `outpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outpatient` (
  `patient_id` int NOT NULL,
  `date_time` date NOT NULL,
  `lab_no` int NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `lab_no_idx` (`lab_no`),
  CONSTRAINT `lab_no` FOREIGN KEY (`lab_no`) REFERENCES `laboratory` (`lab_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outpatient`
--

LOCK TABLES `outpatient` WRITE;
/*!40000 ALTER TABLE `outpatient` DISABLE KEYS */;
INSERT INTO `outpatient` VALUES (102,'2021-07-23',11),(105,'2021-02-12',14);
/*!40000 ALTER TABLE `outpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `disease` varchar(45) NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (101,'Riya',20,'Female','Salem','cancer',2001),(102,'Devi',45,'Female','Chennai','fever',2002),(103,'Harsh',25,'Male','Coimbatore','fracture',2001),(104,'Mani',36,'Male','Salem','fever',2003),(123,'Kiran',12,'Female','Salem','Fever',2001);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_no` int NOT NULL,
  `room_type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (705,'AC ward','free'),(707,'Single ward','occupied'),(711,'General ward','free');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03 13:17:57
