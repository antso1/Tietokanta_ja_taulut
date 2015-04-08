-- MySQL dump 10.13 Distrib 5.5.41, for debian-linux-gnu (i686)
--
-- Host: localhost Database: astikantsql
-- ------------------------------------------------------
-- Server version 5.5.41-0ubuntu0.14.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,POSTGRESQL' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--
-- Table structure for table yritys
   
   
   
--
/*/*DROP TABLE IF EXISTS yritys;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE yritys (
Yritysnimi varchar(30) NOT NULL,
Ytunnus varchar(30) NOT NULL,
puhelinnro varchar(15) NOT NULL,
fax varchar(15) NOT NULL,
email varchar(100) NOT NULL,
katuosoite varchar(50) NOT NULL,
postinro varchar(50) NOT NULL,
paikkakunta varchar(30) NOT NULL,
PRIMARY KEY (Yritysnimi)
);
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table yritys
--
LOCK TABLES yritys WRITE;
/*!40000 ALTER TABLE yritys DISABLE KEYS */;
INSERT INTO yritys VALUES ('Tavaratalo Oy','1789130-5','0200152152','0200153153','yhteys@tavaratalo.fi','firmatie 1','33101','Tampere');
/*!40000 ALTER TABLE yritys ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table toimipisteet
   
   
   
--
/*DROP TABLE IF EXISTS toimipisteet;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE toimipisteet (
toimipisteID int NOT NULL,
puhelinnro varchar(15) NOT NULL,
fax varchar(15) NOT NULL,
email varchar(100) NOT NULL,
katuosoite varchar(50) NOT NULL,
postinro varchar(50) NOT NULL,
paikkakunta varchar(30) NOT NULL,
tuote varchar(15) DEFAULT NULL,
Yritysnimi varchar(30) NOT NULL,
PRIMARY KEY (toimipisteID),
CONSTRAINT toimipisteet_ibfk_1 FOREIGN KEY (Yritysnimi) REFERENCES yritys (Yritysnimi) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table toimipisteet
--
LOCK TABLES toimipisteet WRITE;
/*!40000 ALTER TABLE toimipisteet DISABLE KEYS */;
INSERT INTO toimipisteet VALUES (1,'0200152154','0200154154','tampere@tavaratalo.fi','firmatie 1','33101','Tampere',NULL,'Tavaratalo Oy'),(2,'0200152155','0200155155','joensuu@tavaratalo.fi','kukkatie 12','80100','Joensuu',NULL,'Tavaratalo Oy'),(3,'0200152156','0200156156','savonlinna@tavaratalo.fi','linnapolku 17','57100','Savonlinna',NULL,'Tavaratalo Oy'),(4,'0200152157','0200157157','mikkeli@tavaratalo.fi','tietokatu 12
   
   
   
a','50100','Mikkeli',NULL,'Tavaratalo Oy'),(5,'0200152158','0200158158','juva@tavaratalo.fi','Kalkkunakatu 13 b 5','51900','Juva',NULL,'Tavaratalo Oy'),(6,'0200152159','0200159159','kuopio@tavaratalo.fi','teknopolis 11 M 10','70100','Kuopio',NULL,'Tavaratalo Oy');
/*!40000 ALTER TABLE toimipisteet ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table tyontekijat
--
/*DROP TABLE IF EXISTS tyontekijat;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE tyontekijat (
tyontekijaID int NOT NULL,
password varchar(30) DEFAULT NULL,
etunimi varchar(30) DEFAULT NULL,
sukunimi varchar(30) NOT NULL,
tehtavanimike varchar(30) DEFAULT NULL,
puhelinnro varchar(15) NOT NULL,
email varchar(100) NOT NULL,
katuosoite varchar(50) NOT NULL,
postinro varchar(50) NOT NULL,
kotikunta varchar(30) NOT NULL,
hetu varchar(10) NOT NULL,
toimipisteID int NOT NULL,
PRIMARY KEY (tyontekijaID),
CONSTRAINT tyontekijat_ibfk_1 FOREIGN KEY (toimipisteID) REFERENCES toimipisteet (toimipisteID) ON DELETE CASCADE ON UPDATE CASCADE
);
   
   
   
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table tyontekijat
--
LOCK TABLES tyontekijat WRITE;
/*!40000 ALTER TABLE tyontekijat DISABLE KEYS */;
INSERT INTO tyontekijat VALUES (122001,NULL,'matti','kivi','tekninen asiantuntija','0402531547','matti.kivi@tavaratalo.fi','kiekkokatu 1 a 19','33100','Tampere','120574-034',1),(122002,NULL,'antti','kekkonen','tekninen asiantuntija','0500125879','antti.kekkonen@tavaratalo.fi','kalukukkokatu 12 a 1','70100','Kuopio','310577-012',6),(122003,NULL,'minna','makkonen','markkinointisihteeri','04061345485','minna.makkonen@tavaratalo.fi','lautatie 12','33100','Tampere','010674-112',1),(122004,NULL,'veijo','kekäläinen','myynnin asiantuntija','05001155415','veijo.kekalainen@tavaratalo.fi','Matinkatu 11','57200','savonlinna','110371-113',3),(122005,NULL,'matti','veijola','johtava suunnittelija','0401564885','matti.veijola@tavaratalo.fi','kiekkotie 1','51900','juva','150266-050',5),(122006,NULL,'lea','jokinen','varastopäällikkö','04578123458','lea.jokinen@tavaratalo.fi','muulikatu 15 a 1','80100','Joensuu','140571-099',2),(122008,NULL,'jouni','susi','myyjä','0442587921','jouni.susi@tavaratalo.fi','Mattilankuja 18 B','57120','savonlinna','110361-113',3),(122009,NULL,'juha','mukula','tekninen asiantuntija','0401251547','juha.mukula@tavaratalo.fi','metsonkatu 1 n 1','33100','Tampere','120584-015',1),(122010,NULL,'niina','kmäki','Myyjä','05001202555','niina.maki@tavaratalo.fi','talokuja 154','70100','Kuopio','250475-085',6);
/*!40000 ALTER TABLE tyontekijat ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table palkkatiedot
--
/*DROP TABLE IF EXISTS palkkatiedot;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE palkkatiedot (
PalkkaID int NOT NULL,
   
   
   
kkpalkka varchar(10) NOT NULL,
veroprosentti varchar(5) NOT NULL,
tilinumero varchar(30) NOT NULL,
vuorolisa varchar(10) NOT NULL,
tyontekijaID int NOT NULL,
PRIMARY KEY (PalkkaID),
CONSTRAINT palkkatiedot_ibfk_1 FOREIGN KEY (tyontekijaID) REFERENCES tyontekijat (tyontekijaID) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table palkkatiedot
--
LOCK TABLES palkkatiedot WRITE;
/*!40000 ALTER TABLE palkkatiedot DISABLE KEYS */;
INSERT INTO palkkatiedot VALUES (333001,'2500','28,5','FI80001546465165','0',122001),(333002,'2700','25,5','FI80001541566555','0',122002),(333003,'2300','26,5','FI80001156455165','0',122003),(333004,'2510','28,0','FI80001858998488','50',122004),(333005,'2200','22,5','FI80001589584556','0',122005),(333006,'3000','24,5','FI80001684655646','0',122006),(333008,'2800','22,5','FI80009989842522','50',122008),(333009,'2200','26,0','FI80003189989969','0',122009),(333010,'1900','20,5','FI80001110044553','0',122010);
/*!40000 ALTER TABLE palkkatiedot ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table asiakkaat
--
/*DROP TABLE IF EXISTS asiakkaat;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
   
   
   
CREATE TABLE asiakkaat (
asiakasnumero int NOT NULL,
tilaus int DEFAULT NULL,
etunimi varchar(30) NOT NULL,
sukunimi varchar(30) NOT NULL,
puhelinnro varchar(15) NOT NULL,
email varchar(100) DEFAULT NULL,
katuosoite varchar(50) NOT NULL,
postinro varchar(50) NOT NULL,
kotikunta varchar(30) NOT NULL,
maa varchar(30) NOT NULL,
tilausnumero int DEFAULT NULL,
PRIMARY KEY (asiakasnumero)
);
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table asiakkaat
--
LOCK TABLES asiakkaat WRITE;
/*!40000 ALTER TABLE asiakkaat DISABLE KEYS */;
INSERT INTO asiakkaat VALUES (1101,NULL,'markku','ikonen','04512458979','make@gmail.com','ekatie 1','33101','Tampere','suomi',11201),(1102,NULL,'ville','jakonen','04512445859','viki99@jippii.fi','kukkatie 12','80100','Joensuu','suomi',11202),(1103,NULL,'sauli','niinistö','04012445859','saukki@hotmail.fi','linnapolku 17','57100','Savonlinna','suomi',1203),(1104,NULL,'jani','volanen','04412445859','mikkeli@outlook.com','tietokatu 12 a','50100','Mikkeli','suomi',1204),(1105,NULL,'jyrki','poikanen','0406986896','mjusukk@gmail.com','firmatie 1','33101','Tampere','suomi',1205),(1106,NULL,'helga','berg','0556989689','jere.m@jippii.fi','kukkatie 12','80100','Joensuu','suomi',11206),(1107,NULL,'jonne','eeso','0458689699','soopeli@hotmail.fi','linnapolku 17','57100','Savonlinna','suomi',11207),(1108,NULL,'keijo','kutvonen','040885859','keijo.kutvonen@outlook.com','tietokatu 12 a','50100','Mikkeli','suomi',11208),(1109,NULL,'ilona','mononen','0448545859','make@gmail.com','firmatie
   
   
   
1','33101','Tampere','suomi',11209),(1110,NULL,'rauni','ranta','04512445559','mauser@jippii.fi','kukkatie 12','80100','Joensuu','suomi',11210),(1111,0,'marko','riikonen','04512455979','make99@gmail.com','tiitisentie 1','33101','Tampere','suomi',11201),(1112,0,'viljami','jalonen','04512385559','viljami11@jippii.fi','kiveläntie 12','50100','Joensuu','suomi',11202),(1113,0,'mervi','niinistö','04012385559','merni@hotmail.fi','linnatie 17','57100','Savonlinna','suomi',1203),(1114,0,'jani','kotka','03812385559','jakok@outlook.com','kalakuja 12 a','50100','Mikkeli','suomi',1204),(1115,0,'jyrki','sukula','0406956596','jyke@gmail.com','sekakuja 1','33101','Tampere','suomi',1205),(1116,0,'helvi','juhta','0556959659','helvi.j@jippii.fi','kukkamäki 12','50100','Joensuu','suomi',11206),(1117,0,'janne','kivinen','0455659699','janne@hotmail.fi','talokuja 17','57100','Savonlinna','suomi',11207),(1119,0,'ilkka','mottinen','0385545559','ile@gmail.com','tikkatie 1','33101','Tampere','suomi',11209),(1120,0,'veli','rantanen','04512385559','veli@jippii.fi','kuulatie 12','50100','Joensuu','suomi',11210);
/*!40000 ALTER TABLE asiakkaat ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table tuotteet
--
/*DROP TABLE IF EXISTS tuotteet;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE tuotteet (
tuotenumero int NOT NULL,
tuotenimi varchar(50) NOT NULL,
toimittaja varchar(30) NOT NULL,
verotonhinta varchar(15) NOT NULL,
alvprosentti int NOT NULL,
varastosaldo int NOT NULL,
PRIMARY KEY (tuotenumero)
);
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table tuotteet
   
   
   
--
LOCK TABLES tuotteet WRITE;
/*!40000 ALTER TABLE tuotteet DISABLE KEYS */;
INSERT INTO tuotteet VALUES (5501,'luuta','kiinatrade oy','12,00',23,120),(5502,'vene','venho oyj','1200,00',23,50),(5503,'lapio','kiinatrade oy','35,00',23,200),(5504,'onki','rapala oyj','25,00',23,150),(5505,'lauta','kiinatrade oy','10,00',23,1000),(5506,'kuppi','kiinatrade oy','5,00',23,121),(5507,'tuoppi','iittala oyj','18,00',23,55),(5508,'kuuppa','kiinatrade oy','3,00',23,235),(5509,'leluauto','mattel inc','3,00',23,335),(5511,'leija','kiinatrade oy','33,00',23,22),(5512,'autokatos','pressu oy','555,00',23,17);
/*!40000 ALTER TABLE tuotteet ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table ostotapahtumat
--
/*DROP TABLE IF EXISTS ostotapahtumat;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ostotapahtumat (
tilausnumero int NOT NULL,
tuotenumero int NOT NULL,
asiakasnumero int NOT NULL,
myyntipaikka varchar(15) DEFAULT NULL,
tilaus int DEFAULT NULL,
toimipisteID int NOT NULL,
verotonhinta varchar(15) NOT NULL,
alvprosentti int NOT NULL,
PRIMARY KEY (tilausnumero),
CONSTRAINT ostotapahtumat_ibfk_1 FOREIGN KEY (asiakasnumero) REFERENCES asiakkaat (asiakasnumero),
   
   
   
CONSTRAINT ostotapahtumat_ibfk_2 FOREIGN KEY (toimipisteID) REFERENCES toimipisteet (toimipisteID),
CONSTRAINT ostotapahtumat_ibfk_3 FOREIGN KEY (tuotenumero) REFERENCES tuotteet (tuotenumero)
);
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table ostotapahtumat
--
LOCK TABLES ostotapahtumat WRITE;
/*!40000 ALTER TABLE ostotapahtumat DISABLE KEYS */;
INSERT INTO ostotapahtumat VALUES (1001,5501,1101,NULL,NULL,3,'12,00',23),(1002,5501,1103,NULL,NULL,5,'12,00',23),(1003,5503,1103,NULL,NULL,3,'35,00',23),(1004,5503,1103,NULL,NULL,1,'35,00',23),(1005,5505,1102,NULL,NULL,2,'10,00',23),(1006,5507,1105,NULL,NULL,2,'18,00',23),(1007,5502,1106,NULL,NULL,3,'1200,00',23),(1008,5501,1107,NULL,NULL,4,'12,00',23),(1009,5501,1109,NULL,NULL,3,'12,00',23);
/*!40000 ALTER TABLE ostotapahtumat ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary table structure for view työntekijät
--
/*/*DROP TABLE IF EXISTS työntekijät;
/*!50001 /*DROP VIEW IF EXISTS työntekijät*/;
SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE työntekijät (
tyontekijaID tinyint NOT NULL,
etunimi tinyint NOT NULL,
sukunimi tinyint NOT NULL,
tehtavanimike tinyint NOT NULL,
   
   
   
kotikunta tinyint NOT NULL,
email tinyint NOT NULL,
toimipisteID tinyint NOT NULL,
paikkakunta tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
/*!50003 SET @saved_cs_client = @@character_set_client */ ;
/*!50003 SET @saved_cs_results = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode = @@sql_mode */ ;
/*!50003 SET sql_mode = '' */ ;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER passwordgen AFTER INSERT ON tyontekijat
FOR EACH ROW
INSERT INTO tyontekijat VALUES (NEW.tyontekijaID, SHA1(CONCAT(LEFT(NEW.etunimi, 3), RIGHT(NEW.sukunimi, 3))), 0) */;;
/*!50003 SET sql_mode = @saved_sql_mode */ ;
/*!50003 SET character_set_client = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection = @saved_col_connection */ ;
--
-- Final view structure for view asiakasostot
--
/*!50001 /*DROP TABLE IF EXISTS asiakasostot*/;
/*!50001 /*DROP VIEW IF EXISTS asiakasostot*/;
   
   
   
/*!50001 CREATE VIEW asiakasostot AS select h.etunimi AS etunimi,h.sukunimi AS sukunimi,h.puhelinnro AS puhelinnro,h.email AS email,h.tilaus AS tilaus,a.tilausnumero AS tilausnumero,a.tuotenumero AS tuotenumero from (asiakkaat h join ostotapahtumat a) where ((h.tilaus = a.tilausnumero) < 131) */;
--
-- Final view structure for view toimipisteenmyynti
--
/*!50001 /*DROP TABLE IF EXISTS toimipisteenmyynti*/;
/*!50001 /*DROP VIEW IF EXISTS toimipisteenmyynti*/;
/*!50001 CREATE VIEW toimipisteenmyynti AS select h.toimipisteID AS toimipisteID,h.paikkakunta AS paikkakunta,h.tuote AS tuote,a.tilausnumero AS tilausnumero,a.tuotenumero AS tuotenumero,a.myyntipaikka AS myyntipaikka from (toimipisteet h join ostotapahtumat a) where ((a.myyntipaikka = h.paikkakunta) and ((h.tuote = a.tuotenumero) < 131)) */;
--
-- Final view structure for view työntekijät
--
/*!50001 /*DROP TABLE IF EXISTS työntekijät*/;
/*!50001 /*DROP VIEW IF EXISTS työntekijät*/;
/*!50001 CREATE VIEW tyÃ¶ntekijÃ€t AS select h.tyontekijaID AS tyontekijaID,h.etunimi AS etunimi,h.sukunimi AS sukunimi,h.tehtavanimike AS tehtavanimike,h.kotikunta AS kotikunta,h.email AS email,a.toimipisteID AS toimipisteID,a.paikkakunta AS paikkakunta from (tyontekijat h join toimipisteet a) where ((h.kotikunta = a.paikkakunta) < 131) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- Dump completed on 2015-02-23 19:33:35
