-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: smokol
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` bigint unsigned NOT NULL,
  `sistem_operasi_id` bigint unsigned NOT NULL DEFAULT '5',
  `users_id` bigint unsigned NOT NULL,
  `ruangan_id` bigint unsigned NOT NULL,
  `record_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kondisi` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Baik',
  `bast_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `bast_upload_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barang_barang_id_foreign` (`barang_id`),
  KEY `barang_sistem_operasi_id_foreign` (`sistem_operasi_id`),
  KEY `barang_pengguna_id_foreign` (`users_id`),
  KEY `barang_ruangan_id_foreign` (`ruangan_id`),
  CONSTRAINT `barang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `master_barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_pengguna_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_ruangan_id_foreign` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barang_sistem_operasi_id_foreign` FOREIGN KEY (`sistem_operasi_id`) REFERENCES `master_sistem_operasi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=752 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES (597,1,5,1,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(598,2,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(599,3,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(600,4,5,300,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(601,5,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(602,6,5,5,34,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(603,7,5,1,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(604,8,5,300,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(605,9,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(606,10,5,299,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(607,11,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(608,12,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(609,13,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(610,14,5,5,19,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(611,15,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(612,16,5,5,26,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(613,17,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(614,18,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(615,19,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(616,20,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(617,21,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(618,22,5,5,19,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(619,23,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(620,24,5,5,2,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(621,25,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(622,26,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(623,27,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(624,28,5,5,19,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(625,29,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(626,30,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(627,31,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(628,32,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(629,33,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(630,34,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(631,35,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(632,36,5,5,26,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(633,37,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(634,38,5,5,19,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(635,39,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(636,40,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(637,41,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(638,42,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(639,43,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(640,44,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(641,45,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(642,46,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(643,47,5,5,26,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(644,48,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(645,49,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(646,50,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(647,51,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(648,52,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(649,53,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(650,54,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(651,55,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(652,56,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(653,57,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(654,58,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(655,59,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(656,60,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(657,61,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(658,62,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(659,63,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(660,64,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(661,65,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(662,66,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(663,67,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(664,68,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(665,69,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(666,70,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(667,71,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(668,72,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(669,73,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(670,74,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(671,75,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(672,76,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(673,77,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(674,78,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(675,79,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(676,80,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(677,81,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(678,82,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(679,83,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(680,84,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(681,85,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(682,86,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(683,87,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(684,88,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(685,89,5,5,2,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(686,90,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(687,91,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(688,92,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(689,93,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(690,94,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(691,95,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(692,96,5,5,4,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(693,97,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(694,98,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(695,99,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(696,100,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(697,101,5,5,10,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(698,102,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(699,103,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(700,104,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(701,105,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(702,106,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(703,107,5,5,12,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(704,108,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(705,109,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(706,110,5,5,19,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(707,111,5,5,19,'2024-02-04 23:37:19','Rusak Ringan',NULL,NULL,NULL),(708,112,5,5,19,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(709,113,5,5,26,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(710,114,5,5,26,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(711,115,5,5,26,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(712,116,5,5,26,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(713,117,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(714,118,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(715,119,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(716,120,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(717,121,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(718,122,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(719,123,5,5,30,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(720,124,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(721,125,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(722,126,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(723,127,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(724,128,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(725,129,5,5,28,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(726,130,5,5,35,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(727,131,5,5,34,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(728,132,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(729,133,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(730,134,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(731,135,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(732,136,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(733,137,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(734,138,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(735,139,5,5,40,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(736,140,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(737,141,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(738,142,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(739,143,5,5,37,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(740,144,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(741,145,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(742,146,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(743,147,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(744,148,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(745,149,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(746,150,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(747,151,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(748,152,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(749,153,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(750,154,5,5,17,'2024-02-04 23:37:19','Baik',NULL,NULL,NULL),(751,707,8,299,7,'2024-05-16 11:08:00','Baik',NULL,NULL,NULL);
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_sequences`
--

DROP TABLE IF EXISTS `maintenance_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_sequences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` int NOT NULL,
  `users_id` int NOT NULL,
  `keluhan` text COLLATE utf8mb4_unicode_ci,
  `kondisi_final` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan_admin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bukti_rusak_berat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biaya` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `problem_img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `problems` varchar(511) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_step` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spek_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimasi_penyelesaian` date DEFAULT NULL,
  `perusahaan_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_sequences`
--

LOCK TABLES `maintenance_sequences` WRITE;
/*!40000 ALTER TABLE `maintenance_sequences` DISABLE KEYS */;
INSERT INTO `maintenance_sequences` VALUES (50,1,1,'asdasdasdasdasdsa',NULL,NULL,NULL,NULL,'2024-05-15 16:33:04','2024-05-15 16:33:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,1,1,'asddasdasdasdasd',NULL,NULL,NULL,NULL,'2024-05-15 18:23:20','2024-05-15 18:23:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,597,1,'PC tidak menyala',NULL,NULL,NULL,NULL,'2024-05-15 19:00:57','2024-05-15 19:49:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,603,1,'Barang sudah tidak berfungsi dengan baik',NULL,NULL,NULL,NULL,'2024-05-15 19:01:47','2024-05-15 19:48:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,707,299,'barangnya sudah tidak bisa di pakai','1',NULL,NULL,50000,'2024-05-15 19:08:28','2024-05-15 19:13:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `maintenance_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sequence_id` int NOT NULL,
  `kode_status` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `users_id` bigint unsigned NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`),
  KEY `maintenances_users_id_foreign` (`users_id`),
  CONSTRAINT `maintenances_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
INSERT INTO `maintenances` VALUES (100,50,'0','2024-05-15 16:33:04','2024-05-15 16:33:04',1),(101,51,'0','2024-05-15 18:23:20','2024-05-15 18:23:20',1),(102,52,'0','2024-05-15 19:00:57','2024-05-15 19:00:57',1),(103,53,'0','2024-05-15 19:01:47','2024-05-15 19:01:47',1),(104,54,'0','2024-05-15 19:08:28','2024-05-15 19:08:28',299),(105,54,'1','2024-05-15 19:09:58','2024-05-15 19:09:58',1),(106,54,'2','2024-05-15 19:11:01','2024-05-15 19:11:01',1),(107,54,'3','2024-05-15 19:11:50','2024-05-15 19:11:50',1),(108,54,'4','2024-05-15 19:12:11','2024-05-15 19:12:11',1),(109,54,'5','2024-05-15 19:12:29','2024-05-15 19:12:29',1),(110,54,'6','2024-05-15 19:13:00','2024-05-15 19:13:00',1),(111,54,'10','2024-05-15 19:30:25','2024-05-15 19:30:25',1),(112,53,'1','2024-05-15 19:50:10','2024-05-15 19:50:10',1);
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_barang`
--

DROP TABLE IF EXISTS `master_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `tanggal_peroleh` date DEFAULT NULL,
  `nomor_seri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_urut_pendaftaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_barang`
--

LOCK TABLES `master_barang` WRITE;
/*!40000 ALTER TABLE `master_barang` DISABLE KEYS */;
INSERT INTO `master_barang` VALUES (1,'P.C Unit','','-','2010-06-30','monitor only','52'),(2,'P.C Unit','DELL ','Optiplex 780','2010-06-30','monitor only','54'),(3,'P.C Unit','ASUS','EEETOP2013IUTI-B041C','2010-06-30','E9PTBX003480','30'),(4,'P.C Unit','ASUS','EEETOP2013IUTI-B041C','2014-12-23','E9PT8X003548','90'),(5,'P.C Unit','ASUS','EEETOP2013IUTI-B041C','2014-12-23','E9PTBX003533','87'),(6,'P.C Unit','ASUS','EEETOP2013IUTI-B041C','2014-12-23','E9PTBX003546','86'),(7,'P.C Unit','ASUS','EEETOP2013IUTI-B041C','2014-12-23','E9PTBX003483','85'),(8,'P.C Unit','ASUS','EEETOP2013IUTI-B041C','2014-12-23','E9PTBX003489','88'),(9,'P.C Unit','DELL','Optiplex 3010 DT','2011-03-21','4NK2F2S','64'),(10,'P.C Unit','DELL','Optiplex 3020 Micro','2015-09-01','F18ZY42','95'),(11,'P.C Unit','DELL','Optiplex 3020 Micro','2015-09-01','HQ7ZY42','94'),(12,'P.C Unit','DELL','Optiplex 3020 Micro','2015-09-01','CNOU417N-64180-9AJ-MVM','92'),(13,'P.C Unit','DELL','Optiplex 3020 Micro','2015-09-01','NP7ZY42','93'),(14,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','1P8N7C2','108'),(15,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','1PFK7C2','107'),(16,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','229M7C2','110'),(17,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','23DH7C2','103'),(18,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','1PFQ7C2','111'),(19,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','22UP7C2','109'),(20,'P.C Unit','DELL','Optiplex  3010 DT','2010-06-30','BD62G2S','36'),(21,'P.C Unit','DELL','Optiplex  3010 DT','2013-06-10','53C2G2S','78'),(22,'P.C Unit','DELL','Optiplex  3010 DT','2013-06-10','1P8N7C2','75'),(23,'P.C Unit','DELL','Optiplex  3010 DT','2013-06-10','8QKZF25','83'),(24,'P.C Unit','ASUS','EEETOP2013IUTI-B041C','2014-12-23','','91'),(25,'P.C Unit','HP','','2008-05-12','','20'),(26,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ83101QB','138'),(27,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ83101FJ','141'),(28,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ83101DF','142'),(29,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ83101MR','136'),(30,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ8101QX','140'),(31,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ83100Z8','134'),(32,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ831010H','137'),(33,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ831019H','135'),(34,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ83100WK','139'),(35,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','1CZ831015K','143'),(36,'P.C Unit','HP','PC Rakitan','2018-12-07','','161'),(37,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1ARP3T','160'),(38,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1ARM43','159'),(39,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1ARK3P','155'),(40,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1ARP4H','156'),(41,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1AEA4K','157'),(42,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1ARP36','158'),(43,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-21','MP1ARH3T','152'),(44,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1AEFSR','154'),(45,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-21','MP1ARP3C','151'),(46,'P.C Unit','LENOVO','Lenovo 1,5 AIO','2018-12-07','MP1ARP3K','153'),(47,'P.C Unit','LENOVO','Lenovo ThinkCentre M710t','2018-12-11','PCOXZFTC','148'),(48,'P.C Unit','LENOVO','Lenovo ThinkCentre M710t','2018-12-11','PCOXZFT4','149'),(49,'P.C Unit','LENOVO','Lenovo ThinkCentre M710t','2018-12-11','PCOXZFT0','150'),(50,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','R87EXRD','61'),(51,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','','66'),(52,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','R86ZXPD','69'),(53,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','perlu ganti monitor','65'),(54,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','R87EVLD','73'),(55,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','','67'),(56,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','','70'),(57,'P.C Unit','LENOVO','Lenovo/ThinkCentre M80','2011-03-21','','74'),(58,'P.C Unit','DELL','Optiplex  3010 DT','2011-03-21','7PKZF2S','71'),(59,'P.C Unit','DELL','Optiplex  3010 DT','2011-03-21','95KZF2S','72'),(60,'P.C Unit','DELL','Optiplex  3010 DT','2013-06-10','5VB2G2S','76'),(61,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','1QFL7C2','102'),(62,'P.C Unit','DELL','Optiplex 3040 Micro','2016-08-12','1PLR7C2','105'),(63,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','','144'),(64,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','','145'),(65,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','','146'),(66,'P.C Unit','HP','ProDesk 400 G5 SFF','2018-11-19','','147'),(67,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RLEB','176'),(68,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18QFKY','179'),(69,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RFEV','184'),(70,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18REQ5','191'),(71,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RHJZ','174'),(72,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RHKB','175'),(73,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18JDGG','177'),(74,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RFL7','178'),(75,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18JDFO','180'),(76,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RL6T','181'),(77,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RME1','185'),(78,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RME3','186'),(79,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RHSO','188'),(80,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RMAP','189'),(81,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RMN9','182'),(82,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RMCS','187'),(83,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18JDES','193'),(84,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RER9','183'),(85,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18QFQP','190'),(86,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RMDW','194'),(87,'P.C Unit','LENOVO','ThinkCentre M720t','2019-12-09','PC18RMCY','192'),(88,'PC Workstation','HP','Z4 G4 Workstation','2018-12-31','','1'),(89,'Lap Top','','ThinkPad T14 Gen1','0000-00-00','PF-2J7X4G','184'),(90,'Note Book','ASUS','','0000-00-00','LAN0CV19N76144C','84'),(91,'Lap Top','ASUS','GL503','0000-00-00','J9NRCX04B30640D','166'),(92,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A072N00','204'),(93,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019CF2N00','228'),(94,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A002N00','229'),(95,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019BB2N00','230'),(96,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019F32N00','231'),(97,'Note Book','ASUS','','0000-00-00','L7NRKD00444030G','82'),(98,'Lap Top','LENOVO','V330','0000-00-00','MP1DWM0V','163'),(99,'Lap Top','LENOVO','V330','0000-00-00','MP1DAQ9R','172'),(100,'Lap Top','ASUS','Vivo Book 442','0000-00-00','J2N0CV08H170088','180'),(101,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019FE2N00','201'),(102,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019D22N00','202'),(103,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019C82N00','206'),(104,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019C52N00','219'),(105,'Note Book','ASUS','','0000-00-00','L9N0CV21N90940E','85'),(106,'Lap Top','HP','Probook 440 G5 [1MJ83AV]','0000-00-00','1MJ83AV','158'),(107,'Lap Top','HP','Probook 440 G5 [1MJ83AV]','0000-00-00','5CD8327X62','160'),(108,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019092N00','205'),(109,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019F82N00','209'),(110,'Lap Top','LENOVO','V330','0000-00-00','MP1DAV2E','173'),(111,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019EB2N00','203'),(112,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A0E2N00','215'),(113,'Note Book','LENOVO','','0000-00-00','SNPK23KG4M','86'),(114,'Lap Top','HP','Probook 440 G5 [1MJ83AV]','0000-00-00','SCD8327X60','159'),(115,'Lap Top','LENOVO','ThinkPad T14 Gen1','0000-00-00','PF-2J7TWH','185'),(116,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A022N00','227'),(117,'Lap Top','LENOVO','V330','0000-00-00','MP1DWLZD','164'),(118,'Lap Top','LENOVO','V330','0000-00-00','MP1DWLZ4','174'),(119,'Lap Top','ASUS','Vivo Book 442','0000-00-00','J2N0CV08H16208B','179'),(120,'Lap Top','LENOVO','ThinkPad T14 Gen1','0000-00-00','PF-2J7X1E','183'),(121,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019F22N00','208'),(122,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019B92N00','210'),(123,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019DF2N00','211'),(124,'Lap Top','LENOVO','V330','0000-00-00','MP1DWJZC','162'),(125,'Lap Top','LENOVO','V330','0000-00-00','MP1DWK0P','175'),(126,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019BF2N00','212'),(127,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019DA2N00','213'),(128,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019D52N00','214'),(129,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A172N00','222'),(130,'Lap Top','LENOVO','ThinkPad T14 Gen1','0000-00-00','PF-2J7S4D','182'),(131,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019D12N00','207'),(132,'Note Book','HP','Business Notebook 348 G4','0000-00-00','5CG8482RJL','80'),(133,'Lap Top','HP','Probook 440 G5 [1MJ83AV]','0000-00-00','5CD8327X6C','156'),(134,'Lap Top','LENOVO','V330','0000-00-00','MP1DWM0B','161'),(135,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019DC2N00','216'),(136,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019C12N00','217'),(137,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019F72N00','218'),(138,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A122N00','220'),(139,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019E22N00','225'),(140,'Lap Top','HP','Probook 440 G5 [1MJ83AV]','0000-00-00','5CD8327X91','154'),(141,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019D82N00','223'),(142,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A0A2N00','224'),(143,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN003142019E32N00','226'),(144,'Note Book','HP','Business Notebook 348 G4','0000-00-00','5CG8482RJ4','81'),(145,'Note Book','ASUS','','0000-00-00','L9N0CV21N92540C','83'),(146,'Lap Top','LENOVO','ThinkPad T 420','0000-00-00','','141'),(147,'Lap Top','HP','Probook 440 G5 [1MJ83AV]','0000-00-00','5CD8327X7X','155'),(148,'Lap Top','LENOVO','V330','0000-00-00','MP1DWLMZ','165'),(149,'Lap Top','LENOVO','V330','0000-00-00','MP1DWKKW','167'),(150,'Lap Top','LENOVO','V330','0000-00-00','MP1DWJZ5','169'),(151,'Lap Top','LENOVO','V330','0000-00-00','MP1DWLN7','171'),(152,'Lap Top','ASUS','Zenbook 3','0000-00-00','J5NOCYKKR00L229','177'),(153,'Lap Top','ASUS','Vivo Book 442','0000-00-00','J2N0CV08H163089','178'),(154,'Lap Top','ACER','TMP414RN-51','0000-00-00','NXVP4SN00314201A102N00','221'),(707,'Lap Top','ASUS','Optiplex 3020 Micro',NULL,'12312312','123');
/*!40000 ALTER TABLE `master_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_jabatan`
--

DROP TABLE IF EXISTS `master_jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_jabatan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_jabatan`
--

LOCK TABLES `master_jabatan` WRITE;
/*!40000 ALTER TABLE `master_jabatan` DISABLE KEYS */;
INSERT INTO `master_jabatan` VALUES (1,'Kepala Badan Pusat Statistik Provinsi','Eselon II','Struktural',NULL,NULL),(2,'Kepala Bagian Umum','Eselon III','Struktural',NULL,NULL),(3,'Pranata Komputer','Ahli Pertama','Fungsional',NULL,NULL),(4,'Pranata Komputer','Ahli Muda','Fungsional',NULL,NULL),(5,'Statistisi','Ahli Pertama','Fungsional',NULL,NULL),(6,'Statistisi','Ahli Muda','Fungsional',NULL,NULL),(7,'Statistisi','Ahli Madya','Fungsional',NULL,NULL),(8,'Pranata Komputer','Ahli Madya','Fungsional',NULL,NULL),(9,'Arsiparis','Ahli Muda','Fungsional',NULL,NULL),(10,'Pelaksana','-','Pelaksana',NULL,NULL);
/*!40000 ALTER TABLE `master_jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_perusahaan`
--

DROP TABLE IF EXISTS `master_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_perusahaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `npwp` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_rekening` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penanggung_jawab_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_perusahaan`
--

LOCK TABLES `master_perusahaan` WRITE;
/*!40000 ALTER TABLE `master_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_pj_perusahaan`
--

DROP TABLE IF EXISTS `master_pj_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_pj_perusahaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `perusahaan_id` bigint unsigned NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_wa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_pj_perusahaan`
--

LOCK TABLES `master_pj_perusahaan` WRITE;
/*!40000 ALTER TABLE `master_pj_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_pj_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_ruangan`
--

DROP TABLE IF EXISTS `master_ruangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_ruangan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` bigint unsigned NOT NULL DEFAULT '5',
  `kode_baru` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gedung` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_siman` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lantai` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_ruangan_users_id_foreign` (`users_id`),
  CONSTRAINT `master_ruangan_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_ruangan`
--

LOCK TABLES `master_ruangan` WRITE;
/*!40000 ALTER TABLE `master_ruangan` DISABLE KEYS */;
INSERT INTO `master_ruangan` VALUES (1,'Ruang Umum 2',246,'201','2','1','2'),(2,'Ruang Humas dan RB',5,'202','2','2','2'),(3,'Ruang Pengolahan',5,'303','3','3','1'),(4,'Ruang SKF IPDS',5,'302','3','2',''),(5,'Ruang KF IPDS',5,'301','3','1',''),(6,'Ruang Brandkas',5,'310','3','10','2'),(7,'Tidak Terpakai 3',5,'309','3','9',''),(8,'Tidak Terpakai 2',5,'308','3','8',''),(9,'Tidak Terpakai 1',5,'307','3','7',''),(10,'Ruang Kabag Umum',5,'306','3','6',''),(11,'Ruang Rapat Umum',5,'305','3','5',''),(12,'Ruang Umum 3',5,'304','3','4',''),(13,'Ruang Mako',5,'312','3','12','3'),(14,'Ruang Aula',5,'311','3','11',''),(15,'Ruang Gudang RB',5,'408','4','8','1'),(16,'Ruang Persediaan',5,'402','4','2',''),(17,'Ruang Umum 1',5,'401','4','1',''),(18,'Ruang Gudang',5,'403','4','3',''),(19,'Ruang SKF Kepegawaian',5,'404','4','4','2'),(20,'Tidak Terpakai 4',5,'407','4','7','3'),(21,'Ruang Arsip',5,'406','4','6',''),(22,'Ruang Musholla',5,'405','4','5',''),(23,'Lantai Dasar',5,'620','6','20','1'),(24,'Ruang Laktasi',5,'619','6','19',''),(25,'Loby Lantai 1',5,'602','6','2',''),(26,'Ruang Perpustakaan',5,'601','6','1',''),(27,'Ruang tunggu lantai 2',5,'607','6','7','2'),(28,'Ruang Produksi',5,'606','6','6',''),(29,'Tidak Terpakai 6',5,'605','6','5',''),(30,'Ruang Statistik Sosial',5,'604','6','4',''),(31,'Tidak Terpakai 5',5,'603','6','3',''),(32,'Ruang Tunggu Lantai 3',5,'617','6','17','3'),(33,'Ruang Vicon',5,'611','6','11',''),(34,'Ruang Sekretaris',5,'610','6','10',''),(35,'Ruang Kepala',5,'609','6','9',''),(36,'Ruang tunggu lantai 4',5,'616','6','16','4'),(37,'Ruang Statistik Nerwilis',5,'615','6','15',''),(38,'Tidak Terpakai 7',5,'614','6','14',''),(39,'Tidak Terpakai 6',5,'612','6','12',''),(40,'Ruang Statistik Distribusi',5,'613','6','13',''),(41,'Ruang Mesin Lift',5,'618','6','18','5'),(57,'Ruang Umum 2',5,'201',NULL,NULL,NULL);
/*!40000 ALTER TABLE `master_ruangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_sistem_operasi`
--

DROP TABLE IF EXISTS `master_sistem_operasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_sistem_operasi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arsitektur` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_sistem_operasi`
--

LOCK TABLES `master_sistem_operasi` WRITE;
/*!40000 ALTER TABLE `master_sistem_operasi` DISABLE KEYS */;
INSERT INTO `master_sistem_operasi` VALUES (1,'Linux OS','x64','2024-02-01 16:42:11','2024-02-01 16:42:11'),(2,'Linux OS','x86','2024-02-01 16:42:11','2024-02-01 16:42:11'),(3,'Windows 7','x64','2024-02-01 16:42:11','2024-02-01 16:42:11'),(4,'Windows 7','x86','2024-02-01 16:42:11','2024-02-01 16:42:11'),(5,'Windows 10','x64','2024-02-01 16:42:11','2024-02-01 16:42:11'),(6,'Windows 10','x86','2024-02-01 16:42:11','2024-02-01 16:42:11'),(7,'Windows 11','x64','2024-02-01 16:42:11','2024-02-01 16:42:11'),(8,'Windows XP','x64','2024-02-01 16:42:11','2024-02-01 16:42:11'),(9,'Windows XP','x86','2024-02-01 16:42:11','2024-02-01 16:42:11'),(10,'Windows Server 2016','x64','2024-02-01 16:42:11','2024-02-01 16:42:11'),(11,'Windows 11','x86','2024-02-01 16:42:11','2024-02-01 16:42:11'),(12,'Non OS','-','2024-02-01 16:42:11','2024-02-01 16:42:11'),(13,'Android','ARM86','2024-02-01 16:42:11','2024-02-01 16:42:11'),(14,'Windows 8','x64','2024-02-01 16:42:11','2024-02-01 16:42:11'),(15,'Windows 8','x86','2024-02-01 16:42:11','2024-02-01 16:42:11'),(16,'Android','ARM64','2024-02-01 16:42:11','2024-02-01 16:42:11');
/*!40000 ALTER TABLE `master_sistem_operasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `percakapan_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_percakapan_id_foreign` (`percakapan_id`),
  KEY `messages_user_id_foreign` (`user_id`),
  CONSTRAINT `messages_percakapan_id_foreign` FOREIGN KEY (`percakapan_id`) REFERENCES `percakapan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Tesss',1,299,'2024-05-15 19:32:39','2024-05-15 19:32:39'),(2,'Halo, Selamat Siang',2,301,'2024-05-15 19:51:43','2024-05-15 19:51:43'),(3,'Halo Mesisasi, Ada yang bisa saya bantu ?',2,300,'2024-05-15 19:52:25','2024-05-15 19:52:25');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_06_12_131528_create_table_master_jabatan',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_100000_create_password_reset_tokens_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2023_06_12_123009_create_master_sistem_operasi_table',1),(7,'2023_06_12_132623_create_master_ruangans_table',1),(8,'2023_06_12_133806_create_master_barangs_table',1),(9,'2023_06_12_133816_create_barangs_table',1),(10,'2023_06_27_060933_create_maintenances_table',2),(11,'2023_06_27_061734_create_maintenance_sequences_table',2),(12,'2023_07_08_060548_create_riwayat_barangs_table',2),(13,'2023_07_10_022349_create_barang_view',2),(14,'2023_07_28_031356_create_bast_table',2),(15,'2024_01_08_115948_add_nup_master_barang',2),(16,'2024_01_14_120831_update_maintenances_table',2),(17,'2024_01_17_032655_update_maintenance_sequences_table',2),(18,'2024_01_21_233928_update_maintenance_sequences_table',2),(19,'2024_01_22_033102_update_riwayat_barang_table',2),(20,'2024_01_23_005517_update_riwayat_barang_table',2),(21,'2024_01_24_035114_create_master_perusahaan_table',2),(22,'2024_01_24_035744_update_main_seq_table',2),(23,'2024_01_24_064603_update_master_perusahaan_table',2),(24,'2024_01_24_070952_create_master_pj_perusahaan_table',2),(25,'2024_01_26_055200_create_kondisi_final_table',2),(26,'2024_01_29_025528_update_master_ruangan_table',2),(27,'2024_01_30_033810_update_barang_table',2),(28,'2024_02_02_013943_update_ruangan_table',3),(29,'2024_04_30_010214_create_permintaans_table',4),(30,'2024_05_03_062634_create_percakapans_table',4),(31,'2024_05_05_007825_create_messages_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percakapan`
--

DROP TABLE IF EXISTS `percakapan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percakapan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user1_id` bigint unsigned NOT NULL,
  `user2_id` bigint unsigned NOT NULL,
  `permintaan_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `percakapan_permintaan_id_foreign` (`permintaan_id`),
  KEY `percakapan_user1_id_foreign` (`user1_id`),
  KEY `percakapan_user2_id_foreign` (`user2_id`),
  CONSTRAINT `percakapan_permintaan_id_foreign` FOREIGN KEY (`permintaan_id`) REFERENCES `permintaan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `percakapan_user1_id_foreign` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `percakapan_user2_id_foreign` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percakapan`
--

LOCK TABLES `percakapan` WRITE;
/*!40000 ALTER TABLE `percakapan` DISABLE KEYS */;
INSERT INTO `percakapan` VALUES (1,299,1,1,'2024-05-15 19:32:25','2024-05-15 19:32:25'),(2,301,1,2,'2024-05-15 19:51:34','2024-05-15 19:51:34');
/*!40000 ALTER TABLE `percakapan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permintaan`
--

DROP TABLE IF EXISTS `permintaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permintaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_ticket` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_permintaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruangan_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `no_telp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','closed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permintaan_ruangan_id_foreign` (`ruangan_id`),
  KEY `permintaan_user_id_foreign` (`user_id`),
  CONSTRAINT `permintaan_ruangan_id_foreign` FOREIGN KEY (`ruangan_id`) REFERENCES `master_ruangan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permintaan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permintaan`
--

LOCK TABLES `permintaan` WRITE;
/*!40000 ALTER TABLE `permintaan` DISABLE KEYS */;
INSERT INTO `permintaan` VALUES (1,'TICKET-20240516033225','Testing','tess','Te4sting','Tim IPDS','Tim PBJ/PPK',4,299,'123123123','open','2024-05-15 19:32:25','2024-05-15 19:32:25'),(2,'TICKET-20240516035134','Testing','deskripis coba','tes','Tim IPDS','Tim BMN',4,301,'089123123123','open','2024-05-15 19:51:34','2024-05-15 19:51:34');
/*!40000 ALTER TABLE `permintaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_barang`
--

DROP TABLE IF EXISTS `riwayat_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_barang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` bigint unsigned NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `users_id` bigint unsigned NOT NULL,
  `original_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `modified_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `barang_id` (`barang_id`),
  CONSTRAINT `riwayat_barang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `riwayat_barang_chk_1` CHECK (json_valid(`original_data`)),
  CONSTRAINT `riwayat_barang_chk_2` CHECK (json_valid(`modified_data`))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_barang`
--

LOCK TABLES `riwayat_barang` WRITE;
/*!40000 ALTER TABLE `riwayat_barang` DISABLE KEYS */;
INSERT INTO `riwayat_barang` VALUES (4,597,'2024-02-05 02:32:56',1,'{\"id\":597,\"barang_id\":1,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}','{\"id\":597,\"barang_id\":1,\"sistem_operasi_id\":5,\"users_id\":1,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),(5,603,'2024-05-16 03:01:33',1,'{\"id\":603,\"barang_id\":7,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}','{\"id\":603,\"barang_id\":7,\"sistem_operasi_id\":5,\"users_id\":1,\"ruangan_id\":40,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),(6,606,'2024-05-15 19:09:31',299,'{\"id\":606,\"barang_id\":10,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}','{\"id\":606,\"barang_id\":10,\"sistem_operasi_id\":5,\"users_id\":299,\"ruangan_id\":17,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),(7,707,'2024-05-16 03:11:01',299,NULL,NULL),(8,600,'2024-05-15 19:43:03',300,'{\"id\":600,\"barang_id\":4,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}','{\"id\":600,\"barang_id\":4,\"sistem_operasi_id\":5,\"users_id\":300,\"ruangan_id\":30,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}'),(9,604,'2024-05-15 19:43:12',300,'{\"id\":604,\"barang_id\":8,\"sistem_operasi_id\":5,\"users_id\":5,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}','{\"id\":604,\"barang_id\":8,\"sistem_operasi_id\":5,\"users_id\":300,\"ruangan_id\":37,\"record_time\":\"2024-02-04 23:37:19\",\"kondisi\":\"Baik\",\"bast_path\":null,\"is_approved\":null,\"bast_upload_date\":null}');
/*!40000 ALTER TABLE `riwayat_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_pemeliharaan`
--

DROP TABLE IF EXISTS `status_pemeliharaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_pemeliharaan` (
  `kode_status` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`kode_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_pemeliharaan`
--

LOCK TABLES `status_pemeliharaan` WRITE;
/*!40000 ALTER TABLE `status_pemeliharaan` DISABLE KEYS */;
INSERT INTO `status_pemeliharaan` VALUES ('0','Pengajuan telah dibuat'),('1','Disetujui Oleh Tim BMN'),('10','Barang sudah Dikembalikan kepada Pegawai'),('2','Disetujui Oleh Tim IPDS'),('3','Menunggu Barang Diambil Penyedia'),('4','Sedang Diproses pada Penyedia'),('5','Selesai Perbaikan, Barang Sedang Diperiksa oleh Tim IPDS'),('6','Barang telah selesai diperiksa\r\n'),('99','Barang Rusak Berat');
/*!40000 ALTER TABLE `status_pemeliharaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan_id` bigint unsigned NOT NULL DEFAULT '5',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_jabatan_id_foreign` (`jabatan_id`),
  CONSTRAINT `users_jabatan_id_foreign` FOREIGN KEY (`jabatan_id`) REFERENCES `master_jabatan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin Po','ponim@bps.go.id','199810132021041001','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'Tim IPDS','ponimin99',NULL,'$2y$10$o.NszZQtemnq5Q3wLGrrJuDU88ZYl2r2JAm1FtGp4X.kuYzY.U1CS',NULL,NULL,'2024-02-04 20:27:41'),(5,'Bagian Umum','umum7100@bps.go.id','000000000000000000','Bagian Umum',5,'basic','admin_umum',NULL,'$2y$10$OoMnoV7hIy1tVbfzGRI4f.aSIdKv23XAavQcW789taf2iV0k/M1bm',NULL,NULL,NULL),(178,'Satria June Adwendi SST','satria.adwendi@bps.go.id','199307102016021001','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','awe',NULL,'$2y$10$r/qGcXIu8U88Anb6X5Eu6eL6pMnoeQwptEJQZ3BWOH5vYON84/J0K',NULL,NULL,NULL),(179,'Mia Wahyumiranti','miaw_miranti@bps.go.id','198304112005022001','Bagian Umum',5,'basic','spk2',NULL,'$2y$10$IzUWHTnhi3At2ejTFTHJa.ZwwGc/vRzIV46BrTYj6DlmkcRak9FS2',NULL,NULL,NULL),(180,'Tiara Dameani S.ST','dame.simamora@bps.go.id','198802082009122002','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','dame',NULL,'$2y$10$KdH36x5.o7dFLdswIKv4Een/S4a1MvH9STyYzQf/EDRrcWQfcfmNq',NULL,NULL,NULL),(181,'Hahotan Sagala SST','hase@bps.go.id','198603202009021004','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','hahotan',NULL,'$2y$10$IBjH6uvkgrdEFezOFnOcw.H3GD59aA5mCI8Le3X1lh1xbo/axtd.K',NULL,NULL,NULL),(182,'Indira Anastasia Lolowang SE','indiraira@bps.go.id','198301252003122001','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','ira',NULL,'$2y$10$qcelzpbUN.GWcluNqhIm7eCXznV5Qcq/apQPko9OFa/YLQFXbQNKG',NULL,NULL,NULL),(185,'Erna Kusumawati SST','ernakusuma@bps.go.id','198910192012112001','Bagian Umum',5,'basic','erna_kusumawati',NULL,'$2y$10$Kr94Sd.hf1Unq/mlBikHaefwnVTmsCoyGqyE09XNiHmH.56Q2ZBdW',NULL,NULL,NULL),(186,'Ir. Nuraini Walangadi','n.walangadi@bps.go.id','196511231992122001','Bagian Umum',5,'basic','ani',NULL,'$2y$10$h8fK9i.EovKVsUJZ9iXAD.LwOz6uHFeM0z7ME5nRiW0siGa78f.Py',NULL,NULL,NULL),(187,'Simon Andreas August Remiasa S.ST','simon@bps.go.id','197710111999121001','Bagian Umum',5,'basic','simon',NULL,'$2y$10$A9A.PZmX1CsLqNZ9j.Vmee6mxX4.tZ0T8dI6kqnja/idzUgU2CYbC',NULL,NULL,NULL),(189,'Hahotan Sagala SST','hase@bps.go.id','198603202009021004','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','hase',NULL,'$2y$10$8X2DWJm30jOQ6ucdx5CW/.y4YbSqO78NJMsHym9OxjfLyfP54Bjve',NULL,NULL,NULL),(190,'Norma Olga Frida Regar, S.Si, M.Si','norma@bps.go.id','196611291986032001','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','norma',NULL,'$2y$10$OibOvEgZNnoy.xPQ7V1MxeS1/oPcNWN/wpCexAGIBkWBngq/45GIK',NULL,NULL,NULL),(191,'Ratna Sulistyowati, SST, SAB, M.Si','ratnasuli@bps.go.id','198505262008012001','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','ratna',NULL,'$2y$10$w2pCAKsFZWmyoE7gruOdWuiVY3f8qDzB6tHnvbpU8eB8jrrypBqoG',NULL,NULL,NULL),(193,'Titien Kristiningsih, SST, SE, M.Si','titienk@bps.go.id','198005252002122003','Fungsi Statistik Sosial',5,'basic','titien',NULL,'$2y$10$7DRmgvCJXRluLOaTsh046uvu/Mn2PHQwNoyZIXJnk2uKJl.IEDVYi',NULL,NULL,NULL),(194,'Sarjani Harini Martiningsih S.Si','rhiniechay@bps.go.id','198803062011012015','Fungsi Statistik Sosial',5,'basic','rhiniechay',NULL,'$2y$10$qnvDwgZj6h/uZ5ZlBe6tCeTlAKUzlfm4nRrH2wUU0TA1ogy44ypnm',NULL,NULL,NULL),(195,'Enggelin Giacinta Wongkar, SST','enggelingiacinta wongkar@bps.go.id','199212292014122002','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','enggelin',NULL,'$2y$10$KhqmxuynKo58sSe4Tq1htOZ7vcZA9/p8Ly83nsQd1hvOyq2Z10/Sa',NULL,NULL,NULL),(196,'Ayu Puspita Wulandana B, SST','wulandanawulandana b@bps.go.id','199010082014102001','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','wulandana',NULL,'$2y$10$MbKslvAaXDBhFH5DDCympuCFUfn6zme9gNHNIBwmcwhRBIo.A8DRO',NULL,NULL,NULL),(197,'Sirly Catharina Worotikan, SE., M.Si.','sirly@bps.go.id','196808281994012001','Fungsi Statistik Produksi',5,'basic','sirly',NULL,'$2y$10$WPTqoPz7IoIGcrZ0iOV4kuJ8WJZ0Jgc5L.FzQiWYDipkR/b8B5KkO',NULL,NULL,NULL),(198,'Starry Nouva Solang, M.Si.','starrysolang@bps.go.id','196709181994012001','Fungsi Statistik Produksi',5,'basic','starry',NULL,'$2y$10$Xx228KOg/qSOuH/xHeZBVOPTZJ0gJzlzOqkbIu/YJLrY4XLv6L7Wu',NULL,NULL,NULL),(199,'Victor Prima Sirait, SST., M.S.E','victorps@bps.go.id','198103282006021001','Fungsi Statistik Produksi',5,'basic','victor',NULL,'$2y$10$C6Z2BmLXGawW2gddoRLbbuHHRQaOK3WcY/CosTWvPciRcdvTtB.gu',NULL,NULL,NULL),(200,'Oky Irwan Rosadi','oky@bps.go.id','198610032011011011','Bagian Umum',5,'basic','oky',NULL,'$2y$10$8lRdoSiiLUNfZoBApCzcweS.yVa806vkTFEHF4r2FMXCHfj8YD7Ra',NULL,NULL,NULL),(201,'Mariane Esther Rantung, SST','mariane.rantung@bps.go.id','199408062017012001','Fungsi Statistik Produksi',5,'basic','esther',NULL,'$2y$10$TNnGRElS.zPkXGCEY2bUgOVBbE9qYWmqIKf3r7CRaR5ghMwji3ICy',NULL,NULL,NULL),(202,'Abdullah Kango','akango@bps.go.id','197407271997121001','Fungsi Statistik Distribusi',5,'basic','akango',NULL,'$2y$10$m/3qq.0aIaGgzv8rDUhvNeJujnzFgcXUSCbBkMrQsWpbEIpxpEXyu',NULL,NULL,NULL),(204,'Elrini D. Wuisan, SE','elriniwuisan@bps.go.id','198210022010032001','Fungsi Statistik Distribusi',5,'basic','elri',NULL,'$2y$10$j2avzft3gBeTuSrfPMgKdOlADahyjks4WQeB9qEOMGrgSx5sW0Wi6',NULL,NULL,NULL),(205,'Agnes M. Oroh','agnes.oroh@bps.go.id','198208222008012014','Fungsi Statistik Distribusi',5,'basic','agnes',NULL,'$2y$10$DH1gFyiW/MYFHlTV.5xTteg1FsMI/Q6YDfEgffsNe0b6i.ncrkjiC',NULL,NULL,NULL),(206,'Firra Rastraaktiva Awaliyah S.Si','firra@bps.go.id','198512142010032002','Fungsi Statistik Distribusi',5,'basic','firra',NULL,'$2y$10$y5lCZn4bhN9jvEeBwmAxm.atlqVTkWWDH5p6Pk3f.1laVPIShKooG',NULL,NULL,NULL),(207,'Limada Iqbal, SST','limada iqbal@bps.go.id','199506222018021002','Fungsi Statistik Produksi',5,'basic','iqbal',NULL,'$2y$10$ECbHmuYiDSlKbzaEPN0C/.7wkatmqOiHOsOrQK.G9c2/giytLFFEa',NULL,NULL,NULL),(208,'Bregitta Sisilia Lasut SS','bregitta.lasut@bps.go.id','198209182008012012','Sosial',5,'basic','gita',NULL,'$2y$10$7nw7eb3dLFkbs2Z2igfGdOGHBLdMDT6xoeInvTr9FRvFw89lP8jni',NULL,NULL,NULL),(209,'Junitha Sahureka','junitha@bps.go.id','198606112009022007','Fungsi Statistik Sosial',5,'basic','uneth',NULL,'$2y$10$WbTBrBRN/5KpPfP/S3Fx8ukPkiAgOP4l6AT97lPBhUV4d96RPkw1u',NULL,NULL,NULL),(210,'Florentz Magdalena','fmagdalena@bps.go.id','199108212014102000','Fungsi Statistik Sosial',5,'basic','florentz',NULL,'$2y$10$J4KWQs1RbFyvPgUz/6Dz5e2Wer/P6TuHi6wMxHgRWsBxzFN5IrWXe',NULL,NULL,NULL),(211,'Stela Engeline Doris Lomboan','stela@bps.go.id','197209091992092001','Bagian Umum',5,'basic','stela',NULL,'$2y$10$2mmlgbGhVbmcxB4aygmNgeoduO4ejT97.9s8fTTinaBvGW0bOufI.',NULL,NULL,NULL),(212,'Joice Juliana Koyongian A.Md','joice.koyongian@bps.go.id','198307062011012015','Bagian Umum',5,'basic','juliana',NULL,'$2y$10$X7cVoO7RSyznGedAfBI3LuxCeEnvBFr6miVh7aA.8iQbBIEPQpkj2',NULL,NULL,NULL),(214,'Frisda Arisanti T','frisda@bps.go.id','198603082006042001','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','frisda',NULL,'$2y$10$6y.vCTORK18bw6JjgQGw4OCQ4IA03ZAMYM23XZKkoErKrDb5MOCQ.',NULL,NULL,NULL),(215,'Tiara Dameani S.ST','dame.simamora@bps.go.id','198802082009122002','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','dame_user',NULL,'$2y$10$1/3bUwS1EEDa5z3y6oXXc.KOn.wU9bMzqHwjUlWbe34Z77mPpbSFi',NULL,NULL,NULL),(217,'Prima Puspita Indramurti','prisma.puspita@bps.go.id','','Bagian Umum',5,'basic','prima',NULL,'$2y$10$/lQPs/5fS9H0Vc3ufQ3QDu6Dk/Ik4DhumvG/PYSTZSX7tKArrdVxi',NULL,NULL,NULL),(218,'Priska Harto Lolowang','pika@bps.go.id','198211262011011007','Bagian Umum',5,'basic','priska',NULL,'$2y$10$JOAyZeChBKpq3wURLg9zx.TWt28Q6DBZCYqNhJc9C9SJuTwt/LOCK',NULL,NULL,NULL),(219,'Uyun Rahmawati','uyun@bps.go.id','198502132011012017','Bagian Umum',5,'basic','uyun',NULL,'$2y$10$acQ8L9qdffwSG8J5RT4Xg.isfDc0QqWbEDz8lGsnxm3UPo177fntm',NULL,NULL,NULL),(220,'Randy Pratama Lumenta','mentarandy@bps.go.id','198911102012111001','',5,'basic','randy',NULL,'$2y$10$nWBBSFl7mxnc4plty3.FCeWa1hNCXReL/KJYvNlKTlzGgkzhcoM46',NULL,NULL,NULL),(234,'Windha Wijaya, SST','windhawijaya@bps.go.id','199008012014102001','Fungsi Statistik Distribusi',5,'basic','windha',NULL,'$2y$10$Xa8Y2xGbi.tlQzegwv.wPO92dRPCwohXzpROBWqvmF04A2191Qre2',NULL,NULL,NULL),(235,'Mohamad Samsodin','mohsam@bps.go.id','198305082006021001','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','mohsam',NULL,'$2y$10$QStCvcYLw1xBXF43A5AuvuhF60/kCXiMUjIXMylDYT2rYzXqzbqOW',NULL,NULL,NULL),(236,'Sumbodo Aji Cahyono, S.Si, MA','sumbodo@bps.go.id','197703081999011001','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','sumbodo',NULL,'$2y$10$0TpwDCL/z8YI7mniejnCiOngK.ADrqN5JlDor1kFQ/xYSC3IBxRmG',NULL,NULL,NULL),(237,'Administrator','ipds7100@bps.go.id','240171000000000000','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','admin',NULL,'$2y$10$ZsH7YI14/1TBjEIUajfPGusT/ZZBwg9Jlh5CE/JEBOxcQJnnmi1Ym',NULL,NULL,NULL),(238,'Radjid Dwi Iskandar A.Md','radjid@bps.go.id','198504112011011009','Bagian Umum',5,'basic','radjid',NULL,'$2y$10$oJff9qkhvvMIp84ay1kQTejU/ux8/KztpxxwRw8k.yf0vI.xgsaKO',NULL,NULL,NULL),(239,'Yanti Jane Ivonne Kaeng','yajaivka@bps.go.id','198201202008012012','Bagian Umum',5,'basic','spk1',NULL,'$2y$10$D43GkZ/tZ3ZFSqbwyRN36e7enJQWMv8GrUllmBxfKvK1SqIkw1h9e',NULL,NULL,NULL),(241,'Ridwan Setiawan S.Tr.Stat.','ridwanst@bps.go.id','199604202019011002','Bagian Umum',5,'basic','Ridwan',NULL,'$2y$10$jikkFYXs1HztTkyKZGDJXuoZheI17exKsJl9XDNB.C7BlU6RMyR4O',NULL,NULL,NULL),(242,'Karni Hamdani S.Si.','karni.hamdani@bps.go.id','199401312019032001','Bagian Umum',5,'basic','karni',NULL,'$2y$10$tS6Y7XZPoIN1cFwAWMyduO2kvYxTp8XHCGT5e6gf/m4PLkjxiubMe',NULL,NULL,NULL),(243,'Rosniar Eliana SST., M.Stat.','niar@bps.go.id','198601202009022008','Fungsi Statistik Distribusi',5,'basic','niar',NULL,'$2y$10$Fk2umsmfchigEPpa73Kzp.ezrWy/2lJ2vV/bWFjpqUgs3JF3ZWuxu',NULL,NULL,NULL),(244,'Danty Welmin Yoshida Fatima S.Tr.Stat.','danty.fatima@bps.go.id','199711032021042001','Fungsi Statistik Produksi',5,'basic','danty123',NULL,'$2y$10$PBjlV.CX/mo/vlUmVa5TTOkk5UW2D8TbDDWFudd2stFlNYiaE1Iw.',NULL,NULL,NULL),(245,'Inke Margareth Tambeo','inkemargareth@bps.go.id','198403232007012003','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','inke',NULL,'$2y$10$TYWHFlLaiBgxRvYxGhaGkO9sHm3pSawVJ6Yo.x2Va.O/FOKB4sVci',NULL,NULL,NULL),(246,'Nurfadhila Fahmi','nurfadhila@bps.go.id','199510092019032002','Fungsi Statistik Distribusi',5,'basic','dhila',NULL,'$2y$10$2ZcAMTjAXZyuQOUJZEO1CO4jOTB6R9r7Zo/Lq.5dwFe8pbUO9/FLy',NULL,NULL,NULL),(247,'Eko Siswahto SST, M.SE','xsiswahto@bps.go.id','198504202008011003','Fungsi Statistik Produksi',5,'basic','xsiswahto',NULL,'$2y$10$5crcdl/KuFn2CzxG3bAVWeDEFCCvfTIB9pa0HcLXO3.uIIwKMtJ1e',NULL,NULL,NULL),(249,'Asim Saputra, SST, M.Ec.Dev.','asim@bps.go.id','197609271999011001','Kepala BPS Provinsi',5,'basic','asim',NULL,'$2y$10$VyrMIDoRh2O0UzM/00zyQuP/o8xQALzXwC7xTNmTg2QVX699b3qBK',NULL,NULL,NULL),(250,' Anton Tri Wijayanto, S.ST, M.Si.','antontw@bps.go.id','198001022002121003','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','Anton',NULL,'$2y$10$VrxwGqlr3drlgDKXOCxiWOwpTWKRLgncaqHJqiuL0I/qAAgLPW0IW',NULL,NULL,NULL),(251,'Dadan Sudarmadi, SST, M.Si.','dadan@bps.go.id','197310141995121001','Bagian Umum',5,'basic','dadan',NULL,'$2y$10$kxnuRtvQ2znKGpj2NzDf7ezzudRR05noL5AeKxwBxTF9kLBmgJLQG',NULL,NULL,NULL),(252,'Abdul Aziz Makhrus, S.Tr.Stat.','amakhrus@bps.go.id ','199607082019011003','Fungsi Statistik Sosial',5,'basic','aziz',NULL,'$2y$10$eEYYcn3cNfSypQN5fpIL4ePM5NlPwHnsmDO/CH9EF90yvi47/pXBa',NULL,NULL,NULL),(253,'Dina Atika Rahmawati, SST','dina.atika@bps.go.id','199601152018022001','Fungsi Statistik Sosial',5,'basic','dina',NULL,'$2y$10$QDuUXhvfkFSs/lR9PzCsL...lr.C.KWUZqkt./z6ItSUqtzm8PGJe',NULL,NULL,NULL),(254,'Zulfa Nur Fajri Ramadhani, S.Tr.Stat.','zulfanr@bps.go.id','199701292019012001','Fungsi Statistik Sosial',5,'basic','zulfa',NULL,'$2y$10$z1vfpAUc7bjMFpVPA1FfTeLGsu7AwtLy2htb0Qt3nSFAaI1xcV2hm',NULL,NULL,NULL),(255,'Salonica Oktaviani, SST','salonica.oktaviani@bps.go.id ','199410302018022001','Fungsi Statistik Sosial',5,'basic','salonica',NULL,'$2y$10$SkF1XX/EgBkabpxILMrbE.MpC8ODEE3QhTjbXeZslfS6kZ7.e.trS',NULL,NULL,NULL),(256,'Christian Leonardo Pratama Tamboto, S.Tr.Stat.','leonardo.pratama@bps.go.id','199708072019121001','Bagian Umum',5,'basic','christian',NULL,'$2y$10$Ce21FWAvpbeX7tfGtuGkkObtXOIcOVxXo1eIv6HBFD0dmXFEM328a',NULL,NULL,NULL),(257,'Untari Rahmawati, S.Tr.Stat.','untarirahma@bps.go.id','199603312019012001','Fungsi Neraca Wilayah dan Analisis Statistik',5,'basic','Untari',NULL,'$2y$10$0AoKdXrA3MXGE7/23qAEH.K68nfISx0Lfr6kPZSk8HUPfrEXk.1zK',NULL,NULL,NULL),(258,'I Nyoman Pande Suputra, SST','in.pande@bps.go.id','199504272018021002','Fungsi Statistik Produksi',5,'basic','Pande',NULL,'$2y$10$ok8heweZKlFoc4P72oWGHeTWPuWqmTUzvLTan3Ilz7lFdTa9oTKt6',NULL,NULL,NULL),(259,'Nabella Intan Karasta, S.Tr.Stat','nabella.intan@bps.go.id','196808281994012001','Fungsi Statistik Produksi',5,'basic','nabella',NULL,'$2y$10$v2d7tbUTUn3xisqF87cdweqduh2BR/1Nbl5tFj4TaYG0wj8JPlCmC',NULL,NULL,NULL),(260,'Yulius Wendi Triandaru SST','yulius.wendi@bps.go.id','199407252018021001','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','Yulius',NULL,'$2y$10$IY1HcgPuRsVvstEXiWBPCO8f1vF1Z7FDm9InCMGZXK0y.ZSRvrjw.',NULL,NULL,NULL),(261,'Nurul Hidayah S.Tr.Stat.','nurul.hidayah@bps.go.id','199704212019012001','Bagian Umum',5,'basic','ida',NULL,'$2y$10$X6kdU0rHDiVkuagLRyYWYulXDe6P4cyQnc4bhtKLoq.XkmFrfOPxK',NULL,NULL,NULL),(262,'Wisnu Triaji, SE','wisnu.triaji@bps.go.id','198702142009021002','Bagian Umum',5,'basic','wisnu.triaji',NULL,'$2y$10$RbMQkufm6beVBCV/jpEa7OXQQfOaZ2f2gS0eofwKhujtYGio97XZm',NULL,NULL,NULL),(266,'Irene Ruth Longkutoy SH','airin@bps.go.id','197403242006042000','Bagian Umum',5,'basic','irene',NULL,'$2y$10$16yRqjz0VMBxfVQ.foWRZ.YvVfoRnuB5B91Hp/vGjZKspdHLFNicS',NULL,NULL,NULL),(267,'Steven Kalvin Montolalu, SE','stevenmontolalu@bps.go.id','197904062003121000','Bagian Umum',5,'basic','steven',NULL,'$2y$10$CIggM.4KsSMFc1UHEjT2FOXQBPx/1srtVz.IF3O9d.AtDf2fuGgsW',NULL,NULL,NULL),(268,'Lazia Outenty Bimbangnaung','tenty@bps.go.id','198110000000000000','Bagian Umum',5,'basic','lazia',NULL,'$2y$10$UsfMc.OaYoEtyvvOHm00wO0nlBrTr5EyqVnD6GqWbDYdugsNVihLe',NULL,NULL,NULL),(269,'Olfiane Silfia Pelealu, SE','olfianesilfia pelealu@bps.go.id','197310042003122000','Fungsi Statistik Sosial',5,'basic','olfiane',NULL,'$2y$10$xBHEuQB/OrrQ0jqTvD3hD.2HUPrlmnnLj4ZYJcMbu0iptzAHaOn2K',NULL,NULL,NULL),(271,'Elrini Diane Wuisan, SE','elriniwuisan@bps.go.id','198210022010032000','Fungsi Statistik Distribusi',5,'basic','elrini',NULL,'$2y$10$YG9WBJzq5igTImCJrbVuGOlqFtLHBLxnEeegnp44oS.QP6KSNZ9F.',NULL,NULL,NULL),(272,'Vonny Joice Lalujan, SE','vonny@bps.go.id','196911011992022000','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','vonny',NULL,'$2y$10$fQDCpvGPiEkfeV4V3PtYJ.e0F70STcOoakx.8umhvqD4tOgpYSY4K',NULL,NULL,NULL),(273,'Dading, S.Si.','dading@bps.go.id','199112202019031000','Fungsi Statistik Distribusi',5,'basic','dading',NULL,'$2y$10$MjrdI8EnpKNjlG1ptWbciuo91Jnz.3H2uny/0eDBvgFIvjGwNmj0K',NULL,NULL,NULL),(274,'Muhammad Iqbal, S.Stat.','iqbal.muh@bps.go.id','199510132019031001','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','iqbal1',NULL,'$2y$10$BOVHR7MUyGPORtDZBDfLbuj8CHBgG9cvvyT.4CBKD8mEmk8ar9Lu2',NULL,NULL,NULL),(275,'Ponimin','ponim@bps.go.id','199810132021041000','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','Ponimin',NULL,'$2y$10$D8M4i/FUluU2a8khu05ND.Ms4nzqJHNjKhC9GRW3ZNMBaprlGpYni',NULL,NULL,NULL),(276,'Muhammad Rifqi Mubarak','rifqi.mubarak@bps.go.id','199901052021041000','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','Rifqi',NULL,'$2y$10$iLGCRpmYlu0ZdxYcHPMomOYZvIrk9hMGTdrAXoqDAaYEIlGukAp7W',NULL,NULL,NULL),(283,'Ririn Hidayati S.Si., MPP, MSE','ririnh@bps.go.id','197311031998032005','Fungsi Distribusi',5,'basic','ririnh',NULL,'$2y$10$efK62i/kYfkoLpn4SEsAdedHcEmFjgczUFY8YiaiNQ3cIRZKQyB1e',NULL,NULL,NULL),(284,'Sarjani Harini Martiningsih S.Si','rhiniechay@bps.go.id','198803062011012015','Seksi Statistik Pertambangan, Energi dan Konstruksi',5,'basic','rini123',NULL,'$2y$10$LZwNgB4xx7EaV0ARZvmMIe.ekj4t72kwgMMteZ.NK2cjv5ZzbrXOC',NULL,NULL,NULL),(287,'Mustika Aridya Arum A.Md.Kb.N.','mustika.arum@bps.go.id','200104112022012001','Bagian Tata Usaha',5,'basic','mustika',NULL,'$2y$10$RAgJ5uiYm7hx9TM31sxRfulCfagNKU3yjRpVVLkpkrYu/JjWA2Vzi',NULL,NULL,NULL),(288,'Ratriani Retno Wardani S.Tr.Stat.','ratriani.wardani@bps.go.id','199903202022012004','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','ratriani',NULL,'$2y$10$eclXs8xxiq/AdnV8P8jBnOh7i/64Kf0kYFlEXh9aq018opCpPtpZK',NULL,NULL,NULL),(289,'Daniel Tri Hemawan SE','daniel.tri@bps.go.id','197610102006041003','Fungsi Neraca Wilayah dan Analisis',5,'basic','daniel_tri',NULL,'$2y$10$rQV9B4Oe0xl4ByXFDk.BBuiMOVR5lymi7pn/9kVKqiogH3i08cdNS',NULL,NULL,NULL),(290,'Yola Christhy Larinse SST','yola.larinse@bps.go.id','199211072014122001','Fungsi Statistik Produksi',5,'basic','yola',NULL,'$2y$10$JDFz3l0gi7Vj9Y9BJ4NVl.DymC0oHa3N1WZEhGNAt0Yio.rd1pdaS',NULL,NULL,NULL),(291,'Risky SST','risky@bps.go.id','199405192016021001','Fungsi Statistik Sosial',5,'basic','risky',NULL,'$2y$10$zd0DPQJDVR.RQOYsHjLWd.Mt.MxWPfuBg413JIzgVbAumEoTjHwlu',NULL,NULL,NULL),(292,'Zaenuri Putro Utomo','zaenuri@bps.go.id','198101262011011005','Fungsi Integrasi Pengolahan dan Diseminasi Statistik',5,'basic','zaenuri',NULL,'$2y$10$h3s.oFI2w/abO0tbgFsK1uVXErxOyDPe1LeGseVhUGvOOnGZD6YGS',NULL,NULL,NULL),(293,'Herman Tinungki SE','herman.tinungki@bps.go.id','196703311986031002','Bagian Umum',5,'basic','herman',NULL,'$2y$10$l9e7ZRcb0hsFOkhbGZ8GkO2SfEefkdnxiqOwp8TqT83JLkhahPyLi',NULL,NULL,NULL),(294,'Nurul Hayati Unonongo SST','nurul.unonongo@bps.go.id','199311112017012002','Bagian Umum',5,'basic','nurul.unonongo',NULL,'$2y$10$o3DsIrKRpw1SdXnyK0W7HuGPakLKNBk6k1XYDMsQZ0GFtCYYeY6/W',NULL,NULL,NULL),(295,'Friska Patricia Raintung, SE','friska.patricia@bps.go.id','198912292022032007','Bagian Umum',5,'basic','friska.patricia',NULL,'$2y$10$WjvKjtFgZX.WgyV21S1vF.hR5LJ.LLUGHqH2yDjwCIA3baf3daNza',NULL,NULL,NULL),(296,'Nova Nurviana SST, M.T.','nova.nurviana@bps.go.id','198911222013112001','Statistik Sosial',5,'basic','nova.nurviana',NULL,'$2y$10$bwsm.6YDvSgBF46NBJr9X.KJW5In0hLK9fT7OhKAWc7xzr5p9ArTu',NULL,NULL,NULL),(298,'ponim Ponimin','user@bps.go.id','199','IPDS',8,'Super Admin','adminsuper',NULL,'$2y$10$h77SI0N.GYAfTa1z597A2O0Cu3hnL3hArHBwyLZK69AGQ.SsRJr9G',NULL,'2024-02-05 03:48:33','2024-02-05 03:48:33'),(299,'Kevin Pandoh 1','kevin1@gmail.com','123123123','IPDS',4,'basic','kevin1',NULL,'$2y$10$rW5DelNUWloLQCdyxFP2DuQaA5i2D5wsTRuvnmy.lUjpJFTYVs4t2',NULL,'2024-05-15 19:06:58','2024-05-15 19:06:58'),(300,'Admin','admin@admin.com','123123','Admin',4,'Super Admin','admin',NULL,'$2y$10$5Ib9MC/eeP.fOrXJrYEeUu6SDNZ3Snlg5l8h37uKl70xQgjzcS9Fm',NULL,'2024-05-15 19:33:46','2024-05-15 19:33:46'),(301,'Mesiasi Anjelika Supit','mesiasisupit@gmail.com','32320038','Mahasiswa',1,'basic','mesiasi',NULL,'$2y$10$dmnjgTZYYOaEMu.6P2nbFOzTB6npmP7EkdpA0RfiY9AcP6R5/MvYS',NULL,'2024-05-15 19:38:50','2024-05-15 19:38:50'),(302,'Anjelika (Admin)','sashi@gmail.com','21210052','Admin',3,'admin','sashi',NULL,'$2y$10$lY57QYaRzY1B.L0jHjKJaOtUoIq3OtLKmk5VwOGzILXsUCJERy0Xq',NULL,'2024-05-15 19:40:06','2024-05-15 19:40:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 11:55:53
