-- SCRIPT D'INSERTION DE DONNEES

-- CLIENTS
-- CREATION DES DIFFERENYTS CLIENTS
Insert into CLIENT (NUMCLIENT, NOM, ADRESSE)
VALUES 
(1, "SCHMITT", "RUE DE LA HAUTE MONTEE"),
 ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "ALGORE", "AVENUE DE LA FORET"),
 ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "MAURICIA", "CHEMIN DE L'ETANG"),
 ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "CELINE RUEZ", "TOUR MONTPARNASSE"),
 ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "STUART", "ROUTE DE LA SOURIS VERTE");
 
 -- LE CODE CI DESSUS NE FONCTIONNE PAS, :( - SAUF si je n'utilise pas le max(Numclient), mais je prefere l'utiliser
 
 Insert into CLIENT (NUMCLIENT, NOM, ADRESSE)
VALUES (1, "SCHMITT", "RUE DE LA HAUTE MONTEE");

Insert into CLIENT (NUMCLIENT, NOM, ADRESSE)
 VALUES ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "ALGORE", "AVENUE DE LA FORET");
 
Insert into CLIENT (NUMCLIENT, NOM, ADRESSE)
VALUES  ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "MAURICIA", "CHEMIN DE L'ETANG");

Insert into CLIENT (NUMCLIENT, NOM, ADRESSE)
VALUES  ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "CELINE RUEZ", "TOUR MONTPARNASSE");

Insert into CLIENT (NUMCLIENT, NOM, ADRESSE)
 VALUES ((SELECT MAX(NUMCLIENT) FROM CLIENT)+1, "STUART", "ROUTE DE LA SOURIS VERTE");
 


--CLIENTS - CONTRAT
--Un client peut signer un ou plusieurs contrats - CELINE RUEZ n'a pas de contrat
Insert into CONTRAT (SIGNATAIRE, NUMCTR, TYPE, DATESIGN)
VALUES ("SCHMITT",1, "VOITURE - TIER", "21-03-1999"); --contrat voiture

Insert into CONTRAT (SIGNATAIRE, NUMCTR, TYPE, DATESIGN)
VALUES ("STUART",(SELECT MAX(NUMCTR) FROM CONTRAT)+1, "VOITURE - TIER", "10-05-2007"); --contrat voiture

Insert into CONTRAT (SIGNATAIRE, NUMCTR, TYPE, DATESIGN)
VALUES ("STUART",(SELECT MAX(NUMCTR) FROM CONTRAT)+1, "VOITURE - COMPLET", "12-12-2001"); --contrat voiture

Insert into CONTRAT (SIGNATAIRE, NUMCTR, TYPE, DATESIGN)
VALUES ("MAURICIA",(SELECT MAX(NUMCTR) FROM CONTRAT)+1, "HABITAT", "07-07-2001"); --contrat Habitation

Insert into CONTRAT (SIGNATAIRE, NUMCTR, TYPE, DATESIGN)
VALUES ("ALGORE",(SELECT MAX(NUMCTR) FROM CONTRAT)+1, "VOITURE - EXTRA++", "05-08-2014"); --contrat voiture

Insert into CONTRAT (SIGNATAIRE, NUMCTR, TYPE, DATESIGN)
VALUES ("ALGORE",(SELECT MAX(NUMCTR) FROM CONTRAT)+1, "VOITURE - TIER", "05-08-2014"); --contrat voiture

-- CLIENT - VEHICULE - CONTRAT
-- Un client peut avoir un ou plusieurs vehicule
--Un Contrat Couvre un ou aucun vehicule (ex contrat habitation du Client MAURICIA)
--IL est nativement possible d'avoir une annee de vehicule superieur a la date du contrat (a changer)

insert into VEHICULE (NUMVEH, MARQUE, MODELE, ANNEE, CYLINDREE, SIGNATAIRE, NUMCTR, NUMCLIENT)
VALUES
("DP-952-AM", "OPEL", "Connaispas", "2000",4, "SCHMITT", 1, 1),
("AZ-21-PE", "CITROEN", "SAXO", "1999",4, "STUART", 2, 5),
("AA-999-CC", "LAMBORGINI", "DIABLO", "2001",8, "STUART",  3, 5),
("pp-666-ty", "ROYCE ROLLS", "AC75", "2000",6, "ALGORE", 5, 2),
("DF-20-MP", "FIAT", "PANDA", "2008",4, "ALGORE", 6, 2);


--ACCIDENT
-- Un vehicule peut etre impliqué dans aucun ou plusieurs accidents
-- Il est possible d'avoir des accident dans des date inferieur a la creation du contrat ou meme de l'obtention du vehicule
-- Un accident avec autre chose qu'un vehicule (maison) ne semble pas prit en compte
-- car une implication a besoin d'un numero de vehicule
Insert into ACCIDENT (NUMACC, DATEACC, MONTANT)
VALUES
(1, "12-05-2010", 1000), -- MEME accident que la ligne en dessous
(1, "12-05-2010", 1000),
(3, "05-12-2011", 4000),
(4, "01-01-2005", 1000),
(5, "03-04-2003", 1000);



-- IMPLICATION

insert into IMPLICATION(NUMACC, NUMVEH)
VALUES
(1,"DP-952-AM"), -- MEME accident que la ligne en dessous
(1,"AZ-21-PE"),
(3,"AA-999-CC"),
(4,"pp-666-ty"),
(5,"DP-952-AM");












