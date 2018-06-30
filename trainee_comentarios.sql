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
  `likes_idlikes` int(11) NOT NULL,
  `compartilhamentos_idcompartilhamentos` int(11) NOT NULL,
  `postagens_idpostagens` int(11) NOT NULL,
  PRIMARY KEY (`idcomentarios`),
  KEY `fk_comentarios_likes1_idx` (`likes_idlikes`),
  KEY `fk_comentarios_compartilhamentos1_idx` (`compartilhamentos_idcompartilhamentos`),
  KEY `fk_comentarios_postagens1_idx` (`postagens_idpostagens`),
  CONSTRAINT `fk_comentarios_compartilhamentos1` FOREIGN KEY (`compartilhamentos_idcompartilhamentos`) REFERENCES `compartilhamentos` (`idcompartilhamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_likes1` FOREIGN KEY (`likes_idlikes`) REFERENCES `likes` (`idlikes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-30 15:37:40
