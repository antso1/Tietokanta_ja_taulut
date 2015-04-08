##TIETOKANTATAULUT VIITEEHEYDELLÄ

CREATE TABLE yritys(
Yritysnimi VARCHAR(30) NOT NULL,
Ytunnus VARCHAR(30) NOT NULL,
puhelinnro VARCHAR(15) NOT NULL,
fax VARCHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
katuosoite VARCHAR(50) NOT NULL,
postinro VARCHAR(50) NOT NULL,
paikkakunta VARCHAR(30) NOT NULL,
CONSTRAINT Yritysnimi_pk PRIMARY KEY (Yritysnimi)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE
utf8_swedish_ci;

CREATE TABLE toimipisteet(
toimipisteID INT(5) NOT NULL,
puhelinnro VARCHAR(15) NOT NULL,
fax VARCHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
katuosoite VARCHAR(50) NOT NULL,
postinro VARCHAR(50) NOT NULL,
paikkakunta VARCHAR(30) NOT NULL,
Yritysnimi VARCHAR(30) NOT NULL,
PRIMARY KEY (toimipisteID),
CONSTRAINT FOREIGN KEY (Yritysnimi) REFERENCES yritys(Yritysnimi)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE
utf8_swedish_ci;

CREATE TABLE tyontekijat(
tyontekijaID INT(10) NOT NULL,
etunimi VARCHAR(30) ,
sukunimi VARCHAR(30) NOT NULL,
tehtavanimike VARCHAR(30),
puhelinnro VARCHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
katuosoite VARCHAR(50) NOT NULL,
postinro VARCHAR(50) NOT NULL,
kotikunta VARCHAR(30) NOT NULL,
hetu VARCHAR(10) NOT NULL,
toimipisteID int(10) NOT NULL,
PRIMARY KEY (tyontekijaID),
CONSTRAINT FOREIGN KEY (toimipisteID) REFERENCES
toimipisteet(toimipisteID)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE
utf8_swedish_ci;

CREATE TABLE palkkatiedot(
PalkkaID INT(8) NOT NULL,
kkpalkka VARCHAR(10) NOT NULL,
veroprosentti VARCHAR(5) NOT NULL,
tilinumero VARCHAR(30) NOT NULL,
vuorolisä VARCHAR(10) NOT NULL,
tyontekijaID INT(8) NOT NULL,
PRIMARY KEY (PalkkaID),
CONSTRAINT FOREIGN KEY (tyontekijaID) REFERENCES
tyontekijat(tyontekijaID)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE
utf8_swedish_ci;

CREATE TABLE asiakkaat(
asiakasnumero INT(15) NOT NULL,
etunimi VARCHAR(30) NOT NULL,
sukunimi VARCHAR(30) NOT NULL,
puhelinnro VARCHAR(15) NOT NULL,
email VARCHAR(100),
katuosoite VARCHAR(50) NOT NULL,
postinro VARCHAR(50) NOT NULL,
kotikunta VARCHAR(30) NOT NULL,
maa VARCHAR(30) NOT NULL,
tilausnumero INT(15),
PRIMARY KEY (asiakasnumero)
CONSTRAINT FOREIGN KEY (tilausnumero) REFERENCES
ostotapahtumat(tilausnumero)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE
utf8_swedish_ci;

CREATE TABLE tuotteet(
tuotenumero INT(15) NOT NULL,
tuotenimi VARCHAR(50) NOT NULL,
toimittaja VARCHAR(30) NOT NULL,
verotonhinta VARCHAR(15) NOT NULL,
alvprosentti INT(3) NOT NULL,
varastosaldo INT(50) NOT NULL,
PRIMARY KEY (tuotenumero)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE
utf8_swedish_ci;

CREATE TABLE ostotapahtumat(
tilausnumero INT(15) NOT NULL,
tuotenumero INT(15) NOT NULL,
asiakasnumero INT(15) NOT NULL,
toimipisteID int(10) NOT NULL,
verotonhinta VARCHAR(15) NOT NULL,
alvprosentti INT(3) NOT NULL,
PRIMARY KEY (tilausnumero),
FOREIGN KEY (asiakasnumero) REFERENCES asiakkaat(asiakasnumero),
FOREIGN KEY (toimipisteID) REFERENCES toimipisteet(toimipisteID),
FOREIGN KEY (tuotenumero) REFERENCES tuotteet(tuotenumero),
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE
utf8_swedish_ci;


##TAULUJEN SISÄLTÖ

###yritys

INSERT INTO yritys VALUES ('Tavaratalo Oy', '1789130-5', '0200152152',
'0200153153', 'yhteys@tavaratalo.fi', 'firmatie 1', '33101', 'Tampere');
INSERT INTO toimipisteet VALUES ('1', '0200152154', '0200154154',
'tampere@tavaratalo.fi', 'firmatie 1', '33101', 'Tampere', 'Tavaratalo Oy');
INSERT INTO toimipisteet VALUES ('2', '0200152155', '0200155155',
'joensuu@tavaratalo.fi', 'kukkatie 12', '80100', 'Joensuu', 'Tavaratalo Oy');
INSERT INTO toimipisteet VALUES ('3', '0200152156', '0200156156',
'savonlinna@tavaratalo.fi', 'linnapolku 17', '57100', 'Savonlinna', 'Tavaratalo
Oy');

###toimipisteet
INSERT INTO toimipisteet VALUES ('4', '0200152157', '0200157157',
'mikkeli@tavaratalo.fi', 'tietokatu 12 a', '50100', 'Mikkeli', 'Tavaratalo Oy');
INSERT INTO toimipisteet VALUES ('5', '0200152158', '0200158158',
'juva@tavaratalo.fi', 'Kalkkunakatu 13 b 5', '51900', 'Juva', 'Tavaratalo Oy');
INSERT INTO toimipisteet VALUES ('6', '0200152159', '0200159159',
'kuopio@tavaratalo.fi', 'teknopolis 11 M 10', '70100', 'Kuopio', 'Tavaratalo Oy');
INSERT INTO tyontekijat VALUES ('122001', 'matti', 'kivi', 'tekninen
asiantuntija', '0402531547', 'matti.kivi@tavaratalo.fi', 'kiekkokatu 1 a 19',
'33100', 'Tampere', '120574-0344', '1');
INSERT INTO tyontekijat VALUES ('122002', 'antti', 'kekkonen', 'tekninen
asiantuntija', '0500125879', 'antti.kekkonen@tavaratalo.fi', 'kalukukkokatu 12
a 1', '70100', 'Kuopio', '310577-012F', '6');
INSERT INTO tyontekijat VALUES ('122003', 'minna', 'makkonen',
'markkinointisihteeri', '04061345485', 'minna.makkonen@tavaratalo.fi',
'lautatie 12', '33100', 'Tampere', '010674-1124', '1');
INSERT INTO tyontekijat VALUES ('122004', 'veijo', 'kekäläinen', 'myynnin
asiantuntija', '05001155415', 'veijo.kekalainen@tavaratalo.fi', 'Matinkatu 11',
'57200', 'savonlinna', '110371-1135', '3');
INSERT INTO tyontekijat VALUES ('122005', 'matti', 'veijola', 'johtava
suunnittelija', '0401564885', 'matti.veijola@tavaratalo.fi', 'kiekkotie 1', '51900',
'juva', '150266-050A', '5');
INSERT INTO tyontekijat VALUES ('122006', 'lea', 'jokinen', 'varastopäällikkö',
'04578123458', 'lea.jokinen@tavaratalo.fi', 'muulikatu 15 a 1', '80100',
'Joensuu', '140571-0999', '2');
INSERT INTO tyontekijat VALUES ('122007', 'jani', 'majonen', 'varastomies',
'0406131452, 'jani.majonenn@tavaratalo.fi', 'lainetie 1221', '51900', 'Juva',
'010184-123D', '5');
INSERT INTO tyontekijat VALUES ('122008', 'jouni', 'susi', 'myyjä',
'0442587921', 'jouni.susi@tavaratalo.fi', 'Mattilankuja 18 B', '57120',
'savonlinna', '110361-1135', '3');
INSERT INTO tyontekijat VALUES ('122009', 'juha', 'mukula', 'tekninen
asiantuntija', '0401251547', 'juha.mukula@tavaratalo.fi', 'metsonkatu 1 n 1',
'33100', 'Tampere', '120584-0155', '1');
INSERT INTO tyontekijat VALUES ('122010', 'niina', 'kmäki', 'Myyjä',
'05001202555', 'niina.maki@tavaratalo.fi', 'talokuja 154', '70100', 'Kuopio',
'250475-085F', '6');

###palkat

INSERT INTO palkkatiedot VALUES ('333001', '2500', '28,5',
'FI80001546465165', '0', '122001');
INSERT INTO palkkatiedot VALUES ('333002', '2700', '25,5',
'FI80001541566555', '0', '122002');
INSERT INTO palkkatiedot VALUES ('333003', '2300', '26,5',
'FI80001156455165', '0', '122003');
INSERT INTO palkkatiedot VALUES ('333004', '2510', '28,0',
'FI80001858998488', '50', '122004');
INSERT INTO palkkatiedot VALUES ('333005', '2200', '22,5',
'FI80001589584556', '0', '122005');
INSERT INTO palkkatiedot VALUES ('333006', '3000', '24,5',
'FI80001684655646', '0', '122006');
INSERT INTO palkkatiedot VALUES ('333007', '2000', '23,0',
'FI80001596385855', '50', '122007');
INSERT INTO palkkatiedot VALUES ('333008', '2800', '22,5',
'FI80009989842522', '50', '122008');
INSERT INTO palkkatiedot VALUES ('333009', '2200', '26,0',
'FI80003189989969', '0', '122009');
INSERT INTO palkkatiedot VALUES ('333010', '1900', '20,5',
'FI80001110044553', '0', '122010');

##asiakkaat

INSERT INTO asiakkaat VALUES ('1101', 'markku', 'ikonen', '04512458979',
'make@gmail.com', 'ekatie 1', '33101', 'Tampere', 'suomi', '11201');
INSERT INTO asiakkaat VALUES ('1102', 'ville', 'jakonen', '04512445859',
'viki99@jippii.fi', 'kukkatie 12', '80100', 'Joensuu', 'suomi', '11202');
INSERT INTO asiakkaat VALUES ('1103', 'sauli', 'niinistö', '04012445859',
'saukki@hotmail.fi', 'linnapolku 17', '57100', 'Savonlinna', 'suomi', '1203');
INSERT INTO asiakkaat VALUES ('1104', 'jani', 'volanen', '04412445859',
'mikkeli@outlook.com', 'tietokatu 12 a', '50100', 'Mikkeli', 'suomi', '1204');
INSERT INTO asiakkaat VALUES ('1105', 'jyrki', 'poikanen', '0406986896',
'mjusukk@gmail.com', 'firmatie 1', '33101', 'Tampere', 'suomi', '1205');
INSERT INTO asiakkaat VALUES ('1106', 'helga', 'berg', '0556989689',
'jere.m@jippii.fi', 'kukkatie 12', '80100', 'Joensuu', 'suomi', '11206');
INSERT INTO asiakkaat VALUES ('1107', 'jonne', 'eeso', '0458689699',
'soopeli@hotmail.fi', 'linnapolku 17', '57100', 'Savonlinna', 'suomi', '11207');
INSERT INTO asiakkaat VALUES ('1108', 'keijo', 'kutvonen', '040885859',
'keijo.kutvonen@outlook.com', 'tietokatu 12 a', '50100', 'Mikkeli', 'suomi',
'11208');
INSERT INTO asiakkaat VALUES ('1109', 'ilona', 'mononen', '0448545859',
'make@gmail.com', 'firmatie 1', '33101', 'Tampere', 'suomi', '11209');
INSERT INTO asiakkaat VALUES ('1110', 'rauni', 'ranta', '04512445559',
'mauser@jippii.fi', 'kukkatie 12', '80100', 'Joensuu', 'suomi', '11210');

###tuotteet

INSERT INTO tuotteet VALUES ('5501', 'luuta', 'kiinatrade oy', '12,00', '23',
'120');
INSERT INTO tuotteet VALUES ('5502', 'vene', 'venho oyj', '1200,00', '23', '50');
INSERT INTO tuotteet VALUES ('5503', 'lapio', 'kiinatrade oy', '35,00', '23',
'200');
INSERT INTO tuotteet VALUES ('5504', 'onki', 'rapala oyj', '25,00', '23', '150');
INSERT INTO tuotteet VALUES ('5505', 'lauta', 'kiinatrade oy', '10,00', '23',
'1000');
INSERT INTO tuotteet VALUES ('5506', 'kuppi', 'kiinatrade oy', '5,00', '23',
'121');
INSERT INTO tuotteet VALUES ('5507', 'tuoppi', 'iittala oyj', '18,00', '23', '55');
INSERT INTO tuotteet VALUES ('5508', 'kuuppa', 'kiinatrade oy', '3,00', '23',
'235');
INSERT INTO tuotteet VALUES ('5509', 'leluauto', 'mattel inc', '3,00', '23',
'335');
INSERT INTO tuotteet VALUES ('5511', 'leija', 'kiinatrade oy', '33,00', '23', '22');
INSERT INTO tuotteet VALUES ('5512', 'autokatos', 'pressu oy', '555,00', '23',
'17');


###ostot

INSERT INTO ostotapahtumat VALUES ('00001001', '5501', '1101', '3', '12,00',
'23');
INSERT INTO ostotapahtumat VALUES ('00001002', '5501', '1103', '5', '12,00',
'23');
INSERT INTO ostotapahtumat VALUES ('00001003', '5503', '1103', '3', '35,00',
'23');
INSERT INTO ostotapahtumat VALUES ('00001004', '5503', '1103', '1', '35,00',
'23');
INSERT INTO ostotapahtumat VALUES ('00001005', '5505', '1102', '2', '10,00',
'23');
INSERT INTO ostotapahtumat VALUES ('00001006', '5507', '1105', '2', '18,00',
'23');
INSERT INTO ostotapahtumat VALUES ('00001007', '5502', '1106', '3',
'1200,00', '23');
INSERT INTO ostotapahtumat VALUES ('00001008', '5501', '1107', '4', '12,00',
'23');
INSERT INTO ostotapahtumat VALUES ('00001009', '5501', '1109', '3', '12,00',
'23');


##NÄKYMÄT

CREATE VIEW työntekijät AS SELECT h.tyontekijaID, h.etunimi, h.sukunimi,
h.tehtavanimike,
h.kotikunta, h.email,
a.toimipisteID, a.paikkakunta FROM tyontekijat h, toimipisteet a WHERE
h.kotikunta=a.paikkakunta<131; 


CREATE VIEW asiakasostot AS SELECT h.etunimi, h.sukunimi, h.puhelinnro,
h.email, h.tilaus, a.tilausnumero, a.tuotenumero FROM asiakkaat h,
ostotapahtumat a WHERE h.tilaus=a.tilausnumero<131;
CREATE VIEW toimipisteenmyynti AS SELECT h.toimipisteID, h.paikkakunta,
h.tuote, a.tilausnumero,
a.tuotenumero, a.myyntipaikka FROM toimipisteet h,
ostotapahtumat a WHERE h.tilaus=a.tilausnumero<131;
