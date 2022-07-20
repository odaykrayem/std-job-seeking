-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: scit_jobseeking
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_details` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `email`, `password`, `company_name`, `company_address`, `company_details`, `status`) VALUES (1,'ocom@gmail.com','$2y$10$D.sETIa9HtnUfhTDsPlmK.0v7wsn./tvuB.qlo4Y81feAHaoLr8tq','c0mpan','dess','ddd',1),(2,'red1234hat@gmail.com','$2y$10$62cJXk/G0RJv8.Yfu5K1..jlCFgKa6S9dnglzKIVtaOKFEUY88JUO','ccc','hhh','hjj',154456);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','voyager::seeders.data_rows.roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(23,4,'email','text','Email',0,1,1,1,1,1,'{}',2),(24,4,'password','password','Password',0,0,0,1,1,1,'{}',3),(25,4,'company_name','text','Company Name',0,1,1,1,1,1,'{}',4),(26,4,'company_address','text','Company Address',0,1,1,1,1,1,'{}',5),(27,4,'company_details','text','Company Details',0,1,1,1,1,1,'{}',6),(28,4,'status','text','Status',1,1,1,1,1,1,'{}',7),(29,5,'id','text','Id',1,0,0,0,0,0,'{}',1),(30,5,'name','text','Name',0,1,1,1,1,1,'{}',2),(31,5,'email','text','Email',0,1,1,1,1,1,'{}',3),(32,5,'password','password','Password',0,0,1,1,1,1,'{}',4),(33,5,'phone','text','Phone',0,1,1,1,1,1,'{}',5),(34,5,'education','text','Education',0,1,1,1,1,1,'{}',6),(35,5,'work_experience','text','Work Experience',0,1,1,1,1,1,'{}',7),(36,5,'language','text','Language',0,1,1,1,1,1,'{}',8),(37,5,'skill_id','text','Skill Id',0,1,1,1,1,1,'{}',9),(38,5,'summary','text','Summary',0,1,1,1,1,1,'{}',10),(39,5,'cv','text','Cv',0,1,1,1,1,1,'{}',11),(40,5,'status','text','Status',1,1,1,1,1,1,'{}',12),(41,5,'job_seeker_belongsto_skill_relationship','relationship','Skill',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Skill\",\"table\":\"skills\",\"type\":\"belongsTo\",\"column\":\"skill_id\",\"key\":\"id\",\"label\":\"skill\",\"pivot_table\":\"companies\",\"pivot\":\"0\",\"taggable\":\"0\"}',13),(42,6,'id','text','Id',1,0,0,0,0,0,'{}',1),(43,6,'job_id','text','Job Id',0,1,1,1,1,1,'{}',2),(44,6,'job_seeker_id','text','Job Seeker Id',0,1,1,1,1,1,'{}',3),(45,6,'status','text','Status',0,1,1,1,1,1,'{}',4),(46,6,'created_at','timestamp','Created At',0,1,1,0,0,1,'{}',5),(47,6,'job_request_belongsto_job_seeker_relationship','relationship','Seeker',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\JobSeeker\",\"table\":\"job_seekers\",\"type\":\"belongsTo\",\"column\":\"job_seeker_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"companies\",\"pivot\":\"0\",\"taggable\":\"0\"}',6),(48,6,'job_request_belongsto_job_vacancy_relationship','relationship','Job',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\JobVacancy\",\"table\":\"job_vacancies\",\"type\":\"belongsTo\",\"column\":\"job_id\",\"key\":\"id\",\"label\":\"job_position_title\",\"pivot_table\":\"companies\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(49,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(50,7,'skill','text','Skill',0,1,1,1,1,1,'{}',2),(51,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(52,8,'company_id','text','Company Id',0,1,1,1,1,1,'{}',2),(53,8,'job_position_title','text','Job Position Title',0,1,1,1,1,1,'{}',3),(54,8,'skill_id','text','Skill Id',0,1,1,1,1,1,'{}',4),(55,8,'required_experience','text','Required Experience',0,1,1,1,1,1,'{}',5),(56,8,'work_type','text','Work Type',0,1,1,1,1,1,'{}',6),(57,8,'work_time','text','Work Time',0,1,1,1,1,1,'{}',7),(58,8,'salary_range','text','Salary Range',0,1,1,1,1,1,'{}',8),(59,8,'job_vacancy_belongsto_skill_relationship','relationship','Skill',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Skill\",\"table\":\"skills\",\"type\":\"belongsTo\",\"column\":\"skill_id\",\"key\":\"id\",\"label\":\"skill\",\"pivot_table\":\"companies\",\"pivot\":\"0\",\"taggable\":\"0\"}',9);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(4,'companies','companies','Company','Companies','voyager-people','App\\Models\\Company',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-04-18 15:08:28','2022-04-18 15:13:38'),(5,'job_seekers','job-seekers','Job Seeker','Job Seekers','voyager-people','App\\Models\\JobSeeker',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-04-18 15:08:49','2022-04-18 15:09:14'),(6,'job_requests','job-requests','Job Request','Job Requests','voyager-categories','App\\Models\\JobRequest',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-04-18 15:09:35','2022-04-18 15:10:31'),(7,'skills','skills','Skill','Skills','voyager-categories','App\\Models\\Skill',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2022-04-18 15:10:45','2022-04-18 15:10:45'),(8,'job_vacancies','job-vacancies','Job Vacancy','Job Vacancies','voyager-categories','App\\Models\\JobVacancy',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-04-18 15:11:12','2022-04-18 15:13:49');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_requests`
--

DROP TABLE IF EXISTS `job_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `job_seeker_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_requests`
--

LOCK TABLES `job_requests` WRITE;
/*!40000 ALTER TABLE `job_requests` DISABLE KEYS */;
INSERT INTO `job_requests` (`id`, `job_id`, `job_seeker_id`, `status`, `created_at`) VALUES (1,1,1,1,'2022-04-25 17:45:35'),(2,1,6,1,'2022-04-25 18:03:57'),(3,3,1,1,'2022-04-25 18:39:37'),(4,3,2,1,'2022-04-25 19:33:26');
/*!40000 ALTER TABLE `job_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_seekers`
--

DROP TABLE IF EXISTS `job_seekers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_seekers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_experience` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `summary` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cv` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seekers`
--

LOCK TABLES `job_seekers` WRITE;
/*!40000 ALTER TABLE `job_seekers` DISABLE KEYS */;
INSERT INTO `job_seekers` (`id`, `name`, `email`, `password`, `phone`, `education`, `work_experience`, `language`, `skill_id`, `summary`, `cv`, `status`) VALUES (1,'o','o@gmail.com','$2y$10$1u8.kNVl/78iPcJoasAEQeoMIbqrwK8E1bv7eU1PrHydsLrNspNZa','09890987','ee','ww','en',1,'nn','upload/015dc054b7396122ca0676c3556bae7d.pdf',162075),(2,'newSeeker','email@gmail.com','$2y$10$buT6IlWszbfV46eUEfuQdeI25yAEy.nT.pj95fYJD/dPKW1/e2qye','02586547','computer science','android developer','english',1,'junior android developer with two years of experience','upload/2db43373135e18f48c86ff93e8669d85.pdf',521001);
/*!40000 ALTER TABLE `job_seekers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_vacancies`
--

DROP TABLE IF EXISTS `job_vacancies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_vacancies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `job_position_title` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `required_experience` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_type` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_time` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary_range` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_vacancies`
--

LOCK TABLES `job_vacancies` WRITE;
/*!40000 ALTER TABLE `job_vacancies` DISABLE KEYS */;
INSERT INTO `job_vacancies` (`id`, `company_id`, `job_position_title`, `skill_id`, `required_experience`, `work_type`, `work_time`, `salary_range`) VALUES (3,1,'jj',1,'ree','wee','wee','1223');
/*!40000 ALTER TABLE `job_vacancies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2022-04-18 15:04:14','2022-04-18 15:04:14','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,4,'2022-04-18 15:04:14','2022-04-18 15:11:51','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2022-04-18 15:04:14','2022-04-18 15:04:14','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2022-04-18 15:04:14','2022-04-18 15:04:14','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,5,'2022-04-18 15:04:14','2022-04-18 15:11:51',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2022-04-18 15:04:14','2022-04-18 15:11:51','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2022-04-18 15:04:14','2022-04-18 15:11:51','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2022-04-18 15:04:14','2022-04-18 15:11:51','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2022-04-18 15:04:14','2022-04-18 15:11:51','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,6,'2022-04-18 15:04:14','2022-04-18 15:11:51','voyager.settings.index',NULL),(11,1,'Companies','','_self','voyager-people','#000000',NULL,7,'2022-04-18 15:08:28','2022-04-18 15:13:19','voyager.companies.index','null'),(12,1,'Job Seekers','','_self','voyager-people',NULL,NULL,8,'2022-04-18 15:08:49','2022-04-18 15:11:51','voyager.job-seekers.index',NULL),(13,1,'Job Requests','','_self','voyager-categories',NULL,NULL,9,'2022-04-18 15:09:35','2022-04-18 15:11:51','voyager.job-requests.index',NULL),(14,1,'Skills','','_self','voyager-categories',NULL,NULL,10,'2022-04-18 15:10:45','2022-04-18 15:11:51','voyager.skills.index',NULL),(15,1,'Job Vacancies','','_self','voyager-categories','#000000',NULL,11,'2022-04-18 15:11:12','2022-04-18 15:13:30','voyager.job-vacancies.index','null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES (1,'admin','2022-04-18 15:04:14','2022-04-18 15:04:14');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES (1,1),(1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(26,2),(27,1),(27,2),(28,1),(28,2),(29,1),(29,2),(30,1),(30,2),(31,1),(31,2),(32,1),(32,2),(33,1),(33,2),(34,1),(34,2),(35,1),(35,2),(36,1),(36,2),(37,1),(37,2),(38,1),(38,2),(39,1),(39,2),(40,1),(40,2),(41,1),(41,2),(42,1),(42,2),(43,1),(43,2),(44,1),(44,2),(45,1),(45,2),(46,1),(46,2),(47,1),(47,2),(48,1),(48,2),(49,1),(49,2),(50,1),(50,2);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES (1,'browse_admin',NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(2,'browse_bread',NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(3,'browse_database',NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(4,'browse_media',NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(5,'browse_compass',NULL,'2022-04-18 15:04:14','2022-04-18 15:04:14'),(6,'browse_menus','menus','2022-04-18 15:04:14','2022-04-18 15:04:14'),(7,'read_menus','menus','2022-04-18 15:04:14','2022-04-18 15:04:14'),(8,'edit_menus','menus','2022-04-18 15:04:14','2022-04-18 15:04:14'),(9,'add_menus','menus','2022-04-18 15:04:14','2022-04-18 15:04:14'),(10,'delete_menus','menus','2022-04-18 15:04:14','2022-04-18 15:04:14'),(11,'browse_roles','roles','2022-04-18 15:04:14','2022-04-18 15:04:14'),(12,'read_roles','roles','2022-04-18 15:04:14','2022-04-18 15:04:14'),(13,'edit_roles','roles','2022-04-18 15:04:14','2022-04-18 15:04:14'),(14,'add_roles','roles','2022-04-18 15:04:14','2022-04-18 15:04:14'),(15,'delete_roles','roles','2022-04-18 15:04:14','2022-04-18 15:04:14'),(16,'browse_users','users','2022-04-18 15:04:14','2022-04-18 15:04:14'),(17,'read_users','users','2022-04-18 15:04:14','2022-04-18 15:04:14'),(18,'edit_users','users','2022-04-18 15:04:14','2022-04-18 15:04:14'),(19,'add_users','users','2022-04-18 15:04:14','2022-04-18 15:04:14'),(20,'delete_users','users','2022-04-18 15:04:14','2022-04-18 15:04:14'),(21,'browse_settings','settings','2022-04-18 15:04:14','2022-04-18 15:04:14'),(22,'read_settings','settings','2022-04-18 15:04:14','2022-04-18 15:04:14'),(23,'edit_settings','settings','2022-04-18 15:04:14','2022-04-18 15:04:14'),(24,'add_settings','settings','2022-04-18 15:04:14','2022-04-18 15:04:14'),(25,'delete_settings','settings','2022-04-18 15:04:14','2022-04-18 15:04:14'),(26,'browse_companies','companies','2022-04-18 15:08:28','2022-04-18 15:08:28'),(27,'read_companies','companies','2022-04-18 15:08:28','2022-04-18 15:08:28'),(28,'edit_companies','companies','2022-04-18 15:08:28','2022-04-18 15:08:28'),(29,'add_companies','companies','2022-04-18 15:08:28','2022-04-18 15:08:28'),(30,'delete_companies','companies','2022-04-18 15:08:28','2022-04-18 15:08:28'),(31,'browse_job_seekers','job_seekers','2022-04-18 15:08:49','2022-04-18 15:08:49'),(32,'read_job_seekers','job_seekers','2022-04-18 15:08:49','2022-04-18 15:08:49'),(33,'edit_job_seekers','job_seekers','2022-04-18 15:08:49','2022-04-18 15:08:49'),(34,'add_job_seekers','job_seekers','2022-04-18 15:08:49','2022-04-18 15:08:49'),(35,'delete_job_seekers','job_seekers','2022-04-18 15:08:49','2022-04-18 15:08:49'),(36,'browse_job_requests','job_requests','2022-04-18 15:09:35','2022-04-18 15:09:35'),(37,'read_job_requests','job_requests','2022-04-18 15:09:35','2022-04-18 15:09:35'),(38,'edit_job_requests','job_requests','2022-04-18 15:09:35','2022-04-18 15:09:35'),(39,'add_job_requests','job_requests','2022-04-18 15:09:35','2022-04-18 15:09:35'),(40,'delete_job_requests','job_requests','2022-04-18 15:09:35','2022-04-18 15:09:35'),(41,'browse_skills','skills','2022-04-18 15:10:45','2022-04-18 15:10:45'),(42,'read_skills','skills','2022-04-18 15:10:45','2022-04-18 15:10:45'),(43,'edit_skills','skills','2022-04-18 15:10:45','2022-04-18 15:10:45'),(44,'add_skills','skills','2022-04-18 15:10:45','2022-04-18 15:10:45'),(45,'delete_skills','skills','2022-04-18 15:10:45','2022-04-18 15:10:45'),(46,'browse_job_vacancies','job_vacancies','2022-04-18 15:11:12','2022-04-18 15:11:12'),(47,'read_job_vacancies','job_vacancies','2022-04-18 15:11:12','2022-04-18 15:11:12'),(48,'edit_job_vacancies','job_vacancies','2022-04-18 15:11:12','2022-04-18 15:11:12'),(49,'add_job_vacancies','job_vacancies','2022-04-18 15:11:12','2022-04-18 15:11:12'),(50,'delete_job_vacancies','job_vacancies','2022-04-18 15:11:12','2022-04-18 15:11:12');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES (1,'admin','Administrator','2022-04-18 15:04:14','2022-04-18 15:04:14'),(2,'manager','Manager','2022-04-18 15:04:14','2022-04-18 15:15:39');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES (1,'site.title','Site Title','Job Seeker','','text',1,'Site'),(2,'site.description','Site Description','Job Seeker','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings\\April2022\\gx5hRIv24Zbq4CPHImeE.jpg','','image',5,'Admin'),(6,'admin.title','Admin Title','Job Seeker','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Job Seekers','','text',2,'Admin'),(8,'admin.loader','Admin Loader','settings\\April2022\\5OIyp7H2yybJ9lTpD2Sg.jpg','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings\\April2022\\siFIPnLzedbtTGobSyV1.jpg','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` (`id`, `skill`) VALUES (1,'skill 1'),(2,'skill 2'),(3,'skill 3');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES (1,1,'admin','admin@demo.com','users/default.png',NULL,'$2y$10$SFiiryQ5CGCzNG0eUwr5GeRa.CoxpBTJy0ArBbW1Cq/yjp39bhvXy',NULL,NULL,NULL,NULL),(2,2,'manager','man@demo.com','users/default.png',NULL,'$2y$10$7XakbOKYqw/WAenhjQKU/.dvncb8cOZaQwkRMMfDczsCs9mLVFQnK',NULL,'{\"locale\":\"en\"}','2022-04-18 15:15:53','2022-04-18 15:15:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'scit_jobseeking'
--

--
-- Dumping routines for database 'scit_jobseeking'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 16:46:36
