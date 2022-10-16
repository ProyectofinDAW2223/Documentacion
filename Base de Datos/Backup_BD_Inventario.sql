-- MySQL dump 10.13  Distrib 5.7.32, for Win64 (x86_64)
--
-- Host: localhost    Database: Inventario
-- ------------------------------------------------------
-- Server version	5.7.32-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Inventario`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Inventario` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `Inventario`;

--
-- Table structure for table `dispositivos`
--

DROP TABLE IF EXISTS `dispositivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispositivos` (
  `idDispositivo` smallint(6) NOT NULL AUTO_INCREMENT,
  `numInventario` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `numSerie` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaAlta` date NOT NULL,
  `fechaBaja` date NOT NULL,
  `idUbicacion` smallint(6) NOT NULL,
  `idEquipo` smallint(6) DEFAULT NULL,
  `idMotivo` smallint(6) NOT NULL,
  PRIMARY KEY (`idDispositivo`),
  KEY `ubicacion_dispositivo` (`idUbicacion`),
  KEY `equipo_dispositivo` (`idEquipo`),
  KEY `motivoBaja_dispositivo` (`idMotivo`),
  CONSTRAINT `equipo_dispositivo` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`idEquipo`),
  CONSTRAINT `motivoBaja_dispositivo` FOREIGN KEY (`idMotivo`) REFERENCES `motivosbaja` (`idMotivo`),
  CONSTRAINT `ubicacion_dispositivo` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos`
--

LOCK TABLES `dispositivos` WRITE;
/*!40000 ALTER TABLE `dispositivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispositivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `idEquipo` smallint(6) NOT NULL AUTO_INCREMENT,
  `numinventario` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `tipoEquipo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `numSerie` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `procesador` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `memoriaRam` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `almacenamiento` char(4) COLLATE utf8_spanish_ci NOT NULL,
  `sistemaOperativo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `maquinaVirtual` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `componenteExtra` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaAlta` date NOT NULL,
  `fechaBaja` date NOT NULL,
  `idUbicacion` smallint(6) NOT NULL,
  `idMotivo` smallint(6) NOT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `ubicacion_equipos` (`idUbicacion`),
  KEY `motivoBaja_equipo` (`idMotivo`),
  CONSTRAINT `motivoBaja_equipo` FOREIGN KEY (`idMotivo`) REFERENCES `motivosbaja` (`idMotivo`),
  CONSTRAINT `ubicacion_equipos` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impresoras`
--

DROP TABLE IF EXISTS `impresoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impresoras` (
  `idImpresora` smallint(6) NOT NULL AUTO_INCREMENT,
  `numInventario` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `numSerie` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `tipoImpresora` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `enRed` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `fechaAlta` date NOT NULL,
  `fechaBaja` date NOT NULL,
  `idUbicacion` smallint(6) NOT NULL,
  `idMotivo` smallint(6) NOT NULL,
  PRIMARY KEY (`idImpresora`),
  KEY `ubicacion_impresoras` (`idUbicacion`),
  KEY `motivoBaja_impresora` (`idMotivo`),
  CONSTRAINT `motivoBaja_impresora` FOREIGN KEY (`idMotivo`) REFERENCES `motivosbaja` (`idMotivo`),
  CONSTRAINT `ubicacion_impresoras` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impresoras`
--

LOCK TABLES `impresoras` WRITE;
/*!40000 ALTER TABLE `impresoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `impresoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivosbaja`
--

DROP TABLE IF EXISTS `motivosbaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivosbaja` (
  `idMotivo` smallint(6) NOT NULL AUTO_INCREMENT,
  `codigoBaja` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `descripcionBaja` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idMotivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivosbaja`
--

LOCK TABLES `motivosbaja` WRITE;
/*!40000 ALTER TABLE `motivosbaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `motivosbaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicacion` (
  `idUbicacion` smallint(6) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `aula` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-26 21:36:49
