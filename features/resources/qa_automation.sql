-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: online_at_auto_snapshot
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `access_right`
--

DROP TABLE IF EXISTS `access_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_right` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='A dictionary of all access rights used by system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_right`
--

LOCK TABLES `access_right` WRITE;
/*!40000 ALTER TABLE `access_right` DISABLE KEYS */;
INSERT INTO `access_right` VALUES (5,'system.manage_users'),(8,'reporting.generate_money_reports'),(9,'user.submit_time_track'),(10,'user.lock_time_track'),(11,'system.manage_general_settings'),(12,'user.submit_other_time_track'),(14,'system.manage_pto_and_sick'),(20,'role.account_settings_manager'),(21,'role.leave_time_manager'),(22,'role.leave_balance_manager'),(23,'access_rights.edit_hierarchy'),(24,'access_rights.manage_license');
/*!40000 ALTER TABLE `access_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activation_info`
--

DROP TABLE IF EXISTS `activation_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activation_info` (
  `user_id` int(3) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` int(3) unsigned NOT NULL,
  `product_name` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `token` (`token`),
  CONSTRAINT `fk_activate_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activation_info`
--

LOCK TABLES `activation_info` WRITE;
/*!40000 ALTER TABLE `activation_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `activation_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_leave_status`
--

DROP TABLE IF EXISTS `ap_leave_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_leave_status` (
  `user_id` int(3) unsigned NOT NULL,
  `status_type` int(3) unsigned NOT NULL,
  `status_date` date NOT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`user_id`,`status_date`),
  CONSTRAINT `fk_ap_absence_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_leave_status`
--

LOCK TABLES `ap_leave_status` WRITE;
/*!40000 ALTER TABLE `ap_leave_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_leave_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_mobile_notification`
--

DROP TABLE IF EXISTS `ap_mobile_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_mobile_notification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(3) unsigned NOT NULL,
  `leave_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ap_mobile_notification_user_id` (`user_id`),
  CONSTRAINT `fk_ap_mobile_notification_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_mobile_notification`
--

LOCK TABLES `ap_mobile_notification` WRITE;
/*!40000 ALTER TABLE `ap_mobile_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_mobile_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `at_user`
--

DROP TABLE IF EXISTS `at_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_user` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username_lower` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5_password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `overtime_tracking` tinyint(1) DEFAULT NULL,
  `overtime_level` int(11) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `release_date` date DEFAULT NULL,
  `user_group_id` int(3) unsigned DEFAULT NULL,
  `is_enabled_ap` tinyint(1) NOT NULL DEFAULT '0',
  `first_name_lower` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name_lower` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `middle_name_lower` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial_schedule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_schedule_total` int(3) unsigned NOT NULL,
  `is_default_initial_schedule` tinyint(1) NOT NULL,
  `requires_ltr_approval` tinyint(1) NOT NULL DEFAULT '0',
  `is_pto` tinyint(1) NOT NULL DEFAULT '0',
  `def_pto_rules` tinyint(1) NOT NULL DEFAULT '1',
  `keep_all_tasks_from_previous_week` tinyint(1) NOT NULL DEFAULT '0',
  `requires_tt_approval` tinyint(1) NOT NULL DEFAULT '0',
  `manage_all_users_ltr` tinyint(1) NOT NULL DEFAULT '0',
  `is_sick` tinyint(1) NOT NULL DEFAULT '0',
  `def_sick_rules` tinyint(1) NOT NULL DEFAULT '1',
  `is_activated` tinyint(1) NOT NULL DEFAULT '1',
  `time_zone_group_id` int(3) NOT NULL DEFAULT '-1',
  `receive_user_changes_notification` tinyint(1) NOT NULL DEFAULT '1',
  `team_assignment_type` int(3) NOT NULL DEFAULT '0',
  `management_assignments_selection` int(3) NOT NULL DEFAULT '0',
  `receive_comments_changes_notification` tinyint(1) DEFAULT '1',
  `is_password_matches_policy` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username_lower`),
  KEY `is_enabled` (`is_enabled`),
  KEY `fk_at_user_user_group` (`user_group_id`),
  KEY `is_pto` (`is_pto`),
  KEY `is_sick` (`is_sick`),
  KEY `fk_at_user_time_zone_group` (`time_zone_group_id`),
  CONSTRAINT `fk_at_user_revision` FOREIGN KEY (`id`) REFERENCES `at_user_revision` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `fk_at_user_time_zone_group` FOREIGN KEY (`time_zone_group_id`) REFERENCES `time_zone_group` (`id`),
  CONSTRAINT `fk_at_user_user_group` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='User';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `at_user`
--

LOCK TABLES `at_user` WRITE;
/*!40000 ALTER TABLE `at_user` DISABLE KEYS */;
INSERT INTO `at_user` VALUES (1,'admin','admin','1d0258c2440a8d19e716292b231e3190','Robert','','Barber','demodata@actitime.com',1,1,1,0,'2018-12-05',NULL,4,1,'robert','barber','','0,360,360,360,360,360,0',1800,0,1,1,0,0,1,1,1,0,1,-1,1,1,1,1,0),(2,'user','user','ee11cbb19052e40b07aac0ca060c23ee','Roy','','O\'Dowd','demodata@actitime.com',1,1,0,0,'2018-12-05',NULL,3,1,'roy','o\'dowd','','0,480,480,480,480,480,0',2400,0,1,1,1,0,1,0,1,1,1,-1,1,0,0,1,0),(4,'designer','designer','230ace927da4bb74817fa22adc663e0a','Maurice','','Gibson','demodata@actitime.com',1,1,0,0,'2018-12-05',NULL,2,1,'maurice','gibson','','0,480,480,480,480,480,0',2400,1,1,1,1,0,1,0,1,1,1,2,1,0,0,1,0),(5,'pm','pm','5109d85d95fece7816d9704e6e5b1279','Jennifer','','Wooster','demodata@actitime.com',0,1,2,0,'2018-12-05','2019-01-04',4,1,'jennifer','wooster','','0,480,480,480,480,480,0',2400,1,0,0,0,0,0,0,0,0,1,-1,1,1,1,1,0),(6,'ui_design','ui_design','bf16acd098dcb77fa0735d225be17411','Melanie','','Stivers','demodata@actitime.com',1,1,0,0,'2019-02-04',NULL,2,1,'melanie','stivers','','0,0,480,480,480,480,480',2400,0,1,1,1,0,1,0,1,1,1,-1,1,0,0,1,0),(7,'project_mng','project_mng','84b5af2f528f8ac81b4837a47c67f976','Gordman','','Cruz','demodata@actitime.com',1,1,2,0,'2019-02-04',NULL,4,1,'gordman','cruz','','0,540,540,540,540,360,0',2520,0,0,1,0,0,0,0,1,0,1,2,1,0,0,1,0),(8,'frontender','frontender','b6982a73124c3faefe629e6bf549defc','Bruno','','Moss','demodata@actitime.com',1,1,0,0,'2019-02-04',NULL,3,1,'bruno','moss','','0,480,480,480,480,480,0',2400,1,1,1,1,0,1,0,1,1,1,2,1,0,0,1,0),(9,'F&A','f&a','f855677fcde519b175d5259f94d72c0a','Barbara','','Kloss','demodata@actitime.com',1,1,2,0,'2018-12-05',NULL,4,1,'barbara','kloss','','0,240,240,240,240,240,0',1200,0,0,1,0,0,0,1,1,0,1,3,1,1,1,1,0),(10,'intern','intern','081d29b9330707cc21a1bf4132f7d3f7','Ronald','','Venson','demodata@actitime.com',1,0,0,0,'2019-02-04',NULL,3,1,'ronald','venson','','0,480,480,480,480,240,0',2160,0,1,0,0,0,1,0,0,0,1,3,1,0,0,1,0),(11,'copywriter','copywriter','300a2bd0eacfbf3cf0849cdea7b56c00','Brian','','Timmers','demodata@actitime.com',1,1,0,0,'2019-02-18',NULL,2,1,'brian','timmers','','0,240,240,240,240,240,0',1200,0,1,1,0,0,1,0,1,0,1,3,1,0,0,1,0);
/*!40000 ALTER TABLE `at_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `at_user_bindings`
--

DROP TABLE IF EXISTS `at_user_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_user_bindings` (
  `identity_provider_id` int(11) NOT NULL,
  `user_id` int(3) unsigned NOT NULL,
  `external_user_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_is_active` bit(1) DEFAULT b'0',
  `external_is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`identity_provider_id`,`user_id`),
  KEY `fk_binding_user` (`user_id`),
  CONSTRAINT `fk_binding_scim_client` FOREIGN KEY (`identity_provider_id`) REFERENCES `scim_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_binding_user` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `at_user_bindings`
--

LOCK TABLES `at_user_bindings` WRITE;
/*!40000 ALTER TABLE `at_user_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `at_user_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `at_user_revision`
--

DROP TABLE IF EXISTS `at_user_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `at_user_revision` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_revision_value` (`revision`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `at_user_revision`
--

LOCK TABLES `at_user_revision` WRITE;
/*!40000 ALTER TABLE `at_user_revision` DISABLE KEYS */;
INSERT INTO `at_user_revision` VALUES (9,1144),(1,1145),(7,1147),(4,1148),(8,1149),(2,1150),(6,1151),(11,1152),(5,1178),(10,1179),(12,1246),(13,1247),(14,1248),(15,1288),(17,1289),(20,1290);
/*!40000 ALTER TABLE `at_user_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_action`
--

DROP TABLE IF EXISTS `audit_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `source` tinyint(3) NOT NULL DEFAULT '0',
  `subject_id` int(10) unsigned DEFAULT NULL,
  `subject_type` tinyint(3) unsigned DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `object_type` tinyint(3) unsigned DEFAULT NULL,
  `data` text,
  `timestamp` datetime NOT NULL,
  `cause_id` int(10) unsigned DEFAULT NULL,
  `is_cause` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_index` (`subject_id`,`subject_type`),
  KEY `object_index` (`object_id`,`object_type`),
  KEY `timestamp_index` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_action`
--

LOCK TABLES `audit_action` WRITE;
/*!40000 ALTER TABLE `audit_action` DISABLE KEYS */;
INSERT INTO `audit_action` VALUES (1,1,0,1,6,3,1,'null','2019-02-04 09:30:00',NULL,_binary '\0'),(2,8,0,7,6,3,1,'{\"oldDescription\":\"\",\"newDescription\":\"Design-oriented architecture agency specializing in residential estate and renovation. Needs a one-page web presence. Possible development in the future.\\r\\n\\r\\nAddress: 27511 Garden Ave, Hamilton, New Zealand.\\r\\n\\r\\nContact person: Peter Jackson, c: +1-705-222-15-17\"}','2019-03-04 10:40:00',NULL,_binary '\0'),(3,1,0,1,6,4,1,'null','2018-12-10 12:30:00',NULL,_binary '\0'),(4,4,0,5,6,4,1,'{\"oldName\":\"Sweet Shop Boston\",\"newName\":\"Boston Chocolate\"}','2018-12-17 08:17:00',NULL,_binary '\0'),(5,1,0,5,6,2,1,'null','2018-12-10 11:25:00',NULL,_binary '\0'),(6,6,0,1,6,2,1,'null','2019-01-08 08:17:00',NULL,_binary '\0'),(7,1,0,9,6,5,1,'null','2018-12-10 10:40:00',NULL,_binary '\0'),(8,4,0,9,6,5,1,'{\"oldName\":\"Internal\",\"newName\":\"Our Company\"}','2018-12-17 09:30:00',NULL,_binary '\0'),(9,8,0,1,6,5,1,'{\"oldDescription\":\"\",\"newDescription\":\"This is all about our internal projects and tasks.\"}','2019-03-04 08:17:00',NULL,_binary '\0'),(10,1,0,7,6,5,2,'null','2019-02-04 10:40:00',NULL,_binary '\0'),(11,4,0,7,6,5,2,'{\"oldName\":\"Website Development\",\"newName\":\"One-page website\"}','2019-02-16 09:30:00',NULL,_binary '\0'),(12,1,0,1,6,8,2,'null','2018-12-10 08:17:00',NULL,_binary '\0'),(13,6,0,7,6,8,2,'null','2019-01-02 12:05:00',NULL,_binary '\0'),(14,7,0,1,6,8,2,'null','2019-01-18 10:40:00',NULL,_binary '\0'),(15,1,0,7,6,6,2,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(16,4,0,7,6,6,2,'{\"oldName\":\"Web design project\",\"newName\":\"Website creation\"}','2018-12-17 11:25:00',NULL,_binary '\0'),(17,1,0,1,6,7,2,'null','2019-02-04 09:30:00',NULL,_binary '\0'),(18,8,0,1,6,7,2,'{\"oldDescription\":\"\",\"newDescription\":\"Ongoing website maintenance: security updates, content updates, statistics, SEO\"}','2019-03-04 12:05:00',NULL,_binary '\0'),(19,1,0,5,6,3,2,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(20,6,0,1,6,3,2,'null','2019-01-08 12:05:00',NULL,_binary '\0'),(21,1,0,9,6,10,2,'null','2018-12-10 11:40:00',NULL,_binary '\0'),(22,4,0,9,6,10,2,'{\"oldName\":\"Office life support\",\"newName\":\"Administration\"}','2018-12-17 09:30:00',NULL,_binary '\0'),(23,1,0,9,6,12,2,'null','2018-12-10 08:17:00',NULL,_binary '\0'),(24,4,0,9,6,12,2,'{\"oldName\":\"Bookkeeping\",\"newName\":\"Finance&Accounting\"}','2019-03-04 12:05:00',NULL,_binary '\0'),(25,1,0,9,6,9,2,'null','2018-12-05 11:25:00',NULL,_binary '\0'),(26,8,0,1,6,9,2,'{\"oldDescription\":\"\",\"newDescription\":\"Internal communications, onboarding, employee training\"}','2019-03-04 09:30:00',NULL,_binary '\0'),(27,1,0,1,6,11,2,'null','2018-12-10 11:25:00',NULL,_binary '\0'),(28,8,0,1,6,11,2,'{\"oldDescription\":\"\",\"newDescription\":\"Server support & maintenance, installing and configuring new software\"}','2019-01-18 08:17:00',NULL,_binary '\0'),(29,1,0,6,6,17,3,'null','2019-02-04 11:25:00',NULL,_binary '\0'),(30,9,0,1,6,17,3,'{\"oldDeadline\":\"2017-10-01\",\"newDeadline\":null}','2019-02-11 10:40:00',NULL,_binary '\0'),(31,10,0,6,6,17,3,'{\"oldEstimateTime\":\"3000\",\"newEstimateTime\":\"4800\"}','2019-02-16 11:00:00',NULL,_binary '\0'),(32,1,0,9,6,16,3,'null','2019-03-01 12:05:00',NULL,_binary '\0'),(33,8,0,1,6,16,3,'{\"oldDescription\":\"\",\"newDescription\":\"there\'ll be monthly updates up to the end of the year.\"}','2019-03-03 08:17:00',NULL,_binary '\0'),(34,10,0,8,6,16,3,'{\"oldEstimateTime\":\"300\",\"newEstimateTime\":\"900\"}','2019-03-04 09:30:00',NULL,_binary '\0'),(35,1,0,7,6,41,3,'null','2019-03-04 10:40:00',NULL,_binary '\0'),(36,5,0,7,6,41,3,'{\"oldProjectId\":\"6\",\"oldCustomerId\":\"4\",\"newProjectId\":\"8\",\"newCustomerId\":\"4\"}','2019-03-04 12:05:00',NULL,_binary '\0'),(37,1,0,1,6,42,3,'null','2019-02-17 08:17:00',NULL,_binary '\0'),(38,10,0,7,6,42,3,'{\"oldEstimateTime\":\"180\",\"newEstimateTime\":\"360\"}','2019-02-19 11:25:00',NULL,_binary '\0'),(39,1,0,5,6,69,3,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(40,11,0,7,6,69,3,'{\"oldBillingTypeId\":\"3\",\"newBillingTypeId\":\"2\"}','2019-01-18 10:40:00',NULL,_binary '\0'),(41,1,0,5,6,70,3,'null','2018-12-10 11:25:00',NULL,_binary '\0'),(42,5,0,5,6,70,3,'{\"oldProjectId\":\"6\",\"oldCustomerId\":\"4\",\"newProjectId\":\"8\",\"newCustomerId\":\"4\"}','2018-12-17 08:17:00',NULL,_binary '\0'),(43,1,0,1,6,31,3,'null','2019-02-11 11:25:00',NULL,_binary '\0'),(44,9,0,1,6,31,3,'{\"oldDeadline\":null,\"newDeadline\":\"2017-09-29\"}','2019-02-13 10:40:00',NULL,_binary '\0'),(46,1,0,1,6,29,3,'null','2019-01-18 09:30:00',NULL,_binary '\0'),(47,10,0,1,6,29,3,'{\"oldEstimateTime\":null,\"newEstimateTime\":\"3000\"}','2019-02-02 08:17:00',NULL,_binary '\0'),(48,1,0,4,6,27,3,'null','2019-02-18 12:05:00',NULL,_binary '\0'),(49,5,0,1,6,27,3,'{\"oldProjectId\":\"8\",\"oldCustomerId\":\"4\",\"newProjectId\":\"6\",\"newCustomerId\":\"4\"}','2019-03-03 09:30:00',NULL,_binary '\0'),(50,1,0,1,6,26,3,'null','2019-01-23 10:40:00',NULL,_binary '\0'),(51,11,0,1,6,26,3,'{\"oldBillingTypeId\":\"2\",\"newBillingTypeId\":\"8\"}','2019-02-02 08:17:00',NULL,_binary '\0'),(52,8,0,11,6,26,3,'{\"oldDescription\":\"\",\"newDescription\":\"Home page, product descriptions, brief company history\"}','2019-02-02 09:30:00',NULL,_binary '\0'),(53,1,0,1,6,30,3,'null','2019-01-23 10:40:00',NULL,_binary '\0'),(54,1,0,5,6,28,3,'null','2019-01-02 12:05:00',NULL,_binary '\0'),(56,1,0,4,6,33,3,'null','2019-01-16 12:05:00',NULL,_binary '\0'),(58,1,0,5,6,25,3,'null','2018-12-05 09:30:00',NULL,_binary '\0'),(59,9,0,7,6,25,3,'{\"oldDeadline\":\"2017-10-30\",\"newDeadline\":\"2017-12-15\"}','2019-02-17 08:17:00',NULL,_binary '\0'),(60,5,0,1,6,25,3,'{\"oldProjectId\":\"8\",\"oldCustomerId\":\"4\",\"newProjectId\":\"6\",\"newCustomerId\":\"4\"}','2019-03-03 10:40:00',NULL,_binary '\0'),(61,1,0,5,6,63,3,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(62,11,0,4,6,63,3,'{\"oldBillingTypeId\":\"9\",\"newBillingTypeId\":\"3\"}','2018-12-17 12:05:00',NULL,_binary '\0'),(63,1,0,1,6,32,3,'null','2019-02-04 09:30:00',NULL,_binary '\0'),(64,11,0,2,6,32,3,'{\"oldBillingTypeId\":\"3\",\"newBillingTypeId\":\"1\"}','2019-02-04 10:40:00',NULL,_binary '\0'),(65,1,0,4,6,40,3,'null','2019-01-07 08:17:00',NULL,_binary '\0'),(67,1,0,1,6,34,3,'null','2019-01-07 09:30:00',NULL,_binary '\0'),(68,8,0,2,6,34,3,'{\"oldDescription\":\"\",\"newDescription\":\"We need to select: on-site search engine, charts processor, captcha solution and framework for integration with CMS\"}','2019-01-08 10:40:00',NULL,_binary '\0'),(70,1,0,4,6,77,3,'null','2019-02-04 12:05:00',NULL,_binary '\0'),(71,5,0,1,6,77,3,'{\"oldProjectId\":\"6\",\"oldCustomerId\":\"4\",\"newProjectId\":\"7\",\"newCustomerId\":\"4\"}','2019-03-04 09:30:00',NULL,_binary '\0'),(72,1,0,9,6,68,3,'null','2018-12-10 10:40:00',NULL,_binary '\0'),(73,8,0,1,6,68,3,'{\"oldDescription\":\"\",\"newDescription\":\"Project cost estimations for clients\"}','2018-12-17 09:30:00',NULL,_binary '\0'),(74,1,0,5,6,67,3,'null','2018-12-10 10:40:00',NULL,_binary '\0'),(75,11,0,7,6,67,3,'{\"oldBillingTypeId\":\"3\",\"newBillingTypeId\":\"2\"}','2019-01-18 09:30:00',NULL,_binary '\0'),(76,1,0,9,6,72,3,'null','2018-12-10 12:05:00',NULL,_binary '\0'),(77,1,0,9,6,71,3,'null','2018-12-10 10:40:00',NULL,_binary '\0'),(78,5,0,9,6,71,3,'{\"oldProjectId\":\"10\",\"oldCustomerId\":\"5\",\"newProjectId\":\"12\",\"newCustomerId\":\"5\"}','2018-12-17 12:05:00',NULL,_binary '\0'),(79,1,0,5,6,74,3,'null','2018-12-17 09:30:00',NULL,_binary '\0'),(80,8,0,1,6,74,3,'{\"oldDescription\":\"\",\"newDescription\":\"Monthly reports: Income statement, balance sheet, statement of cash flows\"}','2019-01-02 10:40:00',NULL,_binary '\0'),(81,1,0,9,6,73,3,'null','2018-12-06 11:25:00',NULL,_binary '\0'),(82,4,0,9,6,73,3,'{\"oldName\":\"Payroll calculation\",\"newName\":\"Payroll\"}','2019-02-17 10:40:00',NULL,_binary '\0'),(83,10,0,1,6,73,3,'{\"oldEstimateTime\":\"9000\",\"newEstimateTime\":null}','2019-03-04 12:05:00',NULL,_binary '\0'),(84,1,0,9,6,75,3,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(85,1,0,9,6,36,3,'null','2018-12-10 10:40:00',NULL,_binary '\0'),(86,9,0,1,6,36,3,'{\"oldDeadline\":\"2017-12-31\",\"newDeadline\":null}','2019-02-17 12:05:00',NULL,_binary '\0'),(87,1,0,5,6,37,3,'null','2018-12-12 12:05:00',NULL,_binary '\0'),(88,4,0,1,6,37,3,'{\"oldName\":\"Get-real meetings\",\"newName\":\"Status meetings\"}','2019-01-18 09:30:00',NULL,_binary '\0'),(89,1,0,9,6,35,3,'null','2018-12-10 12:05:00',NULL,_binary '\0'),(90,5,0,9,6,35,3,'{\"oldProjectId\":\"10\",\"oldCustomerId\":\"5\",\"newProjectId\":\"9\",\"newCustomerId\":\"5\"}','2018-12-17 09:30:00',NULL,_binary '\0'),(91,1,0,9,6,79,3,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(92,4,0,1,6,79,3,'{\"oldName\":\"Basic survival course\",\"newName\":\"Training\"}','2019-01-18 12:05:00',NULL,_binary '\0'),(93,1,0,1,6,59,3,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(94,5,0,1,6,59,3,'{\"oldProjectId\":\"9\",\"oldCustomerId\":\"5\",\"newProjectId\":\"11\",\"newCustomerId\":\"5\"}','2018-12-17 12:05:00',NULL,_binary '\0'),(95,1,0,1,6,58,3,'null','2018-12-10 09:30:00',NULL,_binary '\0'),(96,5,0,5,6,58,3,'{\"oldProjectId\":\"9\",\"oldCustomerId\":\"5\",\"newProjectId\":\"11\",\"newCustomerId\":\"5\"}','2018-12-17 12:05:00',NULL,_binary '\0'),(97,1,0,1,6,43,3,'null','2018-12-10 12:05:00',NULL,_binary '\0'),(98,4,0,1,6,43,3,'{\"oldName\":\"Antivirus software\",\"newName\":\"Installing antivirus\"}','2018-12-17 08:17:00',NULL,_binary '\0'),(99,1,0,1,6,61,3,'null','2018-12-10 08:17:00',NULL,_binary '\0'),(100,10,0,1,6,61,3,'{\"oldEstimateTime\":\"3000\",\"newEstimateTime\":null}','2018-12-17 09:30:00',NULL,_binary '\0'),(101,1,0,1,6,62,3,'null','2018-12-05 12:05:00',NULL,_binary '\0'),(102,4,0,1,6,62,3,'{\"oldName\":\"LAN & Wireless support\",\"newName\":\"Network Support\"}','2019-01-17 09:30:00',NULL,_binary '\0'),(103,1,0,5,6,60,3,'null','2018-12-10 08:17:00',NULL,_binary '\0'),(104,5,0,1,6,60,3,'{\"oldProjectId\":\"10\",\"oldCustomerId\":\"5\",\"newProjectId\":\"11\",\"newCustomerId\":\"5\"}','2018-12-17 12:05:00',NULL,_binary '\0'),(105,1,0,1,6,56,3,'null','2019-02-25 09:30:00',NULL,_binary '\0'),(106,11,0,1,6,56,3,'{\"oldBillingTypeId\":\"2\",\"newBillingTypeId\":\"4\"}','2019-02-28 12:05:00',NULL,_binary '\0'),(107,10,0,1,6,56,3,'{\"oldEstimateTime\":\"600\",\"newEstimateTime\":null}','2019-03-03 08:17:00',NULL,_binary '\0'),(108,1,0,1,6,55,3,'null','2019-02-25 08:17:00',NULL,_binary '\0'),(109,10,0,1,6,55,3,'{\"oldEstimateTime\":\"210\",\"newEstimateTime\":\"300\"}','2019-02-26 09:30:00',NULL,_binary '\0'),(111,1,0,1,6,48,3,'null','2018-12-05 12:05:00',NULL,_binary '\0'),(112,10,0,1,6,48,3,'{\"oldEstimateTime\":\"2400\",\"newEstimateTime\":null}','2018-12-17 09:30:00',NULL,_binary '\0'),(113,1,0,1,6,18,3,'null','2019-01-07 12:05:00',NULL,_binary '\0'),(114,10,0,2,6,18,3,'{\"oldEstimateTime\":\"720\",\"newEstimateTime\":\"1440\"}','2019-01-17 09:30:00',NULL,_binary '\0'),(115,1,0,5,6,22,3,'null','2018-12-10 10:40:00',NULL,_binary '\0'),(116,8,0,5,6,22,3,'{\"oldDescription\":\"\",\"newDescription\":\"\"}','2019-01-08 08:17:00',NULL,_binary '\0'),(117,1,0,5,6,39,3,'null','2018-12-10 12:05:00',NULL,_binary '\0'),(118,10,0,5,6,39,3,'{\"oldEstimateTime\":\"600\",\"newEstimateTime\":\"1920\"}','2018-12-17 09:30:00',NULL,_binary '\0'),(119,1,0,5,6,21,3,'null','2018-12-18 09:30:00',NULL,_binary '\0'),(120,1,0,5,6,20,3,'null','2018-12-31 12:05:00',NULL,_binary '\0'),(122,1,0,4,6,65,3,'null','2018-11-21 12:05:00',NULL,_binary '\0'),(123,10,0,4,6,65,3,'{\"oldEstimateTime\":\"1200\",\"newEstimateTime\":\"2700\"}','2018-12-05 08:17:00',NULL,_binary '\0'),(124,1,0,5,6,38,3,'null','2018-12-10 09:30:00',NULL,_binary '\0');
/*!40000 ALTER TABLE `audit_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_action_dep`
--

DROP TABLE IF EXISTS `audit_action_dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_action_dep` (
  `action_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` tinyint(3) unsigned NOT NULL,
  KEY `action_id_index` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_action_dep`
--

LOCK TABLES `audit_action_dep` WRITE;
/*!40000 ALTER TABLE `audit_action_dep` DISABLE KEYS */;
INSERT INTO `audit_action_dep` VALUES (36,8,2),(36,6,2),(36,4,1),(40,3,4),(40,2,4),(42,8,2),(42,6,2),(42,4,1),(49,8,2),(49,6,2),(49,4,1),(51,2,4),(51,8,4),(60,8,2),(60,6,2),(60,4,1),(62,3,4),(62,9,4),(64,3,4),(64,1,4),(71,7,2),(71,6,2),(71,4,1),(75,3,4),(75,2,4),(78,12,2),(78,10,2),(78,5,1),(90,10,2),(90,9,2),(90,5,1),(94,11,2),(94,9,2),(94,5,1),(96,11,2),(96,9,2),(96,5,1),(104,11,2),(104,10,2),(104,5,1),(106,4,4),(106,2,4);
/*!40000 ALTER TABLE `audit_action_dep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_entity`
--

DROP TABLE IF EXISTS `audit_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_entity` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_entity`
--

LOCK TABLES `audit_entity` WRITE;
/*!40000 ALTER TABLE `audit_entity` DISABLE KEYS */;
INSERT INTO `audit_entity` VALUES (1,4,'{\"name\":\"programming\"}'),(1,6,'{\"name\":\"Barber, Robert\"}'),(2,1,'{\"name\":\"Mobile Phone Internet Shop\"}'),(2,4,'{\"name\":\"Non-Billable\"}'),(2,6,'{\"name\":\"O\'Dowd, Roy\"}'),(3,1,'{\"name\":\"Architects Bureau\"}'),(3,2,'{\"name\":\"Updating the current website\"}'),(3,4,'{\"name\":\"design\"}'),(4,1,'{\"name\":\"Boston Chocolate\"}'),(4,4,'{\"name\":\"maintenance\"}'),(4,6,'{\"name\":\"Gibson, Maurice\"}'),(5,1,'{\"name\":\"Our Company\"}'),(5,2,'{\"name\":\"One-page website\"}'),(5,6,'{\"name\":\"Wooster, Jennifer\"}'),(6,2,'{\"name\":\"Website creation\"}'),(6,6,'{\"name\":\"Stivers, Melanie\"}'),(7,2,'{\"name\":\"Website maintenance\"}'),(7,6,'{\"name\":\"Cruz, Gordman\"}'),(8,2,'{\"name\":\"Consulting\"}'),(8,4,'{\"name\":\"writing\"}'),(8,6,'{\"name\":\"Moss, Bruno\"}'),(9,2,'{\"name\":\"General\"}'),(9,4,'{\"name\":\"consulting\"}'),(9,6,'{\"name\":\"Kloss, Barbara\"}'),(10,2,'{\"name\":\"Administration\"}'),(11,2,'{\"name\":\"System Administration\"}'),(11,6,'{\"name\":\"Timmers, Brian\"}'),(12,2,'{\"name\":\"Finance&Accounting\"}'),(16,3,'{\"name\":\"Page updates\"}'),(17,3,'{\"name\":\"Page design\"}'),(18,3,'{\"name\":\"Bug fixing\"}'),(20,3,'{\"name\":\"Deployment\"}'),(21,3,'{\"name\":\"Code Integration\"}'),(22,3,'{\"name\":\"Product catalog logic\"}'),(25,3,'{\"name\":\"Negotiations\"}'),(26,3,'{\"name\":\"Copywriting\"}'),(27,3,'{\"name\":\"Content Management\"}'),(28,3,'{\"name\":\"Identifying site objectives & audiences\"}'),(29,3,'{\"name\":\"Bug fixing\"}'),(30,3,'{\"name\":\"Deployment\"}'),(31,3,'{\"name\":\"Browser testing\"}'),(32,3,'{\"name\":\"Website structure\"}'),(33,3,'{\"name\":\"Information Architecture design\"}'),(34,3,'{\"name\":\"Specifying environment: tools, framework\"}'),(35,3,'{\"name\":\"Phone calls\"}'),(36,3,'{\"name\":\"e-mail check\"}'),(37,3,'{\"name\":\"Status meetings\"}'),(38,3,'{\"name\":\"Pages interface design\"}'),(39,3,'{\"name\":\"Catalog interface design\"}'),(40,3,'{\"name\":\"Pages interface design\"}'),(41,3,'{\"name\":\"Branding\"}'),(42,3,'{\"name\":\"Mailing tools and services\"}'),(43,3,'{\"name\":\"Installing antivirus\"}'),(48,3,'{\"name\":\"Traffic monitoring\"}'),(55,3,'{\"name\":\"Setting up Time Management system - Evaluation\"}'),(56,3,'{\"name\":\"Setting up Time Management system\"}'),(58,3,'{\"name\":\"Equipment ordering\"}'),(59,3,'{\"name\":\"Backup controlling\"}'),(60,3,'{\"name\":\"Problem troubleshooting\"}'),(61,3,'{\"name\":\"Monitoring of system activity\"}'),(62,3,'{\"name\":\"Network Support\"}'),(63,3,'{\"name\":\"New navigation\"}'),(65,3,'{\"name\":\"Logo redesign\"}'),(67,3,'{\"name\":\"Design proposal\"}'),(68,3,'{\"name\":\"Budget calculations\"}'),(69,3,'{\"name\":\"Sketches review and approval\"}'),(70,3,'{\"name\":\"Design consulting\"}'),(71,3,'{\"name\":\"Budget\"}'),(72,3,'{\"name\":\"Accounting\"}'),(73,3,'{\"name\":\"Payroll\"}'),(74,3,'{\"name\":\"Monthly financial report\"}'),(75,3,'{\"name\":\"Tax report\"}'),(77,3,'{\"name\":\"Updating pictures & video\"}'),(79,3,'{\"name\":\"Training\"}');
/*!40000 ALTER TABLE `audit_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_type`
--

DROP TABLE IF EXISTS `billing_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_type` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_lower` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_billable` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL,
  `rate` double(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_lower` (`name_lower`),
  CONSTRAINT `fk_billing_type_revision` FOREIGN KEY (`id`) REFERENCES `billing_type_revision` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_type`
--

LOCK TABLES `billing_type` WRITE;
/*!40000 ALTER TABLE `billing_type` DISABLE KEYS */;
INSERT INTO `billing_type` VALUES (1,'programming','programming',0,1,1,2,35.00),(2,'Non-Billable','non-billable',1,0,1,1,NULL),(3,'design','design',0,1,1,3,33.00),(4,'maintenance','maintenance',0,1,1,4,25.00),(5,'testing','testing',0,1,1,5,18.00),(6,'management','management',0,1,1,6,40.00),(7,'analysis','analysis',0,1,1,7,30.00),(8,'writing','writing',0,1,1,8,30.00),(9,'consulting','consulting',0,1,1,9,30.00);
/*!40000 ALTER TABLE `billing_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_type_revision`
--

DROP TABLE IF EXISTS `billing_type_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_type_revision` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_billing_type_revision` (`revision`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_type_revision`
--

LOCK TABLES `billing_type_revision` WRITE;
/*!40000 ALTER TABLE `billing_type_revision` DISABLE KEYS */;
INSERT INTO `billing_type_revision` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `billing_type_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin_data`
--

DROP TABLE IF EXISTS `bin_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin_data` (
  `bin_data_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `data_length` int(10) unsigned NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bin_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin_data`
--

LOCK TABLES `bin_data` WRITE;
/*!40000 ALTER TABLE `bin_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `bin_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin_data_chunk`
--

DROP TABLE IF EXISTS `bin_data_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin_data_chunk` (
  `bin_data_id` int(3) unsigned NOT NULL,
  `chunk_num` int(2) unsigned NOT NULL,
  `chunk_data` mediumblob,
  PRIMARY KEY (`bin_data_id`,`chunk_num`),
  CONSTRAINT `bin_data_chunk_bin_data_id_fk_bin_data_bin_data_id` FOREIGN KEY (`bin_data_id`) REFERENCES `bin_data` (`bin_data_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin_data_chunk`
--

LOCK TABLES `bin_data_chunk` WRITE;
/*!40000 ALTER TABLE `bin_data_chunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `bin_data_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_logo`
--

DROP TABLE IF EXISTS `custom_logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_logo` (
  `logo_type` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bin_data` int(3) unsigned NOT NULL,
  PRIMARY KEY (`logo_type`),
  KEY `fk_custom_logo_bin_data_id` (`bin_data`),
  CONSTRAINT `fk_custom_logo_bin_data_id` FOREIGN KEY (`bin_data`) REFERENCES `bin_data` (`bin_data_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_logo`
--

LOCK TABLES `custom_logo` WRITE;
/*!40000 ALTER TABLE `custom_logo` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `create_timestamp` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_lower` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `archiving_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_lower` (`name_lower`),
  KEY `customer_archts_i` (`archiving_timestamp`),
  CONSTRAINT `fk_customer_revision` FOREIGN KEY (`id`) REFERENCES `customer_revision` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'2018-12-10 00:00:00','Mobile Phone Internet Shop','mobile phone internet shop','Shop offering mobile devices and such. Needs to enhance the architecture and refresh the design. Website: www.bestmobiles.com\r\n\r\nAddress: Fort Lauderdale, FL, USA\r\n\r\nContact person: Mike Stanford, c: +1-805-778-31-30','2019-01-22 00:00:00'),(3,'2019-02-04 00:00:00','Architects Bureau','architects bureau','Design-oriented architecture agency specializing in residential estate and renovation. Needs a one-page web presence. Possible development in the future.\r\n\r\nAddress: 27511 Garden Ave, Hamilton, New Zealand.\r\n\r\nContact person: Peter Jackson, c: +1-705-222-15-17',NULL),(4,'2019-01-02 00:00:00','Boston Chocolate','boston chocolate','Small old sweet shop with the clientele needs a simple website with the option to subscribe to its news.\r\n\r\nAddress: V16 5GH, Cadbury, Boston, England.\r\n\r\nContact person: Eunice Marshall, c: +1-507-088-12-99',NULL),(5,'2018-12-10 00:00:00','Our Company','our company','This is all about our internal projects and tasks.',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_backup`
--

DROP TABLE IF EXISTS `customer_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_backup` (
  `id` int(3) DEFAULT NULL,
  `create_timestamp` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_lower` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `archiving_timestamp` datetime DEFAULT NULL,
  `backup_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_backup`
--

LOCK TABLES `customer_backup` WRITE;
/*!40000 ALTER TABLE `customer_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_revision`
--

DROP TABLE IF EXISTS `customer_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_revision` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_customer_revision_value` (`revision`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_revision`
--

LOCK TABLES `customer_revision` WRITE;
/*!40000 ALTER TABLE `customer_revision` DISABLE KEYS */;
INSERT INTO `customer_revision` VALUES (2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `customer_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dar_settings`
--

DROP TABLE IF EXISTS `dar_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dar_settings` (
  `property_name` varchar(255) NOT NULL,
  `property_value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dar_settings`
--

LOCK TABLES `dar_settings` WRITE;
/*!40000 ALTER TABLE `dar_settings` DISABLE KEYS */;
INSERT INTO `dar_settings` VALUES ('allowUsersToSeeAllTT','false'),('hideAccountSettingsWhenDisabled','false'),('hideDetailsOnLockTT','false'),('hideNotAssignedTTDetails','true'),('showUsernameInReports','false'),('ttmCanSeeAutoApproved','false'),('usersForSeeAllTTFilter.all','false'),('usersForSeeAllTTFilter.groupIds',''),('usersForSeeAllTTFilter.groupType',NULL),('usersForSeeAllTTFilter.userIds','');
/*!40000 ALTER TABLE `dar_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_workday_duration_history`
--

DROP TABLE IF EXISTS `default_workday_duration_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_workday_duration_history` (
  `duration` int(10) unsigned NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`effective_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_workday_duration_history`
--

LOCK TABLES `default_workday_duration_history` WRITE;
/*!40000 ALTER TABLE `default_workday_duration_history` DISABLE KEYS */;
INSERT INTO `default_workday_duration_history` VALUES (480,'1970-01-01');
/*!40000 ALTER TABLE `default_workday_duration_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_user`
--

DROP TABLE IF EXISTS `deleted_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_user` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_deleted_user_id` FOREIGN KEY (`id`) REFERENCES `at_user_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_user`
--

LOCK TABLES `deleted_user` WRITE;
/*!40000 ALTER TABLE `deleted_user` DISABLE KEYS */;
INSERT INTO `deleted_user` VALUES (12,'1','1','','1'),(13,'2','2','','2'),(14,'3','3','','3'),(15,'1','1','','1'),(17,'11','1','','1'),(20,'12','1','','1');
/*!40000 ALTER TABLE `deleted_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_comment`
--

DROP TABLE IF EXISTS `entity_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `entity_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creation_timestamp` datetime NOT NULL,
  `updating_timestamp` datetime DEFAULT NULL,
  `updating_user_id` int(11) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `entity_id` (`entity_id`,`creation_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_comment`
--

LOCK TABLES `entity_comment` WRITE;
/*!40000 ALTER TABLE `entity_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_comment_backup`
--

DROP TABLE IF EXISTS `entity_comment_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_comment_backup` (
  `id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creation_timestamp` datetime NOT NULL,
  `updating_timestamp` datetime DEFAULT NULL,
  `updating_user_id` int(11) DEFAULT NULL,
  `comment` text,
  `backup_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_comment_backup`
--

LOCK TABLES `entity_comment_backup` WRITE;
/*!40000 ALTER TABLE `entity_comment_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_comment_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `getting_started_settings`
--

DROP TABLE IF EXISTS `getting_started_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `getting_started_settings` (
  `property_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_value` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `property_name` (`property_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `getting_started_settings`
--

LOCK TABLES `getting_started_settings` WRITE;
/*!40000 ALTER TABLE `getting_started_settings` DISABLE KEYS */;
INSERT INTO `getting_started_settings` VALUES ('featuresShortcutChecked','y'),('settingsShortcutChecked','y'),('shortcutsIsVisible','false'),('tasksShortcutChecked','y'),('usersShortcutChecked','y'),('userThatShouldSeeShortcuts','1');
/*!40000 ALTER TABLE `getting_started_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gui_notification`
--

DROP TABLE IF EXISTS `gui_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gui_notification` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiration_date` date DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `show_to_new_users` tinyint(1) NOT NULL DEFAULT '0',
  `product` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gui_notification`
--

LOCK TABLES `gui_notification` WRITE;
/*!40000 ALTER TABLE `gui_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `gui_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_bill_to_recent_entry`
--

DROP TABLE IF EXISTS `invoice_bill_to_recent_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_bill_to_recent_entry` (
  `entry` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalized_entry` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL COMMENT 'the more recent, the larger number',
  `user_id` int(3) unsigned NOT NULL,
  UNIQUE KEY `uk_invoice_bill_to_recent_entry_position_user` (`user_id`,`position`),
  CONSTRAINT `fk_invoice_bill_to_recent_entry_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_bill_to_recent_entry`
--

LOCK TABLES `invoice_bill_to_recent_entry` WRITE;
/*!40000 ALTER TABLE `invoice_bill_to_recent_entry` DISABLE KEYS */;
INSERT INTO `invoice_bill_to_recent_entry` VALUES ('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,1),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,1),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,1),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,1),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,2),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,2),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,2),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,2),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,4),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,4),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,4),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,4),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,5),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,5),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,5),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,5),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,6),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,6),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,6),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,6),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,7),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,7),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,7),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,7),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,8),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,8),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,8),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,8),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,9),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,9),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,9),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,9),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,10),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,10),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,10),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,10),('Fly-Buy, Inc.\n\n3204 30th Avenue\nAstoria, NY 11102-1528,\nUnited States\n\nAttn: Accounts Payable','fly-buy, inc. 3204 30th avenue astoria, ny 11102-1528, united states attn: accounts payable',1,11),('Mc Gallagher Insurance Co.\n\n74 Victoria Street\nLondon SW1E 6SQ,\nUnited Kingdom\n\nAttn: Accounts Payable','mc gallagher insurance co. 74 victoria street london sw1e 6sq, united kingdom attn: accounts payable',2,11),('North-West Consulting, Ltd.\n\n1062 Folsom Street\nSan Francisco, CA 94103,\nUnited States\n\nAttn: Accounts Payable','north-west consulting, ltd. 1062 folsom street san francisco, ca 94103, united states attn: accounts payable',3,11),('Boston Chocolate\n\n4 Washington St.,\nBoston, MA ','boston chocolate 4 washington st., boston, ma',5,11);
/*!40000 ALTER TABLE `invoice_bill_to_recent_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_discount`
--

DROP TABLE IF EXISTS `invoice_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_discount` (
  `position` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_id` int(3) DEFAULT NULL,
  `user_id` int(3) unsigned DEFAULT NULL,
  UNIQUE KEY `uk_invoice_discount_config_id_position` (`user_id`,`config_id`,`position`),
  KEY `fk_invoice_discount_config_id` (`config_id`),
  CONSTRAINT `fk_invoice_discount_config_id` FOREIGN KEY (`config_id`) REFERENCES `report_configs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_invoice_discount_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_discount`
--

LOCK TABLES `invoice_discount` WRITE;
/*!40000 ALTER TABLE `invoice_discount` DISABLE KEYS */;
INSERT INTO `invoice_discount` VALUES (1,'Discount',NULL,1),(1,'Discount',NULL,5),(1,'Discount',NULL,2),(1,'Discount',NULL,4),(1,'Discount',NULL,6),(1,'Discount',NULL,7),(1,'Discount',NULL,8),(1,'Discount',NULL,9),(1,'Discount',NULL,10),(1,'Discount',NULL,11);
/*!40000 ALTER TABLE `invoice_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_last_used_number`
--

DROP TABLE IF EXISTS `invoice_last_used_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_last_used_number` (
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_last_used_number`
--

LOCK TABLES `invoice_last_used_number` WRITE;
/*!40000 ALTER TABLE `invoice_last_used_number` DISABLE KEYS */;
INSERT INTO `invoice_last_used_number` VALUES ('AT-000123/024');
/*!40000 ALTER TABLE `invoice_last_used_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_params`
--

DROP TABLE IF EXISTS `invoice_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_params` (
  `param_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_id` int(3) DEFAULT NULL,
  `user_id` int(3) unsigned DEFAULT NULL,
  UNIQUE KEY `uk_invoice_params_config_id_param_name` (`user_id`,`config_id`,`param_name`),
  KEY `fk_invoice_params_config_id` (`config_id`),
  CONSTRAINT `fk_invoice_params_config_id` FOREIGN KEY (`config_id`) REFERENCES `report_configs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_invoice_params_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_params`
--

LOCK TABLES `invoice_params` WRITE;
/*!40000 ALTER TABLE `invoice_params` DISABLE KEYS */;
INSERT INTO `invoice_params` VALUES ('POLabel','PO#',NULL,1),('refCodeLabel','Reference Code',NULL,1),('title','INVOICE',NULL,1),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,1),('companyName','Web Design Studio',NULL,1),('POLabel','PO#',NULL,5),('refCodeLabel','Reference Code',NULL,5),('title','INVOICE',NULL,5),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,5),('companyName','Web Design Studio',NULL,5),('POLabel','PO#',NULL,2),('refCodeLabel','Reference Code',NULL,2),('title','INVOICE',NULL,2),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,2),('companyName','Web Design Studio',NULL,2),('POLabel','PO#',NULL,4),('refCodeLabel','Reference Code',NULL,4),('title','INVOICE',NULL,4),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,4),('companyName','Web Design Studio',NULL,4),('POLabel','PO#',NULL,6),('refCodeLabel','Reference Code',NULL,6),('title','INVOICE',NULL,6),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,6),('companyName','Web Design Studio',NULL,6),('POLabel','PO#',NULL,7),('refCodeLabel','Reference Code',NULL,7),('title','INVOICE',NULL,7),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,7),('companyName','Web Design Studio',NULL,7),('POLabel','PO#',NULL,8),('refCodeLabel','Reference Code',NULL,8),('title','INVOICE',NULL,8),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,8),('companyName','Web Design Studio',NULL,8),('POLabel','PO#',NULL,9),('refCodeLabel','Reference Code',NULL,9),('title','INVOICE',NULL,9),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,9),('companyName','Web Design Studio',NULL,9),('POLabel','PO#',NULL,10),('refCodeLabel','Reference Code',NULL,10),('title','INVOICE',NULL,10),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,10),('companyName','Web Design Studio',NULL,10),('POLabel','PO#',NULL,11),('refCodeLabel','Reference Code',NULL,11),('title','INVOICE',NULL,11),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',NULL,11),('companyName','Web Design Studio',NULL,11),('billTo','Boston Chocolate\n\n4 Washington St.,\nBoston, MA ',NULL,1),('lastTerms','Net 30',NULL,1),('POLabel','PO#',79,NULL),('refCodeLabel','Reference Code',79,NULL),('title','INVOICE',79,NULL),('companyAddress','34 William St.,\nNew York, NY 10005, USA\n\nToll free phone: 1-800-123-4567',79,NULL),('companyName','Web Design Studio',79,NULL),('billTo','Boston Chocolate\n\n4 Washington St.,\nBoston, MA ',79,NULL),('lastTerms','Net 30',79,NULL);
/*!40000 ALTER TABLE `invoice_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_tax`
--

DROP TABLE IF EXISTS `invoice_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_tax` (
  `position` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(12,4) DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL DEFAULT '0',
  `config_id` int(3) DEFAULT NULL,
  `user_id` int(3) unsigned DEFAULT NULL,
  UNIQUE KEY `uk_invoice_tax_config_id_position` (`user_id`,`config_id`,`position`),
  KEY `fk_invoice_tax_config_id` (`config_id`),
  CONSTRAINT `fk_invocie_tax_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `fk_invoice_tax_config_id` FOREIGN KEY (`config_id`) REFERENCES `report_configs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_tax`
--

LOCK TABLES `invoice_tax` WRITE;
/*!40000 ALTER TABLE `invoice_tax` DISABLE KEYS */;
INSERT INTO `invoice_tax` VALUES (1,'Tax',NULL,0,NULL,1),(1,'Tax',NULL,0,NULL,5),(1,'Tax',NULL,0,NULL,2),(1,'Tax',NULL,0,NULL,4),(1,'Tax',NULL,0,NULL,6),(1,'Tax',NULL,0,NULL,7),(1,'Tax',NULL,0,NULL,8),(1,'Tax',NULL,0,NULL,9),(1,'Tax',NULL,0,NULL,10),(1,'Tax',NULL,0,NULL,11);
/*!40000 ALTER TABLE `invoice_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_terms`
--

DROP TABLE IF EXISTS `invoice_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_terms` (
  `entry` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `normalized_entry` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `user_id` int(3) unsigned NOT NULL,
  UNIQUE KEY `uk_invoice_terms_position_user` (`user_id`,`position`),
  CONSTRAINT `fk_invoice_terms_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_terms`
--

LOCK TABLES `invoice_terms` WRITE;
/*!40000 ALTER TABLE `invoice_terms` DISABLE KEYS */;
INSERT INTO `invoice_terms` VALUES ('Net 60','net 60',1,1),('Net 30','net 30',2,1),('Net 15','net 15',3,1),('Net 10','net 10',4,1),('Net 7','net 7',5,1),('Due on receipt','due on receipt',6,1),('Net 60','net 60',1,2),('Net 30','net 30',2,2),('Net 15','net 15',3,2),('Net 10','net 10',4,2),('Net 7','net 7',5,2),('Due on receipt','due on receipt',6,2),('Net 60','net 60',1,4),('Net 30','net 30',2,4),('Net 15','net 15',3,4),('Net 10','net 10',4,4),('Net 7','net 7',5,4),('Due on receipt','due on receipt',6,4),('Net 60','net 60',1,5),('Net 30','net 30',2,5),('Net 15','net 15',3,5),('Net 10','net 10',4,5),('Net 7','net 7',5,5),('Due on receipt','due on receipt',6,5),('Net 60','net 60',1,6),('Net 30','net 30',2,6),('Net 15','net 15',3,6),('Net 10','net 10',4,6),('Net 7','net 7',5,6),('Due on receipt','due on receipt',6,6),('Net 60','net 60',1,7),('Net 30','net 30',2,7),('Net 15','net 15',3,7),('Net 10','net 10',4,7),('Net 7','net 7',5,7),('Due on receipt','due on receipt',6,7),('Net 60','net 60',1,8),('Net 30','net 30',2,8),('Net 15','net 15',3,8),('Net 10','net 10',4,8),('Net 7','net 7',5,8),('Due on receipt','due on receipt',6,8),('Net 60','net 60',1,9),('Net 30','net 30',2,9),('Net 15','net 15',3,9),('Net 10','net 10',4,9),('Net 7','net 7',5,9),('Due on receipt','due on receipt',6,9),('Net 60','net 60',1,10),('Net 30','net 30',2,10),('Net 15','net 15',3,10),('Net 10','net 10',4,10),('Net 7','net 7',5,10),('Due on receipt','due on receipt',6,10),('Net 60','net 60',1,11),('Net 30','net 30',2,11),('Net 15','net 15',3,11),('Net 10','net 10',4,11),('Net 7','net 7',5,11),('Due on receipt','due on receipt',6,11);
/*!40000 ALTER TABLE `invoice_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kanban_task_position`
--

DROP TABLE IF EXISTS `kanban_task_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kanban_task_position` (
  `task_id` int(5) NOT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`task_id`),
  CONSTRAINT `fk_task_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kanban_task_position`
--

LOCK TABLES `kanban_task_position` WRITE;
/*!40000 ALTER TABLE `kanban_task_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `kanban_task_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_rate`
--

DROP TABLE IF EXISTS `leave_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_rate` (
  `rate_id` int(5) unsigned NOT NULL,
  `leave_type` int(3) unsigned NOT NULL,
  `rate` double(10,2) unsigned NOT NULL,
  PRIMARY KEY (`rate_id`,`leave_type`),
  KEY `leave_rate_leave_type_fk_leave_type_id` (`leave_type`),
  CONSTRAINT `leave_rate_leave_type_fk_leave_type_id` FOREIGN KEY (`leave_type`) REFERENCES `leave_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_rate_rate_id_fk_user_rate_id` FOREIGN KEY (`rate_id`) REFERENCES `user_rate` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Leave rates information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_rate`
--

LOCK TABLES `leave_rate` WRITE;
/*!40000 ALTER TABLE `leave_rate` DISABLE KEYS */;
INSERT INTO `leave_rate` VALUES (221,1,50.00),(221,2,0.00),(221,3,50.00),(221,4,50.00),(221,5,50.00),(221,7,50.00),(221,8,50.00),(225,1,35.00),(225,2,0.00),(225,3,35.00),(225,4,35.00),(225,5,35.00),(225,7,35.00),(225,8,35.00),(228,1,25.00),(228,2,0.00),(228,3,25.00),(228,4,25.00),(228,5,25.00),(228,7,25.00),(228,8,25.00),(229,1,20.00),(229,2,0.00),(229,3,20.00),(229,4,20.00),(229,5,20.00),(229,7,20.00),(229,8,20.00),(235,1,30.00),(235,2,0.00),(235,3,30.00),(235,4,30.00),(235,5,30.00),(235,7,30.00),(235,8,30.00),(236,1,40.00),(236,2,0.00),(236,3,40.00),(236,4,40.00),(236,5,40.00),(236,7,40.00),(236,8,40.00),(237,1,30.00),(237,2,0.00),(237,3,30.00),(237,4,30.00),(237,5,30.00),(237,7,30.00),(237,8,30.00),(238,1,20.00),(238,2,0.00),(238,3,20.00),(238,4,20.00),(238,5,20.00),(238,7,20.00),(238,8,20.00),(239,1,40.00),(239,2,0.00),(239,3,40.00),(239,4,40.00),(239,5,40.00),(239,7,40.00),(239,8,40.00),(243,1,30.00),(243,2,0.00),(243,3,30.00),(243,4,30.00),(243,5,30.00),(243,7,30.00),(243,8,30.00),(244,1,50.00),(244,2,0.00),(244,3,50.00),(244,4,50.00),(244,5,50.00),(244,7,50.00),(244,8,50.00),(246,1,20.00),(246,2,0.00),(246,3,20.00),(246,4,20.00),(246,5,20.00),(246,7,20.00),(246,8,20.00);
/*!40000 ALTER TABLE `leave_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_type` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_lower` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `icon_id` int(4) unsigned NOT NULL,
  `position` int(3) unsigned NOT NULL,
  `rate_coefficient` double(10,2) unsigned NOT NULL DEFAULT '1.00',
  `requires_approval` tinyint(1) NOT NULL DEFAULT '1',
  `balance_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance_coeff` double(10,2) unsigned NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `leave_type_name` (`name_lower`),
  KEY `k_icon_id` (`icon_id`),
  CONSTRAINT `fk_leave_type_revision` FOREIGN KEY (`id`) REFERENCES `leave_type_revision` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES (1,'Sick Leave','sick leave',1,1,1,1.00,1,'SICK',1.00),(2,'Studies','studies',1,5,5,0.00,1,NULL,1.00),(3,'Vacation','vacation',1,3,3,1.00,1,'PTO',1.20),(4,'Family Leave','family leave',1,4,6,1.00,1,'PTO',1.20),(5,'Time Off','time off',1,2,2,1.00,1,'PTO',1.20),(7,'Business Trip','business trip',1,11,4,1.00,1,NULL,1.00),(8,'Medical Treatment','medical treatment',1,13,7,1.00,1,'SICK',1.00);
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type_revision`
--

DROP TABLE IF EXISTS `leave_type_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_type_revision` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_leave_type_revision` (`revision`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type_revision`
--

LOCK TABLES `leave_type_revision` WRITE;
/*!40000 ALTER TABLE `leave_type_revision` DISABLE KEYS */;
INSERT INTO `leave_type_revision` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(7,7),(8,8);
/*!40000 ALTER TABLE `leave_type_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `issue_date` datetime NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_message`
--

DROP TABLE IF EXISTS `mail_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_message` (
  `bin_data_id` int(3) unsigned NOT NULL,
  `tries` tinyint(3) DEFAULT '0',
  `last_try_timestamp` timestamp NULL DEFAULT NULL,
  `next_try_timestamp` timestamp NULL DEFAULT NULL,
  `last_failure_reason` text,
  `client` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bin_data_id`),
  CONSTRAINT `mail_message_bin_data_id_fk_bin_data_bin_data_id` FOREIGN KEY (`bin_data_id`) REFERENCES `bin_data` (`bin_data_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_message`
--

LOCK TABLES `mail_message` WRITE;
/*!40000 ALTER TABLE `mail_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_rule`
--

DROP TABLE IF EXISTS `notification_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_rule` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(2) unsigned NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'0',
  `last_change_timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_rule`
--

LOCK TABLES `notification_rule` WRITE;
/*!40000 ALTER TABLE `notification_rule` DISABLE KEYS */;
INSERT INTO `notification_rule` VALUES (1,1,_binary '\0','2018-10-15 14:40:04'),(2,2,_binary '\0','2018-10-15 14:40:04'),(3,3,_binary '\0','2018-10-15 14:40:04'),(4,3,_binary '\0','2018-10-15 14:40:04'),(5,3,_binary '\0','2018-10-15 14:40:04'),(6,4,_binary '\0','2018-10-15 14:40:04'),(7,4,_binary '\0','2018-10-15 14:40:04'),(8,4,_binary '\0','2018-10-15 14:40:04'),(10,6,_binary '\0','2018-10-15 14:40:04'),(11,6,_binary '\0','2018-10-15 14:40:04'),(12,7,_binary '\0','2018-10-15 14:40:04');
/*!40000 ALTER TABLE `notification_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_rule_params`
--

DROP TABLE IF EXISTS `notification_rule_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_rule_params` (
  `rule_id` int(3) unsigned NOT NULL,
  `param_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `notification_rule_params_rule_id` (`rule_id`),
  CONSTRAINT `notification_rule_params_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `notification_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_rule_params`
--

LOCK TABLES `notification_rule_params` WRITE;
/*!40000 ALTER TABLE `notification_rule_params` DISABLE KEYS */;
INSERT INTO `notification_rule_params` VALUES (1,'recipients.allUsers','true'),(1,'recipients.selectedUsers',''),(1,'tt_limit.time','420'),(1,'tt_limit.onlyWorkingDays','true'),(1,'tt_limit.rangeDays','1'),(2,'recipients.allUsers','true'),(2,'recipients.selectedUsers',''),(2,'tt_limit.time','2100'),(2,'tt_users.allUsers','true'),(2,'tt_users.selectedUsers',''),(2,'tt_limit.onlyWorkingDays','false'),(2,'tt_limit.rangeDays','7'),(3,'recipients.allUsers','true'),(3,'deadline','2'),(3,'customers_projects.showArchived','false'),(3,'customers_projects.projectList',''),(3,'recipients.selectedUsers',''),(3,'customers_projects.customerList',''),(3,'customers_projects.coarseSelection','all_active'),(4,'recipients.allUsers','true'),(4,'deadline','0'),(4,'customers_projects.showArchived','false'),(4,'customers_projects.projectList',''),(4,'customers_projects.customerList',''),(4,'recipients.selectedUsers',''),(4,'customers_projects.coarseSelection','all_active'),(5,'recipients.allUsers','true'),(5,'deadline','-2'),(5,'customers_projects.showArchived','false'),(5,'customers_projects.projectList',''),(5,'recipients.selectedUsers',''),(5,'customers_projects.customerList',''),(5,'customers_projects.coarseSelection','all_active'),(6,'recipients.allUsers','true'),(6,'estimatePercents','80'),(6,'customers_projects.showArchived','false'),(6,'customers_projects.projectList',''),(6,'customers_projects.customerList',''),(6,'recipients.selectedUsers',''),(6,'customers_projects.coarseSelection','all_active'),(7,'recipients.allUsers','true'),(7,'estimatePercents','100'),(7,'customers_projects.showArchived','false'),(7,'customers_projects.projectList',''),(7,'customers_projects.customerList',''),(7,'recipients.selectedUsers',''),(7,'customers_projects.coarseSelection','all_active'),(8,'recipients.allUsers','true'),(8,'estimatePercents','150'),(8,'customers_projects.showArchived','false'),(8,'customers_projects.projectList',''),(8,'customers_projects.customerList',''),(8,'recipients.selectedUsers',''),(8,'customers_projects.coarseSelection','all_active'),(10,'recipients.allUsers','true'),(10,'customers_projects.showArchived','false'),(10,'customers_projects.projectList',''),(10,'recipients.selectedUsers',''),(10,'customers_projects.customerList',''),(10,'customers_projects.coarseSelection','all_active'),(10,'money.amount','1'),(10,'money.range','CURRENT_MONTH'),(11,'recipients.allUsers','true'),(11,'customers_projects.showArchived','false'),(11,'customers_projects.projectList',''),(11,'recipients.selectedUsers',''),(11,'customers_projects.customerList',''),(11,'money.amount','1'),(11,'customers_projects.coarseSelection','all_active'),(11,'money.range','TOTAL'),(12,'recipients.allUsers','true'),(12,'recipients.selectedUsers',''),(12,'money.amount','1'),(12,'tt_users.allUsers','true'),(12,'tt_users.selectedUsers',''),(12,'money.range','CURRENT_MONTH');
/*!40000 ALTER TABLE `notification_rule_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_schedule`
--

DROP TABLE IF EXISTS `notification_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_schedule` (
  `notification_type` int(2) unsigned NOT NULL,
  `cron` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`notification_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_schedule`
--

LOCK TABLES `notification_schedule` WRITE;
/*!40000 ALTER TABLE `notification_schedule` DISABLE KEYS */;
INSERT INTO `notification_schedule` VALUES (1,'2,3,4,5,6'),(2,'2'),(4,'1,2,3,4,5,6,7'),(6,'1,2,3,4,5,6,7'),(7,'1,2,3,4,5,6,7');
/*!40000 ALTER TABLE `notification_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime`
--

DROP TABLE IF EXISTS `overtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtime` (
  `user_id` int(3) unsigned NOT NULL,
  `overtime_date` date NOT NULL,
  `overtime` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`overtime_date`),
  CONSTRAINT `fk_overtime_revision` FOREIGN KEY (`user_id`, `overtime_date`) REFERENCES `overtime_revision` (`user_id`, `overtime_date`) ON DELETE NO ACTION,
  CONSTRAINT `overtime_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Overtime records for users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime`
--

LOCK TABLES `overtime` WRITE;
/*!40000 ALTER TABLE `overtime` DISABLE KEYS */;
INSERT INTO `overtime` VALUES (7,'2019-02-22',0);
/*!40000 ALTER TABLE `overtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime_revision`
--

DROP TABLE IF EXISTS `overtime_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtime_revision` (
  `user_id` int(3) unsigned NOT NULL,
  `overtime_date` date NOT NULL,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`overtime_date`),
  UNIQUE KEY `uk_overtime_revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime_revision`
--

LOCK TABLES `overtime_revision` WRITE;
/*!40000 ALTER TABLE `overtime_revision` DISABLE KEYS */;
INSERT INTO `overtime_revision` VALUES (7,'2019-02-22',1);
/*!40000 ALTER TABLE `overtime_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_token`
--

DROP TABLE IF EXISTS `password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_token` (
  `user_id` int(3) unsigned NOT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `token` (`token`),
  CONSTRAINT `fk_password_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_token`
--

LOCK TABLES `password_token` WRITE;
/*!40000 ALTER TABLE `password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_history`
--

DROP TABLE IF EXISTS `patch_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_history` (
  `patch` int(3) NOT NULL,
  `patch_timestamp` datetime NOT NULL,
  `pack_version` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`patch`,`pack_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_history`
--

LOCK TABLES `patch_history` WRITE;
/*!40000 ALTER TABLE `patch_history` DISABLE KEYS */;
INSERT INTO `patch_history` VALUES (1,'2018-10-15 14:38:20',0),(2,'2018-10-15 14:38:23',0),(3,'2018-10-15 14:38:33',0),(4,'2018-10-15 14:38:35',0),(5,'2018-10-15 14:38:36',0),(6,'2018-10-15 14:38:38',0),(7,'2018-10-15 14:38:39',0),(8,'2018-10-15 14:38:41',0),(9,'2018-10-15 14:38:47',0),(10,'2018-10-15 14:38:49',0),(11,'2018-10-15 14:39:04',0),(12,'2018-10-15 14:39:19',0),(13,'2018-10-15 14:39:23',0),(14,'2018-10-15 14:39:46',0),(15,'2018-10-15 14:39:52',0),(16,'2018-10-15 14:40:00',0),(17,'2018-10-15 14:41:28',0),(18,'2018-10-15 14:41:33',0),(19,'2018-10-15 14:41:45',0),(20,'2018-10-15 14:41:50',0),(21,'2018-10-15 14:42:16',0),(22,'2018-10-15 14:43:17',0),(23,'2018-10-15 14:43:36',0),(24,'2018-10-15 14:43:42',0),(25,'2018-10-15 14:43:43',0),(26,'2018-10-15 14:43:45',0),(27,'2018-10-15 14:43:46',0),(28,'2018-10-15 14:43:54',0),(29,'2018-10-15 14:44:00',0),(30,'2018-10-15 14:44:01',0),(31,'2018-10-15 14:44:02',0),(32,'2018-10-15 14:44:14',0),(33,'2018-10-15 14:46:06',0),(34,'2018-10-15 14:46:26',0),(35,'2018-10-15 14:46:29',0),(36,'2018-10-15 14:46:36',0),(37,'2018-10-15 14:46:38',0),(38,'2018-10-15 14:46:41',0),(39,'2018-10-15 14:46:59',0),(40,'2018-10-15 14:47:00',0),(41,'2018-10-15 14:47:08',0),(42,'2018-10-15 14:47:10',0),(43,'2018-10-15 14:47:23',0),(44,'2018-10-15 14:47:30',0),(45,'2018-10-15 14:47:36',0),(46,'2018-10-15 14:47:38',0),(47,'2019-03-05 17:56:58',0),(48,'2019-03-05 17:57:14',0),(49,'2019-03-05 10:02:27',0),(50,'2019-03-13 07:08:52',0);
/*!40000 ALTER TABLE `patch_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_template`
--

DROP TABLE IF EXISTS `permissions_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_template` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_template`
--

LOCK TABLES `permissions_template` WRITE;
/*!40000 ALTER TABLE `permissions_template` DISABLE KEYS */;
INSERT INTO `permissions_template` VALUES (3,'actiTIME administrator'),(2,'Manager'),(-1,'New user'),(1,'Regular user');
/*!40000 ALTER TABLE `permissions_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_template_param`
--

DROP TABLE IF EXISTS `permissions_template_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_template_param` (
  `perm_template_id` int(3) NOT NULL,
  `permission_id` int(3) unsigned NOT NULL,
  KEY `fk_permissions_template_param_permissions_template_id` (`perm_template_id`),
  KEY `fk_permissions_template_param_access_right_id` (`permission_id`),
  CONSTRAINT `fk_permissions_template_param_access_right_id` FOREIGN KEY (`permission_id`) REFERENCES `access_right` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_permissions_template_param_permissions_template_id` FOREIGN KEY (`perm_template_id`) REFERENCES `permissions_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_template_param`
--

LOCK TABLES `permissions_template_param` WRITE;
/*!40000 ALTER TABLE `permissions_template_param` DISABLE KEYS */;
INSERT INTO `permissions_template_param` VALUES (-1,12),(-1,5),(-1,11),(-1,14),(-1,9),(-1,8),(1,9),(2,9),(2,8),(2,12),(2,5),(3,12),(3,5),(3,11),(3,14),(3,9),(3,8),(-1,10),(2,10),(3,10),(-1,23),(1,23),(2,23),(3,23);
/*!40000 ALTER TABLE `permissions_template_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(3) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `create_timestamp` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_lower` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `archiving_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_project_customer_name` (`customer_id`,`name_lower`),
  KEY `project_customer_id_i` (`customer_id`),
  KEY `project_customer_archts_i` (`customer_id`,`archiving_timestamp`),
  CONSTRAINT `fk_project_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_project_revision` FOREIGN KEY (`id`) REFERENCES `project_revision` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (3,2,'2018-12-10 00:00:00','Updating the current website','updating the current website','','2019-01-22 00:00:00'),(5,3,'2019-02-04 00:00:00','One-page website','one-page website','',NULL),(6,4,'2019-01-07 00:00:00','Website creation','website creation','',NULL),(7,4,'2019-01-02 00:00:00','Website maintenance','website maintenance','Ongoing website maintenance: security updates, content updates, statistics, SEO',NULL),(8,4,'2019-03-03 00:00:00','Consulting','consulting','Consulting on the newsletter and mailing Internet services',NULL),(9,5,'2018-12-10 00:00:00','General','general','Internal communications, onboarding, employee training',NULL),(10,5,'2019-03-01 00:00:00','Administration','administration','',NULL),(11,5,'2019-02-04 00:00:00','System Administration','system administration','Server support & maintenance, installing and configuring new software',NULL),(12,5,'2019-02-04 00:00:00','Finance&Accounting','finance&accounting','',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_backup`
--

DROP TABLE IF EXISTS `project_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_backup` (
  `id` int(3) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `create_timestamp` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_lower` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `archiving_timestamp` datetime DEFAULT NULL,
  `backup_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_backup`
--

LOCK TABLES `project_backup` WRITE;
/*!40000 ALTER TABLE `project_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_revision`
--

DROP TABLE IF EXISTS `project_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_revision` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_project_revision` (`revision`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_revision`
--

LOCK TABLES `project_revision` WRITE;
/*!40000 ALTER TABLE `project_revision` DISABLE KEYS */;
INSERT INTO `project_revision` VALUES (3,3),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12);
/*!40000 ALTER TABLE `project_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user_notif_rule_send`
--

DROP TABLE IF EXISTS `project_user_notif_rule_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_user_notif_rule_send` (
  `user_notif_rule_send_id` int(5) unsigned NOT NULL,
  `project_id` int(3) NOT NULL,
  PRIMARY KEY (`user_notif_rule_send_id`,`project_id`),
  KEY `fk_project_user_notif_rule_send_project` (`project_id`),
  CONSTRAINT `fk_project_user_notif_rule_send_id` FOREIGN KEY (`user_notif_rule_send_id`) REFERENCES `user_notif_rule_send` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_project_user_notif_rule_send_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user_notif_rule_send`
--

LOCK TABLES `project_user_notif_rule_send` WRITE;
/*!40000 ALTER TABLE `project_user_notif_rule_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_user_notif_rule_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('BackgroundTaskScheduler','trigger_spent_time_cache_daily','JobGroup_trigger','0 0 0 ? * *','Europe/Moscow'),('NotificationsScheduler','trigger_deadline_America/New_York','deadline__trigger','0 0 9 ? * 1,2,3,4,5,6,7','America/New_York'),('NotificationsScheduler','trigger_deadline_Australia/Sydney','deadline__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Australia/Sydney'),('NotificationsScheduler','trigger_deadline_Europe/London','deadline__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Europe/London'),('NotificationsScheduler','trigger_estimate_America/New_York','estimate__trigger','0 0 9 ? * 1,2,3,4,5,6,7','America/New_York'),('NotificationsScheduler','trigger_estimate_Australia/Sydney','estimate__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Australia/Sydney'),('NotificationsScheduler','trigger_estimate_Europe/London','estimate__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Europe/London'),('NotificationsScheduler','trigger_personal_earnings_America/New_York','personal_earnings__trigger','0 0 9 ? * 1,2,3,4,5,6,7','America/New_York'),('NotificationsScheduler','trigger_personal_earnings_Australia/Sydney','personal_earnings__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Australia/Sydney'),('NotificationsScheduler','trigger_personal_earnings_Europe/London','personal_earnings__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Europe/London'),('NotificationsScheduler','trigger_personal_tt_America/New_York','personal_tt__trigger','0 0 9 ? * 2,3,4,5,6','America/New_York'),('NotificationsScheduler','trigger_personal_tt_Australia/Sydney','personal_tt__trigger','0 0 9 ? * 2,3,4,5,6','Australia/Sydney'),('NotificationsScheduler','trigger_personal_tt_Europe/London','personal_tt__trigger','0 0 9 ? * 2,3,4,5,6','Europe/London'),('NotificationsScheduler','trigger_project_budget_America/New_York','project_budget__trigger','0 0 9 ? * 1,2,3,4,5,6,7','America/New_York'),('NotificationsScheduler','trigger_project_budget_Australia/Sydney','project_budget__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Australia/Sydney'),('NotificationsScheduler','trigger_project_budget_Europe/London','project_budget__trigger','0 0 9 ? * 1,2,3,4,5,6,7','Europe/London'),('NotificationsScheduler','trigger_unsubmitted_tt_America/New_York','unsubmitted_tt__trigger','0 0 9 ? * 2','America/New_York'),('NotificationsScheduler','trigger_unsubmitted_tt_Australia/Sydney','unsubmitted_tt__trigger','0 0 9 ? * 2','Australia/Sydney'),('NotificationsScheduler','trigger_unsubmitted_tt_Europe/London','unsubmitted_tt__trigger','0 0 9 ? * 2','Europe/London'),('NotificationsScheduler','trigger_user_activation_at_America/New_York','user_activation_at__trigger','0 0 0 ? * 1,2,3,4,5,6,7','America/New_York'),('NotificationsScheduler','trigger_user_activation_at_Australia/Sydney','user_activation_at__trigger','0 0 0 ? * 1,2,3,4,5,6,7','Australia/Sydney'),('NotificationsScheduler','trigger_user_activation_at_Europe/London','user_activation_at__trigger','0 0 0 ? * 1,2,3,4,5,6,7','Europe/London');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('BackgroundTaskScheduler','spent_time_cache','JobGroup',NULL,'com.actimind.actitime.task.spenttime.CacheActualizationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','deadline','JobGroup',NULL,'com.actimind.actitime.notifications.DeadlineNotificationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','estimate','JobGroup',NULL,'com.actimind.actitime.notifications.EstimateNotificationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','personal_earnings','JobGroup',NULL,'com.actimind.actitime.notifications.PersonalEarningsNotificationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','personal_tt','JobGroup',NULL,'com.actimind.actitime.notifications.PersonalTTNotificationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','project_budget','JobGroup',NULL,'com.actimind.actitime.notifications.ProjectBudgetNotificationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','unsubmitted_tt','JobGroup',NULL,'com.actimind.actitime.notifications.UnsubmittedTTNotificationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','user_activation_at','JobGroup',NULL,'com.actimind.actitime.notifications.MailInvitationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n'),('NotificationsScheduler','user_changes','JobGroup',NULL,'com.actimind.common.notifications.UserChangesNotificationJob','1','0','0','0',_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\n');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('BackgroundTaskScheduler','TRIGGER_ACCESS'),('NotificationsScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('BackgroundTaskScheduler','trigger_spent_time_cache_daily','JobGroup_trigger','spent_time_cache','JobGroup',NULL,1551819600000,-1,5,'WAITING','CRON',1551798033000,0,NULL,0,_binary '#\r\n#Tue Mar 05 18:00:33 MSK 2019\r\nclientCode=\r\ntaskIdsFilterKey=null\r\n'),('NotificationsScheduler','trigger_deadline_America/New_York','deadline__trigger','deadline','JobGroup',NULL,1551880800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=America/New_York\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_deadline_Australia/Sydney','deadline__trigger','deadline','JobGroup',NULL,1551823200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Australia/Sydney\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_deadline_Europe/London','deadline__trigger','deadline','JobGroup',NULL,1551862800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Europe/London\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_estimate_America/New_York','estimate__trigger','estimate','JobGroup',NULL,1551880800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=America/New_York\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_estimate_Australia/Sydney','estimate__trigger','estimate','JobGroup',NULL,1551823200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Australia/Sydney\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_estimate_Europe/London','estimate__trigger','estimate','JobGroup',NULL,1551862800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Europe/London\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_personal_earnings_America/New_York','personal_earnings__trigger','personal_earnings','JobGroup',NULL,1551880800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=America/New_York\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_personal_earnings_Australia/Sydney','personal_earnings__trigger','personal_earnings','JobGroup',NULL,1551823200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Australia/Sydney\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_personal_earnings_Europe/London','personal_earnings__trigger','personal_earnings','JobGroup',NULL,1551862800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Europe/London\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_personal_tt_America/New_York','personal_tt__trigger','personal_tt','JobGroup',NULL,1551880800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=America/New_York\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_personal_tt_Australia/Sydney','personal_tt__trigger','personal_tt','JobGroup',NULL,1551823200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Australia/Sydney\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_personal_tt_Europe/London','personal_tt__trigger','personal_tt','JobGroup',NULL,1551862800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Europe/London\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_project_budget_America/New_York','project_budget__trigger','project_budget','JobGroup',NULL,1551880800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=America/New_York\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_project_budget_Australia/Sydney','project_budget__trigger','project_budget','JobGroup',NULL,1551823200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Australia/Sydney\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_project_budget_Europe/London','project_budget__trigger','project_budget','JobGroup',NULL,1551862800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Europe/London\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_unsubmitted_tt_America/New_York','unsubmitted_tt__trigger','unsubmitted_tt','JobGroup',NULL,1552309200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=America/New_York\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_unsubmitted_tt_Australia/Sydney','unsubmitted_tt__trigger','unsubmitted_tt','JobGroup',NULL,1552255200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Australia/Sydney\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_unsubmitted_tt_Europe/London','unsubmitted_tt__trigger','unsubmitted_tt','JobGroup',NULL,1552294800000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Europe/London\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_user_activation_at_America/New_York','user_activation_at__trigger','user_activation_at','JobGroup',NULL,1551848400000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=America/New_York\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_user_activation_at_Australia/Sydney','user_activation_at__trigger','user_activation_at','JobGroup',NULL,1551877200000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Australia/Sydney\r\nclientCode=\r\n'),('NotificationsScheduler','trigger_user_activation_at_Europe/London','user_activation_at__trigger','user_activation_at','JobGroup',NULL,1551830400000,-1,5,'WAITING','CRON',1551798073000,0,NULL,-1,_binary '#\r\n#Tue Mar 05 18:01:13 MSK 2019\r\ntimezone=Europe/London\r\nclientCode=\r\n');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_info`
--

DROP TABLE IF EXISTS `registration_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_info` (
  `registrationId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Registration Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_info`
--

LOCK TABLES `registration_info` WRITE;
/*!40000 ALTER TABLE `registration_info` DISABLE KEYS */;
INSERT INTO `registration_info` VALUES ('','');
/*!40000 ALTER TABLE `registration_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_configs`
--

DROP TABLE IF EXISTS `report_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_configs` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_lower` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_form` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `format_id` int(11) NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_form_user` (`name_lower`,`report_form`,`user_id`),
  KEY `fk_report_configs_user_id` (`user_id`),
  CONSTRAINT `fk_report_configs_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_configs`
--

LOCK TABLES `report_configs` WRITE;
/*!40000 ALTER TABLE `report_configs` DISABLE KEYS */;
INSERT INTO `report_configs` VALUES (42,'Monthly Team Performance','monthly team performance',1,'Employees\' work and out of work hours over the last month.',1,1),(43,'Monthly Team Performance','monthly team performance',1,'Employees\' work and out of work hours over the last month.',1,2),(45,'Monthly Team Performance','monthly team performance',1,'Employees\' work and out of work hours over the last month.',1,4),(46,'Monthly Team Performance','monthly team performance',1,'Employees\' work and out of work hours over the last month.',1,5),(47,'Team Hours & Overtime','team hours & overtime',4,'Daily overtime hours (manual + auto-calculated) of every employee.',1,1),(48,'Team Hours & Overtime','team hours & overtime',4,'Daily overtime hours (manual + auto-calculated) of every employee.',1,2),(50,'Team Hours & Overtime','team hours & overtime',4,'Daily overtime hours (manual + auto-calculated) of every employee.',1,4),(51,'Team Hours & Overtime','team hours & overtime',4,'Daily overtime hours (manual + auto-calculated) of every employee.',1,5),(52,'Monthly Report on Internal Costs','monthly report on internal costs',7,'Cost of internal user activities + leave time costs and overtime.',1,1),(53,'Monthly Report on Internal Costs','monthly report on internal costs',7,'Cost of internal user activities + leave time costs and overtime.',1,2),(55,'Monthly Report on Internal Costs','monthly report on internal costs',7,'Cost of internal user activities + leave time costs and overtime.',1,4),(56,'Monthly Report on Internal Costs','monthly report on internal costs',7,'Cost of internal user activities + leave time costs and overtime.',1,5),(57,'Boston Chocolate: Last month activities','boston chocolate: last month activities',6,'Works done for the client within the last month. The report includes comments and billable hours.',1,1),(58,'Boston Chocolate: Last month activities','boston chocolate: last month activities',6,'Works done for the client within the last month. The report includes comments and billable hours.',1,2),(60,'Boston Chocolate: Last month activities','boston chocolate: last month activities',6,'Works done for the client within the last month. The report includes comments and billable hours.',1,4),(61,'Boston Chocolate: Last month activities','boston chocolate: last month activities',6,'Works done for the client within the last month. The report includes comments and billable hours.',1,5),(62,'Team Sick Leaves','team sick leaves',10,'Employees\' sick time for the past month.',1,1),(63,'Team Sick Leaves','team sick leaves',10,'Employees\' sick time for the past month.',1,2),(65,'Team Sick Leaves','team sick leaves',10,'Employees\' sick time for the past month.',1,4),(66,'Team Sick Leaves','team sick leaves',10,'Employees\' sick time for the past month.',1,5),(67,'Boston Chocolate: Website creation project','boston chocolate: website creation project',9,'Comparison of the performed work with estimates for the completed tasks.',1,1),(68,'Boston Chocolate: Website creation project','boston chocolate: website creation project',9,'Comparison of the performed work with estimates for the completed tasks.',1,2),(70,'Boston Chocolate: Website creation project','boston chocolate: website creation project',9,'Comparison of the performed work with estimates for the completed tasks.',1,4),(71,'Boston Chocolate: Website creation project','boston chocolate: website creation project',9,'Comparison of the performed work with estimates for the completed tasks.',1,5),(72,'Monthly Billable Totals','monthly billable totals',3,'Billable hours and amounts for all active projects. The report includes time-track comments.',1,1),(73,'Monthly Billable Totals','monthly billable totals',3,'Billable hours and amounts for all active projects. The report includes time-track comments.',1,2),(75,'Monthly Billable Totals','monthly billable totals',3,'Billable hours and amounts for all active projects. The report includes time-track comments.',1,4),(76,'Monthly Billable Totals','monthly billable totals',3,'Billable hours and amounts for all active projects. The report includes time-track comments.',1,5),(77,'Team Leaves by months','team leaves by months',10,'',1,1),(78,'Profit vs. Loss calculations for previous 3 weeks','profit vs. loss calculations for previous 3 weeks',8,'Report includes all active projects and customers',1,1),(79,'Invoice for Boston Chocolate','invoice for boston chocolate',12,'Invoice for previous month',3,1),(80,'Profit vs. Loss calculations for previous 3 weeks','profit vs. loss calculations for previous 3 weeks',8,NULL,1,9),(81,'Monthly Report on Internal Costs','monthly report on internal costs',7,NULL,1,9),(82,'Monthly Billable Totals','monthly billable totals',3,NULL,1,9),(83,'Development Team Performance for previous month','development team performance for previous month',1,NULL,1,7),(84,'Cost of Work for previous month','cost of work for previous month',106,NULL,4,9),(85,'Billable Amount for previous month','billable amount for previous month',107,NULL,4,9),(86,'Actual User\'s PTO Balance','actual user\'s pto balance',104,NULL,4,1),(87,'Actual User\'s Sick Days Balance','actual user\'s sick days balance',108,NULL,4,1);
/*!40000 ALTER TABLE `report_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_params`
--

DROP TABLE IF EXISTS `report_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_params` (
  `config_id` int(3) NOT NULL,
  `param_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `fk_report_configs` (`config_id`),
  CONSTRAINT `fk_report_configs` FOREIGN KEY (`config_id`) REFERENCES `report_configs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_params`
--

LOCK TABLES `report_params` WRITE;
/*!40000 ALTER TABLE `report_params` DISABLE KEYS */;
INSERT INTO `report_params` VALUES (42,'customersProjectsSelection.qualifier','ALL'),(42,'userSelection.allUsers','true'),(42,'firstGroupingLevel','CUSTOMER'),(42,'thirdGroupingLevel','TASK'),(42,'secondGroupingLevel','PROJECT_NAME'),(42,'timeFormat','TIME'),(42,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(42,'showLeaveTime','true'),(42,'timeApprovalStatus','BOTH'),(43,'customersProjectsSelection.qualifier','ALL'),(43,'userSelection.allUsers','true'),(43,'firstGroupingLevel','CUSTOMER'),(43,'thirdGroupingLevel','TASK'),(43,'secondGroupingLevel','PROJECT_NAME'),(43,'timeFormat','TIME'),(43,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(43,'showLeaveTime','true'),(45,'customersProjectsSelection.qualifier','ALL'),(45,'userSelection.allUsers','true'),(45,'firstGroupingLevel','CUSTOMER'),(45,'thirdGroupingLevel','TASK'),(45,'secondGroupingLevel','PROJECT_NAME'),(45,'timeFormat','TIME'),(45,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(45,'showLeaveTime','true'),(46,'customersProjectsSelection.qualifier','ALL'),(46,'userSelection.allUsers','true'),(46,'firstGroupingLevel','CUSTOMER'),(46,'thirdGroupingLevel','TASK'),(46,'secondGroupingLevel','PROJECT_NAME'),(46,'timeFormat','TIME'),(46,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(46,'showLeaveTime','true'),(48,'userSelection.allUsers','true'),(48,'firstGroupingLevel','USER'),(48,'secondGroupingLevel','NONE'),(48,'columnsConfig','TIME_BALANCE_AND_OVERTIME'),(48,'timeFormat','TIME'),(48,'dateRangeSelection.qualifier','CURRENT_MONTH'),(50,'userSelection.allUsers','true'),(50,'firstGroupingLevel','USER'),(50,'secondGroupingLevel','NONE'),(50,'columnsConfig','TIME_BALANCE_AND_OVERTIME'),(50,'timeFormat','TIME'),(50,'dateRangeSelection.qualifier','CURRENT_MONTH'),(51,'userSelection.allUsers','true'),(51,'firstGroupingLevel','USER'),(51,'secondGroupingLevel','NONE'),(51,'columnsConfig','TIME_BALANCE_AND_OVERTIME'),(51,'timeFormat','TIME'),(51,'dateRangeSelection.qualifier','CURRENT_MONTH'),(52,'timeFormat','TIME'),(52,'secondGroupingLevel','TASK_NAME'),(52,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(52,'customersProjectsSelection.qualifier','SELECTED'),(52,'showOvertimeAddition','true'),(52,'showAverageRates','true'),(52,'firstGroupingLevel','PROJECT'),(52,'userSelection.allUsers','true'),(52,'thirdGroupingLevel','NONE'),(52,'showUserRates','true'),(52,'showSpentTime','true'),(52,'showLeaveTimeCosts','true'),(53,'timeFormat','TIME'),(53,'secondGroupingLevel','TASK_NAME'),(53,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(53,'customersProjectsSelection.qualifier','SELECTED'),(53,'showOvertimeAddition','true'),(53,'showAverageRates','true'),(53,'firstGroupingLevel','PROJECT'),(53,'userSelection.allUsers','true'),(53,'thirdGroupingLevel','NONE'),(53,'showUserRates','true'),(53,'showSpentTime','true'),(53,'showLeaveTimeCosts','true'),(55,'timeFormat','TIME'),(55,'secondGroupingLevel','TASK_NAME'),(55,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(55,'customersProjectsSelection.qualifier','SELECTED'),(55,'showOvertimeAddition','true'),(55,'showAverageRates','true'),(55,'firstGroupingLevel','PROJECT'),(55,'userSelection.allUsers','true'),(55,'thirdGroupingLevel','NONE'),(55,'showUserRates','true'),(55,'showSpentTime','true'),(55,'showLeaveTimeCosts','true'),(56,'timeFormat','TIME'),(56,'secondGroupingLevel','TASK_NAME'),(56,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(56,'customersProjectsSelection.qualifier','SELECTED'),(56,'showOvertimeAddition','true'),(56,'showAverageRates','true'),(56,'firstGroupingLevel','PROJECT'),(56,'userSelection.allUsers','true'),(56,'thirdGroupingLevel','NONE'),(56,'showUserRates','true'),(56,'showSpentTime','true'),(56,'showLeaveTimeCosts','true'),(58,'customersProjectsSelection.qualifier','SELECTED'),(58,'firstGroupingLevel','CUSTOMER'),(58,'thirdGroupingLevel','NONE'),(58,'joinCommentsByTask','true'),(58,'secondGroupingLevel','PROJECT'),(58,'timeFormat','TIME'),(58,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(60,'customersProjectsSelection.qualifier','SELECTED'),(60,'firstGroupingLevel','CUSTOMER'),(60,'thirdGroupingLevel','NONE'),(60,'joinCommentsByTask','true'),(60,'secondGroupingLevel','PROJECT'),(60,'timeFormat','TIME'),(60,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(61,'customersProjectsSelection.qualifier','SELECTED'),(61,'firstGroupingLevel','CUSTOMER'),(61,'thirdGroupingLevel','NONE'),(61,'joinCommentsByTask','true'),(61,'secondGroupingLevel','PROJECT'),(61,'timeFormat','TIME'),(61,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(62,'userSelection.allUsers','true'),(62,'leaveTypeSelection.leaveTypes','1'),(62,'leaveTypeSelection.qualifier','SELECTED'),(62,'firstGroupingLevel','USER'),(62,'secondGroupingLevel','DATE'),(62,'timeFormat','TIME'),(62,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(63,'userSelection.allUsers','true'),(63,'leaveTypeSelection.leaveTypes','1'),(63,'leaveTypeSelection.qualifier','SELECTED'),(63,'firstGroupingLevel','USER'),(63,'secondGroupingLevel','DATE'),(63,'timeFormat','TIME'),(63,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(65,'userSelection.allUsers','true'),(65,'leaveTypeSelection.leaveTypes','1'),(65,'leaveTypeSelection.qualifier','SELECTED'),(65,'firstGroupingLevel','USER'),(65,'secondGroupingLevel','DATE'),(65,'timeFormat','TIME'),(65,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(66,'userSelection.allUsers','true'),(66,'leaveTypeSelection.leaveTypes','1'),(66,'leaveTypeSelection.qualifier','SELECTED'),(66,'firstGroupingLevel','USER'),(66,'secondGroupingLevel','DATE'),(66,'timeFormat','TIME'),(66,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(67,'tasksConfig','COMPLETED_ONLY'),(67,'customersProjectsSelection.qualifier','SELECTED'),(67,'firstGroupingLevel','CUSTOMER'),(67,'thirdGroupingLevel','TASK'),(67,'fourthGroupingLevel','NONE'),(67,'secondGroupingLevel','PROJECT'),(67,'timeFormat','TIME'),(67,'dateSelection.qualifier','TODAY'),(67,'includeNotEstimated','true'),(68,'tasksConfig','COMPLETED_ONLY'),(68,'customersProjectsSelection.qualifier','SELECTED'),(68,'firstGroupingLevel','CUSTOMER'),(68,'thirdGroupingLevel','TASK'),(68,'fourthGroupingLevel','NONE'),(68,'secondGroupingLevel','PROJECT'),(68,'timeFormat','TIME'),(68,'dateSelection.qualifier','TODAY'),(68,'includeNotEstimated','true'),(70,'tasksConfig','COMPLETED_ONLY'),(70,'customersProjectsSelection.qualifier','SELECTED'),(70,'firstGroupingLevel','CUSTOMER'),(70,'thirdGroupingLevel','TASK'),(70,'fourthGroupingLevel','NONE'),(70,'secondGroupingLevel','PROJECT'),(70,'timeFormat','TIME'),(70,'dateSelection.qualifier','TODAY'),(70,'includeNotEstimated','true'),(71,'tasksConfig','COMPLETED_ONLY'),(71,'customersProjectsSelection.qualifier','SELECTED'),(71,'firstGroupingLevel','CUSTOMER'),(71,'thirdGroupingLevel','TASK'),(71,'fourthGroupingLevel','NONE'),(71,'secondGroupingLevel','PROJECT'),(71,'timeFormat','TIME'),(71,'dateSelection.qualifier','TODAY'),(71,'includeNotEstimated','true'),(73,'customersProjectsSelection.qualifier','ALL_ACTIVE'),(73,'firstGroupingLevel','CUSTOMER'),(73,'thirdGroupingLevel','TT_COMMENTS'),(73,'secondGroupingLevel','PROJECT'),(73,'timeFormat','TIME'),(73,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(73,'reportType','ALL_TIME_WITHIN_DATE_RANGE'),(73,'reportInfo','BILLABLE_TIME_AND_BILLABLE_AMOUNT_WITH_AVERAGE_RATES'),(75,'timeApprovalStatus','BOTH'),(75,'customersProjectsSelection.qualifier','ALL_ACTIVE'),(75,'firstGroupingLevel','CUSTOMER'),(75,'thirdGroupingLevel','TT_COMMENTS'),(75,'secondGroupingLevel','PROJECT'),(75,'timeFormat','TIME'),(75,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(75,'reportType','ALL_TIME_WITHIN_DATE_RANGE'),(75,'reportInfo','BILLABLE_TIME_AND_BILLABLE_AMOUNT_WITH_AVERAGE_RATES'),(76,'customersProjectsSelection.qualifier','ALL_ACTIVE'),(76,'firstGroupingLevel','CUSTOMER'),(76,'thirdGroupingLevel','TT_COMMENTS'),(76,'secondGroupingLevel','PROJECT'),(76,'timeFormat','TIME'),(76,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(76,'reportType','ALL_TIME_WITHIN_DATE_RANGE'),(76,'reportInfo','BILLABLE_TIME_AND_BILLABLE_AMOUNT_WITH_AVERAGE_RATES'),(57,'secondGroupingLevel','PROJECT'),(57,'thirdGroupingLevel','NONE'),(57,'firstGroupingLevel','CUSTOMER'),(57,'joinCommentsByTask','true'),(57,'timeFormat','TIME'),(57,'customersProjectsSelection.qualifier','SELECTED'),(57,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(77,'userSelection.allUsers','true'),(77,'leaveTypeSelection.qualifier','ALL'),(77,'timeFormat','TIME'),(77,'secondGroupingLevel','MONTH'),(77,'dateRangeSelection.qualifier','CURRENT_YEAR'),(77,'firstGroupingLevel','USER'),(78,'secondGroupingLevel','NONE'),(78,'firstGroupingLevel','CUSTOMER'),(78,'timeFormat','TIME'),(78,'showSpentTime','true'),(78,'customersProjectsSelection.qualifier','ALL_ACTIVE'),(78,'thirdGroupingLevel','NONE'),(78,'showAverageRates','true'),(78,'dateRangeSelection.qualifier','LAST_21_DAYS'),(79,'secondGroupingLevel','PROJECT'),(79,'firstGroupingLevel','CUSTOMER'),(79,'dateRangeSelection.fromDate','2019-01-03'),(79,'reportType','ONLY_FOR_COMPLETED_TASKS'),(79,'dateRangeSelection.toDate','2019-02-02'),(79,'customersProjectsSelection.qualifier','SELECTED'),(79,'thirdGroupingLevel','TASK'),(79,'dateRangeSelection.qualifier','CUSTOM'),(57,'customersProjectsSelection.customers','4'),(58,'customersProjectsSelection.customers','4'),(60,'customersProjectsSelection.customers','4'),(61,'customersProjectsSelection.customers','4'),(79,'customersProjectsSelection.customers','4'),(52,'customersProjectsSelection.customers','5'),(53,'customersProjectsSelection.customers','5'),(55,'customersProjectsSelection.customers','5'),(56,'customersProjectsSelection.customers','5'),(67,'customersProjectsSelection.projects','6'),(68,'customersProjectsSelection.projects','6'),(70,'customersProjectsSelection.projects','6'),(71,'customersProjectsSelection.projects','6'),(72,'customersProjectsSelection.qualifier','ALL_ACTIVE'),(72,'customersProjectsSelection.showArchivedProjects','false'),(72,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(72,'firstGroupingLevel','CUSTOMER'),(72,'reportInfo','BILLABLE_TIME_AND_BILLABLE_AMOUNT_WITH_AVERAGE_RATES'),(72,'reportType','ALL_TIME_WITHIN_DATE_RANGE'),(72,'secondGroupingLevel','PROJECT'),(72,'thirdGroupingLevel','TT_COMMENTS'),(72,'timeApprovalStatus','BOTH'),(72,'timeFormat','TIME'),(47,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(47,'firstGroupingLevel','USER'),(47,'secondGroupingLevel','NONE'),(47,'columnsConfig','TIME_BALANCE_AND_OVERTIME'),(47,'timeFormat','TIME'),(47,'userSelection.allUsers','true'),(47,'userSelection.includeUsersWithoutData','false'),(47,'userSelection.showDisabled','false'),(80,'customersProjectsSelection.qualifier','ALL_ACTIVE'),(80,'customersProjectsSelection.showArchivedProjects','false'),(80,'dateRangeSelection.qualifier','LAST_21_DAYS'),(80,'firstGroupingLevel','CUSTOMER'),(80,'secondGroupingLevel','NONE'),(80,'showAverageRates','true'),(80,'showLeaveTimeCosts','false'),(80,'showOvertimeAddition','false'),(80,'showSpentTime','true'),(80,'thirdGroupingLevel','NONE'),(80,'timeFormat','TIME'),(81,'columnsConfig','USERS'),(81,'customersProjectsSelection.customers','5'),(81,'customersProjectsSelection.qualifier','SELECTED'),(81,'customersProjectsSelection.showArchivedProjects','false'),(81,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(81,'firstGroupingLevel','PROJECT'),(81,'secondGroupingLevel','TASK_NAME'),(81,'showAverageRates','true'),(81,'showLeaveTimeCosts','true'),(81,'showOvertimeAddition','true'),(81,'showSpentTime','true'),(81,'showSubtotalsByDepartments','false'),(81,'showUserRates','true'),(81,'thirdGroupingLevel','NONE'),(81,'timeFormat','TIME'),(81,'userSelection.allUsers','true'),(81,'userSelection.includeUsersWithoutData','false'),(81,'userSelection.showDisabled','false'),(82,'customersProjectsSelection.qualifier','ALL_ACTIVE'),(82,'customersProjectsSelection.showArchivedProjects','false'),(82,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(82,'firstGroupingLevel','CUSTOMER'),(82,'reportInfo','BILLABLE_TIME_AND_BILLABLE_AMOUNT_WITH_AVERAGE_RATES'),(82,'reportType','ALL_TIME_WITHIN_DATE_RANGE'),(82,'secondGroupingLevel','PROJECT'),(82,'thirdGroupingLevel','TT_COMMENTS'),(82,'timeApprovalStatus','BOTH'),(82,'timeFormat','TIME'),(83,'columnsConfig','USERS_ONLY'),(83,'customersProjectsSelection.qualifier','ALL'),(83,'customersProjectsSelection.showArchivedProjects','false'),(83,'dateRangeSelection.qualifier','PREVIOUS_MONTH'),(83,'firstGroupingLevel','PROJECT'),(83,'secondGroupingLevel','NONE'),(83,'showLeaveTime','true'),(83,'thirdGroupingLevel','NONE'),(83,'timeApprovalStatus','BOTH'),(83,'timeFormat','TIME'),(83,'userSelection.allUsers','false'),(83,'userSelection.includeUsersWithoutData','false'),(83,'userSelection.selectedGroups','3'),(83,'userSelection.groupType','USER_GROUP'),(83,'userSelection.showDisabled','false'),(84,'dataParameters.customersProjectsSelection.qualifier','ALL'),(84,'dataParameters.customersProjectsSelection.showArchivedProjects','false'),(84,'dataParameters.dateRangeSelection.qualifier','PREVIOUS_MONTH'),(84,'dataParameters.groupingLevel','USER'),(84,'dataParameters.userSelection.allUsers','true'),(84,'dataParameters.userSelection.includeUsersWithoutData','false'),(84,'dataParameters.userSelection.showDisabled','false'),(84,'displayParameters.chartColor','DEFAULT'),(84,'displayParameters.chartType','VERTICAL_BAR'),(84,'displayParameters.showPercents','false'),(84,'displayParameters.sortOption','ALPHABETICALLY'),(84,'displayParameters.sortOrderIsAsc','true'),(85,'dataParameters.customersProjectsSelection.qualifier','ALL'),(85,'dataParameters.customersProjectsSelection.showArchivedProjects','false'),(85,'dataParameters.dateRangeSelection.qualifier','PREVIOUS_MONTH'),(85,'dataParameters.groupingLevel','CUSTOMER'),(85,'dataParameters.userSelection.allUsers','true'),(85,'dataParameters.userSelection.includeUsersWithoutData','false'),(85,'dataParameters.userSelection.showDisabled','false'),(85,'displayParameters.chartColor','DEFAULT'),(85,'displayParameters.chartType','HORIZONTAL_BAR'),(85,'displayParameters.showPercents','false'),(85,'displayParameters.sortOption','ALPHABETICALLY'),(85,'displayParameters.sortOrderIsAsc','true'),(86,'dataParameters.dateSelection.qualifier','TODAY'),(86,'dataParameters.groupingLevel','USER'),(86,'dataParameters.userSelection.allUsers','true'),(86,'dataParameters.userSelection.includeUsersWithoutData','false'),(86,'dataParameters.userSelection.showDisabled','false'),(86,'displayParameters.chartColor','FERNGREEN'),(86,'displayParameters.chartType','VERTICAL_BAR'),(86,'displayParameters.showPercents','false'),(86,'displayParameters.sortOption','ALPHABETICALLY'),(86,'displayParameters.sortOrderIsAsc','true'),(87,'dataParameters.dateSelection.qualifier','TODAY'),(87,'dataParameters.groupingLevel','USER'),(87,'dataParameters.userSelection.allUsers','true'),(87,'dataParameters.userSelection.includeUsersWithoutData','false'),(87,'dataParameters.userSelection.showDisabled','false'),(87,'displayParameters.chartColor','FERNGREEN'),(87,'displayParameters.chartType','HORIZONTAL_BAR'),(87,'displayParameters.showPercents','false'),(87,'displayParameters.sortOption','ALPHABETICALLY'),(87,'displayParameters.sortOrderIsAsc','true');
/*!40000 ALTER TABLE `report_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_seq`
--

DROP TABLE IF EXISTS `revision_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision_seq` (
  `val` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`val`)
) ENGINE=InnoDB AUTO_INCREMENT=1291 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_seq`
--

LOCK TABLES `revision_seq` WRITE;
/*!40000 ALTER TABLE `revision_seq` DISABLE KEYS */;
INSERT INTO `revision_seq` VALUES (6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(1138),(1139),(1140),(1141),(1142),(1143),(1144),(1145),(1146),(1147),(1148),(1149),(1150),(1151),(1152),(1153),(1154),(1155),(1156),(1157),(1158),(1159),(1160),(1161),(1162),(1163),(1164),(1165),(1166),(1167),(1168),(1169),(1170),(1171),(1172),(1173),(1174),(1175),(1176),(1177),(1178),(1179),(1180),(1181),(1182),(1183),(1184),(1185),(1186),(1187),(1188),(1189),(1190),(1191),(1192),(1193),(1194),(1195),(1196),(1197),(1198),(1199),(1200),(1201),(1202),(1203),(1204),(1205),(1206),(1207),(1208),(1209),(1210),(1211),(1212),(1213),(1214),(1215),(1216),(1217),(1218),(1219),(1220),(1221),(1222),(1223),(1224),(1225),(1226),(1227),(1228),(1229),(1230),(1231),(1232),(1233),(1234),(1235),(1236),(1237),(1238),(1239),(1240),(1241),(1242),(1243),(1244),(1245),(1246),(1247),(1248),(1249),(1250),(1251),(1252),(1253),(1254),(1255),(1256),(1257),(1258),(1259),(1260),(1261),(1262),(1263),(1264),(1265),(1266),(1267),(1268),(1269),(1270),(1271),(1272),(1273),(1274),(1275),(1276),(1277),(1278),(1279),(1280),(1281),(1282),(1283),(1284),(1285),(1286),(1287),(1288),(1289),(1290);
/*!40000 ALTER TABLE `revision_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scim_clients`
--

DROP TABLE IF EXISTS `scim_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scim_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scim_clients`
--

LOCK TABLES `scim_clients` WRITE;
/*!40000 ALTER TABLE `scim_clients` DISABLE KEYS */;
INSERT INTO `scim_clients` VALUES (-1,'Default');
/*!40000 ALTER TABLE `scim_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `property_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_value` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `property_name` (`property_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES ('admin_mail_address',''),('ap_mail_message_footer',''),('ap_mail_subject_prefix',''),('ap_pto_balance_enabled','true'),('ap_sick_days_balance_enabled','true'),('ap_user_groups_enabled','true'),('billing_rates_enabled','true'),('billing_types_enabled','true'),('colleagues_visibility','ALL_USERS'),('color_scheme','default'),('csv_separator','1'),('currency_sign','$'),('date_format','MMM dd, yyyy'),('days_to_notify_on_waiting_ltr','7'),('daytime_to notify_on_waiting_ltr','9:00 AM'),('decimal_separator','.'),('default_overtime_level','3'),('default_work_schedule','0,480,480,480,480,480,0'),('demo_data_choose_performed','true'),('demo_data_loading_date',NULL),('digit_grouping_symbol',''),('enable_budget_feature','true'),('enable_leave_tt','true'),('first_level_code','2'),('first_level_plural_form','Customers'),('first_level_singular_form','Customer'),('future_working_time_tracking','false'),('ltm_can_manage_auto_approved','false'),('ltm_can_see_all_requests','false'),('ltm_can_see_auto_approved','false'),('mail_daily_report_at','9:00 AM'),('mail_message_footer',''),('mail_subject_prefix',''),('maximum_hours_per_day','1440'),('notify_on_deleted_ltr','true'),('notify_on_ltr_status_changed','true'),('notify_on_modified_ltr','true'),('notify_on_new_ltr','true'),('notify_on_waiting_ltr','true'),('notify_users_ltr_created_deleted','true'),('notify_users_on_considered_ltr','true'),('overtime_rate_coefficient','1.5'),('overtime_tracking_enabled','true'),('password_check_ruleset','password_validation.length'),('password_min_length','6'),('past_leave_requests_process_type','AUTOMATICALLY_APPROVE_PAST_LEAVES'),('project_assignments_enabled','true'),('pto_accrual_rule_enabled','true'),('pto_accrual_rule_frequency_type','MONTHLY'),('pto_accrual_rule_parameters','1'),('pto_accrual_rule_value','2.0'),('pto_balance_enabled','true'),('pto_cap_rule_enabled','true'),('pto_cap_rule_value','100.0'),('pto_reset_rule_enabled','false'),('pto_reset_rule_frequency_type','ON_HIRE_DATE'),('pto_reset_rule_parameters',''),('pto_reset_rule_value','0.0'),('round_pto_balance','false'),('round_sick_balance','false'),('second_level_code','7'),('second_level_plural_form','Projects'),('second_level_singular_form','Project'),('server_uuid','50e948ae-bb90-4d9c-81d7-8be6c0d881eb'),('show_pto_in_hours','false'),('show_report_logo','true'),('show_sick_in_hours','false'),('sick_accrual_rule_enabled','true'),('sick_accrual_rule_frequency_type','MONTHLY'),('sick_accrual_rule_parameters','1'),('sick_accrual_rule_value','1.0'),('sick_cap_rule_enabled','false'),('sick_cap_rule_value','80.0'),('sick_days_balance_enabled','true'),('sick_reset_rule_enabled','true'),('sick_reset_rule_frequency_type','ON_HIRE_DATE'),('sick_reset_rule_parameters',''),('sick_reset_rule_value','0.0'),('task_workflow_enabled','true'),('third_level_code','11'),('third_level_plural_form','Tasks'),('third_level_singular_form','Task'),('time_format','hhmm'),('time_zone_groups_enabled','true'),('tt_approval_enabled','true'),('tta_last_disabling_timestamp',NULL),('user_can_edit_requests_in_past','false'),('user_group_naming_code','13'),('user_group_naming_plural_form','Departments'),('user_group_naming_singular_form','Department'),('user_groups_enabled','true'),('user_pto_enabled','true'),('user_rates_enabled','true'),('user_sick_enabled','true'),('week_start_day','2'),('work_assignments_enabled','true');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings_revision`
--

DROP TABLE IF EXISTS `system_settings_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings_revision` (
  `revision` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings_revision`
--

LOCK TABLES `system_settings_revision` WRITE;
/*!40000 ALTER TABLE `system_settings_revision` DISABLE KEYS */;
INSERT INTO `system_settings_revision` VALUES (1182);
/*!40000 ALTER TABLE `system_settings_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(3) NOT NULL,
  `project_id` int(3) NOT NULL,
  `create_timestamp` datetime NOT NULL,
  `completion_date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_lower` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `deadline_date` date DEFAULT NULL,
  `billing_type_id` int(3) unsigned NOT NULL DEFAULT '2',
  `budget` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `workflow_status_id` int(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_project_name_uk` (`project_id`,`name_lower`),
  KEY `task_customer_name_i` (`customer_id`,`name_lower`),
  KEY `fk_task_billing_type` (`billing_type_id`),
  KEY `fk_parent_task_id` (`parent_id`),
  KEY `task_completion_date_idx` (`completion_date`),
  KEY `task_budget_idx` (`budget`),
  KEY `fk_task_workflow_status` (`workflow_status_id`),
  CONSTRAINT `fk_parent_task_id` FOREIGN KEY (`parent_id`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_task_billing_type` FOREIGN KEY (`billing_type_id`) REFERENCES `billing_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_task_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_task_revision` FOREIGN KEY (`id`) REFERENCES `task_revision` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `fk_task_workflow_status` FOREIGN KEY (`workflow_status_id`) REFERENCES `workflow_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `task_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Task information. One record relates one task.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (16,3,5,'2019-03-01 00:00:00',NULL,'Page updates','page updates','there\'ll be monthly updates up to the end of the year.','2019-06-13',4,300,NULL,1),(17,3,5,'2019-02-04 00:00:00',NULL,'Page design','page design','layouts are in Maurice\'s folder (C:\\Designers\\Websites\\..)','2019-03-14',3,4800,NULL,4),(18,2,3,'2019-01-07 00:00:00','2019-01-22','Bug fixing','bug fixing','Bugs 25801 and 25803 are postponed and should be fixed later.','2019-01-21',5,1440,NULL,2),(21,2,3,'2018-12-18 00:00:00','2018-12-31','Code Integration','code integration','','2019-01-02',1,1800,NULL,3),(22,2,3,'2018-12-10 00:00:00','2018-12-19','Product catalog logic','product catalog logic','','2018-12-21',1,1200,NULL,3),(25,4,6,'2019-03-04 00:00:00',NULL,'Negotiations','negotiations','Recently all questions were settled. No further meeting is needed.','2019-03-18',6,NULL,NULL,1),(26,4,6,'2019-01-23 00:00:00',NULL,'Copywriting','copywriting','Home page, product descriptions, brief company history','2019-03-08',8,2400,NULL,5),(27,4,6,'2019-03-01 00:00:00',NULL,'Content Management','content management','','2019-03-08',7,NULL,NULL,4),(28,4,6,'2019-01-02 00:00:00','2019-01-04','Identifying site objectives & audiences','identifying site objectives & audiences','need to talk to their CEO and Marketing manager. See the contacts in our database.','2019-01-02',6,360,NULL,2),(29,4,6,'2019-02-26 00:00:00',NULL,'Bug fixing','bug fixing','Go to bug tracking system for bug descriptions','2019-03-06',5,3000,NULL,1),(30,4,6,'2019-02-13 00:00:00',NULL,'Deployment','deployment','','2019-03-29',1,3000,NULL,6),(31,4,6,'2019-02-11 00:00:00','2019-02-13','Browser testing','browser testing','','2019-02-15',1,960,NULL,2),(32,4,6,'2019-02-04 00:00:00','2019-02-08','Website structure','website structure','','2019-02-08',1,1440,NULL,3),(33,4,6,'2019-01-16 00:00:00','2019-01-24','Information Architecture design','information architecture design','','2019-01-25',1,720,NULL,2),(34,4,6,'2019-01-07 00:00:00','2019-01-16','Specifying environment: tools, framework','specifying environment: tools, framework','We need to select: on-site search engine, charts processor, captcha solution and framework for integration with CMS','2019-01-18',7,1440,NULL,2),(35,5,9,'2018-12-10 00:00:00',NULL,'Phone calls','phone calls','',NULL,2,NULL,NULL,1),(36,5,9,'2018-12-10 00:00:00',NULL,'e-mail check','e-mail check','',NULL,2,NULL,NULL,1),(37,5,9,'2018-12-12 00:00:00',NULL,'Status meetings','status meetings','',NULL,2,NULL,NULL,1),(38,2,3,'2018-12-10 00:00:00','2018-12-31','Pages interface design','pages interface design','','2018-12-21',3,1800,NULL,2),(39,2,3,'2018-12-10 00:00:00','2018-12-31','Catalog interface design','catalog interface design','color schema shall vary basing on product category','2018-12-21',3,1920,NULL,2),(40,4,6,'2019-01-07 00:00:00','2019-02-22','Pages interface design','pages interface design','layouts are in Maurice\'s folder (C:\\Designers\\Websites\\..)','2019-02-20',3,5760,NULL,2),(41,4,8,'2019-03-04 00:00:00',NULL,'Branding','branding','','2019-03-08',9,600,NULL,1),(42,4,8,'2019-03-04 00:00:00',NULL,'Mailing tools and services','mailing tools and services','Advising on mailing tools and services\r\nsee the docs on our previous clients in C:\\Archive\\Clients\\Mailing','2019-03-28',9,360,NULL,1),(43,5,11,'2019-02-27 00:00:00','2019-02-27','Installing antivirus','installing antivirus','see the AV support contacts in our Address book','2019-03-29',2,60,NULL,2),(48,5,11,'2019-02-25 00:00:00',NULL,'Traffic monitoring','traffic monitoring','',NULL,2,NULL,NULL,1),(55,5,11,'2019-02-25 00:00:00','2019-03-04','Setting up Time Management system - Evaluation','setting up time management system - evaluation','',NULL,4,300,NULL,2),(56,5,11,'2019-02-25 00:00:00',NULL,'Setting up Time Management system','setting up time management system','install the best option',NULL,4,NULL,NULL,1),(58,5,11,'2019-03-04 00:00:00','2019-01-04','Equipment ordering','equipment ordering','',NULL,2,NULL,NULL,3),(59,5,11,'2019-03-04 00:00:00',NULL,'Backup controlling','backup controlling','',NULL,2,NULL,NULL,6),(60,5,11,'2019-03-04 00:00:00',NULL,'Problem troubleshooting','problem troubleshooting','',NULL,2,NULL,NULL,1),(61,5,11,'2019-03-04 00:00:00',NULL,'Monitoring of system activity','monitoring of system activity','',NULL,2,NULL,NULL,1),(62,5,11,'2019-03-04 00:00:00',NULL,'Network Support','network support','',NULL,2,NULL,NULL,1),(63,4,6,'2019-03-04 00:00:00',NULL,'New navigation','new navigation','',NULL,3,1800,NULL,6),(65,2,3,'2019-03-04 00:00:00','2019-01-08','Logo redesign','logo redesign','','2019-01-11',3,2700,NULL,3),(67,5,10,'2019-03-04 00:00:00',NULL,'Design proposal','design proposal','',NULL,2,NULL,NULL,4),(68,5,10,'2019-03-04 00:00:00',NULL,'Budget calculations','budget calculations','Project cost estimations for clients',NULL,6,NULL,NULL,4),(69,4,8,'2019-03-04 00:00:00',NULL,'Sketches review and approval','sketches review and approval','',NULL,2,NULL,NULL,5),(70,4,8,'2019-03-04 00:00:00',NULL,'Design consulting','design consulting','',NULL,2,NULL,NULL,1),(71,5,12,'2019-03-04 00:00:00',NULL,'Budget','budget','',NULL,2,NULL,NULL,1),(72,5,12,'2019-03-04 00:00:00',NULL,'Accounting','accounting','',NULL,2,NULL,NULL,1),(73,5,12,'2019-03-04 00:00:00',NULL,'Payroll','payroll','',NULL,2,NULL,NULL,6),(74,5,12,'2019-03-04 00:00:00',NULL,'Monthly financial report','monthly financial report','Monthly reports: Income statement, balance sheet, statement of cash flows',NULL,2,NULL,NULL,1),(75,5,12,'2019-03-04 00:00:00',NULL,'Tax report','tax report','',NULL,2,NULL,NULL,5),(77,4,7,'2019-03-04 00:00:00',NULL,'Updating pictures & video','updating pictures & video','',NULL,1,NULL,NULL,1),(79,5,9,'2019-03-04 00:00:00',NULL,'Training','training','',NULL,2,NULL,NULL,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_backup`
--

DROP TABLE IF EXISTS `task_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_backup` (
  `id` int(5) DEFAULT NULL,
  `customer_id` int(3) DEFAULT NULL,
  `project_id` int(3) DEFAULT NULL,
  `create_timestamp` datetime DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_lower` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `deadline_date` date DEFAULT NULL,
  `billing_type_id` int(3) unsigned DEFAULT NULL,
  `budget` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `backup_timestamp` datetime DEFAULT NULL,
  `workflow_status_id` int(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_backup`
--

LOCK TABLES `task_backup` WRITE;
/*!40000 ALTER TABLE `task_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_last_tt_date`
--

DROP TABLE IF EXISTS `task_last_tt_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_last_tt_date` (
  `task_id` int(3) NOT NULL,
  `last_tt_date` date DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_last_tt_date`
--

LOCK TABLES `task_last_tt_date` WRITE;
/*!40000 ALTER TABLE `task_last_tt_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_last_tt_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_revision`
--

DROP TABLE IF EXISTS `task_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_revision` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_task_revision` (`revision`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_revision`
--

LOCK TABLES `task_revision` WRITE;
/*!40000 ALTER TABLE `task_revision` DISABLE KEYS */;
INSERT INTO `task_revision` VALUES (16,16),(17,17),(18,18),(21,21),(22,22),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(48,48),(55,55),(56,56),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(65,65),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(77,77),(79,79);
/*!40000 ALTER TABLE `task_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_spent_time_cache`
--

DROP TABLE IF EXISTS `task_spent_time_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_spent_time_cache` (
  `task_id` int(5) NOT NULL,
  `total` int(11) NOT NULL,
  `updating_time` bigint(13) NOT NULL,
  PRIMARY KEY (`task_id`),
  CONSTRAINT `task_spent_time_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_spent_time_cache`
--

LOCK TABLES `task_spent_time_cache` WRITE;
/*!40000 ALTER TABLE `task_spent_time_cache` DISABLE KEYS */;
INSERT INTO `task_spent_time_cache` VALUES (16,6210,1554882954426),(17,8345,1554882954426),(18,2005,1554882954426),(21,3415,1554882954426),(22,1990,1554882954426),(25,3735,1554882954426),(26,2580,1554882954426),(27,1020,1554882954426),(28,390,1554882954426),(29,4345,1554882954426),(30,3705,1554882954426),(31,690,1554882954426),(32,1350,1554882954426),(33,2850,1554882954426),(34,1060,1554882954426),(35,5390,1554882954426),(36,8720,1554882954426),(37,4145,1554882954426),(38,3350,1554882954426),(39,2765,1554882954426),(40,6685,1554882954426),(41,240,1554882954426),(42,360,1554882954426),(43,180,1554882954426),(48,2735,1554882954426),(55,270,1554882954426),(56,1560,1554882954426),(58,1920,1554882954426),(59,2670,1554882954426),(60,3890,1554882954426),(61,1740,1554882954426),(62,3270,1554882954426),(63,8905,1554882954426),(65,1320,1554882954426),(67,3870,1554882954426),(68,660,1554882954426),(69,2835,1554882954426),(70,1260,1554882954426),(71,3360,1554882954426),(72,3285,1554882954426),(73,1800,1554882954426),(74,2640,1554882954426),(75,1650,1554882954426),(77,3940,1554882954426),(79,3780,1554882954426);
/*!40000 ALTER TABLE `task_spent_time_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_user_notif_rule_send`
--

DROP TABLE IF EXISTS `task_user_notif_rule_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_user_notif_rule_send` (
  `user_notif_rule_send_id` int(5) unsigned NOT NULL,
  `task_id` int(5) NOT NULL,
  PRIMARY KEY (`user_notif_rule_send_id`,`task_id`),
  KEY `fk_task_user_notif_rule_send_task` (`task_id`),
  CONSTRAINT `fk_task_user_notif_rule_send_id` FOREIGN KEY (`user_notif_rule_send_id`) REFERENCES `user_notif_rule_send` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_task_user_notif_rule_send_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_user_notif_rule_send`
--

LOCK TABLES `task_user_notif_rule_send` WRITE;
/*!40000 ALTER TABLE `task_user_notif_rule_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_user_notif_rule_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_upload`
--

DROP TABLE IF EXISTS `temp_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_upload` (
  `bin_data_id` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `session_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bin_data_id`),
  CONSTRAINT `fk_temp_upload_bin_data_id` FOREIGN KEY (`bin_data_id`) REFERENCES `bin_data` (`bin_data_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_upload`
--

LOCK TABLES `temp_upload` WRITE;
/*!40000 ALTER TABLE `temp_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_group`
--

DROP TABLE IF EXISTS `time_zone_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_group` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tz_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_time_zone_group_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_group`
--

LOCK TABLES `time_zone_group` WRITE;
/*!40000 ALTER TABLE `time_zone_group` DISABLE KEYS */;
INSERT INTO `time_zone_group` VALUES (-1,'New York Office','ChIJOwg_06VPwokRYv534QaPC8g','America/New_York','New York'),(2,'London Office','ChIJdd4hrwug2EcRmSrV3Vo6llI','Europe/London','London'),(3,'Sydney Office','ChIJP3Sa8ziYEmsRUKgyFmh9AQM','Australia/Sydney','Sydney');
/*!40000 ALTER TABLE `time_zone_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_lock`
--

DROP TABLE IF EXISTS `tt_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_lock` (
  `locked_user_id` int(3) unsigned NOT NULL,
  `date_from` date DEFAULT NULL COMMENT 'null means locked from the creation of the world',
  `date_to` date NOT NULL,
  `when_locked` datetime NOT NULL,
  `who_locked_id` int(3) unsigned NOT NULL,
  KEY `tt_lock_who_locked_id` (`who_locked_id`),
  KEY `tt_lock_date_from_date_to_idx` (`date_from`,`date_to`),
  KEY `tt_lock_user_id_date_from_idx` (`locked_user_id`,`date_from`),
  CONSTRAINT `tt_lock_locked_user_id` FOREIGN KEY (`locked_user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tt_lock_who_locked_id` FOREIGN KEY (`who_locked_id`) REFERENCES `at_user_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_lock`
--

LOCK TABLES `tt_lock` WRITE;
/*!40000 ALTER TABLE `tt_lock` DISABLE KEYS */;
INSERT INTO `tt_lock` VALUES (10,'2019-02-09','2019-02-09','2019-03-04 00:00:00',1),(10,'2019-02-23','2019-02-23','2019-03-04 00:00:00',1),(10,'2019-02-24','2019-02-24','2019-03-04 00:00:00',1),(10,'2019-03-02','2019-03-02','2019-03-04 00:00:00',1),(10,'2019-03-03','2019-03-03','2019-03-04 00:00:00',1),(1,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(7,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(4,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(9,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(8,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(2,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(6,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(11,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(10,'2019-02-25','2019-02-25','2019-03-04 00:00:00',1),(6,'2019-02-05','2019-02-05','2019-02-09 00:00:00',1),(6,'2019-02-06','2019-02-06','2019-02-09 00:00:00',1),(6,'2019-02-08','2019-02-08','2019-02-09 00:00:00',1),(6,'2019-02-09','2019-02-09','2019-02-09 00:00:00',1),(6,'2019-02-10','2019-02-10','2019-02-09 00:00:00',1),(6,'2019-02-11','2019-02-11','2019-02-09 00:00:00',1),(10,'2019-02-10','2019-02-10','2019-02-09 00:00:00',1),(1,NULL,'2018-12-04','2018-12-05 00:00:00',1),(2,NULL,'2018-12-04','2018-12-05 00:00:00',1),(4,NULL,'2018-12-04','2018-12-05 00:00:00',1),(5,NULL,'2018-12-04','2018-12-05 00:00:00',1),(9,NULL,'2018-12-04','2018-12-05 00:00:00',1),(6,NULL,'2018-12-04','2019-02-04 00:00:00',1),(7,NULL,'2018-12-04','2019-02-04 00:00:00',1),(8,NULL,'2018-12-04','2019-02-04 00:00:00',1),(10,NULL,'2018-12-04','2019-02-04 00:00:00',1),(11,NULL,'2018-12-04','2019-02-18 00:00:00',1),(1,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(2,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(4,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(6,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(7,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(8,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(9,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(10,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(11,'2019-02-12','2019-02-12','2019-02-18 00:00:00',1),(10,'2019-02-16','2019-02-16','2019-02-18 00:00:00',1),(10,'2019-02-17','2019-02-17','2019-02-18 00:00:00',1),(6,'2019-02-07','2019-02-07','2019-02-09 00:00:00',1);
/*!40000 ALTER TABLE `tt_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_lock_revision`
--

DROP TABLE IF EXISTS `tt_lock_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_lock_revision` (
  `locked_user_id` int(3) unsigned NOT NULL,
  `date` date NOT NULL,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`locked_user_id`,`date`),
  UNIQUE KEY `uk_tt_lock_revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_lock_revision`
--

LOCK TABLES `tt_lock_revision` WRITE;
/*!40000 ALTER TABLE `tt_lock_revision` DISABLE KEYS */;
INSERT INTO `tt_lock_revision` VALUES (1,'2018-10-15',9),(10,'2019-02-09',12),(10,'2019-02-23',13),(10,'2019-02-24',14),(10,'2019-03-02',15),(10,'2019-03-03',16),(1,'2019-02-25',17),(7,'2019-02-25',18),(4,'2019-02-25',19),(9,'2019-02-25',20),(8,'2019-02-25',21),(2,'2019-02-25',22),(6,'2019-02-25',23),(11,'2019-02-25',24),(10,'2019-02-25',25),(6,'2019-02-05',26),(6,'2019-02-06',27),(6,'2019-02-08',28),(6,'2019-02-09',29),(6,'2019-02-10',30),(6,'2019-02-11',31),(10,'2019-02-10',32),(1,'2019-02-12',33),(2,'2019-02-12',34),(4,'2019-02-12',35),(6,'2019-02-12',36),(7,'2019-02-12',37),(8,'2019-02-12',38),(9,'2019-02-12',39),(10,'2019-02-12',40),(11,'2019-02-12',41),(10,'2019-02-16',42),(10,'2019-02-17',43),(6,'2019-02-07',44),(12,'2018-12-04',1243),(13,'2018-12-04',1244),(14,'2018-12-04',1245),(15,'2018-12-04',1285),(17,'2018-12-04',1286),(20,'2018-12-04',1287);
/*!40000 ALTER TABLE `tt_lock_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_metadata`
--

DROP TABLE IF EXISTS `tt_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_metadata` (
  `user_id` int(3) unsigned NOT NULL,
  `tt_date` date NOT NULL,
  `last_change_timestamp` datetime NOT NULL COMMENT 'Timestamp of the last TT changes for this user-date (either working time, leave time or overtime changes)',
  PRIMARY KEY (`user_id`,`tt_date`),
  CONSTRAINT `fk_tt_metadata_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_metadata`
--

LOCK TABLES `tt_metadata` WRITE;
/*!40000 ALTER TABLE `tt_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tt_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_record`
--

DROP TABLE IF EXISTS `tt_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_record` (
  `user_id` int(3) unsigned NOT NULL,
  `task_id` int(5) NOT NULL,
  `record_date` date NOT NULL,
  `actuals` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`,`record_date`),
  KEY `tt_record_user_i` (`user_id`),
  KEY `tt_record_task_id_record_date_idx` (`task_id`,`record_date`),
  KEY `tt_record_user_id_record_date_idx` (`user_id`,`record_date`),
  CONSTRAINT `fk_tt_record_revision` FOREIGN KEY (`user_id`, `task_id`, `record_date`) REFERENCES `tt_revision` (`user_id`, `task_id`, `record_date`) ON DELETE NO ACTION,
  CONSTRAINT `fk_tt_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tt_user` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_record`
--

LOCK TABLES `tt_record` WRITE;
/*!40000 ALTER TABLE `tt_record` DISABLE KEYS */;
INSERT INTO `tt_record` VALUES (1,35,'2019-02-04',120),(1,35,'2019-02-05',45),(1,35,'2019-02-06',135),(1,35,'2019-02-07',105),(1,35,'2019-02-11',30),(1,35,'2019-02-13',60),(1,35,'2019-02-18',30),(1,35,'2019-02-20',90),(1,35,'2019-02-22',105),(1,35,'2019-02-25',30),(1,35,'2019-02-27',45),(1,35,'2019-02-28',90),(1,35,'2019-03-04',60),(1,35,'2019-03-05',30),(1,36,'2018-12-05',120),(1,36,'2018-12-11',120),(1,36,'2018-12-27',120),(1,36,'2019-01-22',60),(1,36,'2019-02-05',120),(1,36,'2019-02-07',60),(1,36,'2019-02-08',105),(1,36,'2019-02-11',90),(1,36,'2019-02-15',20),(1,37,'2019-02-05',90),(1,37,'2019-02-06',60),(1,37,'2019-02-11',90),(1,37,'2019-02-13',120),(1,37,'2019-02-15',20),(1,37,'2019-02-18',90),(1,43,'2019-02-27',180),(1,48,'2018-12-05',120),(1,48,'2018-12-17',180),(1,48,'2018-12-20',60),(1,48,'2019-01-01',180),(1,48,'2019-01-10',180),(1,48,'2019-01-14',120),(1,48,'2019-01-15',60),(1,48,'2019-01-23',120),(1,48,'2019-02-04',60),(1,48,'2019-02-06',60),(1,48,'2019-02-07',120),(1,48,'2019-02-08',120),(1,48,'2019-02-11',120),(1,48,'2019-02-12',270),(1,48,'2019-02-13',255),(1,48,'2019-02-15',80),(1,48,'2019-02-18',105),(1,48,'2019-02-19',60),(1,48,'2019-02-20',90),(1,48,'2019-02-22',105),(1,48,'2019-02-23',120),(1,48,'2019-02-25',30),(1,48,'2019-02-26',30),(1,48,'2019-02-27',60),(1,48,'2019-02-28',30),(1,55,'2019-02-28',90),(1,55,'2019-03-04',180),(1,56,'2019-01-14',240),(1,56,'2019-01-18',120),(1,56,'2019-01-23',180),(1,56,'2019-01-31',120),(1,56,'2019-02-04',60),(1,56,'2019-02-08',60),(1,56,'2019-02-09',90),(1,56,'2019-02-11',60),(1,56,'2019-02-12',180),(1,56,'2019-02-18',60),(1,56,'2019-02-19',120),(1,56,'2019-02-20',60),(1,56,'2019-02-22',90),(1,58,'2018-12-06',360),(1,58,'2018-12-07',360),(1,58,'2018-12-15',60),(1,58,'2018-12-20',120),(1,58,'2018-12-21',120),(1,58,'2018-12-27',180),(1,58,'2018-12-28',120),(1,58,'2019-01-01',180),(1,58,'2019-01-03',120),(1,58,'2019-01-04',240),(1,58,'2019-01-07',60),(1,59,'2018-12-10',360),(1,59,'2018-12-18',120),(1,59,'2018-12-19',30),(1,59,'2018-12-21',180),(1,59,'2018-12-31',300),(1,59,'2019-01-07',120),(1,59,'2019-01-11',120),(1,59,'2019-01-16',480),(1,59,'2019-01-21',180),(1,59,'2019-02-26',120),(1,59,'2019-02-27',180),(1,59,'2019-03-04',180),(1,59,'2019-03-05',300),(1,60,'2018-12-13',240),(1,60,'2018-12-14',180),(1,60,'2018-12-27',60),(1,60,'2018-12-28',240),(1,60,'2019-01-03',180),(1,60,'2019-01-04',105),(1,60,'2019-01-08',180),(1,60,'2019-01-09',180),(1,60,'2019-01-15',225),(1,60,'2019-01-18',120),(1,60,'2019-01-22',240),(1,60,'2019-01-30',360),(1,60,'2019-01-31',120),(1,60,'2019-02-18',120),(1,60,'2019-02-19',160),(1,60,'2019-02-20',180),(1,60,'2019-02-25',300),(1,60,'2019-02-26',280),(1,60,'2019-02-28',180),(1,60,'2019-03-01',120),(1,60,'2019-03-02',120),(1,61,'2018-12-11',240),(1,61,'2018-12-13',120),(1,61,'2018-12-17',60),(1,61,'2018-12-19',180),(1,61,'2018-12-20',120),(1,61,'2018-12-21',120),(1,61,'2019-01-07',240),(1,61,'2019-01-10',120),(1,61,'2019-01-11',120),(1,61,'2019-01-23',60),(1,61,'2019-01-28',360),(1,62,'2018-12-12',360),(1,62,'2018-12-14',180),(1,62,'2018-12-17',120),(1,62,'2018-12-18',240),(1,62,'2018-12-19',150),(1,62,'2018-12-20',60),(1,62,'2018-12-31',60),(1,62,'2019-01-02',360),(1,62,'2019-01-04',120),(1,62,'2019-01-08',180),(1,62,'2019-01-09',120),(1,62,'2019-01-10',60),(1,62,'2019-01-11',120),(1,62,'2019-01-17',360),(1,62,'2019-01-21',180),(1,62,'2019-01-29',360),(1,62,'2019-01-31',120),(1,62,'2019-03-05',120),(1,79,'2019-02-04',180),(1,79,'2019-02-05',180),(1,79,'2019-02-06',180),(1,79,'2019-02-07',120),(1,79,'2019-02-08',120),(1,79,'2019-02-19',120),(2,18,'2018-12-21',120),(2,18,'2018-12-24',120),(2,18,'2018-12-25',180),(2,18,'2018-12-26',200),(2,18,'2018-12-27',150),(2,18,'2018-12-28',60),(2,18,'2018-12-31',150),(2,18,'2019-01-01',120),(2,18,'2019-01-02',300),(2,18,'2019-01-04',180),(2,18,'2019-01-07',110),(2,18,'2019-01-08',225),(2,18,'2019-01-21',60),(2,18,'2019-01-22',30),(2,21,'2018-12-10',120),(2,21,'2018-12-11',120),(2,21,'2018-12-13',240),(2,21,'2018-12-17',180),(2,21,'2018-12-18',120),(2,21,'2018-12-19',270),(2,21,'2018-12-20',240),(2,21,'2018-12-21',330),(2,21,'2018-12-24',300),(2,21,'2018-12-25',165),(2,21,'2018-12-26',190),(2,21,'2018-12-27',210),(2,21,'2018-12-28',270),(2,21,'2018-12-31',180),(2,21,'2019-01-03',300),(2,21,'2019-01-04',180),(2,22,'2018-12-10',105),(2,22,'2018-12-11',330),(2,22,'2018-12-12',225),(2,22,'2018-12-13',180),(2,22,'2018-12-14',180),(2,22,'2018-12-17',150),(2,22,'2018-12-18',130),(2,22,'2018-12-19',120),(2,22,'2018-12-20',180),(2,22,'2018-12-31',120),(2,22,'2019-01-01',150),(2,22,'2019-01-02',120),(2,25,'2019-01-21',120),(2,25,'2019-01-24',75),(2,27,'2019-03-05',120),(2,29,'2019-02-12',40),(2,29,'2019-02-17',180),(2,29,'2019-02-19',120),(2,29,'2019-02-20',120),(2,29,'2019-02-21',180),(2,29,'2019-02-25',120),(2,29,'2019-02-26',150),(2,29,'2019-02-27',240),(2,29,'2019-02-28',240),(2,29,'2019-03-01',270),(2,29,'2019-03-04',210),(2,29,'2019-03-05',120),(2,30,'2019-02-11',120),(2,30,'2019-02-12',160),(2,30,'2019-02-13',300),(2,30,'2019-02-14',140),(2,30,'2019-02-15',390),(2,30,'2019-02-18',270),(2,30,'2019-02-19',300),(2,30,'2019-02-20',330),(2,30,'2019-02-21',255),(2,30,'2019-02-22',390),(2,30,'2019-02-25',330),(2,30,'2019-02-26',240),(2,30,'2019-02-27',180),(2,30,'2019-02-28',120),(2,30,'2019-03-05',180),(2,31,'2019-02-11',330),(2,31,'2019-02-12',240),(2,31,'2019-02-13',120),(2,32,'2019-02-04',225),(2,32,'2019-02-05',300),(2,32,'2019-02-06',300),(2,32,'2019-02-07',240),(2,32,'2019-02-08',285),(2,33,'2019-01-14',240),(2,33,'2019-01-15',300),(2,33,'2019-01-16',180),(2,33,'2019-01-17',390),(2,33,'2019-01-18',225),(2,33,'2019-01-21',240),(2,33,'2019-01-22',75),(2,33,'2019-01-23',300),(2,33,'2019-01-24',345),(2,33,'2019-02-04',120),(2,33,'2019-02-05',120),(2,33,'2019-02-06',150),(2,33,'2019-02-08',165),(2,34,'2019-01-07',100),(2,34,'2019-01-08',165),(2,34,'2019-01-09',240),(2,34,'2019-01-14',195),(2,34,'2019-01-15',60),(2,34,'2019-01-16',90),(2,34,'2019-01-18',210),(2,35,'2018-12-12',15),(2,35,'2018-12-14',30),(2,35,'2019-01-15',60),(2,35,'2019-01-18',15),(2,35,'2019-02-04',30),(2,35,'2019-02-07',30),(2,35,'2019-02-12',10),(2,35,'2019-02-13',30),(2,35,'2019-02-14',10),(2,35,'2019-02-15',30),(2,35,'2019-02-20',15),(2,35,'2019-02-25',15),(2,35,'2019-02-27',40),(2,35,'2019-03-04',60),(2,36,'2018-12-10',30),(2,36,'2018-12-11',30),(2,36,'2018-12-12',30),(2,36,'2018-12-13',60),(2,36,'2018-12-14',30),(2,36,'2018-12-17',30),(2,36,'2018-12-18',30),(2,36,'2018-12-19',30),(2,36,'2018-12-20',60),(2,36,'2018-12-21',30),(2,36,'2018-12-24',30),(2,36,'2018-12-25',30),(2,36,'2018-12-27',60),(2,36,'2018-12-28',30),(2,36,'2018-12-31',30),(2,36,'2019-01-01',30),(2,36,'2019-01-02',30),(2,36,'2019-01-04',60),(2,36,'2019-01-07',30),(2,36,'2019-01-08',30),(2,36,'2019-01-15',30),(2,36,'2019-01-16',30),(2,36,'2019-01-17',60),(2,36,'2019-01-18',30),(2,36,'2019-01-21',60),(2,36,'2019-01-23',30),(2,36,'2019-01-24',60),(2,36,'2019-02-05',60),(2,36,'2019-02-06',30),(2,36,'2019-02-07',30),(2,36,'2019-02-08',30),(2,36,'2019-02-11',30),(2,36,'2019-02-12',30),(2,36,'2019-02-13',30),(2,36,'2019-02-14',30),(2,36,'2019-02-15',60),(2,36,'2019-02-18',30),(2,36,'2019-02-19',30),(2,36,'2019-02-20',30),(2,36,'2019-02-21',30),(2,36,'2019-02-25',30),(2,36,'2019-02-26',30),(2,36,'2019-02-27',20),(2,36,'2019-02-28',30),(2,36,'2019-03-04',30),(2,36,'2019-03-05',30),(2,37,'2018-12-12',60),(2,37,'2018-12-14',30),(2,37,'2018-12-27',60),(2,37,'2019-01-14',90),(2,37,'2019-01-17',30),(2,37,'2019-02-04',15),(2,37,'2019-02-07',60),(2,37,'2019-02-26',60),(2,37,'2019-02-28',120),(2,37,'2019-03-04',60),(2,39,'2018-12-18',220),(2,39,'2018-12-19',60),(2,39,'2019-01-01',240),(2,39,'2019-01-03',60),(2,39,'2019-01-04',60),(2,40,'2019-01-07',180),(2,40,'2019-01-08',60),(2,42,'2019-01-22',180),(2,42,'2019-01-23',180),(2,56,'2019-02-07',120),(2,63,'2019-01-07',60),(2,63,'2019-01-16',180),(2,69,'2019-01-22',75),(2,79,'2018-12-10',180),(2,79,'2018-12-12',120),(2,79,'2018-12-14',60),(2,79,'2018-12-24',120),(2,79,'2018-12-25',120),(2,79,'2018-12-28',120),(2,79,'2019-03-04',120),(4,17,'2018-12-17',180),(4,17,'2018-12-21',180),(4,17,'2019-02-04',185),(4,17,'2019-02-05',150),(4,17,'2019-02-06',90),(4,17,'2019-02-07',130),(4,17,'2019-02-11',180),(4,17,'2019-02-12',135),(4,17,'2019-02-13',210),(4,17,'2019-02-14',360),(4,17,'2019-02-15',135),(4,17,'2019-02-18',260),(4,17,'2019-02-20',300),(4,17,'2019-02-21',280),(4,17,'2019-02-22',220),(4,17,'2019-03-04',180),(4,17,'2019-03-05',280),(4,26,'2019-01-23',150),(4,26,'2019-01-24',165),(4,26,'2019-01-28',120),(4,26,'2019-01-30',90),(4,26,'2019-01-31',120),(4,26,'2019-02-04',60),(4,26,'2019-02-05',90),(4,26,'2019-02-06',90),(4,26,'2019-02-07',105),(4,26,'2019-02-11',60),(4,26,'2019-02-13',90),(4,26,'2019-02-18',30),(4,26,'2019-02-19',60),(4,26,'2019-02-20',30),(4,28,'2019-01-02',210),(4,28,'2019-01-03',90),(4,28,'2019-01-04',90),(4,35,'2018-12-05',60),(4,35,'2018-12-10',60),(4,35,'2018-12-11',30),(4,35,'2018-12-13',90),(4,35,'2018-12-14',45),(4,35,'2018-12-17',30),(4,35,'2018-12-18',20),(4,35,'2018-12-19',30),(4,35,'2018-12-20',60),(4,35,'2018-12-25',30),(4,35,'2018-12-27',15),(4,35,'2018-12-28',45),(4,35,'2018-12-31',30),(4,35,'2019-01-01',30),(4,35,'2019-01-02',15),(4,35,'2019-01-03',45),(4,35,'2019-01-04',15),(4,35,'2019-01-07',30),(4,35,'2019-01-09',40),(4,35,'2019-01-14',20),(4,35,'2019-01-15',30),(4,35,'2019-01-16',45),(4,35,'2019-01-18',10),(4,35,'2019-01-23',20),(4,35,'2019-01-24',15),(4,35,'2019-01-28',30),(4,35,'2019-01-29',15),(4,35,'2019-01-30',30),(4,35,'2019-02-04',15),(4,35,'2019-02-05',30),(4,35,'2019-02-06',30),(4,35,'2019-02-07',20),(4,35,'2019-02-11',30),(4,35,'2019-02-12',30),(4,35,'2019-02-14',20),(4,35,'2019-02-18',10),(4,35,'2019-02-20',20),(4,35,'2019-02-21',20),(4,35,'2019-02-22',20),(4,35,'2019-03-05',20),(4,36,'2018-12-05',60),(4,36,'2018-12-10',60),(4,36,'2018-12-11',60),(4,36,'2018-12-13',60),(4,36,'2018-12-14',60),(4,36,'2018-12-17',60),(4,36,'2018-12-18',60),(4,36,'2018-12-19',60),(4,36,'2018-12-20',60),(4,36,'2018-12-24',30),(4,36,'2018-12-25',60),(4,36,'2018-12-27',60),(4,36,'2018-12-28',60),(4,36,'2019-01-01',60),(4,36,'2019-01-02',15),(4,36,'2019-01-03',60),(4,36,'2019-01-07',90),(4,36,'2019-01-09',60),(4,36,'2019-01-10',40),(4,36,'2019-01-11',30),(4,36,'2019-01-15',60),(4,36,'2019-01-18',60),(4,36,'2019-01-24',30),(4,36,'2019-01-28',30),(4,36,'2019-01-30',60),(4,36,'2019-02-04',60),(4,36,'2019-02-06',60),(4,36,'2019-02-07',60),(4,36,'2019-02-11',60),(4,36,'2019-02-14',60),(4,36,'2019-02-18',60),(4,36,'2019-02-19',60),(4,36,'2019-02-21',60),(4,36,'2019-02-22',60),(4,37,'2018-12-05',120),(4,37,'2018-12-07',60),(4,37,'2018-12-12',60),(4,37,'2018-12-24',60),(4,37,'2018-12-26',60),(4,37,'2019-01-14',60),(4,37,'2019-01-28',60),(4,37,'2019-02-12',90),(4,37,'2019-03-04',120),(4,38,'2018-12-10',150),(4,38,'2018-12-11',165),(4,38,'2018-12-12',75),(4,38,'2018-12-13',180),(4,38,'2018-12-14',180),(4,38,'2018-12-17',70),(4,38,'2018-12-18',240),(4,38,'2018-12-19',300),(4,38,'2018-12-20',270),(4,38,'2018-12-21',300),(4,38,'2018-12-24',60),(4,38,'2018-12-25',165),(4,38,'2018-12-26',215),(4,38,'2018-12-27',65),(4,38,'2018-12-28',30),(4,38,'2018-12-31',330),(4,38,'2019-01-03',255),(4,38,'2019-01-08',300),(4,39,'2018-12-10',210),(4,39,'2018-12-11',225),(4,39,'2018-12-12',210),(4,39,'2018-12-13',150),(4,39,'2018-12-14',195),(4,39,'2018-12-17',140),(4,39,'2018-12-18',175),(4,39,'2018-12-19',90),(4,39,'2018-12-20',75),(4,39,'2018-12-21',45),(4,39,'2018-12-25',195),(4,39,'2018-12-26',130),(4,39,'2018-12-28',105),(4,39,'2018-12-31',120),(4,39,'2019-01-02',60),(4,40,'2019-01-07',60),(4,40,'2019-01-08',75),(4,40,'2019-01-09',80),(4,40,'2019-01-10',260),(4,40,'2019-01-11',285),(4,40,'2019-01-14',270),(4,40,'2019-01-15',360),(4,40,'2019-01-16',315),(4,40,'2019-01-17',345),(4,40,'2019-01-18',330),(4,40,'2019-01-23',220),(4,40,'2019-01-24',300),(4,40,'2019-01-26',120),(4,40,'2019-01-28',240),(4,40,'2019-01-29',300),(4,40,'2019-01-30',300),(4,40,'2019-01-31',310),(4,40,'2019-02-04',130),(4,40,'2019-02-05',150),(4,40,'2019-02-06',180),(4,40,'2019-02-07',165),(4,40,'2019-02-11',150),(4,40,'2019-02-12',165),(4,40,'2019-02-13',180),(4,40,'2019-02-14',90),(4,40,'2019-02-15',150),(4,40,'2019-02-18',90),(4,40,'2019-02-19',240),(4,40,'2019-02-20',165),(4,40,'2019-02-21',120),(4,40,'2019-02-22',180),(4,40,'2019-03-05',120),(4,41,'2019-03-04',180),(4,41,'2019-03-05',60),(4,63,'2018-12-06',360),(4,63,'2018-12-07',240),(4,63,'2018-12-12',45),(4,63,'2018-12-24',330),(4,63,'2018-12-25',30),(4,63,'2018-12-26',60),(4,63,'2018-12-27',240),(4,63,'2018-12-28',120),(4,63,'2019-01-01',360),(4,63,'2019-01-02',180),(4,63,'2019-01-04',75),(4,63,'2019-01-08',60),(4,63,'2019-01-09',240),(4,63,'2019-01-10',180),(4,63,'2019-01-11',60),(4,63,'2019-01-14',60),(4,63,'2019-01-16',180),(4,63,'2019-01-17',30),(4,63,'2019-01-18',120),(4,63,'2019-01-23',60),(4,63,'2019-01-26',60),(4,63,'2019-01-31',60),(4,65,'2018-12-05',240),(4,65,'2018-12-06',120),(4,65,'2018-12-07',180),(4,65,'2019-01-03',60),(4,65,'2019-01-04',300),(4,65,'2019-01-07',300),(4,65,'2019-01-08',120),(5,25,'2018-12-05',240),(5,25,'2018-12-10',60),(5,25,'2018-12-12',300),(5,25,'2018-12-14',240),(5,25,'2018-12-25',120),(5,25,'2019-01-01',120),(5,25,'2019-01-03',240),(5,25,'2019-01-04',240),(5,35,'2018-12-07',60),(5,35,'2018-12-10',60),(5,35,'2018-12-12',60),(5,35,'2018-12-26',60),(5,35,'2019-01-01',30),(5,35,'2019-01-03',30),(5,35,'2019-01-04',30),(5,36,'2018-12-07',120),(5,36,'2018-12-10',60),(5,36,'2018-12-12',60),(5,36,'2018-12-25',60),(5,36,'2018-12-26',120),(5,36,'2018-12-27',60),(5,36,'2019-01-01',30),(5,36,'2019-01-03',30),(5,36,'2019-01-04',30),(5,37,'2018-12-05',240),(5,37,'2018-12-07',60),(5,37,'2018-12-12',120),(5,37,'2018-12-25',60),(5,37,'2018-12-26',60),(5,37,'2018-12-27',60),(5,37,'2018-12-28',120),(5,37,'2019-01-01',60),(5,37,'2019-01-03',60),(5,37,'2019-01-04',60),(5,67,'2018-12-07',240),(5,67,'2018-12-10',300),(5,67,'2018-12-11',360),(5,67,'2018-12-13',480),(5,68,'2018-12-06',480),(5,68,'2018-12-11',180),(5,69,'2018-12-25',180),(5,69,'2018-12-26',60),(5,69,'2018-12-27',360),(5,69,'2019-01-01',240),(5,70,'2018-12-24',480),(5,70,'2018-12-26',120),(5,70,'2018-12-28',360),(6,16,'2019-02-12',450),(6,16,'2019-02-14',180),(6,16,'2019-02-15',210),(6,16,'2019-02-26',120),(6,16,'2019-02-27',60),(6,16,'2019-03-01',300),(6,17,'2019-02-06',210),(6,17,'2019-02-07',120),(6,17,'2019-02-08',180),(6,17,'2019-02-13',300),(6,17,'2019-02-14',270),(6,17,'2019-02-15',240),(6,17,'2019-02-19',120),(6,17,'2019-02-20',180),(6,17,'2019-02-21',150),(6,17,'2019-02-22',240),(6,17,'2019-02-23',180),(6,17,'2019-02-27',300),(6,17,'2019-02-28',180),(6,17,'2019-03-02',330),(6,35,'2019-02-13',30),(6,35,'2019-02-26',60),(6,35,'2019-03-01',30),(6,35,'2019-03-05',20),(6,36,'2019-02-05',30),(6,36,'2019-02-06',30),(6,36,'2019-02-07',60),(6,36,'2019-02-08',60),(6,36,'2019-02-12',30),(6,36,'2019-02-13',30),(6,36,'2019-02-14',30),(6,36,'2019-02-15',30),(6,36,'2019-02-19',30),(6,36,'2019-02-21',60),(6,36,'2019-02-22',30),(6,36,'2019-02-26',60),(6,36,'2019-02-27',30),(6,36,'2019-03-01',30),(6,36,'2019-03-05',60),(6,37,'2019-02-05',60),(6,37,'2019-02-13',120),(6,37,'2019-02-22',30),(6,37,'2019-02-26',120),(6,37,'2019-03-01',60),(6,63,'2019-02-05',210),(6,63,'2019-02-06',240),(6,63,'2019-02-07',180),(6,63,'2019-02-08',240),(6,63,'2019-02-19',330),(6,63,'2019-02-20',90),(6,63,'2019-02-21',270),(6,63,'2019-02-22',180),(6,63,'2019-02-23',300),(6,63,'2019-02-26',120),(6,63,'2019-02-27',90),(6,63,'2019-03-01',60),(6,63,'2019-03-02',120),(6,63,'2019-03-05',270),(6,77,'2019-03-05',150),(6,79,'2019-02-05',180),(6,79,'2019-02-07',120),(7,25,'2019-02-04',120),(7,25,'2019-02-05',60),(7,25,'2019-02-06',150),(7,25,'2019-02-07',90),(7,25,'2019-02-08',60),(7,25,'2019-02-13',180),(7,25,'2019-02-18',60),(7,25,'2019-02-19',60),(7,25,'2019-02-20',240),(7,25,'2019-02-22',360),(7,25,'2019-02-26',240),(7,25,'2019-02-28',60),(7,25,'2019-03-01',180),(7,25,'2019-03-04',120),(7,35,'2019-02-04',60),(7,35,'2019-02-05',60),(7,35,'2019-02-06',60),(7,35,'2019-02-07',60),(7,35,'2019-02-08',60),(7,35,'2019-02-11',30),(7,35,'2019-02-12',60),(7,35,'2019-02-13',60),(7,35,'2019-02-18',60),(7,35,'2019-02-19',90),(7,35,'2019-02-20',60),(7,35,'2019-02-21',60),(7,35,'2019-02-25',30),(7,35,'2019-02-26',30),(7,35,'2019-02-27',90),(7,35,'2019-03-01',60),(7,35,'2019-03-04',30),(7,35,'2019-03-05',180),(7,36,'2019-02-04',120),(7,36,'2019-02-05',120),(7,36,'2019-02-06',120),(7,36,'2019-02-07',120),(7,36,'2019-02-08',120),(7,36,'2019-02-11',30),(7,36,'2019-02-12',60),(7,36,'2019-02-18',30),(7,36,'2019-02-19',30),(7,36,'2019-02-20',60),(7,36,'2019-02-21',60),(7,36,'2019-02-22',60),(7,36,'2019-02-25',60),(7,36,'2019-02-26',60),(7,36,'2019-02-27',60),(7,36,'2019-02-28',60),(7,36,'2019-03-01',90),(7,36,'2019-03-02',60),(7,36,'2019-03-04',30),(7,36,'2019-03-05',30),(7,37,'2019-02-05',90),(7,37,'2019-02-11',60),(7,37,'2019-02-13',120),(7,37,'2019-02-19',60),(7,37,'2019-02-21',120),(7,37,'2019-02-25',120),(7,37,'2019-03-04',120),(7,37,'2019-03-05',60),(7,67,'2019-02-04',120),(7,67,'2019-02-07',210),(7,67,'2019-02-08',60),(7,67,'2019-02-11',180),(7,67,'2019-02-12',210),(7,67,'2019-02-18',210),(7,67,'2019-02-19',180),(7,67,'2019-02-20',180),(7,67,'2019-02-21',60),(7,67,'2019-02-22',60),(7,67,'2019-02-25',120),(7,67,'2019-02-26',180),(7,67,'2019-02-27',210),(7,67,'2019-02-28',60),(7,67,'2019-03-01',30),(7,67,'2019-03-02',120),(7,67,'2019-03-04',120),(7,67,'2019-03-05',180),(7,69,'2019-02-04',60),(7,69,'2019-02-05',210),(7,69,'2019-02-06',210),(7,69,'2019-02-07',60),(7,69,'2019-02-08',60),(7,69,'2019-02-12',210),(7,69,'2019-02-18',180),(7,69,'2019-02-19',120),(7,69,'2019-02-21',120),(7,69,'2019-02-25',180),(7,69,'2019-02-27',120),(7,69,'2019-02-28',180),(7,69,'2019-03-04',120),(7,69,'2019-03-05',90),(7,70,'2019-02-11',120),(7,70,'2019-02-13',180),(8,16,'2019-02-04',180),(8,16,'2019-02-05',60),(8,16,'2019-02-06',120),(8,16,'2019-02-07',180),(8,16,'2019-02-08',60),(8,16,'2019-02-12',120),(8,16,'2019-02-18',180),(8,16,'2019-02-20',240),(8,16,'2019-02-28',240),(8,16,'2019-03-01',240),(8,17,'2019-02-04',60),(8,17,'2019-02-07',60),(8,17,'2019-02-11',120),(8,17,'2019-02-12',240),(8,17,'2019-02-13',180),(8,17,'2019-02-14',120),(8,17,'2019-02-19',180),(8,17,'2019-02-20',240),(8,17,'2019-02-22',300),(8,17,'2019-02-25',180),(8,17,'2019-02-26',180),(8,17,'2019-03-01',30),(8,29,'2019-02-04',60),(8,29,'2019-02-05',270),(8,29,'2019-02-06',120),(8,29,'2019-02-11',180),(8,29,'2019-02-12',120),(8,29,'2019-02-13',240),(8,29,'2019-02-14',60),(8,29,'2019-02-15',150),(8,29,'2019-02-18',105),(8,29,'2019-02-19',180),(8,29,'2019-02-25',180),(8,29,'2019-02-26',270),(8,29,'2019-02-28',90),(8,29,'2019-03-04',270),(8,29,'2019-03-05',60),(8,36,'2019-02-06',60),(8,36,'2019-02-08',30),(8,36,'2019-02-25',60),(8,36,'2019-02-28',30),(8,36,'2019-03-01',30),(8,36,'2019-03-04',30),(8,36,'2019-03-05',60),(8,37,'2019-03-05',60),(8,63,'2019-02-05',150),(8,63,'2019-02-06',180),(8,63,'2019-02-07',120),(8,63,'2019-02-08',340),(8,63,'2019-02-11',120),(8,63,'2019-02-14',300),(8,63,'2019-02-15',270),(8,63,'2019-02-18',255),(8,63,'2019-02-19',120),(8,63,'2019-02-22',120),(8,63,'2019-02-25',120),(8,63,'2019-02-28',120),(8,63,'2019-03-01',120),(8,63,'2019-03-04',180),(8,63,'2019-03-05',300),(8,79,'2019-02-04',180),(8,79,'2019-02-07',120),(8,79,'2019-02-11',60),(8,79,'2019-02-13',60),(8,79,'2019-02-15',60),(9,35,'2018-12-07',60),(9,35,'2018-12-11',30),(9,35,'2018-12-17',60),(9,35,'2018-12-21',60),(9,35,'2018-12-25',30),(9,35,'2018-12-28',30),(9,35,'2019-01-07',30),(9,35,'2019-01-10',30),(9,35,'2019-01-15',60),(9,35,'2019-01-17',30),(9,35,'2019-01-18',60),(9,35,'2019-01-23',30),(9,35,'2019-01-29',30),(9,35,'2019-02-05',30),(9,35,'2019-02-06',30),(9,35,'2019-02-13',30),(9,35,'2019-02-15',60),(9,35,'2019-02-19',30),(9,35,'2019-02-21',60),(9,35,'2019-02-22',60),(9,35,'2019-02-25',30),(9,35,'2019-02-27',60),(9,35,'2019-03-01',30),(9,35,'2019-03-05',45),(9,36,'2018-12-07',60),(9,36,'2018-12-11',30),(9,36,'2018-12-19',60),(9,36,'2018-12-21',30),(9,36,'2018-12-24',30),(9,36,'2018-12-28',30),(9,36,'2019-01-02',30),(9,36,'2019-01-07',30),(9,36,'2019-01-11',60),(9,36,'2019-01-15',60),(9,36,'2019-01-16',90),(9,36,'2019-01-18',60),(9,36,'2019-01-24',60),(9,36,'2019-01-28',30),(9,36,'2019-01-30',60),(9,36,'2019-02-04',60),(9,36,'2019-02-06',30),(9,36,'2019-02-08',30),(9,36,'2019-02-15',60),(9,36,'2019-02-19',30),(9,36,'2019-02-25',30),(9,36,'2019-02-26',30),(9,36,'2019-02-28',30),(9,36,'2019-03-04',60),(9,71,'2018-12-05',240),(9,71,'2018-12-10',120),(9,71,'2018-12-11',180),(9,71,'2018-12-12',240),(9,71,'2018-12-13',240),(9,71,'2018-12-14',240),(9,71,'2018-12-17',120),(9,71,'2018-12-18',120),(9,71,'2018-12-25',120),(9,71,'2018-12-26',120),(9,71,'2018-12-27',60),(9,71,'2019-01-08',60),(9,71,'2019-01-15',120),(9,71,'2019-01-17',60),(9,71,'2019-01-28',60),(9,71,'2019-01-29',120),(9,71,'2019-02-05',60),(9,71,'2019-02-07',120),(9,71,'2019-02-14',180),(9,71,'2019-02-18',60),(9,71,'2019-02-21',240),(9,71,'2019-02-22',180),(9,71,'2019-02-27',120),(9,71,'2019-03-04',60),(9,71,'2019-03-05',120),(9,72,'2018-12-06',120),(9,72,'2018-12-10',120),(9,72,'2018-12-17',60),(9,72,'2018-12-18',120),(9,72,'2018-12-24',30),(9,72,'2018-12-26',120),(9,72,'2018-12-27',30),(9,72,'2019-01-02',120),(9,72,'2019-01-07',180),(9,72,'2019-01-10',210),(9,72,'2019-01-14',240),(9,72,'2019-01-16',60),(9,72,'2019-01-18',60),(9,72,'2019-01-21',120),(9,72,'2019-01-24',120),(9,72,'2019-01-28',120),(9,72,'2019-01-29',30),(9,72,'2019-02-04',180),(9,72,'2019-02-07',120),(9,72,'2019-02-12',240),(9,72,'2019-02-14',60),(9,72,'2019-02-18',120),(9,72,'2019-02-20',180),(9,72,'2019-02-25',60),(9,72,'2019-02-26',120),(9,72,'2019-02-28',120),(9,72,'2019-03-04',120),(9,72,'2019-03-05',105),(9,73,'2018-12-06',120),(9,73,'2018-12-07',120),(9,73,'2019-01-02',90),(9,73,'2019-01-03',240),(9,73,'2019-01-04',240),(9,73,'2019-01-16',60),(9,73,'2019-01-30',120),(9,73,'2019-02-05',120),(9,73,'2019-02-06',180),(9,73,'2019-02-08',240),(9,73,'2019-02-13',60),(9,73,'2019-03-01',210),(9,74,'2018-12-20',240),(9,74,'2018-12-21',210),(9,74,'2018-12-24',120),(9,74,'2018-12-25',120),(9,74,'2018-12-26',60),(9,74,'2018-12-27',120),(9,74,'2018-12-28',180),(9,74,'2019-01-15',120),(9,74,'2019-01-18',180),(9,74,'2019-01-22',120),(9,74,'2019-01-23',30),(9,74,'2019-01-30',60),(9,74,'2019-01-31',240),(9,74,'2019-02-13',180),(9,74,'2019-02-15',60),(9,74,'2019-02-18',60),(9,74,'2019-02-19',180),(9,74,'2019-02-25',120),(9,74,'2019-02-26',60),(9,74,'2019-02-27',60),(9,74,'2019-02-28',60),(9,74,'2019-03-01',60),(9,75,'2018-12-19',180),(9,75,'2019-01-08',60),(9,75,'2019-01-09',240),(9,75,'2019-01-11',180),(9,75,'2019-01-16',60),(9,75,'2019-01-17',120),(9,75,'2019-01-21',120),(9,75,'2019-01-22',120),(9,75,'2019-01-23',180),(9,75,'2019-01-24',60),(9,75,'2019-01-28',30),(9,75,'2019-01-29',60),(9,75,'2019-02-12',120),(9,75,'2019-02-15',60),(9,75,'2019-02-20',60),(10,16,'2019-02-04',120),(10,16,'2019-02-05',240),(10,16,'2019-02-07',300),(10,16,'2019-02-11',90),(10,16,'2019-02-13',180),(10,16,'2019-02-14',300),(10,16,'2019-02-18',280),(10,16,'2019-02-19',120),(10,16,'2019-02-20',140),(10,16,'2019-02-21',210),(10,16,'2019-02-25',210),(10,16,'2019-02-26',180),(10,16,'2019-02-27',300),(10,16,'2019-02-28',180),(10,16,'2019-03-04',180),(10,16,'2019-03-05',240),(10,36,'2019-02-04',30),(10,36,'2019-02-06',30),(10,36,'2019-02-08',30),(10,36,'2019-02-11',30),(10,36,'2019-02-14',30),(10,36,'2019-02-18',20),(10,36,'2019-02-20',20),(10,36,'2019-02-21',20),(10,36,'2019-02-25',30),(10,36,'2019-02-26',30),(10,36,'2019-02-28',30),(10,77,'2019-02-04',120),(10,77,'2019-02-05',240),(10,77,'2019-02-06',270),(10,77,'2019-02-07',210),(10,77,'2019-02-08',90),(10,77,'2019-02-11',360),(10,77,'2019-02-13',120),(10,77,'2019-02-14',120),(10,77,'2019-02-15',150),(10,77,'2019-02-18',180),(10,77,'2019-02-19',240),(10,77,'2019-02-20',300),(10,77,'2019-02-21',280),(10,77,'2019-02-25',120),(10,77,'2019-02-26',270),(10,77,'2019-02-27',60),(10,77,'2019-02-28',240),(10,77,'2019-03-04',180),(10,77,'2019-03-05',240),(10,79,'2019-02-04',180),(10,79,'2019-02-06',180),(10,79,'2019-02-08',120),(10,79,'2019-02-13',180),(10,79,'2019-02-15',120),(10,79,'2019-02-19',120),(10,79,'2019-02-25',120),(10,79,'2019-02-27',120),(10,79,'2019-03-04',120),(11,26,'2019-02-18',30),(11,26,'2019-02-19',120),(11,26,'2019-02-20',180),(11,26,'2019-02-21',180),(11,26,'2019-02-22',90),(11,26,'2019-02-26',120),(11,26,'2019-02-28',240),(11,26,'2019-03-01',120),(11,26,'2019-03-04',120),(11,26,'2019-03-05',120),(11,27,'2019-02-18',180),(11,27,'2019-02-19',60),(11,27,'2019-02-21',60),(11,27,'2019-02-22',60),(11,27,'2019-02-25',120),(11,27,'2019-02-27',120),(11,27,'2019-03-01',60),(11,27,'2019-03-04',90),(11,27,'2019-03-05',150),(11,35,'2019-02-18',30),(11,35,'2019-02-19',30),(11,35,'2019-02-22',60),(11,35,'2019-02-26',30),(11,35,'2019-02-27',60),(11,36,'2019-02-19',30),(11,36,'2019-02-22',30),(11,36,'2019-02-26',30),(11,36,'2019-03-01',30),(11,36,'2019-03-04',30),(11,37,'2019-02-20',60),(11,37,'2019-02-26',60),(11,37,'2019-02-28',60),(11,37,'2019-03-02',120);
/*!40000 ALTER TABLE `tt_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_record_backup`
--

DROP TABLE IF EXISTS `tt_record_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_record_backup` (
  `user_id` int(3) unsigned DEFAULT NULL,
  `task_id` int(5) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `actuals` int(11) DEFAULT NULL,
  `backup_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_record_backup`
--

LOCK TABLES `tt_record_backup` WRITE;
/*!40000 ALTER TABLE `tt_record_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tt_record_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_revision`
--

DROP TABLE IF EXISTS `tt_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_revision` (
  `user_id` int(3) unsigned NOT NULL,
  `task_id` int(3) NOT NULL,
  `record_date` date NOT NULL,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`,`record_date`),
  UNIQUE KEY `uk_tt_revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_revision`
--

LOCK TABLES `tt_revision` WRITE;
/*!40000 ALTER TABLE `tt_revision` DISABLE KEYS */;
INSERT INTO `tt_revision` VALUES (1,35,'2019-02-04',1),(1,35,'2019-02-05',2),(1,35,'2019-02-06',3),(1,35,'2019-02-07',4),(1,35,'2019-02-11',5),(1,35,'2019-02-13',6),(1,35,'2019-02-18',7),(1,35,'2019-02-20',8),(1,35,'2019-02-22',9),(1,35,'2019-02-25',10),(1,35,'2019-02-27',11),(1,35,'2019-02-28',12),(1,35,'2019-03-04',13),(1,35,'2019-03-05',14),(1,36,'2018-12-05',16),(1,36,'2018-12-11',17),(1,36,'2018-12-27',18),(1,36,'2019-01-22',19),(1,36,'2019-02-05',20),(1,36,'2019-02-07',21),(1,36,'2019-02-08',22),(1,36,'2019-02-11',23),(1,36,'2019-02-15',24),(1,37,'2019-02-05',25),(1,37,'2019-02-06',26),(1,37,'2019-02-11',27),(1,37,'2019-02-13',28),(1,37,'2019-02-15',29),(1,37,'2019-02-18',30),(1,43,'2019-02-27',31),(1,48,'2018-12-05',32),(1,48,'2018-12-17',33),(1,48,'2018-12-20',34),(1,48,'2019-01-01',35),(1,48,'2019-01-10',36),(1,48,'2019-01-14',37),(1,48,'2019-01-15',38),(1,48,'2019-01-23',39),(1,48,'2019-02-04',40),(1,48,'2019-02-06',41),(1,48,'2019-02-07',42),(1,48,'2019-02-08',43),(1,48,'2019-02-11',44),(1,48,'2019-02-12',45),(1,48,'2019-02-13',46),(1,48,'2019-02-15',47),(1,48,'2019-02-18',48),(1,48,'2019-02-19',49),(1,48,'2019-02-20',50),(1,48,'2019-02-22',51),(1,48,'2019-02-23',52),(1,48,'2019-02-25',53),(1,48,'2019-02-26',54),(1,48,'2019-02-27',55),(1,48,'2019-02-28',56),(1,55,'2019-02-28',57),(1,55,'2019-03-04',58),(1,56,'2019-01-14',59),(1,56,'2019-01-18',60),(1,56,'2019-01-23',61),(1,56,'2019-01-31',62),(1,56,'2019-02-04',63),(1,56,'2019-02-08',64),(1,56,'2019-02-09',65),(1,56,'2019-02-11',66),(1,56,'2019-02-12',67),(1,56,'2019-02-18',68),(1,56,'2019-02-19',69),(1,56,'2019-02-20',70),(1,56,'2019-02-22',71),(1,58,'2018-12-06',72),(1,58,'2018-12-07',73),(1,58,'2018-12-15',74),(1,58,'2018-12-20',75),(1,58,'2018-12-21',76),(1,58,'2018-12-27',77),(1,58,'2018-12-28',78),(1,58,'2019-01-01',79),(1,58,'2019-01-03',80),(1,58,'2019-01-04',81),(1,58,'2019-01-07',82),(1,59,'2018-12-10',83),(1,59,'2018-12-18',84),(1,59,'2018-12-19',85),(1,59,'2018-12-21',86),(1,59,'2018-12-31',87),(1,59,'2019-01-07',88),(1,59,'2019-01-11',89),(1,59,'2019-01-16',90),(1,59,'2019-01-21',91),(1,59,'2019-02-26',92),(1,59,'2019-02-27',93),(1,59,'2019-03-04',94),(1,59,'2019-03-05',95),(1,60,'2018-12-13',99),(1,60,'2018-12-14',100),(1,60,'2018-12-27',101),(1,60,'2018-12-28',102),(1,60,'2019-01-03',103),(1,60,'2019-01-04',104),(1,60,'2019-01-08',105),(1,60,'2019-01-09',106),(1,60,'2019-01-15',107),(1,60,'2019-01-18',108),(1,60,'2019-01-22',109),(1,60,'2019-01-30',110),(1,60,'2019-01-31',111),(1,60,'2019-02-18',112),(1,60,'2019-02-19',113),(1,60,'2019-02-20',114),(1,60,'2019-02-25',115),(1,60,'2019-02-26',116),(1,60,'2019-02-28',117),(1,60,'2019-03-01',118),(1,60,'2019-03-02',119),(1,61,'2018-12-11',120),(1,61,'2018-12-13',121),(1,61,'2018-12-17',122),(1,61,'2018-12-19',123),(1,61,'2018-12-20',124),(1,61,'2018-12-21',125),(1,61,'2019-01-07',126),(1,61,'2019-01-10',127),(1,61,'2019-01-11',128),(1,61,'2019-01-23',129),(1,61,'2019-01-28',130),(1,62,'2018-12-12',131),(1,62,'2018-12-14',132),(1,62,'2018-12-17',133),(1,62,'2018-12-18',134),(1,62,'2018-12-19',135),(1,62,'2018-12-20',136),(1,62,'2018-12-31',137),(1,62,'2019-01-02',138),(1,62,'2019-01-04',139),(1,62,'2019-01-08',140),(1,62,'2019-01-09',141),(1,62,'2019-01-10',142),(1,62,'2019-01-11',143),(1,62,'2019-01-17',144),(1,62,'2019-01-21',145),(1,62,'2019-01-29',146),(1,62,'2019-01-31',147),(1,62,'2019-03-05',148),(1,79,'2019-02-04',152),(1,79,'2019-02-05',153),(1,79,'2019-02-06',154),(1,79,'2019-02-07',155),(1,79,'2019-02-08',156),(1,79,'2019-02-19',157),(2,18,'2018-12-21',158),(2,18,'2018-12-24',159),(2,18,'2018-12-25',160),(2,18,'2018-12-26',161),(2,18,'2018-12-27',162),(2,18,'2018-12-28',163),(2,18,'2018-12-31',164),(2,18,'2019-01-01',165),(2,18,'2019-01-02',166),(2,18,'2019-01-04',167),(2,18,'2019-01-07',168),(2,18,'2019-01-08',169),(2,18,'2019-01-21',170),(2,18,'2019-01-22',171),(2,21,'2018-12-10',172),(2,21,'2018-12-11',173),(2,21,'2018-12-13',174),(2,21,'2018-12-17',175),(2,21,'2018-12-18',176),(2,21,'2018-12-19',177),(2,21,'2018-12-20',178),(2,21,'2018-12-21',179),(2,21,'2018-12-24',180),(2,21,'2018-12-25',181),(2,21,'2018-12-26',182),(2,21,'2018-12-27',183),(2,21,'2018-12-28',184),(2,21,'2018-12-31',185),(2,21,'2019-01-03',186),(2,21,'2019-01-04',187),(2,22,'2018-12-10',188),(2,22,'2018-12-11',189),(2,22,'2018-12-12',190),(2,22,'2018-12-13',191),(2,22,'2018-12-14',192),(2,22,'2018-12-17',193),(2,22,'2018-12-18',194),(2,22,'2018-12-19',195),(2,22,'2018-12-20',196),(2,22,'2018-12-31',197),(2,22,'2019-01-01',198),(2,22,'2019-01-02',199),(2,25,'2019-01-21',200),(2,25,'2019-01-24',201),(2,27,'2019-03-05',202),(2,29,'2019-02-12',205),(2,29,'2019-02-17',206),(2,29,'2019-02-19',207),(2,29,'2019-02-20',208),(2,29,'2019-02-21',209),(2,29,'2019-02-25',210),(2,29,'2019-02-26',211),(2,29,'2019-02-27',212),(2,29,'2019-02-28',213),(2,29,'2019-03-01',214),(2,29,'2019-03-04',215),(2,29,'2019-03-05',216),(2,30,'2019-02-11',217),(2,30,'2019-02-12',218),(2,30,'2019-02-13',219),(2,30,'2019-02-14',220),(2,30,'2019-02-15',221),(2,30,'2019-02-18',222),(2,30,'2019-02-19',223),(2,30,'2019-02-20',224),(2,30,'2019-02-21',225),(2,30,'2019-02-22',226),(2,30,'2019-02-25',227),(2,30,'2019-02-26',228),(2,30,'2019-02-27',229),(2,30,'2019-02-28',230),(2,30,'2019-03-05',231),(2,31,'2019-02-11',235),(2,31,'2019-02-12',236),(2,31,'2019-02-13',237),(2,32,'2019-02-04',238),(2,32,'2019-02-05',239),(2,32,'2019-02-06',240),(2,32,'2019-02-07',241),(2,32,'2019-02-08',242),(2,33,'2019-01-14',243),(2,33,'2019-01-15',244),(2,33,'2019-01-16',245),(2,33,'2019-01-17',246),(2,33,'2019-01-18',247),(2,33,'2019-01-21',248),(2,33,'2019-01-22',249),(2,33,'2019-01-23',250),(2,33,'2019-01-24',251),(2,33,'2019-02-04',252),(2,33,'2019-02-05',253),(2,33,'2019-02-06',254),(2,33,'2019-02-08',255),(2,34,'2019-01-07',256),(2,34,'2019-01-08',257),(2,34,'2019-01-09',258),(2,34,'2019-01-14',259),(2,34,'2019-01-15',260),(2,34,'2019-01-16',261),(2,34,'2019-01-18',262),(2,35,'2018-12-12',263),(2,35,'2018-12-14',264),(2,35,'2019-01-15',265),(2,35,'2019-01-18',266),(2,35,'2019-02-04',267),(2,35,'2019-02-07',268),(2,35,'2019-02-12',269),(2,35,'2019-02-13',270),(2,35,'2019-02-14',271),(2,35,'2019-02-15',272),(2,35,'2019-02-20',273),(2,35,'2019-02-25',274),(2,35,'2019-02-27',275),(2,35,'2019-03-04',276),(2,36,'2018-12-10',280),(2,36,'2018-12-11',281),(2,36,'2018-12-12',282),(2,36,'2018-12-13',283),(2,36,'2018-12-14',284),(2,36,'2018-12-17',285),(2,36,'2018-12-18',286),(2,36,'2018-12-19',287),(2,36,'2018-12-20',288),(2,36,'2018-12-21',289),(2,36,'2018-12-24',290),(2,36,'2018-12-25',291),(2,36,'2018-12-27',292),(2,36,'2018-12-28',293),(2,36,'2018-12-31',294),(2,36,'2019-01-01',295),(2,36,'2019-01-02',296),(2,36,'2019-01-04',297),(2,36,'2019-01-07',298),(2,36,'2019-01-08',299),(2,36,'2019-01-15',300),(2,36,'2019-01-16',301),(2,36,'2019-01-17',302),(2,36,'2019-01-18',303),(2,36,'2019-01-21',304),(2,36,'2019-01-23',305),(2,36,'2019-01-24',306),(2,36,'2019-02-05',307),(2,36,'2019-02-06',308),(2,36,'2019-02-07',309),(2,36,'2019-02-08',310),(2,36,'2019-02-11',311),(2,36,'2019-02-12',312),(2,36,'2019-02-13',313),(2,36,'2019-02-14',314),(2,36,'2019-02-15',315),(2,36,'2019-02-18',316),(2,36,'2019-02-19',317),(2,36,'2019-02-20',318),(2,36,'2019-02-21',319),(2,36,'2019-02-25',320),(2,36,'2019-02-26',321),(2,36,'2019-02-27',322),(2,36,'2019-02-28',323),(2,36,'2019-03-04',324),(2,36,'2019-03-05',325),(2,37,'2018-12-12',329),(2,37,'2018-12-14',330),(2,37,'2018-12-27',331),(2,37,'2019-01-14',332),(2,37,'2019-01-17',333),(2,37,'2019-02-04',334),(2,37,'2019-02-07',335),(2,37,'2019-02-26',336),(2,37,'2019-02-28',337),(2,37,'2019-03-04',338),(2,39,'2018-12-18',340),(2,39,'2018-12-19',341),(2,39,'2019-01-01',342),(2,39,'2019-01-03',343),(2,39,'2019-01-04',344),(2,40,'2019-01-07',345),(2,40,'2019-01-08',346),(2,42,'2019-01-22',347),(2,42,'2019-01-23',348),(2,56,'2019-02-07',349),(2,63,'2019-01-07',350),(2,63,'2019-01-16',351),(2,69,'2019-01-22',352),(2,79,'2018-12-10',353),(2,79,'2018-12-12',354),(2,79,'2018-12-14',355),(2,79,'2018-12-24',356),(2,79,'2018-12-25',357),(2,79,'2018-12-28',358),(2,79,'2019-03-04',359),(4,17,'2018-12-17',361),(4,17,'2018-12-21',362),(4,17,'2019-02-04',363),(4,17,'2019-02-05',364),(4,17,'2019-02-06',365),(4,17,'2019-02-07',366),(4,17,'2019-02-11',367),(4,17,'2019-02-12',368),(4,17,'2019-02-13',369),(4,17,'2019-02-14',370),(4,17,'2019-02-15',371),(4,17,'2019-02-18',372),(4,17,'2019-02-20',373),(4,17,'2019-02-21',374),(4,17,'2019-02-22',375),(4,17,'2019-03-04',376),(4,17,'2019-03-05',377),(4,26,'2019-01-23',381),(4,26,'2019-01-24',382),(4,26,'2019-01-28',383),(4,26,'2019-01-30',384),(4,26,'2019-01-31',385),(4,26,'2019-02-04',386),(4,26,'2019-02-05',387),(4,26,'2019-02-06',388),(4,26,'2019-02-07',389),(4,26,'2019-02-11',390),(4,26,'2019-02-13',391),(4,26,'2019-02-18',392),(4,26,'2019-02-19',393),(4,26,'2019-02-20',394),(4,28,'2019-01-02',395),(4,28,'2019-01-03',396),(4,28,'2019-01-04',397),(4,35,'2018-12-05',398),(4,35,'2018-12-10',399),(4,35,'2018-12-11',400),(4,35,'2018-12-13',401),(4,35,'2018-12-14',402),(4,35,'2018-12-17',403),(4,35,'2018-12-18',404),(4,35,'2018-12-19',405),(4,35,'2018-12-20',406),(4,35,'2018-12-25',407),(4,35,'2018-12-27',408),(4,35,'2018-12-28',409),(4,35,'2018-12-31',410),(4,35,'2019-01-01',411),(4,35,'2019-01-02',412),(4,35,'2019-01-03',413),(4,35,'2019-01-04',414),(4,35,'2019-01-07',415),(4,35,'2019-01-09',416),(4,35,'2019-01-14',417),(4,35,'2019-01-15',418),(4,35,'2019-01-16',419),(4,35,'2019-01-18',420),(4,35,'2019-01-23',421),(4,35,'2019-01-24',422),(4,35,'2019-01-28',423),(4,35,'2019-01-29',424),(4,35,'2019-01-30',425),(4,35,'2019-02-04',426),(4,35,'2019-02-05',427),(4,35,'2019-02-06',428),(4,35,'2019-02-07',429),(4,35,'2019-02-11',430),(4,35,'2019-02-12',431),(4,35,'2019-02-14',432),(4,35,'2019-02-18',433),(4,35,'2019-02-20',434),(4,35,'2019-02-21',435),(4,35,'2019-02-22',436),(4,35,'2019-03-05',437),(4,36,'2018-12-05',439),(4,36,'2018-12-10',440),(4,36,'2018-12-11',441),(4,36,'2018-12-13',442),(4,36,'2018-12-14',443),(4,36,'2018-12-17',444),(4,36,'2018-12-18',445),(4,36,'2018-12-19',446),(4,36,'2018-12-20',447),(4,36,'2018-12-24',448),(4,36,'2018-12-25',449),(4,36,'2018-12-27',450),(4,36,'2018-12-28',451),(4,36,'2019-01-01',452),(4,36,'2019-01-02',453),(4,36,'2019-01-03',454),(4,36,'2019-01-07',455),(4,36,'2019-01-09',456),(4,36,'2019-01-10',457),(4,36,'2019-01-11',458),(4,36,'2019-01-15',459),(4,36,'2019-01-18',460),(4,36,'2019-01-24',461),(4,36,'2019-01-28',462),(4,36,'2019-01-30',463),(4,36,'2019-02-04',464),(4,36,'2019-02-06',465),(4,36,'2019-02-07',466),(4,36,'2019-02-11',467),(4,36,'2019-02-14',468),(4,36,'2019-02-18',469),(4,36,'2019-02-19',470),(4,36,'2019-02-21',471),(4,36,'2019-02-22',472),(4,37,'2018-12-05',473),(4,37,'2018-12-07',474),(4,37,'2018-12-12',475),(4,37,'2018-12-24',476),(4,37,'2018-12-26',477),(4,37,'2019-01-14',478),(4,37,'2019-01-28',479),(4,37,'2019-02-12',480),(4,37,'2019-03-04',481),(4,38,'2018-12-10',483),(4,38,'2018-12-11',484),(4,38,'2018-12-12',485),(4,38,'2018-12-13',486),(4,38,'2018-12-14',487),(4,38,'2018-12-17',488),(4,38,'2018-12-18',489),(4,38,'2018-12-19',490),(4,38,'2018-12-20',491),(4,38,'2018-12-21',492),(4,38,'2018-12-24',493),(4,38,'2018-12-25',494),(4,38,'2018-12-26',495),(4,38,'2018-12-27',496),(4,38,'2018-12-28',497),(4,38,'2018-12-31',498),(4,38,'2019-01-03',499),(4,38,'2019-01-08',500),(4,39,'2018-12-10',501),(4,39,'2018-12-11',502),(4,39,'2018-12-12',503),(4,39,'2018-12-13',504),(4,39,'2018-12-14',505),(4,39,'2018-12-17',506),(4,39,'2018-12-18',507),(4,39,'2018-12-19',508),(4,39,'2018-12-20',509),(4,39,'2018-12-21',510),(4,39,'2018-12-25',511),(4,39,'2018-12-26',512),(4,39,'2018-12-28',513),(4,39,'2018-12-31',514),(4,39,'2019-01-02',515),(4,40,'2019-01-07',516),(4,40,'2019-01-08',517),(4,40,'2019-01-09',518),(4,40,'2019-01-10',519),(4,40,'2019-01-11',520),(4,40,'2019-01-14',521),(4,40,'2019-01-15',522),(4,40,'2019-01-16',523),(4,40,'2019-01-17',524),(4,40,'2019-01-18',525),(4,40,'2019-01-23',526),(4,40,'2019-01-24',527),(4,40,'2019-01-26',528),(4,40,'2019-01-28',529),(4,40,'2019-01-29',530),(4,40,'2019-01-30',531),(4,40,'2019-01-31',532),(4,40,'2019-02-04',533),(4,40,'2019-02-05',534),(4,40,'2019-02-06',535),(4,40,'2019-02-07',536),(4,40,'2019-02-11',537),(4,40,'2019-02-12',538),(4,40,'2019-02-13',539),(4,40,'2019-02-14',540),(4,40,'2019-02-15',541),(4,40,'2019-02-18',542),(4,40,'2019-02-19',543),(4,40,'2019-02-20',544),(4,40,'2019-02-21',545),(4,40,'2019-02-22',546),(4,40,'2019-03-05',547),(4,41,'2019-03-04',550),(4,41,'2019-03-05',551),(4,63,'2018-12-06',554),(4,63,'2018-12-07',555),(4,63,'2018-12-12',556),(4,63,'2018-12-24',557),(4,63,'2018-12-25',558),(4,63,'2018-12-26',559),(4,63,'2018-12-27',560),(4,63,'2018-12-28',561),(4,63,'2019-01-01',562),(4,63,'2019-01-02',563),(4,63,'2019-01-04',564),(4,63,'2019-01-08',565),(4,63,'2019-01-09',566),(4,63,'2019-01-10',567),(4,63,'2019-01-11',568),(4,63,'2019-01-14',569),(4,63,'2019-01-16',570),(4,63,'2019-01-17',571),(4,63,'2019-01-18',572),(4,63,'2019-01-23',573),(4,63,'2019-01-26',574),(4,63,'2019-01-31',575),(4,65,'2018-12-05',576),(4,65,'2018-12-06',577),(4,65,'2018-12-07',578),(4,65,'2019-01-03',579),(4,65,'2019-01-04',580),(4,65,'2019-01-07',581),(4,65,'2019-01-08',582),(5,25,'2018-12-05',583),(5,25,'2018-12-10',584),(5,25,'2018-12-12',585),(5,25,'2018-12-14',586),(5,25,'2018-12-25',587),(5,25,'2019-01-01',588),(5,25,'2019-01-03',589),(5,25,'2019-01-04',590),(5,35,'2018-12-07',591),(5,35,'2018-12-10',592),(5,35,'2018-12-12',593),(5,35,'2018-12-26',594),(5,35,'2019-01-01',595),(5,35,'2019-01-03',596),(5,35,'2019-01-04',597),(5,36,'2018-12-07',598),(5,36,'2018-12-10',599),(5,36,'2018-12-12',600),(5,36,'2018-12-25',601),(5,36,'2018-12-26',602),(5,36,'2018-12-27',603),(5,36,'2019-01-01',604),(5,36,'2019-01-03',605),(5,36,'2019-01-04',606),(5,37,'2018-12-05',607),(5,37,'2018-12-07',608),(5,37,'2018-12-12',609),(5,37,'2018-12-25',610),(5,37,'2018-12-26',611),(5,37,'2018-12-27',612),(5,37,'2018-12-28',613),(5,37,'2019-01-01',614),(5,37,'2019-01-03',615),(5,37,'2019-01-04',616),(5,67,'2018-12-07',617),(5,67,'2018-12-10',618),(5,67,'2018-12-11',619),(5,67,'2018-12-13',620),(5,68,'2018-12-06',621),(5,68,'2018-12-11',622),(5,69,'2018-12-25',623),(5,69,'2018-12-26',624),(5,69,'2018-12-27',625),(5,69,'2019-01-01',626),(5,70,'2018-12-24',627),(5,70,'2018-12-26',628),(5,70,'2018-12-28',629),(6,16,'2019-02-12',630),(6,16,'2019-02-14',631),(6,16,'2019-02-15',632),(6,16,'2019-02-26',633),(6,16,'2019-02-27',634),(6,16,'2019-03-01',635),(6,17,'2019-02-06',636),(6,17,'2019-02-07',637),(6,17,'2019-02-08',638),(6,17,'2019-02-13',639),(6,17,'2019-02-14',640),(6,17,'2019-02-15',641),(6,17,'2019-02-19',642),(6,17,'2019-02-20',643),(6,17,'2019-02-21',644),(6,17,'2019-02-22',645),(6,17,'2019-02-23',646),(6,17,'2019-02-27',647),(6,17,'2019-02-28',648),(6,17,'2019-03-02',649),(6,35,'2019-02-13',650),(6,35,'2019-02-26',651),(6,35,'2019-03-01',652),(6,35,'2019-03-05',653),(6,36,'2019-02-05',657),(6,36,'2019-02-06',658),(6,36,'2019-02-07',659),(6,36,'2019-02-08',660),(6,36,'2019-02-12',661),(6,36,'2019-02-13',662),(6,36,'2019-02-14',663),(6,36,'2019-02-15',664),(6,36,'2019-02-19',665),(6,36,'2019-02-21',666),(6,36,'2019-02-22',667),(6,36,'2019-02-26',668),(6,36,'2019-02-27',669),(6,36,'2019-03-01',670),(6,36,'2019-03-05',671),(6,37,'2019-02-05',675),(6,37,'2019-02-13',676),(6,37,'2019-02-22',677),(6,37,'2019-02-26',678),(6,37,'2019-03-01',679),(6,63,'2019-02-05',682),(6,63,'2019-02-06',683),(6,63,'2019-02-07',684),(6,63,'2019-02-08',685),(6,63,'2019-02-19',686),(6,63,'2019-02-20',687),(6,63,'2019-02-21',688),(6,63,'2019-02-22',689),(6,63,'2019-02-23',690),(6,63,'2019-02-26',691),(6,63,'2019-02-27',692),(6,63,'2019-03-01',693),(6,63,'2019-03-02',694),(6,63,'2019-03-05',695),(6,77,'2019-03-05',699),(6,79,'2019-02-05',702),(6,79,'2019-02-07',703),(7,25,'2019-02-04',704),(7,25,'2019-02-05',705),(7,25,'2019-02-06',706),(7,25,'2019-02-07',707),(7,25,'2019-02-08',708),(7,25,'2019-02-13',709),(7,25,'2019-02-18',710),(7,25,'2019-02-19',711),(7,25,'2019-02-20',712),(7,25,'2019-02-22',713),(7,25,'2019-02-26',714),(7,25,'2019-02-28',715),(7,25,'2019-03-01',716),(7,25,'2019-03-04',717),(7,35,'2019-02-04',720),(7,35,'2019-02-05',721),(7,35,'2019-02-06',722),(7,35,'2019-02-07',723),(7,35,'2019-02-08',724),(7,35,'2019-02-11',725),(7,35,'2019-02-12',726),(7,35,'2019-02-13',727),(7,35,'2019-02-18',728),(7,35,'2019-02-19',729),(7,35,'2019-02-20',730),(7,35,'2019-02-21',731),(7,35,'2019-02-25',732),(7,35,'2019-02-26',733),(7,35,'2019-02-27',734),(7,35,'2019-03-01',735),(7,35,'2019-03-04',736),(7,35,'2019-03-05',737),(7,36,'2019-02-04',740),(7,36,'2019-02-05',741),(7,36,'2019-02-06',742),(7,36,'2019-02-07',743),(7,36,'2019-02-08',744),(7,36,'2019-02-11',745),(7,36,'2019-02-12',746),(7,36,'2019-02-18',747),(7,36,'2019-02-19',748),(7,36,'2019-02-20',749),(7,36,'2019-02-21',750),(7,36,'2019-02-22',751),(7,36,'2019-02-25',752),(7,36,'2019-02-26',753),(7,36,'2019-02-27',754),(7,36,'2019-02-28',755),(7,36,'2019-03-01',756),(7,36,'2019-03-02',757),(7,36,'2019-03-04',758),(7,36,'2019-03-05',759),(7,37,'2019-02-05',762),(7,37,'2019-02-11',763),(7,37,'2019-02-13',764),(7,37,'2019-02-19',765),(7,37,'2019-02-21',766),(7,37,'2019-02-25',767),(7,37,'2019-03-04',768),(7,37,'2019-03-05',769),(7,67,'2019-02-04',771),(7,67,'2019-02-07',772),(7,67,'2019-02-08',773),(7,67,'2019-02-11',774),(7,67,'2019-02-12',775),(7,67,'2019-02-18',776),(7,67,'2019-02-19',777),(7,67,'2019-02-20',778),(7,67,'2019-02-21',779),(7,67,'2019-02-22',780),(7,67,'2019-02-25',781),(7,67,'2019-02-26',782),(7,67,'2019-02-27',783),(7,67,'2019-02-28',784),(7,67,'2019-03-01',785),(7,67,'2019-03-02',786),(7,67,'2019-03-04',787),(7,67,'2019-03-05',788),(7,69,'2019-02-04',791),(7,69,'2019-02-05',792),(7,69,'2019-02-06',793),(7,69,'2019-02-07',794),(7,69,'2019-02-08',795),(7,69,'2019-02-12',796),(7,69,'2019-02-18',797),(7,69,'2019-02-19',798),(7,69,'2019-02-21',799),(7,69,'2019-02-25',800),(7,69,'2019-02-27',801),(7,69,'2019-02-28',802),(7,69,'2019-03-04',803),(7,69,'2019-03-05',804),(7,70,'2019-02-11',807),(7,70,'2019-02-13',808),(8,16,'2019-02-04',809),(8,16,'2019-02-05',810),(8,16,'2019-02-06',811),(8,16,'2019-02-07',812),(8,16,'2019-02-08',813),(8,16,'2019-02-12',814),(8,16,'2019-02-18',815),(8,16,'2019-02-20',816),(8,16,'2019-02-28',817),(8,16,'2019-03-01',818),(8,17,'2019-02-04',819),(8,17,'2019-02-07',820),(8,17,'2019-02-11',821),(8,17,'2019-02-12',822),(8,17,'2019-02-13',823),(8,17,'2019-02-14',824),(8,17,'2019-02-19',825),(8,17,'2019-02-20',826),(8,17,'2019-02-22',827),(8,17,'2019-02-25',828),(8,17,'2019-02-26',829),(8,17,'2019-03-01',830),(8,29,'2019-02-04',831),(8,29,'2019-02-05',832),(8,29,'2019-02-06',833),(8,29,'2019-02-11',834),(8,29,'2019-02-12',835),(8,29,'2019-02-13',836),(8,29,'2019-02-14',837),(8,29,'2019-02-15',838),(8,29,'2019-02-18',839),(8,29,'2019-02-19',840),(8,29,'2019-02-25',841),(8,29,'2019-02-26',842),(8,29,'2019-02-28',843),(8,29,'2019-03-04',844),(8,29,'2019-03-05',845),(8,36,'2019-02-06',849),(8,36,'2019-02-08',850),(8,36,'2019-02-25',851),(8,36,'2019-02-28',852),(8,36,'2019-03-01',853),(8,36,'2019-03-04',854),(8,36,'2019-03-05',855),(8,37,'2019-03-05',858),(8,63,'2019-02-05',860),(8,63,'2019-02-06',861),(8,63,'2019-02-07',862),(8,63,'2019-02-08',863),(8,63,'2019-02-11',864),(8,63,'2019-02-14',865),(8,63,'2019-02-15',866),(8,63,'2019-02-18',867),(8,63,'2019-02-19',868),(8,63,'2019-02-22',869),(8,63,'2019-02-25',870),(8,63,'2019-02-28',871),(8,63,'2019-03-01',872),(8,63,'2019-03-04',873),(8,63,'2019-03-05',874),(8,79,'2019-02-04',878),(8,79,'2019-02-07',879),(8,79,'2019-02-11',880),(8,79,'2019-02-13',881),(8,79,'2019-02-15',882),(9,35,'2018-12-07',883),(9,35,'2018-12-11',884),(9,35,'2018-12-17',885),(9,35,'2018-12-21',886),(9,35,'2018-12-25',887),(9,35,'2018-12-28',888),(9,35,'2019-01-07',889),(9,35,'2019-01-10',890),(9,35,'2019-01-15',891),(9,35,'2019-01-17',892),(9,35,'2019-01-18',893),(9,35,'2019-01-23',894),(9,35,'2019-01-29',895),(9,35,'2019-02-05',896),(9,35,'2019-02-06',897),(9,35,'2019-02-13',898),(9,35,'2019-02-15',899),(9,35,'2019-02-19',900),(9,35,'2019-02-21',901),(9,35,'2019-02-22',902),(9,35,'2019-02-25',903),(9,35,'2019-02-27',904),(9,35,'2019-03-01',905),(9,35,'2019-03-05',906),(9,36,'2018-12-07',908),(9,36,'2018-12-11',909),(9,36,'2018-12-19',910),(9,36,'2018-12-21',911),(9,36,'2018-12-24',912),(9,36,'2018-12-28',913),(9,36,'2019-01-02',914),(9,36,'2019-01-07',915),(9,36,'2019-01-11',916),(9,36,'2019-01-15',917),(9,36,'2019-01-16',918),(9,36,'2019-01-18',919),(9,36,'2019-01-24',920),(9,36,'2019-01-28',921),(9,36,'2019-01-30',922),(9,36,'2019-02-04',923),(9,36,'2019-02-06',924),(9,36,'2019-02-08',925),(9,36,'2019-02-15',926),(9,36,'2019-02-19',927),(9,36,'2019-02-25',928),(9,36,'2019-02-26',929),(9,36,'2019-02-28',930),(9,36,'2019-03-04',931),(9,71,'2018-12-05',934),(9,71,'2018-12-10',935),(9,71,'2018-12-11',936),(9,71,'2018-12-12',937),(9,71,'2018-12-13',938),(9,71,'2018-12-14',939),(9,71,'2018-12-17',940),(9,71,'2018-12-18',941),(9,71,'2018-12-25',942),(9,71,'2018-12-26',943),(9,71,'2018-12-27',944),(9,71,'2019-01-08',945),(9,71,'2019-01-15',946),(9,71,'2019-01-17',947),(9,71,'2019-01-28',948),(9,71,'2019-01-29',949),(9,71,'2019-02-05',950),(9,71,'2019-02-07',951),(9,71,'2019-02-14',952),(9,71,'2019-02-18',953),(9,71,'2019-02-21',954),(9,71,'2019-02-22',955),(9,71,'2019-02-27',956),(9,71,'2019-03-04',957),(9,71,'2019-03-05',958),(9,72,'2018-12-06',960),(9,72,'2018-12-10',961),(9,72,'2018-12-17',962),(9,72,'2018-12-18',963),(9,72,'2018-12-24',964),(9,72,'2018-12-26',965),(9,72,'2018-12-27',966),(9,72,'2019-01-02',967),(9,72,'2019-01-07',968),(9,72,'2019-01-10',969),(9,72,'2019-01-14',970),(9,72,'2019-01-16',971),(9,72,'2019-01-18',972),(9,72,'2019-01-21',973),(9,72,'2019-01-24',974),(9,72,'2019-01-28',975),(9,72,'2019-01-29',976),(9,72,'2019-02-04',977),(9,72,'2019-02-07',978),(9,72,'2019-02-12',979),(9,72,'2019-02-14',980),(9,72,'2019-02-18',981),(9,72,'2019-02-20',982),(9,72,'2019-02-25',983),(9,72,'2019-02-26',984),(9,72,'2019-02-28',985),(9,72,'2019-03-04',986),(9,72,'2019-03-05',987),(9,73,'2018-12-06',989),(9,73,'2018-12-07',990),(9,73,'2019-01-02',991),(9,73,'2019-01-03',992),(9,73,'2019-01-04',993),(9,73,'2019-01-16',994),(9,73,'2019-01-30',995),(9,73,'2019-02-05',996),(9,73,'2019-02-06',997),(9,73,'2019-02-08',998),(9,73,'2019-02-13',999),(9,73,'2019-03-01',1000),(9,74,'2018-12-20',1001),(9,74,'2018-12-21',1002),(9,74,'2018-12-24',1003),(9,74,'2018-12-25',1004),(9,74,'2018-12-26',1005),(9,74,'2018-12-27',1006),(9,74,'2018-12-28',1007),(9,74,'2019-01-15',1008),(9,74,'2019-01-18',1009),(9,74,'2019-01-22',1010),(9,74,'2019-01-23',1011),(9,74,'2019-01-30',1012),(9,74,'2019-01-31',1013),(9,74,'2019-02-13',1014),(9,74,'2019-02-15',1015),(9,74,'2019-02-18',1016),(9,74,'2019-02-19',1017),(9,74,'2019-02-25',1018),(9,74,'2019-02-26',1019),(9,74,'2019-02-27',1020),(9,74,'2019-02-28',1021),(9,74,'2019-03-01',1022),(9,75,'2018-12-19',1023),(9,75,'2019-01-08',1024),(9,75,'2019-01-09',1025),(9,75,'2019-01-11',1026),(9,75,'2019-01-16',1027),(9,75,'2019-01-17',1028),(9,75,'2019-01-21',1029),(9,75,'2019-01-22',1030),(9,75,'2019-01-23',1031),(9,75,'2019-01-24',1032),(9,75,'2019-01-28',1033),(9,75,'2019-01-29',1034),(9,75,'2019-02-12',1035),(9,75,'2019-02-15',1036),(9,75,'2019-02-20',1037),(10,16,'2019-02-04',1038),(10,16,'2019-02-05',1039),(10,16,'2019-02-07',1040),(10,16,'2019-02-11',1041),(10,16,'2019-02-13',1042),(10,16,'2019-02-14',1043),(10,16,'2019-02-18',1044),(10,16,'2019-02-19',1045),(10,16,'2019-02-20',1046),(10,16,'2019-02-21',1047),(10,16,'2019-02-25',1048),(10,16,'2019-02-26',1049),(10,16,'2019-02-27',1050),(10,16,'2019-02-28',1051),(10,16,'2019-03-04',1052),(10,16,'2019-03-05',1053),(10,36,'2019-02-04',1055),(10,36,'2019-02-06',1056),(10,36,'2019-02-08',1057),(10,36,'2019-02-11',1058),(10,36,'2019-02-14',1059),(10,36,'2019-02-18',1060),(10,36,'2019-02-20',1061),(10,36,'2019-02-21',1062),(10,36,'2019-02-25',1063),(10,36,'2019-02-26',1064),(10,36,'2019-02-28',1065),(10,77,'2019-02-04',1067),(10,77,'2019-02-05',1068),(10,77,'2019-02-06',1069),(10,77,'2019-02-07',1070),(10,77,'2019-02-08',1071),(10,77,'2019-02-11',1072),(10,77,'2019-02-13',1073),(10,77,'2019-02-14',1074),(10,77,'2019-02-15',1075),(10,77,'2019-02-18',1076),(10,77,'2019-02-19',1077),(10,77,'2019-02-20',1078),(10,77,'2019-02-21',1079),(10,77,'2019-02-25',1080),(10,77,'2019-02-26',1081),(10,77,'2019-02-27',1082),(10,77,'2019-02-28',1083),(10,77,'2019-03-04',1084),(10,77,'2019-03-05',1085),(10,79,'2019-02-04',1089),(10,79,'2019-02-06',1090),(10,79,'2019-02-08',1091),(10,79,'2019-02-13',1092),(10,79,'2019-02-15',1093),(10,79,'2019-02-19',1094),(10,79,'2019-02-25',1095),(10,79,'2019-02-27',1096),(10,79,'2019-03-04',1097),(11,26,'2019-02-18',1098),(11,26,'2019-02-19',1099),(11,26,'2019-02-20',1100),(11,26,'2019-02-21',1101),(11,26,'2019-02-22',1102),(11,26,'2019-02-26',1103),(11,26,'2019-02-28',1104),(11,26,'2019-03-01',1105),(11,26,'2019-03-04',1106),(11,26,'2019-03-05',1107),(11,27,'2019-02-18',1111),(11,27,'2019-02-19',1112),(11,27,'2019-02-21',1113),(11,27,'2019-02-22',1114),(11,27,'2019-02-25',1115),(11,27,'2019-02-27',1116),(11,27,'2019-03-01',1117),(11,27,'2019-03-04',1118),(11,27,'2019-03-05',1119),(11,35,'2019-02-18',1122),(11,35,'2019-02-19',1123),(11,35,'2019-02-22',1124),(11,35,'2019-02-26',1125),(11,35,'2019-02-27',1126),(11,36,'2019-02-19',1127),(11,36,'2019-02-22',1128),(11,36,'2019-02-26',1129),(11,36,'2019-03-01',1130),(11,36,'2019-03-04',1131),(11,37,'2019-02-20',1134),(11,37,'2019-02-26',1135),(11,37,'2019-02-28',1136),(11,37,'2019-03-02',1137);
/*!40000 ALTER TABLE `tt_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_right`
--

DROP TABLE IF EXISTS `user_access_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access_right` (
  `user_id` int(3) unsigned NOT NULL DEFAULT '0',
  `access_right_id` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`access_right_id`),
  KEY `user_id` (`user_id`),
  KEY `access_right_id` (`access_right_id`),
  CONSTRAINT `user_access_right_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`),
  CONSTRAINT `user_access_right_ibfk_2` FOREIGN KEY (`access_right_id`) REFERENCES `access_right` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of access rights users have';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_right`
--

LOCK TABLES `user_access_right` WRITE;
/*!40000 ALTER TABLE `user_access_right` DISABLE KEYS */;
INSERT INTO `user_access_right` VALUES (1,5),(1,8),(1,9),(1,10),(1,11),(1,12),(1,14),(1,20),(1,21),(1,22),(1,23),(2,9),(2,23),(4,9),(4,12),(4,23),(5,5),(5,8),(5,9),(5,10),(5,12),(5,20),(5,21),(5,22),(5,23),(6,9),(6,23),(7,8),(7,9),(7,10),(7,12),(7,23),(8,9),(8,23),(9,5),(9,8),(9,9),(9,10),(9,11),(9,12),(9,14),(9,20),(9,21),(9,22),(9,23),(10,9),(11,9),(11,23);
/*!40000 ALTER TABLE `user_access_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_balance_cap`
--

DROP TABLE IF EXISTS `user_balance_cap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_balance_cap` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(3) unsigned NOT NULL,
  `cap` double DEFAULT NULL,
  `effective_date` date NOT NULL,
  `balance_type` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PTO',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_balance_cap_effective_date` (`user_id`,`effective_date`,`balance_type`),
  CONSTRAINT `user_balance_cap_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_balance_cap`
--

LOCK TABLES `user_balance_cap` WRITE;
/*!40000 ALTER TABLE `user_balance_cap` DISABLE KEYS */;
INSERT INTO `user_balance_cap` VALUES (1,2,NULL,'2018-12-05','SICK'),(2,4,NULL,'2018-12-05','SICK'),(3,6,NULL,'2018-12-05','SICK'),(4,8,NULL,'2018-12-05','SICK'),(5,10,NULL,'2018-12-05','SICK'),(6,1,100,'2018-12-06','PTO'),(7,1,15,'2018-12-06','SICK'),(8,9,100,'2018-12-06','PTO'),(9,9,12,'2018-12-06','SICK'),(10,7,80,'2019-02-05','PTO'),(11,7,15,'2019-02-05','SICK'),(12,11,50,'2019-02-19','PTO'),(13,11,10,'2019-02-19','SICK'),(14,2,100,'2018-12-05','PTO'),(15,4,100,'2018-12-05','PTO'),(16,6,100,'2018-12-05','PTO'),(17,8,100,'2018-12-05','PTO'),(18,10,100,'2018-12-05','PTO'),(19,5,80,'2018-12-06','PTO'),(20,5,15,'2018-12-06','SICK'),(21,10,NULL,'2019-02-05','PTO'),(22,10,NULL,'2019-02-05','SICK');
/*!40000 ALTER TABLE `user_balance_cap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_balance_rule`
--

DROP TABLE IF EXISTS `user_balance_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_balance_rule` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(3) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `value` double NOT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency_params` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `effective_start_date` date NOT NULL,
  `effective_finish_date` date DEFAULT NULL,
  `mgr_id` int(3) unsigned DEFAULT NULL,
  `mgr_comment` text COLLATE utf8mb4_unicode_ci,
  `balance_type` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PTO',
  PRIMARY KEY (`id`),
  KEY `user_balance_rule_user_id` (`user_id`),
  KEY `user_balance_rule_mgr_id_at_user_id` (`mgr_id`),
  CONSTRAINT `user_balance_rule_mgr_id_at_user_id` FOREIGN KEY (`mgr_id`) REFERENCES `at_user_revision` (`id`),
  CONSTRAINT `user_balance_rule_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_balance_rule`
--

LOCK TABLES `user_balance_rule` WRITE;
/*!40000 ALTER TABLE `user_balance_rule` DISABLE KEYS */;
INSERT INTO `user_balance_rule` VALUES (202,2,2,1,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'SICK'),(203,4,2,1,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'SICK'),(204,6,2,1,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'SICK'),(205,8,2,1,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'SICK'),(206,10,2,1,'MONTHLY','1','2018-12-05','2019-02-04',NULL,NULL,'SICK'),(209,2,1,0,'ON_HIRE_DATE','','2018-12-05',NULL,NULL,NULL,'SICK'),(210,4,1,0,'ON_HIRE_DATE','','2018-12-05',NULL,NULL,NULL,'SICK'),(211,6,1,0,'ON_HIRE_DATE','','2018-12-05',NULL,NULL,NULL,'SICK'),(212,8,1,0,'ON_HIRE_DATE','','2018-12-05',NULL,NULL,NULL,'SICK'),(213,10,1,0,'ON_HIRE_DATE','','2018-12-05','2019-02-04',NULL,NULL,'SICK'),(216,1,2,1.5,'MONTHLY','1','2018-12-06',NULL,NULL,NULL,'PTO'),(217,1,2,1,'MONTHLY','1','2018-12-06',NULL,NULL,NULL,'SICK'),(218,9,2,1,'MONTHLY','1','2018-12-06',NULL,NULL,NULL,'PTO'),(219,9,2,0.5,'MONTHLY','1','2018-12-06',NULL,NULL,NULL,'SICK'),(220,7,2,2,'MONTHLY','1','2019-02-05',NULL,NULL,NULL,'PTO'),(221,7,2,1,'MONTHLY','1','2019-02-05',NULL,NULL,NULL,'SICK'),(222,11,2,1,'MONTHLY','1','2019-02-19',NULL,NULL,NULL,'PTO'),(223,11,2,0.5,'MONTHLY','1','2019-02-19',NULL,NULL,NULL,'SICK'),(245,2,2,2,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'PTO'),(246,4,2,2,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'PTO'),(247,6,2,2,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'PTO'),(248,8,2,2,'MONTHLY','1','2018-12-05',NULL,NULL,NULL,'PTO'),(249,10,2,2,'MONTHLY','1','2018-12-05','2019-02-04',NULL,NULL,'PTO'),(252,5,2,2,'MONTHLY','1','2018-12-06',NULL,NULL,NULL,'PTO'),(253,5,2,1,'MONTHLY','1','2018-12-06',NULL,NULL,NULL,'SICK'),(254,1,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'SICK'),(255,4,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'SICK'),(256,9,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'SICK'),(258,2,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'SICK'),(259,1,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'PTO'),(260,4,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'PTO'),(261,9,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'PTO'),(262,2,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'PTO'),(263,5,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'PTO'),(264,5,4,2,'ONCE','2018-12-05','2018-12-05','2018-12-05',1,NULL,'SICK'),(265,7,4,2,'ONCE','2019-02-04','2019-02-04','2019-02-04',1,NULL,'PTO'),(266,7,4,2,'ONCE','2019-02-04','2019-02-04','2019-02-04',1,NULL,'SICK'),(267,8,4,2,'ONCE','2019-02-04','2019-02-04','2019-02-04',1,NULL,'PTO'),(268,8,4,2,'ONCE','2019-02-04','2019-02-04','2019-02-04',1,NULL,'SICK'),(269,6,4,2,'ONCE','2019-02-04','2019-02-04','2019-02-04',1,NULL,'PTO'),(270,6,4,2,'ONCE','2019-02-04','2019-02-04','2019-02-04',1,NULL,'SICK'),(271,11,4,2,'ONCE','2019-02-18','2019-02-18','2019-02-18',1,NULL,'PTO'),(272,11,4,2,'ONCE','2019-02-18','2019-02-18','2019-02-18',1,NULL,'SICK');
/*!40000 ALTER TABLE `user_balance_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_balance_stats`
--

DROP TABLE IF EXISTS `user_balance_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_balance_stats` (
  `user_id` int(3) unsigned NOT NULL,
  `approved_balance` double NOT NULL,
  `not_approved_balance` double NOT NULL,
  `balance_type` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PTO',
  PRIMARY KEY (`user_id`,`balance_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_balance_stats`
--

LOCK TABLES `user_balance_stats` WRITE;
/*!40000 ALTER TABLE `user_balance_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_balance_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_context_name`
--

DROP TABLE IF EXISTS `user_context_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_context_name` (
  `user_id` int(10) unsigned NOT NULL,
  `at_context_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ap_context_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_context_name_at_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_context_name`
--

LOCK TABLES `user_context_name` WRITE;
/*!40000 ALTER TABLE `user_context_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_context_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_date_leave`
--

DROP TABLE IF EXISTS `user_date_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_date_leave` (
  `user_id` int(3) unsigned NOT NULL,
  `leave_date` date NOT NULL,
  `leave_type_id` int(3) unsigned NOT NULL,
  `leave_duration` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`leave_date`),
  KEY `user_date_leave_ibfk_2` (`leave_type_id`),
  CONSTRAINT `fk_user_date_leave_revision` FOREIGN KEY (`user_id`, `leave_date`) REFERENCES `user_date_leave_revision` (`user_id`, `leave_date`) ON DELETE NO ACTION,
  CONSTRAINT `user_date_leave_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_date_leave_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_date_leave`
--

LOCK TABLES `user_date_leave` WRITE;
/*!40000 ALTER TABLE `user_date_leave` DISABLE KEYS */;
INSERT INTO `user_date_leave` VALUES (1,'2018-12-24',1,-1),(1,'2018-12-25',1,-1),(1,'2018-12-26',1,-1),(1,'2019-01-18',4,120),(1,'2019-01-24',4,300),(1,'2019-02-14',1,-1),(1,'2019-02-15',1,300),(1,'2019-02-21',5,-1),(1,'2019-03-01',1,480),(1,'2019-03-07',5,90),(1,'2019-03-12',7,-1),(1,'2019-03-13',7,-1),(1,'2019-03-29',8,-1),(2,'2018-12-05',7,-1),(2,'2018-12-06',7,-1),(2,'2018-12-07',7,-1),(2,'2018-12-14',1,150),(2,'2018-12-17',1,120),(2,'2018-12-26',2,90),(2,'2019-01-03',2,120),(2,'2019-01-09',1,240),(2,'2019-01-10',1,480),(2,'2019-01-11',1,480),(2,'2019-01-14',4,90),(2,'2019-01-22',1,60),(2,'2019-01-28',3,480),(2,'2019-01-29',3,480),(2,'2019-01-30',3,480),(2,'2019-01-31',3,480),(2,'2019-02-04',3,90),(2,'2019-02-14',1,300),(2,'2019-02-18',5,180),(2,'2019-02-22',1,90),(2,'2019-03-01',2,240),(2,'2019-03-18',1,-1),(2,'2019-03-19',1,-1),(2,'2019-03-20',1,-1),(4,'2018-12-12',1,90),(4,'2018-12-27',2,100),(4,'2018-12-28',8,120),(4,'2019-01-11',2,105),(4,'2019-01-17',5,105),(4,'2019-01-21',1,480),(4,'2019-01-22',1,480),(4,'2019-01-29',4,165),(4,'2019-02-08',4,480),(4,'2019-02-15',1,120),(4,'2019-02-19',1,120),(4,'2019-02-25',3,480),(4,'2019-02-26',3,480),(4,'2019-02-27',3,480),(4,'2019-02-28',3,480),(4,'2019-03-01',3,480),(4,'2019-03-15',8,-1),(5,'2018-12-14',5,120),(5,'2018-12-17',7,-1),(5,'2018-12-18',7,-1),(5,'2018-12-19',7,-1),(5,'2018-12-20',7,-1),(5,'2018-12-21',7,-1),(5,'2018-12-31',1,-1),(5,'2019-01-02',7,-1),(5,'2019-01-03',5,120),(6,'2019-02-09',1,-1),(6,'2019-02-16',4,-1),(6,'2019-02-20',5,240),(6,'2019-02-28',1,300),(6,'2019-03-06',1,480),(6,'2019-03-23',5,-1),(7,'2019-02-11',5,120),(7,'2019-02-14',7,-1),(7,'2019-02-15',7,-1),(7,'2019-03-01',1,120),(7,'2019-03-11',1,-1),(7,'2019-03-12',1,-1),(7,'2019-03-13',1,-1),(7,'2019-03-14',1,300),(7,'2019-04-22',3,-1),(7,'2019-04-23',3,-1),(7,'2019-04-24',3,-1),(7,'2019-04-25',3,-1),(7,'2019-04-26',3,-1),(7,'2019-05-10',7,-1),(7,'2019-07-10',7,-1),(7,'2019-07-11',7,-1),(7,'2019-07-12',7,-1),(7,'2019-07-13',7,-1),(7,'2019-07-14',7,-1),(8,'2019-02-21',2,480),(8,'2019-02-27',5,-1),(8,'2019-03-01',8,60),(8,'2019-03-14',2,-1),(8,'2019-04-04',8,-1),(9,'2018-12-31',1,-1),(9,'2019-01-01',1,-1),(9,'2019-01-08',5,120),(9,'2019-02-11',5,-1),(9,'2019-03-07',7,-1),(9,'2019-05-06',5,-1),(9,'2019-05-07',5,-1),(9,'2019-05-08',5,-1),(9,'2019-05-30',4,-1),(9,'2019-05-31',4,-1),(10,'2019-02-12',5,-1),(10,'2019-02-22',1,-1),(10,'2019-03-06',2,180),(11,'2019-02-25',5,120),(11,'2019-03-11',5,120);
/*!40000 ALTER TABLE `user_date_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_date_leave_revision`
--

DROP TABLE IF EXISTS `user_date_leave_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_date_leave_revision` (
  `user_id` int(3) unsigned NOT NULL,
  `leave_date` date NOT NULL,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`leave_date`),
  UNIQUE KEY `uk_user_date_leave_revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_date_leave_revision`
--

LOCK TABLES `user_date_leave_revision` WRITE;
/*!40000 ALTER TABLE `user_date_leave_revision` DISABLE KEYS */;
INSERT INTO `user_date_leave_revision` VALUES (1,'2018-12-24',1),(1,'2018-12-25',2),(1,'2018-12-26',3),(1,'2019-02-14',4),(1,'2019-02-15',5),(1,'2019-03-01',6),(2,'2018-12-14',7),(2,'2018-12-17',8),(2,'2019-01-09',9),(2,'2019-01-10',10),(2,'2019-01-11',11),(2,'2019-01-22',12),(2,'2019-02-14',13),(2,'2019-02-22',14),(2,'2019-03-18',15),(2,'2019-03-19',16),(2,'2019-03-20',17),(4,'2018-12-12',18),(4,'2019-01-21',19),(4,'2019-01-22',20),(4,'2019-02-15',21),(4,'2019-02-19',22),(5,'2018-12-31',23),(6,'2019-02-09',24),(6,'2019-02-28',25),(6,'2019-03-06',26),(7,'2019-03-01',27),(7,'2019-03-11',28),(7,'2019-03-12',29),(7,'2019-03-13',30),(7,'2019-03-14',31),(9,'2018-12-31',32),(9,'2019-01-01',33),(10,'2019-02-22',34),(2,'2018-12-26',35),(2,'2019-01-03',36),(2,'2019-03-01',37),(4,'2018-12-27',38),(4,'2019-01-11',39),(8,'2019-02-21',45),(10,'2019-03-06',46),(2,'2019-01-28',47),(2,'2019-01-29',48),(2,'2019-01-30',49),(2,'2019-01-31',50),(2,'2019-02-04',51),(4,'2019-02-25',57),(4,'2019-02-26',58),(4,'2019-02-27',59),(4,'2019-02-28',60),(4,'2019-03-01',61),(7,'2019-04-22',67),(7,'2019-04-23',68),(7,'2019-04-24',69),(7,'2019-04-25',70),(7,'2019-04-26',71),(1,'2019-01-18',78),(1,'2019-01-24',79),(2,'2019-01-14',81),(4,'2019-01-29',83),(4,'2019-02-08',84),(6,'2019-02-16',86),(9,'2019-05-30',87),(9,'2019-05-31',88),(1,'2019-02-21',89),(1,'2019-03-07',90),(2,'2019-02-18',91),(4,'2019-01-17',93),(5,'2018-12-14',95),(5,'2019-01-03',96),(6,'2019-02-20',97),(7,'2019-02-11',98),(8,'2019-02-27',99),(9,'2019-01-08',100),(9,'2019-02-11',101),(9,'2019-05-06',102),(9,'2019-05-07',103),(9,'2019-05-08',104),(10,'2019-02-12',105),(11,'2019-02-25',106),(11,'2019-03-11',107),(1,'2019-03-12',108),(1,'2019-03-13',109),(2,'2018-12-05',110),(2,'2018-12-06',111),(2,'2018-12-07',112),(5,'2018-12-17',113),(5,'2018-12-18',114),(5,'2018-12-19',115),(5,'2018-12-20',116),(5,'2018-12-21',117),(5,'2019-01-02',118),(7,'2019-02-14',119),(7,'2019-02-15',120),(7,'2019-05-10',121),(7,'2019-07-10',122),(7,'2019-07-11',123),(7,'2019-07-12',124),(7,'2019-07-13',125),(7,'2019-07-14',126),(9,'2019-03-07',127),(1,'2019-03-29',128),(4,'2018-12-28',129),(8,'2019-03-01',130),(8,'2019-03-14',1155),(4,'2019-03-15',1156),(6,'2019-03-23',1180),(8,'2019-04-04',1183),(4,'2019-05-21',1184),(4,'2019-05-23',1185),(4,'2019-05-24',1186),(4,'2019-05-22',1187),(4,'2019-05-20',1188),(4,'2019-05-01',1189),(8,'2019-05-13',1190),(8,'2019-05-09',1191),(8,'2019-05-14',1192),(8,'2019-05-11',1193),(8,'2019-05-12',1194),(8,'2019-05-10',1195),(2,'2019-04-19',1196),(4,'2019-07-10',1197),(4,'2019-07-08',1198),(4,'2019-07-09',1199),(4,'2019-07-11',1200),(4,'2019-07-12',1201),(2,'2019-07-04',1202),(4,'2019-06-14',1203),(2,'2019-06-10',1204),(2,'2019-06-08',1205),(2,'2019-06-06',1206),(2,'2019-06-07',1207),(2,'2019-06-09',1208),(1,'2019-04-10',1209);
/*!40000 ALTER TABLE `user_date_leave_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_group_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (4,'Administration'),(2,'Design'),(3,'Development');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hierarchy_assignment`
--

DROP TABLE IF EXISTS `user_hierarchy_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_hierarchy_assignment` (
  `user_id` int(3) unsigned NOT NULL,
  `entity_type` int(2) NOT NULL,
  `entity_id` int(5) NOT NULL,
  `assignment_type` int(3) NOT NULL,
  `customer_id` int(3) NOT NULL,
  `project_id` int(3) DEFAULT NULL,
  `task_id` int(5) DEFAULT NULL,
  `include_self` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`,`entity_type`,`entity_id`,`assignment_type`),
  KEY `user_hierarchy_assignment_customer_id` (`customer_id`),
  KEY `user_hierarchy_assignment_project_id` (`project_id`),
  KEY `user_hierarchy_assignment_task_id` (`task_id`),
  CONSTRAINT `user_hierarchy_assignment_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_hierarchy_assignment_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_hierarchy_assignment_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_hierarchy_assignment_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hierarchy_assignment`
--

LOCK TABLES `user_hierarchy_assignment` WRITE;
/*!40000 ALTER TABLE `user_hierarchy_assignment` DISABLE KEYS */;
INSERT INTO `user_hierarchy_assignment` VALUES (1,0,2,0,2,NULL,NULL,_binary ''),(1,0,2,1,2,NULL,NULL,_binary ''),(1,0,3,0,3,NULL,NULL,_binary ''),(1,0,3,1,3,NULL,NULL,_binary ''),(1,0,4,0,4,NULL,NULL,_binary ''),(1,0,4,1,4,NULL,NULL,_binary ''),(1,0,5,0,5,NULL,NULL,_binary ''),(1,0,5,1,5,NULL,NULL,_binary ''),(2,0,3,0,3,NULL,NULL,_binary ''),(2,1,3,0,2,3,NULL,_binary ''),(2,1,3,1,2,3,NULL,_binary ''),(2,1,6,0,4,6,NULL,_binary ''),(2,1,6,1,4,6,NULL,_binary ''),(2,1,7,0,4,7,NULL,_binary ''),(2,1,7,1,4,7,NULL,_binary ''),(2,1,9,0,5,9,NULL,_binary ''),(2,1,9,1,5,9,NULL,_binary ''),(4,1,3,0,2,3,NULL,_binary ''),(4,1,3,1,2,3,NULL,_binary ''),(4,1,5,0,3,5,NULL,_binary ''),(4,1,5,1,3,5,NULL,_binary ''),(4,1,6,0,4,6,NULL,_binary ''),(4,1,6,1,4,6,NULL,_binary ''),(4,1,7,0,4,7,NULL,_binary ''),(4,1,7,1,4,7,NULL,_binary ''),(4,1,8,0,4,8,NULL,_binary ''),(4,1,8,1,4,8,NULL,_binary ''),(4,1,9,0,5,9,NULL,_binary ''),(4,1,9,1,5,9,NULL,_binary ''),(5,0,2,0,2,NULL,NULL,_binary ''),(5,0,2,1,2,NULL,NULL,_binary ''),(5,0,3,0,3,NULL,NULL,_binary ''),(5,0,3,1,3,NULL,NULL,_binary ''),(5,0,4,0,4,NULL,NULL,_binary ''),(5,0,4,1,4,NULL,NULL,_binary ''),(5,0,5,0,5,NULL,NULL,_binary ''),(5,0,5,1,5,NULL,NULL,_binary ''),(6,1,5,0,3,5,NULL,_binary ''),(6,1,5,1,3,5,NULL,_binary ''),(6,1,6,0,4,6,NULL,_binary ''),(6,1,6,1,4,6,NULL,_binary ''),(6,1,9,0,5,9,NULL,_binary ''),(6,1,9,1,5,9,NULL,_binary ''),(7,0,2,0,2,NULL,NULL,_binary ''),(7,0,2,1,2,NULL,NULL,_binary ''),(7,0,3,0,3,NULL,NULL,_binary ''),(7,0,3,1,3,NULL,NULL,_binary ''),(7,0,4,0,4,NULL,NULL,_binary ''),(7,0,4,1,4,NULL,NULL,_binary ''),(7,1,9,0,5,9,NULL,_binary ''),(7,1,9,1,5,9,NULL,_binary ''),(7,1,10,0,5,10,NULL,_binary ''),(8,1,3,0,2,3,NULL,_binary ''),(8,1,3,1,2,3,NULL,_binary ''),(8,1,5,0,3,5,NULL,_binary ''),(8,1,5,1,3,5,NULL,_binary ''),(8,1,6,0,4,6,NULL,_binary ''),(8,1,6,1,4,6,NULL,_binary ''),(8,1,7,0,4,7,NULL,_binary ''),(8,1,7,1,4,7,NULL,_binary ''),(8,1,9,0,5,9,NULL,_binary ''),(8,1,11,0,5,11,NULL,_binary ''),(9,0,2,0,2,NULL,NULL,_binary ''),(9,0,2,1,2,NULL,NULL,_binary ''),(9,0,3,0,3,NULL,NULL,_binary ''),(9,0,3,1,3,NULL,NULL,_binary ''),(9,0,4,0,4,NULL,NULL,_binary ''),(9,0,4,1,4,NULL,NULL,_binary ''),(9,0,5,0,5,NULL,NULL,_binary ''),(9,0,5,1,5,NULL,NULL,_binary ''),(10,1,5,0,3,5,NULL,_binary ''),(10,1,7,0,4,7,NULL,_binary ''),(10,1,9,0,5,9,NULL,_binary ''),(11,1,3,0,2,3,NULL,_binary ''),(11,1,3,1,2,3,NULL,_binary ''),(11,1,5,0,3,5,NULL,_binary ''),(11,1,5,1,3,5,NULL,_binary ''),(11,1,6,0,4,6,NULL,_binary ''),(11,1,6,1,4,6,NULL,_binary ''),(11,1,7,0,4,7,NULL,_binary ''),(11,1,7,1,4,7,NULL,_binary ''),(11,1,8,0,4,8,NULL,_binary ''),(11,1,8,1,4,8,NULL,_binary ''),(11,1,9,0,5,9,NULL,_binary '');
/*!40000 ALTER TABLE `user_hierarchy_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hierarchy_assignment_backup`
--

DROP TABLE IF EXISTS `user_hierarchy_assignment_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_hierarchy_assignment_backup` (
  `user_id` int(3) unsigned NOT NULL,
  `entity_type` int(2) NOT NULL,
  `entity_id` int(5) NOT NULL,
  `assignment_type` int(3) NOT NULL,
  `customer_id` int(3) NOT NULL,
  `project_id` int(3) DEFAULT NULL,
  `task_id` int(5) DEFAULT NULL,
  `include_self` bit(1) NOT NULL,
  `backup_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hierarchy_assignment_backup`
--

LOCK TABLES `user_hierarchy_assignment_backup` WRITE;
/*!40000 ALTER TABLE `user_hierarchy_assignment_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_hierarchy_assignment_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_last_login_time`
--

DROP TABLE IF EXISTS `user_last_login_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_last_login_time` (
  `user_id` int(3) unsigned NOT NULL,
  `product_name` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_timestamp` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_last_login_time`
--

LOCK TABLES `user_last_login_time` WRITE;
/*!40000 ALTER TABLE `user_last_login_time` DISABLE KEYS */;
INSERT INTO `user_last_login_time` VALUES (1,'actiPLANS','2019-04-10 10:00:51'),(1,'actiTIME','2019-04-10 12:18:24'),(2,'actiPLANS','2019-03-03 22:48:00'),(2,'actiTIME','2019-03-03 22:59:00'),(4,'actiPLANS','2019-03-02 22:57:00'),(4,'actiTIME','2019-03-02 22:47:00'),(5,'actiPLANS','2019-01-02 21:35:00'),(5,'actiTIME','2019-01-02 21:45:00'),(6,'actiPLANS','2019-03-03 15:33:00'),(6,'actiTIME','2019-03-03 15:33:00'),(7,'actiPLANS','2019-03-02 16:06:00'),(7,'actiTIME','2019-03-02 16:06:00'),(8,'actiPLANS','2019-03-03 15:49:00'),(8,'actiTIME','2019-03-03 15:49:00'),(9,'actiPLANS','2019-03-03 15:27:00'),(9,'actiTIME','2019-03-03 15:27:00'),(10,'actiPLANS','2019-03-03 15:38:00'),(10,'actiTIME','2019-03-03 15:38:00'),(11,'actiPLANS','2019-03-03 20:46:00'),(11,'actiTIME','2019-03-03 20:46:00');
/*!40000 ALTER TABLE `user_last_login_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_leave_time_request`
--

DROP TABLE IF EXISTS `user_leave_time_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_leave_time_request` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(3) unsigned NOT NULL,
  `leave_type_id` int(3) unsigned NOT NULL,
  `status` int(3) unsigned NOT NULL,
  `status_message` text COLLATE utf8mb4_unicode_ci,
  `status_timestamp` datetime NOT NULL,
  `approver_id` int(3) unsigned DEFAULT NULL,
  `first_date` date NOT NULL,
  `last_date` date NOT NULL,
  `first_date_duration` int(10) NOT NULL,
  `last_date_duration` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `waiting_deletion` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_leave_time_request_user_id_first_date` (`user_id`,`first_date`),
  KEY `fk_user_leave_time_request_approver_id` (`approver_id`),
  KEY `fk_user_leave_time_request_leave_type_id` (`leave_type_id`),
  CONSTRAINT `fk_user_leave_time_request_approver_id` FOREIGN KEY (`approver_id`) REFERENCES `at_user_revision` (`id`),
  CONSTRAINT `fk_user_leave_time_request_leave_type_id` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_leave_time_request_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leave_time_request`
--

LOCK TABLES `user_leave_time_request` WRITE;
/*!40000 ALTER TABLE `user_leave_time_request` DISABLE KEYS */;
INSERT INTO `user_leave_time_request` VALUES (1,1,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-03-01','2019-03-01',480,480,480,NULL,0),(2,2,1,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-14','2018-12-14',150,150,150,NULL,0),(3,2,1,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-17','2018-12-17',120,120,120,NULL,0),(4,2,2,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-26','2018-12-26',90,90,90,NULL,0),(5,2,2,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-03','2019-01-03',120,120,120,NULL,0),(6,2,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-09','2019-01-11',240,480,480,NULL,0),(7,2,4,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-14','2019-01-14',90,90,90,NULL,0),(8,2,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-22','2019-01-22',60,60,60,NULL,0),(9,2,3,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-28','2019-01-31',480,480,480,NULL,0),(10,2,3,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-04','2019-02-04',90,90,90,NULL,0),(11,2,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-14','2019-02-14',300,300,300,NULL,0),(17,4,2,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-27','2018-12-27',100,100,100,NULL,0),(20,4,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-21','2019-01-22',480,480,480,NULL,0),(21,4,4,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-29','2019-01-29',165,165,165,NULL,0),(22,4,4,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-08','2019-02-08',480,480,480,NULL,0),(23,4,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-15','2019-02-15',120,120,120,NULL,0),(24,4,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-19','2019-02-19',120,120,120,NULL,0),(25,4,3,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-25','2019-03-01',480,480,480,NULL,0),(33,1,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-14','2019-02-14',-1,-1,-1,NULL,0),(45,4,2,2,NULL,'2019-04-05 19:00:01',NULL,'2019-04-05','2019-04-05',-1,-1,-1,NULL,0),(49,1,1,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-24','2018-12-26',-1,-1,-1,NULL,0),(51,4,5,1,NULL,'2019-03-04 00:00:00',NULL,'2019-01-17','2019-01-17',105,105,105,NULL,0),(52,5,7,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-17','2018-12-17',-1,-1,-1,NULL,0),(53,5,7,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-18','2018-12-18',-1,-1,-1,NULL,0),(54,5,7,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-19','2018-12-19',-1,-1,-1,NULL,0),(55,5,7,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-20','2018-12-20',-1,-1,-1,NULL,0),(56,5,7,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-21','2018-12-21',-1,-1,-1,NULL,0),(57,9,1,1,NULL,'2019-03-04 00:00:00',NULL,'2018-12-31','2019-01-01',-1,-1,-1,NULL,0),(58,9,5,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-11','2019-02-11',-1,-1,-1,NULL,0),(59,7,7,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-14','2019-02-15',-1,-1,-1,NULL,0),(60,7,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-03-01','2019-03-01',120,120,120,NULL,0),(61,6,5,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-20','2019-02-20',240,240,240,NULL,0),(62,6,1,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-28','2019-02-28',300,300,300,NULL,0),(63,8,2,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-21','2019-02-21',480,480,480,NULL,0),(64,8,5,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-27','2019-02-27',-1,-1,-1,NULL,0),(65,11,5,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-25','2019-02-25',120,120,120,NULL,0),(66,10,5,1,NULL,'2019-03-04 00:00:00',NULL,'2019-02-12','2019-02-12',-1,-1,-1,NULL,0),(67,7,3,1,NULL,'2019-03-04 00:00:00',NULL,'2019-04-22','2019-04-26',-1,-1,-1,NULL,0),(69,7,7,2,'I have moved this business trip to the next week','2019-01-24 00:00:00',1,'2019-05-03','2019-05-03',-1,-1,-1,NULL,0),(70,7,7,1,NULL,'2019-03-04 00:00:00',NULL,'2019-05-10','2019-05-10',-1,-1,-1,NULL,0),(141,9,5,1,'Please prepare and send me financial report before this leave','2019-03-04 00:00:00',1,'2019-05-06','2019-05-08',-1,-1,-1,NULL,0),(146,9,4,1,NULL,'2019-03-03 00:00:00',NULL,'2019-05-30','2019-05-31',-1,-1,-1,NULL,0),(148,7,7,1,NULL,'2019-03-04 00:00:00',1,'2019-07-10','2019-07-14',-1,-1,-1,NULL,0),(153,2,2,1,NULL,'2019-03-04 00:00:00',NULL,'2019-03-01','2019-03-01',240,240,240,NULL,0),(154,1,4,1,NULL,'2019-03-03 00:00:00',NULL,'2019-01-24','2019-01-24',300,300,300,NULL,0),(155,1,5,1,NULL,'2019-03-03 00:00:00',NULL,'2019-02-21','2019-02-21',-1,-1,-1,NULL,0),(156,7,5,1,NULL,'2019-03-03 00:00:00',NULL,'2019-02-11','2019-02-11',120,120,120,NULL,0),(157,4,1,1,NULL,'2019-03-02 00:00:00',NULL,'2018-12-12','2018-12-12',90,90,90,NULL,0),(158,4,8,1,NULL,'2019-03-02 00:00:00',NULL,'2018-12-28','2018-12-28',120,120,120,NULL,0),(159,4,2,1,NULL,'2019-03-02 00:00:00',NULL,'2019-01-11','2019-01-11',105,105,105,NULL,0),(160,2,7,1,NULL,'2018-12-08 00:00:00',NULL,'2018-12-05','2018-12-07',-1,-1,-1,NULL,0),(161,5,5,1,NULL,'2018-12-22 00:00:00',NULL,'2018-12-14','2018-12-14',120,120,120,NULL,0),(162,5,1,1,NULL,'2019-01-05 00:00:00',NULL,'2018-12-31','2018-12-31',-1,-1,-1,NULL,0),(163,5,7,1,NULL,'2019-01-05 00:00:00',NULL,'2019-01-02','2019-01-02',-1,-1,-1,NULL,0),(164,5,5,1,NULL,'2019-01-05 00:00:00',NULL,'2019-01-03','2019-01-03',120,120,120,NULL,0),(166,9,5,1,NULL,'2019-01-12 00:00:00',NULL,'2019-01-08','2019-01-08',120,120,120,NULL,0),(167,1,4,1,NULL,'2019-01-19 00:00:00',NULL,'2019-01-18','2019-01-18',120,120,120,NULL,0),(168,6,1,1,NULL,'2019-02-09 00:00:00',NULL,'2019-02-09','2019-02-09',-1,-1,-1,NULL,0),(169,6,4,1,NULL,'2019-02-17 00:00:00',NULL,'2019-02-16','2019-02-16',-1,-1,-1,NULL,0),(170,1,1,1,NULL,'2019-02-17 00:00:00',NULL,'2019-02-15','2019-02-15',300,300,300,NULL,0),(171,10,1,1,NULL,'2019-02-24 00:00:00',NULL,'2019-02-22','2019-02-22',-1,-1,-1,NULL,0),(172,2,5,1,NULL,'2019-02-24 00:00:00',NULL,'2019-02-18','2019-02-18',180,180,180,NULL,0),(173,2,1,1,NULL,'2019-02-24 00:00:00',NULL,'2019-02-22','2019-02-22',90,90,90,NULL,0),(175,8,8,1,NULL,'2019-03-03 00:00:00',NULL,'2019-03-01','2019-03-01',60,60,60,NULL,0),(178,4,8,1,NULL,'2019-03-16 14:23:57',NULL,'2019-03-15','2019-03-15',-1,-1,-1,'Need to visit a dentist.',0),(180,8,8,1,NULL,'2019-04-04 19:00:01',NULL,'2019-04-04','2019-04-04',-1,-1,-1,'Annual Medical Examination.',0),(182,2,1,1,NULL,'2019-03-02 00:00:00',1,'2019-03-18','2019-03-20',-1,-1,-1,NULL,0),(186,1,8,1,NULL,'2019-03-04 00:00:00',9,'2019-03-29','2019-03-29',-1,-1,-1,NULL,0),(187,11,5,1,NULL,'2019-03-02 00:00:00',9,'2019-03-11','2019-03-11',120,-1,-1,NULL,0),(188,2,4,2,'There is an important meeting on Friday.','2019-03-02 00:00:00',7,'2019-03-08','2019-03-08',-1,-1,-1,NULL,0),(190,8,2,1,NULL,'2019-03-15 03:04:38',NULL,'2019-03-14','2019-03-14',-1,-1,-1,NULL,0),(193,6,5,1,NULL,'2019-03-24 03:23:47',NULL,'2019-03-23','2019-03-23',-1,-1,-1,NULL,0),(194,7,1,1,NULL,'2019-03-02 00:00:00',NULL,'2019-03-11','2019-03-14',-1,300,-1,NULL,0),(195,1,7,1,NULL,'2019-03-04 00:00:00',9,'2019-03-12','2019-03-13',-1,-1,-1,NULL,0),(196,1,5,1,NULL,'2019-02-28 00:00:00',NULL,'2019-03-07','2019-03-07',90,90,90,NULL,0),(198,9,7,1,NULL,'2019-02-28 00:00:00',NULL,'2019-03-07','2019-03-07',-1,-1,-1,NULL,0),(199,6,1,1,NULL,'2019-02-28 00:00:00',NULL,'2019-03-06','2019-03-06',480,480,480,NULL,0),(200,10,2,1,NULL,'2019-02-28 00:00:00',NULL,'2019-03-06','2019-03-06',180,180,180,NULL,0);
/*!40000 ALTER TABLE `user_leave_time_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_leave_time_request_change`
--

DROP TABLE IF EXISTS `user_leave_time_request_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_leave_time_request_change` (
  `id` int(3) unsigned NOT NULL,
  `leave_type_id` int(3) unsigned NOT NULL,
  `first_date_duration` int(10) NOT NULL,
  `last_date_duration` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `change_timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_leave_time_request_change_leave_type_id` (`leave_type_id`),
  CONSTRAINT `fk_user_leave_time_request_change_id` FOREIGN KEY (`id`) REFERENCES `user_leave_time_request` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_leave_time_request_change_leave_type_id` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leave_time_request_change`
--

LOCK TABLES `user_leave_time_request_change` WRITE;
/*!40000 ALTER TABLE `user_leave_time_request_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_leave_time_request_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ltr_approver`
--

DROP TABLE IF EXISTS `user_ltr_approver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ltr_approver` (
  `user_id` int(3) unsigned NOT NULL,
  `approver_id` int(3) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`approver_id`),
  KEY `fk_user_approver_approver_id` (`approver_id`),
  CONSTRAINT `fk_user_approver_approver_id` FOREIGN KEY (`approver_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_approver_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ltr_approver`
--

LOCK TABLES `user_ltr_approver` WRITE;
/*!40000 ALTER TABLE `user_ltr_approver` DISABLE KEYS */;
INSERT INTO `user_ltr_approver` VALUES (2,1),(8,1),(2,7),(8,7),(10,7);
/*!40000 ALTER TABLE `user_ltr_approver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notif_rule_send`
--

DROP TABLE IF EXISTS `user_notif_rule_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notif_rule_send` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(3) unsigned NOT NULL,
  `user_id` int(3) unsigned NOT NULL,
  `notification_date` date NOT NULL,
  `range_start` date DEFAULT NULL,
  `range_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_notif_rule_send_user` (`user_id`),
  KEY `fk_user_notif_rule_send_rule` (`rule_id`),
  CONSTRAINT `fk_user_notif_rule_send_rule` FOREIGN KEY (`rule_id`) REFERENCES `notification_rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_notif_rule_send_user` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notif_rule_send`
--

LOCK TABLES `user_notif_rule_send` WRITE;
/*!40000 ALTER TABLE `user_notif_rule_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notif_rule_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project_revision`
--

DROP TABLE IF EXISTS `user_project_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project_revision` (
  `user_id` int(3) unsigned NOT NULL,
  `project_id` int(6) NOT NULL,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`),
  UNIQUE KEY `uk_user_project_revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project_revision`
--

LOCK TABLES `user_project_revision` WRITE;
/*!40000 ALTER TABLE `user_project_revision` DISABLE KEYS */;
INSERT INTO `user_project_revision` VALUES (2,3,1),(4,3,3),(8,3,5),(11,3,7),(4,5,9),(6,5,11),(8,5,13),(10,5,15),(11,5,16),(2,6,18),(4,6,20),(6,6,22),(8,6,24),(11,6,26),(2,7,28),(4,7,30),(8,7,32),(10,7,34),(11,7,35),(4,8,37),(11,8,39),(2,9,41),(4,9,43),(6,9,45),(7,9,47),(8,9,49),(10,9,50),(11,9,51),(7,10,52),(8,11,53),(2,5,1146),(12,3,1212),(12,5,1213),(12,6,1214),(12,7,1215),(12,8,1216),(12,9,1217),(12,10,1218),(12,11,1219),(12,12,1220),(13,3,1223),(13,5,1224),(13,6,1225),(13,7,1226),(13,8,1227),(13,9,1228),(13,10,1229),(13,11,1230),(13,12,1231),(14,3,1234),(14,5,1235),(14,6,1236),(14,7,1237),(14,8,1238),(14,9,1239),(14,10,1240),(14,11,1241),(14,12,1242),(15,3,1251),(15,5,1252),(15,6,1253),(15,7,1254),(15,8,1255),(15,9,1256),(15,10,1257),(15,11,1258),(15,12,1259),(17,3,1263),(17,5,1264),(17,6,1265),(17,7,1266),(17,8,1267),(17,9,1268),(17,10,1269),(17,11,1270),(17,12,1271),(20,3,1276),(20,5,1277),(20,6,1278),(20,7,1279),(20,8,1280),(20,9,1281),(20,10,1282),(20,11,1283),(20,12,1284);
/*!40000 ALTER TABLE `user_project_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rate`
--

DROP TABLE IF EXISTS `user_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rate` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `effective_date` date NOT NULL,
  `user_id` int(3) unsigned NOT NULL,
  `regular_rate` double(10,2) unsigned NOT NULL,
  `overtime_rate` double(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_effective_date_unique` (`effective_date`,`user_id`),
  KEY `user_rate_id_fk_at_user_id` (`user_id`),
  CONSTRAINT `user_rate_id_fk_at_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users rates information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rate`
--

LOCK TABLES `user_rate` WRITE;
/*!40000 ALTER TABLE `user_rate` DISABLE KEYS */;
INSERT INTO `user_rate` VALUES (221,'2019-02-04',7,50.00,75.00),(225,'2019-02-04',8,35.00,52.50),(228,'2019-02-04',6,25.00,37.50),(229,'2019-02-18',11,20.00,30.00),(235,'2018-12-05',9,30.00,45.00),(236,'2019-04-05',9,40.00,60.00),(237,'2018-12-05',4,30.00,45.00),(238,'2018-12-05',2,20.00,30.00),(239,'2019-02-11',2,40.00,60.00),(243,'2018-12-05',1,30.00,30.00),(244,'2019-02-04',1,50.00,75.00),(246,'2018-12-05',5,20.00,30.00);
/*!40000 ALTER TABLE `user_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_schedule`
--

DROP TABLE IF EXISTS `user_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_schedule` (
  `user_id` int(3) unsigned NOT NULL,
  `effective_date` date NOT NULL,
  `schedule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `week_total` int(3) unsigned NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`,`effective_date`),
  CONSTRAINT `user_schedule_at_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_schedule`
--

LOCK TABLES `user_schedule` WRITE;
/*!40000 ALTER TABLE `user_schedule` DISABLE KEYS */;
INSERT INTO `user_schedule` VALUES (1,'2019-02-04','0,420,420,420,420,420,0',2100,0);
/*!40000 ALTER TABLE `user_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seen_gui_notif`
--

DROP TABLE IF EXISTS `user_seen_gui_notif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_seen_gui_notif` (
  `user_id` int(3) unsigned NOT NULL,
  `seen_gui_notif_id` int(3) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`seen_gui_notif_id`),
  CONSTRAINT `gui_notification_user_id_fk_at_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seen_gui_notif`
--

LOCK TABLES `user_seen_gui_notif` WRITE;
/*!40000 ALTER TABLE `user_seen_gui_notif` DISABLE KEYS */;
INSERT INTO `user_seen_gui_notif` VALUES (1,1);
/*!40000 ALTER TABLE `user_seen_gui_notif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seen_welcome_screen`
--

DROP TABLE IF EXISTS `user_seen_welcome_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_seen_welcome_screen` (
  `user_id` int(3) unsigned NOT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  `is_seen_ap` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_seen_welcome_screen_at_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seen_welcome_screen`
--

LOCK TABLES `user_seen_welcome_screen` WRITE;
/*!40000 ALTER TABLE `user_seen_welcome_screen` DISABLE KEYS */;
INSERT INTO `user_seen_welcome_screen` VALUES (1,1,1);
/*!40000 ALTER TABLE `user_seen_welcome_screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_id` int(3) unsigned NOT NULL,
  `param_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param_value` text COLLATE utf8mb4_unicode_ci,
  `param_category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `k_user_settings_user_id_param_category` (`user_id`,`param_category`),
  CONSTRAINT `fk_user_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (5,'recordsPerPage','10','view_task_lighbox'),(5,'sortBy','date','view_task_lighbox'),(5,'sortOrder','Desc','view_task_lighbox'),(5,'allUsers','true','approve_tt'),(5,'approveTTOrder.asc','true','approve_tt'),(5,'approveTTOrder.groupType','2','approve_tt'),(5,'weekApprovalStatuses','READY','approve_tt'),(5,'weekApprovalStatuses','NOT_READY','approve_tt'),(5,'weekApprovalStatuses','REJECTED','approve_tt'),(5,'timestampOfLastReadRecord','1448955679000','approve_tt_history'),(2,'recordsPerPage','10','view_task_lighbox'),(2,'sortBy','date','view_task_lighbox'),(2,'sortOrder','Desc','view_task_lighbox'),(1,'timestampOfLastReadRecord','1454230456000','approve_tt_history'),(1,'colleaguesPerPage','10','my_schedule'),(6,'colleaguesPerPage','10','my_schedule'),(1,'balanceHistoryRecordsPerPage','10','my_pto_balance_history'),(1,'balanceHistoryRecordsPerPage','10','my_sick_balance_history'),(1,'period','6','leave_time_history'),(1,'userId','2','leave_time_history'),(9,'allUsers','true','approve_tt'),(9,'approveTTOrder.asc','true','approve_tt'),(9,'approveTTOrder.groupType','2','approve_tt'),(9,'weekApprovalStatuses','READY','approve_tt'),(9,'weekApprovalStatuses','NOT_READY','approve_tt'),(9,'weekApprovalStatuses','REJECTED','approve_tt'),(9,'timestampOfLastReadRecord','1454230430000','approve_tt_history'),(7,'allUsers','true','approve_tt'),(7,'approveTTOrder.asc','true','approve_tt'),(7,'approveTTOrder.groupType','2','approve_tt'),(7,'weekApprovalStatuses','READY','approve_tt'),(7,'weekApprovalStatuses','NOT_READY','approve_tt'),(7,'weekApprovalStatuses','REJECTED','approve_tt'),(7,'timestampOfLastReadRecord','1454230290000','approve_tt_history'),(9,'ascending','true','lt_planning'),(9,'displayOnlyAssignedToMeUsers','false','lt_planning'),(9,'recordsPerPage','10','lt_planning'),(9,'sortBy','1','lt_planning'),(7,'recordsPerPage','10','view_task_lighbox'),(7,'sortBy','date','view_task_lighbox'),(7,'sortOrder','Desc','view_task_lighbox'),(1,'allUsers','true','approve_tt'),(1,'approveTTOrder.asc','true','approve_tt'),(1,'approveTTOrder.groupType','2','approve_tt'),(1,'weekApprovalStatuses','READY','approve_tt'),(1,'weekApprovalStatuses','NOT_READY','approve_tt'),(1,'weekApprovalStatuses','REJECTED','approve_tt'),(6,'recordsPerPage','10','view_task_lighbox'),(6,'sortBy','date','view_task_lighbox'),(6,'sortOrder','Desc','view_task_lighbox'),(1,'ascending','true','lt_planning'),(1,'dateFromStr','2019-02-04','lt_planning'),(1,'displayOnlyAssignedToMeUsers','false','lt_planning'),(1,'groupsFilter',NULL,'lt_planning'),(1,'groupsFilterType',NULL,'lt_planning'),(1,'recordsPerPage','10','lt_planning'),(1,'sortBy','1','lt_planning'),(1,'allUsers','true','lock_tt'),(1,'dateRangeFromDate','2019-03-04','lock_tt'),(1,'dateRangeState','range.state.custom','lock_tt'),(1,'dateRangeToDate','2019-03-17','lock_tt'),(1,'groupType','USER_GROUP','lock_tt'),(1,'recordsPerPage','20','lock_tt'),(1,'selectedGroups','','lock_tt'),(1,'selectedUsers','','lock_tt'),(1,'showDisabled','true','lock_tt'),(1,'shownRecord','1','lock_tt'),(1,'userListSortConstant','ORDER_BY_USERNAME','lock_tt'),(1,'asc','true','ap_user_list'),(1,'filter.groupIds',NULL,'ap_user_list'),(1,'filter.groupType',NULL,'ap_user_list'),(1,'filter.onlyUsersWithoutApprovers','false','ap_user_list'),(1,'filter.rolesFilter','ALL','ap_user_list'),(1,'filter.statusFilter','ALL','ap_user_list'),(1,'order','USER_NAME','ap_user_list'),(1,'recordsPerPage','10','ap_user_list'),(1,'chartSortOption.asc','true','leave_report_chart_settings'),(1,'chartSortOption.sortType','BY_CATEGORY','leave_report_chart_settings'),(1,'chartType','LEAVE_TIME','leave_report_chart_settings'),(1,'showChart','true','leave_report_chart_settings'),(1,'leaveReportParameters.balanceQualifier','PTO_AND_SICK_DAYS','ap_leave_report_parameters'),(1,'leaveReportParameters.columnsConfig','LEAVE_TIME_AND_BALANCES','ap_leave_report_parameters'),(1,'leaveReportParameters.dateRangeSelection.fromDate','2019-04-01','ap_leave_report_parameters'),(1,'leaveReportParameters.dateRangeSelection.qualifier','CURRENT_WEEK','ap_leave_report_parameters'),(1,'leaveReportParameters.dateRangeSelection.toDate','2019-04-07','ap_leave_report_parameters'),(1,'leaveReportParameters.firstGroupingLevel','USER','ap_leave_report_parameters'),(1,'leaveReportParameters.leaveTypeSelection.leaveTypes','','ap_leave_report_parameters'),(1,'leaveReportParameters.leaveTypeSelection.qualifier','ALL','ap_leave_report_parameters'),(1,'leaveReportParameters.leaveTypeSelection.showArchived','false','ap_leave_report_parameters'),(1,'leaveReportParameters.secondGroupingLevel','NONE','ap_leave_report_parameters'),(1,'leaveReportParameters.timeFormat','TIME','ap_leave_report_parameters'),(1,'leaveReportParameters.userSelection.allUsers','true','ap_leave_report_parameters'),(1,'leaveReportParameters.userSelection.groupType',NULL,'ap_leave_report_parameters'),(1,'leaveReportParameters.userSelection.includeUserTeamOnly','false','ap_leave_report_parameters'),(1,'leaveReportParameters.userSelection.includeUsersWithoutData','false','ap_leave_report_parameters'),(1,'leaveReportParameters.userSelection.selectedGroups','','ap_leave_report_parameters'),(1,'leaveReportParameters.userSelection.selectedUsers','','ap_leave_report_parameters'),(1,'showOnlyAssignedUsers','false','ap_leave_report_parameters'),(1,'fitDataToOnePage','false','print_chart'),(1,'paperOrientation','PORTRAIT','print_chart'),(1,'paperSize','A4','print_chart'),(1,'showHeaderOnEachPage','false','print_chart'),(1,'showListOfDataValues','true','print_chart'),(1,'showListOfPercentValues','false','print_chart'),(1,'showLogoInHeader','true','print_chart'),(1,'balanceTypeFilter','ALL','corporate_requests'),(1,'displayOnlyAssignedToMeUsers','false','corporate_requests'),(1,'groupsFilter',NULL,'corporate_requests'),(1,'groupsFilterType',NULL,'corporate_requests'),(1,'leaveTypesFilter',NULL,'corporate_requests'),(1,'recordsPerPage','10','corporate_requests'),(1,'showPastApprovedRejectedRequests','false','corporate_requests'),(1,'statusFilter',NULL,'corporate_requests'),(1,'tableSorting.asc','true','corporate_requests'),(1,'tableSorting.sortBy','PERIOD','corporate_requests'),(1,'tableSorting.sortByStr','PERIOD','corporate_requests'),(1,'filter.allSelected','true','user_list'),(1,'filter.groupIds',NULL,'user_list'),(1,'filter.groupType',NULL,'user_list'),(1,'filter.managementFilter','ALL','user_list'),(1,'filter.showDisabled','true','user_list'),(1,'filter.userIds',NULL,'user_list'),(1,'order.asc','true','user_list'),(1,'order.order','1','user_list'),(1,'recordsPerPage','10','user_list');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_task`
--

DROP TABLE IF EXISTS `user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_task` (
  `user_id` int(3) unsigned NOT NULL,
  `task_id` int(5) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`,`date`),
  KEY `user_task_user_i` (`user_id`),
  KEY `user_task_task_i` (`task_id`),
  CONSTRAINT `fk_user_task_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_task_user` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_task`
--

LOCK TABLES `user_task` WRITE;
/*!40000 ALTER TABLE `user_task` DISABLE KEYS */;
INSERT INTO `user_task` VALUES (1,35,'2019-02-05'),(1,35,'2019-02-12'),(1,35,'2019-02-19'),(1,35,'2019-02-26'),(1,35,'2019-03-05'),(1,36,'2018-12-04'),(1,36,'2018-12-11'),(1,36,'2018-12-25'),(1,36,'2019-01-22'),(1,36,'2019-02-05'),(1,36,'2019-02-12'),(1,37,'2019-02-05'),(1,37,'2019-02-12'),(1,37,'2019-02-19'),(1,37,'2019-03-05'),(1,43,'2019-02-26'),(1,43,'2019-03-05'),(1,48,'2018-12-04'),(1,48,'2018-12-18'),(1,48,'2019-01-01'),(1,48,'2019-01-08'),(1,48,'2019-01-15'),(1,48,'2019-01-22'),(1,48,'2019-02-05'),(1,48,'2019-02-12'),(1,48,'2019-02-19'),(1,48,'2019-02-26'),(1,55,'2019-02-26'),(1,55,'2019-03-05'),(1,56,'2019-01-15'),(1,56,'2019-01-22'),(1,56,'2019-01-29'),(1,56,'2019-02-05'),(1,56,'2019-02-12'),(1,56,'2019-02-19'),(1,56,'2019-03-05'),(1,58,'2018-12-04'),(1,58,'2018-12-11'),(1,58,'2018-12-18'),(1,58,'2018-12-25'),(1,58,'2019-01-01'),(1,58,'2019-01-08'),(1,59,'2018-12-11'),(1,59,'2018-12-18'),(1,59,'2019-01-01'),(1,59,'2019-01-08'),(1,59,'2019-01-15'),(1,59,'2019-01-22'),(1,59,'2019-02-26'),(1,60,'2018-12-11'),(1,60,'2018-12-25'),(1,60,'2019-01-01'),(1,60,'2019-01-08'),(1,60,'2019-01-15'),(1,60,'2019-01-22'),(1,60,'2019-01-29'),(1,60,'2019-02-19'),(1,60,'2019-02-26'),(1,61,'2018-12-04'),(1,61,'2018-12-11'),(1,61,'2018-12-18'),(1,61,'2019-01-08'),(1,61,'2019-01-22'),(1,61,'2019-01-29'),(1,62,'2018-12-11'),(1,62,'2018-12-18'),(1,62,'2019-01-01'),(1,62,'2019-01-08'),(1,62,'2019-01-15'),(1,62,'2019-01-22'),(1,62,'2019-01-29'),(1,79,'2019-02-05'),(1,79,'2019-02-19'),(2,18,'2018-12-18'),(2,18,'2018-12-25'),(2,18,'2019-01-01'),(2,18,'2019-01-08'),(2,18,'2019-01-22'),(2,21,'2018-12-11'),(2,21,'2018-12-18'),(2,21,'2018-12-25'),(2,21,'2019-01-01'),(2,22,'2018-12-11'),(2,22,'2018-12-18'),(2,22,'2019-01-01'),(2,25,'2019-01-22'),(2,27,'2019-03-05'),(2,29,'2019-02-12'),(2,29,'2019-02-19'),(2,29,'2019-02-26'),(2,29,'2019-03-05'),(2,30,'2019-01-22'),(2,30,'2019-02-12'),(2,30,'2019-02-19'),(2,30,'2019-02-26'),(2,30,'2019-03-05'),(2,31,'2019-02-12'),(2,31,'2019-03-05'),(2,32,'2019-02-05'),(2,33,'2019-01-15'),(2,33,'2019-01-22'),(2,33,'2019-02-05'),(2,34,'2019-01-08'),(2,34,'2019-01-15'),(2,35,'2018-12-11'),(2,35,'2019-01-15'),(2,35,'2019-02-05'),(2,35,'2019-02-12'),(2,35,'2019-02-19'),(2,35,'2019-02-26'),(2,35,'2019-03-05'),(2,36,'2018-12-11'),(2,36,'2018-12-18'),(2,36,'2018-12-25'),(2,36,'2019-01-01'),(2,36,'2019-01-08'),(2,36,'2019-01-15'),(2,36,'2019-01-22'),(2,36,'2019-02-05'),(2,36,'2019-02-12'),(2,36,'2019-02-19'),(2,36,'2019-02-26'),(2,36,'2019-03-05'),(2,37,'2018-12-11'),(2,37,'2018-12-25'),(2,37,'2019-01-15'),(2,37,'2019-02-05'),(2,37,'2019-02-26'),(2,37,'2019-03-05'),(2,39,'2018-12-18'),(2,39,'2019-01-01'),(2,40,'2019-01-08'),(2,42,'2019-01-22'),(2,56,'2019-02-05'),(2,63,'2019-01-08'),(2,63,'2019-01-15'),(2,69,'2019-01-22'),(2,79,'2018-12-11'),(2,79,'2018-12-25'),(2,79,'2019-03-05'),(4,17,'2018-12-18'),(4,17,'2019-02-05'),(4,17,'2019-02-12'),(4,17,'2019-02-19'),(4,17,'2019-03-05'),(4,25,'2019-03-05'),(4,26,'2019-01-22'),(4,26,'2019-01-29'),(4,26,'2019-02-05'),(4,26,'2019-02-12'),(4,26,'2019-02-19'),(4,28,'2019-01-01'),(4,35,'2018-12-04'),(4,35,'2018-12-11'),(4,35,'2018-12-18'),(4,35,'2018-12-25'),(4,35,'2019-01-01'),(4,35,'2019-01-08'),(4,35,'2019-01-15'),(4,35,'2019-01-22'),(4,35,'2019-01-29'),(4,35,'2019-02-05'),(4,35,'2019-02-12'),(4,35,'2019-02-19'),(4,35,'2019-03-05'),(4,36,'2018-12-04'),(4,36,'2018-12-11'),(4,36,'2018-12-18'),(4,36,'2018-12-25'),(4,36,'2019-01-01'),(4,36,'2019-01-08'),(4,36,'2019-01-15'),(4,36,'2019-01-22'),(4,36,'2019-01-29'),(4,36,'2019-02-05'),(4,36,'2019-02-12'),(4,36,'2019-02-19'),(4,37,'2018-12-04'),(4,37,'2018-12-11'),(4,37,'2018-12-25'),(4,37,'2019-01-15'),(4,37,'2019-01-29'),(4,37,'2019-02-12'),(4,37,'2019-03-05'),(4,38,'2018-12-11'),(4,38,'2018-12-18'),(4,38,'2018-12-25'),(4,38,'2019-01-01'),(4,38,'2019-01-08'),(4,39,'2018-12-11'),(4,39,'2018-12-18'),(4,39,'2018-12-25'),(4,39,'2019-01-01'),(4,40,'2019-01-08'),(4,40,'2019-01-15'),(4,40,'2019-01-22'),(4,40,'2019-01-29'),(4,40,'2019-02-05'),(4,40,'2019-02-12'),(4,40,'2019-02-19'),(4,40,'2019-03-05'),(4,41,'2019-03-05'),(4,63,'2018-12-04'),(4,63,'2018-12-11'),(4,63,'2018-12-25'),(4,63,'2019-01-01'),(4,63,'2019-01-08'),(4,63,'2019-01-15'),(4,63,'2019-01-22'),(4,63,'2019-01-29'),(4,65,'2018-12-04'),(4,65,'2019-01-01'),(4,65,'2019-01-08'),(4,65,'2019-01-22'),(4,65,'2019-01-29'),(5,25,'2018-12-04'),(5,25,'2018-12-11'),(5,25,'2018-12-18'),(5,25,'2018-12-25'),(5,25,'2019-01-01'),(5,25,'2019-03-05'),(5,35,'2018-12-04'),(5,35,'2018-12-11'),(5,35,'2018-12-18'),(5,35,'2018-12-25'),(5,35,'2019-01-01'),(5,36,'2018-12-04'),(5,36,'2018-12-11'),(5,36,'2018-12-18'),(5,36,'2018-12-25'),(5,36,'2019-01-01'),(5,37,'2018-12-04'),(5,37,'2018-12-11'),(5,37,'2018-12-18'),(5,37,'2018-12-25'),(5,37,'2019-01-01'),(5,67,'2018-12-04'),(5,67,'2018-12-11'),(5,67,'2018-12-18'),(5,68,'2018-12-04'),(5,68,'2018-12-11'),(5,68,'2018-12-18'),(5,69,'2018-12-25'),(5,69,'2019-01-01'),(5,70,'2018-12-25'),(5,70,'2019-01-01'),(6,16,'2019-02-12'),(6,16,'2019-02-19'),(6,16,'2019-02-26'),(6,17,'2019-02-05'),(6,17,'2019-02-12'),(6,17,'2019-02-19'),(6,17,'2019-02-26'),(6,35,'2019-02-12'),(6,35,'2019-02-26'),(6,35,'2019-03-05'),(6,36,'2019-02-05'),(6,36,'2019-02-12'),(6,36,'2019-02-19'),(6,36,'2019-02-26'),(6,36,'2019-03-05'),(6,37,'2019-02-05'),(6,37,'2019-02-12'),(6,37,'2019-02-19'),(6,37,'2019-02-26'),(6,37,'2019-03-05'),(6,63,'2019-02-05'),(6,63,'2019-02-19'),(6,63,'2019-02-26'),(6,63,'2019-03-05'),(6,79,'2019-02-05'),(7,25,'2019-02-05'),(7,25,'2019-02-12'),(7,25,'2019-02-19'),(7,25,'2019-02-26'),(7,25,'2019-03-05'),(7,35,'2019-02-05'),(7,35,'2019-02-12'),(7,35,'2019-02-19'),(7,35,'2019-02-26'),(7,35,'2019-03-05'),(7,36,'2019-02-05'),(7,36,'2019-02-12'),(7,36,'2019-02-19'),(7,36,'2019-02-26'),(7,36,'2019-03-05'),(7,37,'2019-02-05'),(7,37,'2019-02-12'),(7,37,'2019-02-19'),(7,37,'2019-02-26'),(7,37,'2019-03-05'),(7,67,'2019-02-05'),(7,67,'2019-02-12'),(7,67,'2019-02-19'),(7,67,'2019-02-26'),(7,67,'2019-03-05'),(7,69,'2019-02-05'),(7,69,'2019-02-12'),(7,69,'2019-02-19'),(7,69,'2019-02-26'),(7,69,'2019-03-05'),(7,70,'2019-02-12'),(8,16,'2019-02-05'),(8,16,'2019-02-12'),(8,16,'2019-02-19'),(8,16,'2019-02-26'),(8,17,'2019-02-05'),(8,17,'2019-02-12'),(8,17,'2019-02-19'),(8,17,'2019-02-26'),(8,29,'2019-02-05'),(8,29,'2019-02-12'),(8,29,'2019-02-19'),(8,29,'2019-02-26'),(8,29,'2019-03-05'),(8,36,'2019-02-05'),(8,36,'2019-02-26'),(8,63,'2019-02-05'),(8,63,'2019-02-12'),(8,63,'2019-02-19'),(8,63,'2019-02-26'),(8,63,'2019-03-05'),(8,79,'2019-02-05'),(8,79,'2019-02-12'),(9,35,'2018-12-04'),(9,35,'2018-12-11'),(9,35,'2018-12-18'),(9,35,'2018-12-25'),(9,35,'2019-01-01'),(9,35,'2019-01-08'),(9,35,'2019-01-15'),(9,35,'2019-01-22'),(9,35,'2019-01-29'),(9,35,'2019-02-05'),(9,35,'2019-02-12'),(9,35,'2019-02-19'),(9,35,'2019-02-26'),(9,35,'2019-03-05'),(9,36,'2018-12-04'),(9,36,'2018-12-11'),(9,36,'2018-12-18'),(9,36,'2018-12-25'),(9,36,'2019-01-01'),(9,36,'2019-01-08'),(9,36,'2019-01-15'),(9,36,'2019-01-22'),(9,36,'2019-01-29'),(9,36,'2019-02-05'),(9,36,'2019-02-12'),(9,36,'2019-02-19'),(9,36,'2019-02-26'),(9,36,'2019-03-05'),(9,71,'2018-12-04'),(9,71,'2018-12-11'),(9,71,'2018-12-18'),(9,71,'2018-12-25'),(9,71,'2019-01-01'),(9,71,'2019-01-08'),(9,71,'2019-01-15'),(9,71,'2019-01-22'),(9,71,'2019-01-29'),(9,71,'2019-02-05'),(9,71,'2019-02-12'),(9,71,'2019-02-19'),(9,71,'2019-02-26'),(9,71,'2019-03-05'),(9,72,'2018-12-04'),(9,72,'2018-12-11'),(9,72,'2018-12-18'),(9,72,'2018-12-25'),(9,72,'2019-01-01'),(9,72,'2019-01-08'),(9,72,'2019-01-15'),(9,72,'2019-01-22'),(9,72,'2019-01-29'),(9,72,'2019-02-05'),(9,72,'2019-02-12'),(9,72,'2019-02-19'),(9,72,'2019-02-26'),(9,72,'2019-03-05'),(9,73,'2018-12-04'),(9,73,'2018-12-11'),(9,73,'2018-12-18'),(9,73,'2018-12-25'),(9,73,'2019-01-01'),(9,73,'2019-01-08'),(9,73,'2019-01-15'),(9,73,'2019-01-22'),(9,73,'2019-01-29'),(9,73,'2019-02-05'),(9,73,'2019-02-12'),(9,73,'2019-02-26'),(9,73,'2019-03-05'),(9,74,'2018-12-04'),(9,74,'2018-12-11'),(9,74,'2018-12-18'),(9,74,'2018-12-25'),(9,74,'2019-01-01'),(9,74,'2019-01-08'),(9,74,'2019-01-15'),(9,74,'2019-01-22'),(9,74,'2019-01-29'),(9,74,'2019-02-05'),(9,74,'2019-02-12'),(9,74,'2019-02-19'),(9,74,'2019-02-26'),(9,75,'2018-12-04'),(9,75,'2018-12-11'),(9,75,'2018-12-18'),(9,75,'2018-12-25'),(9,75,'2019-01-01'),(9,75,'2019-01-08'),(9,75,'2019-01-15'),(9,75,'2019-01-22'),(9,75,'2019-01-29'),(9,75,'2019-02-05'),(9,75,'2019-02-12'),(9,75,'2019-02-19'),(9,75,'2019-02-26'),(10,16,'2019-02-05'),(10,16,'2019-02-12'),(10,16,'2019-02-19'),(10,16,'2019-02-26'),(10,16,'2019-03-05'),(10,36,'2019-02-05'),(10,36,'2019-02-12'),(10,36,'2019-02-19'),(10,36,'2019-02-26'),(10,36,'2019-03-05'),(10,77,'2019-02-05'),(10,77,'2019-02-12'),(10,77,'2019-02-19'),(10,77,'2019-02-26'),(10,77,'2019-03-05'),(10,79,'2019-02-05'),(10,79,'2019-02-12'),(10,79,'2019-02-19'),(10,79,'2019-02-26'),(10,79,'2019-03-05'),(11,26,'2019-02-19'),(11,26,'2019-02-26'),(11,26,'2019-03-05'),(11,27,'2019-02-19'),(11,27,'2019-02-26'),(11,27,'2019-03-05'),(11,35,'2019-02-19'),(11,35,'2019-02-26'),(11,35,'2019-03-05'),(11,36,'2019-02-19'),(11,36,'2019-02-26'),(11,36,'2019-03-05'),(11,37,'2019-02-19'),(11,37,'2019-02-26'),(11,37,'2019-03-05');
/*!40000 ALTER TABLE `user_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_task_comment`
--

DROP TABLE IF EXISTS `user_task_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_task_comment` (
  `user_id` int(3) unsigned NOT NULL,
  `task_id` int(5) NOT NULL,
  `comment_date` date NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`,`comment_date`),
  KEY `user_task_comment_user_i` (`user_id`),
  KEY `user_task_comment_task_i` (`task_id`),
  KEY `user_task_comment_user_date_i` (`user_id`,`comment_date`),
  KEY `user_task_comment_task_id_comment_date_idx` (`task_id`,`comment_date`),
  CONSTRAINT `fk_user_task_comment_revision` FOREIGN KEY (`user_id`, `task_id`, `comment_date`) REFERENCES `tt_revision` (`user_id`, `task_id`, `record_date`) ON DELETE NO ACTION,
  CONSTRAINT `fk_user_task_comment_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_task_comment_user` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_task_comment`
--

LOCK TABLES `user_task_comment` WRITE;
/*!40000 ALTER TABLE `user_task_comment` DISABLE KEYS */;
INSERT INTO `user_task_comment` VALUES (1,35,'2019-02-13','need to fix answering machine'),(1,35,'2019-02-27','J. Barber should call back on Friday.'),(1,36,'2018-12-27','communications with new supplier'),(1,36,'2019-02-11','New layout to Eunice Marshall, eunice.marshall@bostonchocolate.co.uk'),(1,37,'2019-02-05','Monthly meeting. Discussing current results and plan for the next month'),(1,37,'2019-02-06','meeting with designer department'),(1,37,'2019-02-11','Review last week. Plans for this week'),(1,37,'2019-02-18','review the plans for this week'),(1,43,'2019-02-27','problem with the installation. Had to call to support. Fixed now.'),(1,48,'2018-12-17','report on traffic'),(1,48,'2019-01-14','report'),(1,48,'2019-02-12','implement new analytics instrument'),(1,48,'2019-02-15','check adwords display'),(1,48,'2019-02-18','mid month statistics report'),(1,48,'2019-02-28','jump in site visits and unique visitors. Talk to marketing manager.'),(1,55,'2019-02-28','review of most popular tools, comparison.'),(1,55,'2019-03-04','Presentation of 5 best tools to managers. Pro & cons discussion'),(1,56,'2019-01-14','server preparation'),(1,56,'2019-01-23','results gathering'),(1,56,'2019-01-31','upgrade'),(1,56,'2019-02-04','evaluating different options'),(1,56,'2019-02-08','conducting tests on two options'),(1,56,'2019-02-09','importing data to Product XYZ'),(1,56,'2019-02-12','creating user groups +editing tasks&projects'),(1,56,'2019-02-18','contact Product XYZ support'),(1,56,'2019-02-22','introduce this option to the team'),(1,58,'2018-12-27','1 new server\r\n2 monitors'),(1,58,'2018-12-28','new supplier'),(1,58,'2019-01-01','new computers check'),(1,58,'2019-01-03','new computers installation'),(1,58,'2019-01-04','new computers installation'),(1,59,'2018-12-31','new backup system installation'),(1,60,'2019-01-18','SO upgrade'),(1,60,'2019-01-22','after outage fixing'),(2,18,'2019-01-07','bugs ## 19560-19567'),(2,18,'2019-01-08','bugs ## 19620, 19633, 19651-19658'),(2,21,'2018-12-20','changes saved to bug-tracking system. See # 15705.'),(2,21,'2018-12-26','additional changes. Bug # 15925.'),(2,22,'2018-12-13','Consulting with Maurice, giving some tips on catalog design.'),(2,27,'2019-03-05','Discussing details with colleagues'),(2,29,'2019-02-26','bugs ## 21054-21067'),(2,29,'2019-02-28','bugs ## 21101-21115'),(2,30,'2019-02-15','Comp. A, B, C deployed to Server D.'),(2,30,'2019-02-20','Comp. E, F, G deployed to Server H.'),(2,31,'2019-02-12','see the bug # 18471'),(2,32,'2019-02-05','discussion with Maurice, planning the next week.'),(2,33,'2019-01-16','analyzing the performance. Choosing between Apache and Tomcat.'),(2,33,'2019-01-22','Client decided to use Glassfish. Clustering.'),(2,34,'2019-01-07','choosing an on-site search engine.'),(2,34,'2019-01-08','choosing the charts processor and captcha solution.'),(2,34,'2019-01-09','working on the framework for integration with CMS.'),(2,34,'2019-01-15','review, analysis, final corrections.'),(2,35,'2018-12-12','Call with customer'),(2,35,'2019-02-27','Conference call with Carrie from Boston Chocolate'),(2,35,'2019-03-04','New client'),(2,37,'2018-12-12','monthly meeting, plans for the next month, analysis of this month.'),(2,37,'2019-01-14','monthly meeting, plans for the next month, analysis of this month.'),(2,37,'2019-02-04','Internet Media Agency. Correcting the schedule.'),(2,37,'2019-02-26','meeting with the managers, current results, plans.'),(2,37,'2019-02-28','Meeting with Gordman and new client'),(2,39,'2018-12-18','Discussing with colleagues'),(2,40,'2019-01-07','Discussing with designers'),(2,79,'2019-03-04','Intern training'),(4,17,'2019-02-04','Choosing the template to start with.'),(4,17,'2019-02-06','reviewing the site examples e-mailed by the customer.'),(4,17,'2019-02-14','Discussing the drafts with the client.'),(4,17,'2019-02-21','sent the new drafts to the client.'),(4,26,'2019-01-28','Writing a draft for the home page.'),(4,26,'2019-01-30','Writing texts for other pages.'),(4,26,'2019-01-31','checking the keywords in texts.'),(4,26,'2019-02-04','Writing texts for banners.'),(4,26,'2019-02-11','compiling and checking all the materials.'),(4,26,'2019-02-13','presentation to client.'),(4,26,'2019-02-19','writing texts for future ads'),(4,28,'2019-01-02','meeting with the clients'),(4,37,'2018-12-05','Meeting with client'),(4,37,'2018-12-12','general monthly meeting'),(4,37,'2018-12-26','general meeting'),(4,37,'2019-01-14','general monthly meeting'),(4,37,'2019-01-28','status on Internet Media Agency & Apple Cherry.'),(4,37,'2019-02-12','general monthly meeting'),(4,40,'2019-01-29','the layouts are now in the folder C:\\Designers\\Maurice Moss\\Works'),(4,40,'2019-02-06','Changing the color scheme after the discussion with the customer.'),(4,40,'2019-02-13','consulting with Roy, making changes to several interfaces.'),(4,65,'2018-12-05','preparations'),(5,25,'2018-12-05','Meeting with Ronald Jason'),(5,37,'2018-12-28','Plan for the next month'),(5,67,'2018-12-07','Plan of proposal'),(5,67,'2018-12-11','Document sent to client'),(5,67,'2018-12-13','Corrections'),(5,68,'2018-12-06','Calculations for Boston Chocolate'),(5,68,'2018-12-11','Budget approval'),(5,69,'2018-12-25','10 options have been chosen'),(5,70,'2018-12-24','Analysis of the existing web-site'),(6,37,'2019-02-13','Meeting with project manager'),(6,37,'2019-02-26','meeting with Gordman'),(6,63,'2019-02-05','Suggestions for changes'),(7,25,'2019-02-06','Meeting with new client'),(7,25,'2019-02-20','Budget approval with Steve'),(7,25,'2019-02-28','meeting with Carrie'),(7,35,'2019-02-07','call to bank'),(7,37,'2019-02-05','meeting with designer'),(7,37,'2019-02-13','Meeting with copywriter'),(7,37,'2019-02-21','meeting with designer'),(7,37,'2019-02-25','meeting with developers'),(7,67,'2019-02-07','Proposal for GMST'),(7,67,'2019-02-12','Final version for TmSys'),(7,67,'2019-02-25','New proposal for Media Agency'),(7,67,'2019-02-27','Corrections'),(7,69,'2019-02-28','5 sketches are selected\r\n3 require corrections'),(8,16,'2019-02-06','CSS corrections'),(8,16,'2019-03-01','Page with new content released'),(8,29,'2019-02-04','will be fixed within the next week'),(8,29,'2019-02-26','fixed and submitted, new version will be released on Sat'),(9,35,'2019-02-15','Discussion with insurance company representative'),(9,35,'2019-02-27','with bank representative'),(9,35,'2019-03-05','Discussing payment details with the bank'),(9,36,'2019-01-16','communications with suppliers'),(9,71,'2018-12-14','Sent for approval'),(9,71,'2018-12-17','corrections'),(9,71,'2018-12-18','approved'),(9,71,'2019-01-17','3 mistakes found'),(9,71,'2019-02-22','Updates'),(9,71,'2019-02-27','2 articles were removed'),(9,72,'2019-02-20','New bank account'),(9,72,'2019-02-28','Documents preparation for bank'),(9,73,'2019-01-03','lists sent for signature'),(9,73,'2019-01-04','payroll distribution'),(9,73,'2019-01-16','payments for vacations'),(9,73,'2019-02-05','General calculations'),(9,73,'2019-02-06','PTO calculation and correction'),(9,73,'2019-02-08','Payment distribution'),(9,74,'2018-12-20','New structure'),(9,74,'2019-01-31','Report is ready'),(9,74,'2019-02-13','New articles'),(9,74,'2019-03-01','Final corrections'),(9,75,'2019-01-29','report sent to Internal Revenue'),(10,77,'2019-02-27','5 more hours needed to finish'),(11,26,'2019-03-01','New article sent to client for review'),(11,27,'2019-02-18','List of topics for the blog'),(11,27,'2019-02-27','\'Features\' update'),(11,35,'2019-02-19','with Greg from Boston Chocolate'),(11,35,'2019-02-22','conference call with new client'),(11,35,'2019-02-27','conference call with Media Agency'),(11,37,'2019-02-28','meeting with Gordman');
/*!40000 ALTER TABLE `user_task_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_task_comment_backup`
--

DROP TABLE IF EXISTS `user_task_comment_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_task_comment_backup` (
  `user_id` int(3) unsigned DEFAULT NULL,
  `task_id` int(5) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `backup_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_task_comment_backup`
--

LOCK TABLES `user_task_comment_backup` WRITE;
/*!40000 ALTER TABLE `user_task_comment_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_task_comment_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team_assignment_groups`
--

DROP TABLE IF EXISTS `user_team_assignment_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team_assignment_groups` (
  `user_id` int(3) unsigned NOT NULL,
  `user_group_id` int(3) unsigned DEFAULT NULL,
  KEY `user_team_assignment_groups_user_id` (`user_id`),
  KEY `user_team_assignment_groups_user_group_id` (`user_group_id`),
  CONSTRAINT `user_team_assignment_groups_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_team_assignment_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team_assignment_groups`
--

LOCK TABLES `user_team_assignment_groups` WRITE;
/*!40000 ALTER TABLE `user_team_assignment_groups` DISABLE KEYS */;
INSERT INTO `user_team_assignment_groups` VALUES (7,3),(4,2);
/*!40000 ALTER TABLE `user_team_assignment_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team_assignment_users`
--

DROP TABLE IF EXISTS `user_team_assignment_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team_assignment_users` (
  `user_id` int(3) unsigned NOT NULL,
  `assigned_user_id` int(3) unsigned DEFAULT NULL,
  KEY `user_team_assignment_users_user_id` (`user_id`),
  KEY `user_team_assignment_users_assigned_user_id` (`assigned_user_id`),
  CONSTRAINT `user_team_assignment_users_assigned_user_id` FOREIGN KEY (`assigned_user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_team_assignment_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team_assignment_users`
--

LOCK TABLES `user_team_assignment_users` WRITE;
/*!40000 ALTER TABLE `user_team_assignment_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_team_assignment_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_notif_rule_send`
--

DROP TABLE IF EXISTS `user_user_notif_rule_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_notif_rule_send` (
  `user_notif_rule_send_id` int(5) unsigned NOT NULL,
  `user_id` int(3) unsigned NOT NULL,
  PRIMARY KEY (`user_notif_rule_send_id`,`user_id`),
  KEY `fk_user_user_notif_rule_send_user` (`user_id`),
  CONSTRAINT `fk_user_user_notif_rule_send_id` FOREIGN KEY (`user_notif_rule_send_id`) REFERENCES `user_notif_rule_send` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_user_notif_rule_send_user` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_notif_rule_send`
--

LOCK TABLES `user_user_notif_rule_send` WRITE;
/*!40000 ALTER TABLE `user_user_notif_rule_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_notif_rule_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_days`
--

DROP TABLE IF EXISTS `w_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_days` (
  `w_date` date NOT NULL,
  `is_working_day` tinyint(1) NOT NULL,
  PRIMARY KEY (`w_date`),
  CONSTRAINT `fk_w_days_revision` FOREIGN KEY (`w_date`) REFERENCES `w_days_revision` (`w_date`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Working or non-working days';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_days`
--

LOCK TABLES `w_days` WRITE;
/*!40000 ALTER TABLE `w_days` DISABLE KEYS */;
INSERT INTO `w_days` VALUES ('2019-01-25',0),('2019-02-01',0);
/*!40000 ALTER TABLE `w_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w_days_revision`
--

DROP TABLE IF EXISTS `w_days_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w_days_revision` (
  `w_date` date NOT NULL,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`w_date`),
  UNIQUE KEY `uk_w_days_revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_days_revision`
--

LOCK TABLES `w_days_revision` WRITE;
/*!40000 ALTER TABLE `w_days_revision` DISABLE KEYS */;
INSERT INTO `w_days_revision` VALUES ('2019-01-18',10),('2019-01-25',11),('2019-02-01',12);
/*!40000 ALTER TABLE `w_days_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_approval_current_status`
--

DROP TABLE IF EXISTS `week_approval_current_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_approval_current_status` (
  `user_id` int(3) unsigned NOT NULL,
  `week_date` date NOT NULL,
  `status` int(3) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status_timestamp` datetime NOT NULL,
  `approver_id` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`week_date`),
  KEY `fk_week_approval_current_status_approver_id` (`approver_id`),
  KEY `week_approval_current_status_week_date_idx` (`week_date`),
  CONSTRAINT `fk_week_approval_current_status_approver_id` FOREIGN KEY (`approver_id`) REFERENCES `at_user_revision` (`id`),
  CONSTRAINT `fk_week_approval_current_status_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_week_approval_status_revision` FOREIGN KEY (`user_id`, `week_date`) REFERENCES `week_approval_status_revision` (`user_id`, `week_date`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_approval_current_status`
--

LOCK TABLES `week_approval_current_status` WRITE;
/*!40000 ALTER TABLE `week_approval_current_status` DISABLE KEYS */;
INSERT INTO `week_approval_current_status` VALUES (1,'2018-12-04',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2018-12-11',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2018-12-18',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2018-12-25',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-01-01',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-01-08',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-01-15',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-01-22',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-01-29',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-02-05',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-02-12',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-02-19',2,NULL,'2019-03-06 00:00:00',NULL),(1,'2019-02-26',2,NULL,'2019-03-06 00:00:00',NULL),(2,'2018-12-04',2,NULL,'2018-12-08 00:00:00',9),(2,'2018-12-11',2,NULL,'2018-12-15 00:00:00',1),(2,'2018-12-18',2,NULL,'2018-12-22 00:00:00',1),(2,'2018-12-25',2,NULL,'2018-12-29 00:00:00',5),(2,'2019-01-01',2,NULL,'2019-01-05 00:00:00',9),(2,'2019-01-08',2,NULL,'2019-01-12 00:00:00',1),(2,'2019-01-15',2,NULL,'2019-01-19 00:00:00',1),(2,'2019-01-22',2,NULL,'2019-02-04 00:00:00',1),(2,'2019-01-29',2,NULL,'2019-02-04 00:00:00',1),(2,'2019-02-05',2,NULL,'2019-02-09 00:00:00',7),(2,'2019-02-12',2,NULL,'2019-02-24 00:00:00',7),(2,'2019-02-19',2,NULL,'2019-02-24 00:00:00',7),(2,'2019-02-26',1,NULL,'2019-03-03 00:00:00',7),(4,'2018-12-04',2,NULL,'2018-12-08 00:00:00',9),(4,'2018-12-11',2,NULL,'2018-12-15 00:00:00',1),(4,'2018-12-18',2,NULL,'2018-12-22 00:00:00',1),(4,'2018-12-25',2,NULL,'2019-01-19 00:00:00',1),(4,'2019-01-01',2,NULL,'2019-01-05 00:00:00',9),(4,'2019-01-08',2,NULL,'2019-01-12 00:00:00',1),(4,'2019-01-15',2,NULL,'2019-01-19 00:00:00',1),(4,'2019-01-22',2,NULL,'2019-02-04 00:00:00',1),(4,'2019-01-29',2,NULL,'2019-02-04 00:00:00',1),(4,'2019-02-05',2,NULL,'2019-02-09 00:00:00',1),(4,'2019-02-12',2,NULL,'2019-02-17 00:00:00',1),(4,'2019-02-19',2,NULL,'2019-02-24 00:00:00',1),(4,'2019-02-26',1,NULL,'2019-03-03 00:00:00',9),(6,'2019-02-05',2,'Time-Track was changed.','2019-02-09 00:00:00',1),(6,'2019-02-12',2,NULL,'2019-02-17 00:00:00',1),(6,'2019-02-19',2,'Time-Track was changed.','2019-03-06 00:00:00',1),(6,'2019-02-26',1,NULL,'2019-03-03 00:00:00',9),(8,'2019-02-05',2,NULL,'2019-02-09 00:00:00',7),(8,'2019-02-12',2,NULL,'2019-02-17 00:00:00',7),(8,'2019-02-19',2,NULL,'2019-02-24 00:00:00',7),(8,'2019-02-26',1,NULL,'2019-03-03 00:00:00',7),(10,'2019-02-05',2,NULL,'2019-02-09 00:00:00',7),(10,'2019-02-12',2,NULL,'2019-02-17 00:00:00',7),(10,'2019-02-19',2,NULL,'2019-02-24 00:00:00',7),(10,'2019-02-26',3,'No time-track for Friday.','2019-03-03 00:00:00',7),(11,'2019-02-19',2,NULL,'2019-02-24 00:00:00',1),(11,'2019-02-26',1,NULL,'2019-03-03 00:00:00',9);
/*!40000 ALTER TABLE `week_approval_current_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_approval_status_history`
--

DROP TABLE IF EXISTS `week_approval_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_approval_status_history` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `status_timestamp` datetime NOT NULL,
  `user_id` int(3) unsigned NOT NULL,
  `approver_id` int(3) unsigned DEFAULT NULL,
  `week_date` date NOT NULL,
  `status` int(3) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_week_approval_status_history_approver_id` (`approver_id`),
  KEY `week_approval_status_history_week_date_idx` (`week_date`),
  KEY `week_approval_status_history_user_id_week_date_idx` (`user_id`,`week_date`),
  CONSTRAINT `fk_week_approval_status_history_approver_id` FOREIGN KEY (`approver_id`) REFERENCES `at_user_revision` (`id`),
  CONSTRAINT `fk_week_approval_status_history_user_id` FOREIGN KEY (`user_id`) REFERENCES `at_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_approval_status_history`
--

LOCK TABLES `week_approval_status_history` WRITE;
/*!40000 ALTER TABLE `week_approval_status_history` DISABLE KEYS */;
INSERT INTO `week_approval_status_history` VALUES (120,'2018-12-08 00:00:00',4,4,'2018-12-04',1,NULL),(121,'2018-12-08 00:00:00',2,2,'2018-12-04',1,NULL),(122,'2018-12-08 00:00:00',2,9,'2018-12-04',2,NULL),(123,'2018-12-08 00:00:00',4,9,'2018-12-04',2,NULL),(124,'2018-12-15 00:00:00',4,4,'2018-12-11',1,NULL),(125,'2018-12-15 00:00:00',2,2,'2018-12-11',1,NULL),(126,'2018-12-15 00:00:00',2,1,'2018-12-11',2,NULL),(127,'2018-12-15 00:00:00',4,1,'2018-12-11',2,NULL),(128,'2018-12-22 00:00:00',2,2,'2018-12-18',1,NULL),(129,'2018-12-22 00:00:00',4,4,'2018-12-18',1,NULL),(130,'2018-12-22 00:00:00',2,1,'2018-12-18',2,NULL),(131,'2018-12-22 00:00:00',4,1,'2018-12-18',2,NULL),(132,'2018-12-29 00:00:00',2,2,'2018-12-25',1,NULL),(133,'2018-12-29 00:00:00',4,4,'2018-12-25',1,NULL),(134,'2018-12-29 00:00:00',2,5,'2018-12-25',2,NULL),(135,'2018-12-29 00:00:00',4,5,'2018-12-25',3,'Your undertime is more than 2 hours.'),(136,'2019-01-05 00:00:00',2,2,'2019-01-01',1,NULL),(137,'2019-01-05 00:00:00',4,4,'2019-01-01',1,NULL),(138,'2019-01-05 00:00:00',2,9,'2019-01-01',2,NULL),(139,'2019-01-05 00:00:00',4,9,'2019-01-01',2,NULL),(140,'2019-01-12 00:00:00',2,2,'2019-01-08',1,NULL),(141,'2019-01-12 00:00:00',4,4,'2019-01-08',1,NULL),(142,'2019-01-12 00:00:00',2,1,'2019-01-08',2,NULL),(143,'2019-01-12 00:00:00',4,1,'2019-01-08',2,NULL),(146,'2019-01-19 00:00:00',2,2,'2019-01-15',1,NULL),(147,'2019-01-19 00:00:00',4,4,'2019-01-15',1,NULL),(148,'2019-01-19 00:00:00',2,1,'2019-01-15',2,NULL),(149,'2019-01-19 00:00:00',4,1,'2019-01-15',2,NULL),(150,'2019-01-19 00:00:00',4,4,'2018-12-25',1,NULL),(151,'2019-01-19 00:00:00',4,1,'2018-12-25',2,NULL),(152,'2019-01-26 00:00:00',2,2,'2019-01-22',1,NULL),(153,'2019-02-04 00:00:00',4,4,'2019-01-29',1,NULL),(155,'2019-02-04 00:00:00',2,1,'2019-01-22',2,NULL),(156,'2019-02-04 00:00:00',2,1,'2019-01-29',2,NULL),(157,'2019-02-04 00:00:00',4,1,'2019-01-22',2,NULL),(158,'2019-02-04 00:00:00',4,1,'2019-01-29',2,NULL),(159,'2019-02-09 00:00:00',2,2,'2019-02-05',1,NULL),(160,'2019-02-09 00:00:00',4,4,'2019-02-05',1,NULL),(161,'2019-02-09 00:00:00',8,8,'2019-02-05',1,NULL),(162,'2019-02-09 00:00:00',6,6,'2019-02-05',1,NULL),(163,'2019-02-09 00:00:00',10,10,'2019-02-05',1,NULL),(164,'2019-02-09 00:00:00',2,7,'2019-02-05',2,NULL),(165,'2019-02-09 00:00:00',8,7,'2019-02-05',2,NULL),(166,'2019-02-09 00:00:00',10,7,'2019-02-05',2,NULL),(167,'2019-02-09 00:00:00',4,1,'2019-02-05',2,NULL),(168,'2019-02-09 00:00:00',6,1,'2019-02-05',2,NULL),(169,'2019-02-17 00:00:00',8,8,'2019-02-12',1,NULL),(170,'2019-02-17 00:00:00',2,2,'2019-02-12',1,NULL),(171,'2019-02-17 00:00:00',10,10,'2019-02-12',1,NULL),(172,'2019-02-17 00:00:00',8,7,'2019-02-12',2,NULL),(173,'2019-02-17 00:00:00',10,7,'2019-02-12',2,NULL),(174,'2019-02-17 00:00:00',2,7,'2019-02-12',3,'Your undertime is more than 3 hours.'),(175,'2019-02-17 00:00:00',6,6,'2019-02-12',1,NULL),(176,'2019-02-17 00:00:00',4,4,'2019-02-12',1,NULL),(177,'2019-02-17 00:00:00',4,1,'2019-02-12',2,NULL),(178,'2019-02-17 00:00:00',6,1,'2019-02-12',2,NULL),(179,'2019-02-24 00:00:00',6,6,'2019-02-19',1,NULL),(180,'2019-02-24 00:00:00',4,4,'2019-02-19',1,NULL),(181,'2019-02-24 00:00:00',10,10,'2019-02-19',1,NULL),(182,'2019-02-24 00:00:00',2,2,'2019-02-19',1,NULL),(183,'2019-02-24 00:00:00',8,8,'2019-02-19',1,NULL),(184,'2019-02-24 00:00:00',2,2,'2019-02-12',1,NULL),(185,'2019-02-24 00:00:00',2,7,'2019-02-12',2,NULL),(186,'2019-02-24 00:00:00',2,7,'2019-02-19',2,NULL),(187,'2019-02-24 00:00:00',8,7,'2019-02-19',2,NULL),(188,'2019-02-24 00:00:00',10,7,'2019-02-19',2,NULL),(189,'2019-02-24 00:00:00',11,11,'2019-02-19',1,NULL),(190,'2019-02-24 00:00:00',4,1,'2019-02-19',2,NULL),(191,'2019-02-24 00:00:00',6,1,'2019-02-19',2,NULL),(192,'2019-02-24 00:00:00',11,1,'2019-02-19',2,NULL),(193,'2019-03-03 00:00:00',2,2,'2019-02-26',1,NULL),(194,'2019-03-03 00:00:00',10,10,'2019-02-26',1,NULL),(195,'2019-03-03 00:00:00',8,8,'2019-02-26',1,NULL),(198,'2019-03-03 00:00:00',10,7,'2019-02-26',3,'No time-track for Friday.'),(200,'2019-03-03 00:00:00',6,6,'2019-02-26',1,NULL),(201,'2019-03-03 00:00:00',11,11,'2019-02-26',1,NULL),(205,'2019-03-06 00:00:00',1,NULL,'2018-12-04',2,NULL),(206,'2019-03-06 00:00:00',1,NULL,'2018-12-11',2,NULL),(207,'2019-03-06 00:00:00',1,NULL,'2018-12-18',2,NULL),(208,'2019-03-06 00:00:00',1,NULL,'2018-12-25',2,NULL),(209,'2019-03-06 00:00:00',1,NULL,'2019-01-01',2,NULL),(210,'2019-03-06 00:00:00',1,NULL,'2019-01-08',2,NULL),(211,'2019-03-06 00:00:00',1,NULL,'2019-01-15',2,NULL),(212,'2019-03-06 00:00:00',1,NULL,'2019-01-22',2,NULL),(213,'2019-03-06 00:00:00',1,NULL,'2019-01-29',2,NULL),(214,'2019-03-06 00:00:00',1,NULL,'2019-02-05',2,NULL),(215,'2019-03-06 00:00:00',1,NULL,'2019-02-12',2,NULL),(216,'2019-03-06 00:00:00',1,NULL,'2019-02-19',2,NULL),(217,'2019-03-06 00:00:00',1,NULL,'2019-02-26',2,NULL);
/*!40000 ALTER TABLE `week_approval_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_approval_status_revision`
--

DROP TABLE IF EXISTS `week_approval_status_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_approval_status_revision` (
  `user_id` int(3) unsigned NOT NULL,
  `week_date` date NOT NULL,
  `revision` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`week_date`),
  UNIQUE KEY `uk_week_approval_status_revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_approval_status_revision`
--

LOCK TABLES `week_approval_status_revision` WRITE;
/*!40000 ALTER TABLE `week_approval_status_revision` DISABLE KEYS */;
INSERT INTO `week_approval_status_revision` VALUES (1,'2018-12-04',1),(2,'2018-12-04',2),(4,'2018-12-04',3),(1,'2018-12-11',4),(2,'2018-12-11',5),(4,'2018-12-11',6),(1,'2018-12-18',7),(2,'2018-12-18',8),(4,'2018-12-18',9),(1,'2018-12-25',10),(2,'2018-12-25',11),(4,'2018-12-25',12),(1,'2019-01-01',13),(2,'2019-01-01',14),(4,'2019-01-01',15),(1,'2019-01-08',16),(2,'2019-01-08',17),(4,'2019-01-08',18),(1,'2019-01-15',19),(2,'2019-01-15',20),(4,'2019-01-15',21),(1,'2019-01-22',22),(2,'2019-01-22',23),(4,'2019-01-22',24),(1,'2019-01-29',25),(2,'2019-01-29',26),(4,'2019-01-29',27),(1,'2019-02-05',28),(2,'2019-02-05',29),(4,'2019-02-05',30),(6,'2019-02-05',31),(8,'2019-02-05',32),(10,'2019-02-05',33),(1,'2019-02-12',34),(2,'2019-02-12',35),(4,'2019-02-12',36),(6,'2019-02-12',37),(8,'2019-02-12',38),(10,'2019-02-12',39),(1,'2019-02-19',40),(2,'2019-02-19',41),(4,'2019-02-19',42),(6,'2019-02-19',43),(8,'2019-02-19',44),(10,'2019-02-19',45),(11,'2019-02-19',46),(1,'2019-02-26',47),(2,'2019-02-26',48),(4,'2019-02-26',49),(6,'2019-02-26',50),(8,'2019-02-26',51),(10,'2019-02-26',52),(11,'2019-02-26',53);
/*!40000 ALTER TABLE `week_approval_status_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_status`
--

DROP TABLE IF EXISTS `workflow_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_status` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `name_lower` varchar(80) NOT NULL DEFAULT '',
  `color_id` int(2) unsigned NOT NULL,
  `position` int(3) unsigned NOT NULL,
  `status_type` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflow_status_name` (`name_lower`),
  KEY `status_type` (`status_type`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_status`
--

LOCK TABLES `workflow_status` WRITE;
/*!40000 ALTER TABLE `workflow_status` DISABLE KEYS */;
INSERT INTO `workflow_status` VALUES (1,'In Progress','in progress',7,2,0),(2,'Released','released',2,2,1),(3,'Never Implemented','never implemented',9,3,1),(4,'Ready for Review','ready for review',6,3,0),(5,'Need Clarification','need clarification',5,4,0),(6,'Ready for Release','ready for release',4,5,0);
/*!40000 ALTER TABLE `workflow_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'online_at_auto_snapshot'
--
/*!50003 DROP FUNCTION IF EXISTS `next_revision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `next_revision`() RETURNS bigint(20) unsigned
    SQL SECURITY INVOKER
begin
 insert into revision_seq values();
 return last_insert_id();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-10 12:20:31
