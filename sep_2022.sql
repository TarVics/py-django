-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sep_2022
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add blacklisted token',4,'add_blacklistedtoken'),(14,'Can change blacklisted token',4,'change_blacklistedtoken'),(15,'Can delete blacklisted token',4,'delete_blacklistedtoken'),(16,'Can view blacklisted token',4,'view_blacklistedtoken'),(17,'Can add outstanding token',5,'add_outstandingtoken'),(18,'Can change outstanding token',5,'change_outstandingtoken'),(19,'Can delete outstanding token',5,'delete_outstandingtoken'),(20,'Can view outstanding token',5,'view_outstandingtoken'),(21,'Can add user model',6,'add_usermodel'),(22,'Can change user model',6,'change_usermodel'),(23,'Can delete user model',6,'delete_usermodel'),(24,'Can view user model',6,'view_usermodel'),(25,'Can add profile model',7,'add_profilemodel'),(26,'Can change profile model',7,'change_profilemodel'),(27,'Can delete profile model',7,'delete_profilemodel'),(28,'Can view profile model',7,'view_profilemodel'),(29,'Can add car model',8,'add_carmodel'),(30,'Can change car model',8,'change_carmodel'),(31,'Can delete car model',8,'delete_carmodel'),(32,'Can view car model',8,'view_carmodel'),(33,'Can add car photo model',9,'add_carphotomodel'),(34,'Can change car photo model',9,'change_carphotomodel'),(35,'Can delete car photo model',9,'delete_carphotomodel'),(36,'Can view car photo model',9,'view_carphotomodel'),(37,'Can add auto park model',10,'add_autoparkmodel'),(38,'Can change auto park model',10,'change_autoparkmodel'),(39,'Can delete auto park model',10,'delete_autoparkmodel'),(40,'Can view auto park model',10,'view_autoparkmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin@gmail.com','pbkdf2_sha256$600000$YvG7wWmQBMJKP0N1TlAqrw$m8/q1bl/XTuudvzCv9FWV0mDD+WzTVG8d8sDhKlmPRs=',1,1,1,'2023-04-03 21:11:20.831962','2023-04-03 20:20:21.590433','2023-04-03 20:20:21.590433'),(2,'tarvic@ukr.net','pbkdf2_sha256$600000$1FiMQUsMCrmekQ4hdM2kUx$PmB5/0Yeb3guc6YwDzx/ZvAfbA9i5gI/vjyglw2qVas=',1,0,0,'2023-04-06 17:05:24.201864','2023-04-03 21:58:29.735883','2023-04-04 18:51:31.376306');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodel_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_usermodel_id_group_id_7ca6416c_uniq` (`usermodel_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_usermodel_id_eaf3a875_fk_auth_user_id` FOREIGN KEY (`usermodel_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodel_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissio_usermodel_id_permission__7325a6f6_uniq` (`usermodel_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_usermodel_id_c47d54cf_fk_auth_user_id` FOREIGN KEY (`usermodel_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_parks`
--

DROP TABLE IF EXISTS `auto_parks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_parks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auto_parks_user_id_eb59c9c4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `auto_parks_user_id_eb59c9c4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_parks`
--

LOCK TABLES `auto_parks` WRITE;
/*!40000 ALTER TABLE `auto_parks` DISABLE KEYS */;
INSERT INTO `auto_parks` VALUES (1,'Uber',2);
/*!40000 ALTER TABLE `auto_parks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_photos`
--

DROP TABLE IF EXISTS `car_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_photos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `car_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_photos_car_id_efc61f94_fk_cars_id` (`car_id`),
  CONSTRAINT `car_photos_car_id_efc61f94_fk_cars_id` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_photos`
--

LOCK TABLES `car_photos` WRITE;
/*!40000 ALTER TABLE `car_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL,
  `year` int NOT NULL,
  `price` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `auto_park_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cars_auto_park_id_d604a83d_fk_auto_parks_id` (`auto_park_id`),
  CONSTRAINT `cars_auto_park_id_d604a83d_fk_auto_parks_id` FOREIGN KEY (`auto_park_id`) REFERENCES `auto_parks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Volvo',2021,12345,'2023-04-05 22:59:25.000000','2023-04-05 22:59:31.000000',1),(2,'Volvo',2021,12345,'2023-04-05 22:59:38.000000','2023-04-05 22:59:33.000000',1),(3,'Brabus',2021,12345,'2023-04-05 22:59:37.000000','2023-04-05 22:59:34.000000',1),(4,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(5,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(6,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(7,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(8,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(9,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(10,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(11,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(12,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(13,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(14,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(15,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(16,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(17,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(18,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(19,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(20,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(21,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(22,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(23,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(24,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(25,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(26,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(27,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(28,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(29,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(30,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(31,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(32,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(33,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(34,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(35,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(36,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(37,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(38,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(39,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(40,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(41,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(42,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(43,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(44,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(45,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(46,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(47,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(48,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(49,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(50,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(51,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(52,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(53,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(54,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(55,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(56,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(57,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(58,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(59,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(60,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(61,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1),(62,'Volvo',2021,12345,'2023-04-05 22:59:36.000000','2023-04-05 22:59:35.000000',1);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'auth','group'),(1,'auth','permission'),(10,'auto_parks','autoparkmodel'),(8,'cars','carmodel'),(9,'cars','carphotomodel'),(3,'contenttypes','contenttype'),(4,'token_blacklist','blacklistedtoken'),(5,'token_blacklist','outstandingtoken'),(7,'users','profilemodel'),(6,'users','usermodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-03 20:18:59.138241'),(2,'contenttypes','0002_remove_content_type_name','2023-04-03 20:18:59.255589'),(3,'auth','0001_initial','2023-04-03 20:18:59.932205'),(4,'auth','0002_alter_permission_name_max_length','2023-04-03 20:19:00.059292'),(5,'auth','0003_alter_user_email_max_length','2023-04-03 20:19:00.076288'),(6,'auth','0004_alter_user_username_opts','2023-04-03 20:19:00.092290'),(7,'auth','0005_alter_user_last_login_null','2023-04-03 20:19:00.118316'),(8,'auth','0006_require_contenttypes_0002','2023-04-03 20:19:00.126289'),(9,'auth','0007_alter_validators_add_error_messages','2023-04-03 20:19:00.140290'),(10,'auth','0008_alter_user_username_max_length','2023-04-03 20:19:00.156292'),(11,'auth','0009_alter_user_last_name_max_length','2023-04-03 20:19:00.171285'),(12,'auth','0010_alter_group_name_max_length','2023-04-03 20:19:00.209286'),(13,'auth','0011_update_proxy_permissions','2023-04-03 20:19:00.229317'),(14,'auth','0012_alter_user_first_name_max_length','2023-04-03 20:19:00.248288'),(15,'users','0001_initial','2023-04-03 20:19:00.845290'),(16,'auto_parks','0001_initial','2023-04-03 20:19:00.993295'),(17,'cars','0001_initial','2023-04-03 20:19:01.154291'),(18,'cars','0002_carmodel_photo_alter_carmodel_brand_and_more','2023-04-03 20:19:01.229289'),(19,'cars','0003_alter_carmodel_photo','2023-04-03 20:19:01.245286'),(20,'cars','0004_remove_carmodel_photo_carphotomodel','2023-04-03 20:19:01.429291'),(21,'token_blacklist','0001_initial','2023-04-03 20:19:01.776601'),(22,'token_blacklist','0002_outstandingtoken_jti_hex','2023-04-03 20:19:01.820703'),(23,'token_blacklist','0003_auto_20171017_2007','2023-04-03 20:19:01.850677'),(24,'token_blacklist','0004_auto_20171017_2013','2023-04-03 20:19:01.998963'),(25,'token_blacklist','0005_remove_outstandingtoken_jti','2023-04-03 20:19:02.124063'),(26,'token_blacklist','0006_auto_20171017_2113','2023-04-03 20:19:02.173037'),(27,'token_blacklist','0007_auto_20171017_2214','2023-04-03 20:19:02.557035'),(28,'token_blacklist','0008_migrate_to_bigautofield','2023-04-03 20:19:02.984339'),(29,'token_blacklist','0010_fix_migrate_to_bigautofield','2023-04-03 20:19:03.018340'),(30,'token_blacklist','0011_linearizes_history','2023-04-03 20:19:03.026339'),(31,'token_blacklist','0012_alter_outstandingtoken_user','2023-04-03 20:19:03.062343'),(32,'users','0002_profilemodel','2023-04-03 20:19:03.246339'),(33,'users','0003_alter_profilemodel_age_alter_profilemodel_name_and_more','2023-04-03 20:19:03.381314'),(34,'users','0004_profilemodel_photo','2023-04-03 20:19:03.450310'),(35,'users','0005_alter_profilemodel_photo','2023-04-03 20:19:03.472512');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `user_id` bigint NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profile_user_id_2aeb6f6b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Victor','Taran',18,2,'');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_blacklistedtoken` VALUES (1,'2023-04-03 22:09:53.272382',3),(2,'2023-04-04 14:16:47.002439',5),(3,'2023-04-04 14:19:24.946519',6),(4,'2023-04-04 14:22:41.784421',8),(9,'2023-04-04 18:51:30.324773',10),(10,'2023-04-05 20:21:06.237224',12);
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_auth_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDU1NTM5MywiaWF0IjoxNjgwNTU0MTkzLCJqdGkiOiI5MDAyOTIxYzhkYWI0NWJjYWZmMWU0ZDY1YzUzNGRiNSIsInVzZXJfaWQiOjF9.QkF_jAx1zmpzEvPDUk6gGOpYYLO6NCYIBsAxoZ4MTug','2023-04-03 20:36:33.713267','2023-04-03 20:56:33.000000',1,'9002921c8dab45bcaff1e4d65c534db5'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDU1NzQ4MCwiaWF0IjoxNjgwNTU2MjgwLCJqdGkiOiIxMzg1NzgyOGRjYjU0YjNkYjUxNzViMmY1MTJmNWQ0YiIsInVzZXJfaWQiOjF9.OY7FJ6RvjK7qX8PCHxfzGDrwPooBTdolgKZc5hyTmKI','2023-04-03 21:11:20.788966','2023-04-03 21:31:20.000000',1,'13857828dcb54b3db5175b2f512f5d4b'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWN0aXZhdGUiLCJleHAiOjE2ODA2NDU1MDksImlhdCI6MTY4MDU1OTEwOSwianRpIjoiNTYyMDJjNDhiYmQwNGM4NTk5NmIzMWQ5OWNmZDA3NWQiLCJ1c2VyX2lkIjoyfQ.9g5Bw7bJ-iBY2mXI1phFBk5IzFbkrqEk64YAy4KCAyk','2023-04-03 21:58:29.764858','2023-04-04 21:58:29.000000',2,'56202c48bbd04c85996b31d99cfd075d'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDU2MTAxOCwiaWF0IjoxNjgwNTU5ODE4LCJqdGkiOiIxOWQwMjAwNjYwMWU0MWRlOTJjMTg3NDRmYzFlZTYxZCIsInVzZXJfaWQiOjJ9.hh9LwF23OxvRjtQtrjEm_dORFtrQlYAWEWETzrn9C5w','2023-04-03 22:10:18.308128','2023-04-03 22:30:18.000000',2,'19d02006601e41de92c18744fc1ee61d'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiZm9yZ2V0IiwiZXhwIjoxNjgwNjIxMzU0LCJpYXQiOjE2ODA2MTc3NTQsImp0aSI6ImMzMTk4NWFkNDEzODRlZjc4YzkzNmQ5ZmZkNmYxNzczIiwidXNlcl9pZCI6Mn0.3O1ia-ibgUFzbD4W32Hv3mq57sNAhms4xD7MfqN0bEA','2023-04-04 14:15:54.350548','2023-04-04 15:15:54.000000',2,'c31985ad41384ef78c936d9ffd6f1773'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiZm9yZ2V0IiwiZXhwIjoxNjgwNjIxNTA4LCJpYXQiOjE2ODA2MTc5MDgsImp0aSI6Ijc1NTBlMmQyMDBhZjQwMTViN2FmNDI0NGQ0NTU3ZmFlIiwidXNlcl9pZCI6Mn0.qF3jEKSeAWjJAWnvVcpy3TZ04TmEV3R7Yuf0lp2H4vU','2023-04-04 14:18:28.867778','2023-04-04 15:18:28.000000',2,'7550e2d200af4015b7af4244d4557fae'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDYxOTE5OSwiaWF0IjoxNjgwNjE3OTk5LCJqdGkiOiI5YjQwZDhjYTNlZGM0Yzc0OGU3Y2I2Yjg1YmE4MWZhNSIsInVzZXJfaWQiOjJ9.VkmCAuLeBtqBvYa6xEddIHACMIqS3R_0YEHiWpsqLXY','2023-04-04 14:19:59.910143','2023-04-04 14:39:59.000000',2,'9b40d8ca3edc4c748e7cb6b85ba81fa5'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiZm9yZ2V0IiwiZXhwIjoxNjgwNjIxNzAwLCJpYXQiOjE2ODA2MTgxMDAsImp0aSI6IjU3ODliNTIzNTZlNzRiM2M4OWEwNDhmZTJhZDJmNzRkIiwidXNlcl9pZCI6Mn0.xmiPdqhr9GrTsSvRoQuzyJchWTYe5LT-qO-qNUvFCPk','2023-04-04 14:21:40.743104','2023-04-04 15:21:40.000000',2,'5789b52356e74b3c89a048fe2ad2f74d'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDYxOTM5NCwiaWF0IjoxNjgwNjE4MTk0LCJqdGkiOiI5Yjc3ZDg5MTNjNmY0NzEwOTAyZmNjODhmMWJiYzMwZCIsInVzZXJfaWQiOjJ9.jkCGTiVjlPNEueOObanYWWfhCrZ8FgUeXW7z-xr5sJo','2023-04-04 14:23:14.928243','2023-04-04 14:43:14.000000',2,'9b77d8913c6f4710902fcc88f1bbc30d'),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVjb3ZlcnlfcGFzc3dvcmQiLCJleHAiOjE2ODA2MzQ0MDAsImlhdCI6MTY4MDYzMzgwMCwianRpIjoiMWRkMjM5NzkxM2YwNGFlOWI5Yzc2YzBhMWM0ZmU1NTEiLCJ1c2VyX2lkIjoyfQ.bmAXPyk3FflWmToIUERRWW7EAXGhPQ04GvKDvrdT-Gk','2023-04-04 18:43:20.782606','2023-04-04 18:53:20.000000',2,'1dd2397913f04ae9b9c76c0a1c4fe551'),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDYzNTUxOCwiaWF0IjoxNjgwNjM0MzE4LCJqdGkiOiJjZWY3YzZmZTA4ODI0MjVmYmQ5YzMxMjUxZjFhNTc3NSIsInVzZXJfaWQiOjJ9.hU4E7iSKozCHe2Ki7xL32jr7MTDAKEBW-Enwz2Ygj4Y','2023-04-04 18:51:58.600184','2023-04-04 19:11:58.000000',2,'cef7c6fe0882425fbd9c31251f1a5775'),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDcyNjE2MiwiaWF0IjoxNjgwNzI0OTYyLCJqdGkiOiI2ZjBhNmVmN2JlZDc0YTcxYjZlMzA0OWUzNzc1OWZlMCIsInVzZXJfaWQiOjJ9.NIgHwyduQm0REugcjX1DkieQbWrYVmdh5I0p4gJCJ4Y','2023-04-05 20:02:42.009469','2023-04-05 20:22:42.000000',2,'6f0a6ef7bed74a71b6e3049e37759fe0'),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDcyNzg4MiwiaWF0IjoxNjgwNzI2NjgyLCJqdGkiOiI0OTBjMmFlMTZmNDI0YTNlOGEzYzA2MWExMDk1Y2M3YiIsInVzZXJfaWQiOjJ9.q7v2xqcI6APEb3AIg4kkBSk6yVAk_fgriPjAy2C1xtY','2023-04-05 20:31:22.348765','2023-04-05 20:51:22.000000',2,'490c2ae16f424a3e8a3c061a1095cc7b'),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDcyOTA2MywiaWF0IjoxNjgwNzI3ODYzLCJqdGkiOiI1MGUwYTEzMjM3MjQ0ZTNhOTI0MDE0MGIxOTU1Nzk1MCIsInVzZXJfaWQiOjJ9.tdedk9jFpTUY9hBoxNdFfxScXLirqdEvh_rDo2TjpMY','2023-04-05 20:51:03.016998','2023-04-05 21:11:03.000000',2,'50e0a13237244e3a9240140b19557950'),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDc3NzY1MiwiaWF0IjoxNjgwNzc2NDUyLCJqdGkiOiJiZDNmNzM5MmNkOTU0ODk3OGU1OWZiYjJmYmYxNDJjYSIsInVzZXJfaWQiOjJ9.BwSmFVOyPykoGf2Q7MonYNfwvC1Q0y5HxaDRL10YMe4','2023-04-06 10:20:52.545038','2023-04-06 10:40:52.000000',2,'bd3f7392cd9548978e59fbb2fbf142ca'),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MDgwMTkyNCwiaWF0IjoxNjgwODAwNzI0LCJqdGkiOiI0OGM5YTdhOGIyMTI0YjE3OTQ0YmQwNWJmOTVhNWJmMiIsInVzZXJfaWQiOjJ9.6eSVMz2cm33QExxkJ_bnNi15NcWRXI0VSaP8gSc-kXQ','2023-04-06 17:05:24.187866','2023-04-06 17:25:24.000000',2,'48c9a7a8b2124b17944bd05bf95a5bf2');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11  0:04:48
