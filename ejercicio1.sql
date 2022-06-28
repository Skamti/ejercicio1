CREATE DATABASE  IF NOT EXISTS `ejercicio1der` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ejercicio1der`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ejercicio1der
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'juan','perez','1997-02-24','barrio la salada 123'),(2,'maria','calcuta','1995-01-05','marcoz a zar 23'),(3,'jose','gomez','1998-06-07','san juan 23'),(4,'mario','perdomo','1995-04-05','villa angostoro 564'),(5,'nicolas','fernandez','1999-12-31','torre de piza 2'),(6,'lucia','caballo','2000-11-11','parque equino 11'),(7,'marcela','cañuelas','1982-03-30','malos aires 55');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_curso`
--

DROP TABLE IF EXISTS `alumnos_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos_curso` (
  `cursos_id` int NOT NULL,
  `alumnos_id` int NOT NULL,
  `edificio_id` int NOT NULL,
  PRIMARY KEY (`cursos_id`,`alumnos_id`,`edificio_id`),
  KEY `fk_alumnos_curso_alumnos1_idx` (`alumnos_id`),
  KEY `fk_alumnos_curso_edificio1_idx` (`edificio_id`),
  CONSTRAINT `fk_alumnos_curso_alumnos1` FOREIGN KEY (`alumnos_id`) REFERENCES `alumnos` (`id`),
  CONSTRAINT `fk_alumnos_curso_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `fk_alumnos_curso_edificio1` FOREIGN KEY (`edificio_id`) REFERENCES `edificio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_curso`
--

LOCK TABLES `alumnos_curso` WRITE;
/*!40000 ALTER TABLE `alumnos_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int NOT NULL,
  `nombre_curso` varchar(45) NOT NULL,
  `id_dias_cursada` varchar(45) DEFAULT NULL,
  `id_edi_cursada` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'matematicas','1','1'),(2,'matematicas','3','1'),(3,'matematicas','5','1');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias`
--

DROP TABLE IF EXISTS `dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dias` (
  `id` int NOT NULL,
  `dia` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias`
--

LOCK TABLES `dias` WRITE;
/*!40000 ALTER TABLE `dias` DISABLE KEYS */;
INSERT INTO `dias` VALUES (1,'lunes'),(2,'martes'),(3,'miercoles'),(4,'jueves'),(5,'viernes');
/*!40000 ALTER TABLE `dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias_curso`
--

DROP TABLE IF EXISTS `dias_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dias_curso` (
  `dias_id` int NOT NULL,
  `cursos_id` int NOT NULL,
  PRIMARY KEY (`dias_id`,`cursos_id`),
  KEY `fk_dias_curso_dias1_idx` (`dias_id`),
  KEY `fk_dias_curso_cursos1_idx` (`cursos_id`),
  CONSTRAINT `fk_dias_curso_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `fk_dias_curso_dias1` FOREIGN KEY (`dias_id`) REFERENCES `dias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias_curso`
--

LOCK TABLES `dias_curso` WRITE;
/*!40000 ALTER TABLE `dias_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `dias_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias_has_dias`
--

DROP TABLE IF EXISTS `dias_has_dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dias_has_dias` (
  `dias_id` int NOT NULL,
  PRIMARY KEY (`dias_id`),
  KEY `fk_dias_has_dias_dias_idx` (`dias_id`),
  CONSTRAINT `fk_dias_has_dias_dias` FOREIGN KEY (`dias_id`) REFERENCES `dias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias_has_dias`
--

LOCK TABLES `dias_has_dias` WRITE;
/*!40000 ALTER TABLE `dias_has_dias` DISABLE KEYS */;
/*!40000 ALTER TABLE `dias_has_dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edificio` (
  `id` int NOT NULL,
  `nro_edi` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio_has_cursos`
--

DROP TABLE IF EXISTS `edificio_has_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edificio_has_cursos` (
  `edificio_id` int NOT NULL,
  `cursos_id` int NOT NULL,
  PRIMARY KEY (`edificio_id`,`cursos_id`),
  KEY `fk_edificio_has_cursos_cursos1_idx` (`cursos_id`),
  KEY `fk_edificio_has_cursos_edificio1_idx` (`edificio_id`),
  CONSTRAINT `fk_edificio_has_cursos_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `fk_edificio_has_cursos_edificio1` FOREIGN KEY (`edificio_id`) REFERENCES `edificio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio_has_cursos`
--

LOCK TABLES `edificio_has_cursos` WRITE;
/*!40000 ALTER TABLE `edificio_has_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `edificio_has_cursos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-28  0:43:11
