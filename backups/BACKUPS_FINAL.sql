-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: loan_manager
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `municipality` varchar(255) NOT NULL,
  `neighborhood` varchar(255) NOT NULL,
  `avenue` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Bogotá','Chapinero','Avenida Caracas','Calle 72','Oficina principal'),(2,'Medellín','El Poblado','Avenida Las Vegas','Calle 10','Sucursal Medellín'),(3,'Cali','San Fernando','Carrera 36','Calle 5','Sucursal Cali');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `tabla_name` varchar(255) NOT NULL,
  `record_id` varchar(255) NOT NULL,
  `old_value` text,
  `new_value` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address_id` int NOT NULL,
  `legal_status_id` int NOT NULL,
  `nit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  KEY `legal_status_id` (`legal_status_id`),
  CONSTRAINT `business_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `business_ibfk_2` FOREIGN KEY (`legal_status_id`) REFERENCES `legal_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_schedule`
--

DROP TABLE IF EXISTS `collection_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collector_id` int NOT NULL,
  `loan_id` int NOT NULL,
  `schedule_date` date NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collector_id` (`collector_id`),
  KEY `loan_id` (`loan_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `collection_schedule_ibfk_1` FOREIGN KEY (`collector_id`) REFERENCES `user` (`id`),
  CONSTRAINT `collection_schedule_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`id`),
  CONSTRAINT `collection_schedule_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `collection_schedule_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_schedule`
--

LOCK TABLES `collection_schedule` WRITE;
/*!40000 ALTER TABLE `collection_schedule` DISABLE KEYS */;
INSERT INTO `collection_schedule` VALUES (1,2,1,'2024-01-15',1),(2,2,2,'2024-02-15',2);
/*!40000 ALTER TABLE `collection_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_schedule_status`
--

DROP TABLE IF EXISTS `collection_schedule_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_schedule_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_schedule_status`
--

LOCK TABLES `collection_schedule_status` WRITE;
/*!40000 ALTER TABLE `collection_schedule_status` DISABLE KEYS */;
INSERT INTO `collection_schedule_status` VALUES (1,'Programado'),(2,'Completado'),(3,'Cancelado');
/*!40000 ALTER TABLE `collection_schedule_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt_summary`
--

DROP TABLE IF EXISTS `debt_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `total_debt` decimal(10,2) NOT NULL,
  `last_payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `debt_summary_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt_summary`
--

LOCK TABLES `debt_summary` WRITE;
/*!40000 ALTER TABLE `debt_summary` DISABLE KEYS */;
INSERT INTO `debt_summary` VALUES (1,1,500000.00,'2024-03-01'),(2,2,800000.00,NULL);
/*!40000 ALTER TABLE `debt_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_report`
--

DROP TABLE IF EXISTS `financial_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_loans` decimal(15,2) NOT NULL,
  `total_payments` decimal(15,2) NOT NULL,
  `net_income` decimal(15,2) GENERATED ALWAYS AS ((`total_payments` - `total_loans`)) STORED,
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_report`
--

LOCK TABLES `financial_report` WRITE;
/*!40000 ALTER TABLE `financial_report` DISABLE KEYS */;
INSERT INTO `financial_report` (`id`, `total_loans`, `total_payments`, `report_date`) VALUES (1,1300000.00,500000.00,'2024-12-31');
/*!40000 ALTER TABLE `financial_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantee`
--

DROP TABLE IF EXISTS `guarantee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guarantee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int NOT NULL,
  `type_id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `estimated_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `guarantee_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`id`),
  CONSTRAINT `guarantee_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `guarantee_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantee`
--

LOCK TABLES `guarantee` WRITE;
/*!40000 ALTER TABLE `guarantee` DISABLE KEYS */;
INSERT INTO `guarantee` VALUES (1,1,1,'Apartamento en Bogotá',99999999.99),(2,2,2,'Automóvil Chevrolet Spark',30000000.00);
/*!40000 ALTER TABLE `guarantee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantee_type`
--

DROP TABLE IF EXISTS `guarantee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guarantee_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantee_type`
--

LOCK TABLES `guarantee_type` WRITE;
/*!40000 ALTER TABLE `guarantee_type` DISABLE KEYS */;
INSERT INTO `guarantee_type` VALUES (1,'Inmueble'),(2,'Vehículo'),(3,'Otros');
/*!40000 ALTER TABLE `guarantee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_status`
--

DROP TABLE IF EXISTS `legal_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `legal_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_status`
--

LOCK TABLES `legal_status` WRITE;
/*!40000 ALTER TABLE `legal_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `guarantor_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `interest` decimal(5,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `payment_frequency_id` int NOT NULL,
  `origin_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `type` enum('Original','Refinanced') NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `guarantor_id` (`guarantor_id`),
  KEY `origin_id` (`origin_id`),
  KEY `payment_frequency_id` (`payment_frequency_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`guarantor_id`) REFERENCES `user` (`id`),
  CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`origin_id`) REFERENCES `loan` (`id`),
  CONSTRAINT `loan_ibfk_4` FOREIGN KEY (`payment_frequency_id`) REFERENCES `payment_frequency` (`id`),
  CONSTRAINT `loan_ibfk_5` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `loan_chk_1` CHECK ((`amount` > 0)),
  CONSTRAINT `loan_chk_2` CHECK ((`interest` between 0 and 20))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,1,3,500000.00,10.00,'2024-01-01','2024-06-30',3,NULL,1,'Original','2024-12-06 21:33:28',NULL),(2,2,NULL,800000.00,15.00,'2024-02-01','2024-07-31',2,NULL,2,'Original','2024-12-06 21:33:28',NULL);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `viewed` tinyint(1) DEFAULT '0',
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `notification_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_type`
--

DROP TABLE IF EXISTS `notification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_type`
--

LOCK TABLES `notification_type` WRITE;
/*!40000 ALTER TABLE `notification_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overdue_report`
--

DROP TABLE IF EXISTS `overdue_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overdue_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int NOT NULL,
  `overdue_days` int NOT NULL,
  `overdue_amount` decimal(10,2) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `overdue_report_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overdue_report`
--

LOCK TABLES `overdue_report` WRITE;
/*!40000 ALTER TABLE `overdue_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `overdue_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `method_id` int NOT NULL,
  `status_id` int NOT NULL,
  `loan_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`),
  KEY `status_id` (`status_id`),
  KEY `method_id` (`method_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `payment_status` (`id`),
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `payment_chk_1` CHECK ((`amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,200000.00,'2024-03-01',1,2,1),(2,300000.00,'2024-04-01',2,1,1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_collector`
--

DROP TABLE IF EXISTS `payment_collector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_collector` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `collector_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_id` (`payment_id`),
  KEY `collector_id` (`collector_id`),
  CONSTRAINT `payment_collector_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `payment_collector_ibfk_2` FOREIGN KEY (`collector_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_collector`
--

LOCK TABLES `payment_collector` WRITE;
/*!40000 ALTER TABLE `payment_collector` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_collector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_frequency`
--

DROP TABLE IF EXISTS `payment_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_frequency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frequency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_frequency`
--

LOCK TABLES `payment_frequency` WRITE;
/*!40000 ALTER TABLE `payment_frequency` DISABLE KEYS */;
INSERT INTO `payment_frequency` VALUES (1,'Semanal'),(2,'Quincenal'),(3,'Mensual');
/*!40000 ALTER TABLE `payment_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Efectivo'),(2,'Transferencia Bancaria'),(3,'Tarjeta de Crédito');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_status`
--

LOCK TABLES `payment_status` WRITE;
/*!40000 ALTER TABLE `payment_status` DISABLE KEYS */;
INSERT INTO `payment_status` VALUES (1,'Pendiente'),(2,'Procesado'),(3,'Rechazado');
/*!40000 ALTER TABLE `payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_validation`
--

DROP TABLE IF EXISTS `payment_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_validation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `administrator_id` int NOT NULL,
  `date_validation` date NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_id` (`payment_id`),
  KEY `administrator_id` (`administrator_id`),
  CONSTRAINT `payment_validation_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `payment_validation_ibfk_2` FOREIGN KEY (`administrator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_validation`
--

LOCK TABLES `payment_validation` WRITE;
/*!40000 ALTER TABLE `payment_validation` DISABLE KEYS */;
INSERT INTO `payment_validation` VALUES (1,1,3,'2024-03-02','Pago validado exitosamente'),(2,2,3,'2024-04-02','Pago validado parcialmente');
/*!40000 ALTER TABLE `payment_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'create_loan'),(2,'view_reports'),(3,'manage_users');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `document` varchar(10) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `date_birth` date NOT NULL,
  `address_id` int NOT NULL,
  `user_id` int NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `commission_percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document` (`document`),
  UNIQUE KEY `phone` (`phone`),
  KEY `user_id` (`user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `person_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Juan','Pérez','1234567890','Male','3101234567','1980-01-15',1,1,2000000.00,NULL),(2,'María','Ruiz','9876543210','Female','3207654321','1990-05-22',2,2,NULL,5.00),(3,'Pedro','Gómez','1122334455','Male','3001122334','1985-03-10',3,3,1500000.00,2.50);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Cliente'),(2,'Fiador'),(3,'Cobrador'),(4,'Administrador'),(5,'Cobrador Afiliado');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1,1),(2,3,2),(3,4,3);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `collector_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `collector_id` (`collector_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`collector_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Activo'),(2,'Pendiente'),(3,'Finalizado');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'juanperez','juan.perez@example.com','password123','2024-12-06 21:33:28',NULL),(2,'mariaruiz','maria.ruiz@example.com','password456','2024-12-06 21:33:28',NULL),(3,'pedrogomez','pedro.gomez@example.com','password789','2024-12-06 21:33:28',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1),(2,2,3),(3,3,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 17:42:23