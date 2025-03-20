-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pato2
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `declaraciones`
--

DROP TABLE IF EXISTS `declaraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `declaraciones` (
  `declaraciones_id` int NOT NULL AUTO_INCREMENT,
  `persona_id` int DEFAULT NULL,
  `declaracion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`declaraciones_id`),
  UNIQUE KEY `declaraciones_id` (`declaraciones_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `Declaraciones_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `declaraciones`
--

LOCK TABLES `declaraciones` WRITE;
/*!40000 ALTER TABLE `declaraciones` DISABLE KEYS */;
INSERT INTO `declaraciones` VALUES (1,1,'Me quede todo el día en clases'),(2,2,'Estuve todo el rato en la academia y creo recordar que alguién más estuvo por ahí.'),(3,3,'Estuve solo un ratito en la academia y luego me fui a comprar al Spar.'),(4,4,'Fui al Spar y me encontré con un compañero'),(5,5,'Fui a merendar a la cafetería'),(6,6,'Estuve en clases y luego me fui a la cafetería y vi a un compañero'),(7,7,'Fui a la joyería a vender mi anillo de boda junto al resto de mis joyas'),(8,8,'Estuve en la academia, salí a tomar un café y volví'),(9,9,'Una persona vino varias veces para vender oro. La verdad es raro ver gente tan jóven por aquí, aunque se le notaba especialmente nervioso'),(10,10,'Estuve en el trabajo y vi a varios alumnos de reboot'),(11,11,'Hubo una persona que vino muchas veces a vender oro'),(12,12,'La verdad que no hubo mucha actividad ese día, solo una señora que vino a valorar sus joyas. Aunque si es verdad que hay otras joyerías que han tenido bastante movimiento'),(13,13,'No noté nada raro. Acompañé a Matias que se encontraba muy mal y luego volví a clase.'),(14,14,'Estuve todo el día en la academia finalizando algunos LABS atrasados'),(15,15,'Ese día me encontraba bastante mal, asi que decicí irme algo antes. Me encontré unos conocidos en el bar, y luego fui a comprar un té al SPAR de aquí al lado'),(16,16,'Estuve toda la mañana en clase trabajando en un proyecto. Durante la hora de comer fui al bar de la esquina.'),(17,17,'Me quedé hasta tarde en la academia. Cuando salí vi algo extraño en el pasillo, pero no le di importancia.'),(18,18,'Salí temprano porque tenía cita médica. Cuando regresé noté que faltaban algunas cosas en el aula.'),(19,19,'Estuve en clase hasta las 5, luego fui al SPAR a comprar algo para la cena y me encontré con un compañero.'),(20,20,'Recuerdo haber visto a alguien sospechoso merodeando cerca de las taquillas después de la hora de salida.'),(21,21,'Vi a un estudiante que parecía llevar prisa saliendo del edificio.'),(22,22,'Vi algunas personas entrando y saliendo varias veces ese día. Uno de ellos me pareció algo nervioso.'),(23,23,'Noté a alguien guardando algo en su mochila de manera discreta.');
/*!40000 ALTER TABLE `declaraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_tienda`
--

DROP TABLE IF EXISTS `detalle_tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_tienda` (
  `tienda_id` int NOT NULL AUTO_INCREMENT,
  `fecha_transaccion` date DEFAULT NULL,
  `oro_ingresado` int DEFAULT NULL,
  `descripcion_persona` varchar(255) DEFAULT NULL,
  `ticket` int DEFAULT NULL,
  `lugar_id` int DEFAULT NULL,
  `trabajador_id` int DEFAULT NULL,
  PRIMARY KEY (`tienda_id`),
  UNIQUE KEY `tienda_id` (`tienda_id`),
  KEY `lugar_id` (`lugar_id`),
  KEY `trabajador_id` (`trabajador_id`),
  CONSTRAINT `Detalle_Tienda_ibfk_1` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`lugar_id`),
  CONSTRAINT `Detalle_Tienda_ibfk_2` FOREIGN KEY (`trabajador_id`) REFERENCES `personas` (`persona_id`),
  CONSTRAINT `Detalle_Tienda_ibfk_3` FOREIGN KEY (`trabajador_id`) REFERENCES `personas` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_tienda`
--

LOCK TABLES `detalle_tienda` WRITE;
/*!40000 ALTER TABLE `detalle_tienda` DISABLE KEYS */;
INSERT INTO `detalle_tienda` VALUES (40,'2025-03-12',150,'Joven alto y de complexion delgada',1001,4,9),(41,'2025-03-13',150,'Joven alto y de complexion delgada',1001,4,9),(42,'2025-03-14',150,'Joven alto y de complexion delgada',1001,4,9),(43,'2025-03-12',150,'Joven alto y de complexion delgada',1001,5,11),(44,'2025-03-13',200,'Joven alto y de complexion delgada',1001,5,11),(45,'2025-03-12',200,'Joven alto y de complexion delgada',1001,6,12),(46,'2025-03-10',100,'Joven alto y fuerte',1002,4,9),(47,'2025-03-11',100,'Joven alto y fuerte',1002,4,9),(48,'2025-03-12',100,'Joven alto y fuerte',1002,4,9),(49,'2025-03-10',100,'Joven alto y fuerte',1002,5,11),(50,'2025-03-11',100,'Joven alto y fuerte',1002,5,11),(51,'2025-03-12',100,'Joven alto y fuerte',1002,5,11),(52,'2025-03-12',800,'Una persona de mediana edad, peliroja y delgada',1003,6,12);
/*!40000 ALTER TABLE `detalle_tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `inventario_id` int NOT NULL AUTO_INCREMENT,
  `tamaño` enum('Pequeño','Mediano','Grande') DEFAULT NULL,
  `volumen_cm3` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inventario_id`),
  UNIQUE KEY `inventario_id` (`inventario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'Grande',50,'Mochila negra grande'),(2,'Mediano',40,'Mochila azul mediana'),(3,'Mediano',40,'Mochila azul mediana'),(4,'Pequeño',30,'Mochila roja pequeña'),(5,'Pequeño',30,'Bolso pequeño de cuero');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugares`
--

DROP TABLE IF EXISTS `lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares` (
  `lugar_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hora_apertura` time DEFAULT NULL,
  `hora_cierre` time DEFAULT NULL,
  PRIMARY KEY (`lugar_id`),
  UNIQUE KEY `lugar_id` (`lugar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares`
--

LOCK TABLES `lugares` WRITE;
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` VALUES (1,'Reboot Academy','08:00:00','18:00:00'),(2,'SPAR Ripoche','10:00:00','21:00:00'),(3,'Cafeteria Lanzarote','08:00:00','22:00:00'),(4,'Compra Oro Martínez','09:00:00','20:00:00'),(5,'Joyería La Fleur','09:00:00','20:00:00'),(6,'Oro La Balanza','09:00:00','20:00:00'),(7,'Hospital Perpetuo Socorro','00:00:00','23:59:59');
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `persona_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `rol` enum('Profesor Reeboot','Alumno Reboot','Limpiadora','Directora Reeboot','Policía','Portero','Joyero','Dependiente','Cajera','Repartidor') DEFAULT NULL,
  `inventario_id` int DEFAULT NULL,
  `color_pelo` enum('negro','rubio','pelirrojo') DEFAULT NULL,
  `altura` enum('alto','medio','bajo') DEFAULT NULL,
  `constitucion` enum('fuerte','normal','delgada') DEFAULT NULL,
  PRIMARY KEY (`persona_id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  KEY `inventario_id` (`inventario_id`),
  CONSTRAINT `Personas_ibfk_1` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`inventario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Rafiki','Ndiaye','Alumno Reboot',1,'negro','alto','delgada'),(2,'Mustafa','Jimenez','Alumno Reboot',2,'negro','bajo','fuerte'),(3,'Simba','Hernandez','Alumno Reboot',3,'negro','alto','delgada'),(4,'Mufasa','Lion','Alumno Reboot',4,'rubio','medio','delgada'),(5,'Nala','Ndiaye','Alumno Reboot',5,'pelirrojo','alto','fuerte'),(6,'Juan','Pérez','Profesor Reeboot',NULL,'rubio','medio','normal'),(7,'María','López','Directora Reeboot',NULL,'pelirrojo','bajo','fuerte'),(8,'Carlos','Gómez','Portero',NULL,'negro','alto','fuerte'),(9,'Ana','Fernández','Joyero',NULL,'rubio','medio','delgada'),(10,'David','Martínez','Dependiente',NULL,'negro','bajo','normal'),(11,'Jose','Martinez','Joyero',NULL,'negro','medio','fuerte'),(12,'George','Smith','Joyero',NULL,'rubio','alto','delgada'),(13,'Pedro','Lopez','Alumno Reboot',1,'negro','alto','fuerte'),(14,'Paco','Morrison','Alumno Reboot',1,'rubio','bajo','delgada'),(15,'Matias','Santos','Alumno Reboot',2,'negro','medio','fuerte'),(16,'Lucía','Martínez','Alumno Reboot',2,'negro','medio','normal'),(17,'Carlos','Fernández','Alumno Reboot',1,'rubio','alto','delgada'),(18,'Elena','Sánchez','Alumno Reboot',3,'negro','bajo','fuerte'),(19,'Miguel','González','Alumno Reboot',5,'negro','alto','fuerte'),(20,'Sofía','Rodríguez','Alumno Reboot',4,'pelirrojo','medio','delgada'),(21,'Beatriz','Jiménez','Limpiadora',NULL,'rubio','medio','normal'),(22,'Héctor','Torres','Portero',NULL,'negro','alto','fuerte'),(23,'Marina','Vega','Limpiadora',NULL,'pelirrojo','bajo','delgada');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_reboot`
--

DROP TABLE IF EXISTS `registro_reboot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_reboot` (
  `registro_id` int NOT NULL AUTO_INCREMENT,
  `persona_id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  PRIMARY KEY (`registro_id`),
  UNIQUE KEY `registro_id` (`registro_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `Registro_Reboot_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_reboot`
--

LOCK TABLES `registro_reboot` WRITE;
/*!40000 ALTER TABLE `registro_reboot` DISABLE KEYS */;
INSERT INTO `registro_reboot` VALUES (1,1,'2025-03-10','09:00:00','16:00:00'),(2,1,'2025-03-11','09:00:00','16:00:00'),(3,1,'2025-03-12','09:00:00','16:00:00'),(4,1,'2025-03-13','09:00:00','16:00:00'),(5,1,'2025-03-14','09:00:00','16:00:00'),(6,2,'2025-03-10','09:00:00','16:00:00'),(7,2,'2025-03-11','09:00:00','16:00:00'),(8,2,'2025-03-13','09:00:00','16:00:00'),(9,2,'2025-03-14','09:00:00','16:00:00'),(10,3,'2025-03-10','09:00:00','16:00:00'),(11,3,'2025-03-11','09:00:00','16:00:00'),(12,3,'2025-03-12','09:00:00','16:00:00'),(13,3,'2025-03-13','09:00:00','16:00:00'),(14,3,'2025-03-14','09:00:00','16:00:00'),(15,4,'2025-03-10','09:00:00','16:00:00'),(16,4,'2025-03-11','09:00:00','16:00:00'),(17,4,'2025-03-12','09:00:00','16:00:00'),(18,4,'2025-03-13','09:00:00','16:00:00'),(19,5,'2025-03-10','09:00:00','16:00:00'),(20,5,'2025-03-11','09:00:00','16:00:00'),(21,5,'2025-03-12','09:00:00','16:00:00'),(22,5,'2025-03-13','09:00:00','16:00:00'),(23,5,'2025-03-14','09:00:00','16:00:00'),(24,6,'2025-03-10','08:00:00','16:00:00'),(25,6,'2025-03-11','08:00:00','16:00:00'),(26,6,'2025-03-12','08:00:00','16:00:00'),(27,6,'2025-03-13','08:00:00','16:00:00'),(28,6,'2025-03-14','08:00:00','16:00:00'),(29,7,'2025-03-10','10:00:00','14:00:00'),(30,7,'2025-03-11','10:00:00','14:00:00'),(31,7,'2025-03-12','10:00:00','14:00:00'),(32,7,'2025-03-13','10:00:00','14:00:00'),(33,7,'2025-03-14','10:00:00','14:00:00'),(34,13,'2025-03-10','09:00:00','15:30:00'),(35,13,'2025-03-11','09:00:00','15:30:00'),(36,13,'2025-03-12','09:00:00','15:30:00'),(37,13,'2025-03-13','09:00:00','15:30:00'),(38,13,'2025-03-14','09:00:00','15:30:00'),(39,14,'2025-03-10','09:10:00','16:01:00'),(40,14,'2025-03-11','09:10:00','16:01:00'),(41,14,'2025-03-12','09:10:00','16:01:00'),(42,14,'2025-03-13','09:10:00','16:01:00'),(43,15,'2025-03-10','09:10:00','16:01:00'),(44,15,'2025-03-11','09:10:00','16:01:00'),(45,15,'2025-03-12','09:10:00','13:00:00'),(46,15,'2025-03-13','09:10:00','16:01:00'),(47,16,'2025-03-10','08:45:00','16:15:00'),(48,16,'2025-03-11','08:50:00','16:00:00'),(49,16,'2025-03-12','08:55:00','16:05:00'),(50,16,'2025-03-13','09:00:00','16:00:00'),(51,16,'2025-03-14','08:45:00','16:10:00'),(52,16,'2025-03-15','09:15:00','14:30:00'),(53,17,'2025-03-10','08:45:00','16:30:00'),(54,17,'2025-03-11','09:00:00','16:15:00'),(55,17,'2025-03-12','08:50:00','16:45:00'),(56,17,'2025-03-13','09:05:00','17:00:00'),(57,17,'2025-03-14','08:55:00','16:30:00'),(58,17,'2025-03-15','09:10:00','14:45:00'),(59,18,'2025-03-10','09:00:00','14:30:00'),(60,18,'2025-03-11','08:45:00','16:00:00'),(61,18,'2025-03-12','09:15:00','15:30:00'),(62,18,'2025-03-13','09:00:00','13:45:00'),(63,18,'2025-03-14','08:50:00','16:00:00'),(64,18,'2025-03-15','09:05:00','14:15:00'),(65,19,'2025-03-10','08:55:00','16:00:00'),(66,19,'2025-03-11','08:45:00','16:15:00'),(67,19,'2025-03-12','09:00:00','16:00:00'),(68,19,'2025-03-13','08:50:00','16:00:00'),(69,19,'2025-03-14','08:45:00','16:30:00'),(70,19,'2025-03-15','09:15:00','14:45:00'),(71,20,'2025-03-10','08:50:00','16:15:00'),(72,20,'2025-03-11','09:00:00','16:00:00'),(73,20,'2025-03-12','08:45:00','16:00:00'),(74,20,'2025-03-13','09:05:00','16:30:00'),(75,20,'2025-03-14','08:50:00','16:45:00'),(76,20,'2025-03-15','09:00:00','14:30:00'),(77,21,'2025-03-10','15:00:00','22:00:00'),(78,21,'2025-03-11','15:30:00','22:30:00'),(79,21,'2025-03-12','15:00:00','22:00:00'),(80,21,'2025-03-13','15:30:00','22:30:00'),(81,21,'2025-03-14','15:00:00','22:00:00'),(82,21,'2025-03-15','12:00:00','18:00:00'),(83,22,'2025-03-10','08:00:00','17:00:00'),(84,22,'2025-03-11','08:00:00','17:00:00'),(85,22,'2025-03-12','08:00:00','17:00:00'),(86,22,'2025-03-13','08:00:00','17:00:00'),(87,22,'2025-03-14','08:00:00','17:00:00'),(88,22,'2025-03-15','08:30:00','15:00:00'),(89,23,'2025-03-10','06:00:00','13:00:00'),(90,23,'2025-03-11','06:30:00','13:30:00'),(91,23,'2025-03-12','06:00:00','13:00:00'),(92,23,'2025-03-13','06:30:00','13:30:00'),(93,23,'2025-03-14','06:00:00','13:00:00'),(94,23,'2025-03-15','07:00:00','14:00:00');
/*!40000 ALTER TABLE `registro_reboot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_persona`
--

DROP TABLE IF EXISTS `ubicacion_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion_persona` (
  `up_id` int NOT NULL AUTO_INCREMENT,
  `persona_id` int DEFAULT NULL,
  `lugar_id` int DEFAULT NULL,
  `desde` time DEFAULT NULL,
  `hasta` time DEFAULT NULL,
  PRIMARY KEY (`up_id`),
  UNIQUE KEY `up_id` (`up_id`),
  KEY `persona_id` (`persona_id`),
  KEY `lugar_id` (`lugar_id`),
  CONSTRAINT `Ubicacion_Persona_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`persona_id`),
  CONSTRAINT `Ubicacion_Persona_ibfk_2` FOREIGN KEY (`lugar_id`) REFERENCES `lugares` (`lugar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_persona`
--

LOCK TABLES `ubicacion_persona` WRITE;
/*!40000 ALTER TABLE `ubicacion_persona` DISABLE KEYS */;
INSERT INTO `ubicacion_persona` VALUES (122,1,1,'09:02:00','13:00:00'),(123,2,1,'09:01:00','13:00:00'),(124,3,1,'08:50:00','13:01:00'),(125,4,1,'08:55:00','13:03:00'),(126,5,1,'09:00:00','13:01:00'),(127,13,1,'09:00:00','13:02:00'),(128,14,1,'09:00:00','13:00:00'),(129,15,1,'09:00:00','13:00:00'),(130,7,1,'09:00:00','16:00:00'),(131,1,1,'14:00:00','16:01:00'),(132,2,1,'14:00:00','16:03:00'),(133,3,1,'14:00:00','16:02:00'),(134,4,1,'14:00:00','16:05:00'),(135,5,1,'14:00:00','16:02:00'),(136,13,1,'14:00:00','16:00:00'),(137,14,1,'14:00:00','16:00:00'),(138,15,1,'14:00:00','16:01:00'),(139,7,1,'14:00:00','18:00:00'),(140,1,1,'13:00:00','13:30:00'),(141,1,4,'13:30:00','13:40:00'),(142,1,5,'13:40:00','13:50:00'),(143,1,6,'13:50:00','14:00:00'),(144,2,1,'13:00:00','14:00:00'),(145,3,1,'13:00:00','13:15:00'),(146,3,2,'13:15:00','14:00:00'),(147,4,2,'13:00:00','14:00:00'),(148,5,3,'13:00:00','14:00:00'),(149,6,1,'13:00:00','13:15:00'),(150,6,3,'13:15:00','14:00:00'),(151,7,5,'13:00:00','14:00:00'),(152,8,1,'13:00:00','14:30:00'),(153,8,1,'13:30:00','13:45:00'),(154,8,1,'13:45:00','14:00:00'),(155,9,4,'13:00:00','14:00:00'),(156,10,3,'13:00:00','14:00:00'),(157,11,3,'13:00:00','14:00:00'),(158,12,2,'13:00:00','14:00:00'),(159,13,4,'08:30:00','08:50:00'),(160,13,5,'13:00:00','13:15:00'),(161,13,5,'16:10:00','16:40:00'),(162,14,1,'13:00:00','14:00:00'),(163,15,2,'13:45:00','14:05:00'),(164,15,3,'13:05:00','13:20:00'),(165,16,1,'08:55:00','13:30:00'),(166,16,3,'13:30:00','14:30:00'),(167,16,1,'14:30:00','16:05:00'),(168,17,1,'08:50:00','16:45:00'),(169,18,1,'09:15:00','12:00:00'),(170,18,7,'12:30:00','14:00:00'),(171,18,1,'14:30:00','15:30:00'),(172,19,1,'09:00:00','16:00:00'),(173,19,2,'16:15:00','16:45:00'),(174,20,1,'08:45:00','16:00:00'),(175,21,1,'15:00:00','16:30:00'),(176,21,1,'16:30:00','22:00:00'),(177,22,1,'08:00:00','17:00:00'),(178,23,1,'06:00:00','09:00:00'),(179,23,1,'09:00:00','13:00:00'),(180,13,1,'13:00:00','14:00:00');
/*!40000 ALTER TABLE `ubicacion_persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-19 22:53:15
