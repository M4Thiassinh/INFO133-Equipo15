-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: InfoComunas
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `Comuna`
--

DROP TABLE IF EXISTS `Comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comuna` (
  `ID_Comuna` int(11) NOT NULL,
  `ID_Region` int(11) DEFAULT NULL,
  `NombreC` varchar(50) DEFAULT NULL,
  `PoblacionC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Comuna`),
  KEY `ID_Region` (`ID_Region`),
  CONSTRAINT `Comuna_ibfk_1` FOREIGN KEY (`ID_Region`) REFERENCES `Region` (`ID_Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comuna`
--

LOCK TABLES `Comuna` WRITE;
/*!40000 ALTER TABLE `Comuna` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conectividad`
--

DROP TABLE IF EXISTS `Conectividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conectividad` (
  `ID_Connect` int(11) NOT NULL,
  `NombreConnect` varchar(100) DEFAULT NULL,
  `UbicacionConnect` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_Connect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conectividad`
--

LOCK TABLES `Conectividad` WRITE;
/*!40000 ALTER TABLE `Conectividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Conectividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContieneC`
--

DROP TABLE IF EXISTS `ContieneC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContieneC` (
  `ID_Comuna` int(11) NOT NULL,
  `ID_Connect` int(11) NOT NULL,
  `UbicacionConnect` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_Comuna`,`ID_Connect`),
  KEY `ID_Connect` (`ID_Connect`),
  CONSTRAINT `ContieneC_ibfk_1` FOREIGN KEY (`ID_Comuna`) REFERENCES `Comuna` (`ID_Comuna`),
  CONSTRAINT `ContieneC_ibfk_2` FOREIGN KEY (`ID_Connect`) REFERENCES `Conectividad` (`ID_Connect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContieneC`
--

LOCK TABLES `ContieneC` WRITE;
/*!40000 ALTER TABLE `ContieneC` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContieneC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContieneE`
--

DROP TABLE IF EXISTS `ContieneE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContieneE` (
  `ID_Comuna` int(11) NOT NULL,
  `ID_E` int(11) NOT NULL,
  `CantidadE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Comuna`,`ID_E`),
  KEY `ID_E` (`ID_E`),
  CONSTRAINT `ContieneE_ibfk_1` FOREIGN KEY (`ID_Comuna`) REFERENCES `Comuna` (`ID_Comuna`),
  CONSTRAINT `ContieneE_ibfk_2` FOREIGN KEY (`ID_E`) REFERENCES `Entretencion` (`ID_E`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContieneE`
--

LOCK TABLES `ContieneE` WRITE;
/*!40000 ALTER TABLE `ContieneE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContieneE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContieneED`
--

DROP TABLE IF EXISTS `ContieneED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContieneED` (
  `ID_Comuna` int(11) NOT NULL,
  `ID_EstaED` int(11) NOT NULL,
  `CantidadED` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Comuna`,`ID_EstaED`),
  KEY `ID_EstaED` (`ID_EstaED`),
  CONSTRAINT `ContieneED_ibfk_1` FOREIGN KEY (`ID_Comuna`) REFERENCES `Comuna` (`ID_Comuna`),
  CONSTRAINT `ContieneED_ibfk_2` FOREIGN KEY (`ID_EstaED`) REFERENCES `EstablecimientosED` (`ID_EstaED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContieneED`
--

LOCK TABLES `ContieneED` WRITE;
/*!40000 ALTER TABLE `ContieneED` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContieneED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContieneS`
--

DROP TABLE IF EXISTS `ContieneS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContieneS` (
  `ID_Comuna` int(11) NOT NULL,
  `ID_ES` int(11) NOT NULL,
  `CantidadS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Comuna`,`ID_ES`),
  KEY `ID_ES` (`ID_ES`),
  CONSTRAINT `ContieneS_ibfk_1` FOREIGN KEY (`ID_Comuna`) REFERENCES `Comuna` (`ID_Comuna`),
  CONSTRAINT `ContieneS_ibfk_2` FOREIGN KEY (`ID_ES`) REFERENCES `EstablecimientosSalud` (`ID_ES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContieneS`
--

LOCK TABLES `ContieneS` WRITE;
/*!40000 ALTER TABLE `ContieneS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContieneS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entretencion`
--

DROP TABLE IF EXISTS `Entretencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entretencion` (
  `ID_E` int(11) NOT NULL,
  `UbicacionE` varchar(200) DEFAULT NULL,
  `NombreE` varchar(100) DEFAULT NULL,
  `CapacidadE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_E`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entretencion`
--

LOCK TABLES `Entretencion` WRITE;
/*!40000 ALTER TABLE `Entretencion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entretencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstablecimientosED`
--

DROP TABLE IF EXISTS `EstablecimientosED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstablecimientosED` (
  `ID_EstaED` int(11) NOT NULL,
  `NombreED` varchar(100) DEFAULT NULL,
  `UbicacionED` varchar(200) DEFAULT NULL,
  `ID_TipoED` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_EstaED`),
  KEY `ID_TipoED` (`ID_TipoED`),
  CONSTRAINT `EstablecimientosED_ibfk_1` FOREIGN KEY (`ID_TipoED`) REFERENCES `TipoED` (`ID_tipoED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstablecimientosED`
--

LOCK TABLES `EstablecimientosED` WRITE;
/*!40000 ALTER TABLE `EstablecimientosED` DISABLE KEYS */;
/*!40000 ALTER TABLE `EstablecimientosED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstablecimientosSalud`
--

DROP TABLE IF EXISTS `EstablecimientosSalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstablecimientosSalud` (
  `ID_ES` int(11) NOT NULL,
  `ID_TipoS` int(11) DEFAULT NULL,
  `NombreES` varchar(100) DEFAULT NULL,
  `TelefonoES` int(11) DEFAULT NULL,
  `DireccionES` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_ES`),
  KEY `ID_TipoS` (`ID_TipoS`),
  CONSTRAINT `EstablecimientosSalud_ibfk_1` FOREIGN KEY (`ID_TipoS`) REFERENCES `TipoSalud` (`ID_TipoS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstablecimientosSalud`
--

LOCK TABLES `EstablecimientosSalud` WRITE;
/*!40000 ALTER TABLE `EstablecimientosSalud` DISABLE KEYS */;
/*!40000 ALTER TABLE `EstablecimientosSalud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pais` (
  `ID_Pais` int(11) NOT NULL,
  `NombrePais` varchar(50) DEFAULT NULL,
  `Regiones` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Region` (
  `ID_Region` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Comunas` int(11) DEFAULT NULL,
  `ID_Pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Region`),
  KEY `ID_Pais` (`ID_Pais`),
  CONSTRAINT `Region_ibfk_1` FOREIGN KEY (`ID_Pais`) REFERENCES `Pais` (`ID_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoED`
--

DROP TABLE IF EXISTS `TipoED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoED` (
  `ID_tipoED` int(11) NOT NULL,
  `NombreTipoED` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_tipoED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoED`
--

LOCK TABLES `TipoED` WRITE;
/*!40000 ALTER TABLE `TipoED` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoSalud`
--

DROP TABLE IF EXISTS `TipoSalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoSalud` (
  `ID_TipoS` int(11) NOT NULL,
  `NombreTipoS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TipoS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoSalud`
--

LOCK TABLES `TipoSalud` WRITE;
/*!40000 ALTER TABLE `TipoSalud` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoSalud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18 19:32:41
