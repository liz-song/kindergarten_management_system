-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kinder
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `decision table`
--

DROP TABLE IF EXISTS `decision table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision table` (
  `establishtype` varchar(45) NOT NULL,
  `caretype` varchar(45) NOT NULL,
  `bus` varchar(45) NOT NULL,
  `type_id` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision table`
--

LOCK TABLES `decision table` WRITE;
/*!40000 ALTER TABLE `decision table` DISABLE KEYS */;
INSERT INTO `decision table` VALUES ('public','standard','o','A'),('public','all','o','B'),('public','night','o','C'),('public','morning','o','D'),('private','standard','o','E'),('private','all','o','F'),('private','night','o','G'),('private','morning','o','H'),('public','standard','x','I'),('public','all','x','J'),('public','night','x','K'),('public','morning','x','L'),('private','standard','x','M'),('private','all','x','N'),('private','night','x','O'),('private','morning','x','P');
/*!40000 ALTER TABLE `decision table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kindergarten`
--

DROP TABLE IF EXISTS `kindergarten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kindergarten` (
  `kindergarten_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `headcount` int NOT NULL,
  `apply_parents` int DEFAULT NULL,
  `enroll_parents` int DEFAULT NULL,
  `manager_id_fk` int NOT NULL DEFAULT '1',
  `likes` int NOT NULL,
  PRIMARY KEY (`kindergarten_id`),
  KEY `kmanager_id` (`manager_id_fk`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindergarten`
--

LOCK TABLES `kindergarten` WRITE;
/*!40000 ALTER TABLE `kindergarten` DISABLE KEYS */;
INSERT INTO `kindergarten` VALUES ('kind001','love','A',9,0,0,1,40),('kind002','meme','B',7,0,0,1,30),('kind003','pen','C',3,0,0,1,25),('kind004','cup','D',5,0,0,1,25),('kind005','book','A',4,0,0,1,10),('kind006','water','B',5,0,0,1,10),('kind007','rice','C',2,0,0,1,8),('kind008','aunt','D',3,0,0,1,8),('kind009','apple','A',2,0,0,1,8),('kind010','arm','B',1,0,0,1,5),('kind011','bird','C',0,0,0,1,5),('kind012','blue','D',1,0,0,1,5);
/*!40000 ALTER TABLE `kindergarten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents` (
  `parent_id` varchar(45) NOT NULL,
  `establish type` varchar(45) NOT NULL,
  `caretype` varchar(45) NOT NULL,
  `bus` varchar(45) NOT NULL,
  `wanttype` varchar(45) NOT NULL,
  `manager_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`parent_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `manager_id` FOREIGN KEY (`manager_id`) REFERENCES `system` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES ('kid001','public','standard','o','A',1),('kid002','public','all','o','B',1),('kid003','public','night ','o','C',1),('kid004','public','morning','o','D',1),('kid005','public','standard','o','A',1),('kid006','public','all','o','B',1),('kid007','public','night','o','C',1),('kid008','public','morning','o','D',1),('kid009','public','standard','o','A',1),('kid010','public','all','o','B',1),('kid011','public','night','o','C',1),('kid012','public','morning','o','D',1),('kid013','public','standard','o','A',1),('kid014','public','all','o','B',1),('kid015','public','night','o','C',1),('kid016','public','morning','o','D',1),('kid017','public','standard','o','A',1),('kid018','public','all','o','B',1),('kid019','public','night ','o','C',1),('kid020','public','morning','o','D',1),('kid021','public','standard','o','A',1),('kid022','public','all','o','B',1),('kid023','public','night ','o','C',1),('kid024','public','morning','o','D',1),('kid025','public','standard','o','A',1),('kid026','public','all','o','B',1),('kid027','public','night ','o','C',1),('kid028','public','morning','o','D',1),('kid029','public','standard','o','A',1),('kid030','public','all','o','B',1),('kid031','public','night ','o','C',1),('kid032','public','morning','o','D',1),('kid033','public','standard','o','A',1),('kid034','public','all','o','B',1),('kid035','public','night ','o','C',1),('kid036','public','morning','o','D',1),('kid037','public','standard','o','A',1),('kid038','public','all','o','B',1),('kid039','public','night ','o','C',1),('kid040','public','morning','o','D',1),('kid041','public','standard','o','A',1),('kid042','public','all','o','B',1),('kid043','public','night ','o','C',1),('kid044','public','morning','o','D',1),('kid045','public','standard','o','A',1),('kid046','public','all','o','B',1),('kid047','public','night ','o','C',1);
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents_has_kindergarten`
--

DROP TABLE IF EXISTS `parents_has_kindergarten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents_has_kindergarten` (
  `parents_parent_id` varchar(45) NOT NULL,
  `kindergarten_kindergarten_id` varchar(45) NOT NULL,
  `apply_rank` int DEFAULT NULL,
  `now_rank` int DEFAULT NULL,
  `enroll_check` tinyint DEFAULT NULL,
  PRIMARY KEY (`parents_parent_id`,`kindergarten_kindergarten_id`),
  KEY `fk_parents_has_kindergarten_kindergarten1_idx` (`kindergarten_kindergarten_id`),
  KEY `fk_parents_has_kindergarten_parents1_idx` (`parents_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents_has_kindergarten`
--

LOCK TABLES `parents_has_kindergarten` WRITE;
/*!40000 ALTER TABLE `parents_has_kindergarten` DISABLE KEYS */;
INSERT INTO `parents_has_kindergarten` VALUES ('kid001','kind001',8,8,0),('kid002','kind002',0,0,1),('kid003','kind003',0,0,1),('kid004','kind004',0,0,1),('kid005','kind001',7,7,0),('kid006','kind002',0,0,1),('kid007','kind003',0,0,1),('kid008','kind004',1,1,0),('kid009','kind001',0,0,1),('kid010','kind002',0,0,1),('kid011','kind003',0,0,1),('kid012','kind004',0,0,1),('kid013','kind001',0,0,1),('kid014','kind002',0,0,1),('kid015','kind003',1,1,0),('kid016','kind004',0,0,1),('kid017','kind001',0,0,1),('kid018','kind002',0,0,1),('kid019','kind003',2,2,0),('kid020','kind004',0,0,1),('kid021','kind001',0,0,1),('kid022','kind002',0,0,1),('kid023','kind003',3,3,0),('kid024','kind004',1,1,0),('kid025','kind001',0,0,1),('kid026','kind002',0,0,1),('kid027','kind003',4,4,0),('kid028','kind004',2,2,0),('kid029','kind001',0,0,1),('kid030','kind002',1,1,0),('kid031','kind003',5,5,0),('kid032','kind004',3,3,0),('kid033','kind001',0,0,0),('kid034','kind002',2,2,0),('kid035','kind003',6,6,0),('kid036','kind004',4,4,0),('kid037','kind001',1,1,0),('kid038','kind002',3,2,0),('kid039','kind007',0,0,1),('kid040','kind004',5,5,0),('kid041','kind001',2,2,0),('kid042','kind002',4,4,0),('kid043','kind007',0,0,1),('kid044','kind004',6,6,0),('kid045','kind001',3,3,0),('kid045','kind005',0,0,0),('kid045','kind009',0,0,0),('kid047','kind002',0,0,0),('kid047','kind003',7,7,0),('kid047','kind004',7,7,0),('kid047','kind006',1,1,0),('kid047','kind007',1,1,0),('kid047','kind011',1,1,0);
/*!40000 ALTER TABLE `parents_has_kindergarten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system` (
  `manager_id` int NOT NULL DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `result_date` date DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `add_result_date` date DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,'2023-05-01','2023-05-08','2023-05-18','2023-05-21');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21  4:30:29
