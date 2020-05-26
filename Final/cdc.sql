-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cdc
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-1ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applied`
--

DROP TABLE IF EXISTS `applied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applied` (
  `student_id` varchar(10) NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'unverified',
  `semester` varchar(10) NOT NULL,
  `core` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`application_id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `applied_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `company_req` (`application_id`) ON DELETE CASCADE,
  CONSTRAINT `applied_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied`
--

LOCK TABLES `applied` WRITE;
/*!40000 ALTER TABLE `applied` DISABLE KEYS */;
INSERT INTO `applied` VALUES ('111701018','2','IT','1','2','core'),('111701019','2','IT','1','2','core');
/*!40000 ALTER TABLE `applied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applied_view`
--

DROP TABLE IF EXISTS `applied_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applied_view` (
  `student_id` tinyint(4) NOT NULL,
  `student_name` tinyint(4) NOT NULL,
  `branch` tinyint(4) NOT NULL,
  `company_id` tinyint(4) NOT NULL,
  `company_name` tinyint(4) NOT NULL,
  `semester` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied_view`
--

LOCK TABLES `applied_view` WRITE;
/*!40000 ALTER TABLE `applied_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `applied_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` varchar(10) NOT NULL,
  `name` char(30) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `about` varchar(50) DEFAULT NULL,
  `phoneno` varchar(12) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('10101','Google','google','Delhi','Tech','11111','google@gmail.com'),('10102','Detect Technology','Detect','Chennai','Tech Company','11011','detect@gmail.com'),('10103','Google','Adobe','Banglore','Tech Company','11110','adove@adobe.com');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_elig_view`
--

DROP TABLE IF EXISTS `company_elig_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_elig_view` (
  `company_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `eligibility` tinyint(4) NOT NULL,
  `start_date` tinyint(4) NOT NULL,
  `end_date` tinyint(4) NOT NULL,
  `stipend` tinyint(4) NOT NULL,
  `deadline` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_elig_view`
--

LOCK TABLES `company_elig_view` WRITE;
/*!40000 ALTER TABLE `company_elig_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_elig_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_prof_view`
--

DROP TABLE IF EXISTS `company_prof_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_prof_view` (
  `company_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `about` tinyint(4) NOT NULL,
  `location` tinyint(4) NOT NULL,
  `required_skills` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_prof_view`
--

LOCK TABLES `company_prof_view` WRITE;
/*!40000 ALTER TABLE `company_prof_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_prof_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_req`
--

DROP TABLE IF EXISTS `company_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_req` (
  `application_id` varchar(10) NOT NULL,
  `company_id` varchar(10) NOT NULL,
  `required_skills` varchar(50) NOT NULL,
  `eligibility` varchar(50) NOT NULL,
  `eligible_disciplines` varchar(50) NOT NULL,
  `vacancies` int(6) NOT NULL DEFAULT 0,
  `stipend` int(10) NOT NULL DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `deadline` date NOT NULL,
  `posted_by` varchar(30) NOT NULL,
  `company_overview` varchar(100) NOT NULL,
  `selection_procedure` varchar(100) NOT NULL,
  `additional_info` varchar(100) DEFAULT NULL,
  `location` varchar(30) NOT NULL,
  `intern_details` varchar(100) NOT NULL,
  `profile_name` varchar(100) NOT NULL,
  `verified` int(1) DEFAULT 0,
  PRIMARY KEY (`application_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_req_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_req`
--

LOCK TABLES `company_req` WRITE;
/*!40000 ALTER TABLE `company_req` DISABLE KEYS */;
INSERT INTO `company_req` VALUES ('1','10101','coding','1','1',2,70000,'2020-05-01','2020-06-30','2020-04-18','google','American multinational company','2 Interviews','asdef','Bangalore','asdef','Product Intern',0),('2','10102','html css typescript angular','12','3',2,20000,'2020-05-05','2020-06-30','2020-04-18','Detect Technology','Start-up','Telephonic Interview','asdef','Chennai','asdef','Web Application',0);
/*!40000 ALTER TABLE `company_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electives`
--

DROP TABLE IF EXISTS `electives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electives` (
  `student_id` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  CONSTRAINT `electives_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electives`
--

LOCK TABLES `electives` WRITE;
/*!40000 ALTER TABLE `electives` DISABLE KEYS */;
INSERT INTO `electives` VALUES ('111701011','CS1003','Cryptography'),('111701011','CS1004','FunctionalProgramming'),('111701013','CS1000','ECONOMICS'),('111701013','CS1001','DEEP LEARNING'),('111701018','CS1001','Economics'),('111701018','CS1005','Combinatorics'),('111701019','CS1006','Digital Systems'),('111701019','EE1007','Signal and Processing'),('111701020','CE1008','Water Management'),('111701020','CE1009','Structural Design');
/*!40000 ALTER TABLE `electives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extracurricular`
--

DROP TABLE IF EXISTS `extracurricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extracurricular` (
  `student_id` varchar(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`title`),
  CONSTRAINT `extracurricular_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extracurricular`
--

LOCK TABLES `extracurricular` WRITE;
/*!40000 ALTER TABLE `extracurricular` DISABLE KEYS */;
INSERT INTO `extracurricular` VALUES ('111701011','Chess','Chess.com'),('111701011','T.T.','Intra College Sports'),('111701013','Drummer','Indias most wanted Drummer'),('111701018','Badminton Player','Have been selected for a state level tournament'),('111701018','BasketBall Player','Have been selected for a state level tournament'),('111701018','Chess Player','Have been selected for a state level tournament'),('111701018','TFS Correspondent','An indepedent college media body correspondent'),('111701019','TFS Correspondent','An indepedent college media body correspondent'),('111701020','TFS Correspondent','An indepedent college media body correspondent');
/*!40000 ALTER TABLE `extracurricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `student_id` varchar(10) NOT NULL,
  `sem1` decimal(4,2) DEFAULT NULL,
  `sem2` decimal(4,2) DEFAULT NULL,
  `sem3` decimal(4,2) DEFAULT NULL,
  `sem4` decimal(4,2) DEFAULT NULL,
  `sem5` decimal(4,2) DEFAULT NULL,
  `sem6` decimal(4,2) DEFAULT NULL,
  `sem7` decimal(4,2) DEFAULT NULL,
  `sem8` decimal(4,2) DEFAULT NULL,
  `cgpa` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES ('111701011',8.72,8.48,8.27,8.78,NULL,NULL,NULL,NULL,8.56),('111701013',1.10,2.20,3.30,4.40,5.50,NULL,NULL,NULL,3.60),('111701018',9.90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9.90),('111701019',9.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9.00),('111701020',9.90,8.90,8.00,9.00,9.40,NULL,NULL,NULL,9.99);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_fromcomp_view`
--

DROP TABLE IF EXISTS `msg_fromcomp_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_fromcomp_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_fromcomp_view`
--

LOCK TABLES `msg_fromcomp_view` WRITE;
/*!40000 ALTER TABLE `msg_fromcomp_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_fromcomp_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_fromstaffrep_view`
--

DROP TABLE IF EXISTS `msg_fromstaffrep_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_fromstaffrep_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_fromstaffrep_view`
--

LOCK TABLES `msg_fromstaffrep_view` WRITE;
/*!40000 ALTER TABLE `msg_fromstaffrep_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_fromstaffrep_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_fromstud_view`
--

DROP TABLE IF EXISTS `msg_fromstud_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_fromstud_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_fromstud_view`
--

LOCK TABLES `msg_fromstud_view` WRITE;
/*!40000 ALTER TABLE `msg_fromstud_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_fromstud_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_fromstudrep_view`
--

DROP TABLE IF EXISTS `msg_fromstudrep_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_fromstudrep_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_fromstudrep_view`
--

LOCK TABLES `msg_fromstudrep_view` WRITE;
/*!40000 ALTER TABLE `msg_fromstudrep_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_fromstudrep_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_fromtpo_view`
--

DROP TABLE IF EXISTS `msg_fromtpo_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_fromtpo_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_fromtpo_view`
--

LOCK TABLES `msg_fromtpo_view` WRITE;
/*!40000 ALTER TABLE `msg_fromtpo_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_fromtpo_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_tocomp_view`
--

DROP TABLE IF EXISTS `msg_tocomp_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_tocomp_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_tocomp_view`
--

LOCK TABLES `msg_tocomp_view` WRITE;
/*!40000 ALTER TABLE `msg_tocomp_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_tocomp_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_tostaffrep_view`
--

DROP TABLE IF EXISTS `msg_tostaffrep_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_tostaffrep_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_tostaffrep_view`
--

LOCK TABLES `msg_tostaffrep_view` WRITE;
/*!40000 ALTER TABLE `msg_tostaffrep_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_tostaffrep_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_tostud_view`
--

DROP TABLE IF EXISTS `msg_tostud_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_tostud_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_tostud_view`
--

LOCK TABLES `msg_tostud_view` WRITE;
/*!40000 ALTER TABLE `msg_tostud_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_tostud_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_tostudrep_view`
--

DROP TABLE IF EXISTS `msg_tostudrep_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_tostudrep_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_tostudrep_view`
--

LOCK TABLES `msg_tostudrep_view` WRITE;
/*!40000 ALTER TABLE `msg_tostudrep_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_tostudrep_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_totpo_view`
--

DROP TABLE IF EXISTS `msg_totpo_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_totpo_view` (
  `message_id` tinyint(4) NOT NULL,
  `not_from` tinyint(4) NOT NULL,
  `not_to` tinyint(4) NOT NULL,
  `notice` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_totpo_view`
--

LOCK TABLES `msg_totpo_view` WRITE;
/*!40000 ALTER TABLE `msg_totpo_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_totpo_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `message_id` varchar(10) NOT NULL,
  `not_from` varchar(10) NOT NULL,
  `not_to` varchar(10) NOT NULL,
  `notice` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('000111','tpo','111701013','When will I need to join in the company'),('MS1107','231701013','111701018','You are selected'),('MS1108','111701011','shruti27','You are selected'),('MS1109','111701013','Nitin8493','You are selected');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `por`
--

DROP TABLE IF EXISTS `por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `por` (
  `student_id` varchar(10) NOT NULL,
  `description` varchar(50) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`student_id`,`description`),
  CONSTRAINT `por_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `por`
--

LOCK TABLES `por` WRITE;
/*!40000 ALTER TABLE `por` DISABLE KEYS */;
INSERT INTO `por` VALUES ('111701011','DAC Head','2018-08-01','2019-08-01'),('111701013','Student General Secretary','2017-08-01','2021-04-30'),('111701018','Head Girl','2016-08-08','2017-08-08'),('111701018','Technical Sec.','2019-07-05','2020-02-12'),('111701019','CDC Coordinator','2016-08-08','2017-08-08'),('111701020','CDC Coordinator','2019-08-08','2019-12-09'),('111701020','Hostel Secetary','2017-07-05','2019-02-12');
/*!40000 ALTER TABLE `por` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `student_id` varchar(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`student_id`,`title`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('111701011','Cartoonifier','Image processing, OpenCV','2018-08-01','2018-08-15'),('111701013','Arm Building Machine','An automatic machine which build arms','2018-01-01','2018-01-02'),('111701013','Web Development','Fest Website','2019-04-01','2020-01-20'),('111701018','Website','Fest website for the college','2019-06-09','2020-08-09'),('111701019','Signal Processing','Signal detection in transport','2019-07-09','2020-09-09'),('111701020','Building design','Design for a tall building','2018-07-09','2019-08-09'),('111701020','Drone','Design a drone programmable crash resistant','2019-07-09','2020-08-09');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected`
--

DROP TABLE IF EXISTS `selected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selected` (
  `student_id` varchar(10) NOT NULL,
  `application_id` varchar(10) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `core` varchar(10) NOT NULL,
  PRIMARY KEY (`student_id`,`application_id`,`semester`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `selected_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `company_req` (`application_id`) ON DELETE CASCADE,
  CONSTRAINT `selected_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected`
--

LOCK TABLES `selected` WRITE;
/*!40000 ALTER TABLE `selected` DISABLE KEYS */;
/*!40000 ALTER TABLE `selected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_view`
--

DROP TABLE IF EXISTS `selected_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selected_view` (
  `student_id` tinyint(4) NOT NULL,
  `student_name` tinyint(4) NOT NULL,
  `branch` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `company_id` tinyint(4) NOT NULL,
  `company_name` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_view`
--

LOCK TABLES `selected_view` WRITE;
/*!40000 ALTER TABLE `selected_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `selected_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_rep`
--

DROP TABLE IF EXISTS `staff_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_rep` (
  `staff_id` varchar(10) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_rep`
--

LOCK TABLES `staff_rep` WRITE;
/*!40000 ALTER TABLE `staff_rep` DISABLE KEYS */;
INSERT INTO `staff_rep` VALUES ('Mukesh8800','@1001'),('Neil5061','$1084'),('Nitin8493','#3932');
/*!40000 ALTER TABLE `staff_rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_electives`
--

DROP TABLE IF EXISTS `stud_electives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_electives` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `course_id` tinyint(4) NOT NULL,
  `title` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_electives`
--

LOCK TABLES `stud_electives` WRITE;
/*!40000 ALTER TABLE `stud_electives` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_electives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_extracurricular`
--

DROP TABLE IF EXISTS `stud_extracurricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_extracurricular` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `title` tinyint(4) NOT NULL,
  `description` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_extracurricular`
--

LOCK TABLES `stud_extracurricular` WRITE;
/*!40000 ALTER TABLE `stud_extracurricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_extracurricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_grades`
--

DROP TABLE IF EXISTS `stud_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_grades` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `sem1` tinyint(4) NOT NULL,
  `sem2` tinyint(4) NOT NULL,
  `sem3` tinyint(4) NOT NULL,
  `sem4` tinyint(4) NOT NULL,
  `sem5` tinyint(4) NOT NULL,
  `sem6` tinyint(4) NOT NULL,
  `sem7` tinyint(4) NOT NULL,
  `sem8` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_grades`
--

LOCK TABLES `stud_grades` WRITE;
/*!40000 ALTER TABLE `stud_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_por`
--

DROP TABLE IF EXISTS `stud_por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_por` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `description` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_por`
--

LOCK TABLES `stud_por` WRITE;
/*!40000 ALTER TABLE `stud_por` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_por` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_profile`
--

DROP TABLE IF EXISTS `stud_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_profile` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `dob` tinyint(4) NOT NULL,
  `jee_rank` tinyint(4) NOT NULL,
  `nationality` tinyint(4) NOT NULL,
  `admission_year` tinyint(4) NOT NULL,
  `stream` tinyint(4) NOT NULL,
  `branch` tinyint(4) NOT NULL,
  `admission_cat` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_profile`
--

LOCK TABLES `stud_profile` WRITE;
/*!40000 ALTER TABLE `stud_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_project`
--

DROP TABLE IF EXISTS `stud_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_project` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `title` tinyint(4) NOT NULL,
  `description` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_project`
--

LOCK TABLES `stud_project` WRITE;
/*!40000 ALTER TABLE `stud_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_technical_skills`
--

DROP TABLE IF EXISTS `stud_technical_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_technical_skills` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `title` tinyint(4) NOT NULL,
  `description` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_technical_skills`
--

LOCK TABLES `stud_technical_skills` WRITE;
/*!40000 ALTER TABLE `stud_technical_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_technical_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_verified`
--

DROP TABLE IF EXISTS `stud_verified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_verified` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `verified` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_verified`
--

LOCK TABLES `stud_verified` WRITE;
/*!40000 ALTER TABLE `stud_verified` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_verified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mail_id` varchar(30) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `applicability` tinyint(1) NOT NULL DEFAULT 1,
  `admission_year` year(4) NOT NULL,
  `verified` tinyint(1) DEFAULT 1,
  `tenth_percent` decimal(4,2) NOT NULL,
  `tenth_school` varchar(50) NOT NULL,
  `tenth_board` varchar(30) NOT NULL,
  `twelth_percent` decimal(4,2) NOT NULL,
  `twelth_school` varchar(50) NOT NULL,
  `twelth_board` varchar(30) NOT NULL,
  `admission_cat` varchar(10) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `jee_rank` int(10) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `stream` varchar(20) NOT NULL,
  `semester` enum('1','2','3','4','5','6') DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('111701011','Devansh Rathore','111701011@smail.iitpkd.ac.in','dev111',1,2017,1,95.00,'DPS Aligarh, UP','CBSE',91.40,'OPJMS Hisar, Haryana','CBSE','General','CSE',4633,'1999-06-19','India','8078448422','Houseno. 58, Patel Nagar, Bhatinda, Punjab','B.Tech','6'),('111701013','Himanshu Jain','111701013@smail.iitpkd.ac.in','kdhhg',1,2017,1,50.00,'St. Anselms North City School','CBSE',50.00,'St. Anselms North City School','CBSE','GEN','CSE',1,'1999-01-03','Indian','9920472047','69, Narayan Dham, Niwaru Road','B.Tech','6'),('111701018','Sneha Jain','111701018@smail.iitpkd.ac.in','$neha',1,2019,1,90.90,'Carmel Convent Higher Sec School','CBSE',94.90,'Gyan Sagar Academy','CBSE','General','CSE',999,'2000-01-18','India','9999955555','58 Shri Krishna Colony Ankpath Marg Ujjain MP','BTech','2'),('111701019','Suresh Gupta','111701019@smail.iitpkd.ac.in','$uresh',1,2019,1,80.90,'Saint Merry School','CBSE',91.90,'Gyan Sagar Academy','CBSE','General','EE',1010,'2000-01-18','India','9999965555','58 Shri Krishna Colony Ankpath Marg Indore MP','BTech','2'),('111701020','Supriya S','111701020@smail.iitpkd.ac.in','$upriy@',1,2017,1,89.90,'Carmel Convent Higher Sec School','CBSE',90.90,'Gyan Sagar Girls Academy','CBSE','General','CE',1199,'2000-01-18','India','9999945555','60 Shri Krishna Colony Ankpath Marg Ujjain MP','BTech','6');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_rep`
--

DROP TABLE IF EXISTS `student_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_rep` (
  `student_rep_id` varchar(10) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`student_rep_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_rep_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_rep`
--

LOCK TABLES `student_rep` WRITE;
/*!40000 ALTER TABLE `student_rep` DISABLE KEYS */;
INSERT INTO `student_rep` VALUES ('shruti27','111701011','shruti@27'),('Sneha','111701018','$neha');
/*!40000 ALTER TABLE `student_rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenth_twelth`
--

DROP TABLE IF EXISTS `tenth_twelth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenth_twelth` (
  `student_id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `admission_year` tinyint(4) NOT NULL,
  `tenth_percent` tinyint(4) NOT NULL,
  `tenth_school` tinyint(4) NOT NULL,
  `tenth_board` tinyint(4) NOT NULL,
  `twelth_percent` tinyint(4) NOT NULL,
  `twelth_school` tinyint(4) NOT NULL,
  `twelth_board` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenth_twelth`
--

LOCK TABLES `tenth_twelth` WRITE;
/*!40000 ALTER TABLE `tenth_twelth` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenth_twelth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpo`
--

DROP TABLE IF EXISTS `tpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpo` (
  `tpo_id` varchar(20) NOT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`tpo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpo`
--

LOCK TABLES `tpo` WRITE;
/*!40000 ALTER TABLE `tpo` DISABLE KEYS */;
INSERT INTO `tpo` VALUES ('231701013','password','Santhosh','231701013@smail.iitpkd.ac.in','934301','2016-02-01',NULL);
/*!40000 ALTER TABLE `tpo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-22  1:24:43
