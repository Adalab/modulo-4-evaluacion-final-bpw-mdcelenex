-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: simpsons
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `capitulos`
--

DROP TABLE IF EXISTS `capitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capitulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `numero_episodio` int NOT NULL,
  `temporada` int NOT NULL,
  `fecha_emision` date DEFAULT NULL,
  `sinopsis` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulos`
--

LOCK TABLES `capitulos` WRITE;
/*!40000 ALTER TABLE `capitulos` DISABLE KEYS */;
INSERT INTO `capitulos` VALUES (1,'Simpsons Roasting on an Open Fire',1,1,'1989-12-17','El primer episodio de la serie donde la familia Simpson celebra la Navidad.'),(2,'Bart Gets an F',2,2,'1990-10-11','Bart intenta pasar su examen de historia.'),(3,'Homer vs. Lisa and the 8th Commandment',3,2,'1990-01-06','Homer y Lisa discuten sobre la moralidad de robar cable.'),(4,'Marge vs. the Monorail',12,4,'1993-01-14','Marge se opone a la construcción de un monorraíl en Springfield.');
/*!40000 ALTER TABLE `capitulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capitulos_personajes`
--

DROP TABLE IF EXISTS `capitulos_personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capitulos_personajes` (
  `capitulo_id` int NOT NULL,
  `personaje_id` int NOT NULL,
  PRIMARY KEY (`capitulo_id`,`personaje_id`),
  KEY `personaje_id` (`personaje_id`),
  CONSTRAINT `capitulos_personajes_ibfk_1` FOREIGN KEY (`capitulo_id`) REFERENCES `capitulos` (`id`),
  CONSTRAINT `capitulos_personajes_ibfk_2` FOREIGN KEY (`personaje_id`) REFERENCES `personajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulos_personajes`
--

LOCK TABLES `capitulos_personajes` WRITE;
/*!40000 ALTER TABLE `capitulos_personajes` DISABLE KEYS */;
INSERT INTO `capitulos_personajes` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(4,2),(1,3),(2,3),(4,3),(1,4),(2,4),(3,4),(4,4),(1,5);
/*!40000 ALTER TABLE `capitulos_personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frases`
--

DROP TABLE IF EXISTS `frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` text NOT NULL,
  `marca_tiempo` varchar(10) DEFAULT NULL,
  `descripcion` text,
  `personaje_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personaje_id` (`personaje_id`),
  CONSTRAINT `frases_ibfk_1` FOREIGN KEY (`personaje_id`) REFERENCES `personajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
INSERT INTO `frases` VALUES (1,'D\'oh!','00:00:05','Frase icónica de Homer Simpson.',1),(2,'¡Ay, caramba!','00:00:10','Frase famosa de Bart Simpson.',3),(3,'Mmm... donuts','00:00:15','Homer expresa su amor por los donuts.',1),(4,'Lisa, si puedes leer esto, es que estás en problemas.','00:00:20','Una frase de Marge a Lisa.',2),(6,'¡Multiplícate por cero!','00:03:30','Una de las frases típicas de Bart Simpson.',3);
/*!40000 ALTER TABLE `frases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (1,'Homer','Simpson','Nuclear Safety Inspector','El padre de la familia Simpson.'),(2,'Marge','Simpson','Ama de casa','La madre de la familia Simpson, conocida por su cabello azul.'),(3,'Bart','Simpson','Estudiante','El hijo travieso de Homer y Marge.'),(4,'Lisa','Simpson','Estudiante','La hija inteligente y activista de la familia.'),(5,'Maggie','Simpson','Bebé','La bebé de la familia, conocida por su chupete.');
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 17:49:32
