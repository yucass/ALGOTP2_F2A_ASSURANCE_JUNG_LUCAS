create DATABASE SP_CLIENT
create DATABASE SP_VEHICULE


Create table CLIENT (
		NUMCLIENT char (12) not null,
		NOM char (38) not null,
		ADRESSE char (60) not null,
Primary key (NUMCLIENT));

create table ACCIDENT (
		NUMACC int (12) not null,
		DATEACC date not null,
		MONTANT int (10),
Primary key (NUMACC));

Create table CONTRAT (
		SIGNATAIRE char (38) not null,
		NUMCTR int (8) not null,
		TYPE char (12) not null,
		DATESIGN date not null,
Primary key (SIGNATAIRE, NUMCTR),
Foreign key (SIGNATAIRE) references CLIENT(NOM)
	on delete no action on update cascade);


Create table VEHICULE(
		NUMVEH char (16) not null,
		MARQUE char (16) not null,
		MODELE char (30) not null,
		ANNEE date not null,
		CYLINDREE int (6) not null,
		SIGNATAIRE char (38) not null,
		NUMCTR int (8) not null,
		NUMCLIENT char (12) not null,
Primary key (NUMVEH),
Unique (NUMCLIENT, NUMCTR),
Foreign key (NUMCLIENT) references CLIENT(NUMCLIENT)
	on delete no action on update cascade,
Foreign key (NUMCTR) references CONTRAT(NUMCTR)
	on delete no action on update cascade,
FOREIGN key (SIGNATAIRE) references CONTRAT(SIGNATAIRE)
	on delete no action on update cascade);

Create table IMPLICATION (
		NUMACC int (12) not null,
		NUMVEH char (16) not null,
Primary key  (NUMACC, NUMVEH),
foreign key (NUMACC) references ACCIDENT(NUMACC)
	on delete no action on update cascade,
foreign key (NUMVEH) references VEHICULE(NUMVEH)
	on delete no action on update cascade);

create unique index XNUM_CLIENT on CLIENT (NUMCLIENT);
create index XNUM_ACCIDENT on ACCIDENT (NUMACC);
create index XNUM_CONTRAT on CONTRAT (NUMCTR);