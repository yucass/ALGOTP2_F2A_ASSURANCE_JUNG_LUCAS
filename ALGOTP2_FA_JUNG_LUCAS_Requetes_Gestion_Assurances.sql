--REQUETE


-- VEHICULE AVEC LA PLAQUE COMMENCANT PAR A
select * from Vehicule where NUMVEH like ("A%")

-- Liste des vehicule par client
select * from Vehicule, CLIENT where CLIENT.NUMCLIENT = VEHICULE.NUMCLIENT
Order by CLIENT.NOM

-- Liste des client qui n'ont pas de vehicule

select * from  CLIENT where NUMCLIENT not in (select NUMCLIENT from VEHICULE)
Order by NOM

-- Nombre total de CLIENT
SELECT COUNT(NUMCLIENT) as Nombre_Client from CLIENT
