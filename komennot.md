#Tietokanta 

CREATE DATABASE astikantsql DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_swedish_ci; 

USE astikantsql YRITYS mysql;

##yritys
CREATE TABLE yritys(
Yritysnimi VARCHAR(30) NOT NULL,
Ytunnus VARCHAR(30) NOT NULL,
puhelinnro VARCHAR(15) NOT NULL,
fax VARCHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
katuosoite VARCHAR(50) NOT NULL,
postinro VARCHAR(50) NOT NULL,
paikkakunta VARCHAR(30) NOT NULL,
PRIMARY KEY (Yritysnimi)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utt8_swedish_ct; 

##toimipisteet
CREATE TABLE toimipisteet(
toimipisteID int(10) NOT NULL,
puhelinnro VARCHAR(15) NOT NULL,
fax VARCHAR(15) NOT NULL,
email VARCHAR(188) NOT NULL,
katuosoite VARCHAR(58) NOT NULL,
postinro VARCHAR(50) NOT NULL,
paikkakunta VARCHAR(30) NOT NULL,
Yritysnimi VARCHAR(30) NOT NULL,
PRIMARY KEY (toimipisteID),
FOREIGN KEY (Yritysnimi) REFERENCES yritys(Yritysnimi)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_swedish_ci;

##työntekijät
CREATE TABLE tyontekijat(
tyontekijaID INT(8) NOT NULL,
etunimi VARCHAR(38) ,
sukunimi VARCHAR(30) NOT NULL,
tehtavanimike VARCHAR(38),
puhelinnro VARCHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
katuosoite VARCHAR(50) NOT NULL,
postinro VARCHAR(58) NOT NULL,
kotikunta VARCHAR(38) NOT NULL,
hetu VARCHAR(18) NOT NULL,
toimipisteID int(18) NOT NULL,
PRIMARY KEY (tyontekijaID),
FOREIGN KEY (toimipisteID) REFERENCES toimipisteet(toimipisteID)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_swedish_ci;

##palkkatiedot
CREATE TABLE palkkatiedot(
PalkkaID INT(8) NOT NULL,
kkpalkka VARCHAR(10) NOT NULL,
veroprosentti VARCHAR(5) NOT NULL,
tilinumero VARCHAR(30) NOT NULL,
vuorolisä VARCHAR(10) NOT NULL,
tyontekijaID INT(8) NOT NULL,
PRIMARY KEY (PalkkaID),
FOREIGN KEY (tyontekijaID) REFERENCES tyontekijat(tyontekijaID)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_swedish_ci;

##asiakkaat

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
PRIMARY KEV (astakasnunero)
) ENGINE.InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_swedish_ci;

#tuotteet

CREATE TABLE tuotteet(
tuotenunero INT(15) NOT NULL,
tuotenimi VARCHAR(50) NOT NULL,
toimittaja VARCHAR(30) NOT NULL,
verotonhinta VARCHAR(15) NOT NULL,
alvprosentti INT(3) NOT NULL,
varastosaldo INT(50) NOT NULL,
PRIMARY KEY (tuotenunero)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_swedish_ci;

##ostot

CREATE TABLE ostotapahtunat(
tilausnumero INT(15) NOT NULL,
tuotenumnero INT(15) NOT NULL,
asiakasnumero INT(15) NOT NULL,
toimipisteID int(10) NOT NULL,
verotonhtnta VARCHAR(15) NOT NULL,
alvprosenttt INTO) NOT NULL,
PRIMARY KEY (tilausnumero),
FOREIGN KEV (asiakasnumero) REFERENCES asiakkaat(asiakasnumero),
FOREIGN KEV (totmtptsteID) REFERENCES totmtpisteet(totmtpisteID),
FOREIGN KEV (tuotenunero) REFERENCES tuotteet(tuotenunero)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_swedish_ci;
