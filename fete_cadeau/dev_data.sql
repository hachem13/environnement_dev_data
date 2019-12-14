CREATE TABLE IF NOT EXISTS `dev_data`( 
`ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
`nom` varchar(30) NOT NULL,
`age` SMALLINT NOT NULL DEFAULT '0',
`email` varchar(30) NOT NULL
KEY`ID`(`ID`)
);

INSERT INTO `dev_data` (`ID` ,`nom`, `age` ,`email`) VALUES
(1, 'Samba Cisse', 48, 'samba.cisse.data@gmail.com'),
(2, 'Lachaal Rafik', 35, 'rafik.lachaal.data@gmail.com'),
(3, 'Michel Jonathan', 33, 'joshua.harris.data@gmail.com'),
(4, 'Mosbah hachem', 35, 'hachem.mosbah.data@gmail.com'),
(5, 'Dridi ines', 38, 'ines.dridi.data@gmail.com'),
(6, 'Randon Ludovic', 26, 'ludovic.randon.data@gmail.com'),
(7, 'Lucido Yoann', 21, 'Yoann.Lucido.data@gmail.com'),
(8, 'Sauer Noemie', 21, 'noemie.sauer.data@gmail.com'),
(9, 'Nasr Sabine', 27, 'sabine.nasr.data@gmail.com'),
(10, 'Grimaldi Romain', 30, 'romain.grimaldi.data@gmail.com'),
(11, 'Kojic Sacha', 19, 'sacha.kojic.data@gmail.com'),
(12, 'Harris Joshua', 24, 'joshua.harris.data@gmail.com'),
(13, 'Poinsu Dylan', 26, 'dylan.poinsu.data@gmail.com'),
(14, 'Kaddous Daniel', 23, 'daniel.kaddous.data@gmail.com'),
(15, 'Bourezak Yacine', 23, 'yacine.bourezak.data@gmail.com'),
(16, 'Belletrud Xavier', 30, 'xavier.belletrud.data@gmail.com'),
(17, 'Baya Lotfi', 23, 'lotfi.baya.data@gmail.com'),
(18, 'Boualam Amaria', 52, 'Amaria.boualam.data@gmail.com'),
(19, 'Alissadoni Djoumbé', 19, 'djoumbé.alissadouni.data@gmail.com');
