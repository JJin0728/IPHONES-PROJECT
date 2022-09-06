-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: iphones_datebase2
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `question_statistic`
--

DROP TABLE IF EXISTS `question_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_statistic` (
  `항목_통계` int NOT NULL,
  `Unique_Q_ID` int NOT NULL COMMENT 'unique id',
  `Unique_A_ID` int NOT NULL COMMENT '답변 unique id',
  `Q_Statistic` int NOT NULL COMMENT '항목_통계 id',
  PRIMARY KEY (`Q_Statistic`),
  KEY `FK_CarSurvey_Question_TO_Question_Statistic` (`Unique_Q_ID`),
  KEY `FK_CarSurvey_Answer_TO_Question_Statistic` (`Unique_A_ID`),
  CONSTRAINT `FK_CarSurvey_Answer_TO_Question_Statistic` FOREIGN KEY (`Unique_A_ID`) REFERENCES `carsurvey_answer` (`Unique_A_ID`),
  CONSTRAINT `FK_CarSurvey_Question_TO_Question_Statistic` FOREIGN KEY (`Unique_Q_ID`) REFERENCES `carsurvey_question` (`Unique_Q_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='질문별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_statistic`
--

LOCK TABLES `question_statistic` WRITE;
/*!40000 ALTER TABLE `question_statistic` DISABLE KEYS */;
INSERT INTO `question_statistic` VALUES (2,1,1,1),(2,1,2,2),(1,1,3,3),(3,1,4,4),(1,1,5,5),(2,2,1,6),(2,2,2,7),(2,2,3,8),(2,2,4,9),(2,2,5,10),(2,3,1,11),(2,3,2,12),(2,3,3,13),(2,3,4,14),(2,3,5,15),(2,4,1,16),(2,4,2,17),(2,4,3,18),(2,4,4,19),(2,4,5,20);
/*!40000 ALTER TABLE `question_statistic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-06 15:04:35
