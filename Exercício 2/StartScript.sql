CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `ambulatorio`
--

DROP TABLE IF EXISTS `ambulatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambulatorio` (
  `numeroA` int(11) NOT NULL,
  `andar` int(11) NOT NULL,
  `capacidade` int(11) NOT NULL,
  PRIMARY KEY (`numeroA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulatorio`
--

LOCK TABLES `ambulatorio` WRITE;
/*!40000 ALTER TABLE `ambulatorio` DISABLE KEYS */;
INSERT INTO `ambulatorio` VALUES (101,1,10),(102,1,15),(103,1,20),(104,1,5),(201,2,55),(202,2,60),(203,2,80),(204,2,40),(301,3,20),(302,3,10),(303,3,5),(304,3,5),(305,3,15),(306,3,25),(401,4,50),(402,4,50),(403,4,50),(404,4,50),(405,4,50),(406,4,55),(407,4,60),(408,4,70),(409,4,72),(410,4,85),(411,4,88),(412,4,30),(413,4,8),(414,4,4),(415,4,10),(501,5,8),(502,5,2),(503,5,4),(504,5,10),(505,5,14),(506,5,20);
/*!40000 ALTER TABLE `ambulatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `codcidade` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`codcidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Rio Branco','AC'),(2,'Maceió','AL'),(3,'Macapá','AP'),(4,'Manaus','AM'),(5,'Salvador','BA'),(6,'Fortaleza','CE'),(7,'Brasília','DF'),(8,'Vitória','ES'),(9,'Goiânia','GO'),(10,'São Luís','MA'),(11,'Cuiabá','MT'),(12,'Campo Grande','MS'),(13,'Belo Horizonte','MG'),(14,'Belém','PA'),(15,'João Pessoa','PB'),(16,'Curitiba','PR'),(17,'Recife','PE'),(18,'Teresina','PI'),(19,'Rio de Janeiro','RJ'),(20,'Natal','RN'),(21,'Porto Alegre','RS'),(22,'Porto Velho','RO'),(23,'Boa Vista','RR'),(24,'Florianópolis','SC'),(25,'São Paulo','SP'),(26,'Aracaju','SE'),(27,'Palmas','TO');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `crm` int(11) NOT NULL,
  `rg` int(11) NOT NULL,
  `data` varchar(10) NOT NULL,
  `hora` varchar(5) NOT NULL,
  `coddoenca` int(11) NOT NULL,
  PRIMARY KEY (`crm`,`rg`,`data`),
  KEY `fkcrg_idx` (`rg`),
  KEY `fkccoddoenca_idx` (`coddoenca`),
  CONSTRAINT `fkccoddoenca` FOREIGN KEY (`coddoenca`) REFERENCES `doenca` (`coddoenca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkccrm` FOREIGN KEY (`crm`) REFERENCES `medico` (`crm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkcrg` FOREIGN KEY (`rg`) REFERENCES `paciente` (`rg`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (7,94,'2015-02-02','07:00',1),(22,25,'2015-09-09','17:00',21),(22,25,'2015-09-14','16:00',21),(27,22,'2015-06-06','09:45',26),(27,22,'2015-07-06','08:45',26),(27,22,'2015-08-06','08:00',26),(29,101,'2015-02-03','07:30',1),(40,66,'2015-02-03','16:30',1),(46,51,'2015-01-15','16:00',40),(79,68,'2015-07-28','08:00',40),(79,80,'2015-05-22','11:00',40),(79,92,'2015-08-07','15:00',40);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doenca`
--

DROP TABLE IF EXISTS `doenca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doenca` (
  `coddoenca` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`coddoenca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doenca`
--

LOCK TABLES `doenca` WRITE;
/*!40000 ALTER TABLE `doenca` DISABLE KEYS */;
INSERT INTO `doenca` VALUES (1,'Sarampo'),(2,'Sangramento Anal'),(3,'Malária'),(4,'Leishmaniose'),(5,'Excesso de Peso'),(6,'Dor nos Braços/Mãos'),(7,'Depressão'),(8,'Dor de Cabeça Frequente'),(9,'Constipação Intestinal'),(10,'Diabetes'),(11,'Infecção Urinária'),(12,'Asma'),(13,'Dengue'),(14,'Ansiedade'),(15,'Aids'),(16,'Úlcera'),(17,'Varizes'),(18,'Colesterol alto'),(19,'Dor no pescoço ou ombros'),(20,'Dor Crônica nas Costas'),(21,'Alergia de Pele'),(22,'Rinite'),(23,'Artrose'),(24,'Cólera'),(25,'Gastrite Crônica'),(26,'Problemas de visão'),(27,'Tireóide'),(28,'bronquite'),(29,'Hanseníase'),(30,'Insônia'),(31,'Osteoporose'),(32,'Ansiedade'),(33,'Hepatite'),(34,'Insônia'),(35,'Câncer'),(36,'Excesso de peso'),(37,'Pressão alta'),(38,'Audição'),(39,'Artrite'),(40,'Pneumonia');
/*!40000 ALTER TABLE `doenca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidade` (
  `codesp` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'Nefrologia'),(2,'Neurologia'),(3,'Endoscopia'),(4,'Hematologia'),(5,'Patologia'),(6,'Coloproctologia'),(7,'Otorrinolaringologia'),(8,'Mastologia'),(9,'Ortopedia'),(10,'Endocrinologia'),(11,'Infectologia'),(12,'Gastroenterologia'),(13,'Acupuntura'),(14,'Homeopatia'),(15,'Urologia'),(16,'Neurocirurgia'),(17,'Neonatologia'),(18,'Ginecologia'),(19,'Radioterapia'),(20,'Nutrologia'),(21,'Traumatologia'),(22,'Radiologia'),(23,'Reumatologia'),(24,'Genética'),(25,'Geriatria'),(26,'Ooncologia'),(27,'Oftalmologia'),(28,'Anestesiologia'),(29,'Pneumologia'),(30,'Imunologia'),(31,'Cardiologia'),(32,'Angiologia'),(33,'Psiquiatria'),(34,'Dermatologia'),(35,'Pediatria');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `rg` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `codcidade` int(11) NOT NULL,
  `salario` int(11) NOT NULL,
  PRIMARY KEY (`rg`),
  KEY `fkfcodcidade_idx` (`codcidade`),
  CONSTRAINT `fkfcodcidade` FOREIGN KEY (`codcidade`) REFERENCES `cidade` (`codcidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Penélope Damasceno',38,26,13701),(2,'Lua Henriques',24,26,4252),(3,'Ginéculo Villas Boas',44,10,7380),(4,'Máxima Ornellas',50,25,4910),(5,'Mamede Cardin',53,22,6000),(6,'Josefina Marroquim',34,14,4269),(7,'Porfírio Antunes',53,19,3746),(8,'Matias Franca',50,15,4751),(9,'Jacinta Passarinho',34,26,5837),(10,'Ronaldo Xavier',36,22,8788),(11,'Máximo Moita',27,17,13110),(12,'Isabel Amorim',44,16,4714),(13,'Joel Telinhos',29,8,7507),(14,'Abigail Lameira',55,2,14268),(15,'Osvaldo Barrocas',36,26,12783),(16,'Martinho Dantas',40,26,13256),(17,'Cristóvão Suárez',41,23,7737),(18,'Tomé Avelar',49,2,8175),(19,'Flamínia Canejo',51,18,14873),(20,'Guiomar Alvim',36,21,11663),(21,'Querubina Igrejas',41,21,11848),(22,'Teodoro Avelar',22,24,12556),(23,'Elias Areosa',32,1,14993),(24,'Reinaldo Bandeira',24,15,5297),(25,'Olívio Brito',33,3,5998),(26,'Veridiana Quintas',45,20,13010),(27,'Mafalda Lobo',45,1,14743),(28,'Iuri Botica',55,19,11484),(29,'Ângelo Alcântara',58,6,12517),(30,'Iara Fagundes',33,1,12365),(31,'Angelina Veiga',37,27,9187),(32,'Sônia Vásquez',45,25,9466),(33,'Lucinda Varão',53,6,14384),(34,'Vicente Salomão',41,7,14766),(35,'Zenaide Verguero',43,3,8908),(36,'Danilo Almeida',27,24,8418),(37,'Raoni Vásquez',59,19,5245),(38,'Matilde Assis',45,19,5774),(39,'Moema Aranha',33,12,8539),(40,'Felicidade Fitas',58,20,8603),(41,'Joaquim Ferrera',31,7,9279),(42,'Isaura Ferreira',51,25,7055),(43,'Otávio Benavides',43,13,6492),(44,'Clotilde Lousã',38,16,8472),(45,'Murilo Zarco',40,5,6975),(46,'Mileide Palmeira',36,6,11516),(47,'Armando Veloso',38,7,5904),(48,'Jorge Noguera',53,10,14630),(49,'Cândida Sousa do Prado',27,10,9459),(50,'Plácido Cardoso',38,5,4021);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `crm` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `codcidade` int(11) NOT NULL,
  `especialidade` int(11) NOT NULL,
  `numeroA` int(11) DEFAULT NULL,
  PRIMARY KEY (`crm`),
  KEY `fkcodcidade_idx` (`codcidade`),
  KEY `fkespecialidade_idx` (`especialidade`),
  KEY `fknumeroA_idx` (`numeroA`),
  CONSTRAINT `fkmcodcidade` FOREIGN KEY (`codcidade`) REFERENCES `cidade` (`codcidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkmespecialidade` FOREIGN KEY (`especialidade`) REFERENCES `especialidade` (`codesp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkmnumeroA` FOREIGN KEY (`numeroA`) REFERENCES `ambulatorio` (`numeroA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (2,'Ulisses Sousa do Prado',54,3,4,303),(3,'Pedro Santana',32,22,35,101),(4,'Cláudia Maranhão',50,25,8,302),(5,'António Lira',55,13,17,102),(6,'Hipólito Lobato',57,26,13,406),(7,'Giovana Regalado',43,4,11,405),(8,'Nivaldo Affonso',54,12,33,506),(10,'Honório Quintão',45,16,35,407),(11,'Bruno Álvez',48,1,18,203),(12,'Anacleto Bensaúde',50,1,22,101),(13,'Maura Saloio',29,11,26,502),(14,'Lavínia Caldeira',49,19,9,413),(15,'Janaína Vilaça',31,6,30,410),(16,'Fabíola Fernandes',29,18,28,402),(17,'Vitória Villar',55,27,31,304),(18,'Silvério Carrasco',42,8,33,204),(19,'Zuleide Bogado',58,9,10,401),(20,'Ronaldo Marroquim',26,14,13,103),(21,'Benedita Anhaia',34,24,5,201),(22,'Emiliana Velasques',37,5,34,306),(23,'Hélia Puerto',43,25,1,408),(24,'Maiara Carijó',55,6,29,414),(25,'Cássio Teves',39,24,4,304),(26,'Ilduara Díaz',50,7,21,409),(27,'Sabino Rosa',40,15,29,203),(28,'Gerson Rolim',51,12,27,404),(29,'Constança Capucho',27,4,11,303),(30,'Neuza Rabelo',53,12,20,504),(31,'Zuleide Correia',44,9,10,402),(32,'Nicolau Cysneiros',37,19,22,505),(33,'Sofia Café',28,20,17,301),(34,'Rosalina Silveira',56,27,13,104),(35,'Dina Casqueira',49,3,8,305),(36,'Arminda Amaral',48,16,15,103),(37,'Zilda Porto',31,1,24,306),(38,'Sílvia Belchior',33,27,7,302),(39,'Clarindo Queirós',45,14,33,301),(40,'Rudi Marques',56,19,11,201),(41,'Asi Landim',35,16,15,104),(42,'Bernardete Albuquerque',59,24,18,202),(43,'Remo Farias',54,20,28,102),(44,'Jutaí Monsanto',48,6,22,412),(45,'Rómulo Vaz',29,20,4,202),(46,'Estanislau Freitas',59,9,31,401),(47,'Moisés Betancour',26,6,25,503),(48,'Caio Curvelo',51,10,32,204),(49,'Gaudêncio Laranjeira',42,22,10,403),(50,'Énia Bettencourt',48,24,33,403),(51,'Wesley Safanelly',42,5,9,305),(52,'Joelma Calisto',55,14,9,411),(79,'Maria Souza',38,1,29,501);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `rg` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `codcidade` int(11) NOT NULL,
  PRIMARY KEY (`rg`),
  KEY `fkcodcidade_idx` (`codcidade`),
  CONSTRAINT `fkpcodcidade` FOREIGN KEY (`codcidade`) REFERENCES `cidade` (`codcidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (22,'Teodoro Avelar',22,24),(25,'Olívio Brito',33,3),(51,'Comecus Suárez',39,27),(52,'Rosalina Colares',5,25),(53,'Roquita Carvalhais',30,5),(54,'Miru Cervera',17,14),(55,'Lurdes Nolasco',70,19),(56,'Roseli Sabrosa',45,16),(57,'Rafael Oiticica',51,13),(58,'Ingrit Nieves',35,9),(59,'Poliana Jesus',29,26),(60,'Olívia Guerreiro',37,2),(61,'Políbio Caldera',38,13),(62,'Adriana Mendonça',32,1),(63,'Frutuoso Dias',41,14),(64,'Veridiano Cintra',19,3),(65,'Inês Dinis',40,7),(66,'Verônica, Vilaça',11,14),(67,'Viriato Lobato',59,17),(68,'Benedita Felgueiras',6,4),(69,'Fernando Perdigón',26,11),(70,'Clementina Bogalho',18,8),(71,'Gina Picanço',76,15),(72,'Flávia Perdigón',68,9),(73,'Uriel Siqueira',33,22),(74,'Telmo Castella',48,26),(75,'Cleiton Pasos',63,15),(76,'Higino Monjardim',3,5),(77,'Noel Paraguaçu',67,12),(78,'Florinda Ríos',7,15),(80,'Filipa Rego',8,6),(81,'Blasco Madeira',61,18),(82,'Ubirajara Pajares',58,6),(83,'Teodorico Valente',4,8),(84,'Edgar Moreyra',74,19),(85,'Alberto Boga',25,15),(86,'Ilduara Estrela',64,18),(87,'Paula Vilarim',47,11),(88,'Lénia Abranches',27,19),(89,'Augusta Lemes',71,16),(90,'Roberto Bulhosa',56,14),(91,'Rudá Vasconcellos',43,24),(92,'Tairine Gois',69,1),(93,'Hipólito Villar',20,3),(94,'Magali Gouvêa',28,10),(95,'Armindo Fogaça',44,6),(96,'Abigail Quinterno',15,26),(97,'Branca Ramos',12,20),(98,'Luana Lousã',22,2),(99,'Filomena Godoy',53,3),(100,'Iara Clementino',62,27),(101,'Zilda González',21,26);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-27 16:56:21