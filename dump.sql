-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tenis
--

CREATE DATABASE IF NOT EXISTS tenis;
USE tenis;

--
-- Definition of table `tenis`.`participar`
--

DROP TABLE IF EXISTS `tenis`.`participar`;
CREATE TABLE  `tenis`.`participar` (
  `id_tenista` int(10) NOT NULL,
  `id_torneio` int(10) NOT NULL,
  `ano` int(4) NOT NULL,
  `premio` float unsigned NOT NULL DEFAULT '0',
  `foi_finalista` tinyint(1) NOT NULL DEFAULT '0',
  `foi_campeao` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tenista`,`id_torneio`,`ano`),
  KEY `participar_torneio_fk` (`id_torneio`),
  CONSTRAINT `participar_tenista_fk` FOREIGN KEY (`id_tenista`) REFERENCES `tenista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participar_torneio_fk` FOREIGN KEY (`id_torneio`) REFERENCES `torneio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenis`.`participar`
--

/*!40000 ALTER TABLE `participar` DISABLE KEYS */;
LOCK TABLES `participar` WRITE;
INSERT INTO `tenis`.`participar` VALUES  (1,1,2000,50000,1,0),
 (1,1,2001,20000,0,0),
 (1,1,2002,0,0,0),
 (1,1,2003,50000,1,0),
 (1,2,2000,100000,1,1),
 (1,2,2001,100000,1,1),
 (1,3,2000,50000,1,0),
 (1,3,2001,50000,1,0),
 (1,3,2003,150000,1,1),
 (1,4,2000,1e+06,1,1),
 (1,4,2002,500000,1,0),
 (1,4,2004,2e+06,1,1),
 (1,4,2005,2e+06,1,1),
 (1,4,2006,20000,1,0),
 (1,4,2007,10000,1,0),
 (1,4,2008,10000,0,0),
 (2,1,2000,10000,0,0),
 (2,1,2001,100000,1,1),
 (2,1,2003,50000,1,0),
 (2,2,2000,10000,0,0),
 (2,2,2001,50000,1,0),
 (2,3,2000,10000,0,0),
 (2,3,2001,100000,1,1),
 (2,3,2003,75000,1,0),
 (2,4,2000,10000,0,0),
 (2,4,2005,500000,1,0),
 (2,4,2006,1e+06,1,1),
 (2,4,2008,500000,1,0),
 (3,1,2000,10000,0,0),
 (3,1,2001,50000,1,0),
 (3,1,2003,100000,1,1),
 (3,2,2000,10000,0,0),
 (3,3,2000,10000,0,0),
 (3,4,2000,10000,0,0),
 (3,4,2002,1e+06,1,1),
 (3,4,2004,500000,1,0),
 (3,4,2007,1e+06,1,1),
 (3,4,2008,10000,0,0),
 (4,1,2000,100000,1,1),
 (4,1,2001,10000,0,0),
 (4,2,2001,10000,0,0),
 (4,3,2000,100000,1,1),
 (4,3,2003,10000,0,0),
 (4,4,2002,10000,0,0),
 (4,4,2008,1e+06,1,1),
 (5,1,2000,10000,0,0),
 (5,1,2002,50000,1,0),
 (5,2,2001,10000,0,0),
 (5,3,2001,10000,0,0),
 (5,4,2000,500000,1,0),
 (5,4,2002,10000,0,0),
 (6,1,2000,10000,0,0),
 (6,1,2002,100000,1,1),
 (6,2,2000,50000,1,0),
 (6,2,2001,10000,0,0),
 (6,3,2001,10000,0,0),
 (6,4,2000,10000,0,0),
 (4,5,2009,5000,1,0),
 (5,5,2009,10000,1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `participar` ENABLE KEYS */;


--
-- Definition of table `tenis`.`tenista`
--

DROP TABLE IF EXISTS `tenis`.`tenista`;
CREATE TABLE  `tenis`.`tenista` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `apelido` varchar(80) NOT NULL,
  `ano_nasc` int(4) NOT NULL,
  `cidade_nascimento` varchar(80) NOT NULL,
  `cidade_moradia` varchar(80) NOT NULL,
  `esta_ativo` tinyint(1) NOT NULL DEFAULT '1',
  `id_padrinho` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `padrinho_tenista` (`id_padrinho`),
  CONSTRAINT `padrinho_tenista` FOREIGN KEY (`id_padrinho`) REFERENCES `tenista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenis`.`tenista`
--

/*!40000 ALTER TABLE `tenista` DISABLE KEYS */;
LOCK TABLES `tenista` WRITE;
INSERT INTO `tenis`.`tenista` VALUES  (1,'Gustavo','Guga',1980,'Florianópolis','Florianópolis',0,NULL),
 (2,'Alberto','Apelido 2',1990,'Washington','Las Vegas',1,1),
 (3,'Joana','Apelido 3',1985,'Washington','Los Angeles',1,1),
 (4,'André','Apelido 3',1985,'Washington','Los Angeles',1,2),
 (5,'Paulo','Guga cover',1988,'São Paulo','Rio de Janeiro',1,2),
 (6,'Carla','aluno da UFAL',1991,'Maceió','Maceió',1,5),
 (7,'Joao','teste teste',1998,'Maceió','Maceió',1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `tenista` ENABLE KEYS */;


--
-- Definition of table `tenis`.`torneio`
--

DROP TABLE IF EXISTS `tenis`.`torneio`;
CREATE TABLE  `tenis`.`torneio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `local` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenis`.`torneio`
--

/*!40000 ALTER TABLE `torneio` DISABLE KEYS */;
LOCK TABLES `torneio` WRITE;
INSERT INTO `tenis`.`torneio` VALUES  (1,'US Open','USA'),
 (2,'Maceió Open','Maceió'),
 (3,'Madri Open','Madri'),
 (4,'Roland Garros','Paris'),
 (5,'Arapiraca Open','Arapiraca');
UNLOCK TABLES;
/*!40000 ALTER TABLE `torneio` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;