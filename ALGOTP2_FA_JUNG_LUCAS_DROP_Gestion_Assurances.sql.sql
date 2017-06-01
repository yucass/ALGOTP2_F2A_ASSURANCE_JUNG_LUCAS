--suppression

-- VIDAGE DES TABLES


-- suppression des clients
DELETE From CLIENT;

--suppression des Accidents
DELETE from ACCIDENT;

--Suppression des contrats
DELETE from CONTRAT;

-- Supression des Vehicules
DELETE from VEHICULE;

--Suppression des implication
DELETE From IMPLICATION;


-- SUPPRESSION DES INDEX


Drop index XNUM_CLIENT;

Drop index XNUM_ACCIDENT;

Drop index XNUM_CONTRAT;




-- SUPPRESSION DES TABLES


--CLIENT
Drop table CLIENT;

--CONTRATS
Drop table CONTRAT;

-- VEHICULE
Drop table VEHICULE;

--IMPLICATION
Drop table IMPLICATION;

--ACCIDENT

Drop table ACCIDENT;


Drop DATABASE IF EXISTS SP_VEHICULE;
Drop DATABASE IF EXISTS SP_CLIENT;

