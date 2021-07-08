-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: nit_project
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `introduce` longtext,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'dsdsd','VietNam','Casio'),(2,'hehe','Phap','Gari'),(3,'ddddd','Anh','Rolex'),(4,'dsds','Italia','Hublot');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'2021-06-27 10:45:36',19,NULL,'trang',1),(2,'2021-06-27 11:05:48',19,799000,'trang',1),(3,'2021-06-27 11:27:10',19,10874000,'trang',1),(4,'2021-06-28 09:09:58',19,3797000,'trang',1),(5,'2021-06-28 09:12:03',19,599000,'trang',1),(6,'2021-06-28 10:46:51',19,7990000,'trang',1),(7,'2021-06-28 11:50:52',19,5391000,'trang',1),(8,'2021-06-28 12:06:10',19,900000,'trang',1),(9,'2021-06-28 13:29:12',19,799000,'trang',1),(10,'2021-06-28 13:32:03',19,12784000,'trang',1),(11,'2021-06-28 14:01:41',19,6380000,'trang',1),(12,'2021-06-28 23:09:24',19,16797000,'trang',1),(13,'2021-06-28 23:44:40',19,7388000,'trang',1),(14,'2021-06-28 23:47:35',19,7990000,'trang',1),(15,'2021-06-29 09:08:14',19,7787000,'trang',1),(16,'2021-06-30 21:26:33',19,599000,'trang',1),(17,'2021-07-01 00:39:58',21,799000,'tien',1),(18,'2021-07-01 00:44:01',20,900000,'tien1',0),(19,'2021-07-04 20:04:57',22,6997000,'khanh',1),(20,'2021-07-05 11:26:21',22,2999000,'khanh',1),(21,'2021-07-06 18:00:10',19,6177000,'trang',1),(22,'2021-07-06 23:28:47',19,12076000,'trang',1),(23,'2021-07-07 11:31:00',22,7600000,'khanh',1),(24,'2021-07-07 11:34:26',22,1308000,'khanh',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_watch`
--

DROP TABLE IF EXISTS `cart_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_watch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` bigint DEFAULT NULL,
  `id_cart` int DEFAULT NULL,
  `id_watch` int DEFAULT NULL,
  `name_watch` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_watch`
--

LOCK TABLES `cart_watch` WRITE;
/*!40000 ALTER TABLE `cart_watch` DISABLE KEYS */;
INSERT INTO `cart_watch` VALUES (1,1,2,7,'MTP-V008D-7BUDF',799000),(2,3,3,8,'LA-670WD-1UDF',900000),(3,1,3,7,'MTP-V008D-7BUDF',799000),(4,2,3,6,'MTP-V001GL-7BUDF',599000),(5,2,3,5,'MTP-V005L-1AUDF',599000),(6,1,3,3,'LTP-1096Q-9A',599000),(7,1,3,2,'MTP-V001L-7BUDF',580000),(8,1,3,1,'BABY-G BGA-150ST-1A',3800000),(9,2,4,8,'LA-670WD-1UDF',900000),(10,1,4,7,'MTP-V008D-7BUDF',799000),(11,1,4,6,'MTP-V001GL-7BUDF',599000),(12,1,4,5,'MTP-V005L-1AUDF',599000),(45,1,9,7,'MTP-V008D-7BUDF',799000),(42,9,7,6,'MTP-V001GL-7BUDF',599000),(43,1,8,8,'LA-670WD-1UDF',900000),(29,1,5,5,'MTP-V005L-1AUDF',599000),(40,10,6,7,'MTP-V008D-7BUDF',799000),(46,16,10,7,'MTP-V008D-7BUDF',799000),(51,11,11,2,'MTP-V001L-7BUDF',580000),(52,10,12,2,'MTP-V001L-7BUDF',580000),(53,10,12,8,'LA-670WD-1UDF',900000),(54,1,12,7,'MTP-V008D-7BUDF',799000),(55,1,12,6,'MTP-V001GL-7BUDF',599000),(56,1,12,5,'MTP-V005L-1AUDF',599000),(57,1,13,7,'MTP-V008D-7BUDF',799000),(58,1,13,6,'MTP-V001GL-7BUDF',599000),(59,10,13,5,'MTP-V005L-1AUDF',599000),(60,10,14,7,'MTP-V008D-7BUDF',799000),(61,13,15,6,'MTP-V001GL-7BUDF',599000),(62,1,16,4,'MTP-V005L-2BUDF',599000),(64,1,17,7,'MTP-V008D-7BUDF',799000),(65,1,18,8,'LA-670WD-1UDF',900000),(66,2,19,12,'Edifice EQS-930BL-2AVUDF',1999000),(67,1,19,13,'G-Shock GA-700DBR-4ADR',2999000),(69,1,20,13,'G-Shock GA-700DBR-4ADR',2999000),(70,1,21,1,'BABY-G BGA-150ST',3800000),(71,1,21,2,'MTP-V001L-7BUDF',580000),(72,1,21,3,'LTP-1096Q-9A',599000),(73,1,21,4,'MTP-V005L-2BUDF',599000),(74,1,21,5,'MTP-V005L-1AUDF',599000),(75,3,22,12,'Edifice EQS-930BL-2AVUDF',1999000),(76,1,22,1,'BABY-G BGA-150ST',3800000),(77,1,22,2,'MTP-V001L-7BUDF',580000),(78,1,22,8,'LA-670WD-1UDF',900000),(79,1,22,7,'MTP-V008D-7BUDF',799000),(80,2,23,1,'BABY-G BGA-150ST',3800000),(81,1,24,11,'AE-1200WHD-1AVDF',1308000);
/*!40000 ALTER TABLE `cart_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `id_watch` int DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (27,'2021-07-05 02:21:51',1,'/images/product/d385412c-ce0d-4f9f-9bfd-f389d6153a11.png'),(2,NULL,5,'https://product.hstatic.net/1000388227/product/mtp-v005l-1audf_cbb362d6e67d42028fd5f971007a3f71_grande.png'),(3,NULL,4,'https://product.hstatic.net/1000388227/product/mtp_v005l_2budf_67db760915ab457b913b1b3664380ee1_c2421579a51b488cb6e46ef4d7e645df_grande.png'),(29,'2021-07-05 09:26:48',3,'/images/product/4f3a25d5-f5dc-43bb-960b-bdfaaaa95110.png'),(35,'2021-07-05 11:25:36',2,'/images/product/1d4e6ec3-597f-4e27-8cca-bef7b12a76a5.jpg'),(6,NULL,6,'https://product.hstatic.net/1000388227/product/mtp-v001gl-7budf_f70302dde92f425ea124922b659d1e1b_grande.png'),(7,NULL,7,'https://product.hstatic.net/1000388227/product/mtp-v008d-7budf_475fa1fcb1d848c8af6cbbf5c9c6964a_grande.png'),(8,NULL,8,'https://product.hstatic.net/1000388227/product/la-670wd-1udf_f3cf7eca0f704d1b92d1570d834107a9_grande.png'),(28,'2021-07-05 02:24:46',2,'/images/product/0c431a91-1983-41dd-8e08-ed01bd0dae38.png'),(14,'2021-07-04 19:53:14',12,'/images/product/8d76676e-56e5-45a7-8aa7-76e2f5548625.png'),(13,'2021-07-04 19:46:26',11,'/images/product/0f20786d-5bf1-43a5-83c1-1d435a180ce2.png'),(40,'2021-07-07 10:54:04',13,'/uploads/product/98822280-34d4-4e81-8cb4-8b4467c393d1.jpg'),(41,'2021-07-07 10:56:03',9,'/uploads/product/429bc08a-bcf9-405e-9a08-8086a92d1bc2.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_watch`
--

DROP TABLE IF EXISTS `order_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_watch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` bigint DEFAULT NULL,
  `id_order` int DEFAULT NULL,
  `id_watch` int DEFAULT NULL,
  `name_watch` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_watch`
--

LOCK TABLES `order_watch` WRITE;
/*!40000 ALTER TABLE `order_watch` DISABLE KEYS */;
INSERT INTO `order_watch` VALUES (1,3,1,8,'LA-670WD-1UDF',900000),(2,1,1,7,'MTP-V008D-7BUDF',799000),(3,2,1,6,'MTP-V001GL-7BUDF',599000),(4,2,1,5,'MTP-V005L-1AUDF',599000),(5,1,1,3,'LTP-1096Q-9A',599000),(6,1,1,2,'MTP-V001L-7BUDF',580000),(7,1,1,1,'BABY-G BGA-150ST-1A',3800000),(8,2,2,8,'LA-670WD-1UDF',900000),(9,1,2,7,'MTP-V008D-7BUDF',799000),(10,1,2,6,'MTP-V001GL-7BUDF',599000),(11,1,2,5,'MTP-V005L-1AUDF',599000),(12,1,3,5,'MTP-V005L-1AUDF',599000),(13,10,4,7,'MTP-V008D-7BUDF',799000),(14,9,5,6,'MTP-V001GL-7BUDF',599000),(15,1,6,8,'LA-670WD-1UDF',900000),(16,1,7,7,'MTP-V008D-7BUDF',799000),(17,16,8,7,'MTP-V008D-7BUDF',799000),(18,11,9,2,'MTP-V001L-7BUDF',580000),(19,10,10,2,'MTP-V001L-7BUDF',580000),(20,10,10,8,'LA-670WD-1UDF',900000),(21,1,10,7,'MTP-V008D-7BUDF',799000),(22,1,10,6,'MTP-V001GL-7BUDF',599000),(23,1,10,5,'MTP-V005L-1AUDF',599000),(24,1,11,7,'MTP-V008D-7BUDF',799000),(25,1,11,6,'MTP-V001GL-7BUDF',599000),(26,10,11,5,'MTP-V005L-1AUDF',599000),(27,10,12,7,'MTP-V008D-7BUDF',799000),(28,13,13,6,'MTP-V001GL-7BUDF',599000),(29,1,14,4,'MTP-V005L-2BUDF',599000),(30,1,15,7,'MTP-V008D-7BUDF',799000),(31,2,16,12,'Edifice EQS-930BL-2AVUDF',1999000),(32,1,16,13,'G-Shock GA-700DBR-4ADR',2999000),(33,1,17,1,'BABY-G BGA-150ST',3800000),(34,1,17,2,'MTP-V001L-7BUDF',580000),(35,1,17,3,'LTP-1096Q-9A',599000),(36,1,17,4,'MTP-V005L-2BUDF',599000),(37,1,17,5,'MTP-V005L-1AUDF',599000),(38,3,18,12,'Edifice EQS-930BL-2AVUDF',1999000),(39,1,18,1,'BABY-G BGA-150ST',3800000),(40,1,18,2,'MTP-V001L-7BUDF',580000),(41,1,18,8,'LA-670WD-1UDF',900000),(42,1,18,7,'MTP-V008D-7BUDF',799000),(43,1,19,13,'G-Shock GA-700DBR-4ADR',2999000),(44,2,20,1,'BABY-G BGA-150ST',3800000),(45,1,21,11,'AE-1200WHD-1AVDF',1308000);
/*!40000 ALTER TABLE `order_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `ship_fee` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  `total_payment` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'fdfdffd',19,'2021-06-27 22:24:33','43443443','trang',20000,2,10894000,10874000,'hic'),(2,'Nam Đàn',19,'2021-06-28 09:11:07','43443443','trang',20000,3,3817000,3797000,'Đoàn Thị Trang'),(3,'Nam Cát',19,'2021-06-28 10:23:19','43443443','trangchutchut',20000,3,619000,599000,'Đoàn Thị Trang'),(4,'fdfdffd',19,'2021-06-28 11:36:19','43443443','trang',20000,3,8010000,7990000,'hic'),(5,'Nghê An',19,'2021-06-28 11:54:20','54545565678','trangchut chut chut',20000,1,5411000,5391000,'Đoàn Thị Huyền Trang'),(6,'fdfdffd',19,'2021-06-28 12:06:16','43443443','trang',20000,1,920000,900000,'hic'),(7,'Hai DUong',19,'2021-06-28 13:30:16','0399726789','tien',20000,0,819000,799000,'Nguyen Van Tien'),(8,'ha noi',19,'2021-06-28 13:32:23','43443443','trang',20000,1,12804000,12784000,'trangggg'),(9,'Nghệ An',19,'2021-06-28 22:52:49','0345678922','trang',20000,3,6400000,6380000,'Đoàn Thị Huyền Trang'),(12,'Nghệ An',19,'2021-06-28 23:47:50','0345678922','trang',20000,1,8010000,7990000,'Đoàn Thị Huyền Trang'),(13,'Nghệ An',19,'2021-06-29 09:08:25','0345678922','trang',20000,1,7807000,7787000,'Đoàn Thị Huyền Trang'),(14,'Nghệ An',19,'2021-06-30 21:26:38','0345678922','trang',20000,0,619000,599000,'Đoàn Thị Huyền Trang'),(15,'hahaha',21,'2021-07-01 00:40:18','0973738','tien',20000,0,819000,799000,'tien'),(16,'Chùa Hương',22,'2021-07-05 11:23:23','0999989899','khanh',20000,0,7017000,6997000,'Phạm Ngọc Khánh'),(17,'Nghệ An',19,'2021-07-06 18:01:14','0345678922','trang',20000,1,6197000,6177000,'Đoàn Thị Huyền Trang'),(18,'Nghệ An',19,'2021-07-07 10:30:30','0345678922','trang',20000,0,12096000,12076000,'Đoàn Thị Huyền Trang'),(19,'Chùa Hương',22,'2021-07-07 11:25:55','0999989899','khanh',20000,0,3019000,2999000,'Phạm Ngọc Khánh'),(20,'Chùa Hương',22,'2021-07-07 11:31:18','0999989899','khanh',20000,0,7620000,7600000,'Phạm Ngọc Khánh'),(21,'Chùa Hương',22,'2021-07-07 11:35:10','0999989899','khanh',20000,0,1328000,1308000,'Phạm Ngọc Khánh');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Tân Triều- Hà Nội',0,NULL,'2021-06-26 14:42:07','aaasassa',NULL,NULL,NULL,'admin','0399617063'),(3,'Tân Triều- Hà Nội',0,NULL,'2021-06-26 14:43:31','tien',NULL,NULL,NULL,'hi','0399617063'),(4,'Tân Triều- Hà Nội',0,NULL,'2021-06-26 14:44:38','tien123',NULL,NULL,'$2a$12$tdnUtUBafdtnJtY1/4t/mepQY1Q4noCeejxLM7CSRVDFUFkih.vWu','tienhehe','0399617063'),(5,'quang ninh',0,NULL,'2021-06-26 18:59:58','luan',NULL,NULL,'$2a$12$i1/74w0.JjA8gvEqzCM3ieLxu9StkU0HcKbUNsN5r.7066h/J1/RK','luan','0999999'),(6,'ehhe',0,NULL,'2021-06-26 19:05:28','hehehe',NULL,NULL,'$2a$12$6YqdOaAMxIusGCvig5TguOiXE5ekZ515XXG5dAgQ3oKJS8i6gfdJO','heheh','3094984093'),(7,'ha noi',0,NULL,'2021-06-26 19:08:08','òdkflkdnlknf',NULL,NULL,'$2a$12$UUYLVHx3APbv74WGim8hVuLMybJY91brljR9dC5sE.jJt3nCDD38q','uuu','4839483049340'),(8,'Chua huong',0,NULL,'2021-06-26 20:11:18','tuananh',NULL,NULL,'$2a$12$RCEMr.SvfQ/V0DwMXg5MCegIpxXFjNvRYd4tnarDXWnuH3exLQoI.','tuananh','03748718399'),(19,'Nghệ An',22,NULL,'2021-06-26 21:50:12','Đoàn Thị Huyền Trang',19,'2021-07-07 10:32:28','$2a$12$dAfUhhbj0eXhe46ENlXJLe0NFfG7vJEp4ymJ3aLxpl/k.a.F0ZyMG','trang','0345678922'),(20,'d;mdm',0,NULL,'2021-06-26 21:54:29','tin',NULL,NULL,'$2a$12$JJGWd.DyFDyDv9M.k2EPQ.ncoGUUp1mx1rgczwPqOHN.W8BCb2qSS','tien1','322332'),(22,'Chùa Hương',0,NULL,'2021-07-01 19:46:27','Phạm Ngọc Khánh',NULL,NULL,'$2a$12$KTDpl96yhTNMMblmf65vvewSxd7JaEYaPmRh424xJMolIeMklIUdq','khanh','0999989899');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id_user` int NOT NULL,
  `id_role` int NOT NULL,
  KEY `FK2aam9nt2tv8vcfymi3jo9c314` (`id_role`),
  KEY `FKfhxaael2m459kbk8lv8smr5iv` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(22,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `description` longtext,
  `feature` longtext,
  `id_brand` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `reduced_price` double DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch`
--

LOCK TABLES `watch` WRITE;
/*!40000 ALTER TABLE `watch` DISABLE KEYS */;
INSERT INTO `watch` VALUES (1,'CS001',NULL,NULL,'Dây đeo bằng nhựa\nNeobrite\nChống va đập\nMặt kính khoáng\nKhả năng chống nước ở độ sâu 100 mét','Được tạo ra dựa trên khái niệm sao băng rực sáng, mặt của những chiếc đồng hồ này thể hiện hình ảnh sao băng trên bầu trời đêm.\n\nPha lê từ Swarovski® tại vị trí 9 giờ cũng làm nổi bật mặt đồng hồ.\n\nMẫu cơ sở cho dòng này là chiếc BGA-150 mặt lớn và thiết kế đơn giản.\n\nCó ba lựa chọn màu sắc cho dòng này: màu đen của bầu trời đêm, màu hồng pastel nhẹ nhàng và màu trắng tinh khôi.\n\nÁnh sáng lấp lánh của pha lê tạo ra cảm giác sang trọng vô song.\n\nCó thể nhận dạng bộ phận quý giá này bằng nhãn “Được trang trí bằng pha lê từ Swarovski®”, nhãn này có vai trò như chứng nhận hàng chính hãng. Nhãn này đánh dấu sản phẩm được chế tạo bằng pha lê Swarovski® chính hãng.',1,22,'2021-07-05 02:21:58','BABY-G BGA-150ST',3800000,NULL,3800000,1),(2,'7BUDF',NULL,NULL,'Dây đeo bằng da\nMặt kính khoáng\nChống nước\nGiờ hiện hành thông thường\nĐồng hồ kim: 3 kim (giờ, phút, giây)\nĐộ chính xác: ±20 giây một tháng\nTuổi thọ pin xấp xỉ: 3 năm với pin SR626SW','Các tính năng\n• Chống nước\n• Thiết kế đơn giản, dễ sử dụng',1,22,'2021-07-06 17:37:13','MTP-V001L-7BUDF',600000,NULL,580000,1),(3,'1096Q',NULL,NULL,'Đặc điểm kỹ thuật\n\nDây đeo bằng da\nMặt kính khoáng\nChống nước\nGiờ hiện hành thông thường\nĐồng hồ kim: 3 kim (giờ, phút, giây), 3 mặt số (24 giờ, ngày, thứ)\nĐộ chính xác: ±20 giây một tháng\nTuổi thọ pin xấp xỉ: 3 năm với pin SR920SW','',1,22,'2021-07-05 09:26:48','LTP-1096Q-9A',667000,NULL,599000,1),(4,'V005L',NULL,NULL,NULL,NULL,1,NULL,NULL,'MTP-V005L-2BUDF',691000,NULL,599000,1),(5,'V005L',NULL,NULL,NULL,NULL,1,NULL,NULL,'MTP-V005L-1AUDF',691000,NULL,599000,1),(6,'V001GL',NULL,NULL,'Các tính năng',NULL,1,NULL,NULL,'MTP-V001GL-7BUDF',691000,NULL,599000,1),(7,'V008D',NULL,NULL,NULL,NULL,1,NULL,NULL,'MTP-V008D-7BUDF',888000,NULL,799000,1),(8,'670WD',NULL,NULL,NULL,NULL,1,NULL,NULL,'LA-670WD-1UDF',914000,NULL,900000,1),(9,'DG41C6SMCVD',NULL,NULL,'Ở mọi khía cạnh, từ chất liệu hay thiết kế, ta cũng có thể nhìn ra Bulgari Diagono Magnesium là một chiếc đồng hồ thể thao và cá tính. Không chỉ là 1, bộ vỏ của mẫu đồng hồ Bulgari Diagono Magnesium 41mm 102427 còn có tới 4 loại vật liệu được sử dụng. Phần vỏ giữa làm từ Magie (Magnesium) có đặc tính rất nhẹ và cứng, đảm bảo khả năng chống va đập cho chiếc đồng hồ. Vành bezel đồng hồ thì được làm từ gốm ceramic đen cùng những cái được khắc bên trên là biểu tượng riêng của thương hiệu. Chỉ riêng mình gốm và magie đã đủ để đưa Diagono Magnesium 41mm gia nhập vào binh đoàn đồng hồ thể thao công nghệ cao, nhưng rõ ràng Bvlgari lại tiếp tục đưa chiếc đồng hồ lên một tầm cao mới.',NULL,2,NULL,NULL,'Đồng Hồ BVLGARI DIAGONO MAGNESIUM',75000000,NULL,69999000,1),(11,'CS002',22,'2021-07-04 19:46:04','Mặt kính nhựaKhả năng chống nước ở độ sâu 100 métVật liệu vỏ / gờ: NhựaDây đeo bằng thép không gỉChốt gập baĐèn LEDThời lượng chiếu sáng có thể lựa...','Lịch hoàn toàn tự động (đến năm 2099)\nĐịnh dạng giờ 12/24\nBật/tắt âm nhấn nút\nGiờ hiện hành thông thường: Giờ, phút, giây, chiều, tháng, ngày, thứ\nĐộ chính xác: ±30 giây một tháng\nKích thước vỏ: 45 × 42,1 × 12,5 mm',1,NULL,NULL,'AE-1200WHD-1AVDF',1308000,NULL,1308000,1),(12,'CS003',22,'2021-07-04 19:53:14','Vật liệu vỏ / vành bezel: Thép không gỉ\nDây đeo bằng da\nMặt kính khoáng\nMặt số sợi cacbon\nNắp sau khóa bằng vít\nGờ mạ ion màu lam\nKhả năng chống nước ở độ sâu 100 mét\nChạy bằng năng lượng mặt trời\nĐồng hồ bấm giờ 1 giây\nKhả năng đo: 9\'59\nChế độ đo: Thời gian chạy, thời gian về đích thứ nhất - thứ hai\nChỉ báo mức pin\nHiển thị ngày\nGiờ hiện hành thông thường\nĐồng hồ kim: 3 kim (giờ, phút, giây),\n3 mặt số (24 giờ, phút bấm giờ, giây bấm giờ)\nĐộ chính xác: ±20 giây một tháng\nThời gian hoạt động từ khi sạc đầy cho đến khi các kim dừng: Xấp xỉ 5 tháng','Đồng hồ ghi thời gian chạy bằng năng lượng mặt trời mới này có mặt số sợi carbon tượng trưng cho chủ đề đua xe thể thao của dòng sản phẩm EDIFICE. Màu sắc dễ nhìn của kim giây là kết quả của phản hồi từ các kỹ sư đua xe.\nCông nghệ năng lượng mặt trời phân tán và che chắn ánh sáng nguyên bản của CASIO giúp bạn có thể tạo ra đủ năng lượng chỉ bằng cách sử dụng ánh sáng đi qua ba mặt số nhỏ.\nPin được sạc đầy bằng cách tiếp xúc với ánh sáng cung cấp năng lượng cho các hoạt động thông thường trong năm tháng.',1,NULL,NULL,'Edifice EQS-930BL-2AVUDF',3000000,NULL,1999000,1),(13,'4ADR',22,'2021-07-04 20:02:30','Vật liệu vỏ / vành bezel: Nhựa\nDây đeo bằng nhựa\nChống va đập\nMặt kính khoáng\nChống nước ở độ sâu 200 mét\nĐèn LED (Chiếu sáng cực mạnh)','Mẫu mới này kết hợp phong cách miền viễn đông và phong cách đường phố. Mẫu cơ bản là chiếc đồng hồ kim-số GA-700 mạnh mẽ với thiết kế mang màu sắc phương Đông là đỏ và xanh lá.\nToàn bộ màu đỏ của GA-700DBR tương phản với màu đỏ và xanh lá lắng đọng hơi nước của vạch giờ và mặt số. Ngoài ra, vòng dây đeo bằng kim loại của mẫu GA-700DBR được khắc họa tiết sấm sét truyền thống.\nMẫu tuyệt đẹp trong dòng sản phẩm này kết hợp đầy nghệ thuật các chủ đề Á Đông cổ đại với công nghệ hiển thị giờ hiện hành hiện đại.',1,22,'2021-07-07 10:54:04','G-Shock GA-700DBR-4ADR',4000000,NULL,2999000,1);
/*!40000 ALTER TABLE `watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_watch`
--

DROP TABLE IF EXISTS `wishlist_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_watch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_watch` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_watch`
--

LOCK TABLES `wishlist_watch` WRITE;
/*!40000 ALTER TABLE `wishlist_watch` DISABLE KEYS */;
INSERT INTO `wishlist_watch` VALUES (1,19,1),(2,19,2),(3,19,3),(10,19,4),(5,19,5),(9,19,6),(11,21,9),(12,21,8),(13,22,1),(14,22,13),(15,19,12),(16,19,11),(17,19,13),(18,19,7),(19,19,9);
/*!40000 ALTER TABLE `wishlist_watch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-07 11:58:12
