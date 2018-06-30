-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: trainee
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `idcomentarios` int(11) NOT NULL AUTO_INCREMENT,
  `postagens_idpostagens` int(11) NOT NULL,
  `pessoas_idpessoas` int(11) NOT NULL,
  `conteudo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcomentarios`),
  KEY `fk_comentarios_postagens1_idx` (`postagens_idpostagens`),
  KEY `fk_comentarios_pessoas1_idx` (`pessoas_idpessoas`),
  CONSTRAINT `fk_comentarios_pessoas1` FOREIGN KEY (`pessoas_idpessoas`) REFERENCES `pessoas` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_postagens1` FOREIGN KEY (`postagens_idpostagens`) REFERENCES `postagens` (`idpostagens`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compartilhamentos`
--

DROP TABLE IF EXISTS `compartilhamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compartilhamentos` (
  `idcompartilhamentos` int(11) NOT NULL AUTO_INCREMENT,
  `pessoas_idpessoas` int(11) NOT NULL,
  `postagens_idpostagens` int(11) NOT NULL,
  PRIMARY KEY (`idcompartilhamentos`),
  KEY `fk_compartilhamentos_pessoas1_idx` (`pessoas_idpessoas`),
  KEY `fk_compartilhamentos_postagens1_idx` (`postagens_idpostagens`),
  CONSTRAINT `fk_compartilhamentos_pessoas1` FOREIGN KEY (`pessoas_idpessoas`) REFERENCES `pessoas` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compartilhamentos_postagens1` FOREIGN KEY (`postagens_idpostagens`) REFERENCES `postagens` (`idpostagens`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compartilhamentos`
--

LOCK TABLES `compartilhamentos` WRITE;
/*!40000 ALTER TABLE `compartilhamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compartilhamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `idlikes` int(11) NOT NULL,
  `postagens_idpostagens` int(11) NOT NULL,
  `pessoas_idpessoas` int(11) NOT NULL,
  `comentarios_idcomentarios` int(11) NOT NULL,
  PRIMARY KEY (`idlikes`),
  KEY `fk_likes_postagens_idx` (`postagens_idpostagens`),
  KEY `fk_likes_pessoas1_idx` (`pessoas_idpessoas`),
  KEY `fk_likes_comentarios1_idx` (`comentarios_idcomentarios`),
  CONSTRAINT `fk_likes_comentarios1` FOREIGN KEY (`comentarios_idcomentarios`) REFERENCES `comentarios` (`idcomentarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_pessoas1` FOREIGN KEY (`pessoas_idpessoas`) REFERENCES `pessoas` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_postagens` FOREIGN KEY (`postagens_idpostagens`) REFERENCES `postagens` (`idpostagens`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas` (
  `idpessoas` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpessoas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postagens`
--

DROP TABLE IF EXISTS `postagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postagens` (
  `idpostagens` int(11) NOT NULL AUTO_INCREMENT,
  `conteudo` varchar(45) DEFAULT NULL,
  `curtidas` varchar(45) DEFAULT NULL,
  `compartilhou` varchar(45) DEFAULT NULL,
  `comentarios` varchar(45) DEFAULT NULL,
  `pessoas_idpessoas` int(11) NOT NULL,
  PRIMARY KEY (`idpostagens`),
  KEY `fk_postagens_pessoas1_idx` (`pessoas_idpessoas`),
  CONSTRAINT `fk_postagens_pessoas1` FOREIGN KEY (`pessoas_idpessoas`) REFERENCES `pessoas` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postagens`
--

LOCK TABLES `postagens` WRITE;
/*!40000 ALTER TABLE `postagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `postagens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-30 15:59:55
