-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: MediosPrensa
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
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorias` (
  `IDCategoria` int(11) NOT NULL,
  `NombreCategoria` varchar(50) DEFAULT NULL,
  `URLCategoria` varchar(200) DEFAULT NULL,
  `XPATH_Url` varchar(200) DEFAULT NULL,
  `IDMedioPrensaCa` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCategoria`),
  KEY `IDMedioPrensaCa` (`IDMedioPrensaCa`),
  CONSTRAINT `Categorias_ibfk_1` FOREIGN KEY (`IDMedioPrensaCa`) REFERENCES `Medios_Prensa` (`IDMedioPrensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CuentaRedSocial`
--

DROP TABLE IF EXISTS `CuentaRedSocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CuentaRedSocial` (
  `IDCuenta` int(11) NOT NULL,
  `RedSocial` varchar(50) DEFAULT NULL,
  `NombreCuenta` varchar(50) DEFAULT NULL,
  `NumeroSeguidores` int(11) DEFAULT NULL,
  `FechaActualizo` date DEFAULT NULL,
  `IDMedioPrensaC` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCuenta`),
  KEY `IDMedioPrensaC` (`IDMedioPrensaC`),
  CONSTRAINT `CuentaRedSocial_ibfk_1` FOREIGN KEY (`IDMedioPrensaC`) REFERENCES `Medios_Prensa` (`IDMedioPrensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CuentaRedSocial`
--

LOCK TABLES `CuentaRedSocial` WRITE;
/*!40000 ALTER TABLE `CuentaRedSocial` DISABLE KEYS */;
/*!40000 ALTER TABLE `CuentaRedSocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fundadores`
--

DROP TABLE IF EXISTS `Fundadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fundadores` (
  `IDFundadores` int(11) NOT NULL,
  `NombreFundador` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDFundadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fundadores`
--

LOCK TABLES `Fundadores` WRITE;
/*!40000 ALTER TABLE `Fundadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fundadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoRealiza`
--

DROP TABLE IF EXISTS `LoRealiza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoRealiza` (
  `IDMedioPrensa` int(11) NOT NULL,
  `IDFundadores` int(11) NOT NULL,
  PRIMARY KEY (`IDMedioPrensa`,`IDFundadores`),
  KEY `IDFundadores` (`IDFundadores`),
  CONSTRAINT `LoRealiza_ibfk_1` FOREIGN KEY (`IDMedioPrensa`) REFERENCES `Medios_Prensa` (`IDMedioPrensa`),
  CONSTRAINT `LoRealiza_ibfk_2` FOREIGN KEY (`IDFundadores`) REFERENCES `Fundadores` (`IDFundadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoRealiza`
--

LOCK TABLES `LoRealiza` WRITE;
/*!40000 ALTER TABLE `LoRealiza` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoRealiza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medios_Prensa`
--

DROP TABLE IF EXISTS `Medios_Prensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medios_Prensa` (
  `IDMedioPrensa` int(11) NOT NULL,
  `NombrePrensa` varchar(50) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `SitioWeb` varchar(200) DEFAULT NULL,
  `CiudadPrensa` varchar(100) DEFAULT NULL,
  `PaisPrensa` varchar(50) DEFAULT NULL,
  `RegionPrensa` varchar(50) DEFAULT NULL,
  `ContinentePrensa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDMedioPrensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medios_Prensa`
--

LOCK TABLES `Medios_Prensa` WRITE;
/*!40000 ALTER TABLE `Medios_Prensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medios_Prensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noticias`
--

DROP TABLE IF EXISTS `Noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Noticias` (
  `IDNoticia` int(11) NOT NULL,
  `URL_Noticia` varchar(200) DEFAULT NULL,
  `XPATH_Fecha` varchar(200) DEFAULT NULL,
  `XPATH_Titulo` varchar(200) DEFAULT NULL,
  `XPATH_Contenido` varchar(200) DEFAULT NULL,
  `IDMedioPrensaN` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDNoticia`),
  KEY `IDMedioPrensaN` (`IDMedioPrensaN`),
  CONSTRAINT `Noticias_ibfk_1` FOREIGN KEY (`IDMedioPrensaN`) REFERENCES `Medios_Prensa` (`IDMedioPrensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noticias`
--

LOCK TABLES `Noticias` WRITE;
/*!40000 ALTER TABLE `Noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Noticias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18 19:38:25
