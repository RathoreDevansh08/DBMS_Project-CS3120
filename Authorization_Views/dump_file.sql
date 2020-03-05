-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cdc
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
INSERT INTO `applied` VALUES ('111701011','I0010','Software','verified','6','CORE'),('111701018','I1101','IT','Selected','Second','CORE'),('111701019','I1104','IT','Selected','Second','CORE'),('111701020','I1105','IT','Selected','Final','CORE');
/*!40000 ALTER TABLE `applied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `applied_view`
--

DROP TABLE IF EXISTS `applied_view`;
/*!50001 DROP VIEW IF EXISTS `applied_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `applied_view` (
  `student_id` tinyint NOT NULL,
  `student_name` tinyint NOT NULL,
  `branch` tinyint NOT NULL,
  `company_id` tinyint NOT NULL,
  `company_name` tinyint NOT NULL,
  `semester` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('10101','Microsoft','@#$%','9 Ujjain Madhya Pradesh','develop computer software'),('10102','Google','google','20 Delhi Delhi','develop computer softwares'),('10103','Detect Technologh','detect','9 Chennai Tamil Nadu','develop, manufacture drones'),('10104','Arista Networks','arista','Banglore Karnataka','develop networking related softwares'),('10105','L&T','lnt','9 Jaipur Rajasthan','Construction of buildings and dams'),('10106','Google','password','USA','Largest growing tech company in the world'),('10107','GE','GE@101','IT Park, Bangalore','Electronic gadgets'),('10108','MW','MW@102','IT Park, Bangalore','Math softwares');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `company_elig_view`
--

DROP TABLE IF EXISTS `company_elig_view`;
/*!50001 DROP VIEW IF EXISTS `company_elig_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `company_elig_view` (
  `company_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `eligibility` tinyint NOT NULL,
  `start_date` tinyint NOT NULL,
  `end_date` tinyint NOT NULL,
  `stipend` tinyint NOT NULL,
  `deadline` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `company_prof_view`
--

DROP TABLE IF EXISTS `company_prof_view`;
/*!50001 DROP VIEW IF EXISTS `company_prof_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `company_prof_view` (
  `company_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `about` tinyint NOT NULL,
  `location` tinyint NOT NULL,
  `required_skills` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `company_req` VALUES ('I0009','10106','IQ','4th year CSE 6th year CSE','B.Tech',2,100000,'2020-05-01','2020-08-01','2020-02-20'),('I0010','10107','C++, ML','CSE','B.Tech 4th year',10,80000,'2020-05-01','2020-07-01','2019-10-01'),('I0011','10108','Python, ML, Web','CSE','B.Tech 3rd year',5,70000,'2020-05-01','2020-08-01','2019-10-05'),('I1101','10101','Competitive Coding','1st year CSE, 2nd year CSE, 3rd year CSE','BTech',3,120000,'2020-05-05','2020-08-08','2020-04-04'),('I1102','10102','Competitive Coding','1st year CSE, 2nd year CSE, 3rd year CSE','BTech',3,150000,'2020-05-05','2020-08-08','2020-04-04'),('I1103','10103','Competitive Coding','1st year CSE, 2nd year CSE, 3rd year CSE','BTech',3,160000,'2020-05-05','2020-08-08','2020-04-04'),('I1104','10104','Competitive Coding','1st year CSE, 2nd year CSE, 3rd year CSE','BTech',3,170000,'2020-05-05','2020-08-08','2020-04-04'),('I1105','10105','Known Structural Analysis','1st year CSE, 2nd year CSE, 3rd year CSE','BTech',3,120000,'2020-05-05','2020-08-08','2020-04-04');
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
-- Temporary table structure for view `msg_fromcomp_view`
--

DROP TABLE IF EXISTS `msg_fromcomp_view`;
/*!50001 DROP VIEW IF EXISTS `msg_fromcomp_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_fromcomp_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_fromstaffrep_view`
--

DROP TABLE IF EXISTS `msg_fromstaffrep_view`;
/*!50001 DROP VIEW IF EXISTS `msg_fromstaffrep_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_fromstaffrep_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_fromstud_view`
--

DROP TABLE IF EXISTS `msg_fromstud_view`;
/*!50001 DROP VIEW IF EXISTS `msg_fromstud_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_fromstud_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_fromstudrep_view`
--

DROP TABLE IF EXISTS `msg_fromstudrep_view`;
/*!50001 DROP VIEW IF EXISTS `msg_fromstudrep_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_fromstudrep_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_fromtpo_view`
--

DROP TABLE IF EXISTS `msg_fromtpo_view`;
/*!50001 DROP VIEW IF EXISTS `msg_fromtpo_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_fromtpo_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_tocomp_view`
--

DROP TABLE IF EXISTS `msg_tocomp_view`;
/*!50001 DROP VIEW IF EXISTS `msg_tocomp_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_tocomp_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_tostaffrep_view`
--

DROP TABLE IF EXISTS `msg_tostaffrep_view`;
/*!50001 DROP VIEW IF EXISTS `msg_tostaffrep_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_tostaffrep_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_tostud_view`
--

DROP TABLE IF EXISTS `msg_tostud_view`;
/*!50001 DROP VIEW IF EXISTS `msg_tostud_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_tostud_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_tostudrep_view`
--

DROP TABLE IF EXISTS `msg_tostudrep_view`;
/*!50001 DROP VIEW IF EXISTS `msg_tostudrep_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_tostudrep_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `msg_totpo_view`
--

DROP TABLE IF EXISTS `msg_totpo_view`;
/*!50001 DROP VIEW IF EXISTS `msg_totpo_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `msg_totpo_view` (
  `message_id` tinyint NOT NULL,
  `not_from` tinyint NOT NULL,
  `not_to` tinyint NOT NULL,
  `notice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `notifications` VALUES ('000111','tpo','111701013',NULL),('MS1107','231701013','111701018',NULL),('MS1108','111701011','shruti27',NULL),('MS1109','111701013','Nitin8493',NULL);
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
INSERT INTO `selected` VALUES ('111701011','I0011','5','Electronic','CORE'),('111701013','I0009','6','IT','core');
/*!40000 ALTER TABLE `selected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `selected_view`
--

DROP TABLE IF EXISTS `selected_view`;
/*!50001 DROP VIEW IF EXISTS `selected_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `selected_view` (
  `student_id` tinyint NOT NULL,
  `student_name` tinyint NOT NULL,
  `branch` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `company_id` tinyint NOT NULL,
  `company_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
-- Temporary table structure for view `stud_electives`
--

DROP TABLE IF EXISTS `stud_electives`;
/*!50001 DROP VIEW IF EXISTS `stud_electives`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_electives` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud_extracurricular`
--

DROP TABLE IF EXISTS `stud_extracurricular`;
/*!50001 DROP VIEW IF EXISTS `stud_extracurricular`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_extracurricular` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud_grades`
--

DROP TABLE IF EXISTS `stud_grades`;
/*!50001 DROP VIEW IF EXISTS `stud_grades`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_grades` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `sem1` tinyint NOT NULL,
  `sem2` tinyint NOT NULL,
  `sem3` tinyint NOT NULL,
  `sem4` tinyint NOT NULL,
  `sem5` tinyint NOT NULL,
  `sem6` tinyint NOT NULL,
  `sem7` tinyint NOT NULL,
  `sem8` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud_por`
--

DROP TABLE IF EXISTS `stud_por`;
/*!50001 DROP VIEW IF EXISTS `stud_por`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_por` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud_profile`
--

DROP TABLE IF EXISTS `stud_profile`;
/*!50001 DROP VIEW IF EXISTS `stud_profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_profile` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `dob` tinyint NOT NULL,
  `jee_rank` tinyint NOT NULL,
  `nationality` tinyint NOT NULL,
  `admission_year` tinyint NOT NULL,
  `stream` tinyint NOT NULL,
  `branch` tinyint NOT NULL,
  `admission_cat` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud_project`
--

DROP TABLE IF EXISTS `stud_project`;
/*!50001 DROP VIEW IF EXISTS `stud_project`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_project` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud_technical_skills`
--

DROP TABLE IF EXISTS `stud_technical_skills`;
/*!50001 DROP VIEW IF EXISTS `stud_technical_skills`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_technical_skills` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stud_verified`
--

DROP TABLE IF EXISTS `stud_verified`;
/*!50001 DROP VIEW IF EXISTS `stud_verified`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stud_verified` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `verified` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('111701011','Devansh Rathore','111701011@smail.iitpkd.ac.in','dev111',1,2017,1,95.00,'DPS Aligarh, UP','CBSE',91.40,'OPJMS Hisar, Haryana','CBSE','General','CSE',4633,'1999-06-19','India','8078448422','Houseno. 58, Patel Nagar, Bhatinda, Punjab','B.Tech'),('111701013','Himanshu Jain','111701013@smail.iitpkd.ac.in','kdhhg',1,2017,1,50.00,'St. Anselms North City School','CBSE',50.00,'St. Anselms North City School','CBSE','GEN','CSE',1,'1999-01-03','Indian','9920472047','69, Narayan Dham, Niwaru Road','B.Tech'),('111701018','Sneha Jain','111701018@smail.iitpkd.ac.in','$neha',1,2019,1,90.90,'Carmel Convent Higher Sec School','CBSE',94.90,'Gyan Sagar Academy','CBSE','General','CSE',999,'2000-01-18','India','9999955555','58 Shri Krishna Colony Ankpath Marg Ujjain MP','BTech'),('111701019','Suresh Gupta','111701019@smail.iitpkd.ac.in','$uresh',1,2019,1,80.90,'Saint Merry School','CBSE',91.90,'Gyan Sagar Academy','CBSE','General','EE',1010,'2000-01-18','India','9999965555','58 Shri Krishna Colony Ankpath Marg Indore MP','BTech'),('111701020','Supriya S','111701020@smail.iitpkd.ac.in','$upriy@',1,2017,1,89.90,'Carmel Convent Higher Sec School','CBSE',90.90,'Gyan Sagar Girls Academy','CBSE','General','CE',1199,'2000-01-18','India','9999945555','60 Shri Krishna Colony Ankpath Marg Ujjain MP','BTech');
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
-- Table structure for table `technical_skills`
--

DROP TABLE IF EXISTS `technical_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technical_skills` (
  `student_id` varchar(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`title`),
  CONSTRAINT `technical_skills_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical_skills`
--

LOCK TABLES `technical_skills` WRITE;
/*!40000 ALTER TABLE `technical_skills` DISABLE KEYS */;
INSERT INTO `technical_skills` VALUES ('111701011','Competitive Programming','Codechef, Codeforces'),('111701013','Programming Languages','C C++ Python'),('111701018','Competitive Programmer','Chefcode, Codeforces'),('111701018','Computer Lab Admin','Lab admin'),('111701019','3D printer','Hands on 3D printer'),('111701019','Competitive Programmer','Chefcode, Codeforces');
/*!40000 ALTER TABLE `technical_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tenth_twelth`
--

DROP TABLE IF EXISTS `tenth_twelth`;
/*!50001 DROP VIEW IF EXISTS `tenth_twelth`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `tenth_twelth` (
  `student_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `admission_year` tinyint NOT NULL,
  `tenth_percent` tinyint NOT NULL,
  `tenth_school` tinyint NOT NULL,
  `tenth_board` tinyint NOT NULL,
  `twelth_percent` tinyint NOT NULL,
  `twelth_school` tinyint NOT NULL,
  `twelth_board` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tpo`
--

DROP TABLE IF EXISTS `tpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpo` (
  `tpo_id` varchar(10) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`tpo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpo`
--

LOCK TABLES `tpo` WRITE;
/*!40000 ALTER TABLE `tpo` DISABLE KEYS */;
INSERT INTO `tpo` VALUES ('231701013','password','Santhosh Kumar');
/*!40000 ALTER TABLE `tpo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `applied_view`
--

/*!50001 DROP TABLE IF EXISTS `applied_view`*/;
/*!50001 DROP VIEW IF EXISTS `applied_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `applied_view` AS select `applied`.`student_id` AS `student_id`,`student`.`name` AS `student_name`,`student`.`branch` AS `branch`,`company`.`company_id` AS `company_id`,`company`.`name` AS `company_name`,`applied`.`semester` AS `semester`,`applied`.`status` AS `status` from ((`applied` join `student` on(`applied`.`student_id` = `student`.`student_id`)) join `company` on(`student`.`name` = `company`.`name` and `student`.`pass` = `company`.`pass`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `company_elig_view`
--

/*!50001 DROP TABLE IF EXISTS `company_elig_view`*/;
/*!50001 DROP VIEW IF EXISTS `company_elig_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `company_elig_view` AS select `company`.`company_id` AS `company_id`,`company`.`name` AS `name`,`company_req`.`eligibility` AS `eligibility`,`company_req`.`start_date` AS `start_date`,`company_req`.`end_date` AS `end_date`,`company_req`.`stipend` AS `stipend`,`company_req`.`deadline` AS `deadline` from (`company` join `company_req` on(`company`.`company_id` = `company_req`.`company_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `company_prof_view`
--

/*!50001 DROP TABLE IF EXISTS `company_prof_view`*/;
/*!50001 DROP VIEW IF EXISTS `company_prof_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `company_prof_view` AS select `company`.`company_id` AS `company_id`,`company`.`name` AS `name`,`company`.`about` AS `about`,`company`.`location` AS `location`,`company_req`.`required_skills` AS `required_skills` from (`company` join `company_req` on(`company`.`company_id` = `company_req`.`company_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_fromcomp_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_fromcomp_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_fromcomp_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_fromcomp_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_from` in (select `company`.`company_id` from `company`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_fromstaffrep_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_fromstaffrep_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_fromstaffrep_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_fromstaffrep_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_from` in (select `staff_rep`.`staff_id` from `staff_rep`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_fromstud_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_fromstud_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_fromstud_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_fromstud_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_from` in (select `student`.`student_id` from `student`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_fromstudrep_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_fromstudrep_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_fromstudrep_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_fromstudrep_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_from` in (select `student_rep`.`student_rep_id` from `student_rep`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_fromtpo_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_fromtpo_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_fromtpo_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_fromtpo_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_from` in (select `tpo`.`tpo_id` from `tpo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_tocomp_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_tocomp_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_tocomp_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_tocomp_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_to` in (select `company`.`company_id` from `company`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_tostaffrep_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_tostaffrep_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_tostaffrep_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_tostaffrep_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_to` in (select `staff_rep`.`staff_id` from `staff_rep`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_tostud_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_tostud_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_tostud_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_tostud_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_to` in (select `student`.`student_id` from `student`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_tostudrep_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_tostudrep_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_tostudrep_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_tostudrep_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_to` in (select `student_rep`.`student_rep_id` from `student_rep`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_totpo_view`
--

/*!50001 DROP TABLE IF EXISTS `msg_totpo_view`*/;
/*!50001 DROP VIEW IF EXISTS `msg_totpo_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_totpo_view` AS (select `notifications`.`message_id` AS `message_id`,`notifications`.`not_from` AS `not_from`,`notifications`.`not_to` AS `not_to`,`notifications`.`notice` AS `notice` from `notifications` where `notifications`.`not_to` in (select `tpo`.`tpo_id` from `tpo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `selected_view`
--

/*!50001 DROP TABLE IF EXISTS `selected_view`*/;
/*!50001 DROP VIEW IF EXISTS `selected_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `selected_view` AS select `selected`.`student_id` AS `student_id`,`student`.`name` AS `student_name`,`student`.`branch` AS `branch`,`selected`.`type` AS `type`,`company`.`company_id` AS `company_id`,`company`.`name` AS `company_name` from ((`selected` join `student` on(`selected`.`student_id` = `student`.`student_id`)) join `company` on(`student`.`name` = `company`.`name` and `student`.`pass` = `company`.`pass`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_electives`
--

/*!50001 DROP TABLE IF EXISTS `stud_electives`*/;
/*!50001 DROP VIEW IF EXISTS `stud_electives`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_electives` AS (select `S`.`student_id` AS `student_id`,`S`.`name` AS `name`,`E`.`course_id` AS `course_id`,`E`.`title` AS `title` from (`student` `S` join `electives` `E`) where `S`.`student_id` = `E`.`student_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_extracurricular`
--

/*!50001 DROP TABLE IF EXISTS `stud_extracurricular`*/;
/*!50001 DROP VIEW IF EXISTS `stud_extracurricular`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_extracurricular` AS (select `student`.`student_id` AS `student_id`,`student`.`name` AS `name`,`extracurricular`.`title` AS `title`,`extracurricular`.`description` AS `description` from (`student` join `extracurricular` on(`student`.`student_id` = `extracurricular`.`student_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_grades`
--

/*!50001 DROP TABLE IF EXISTS `stud_grades`*/;
/*!50001 DROP VIEW IF EXISTS `stud_grades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_grades` AS (select `S`.`student_id` AS `student_id`,`S`.`name` AS `name`,`G`.`sem1` AS `sem1`,`G`.`sem2` AS `sem2`,`G`.`sem3` AS `sem3`,`G`.`sem4` AS `sem4`,`G`.`sem5` AS `sem5`,`G`.`sem6` AS `sem6`,`G`.`sem7` AS `sem7`,`G`.`sem8` AS `sem8` from (`student` `S` join `grades` `G`) where `S`.`student_id` = `G`.`student_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_por`
--

/*!50001 DROP TABLE IF EXISTS `stud_por`*/;
/*!50001 DROP VIEW IF EXISTS `stud_por`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_por` AS (select `student`.`student_id` AS `student_id`,`student`.`name` AS `name`,`por`.`description` AS `description` from (`student` join `por` on(`student`.`student_id` = `por`.`student_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_profile`
--

/*!50001 DROP TABLE IF EXISTS `stud_profile`*/;
/*!50001 DROP VIEW IF EXISTS `stud_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_profile` AS (select `student`.`student_id` AS `student_id`,`student`.`name` AS `name`,`student`.`dob` AS `dob`,`student`.`jee_rank` AS `jee_rank`,`student`.`nationality` AS `nationality`,`student`.`admission_year` AS `admission_year`,`student`.`stream` AS `stream`,`student`.`branch` AS `branch`,`student`.`admission_cat` AS `admission_cat` from `student`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_project`
--

/*!50001 DROP TABLE IF EXISTS `stud_project`*/;
/*!50001 DROP VIEW IF EXISTS `stud_project`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_project` AS (select `S`.`student_id` AS `student_id`,`S`.`name` AS `name`,`P`.`title` AS `title`,`P`.`description` AS `description` from (`student` `S` join `project` `P`) where `S`.`student_id` = `P`.`student_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_technical_skills`
--

/*!50001 DROP TABLE IF EXISTS `stud_technical_skills`*/;
/*!50001 DROP VIEW IF EXISTS `stud_technical_skills`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_technical_skills` AS (select `student`.`student_id` AS `student_id`,`student`.`name` AS `name`,`technical_skills`.`title` AS `title`,`technical_skills`.`description` AS `description` from (`student` join `technical_skills` on(`student`.`student_id` = `technical_skills`.`student_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stud_verified`
--

/*!50001 DROP TABLE IF EXISTS `stud_verified`*/;
/*!50001 DROP VIEW IF EXISTS `stud_verified`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stud_verified` AS (select `student`.`student_id` AS `student_id`,`student`.`name` AS `name`,`student`.`verified` AS `verified` from `student`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tenth_twelth`
--

/*!50001 DROP TABLE IF EXISTS `tenth_twelth`*/;
/*!50001 DROP VIEW IF EXISTS `tenth_twelth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tenth_twelth` AS (select `student`.`student_id` AS `student_id`,`student`.`name` AS `name`,`student`.`admission_year` AS `admission_year`,`student`.`tenth_percent` AS `tenth_percent`,`student`.`tenth_school` AS `tenth_school`,`student`.`tenth_board` AS `tenth_board`,`student`.`twelth_percent` AS `twelth_percent`,`student`.`twelth_school` AS `twelth_school`,`student`.`twelth_board` AS `twelth_board` from `student`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-17 22:50:21
