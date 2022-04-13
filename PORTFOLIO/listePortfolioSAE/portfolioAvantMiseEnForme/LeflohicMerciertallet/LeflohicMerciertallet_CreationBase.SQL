/*
 ----------------------------------------------------------------------------
             Génération d'une base de données pour
                        SQL Server 2005
                       (20/1/2022 8:41:38)
 ----------------------------------------------------------------------------
     Nom de la base : S1B_leflochic_merciertallet
     Projet : 
     Auteur : CRIIUT
     Date de dernière modification : 20/1/2022 8:41:14
 ----------------------------------------------------------------------------
*/

drop database S1B_leflochic_merciertallet
go

/* -----------------------------------------------------------------------------
      OUVERTURE DE LA BASE leflochicmerciertallet
----------------------------------------------------------------------------- */

create database S1B_leflochic_merciertallet
go

use S1B_leflochic_merciertallet
go



/* -----------------------------------------------------------------------------
      TABLE : COMMANDE
----------------------------------------------------------------------------- */

create table COMMANDE
  (
     NDECOMMANDE int identity (1, 1)   ,
     CODECHATEAU smallint  not null  ,
     DATEACHAT datetime  null  ,
     DATELIVRAISONESTIMÉE datetime  null  ,
     ADRESSELIVRAISON char(32)  null  
     ,
     constraint PK_COMMANDE primary key (NDECOMMANDE)
  ) 
go



/*      INDEX DE COMMANDE      */



/* -----------------------------------------------------------------------------
      TABLE : CHATEAU
----------------------------------------------------------------------------- */

create table CHATEAU
  (
     CODECHATEAU smallint identity (1, 1)   ,
     NOMCHATEAU char(32)  null  ,
     ADRESSE char(32)  null  ,
     COORDONNEESBANCAIRE char(32)  null  ,
     NOMCONTACT char(32)  null  ,
     NUMTELCONTACT char(10)  null  ,
     APPELLATIONVITICOLE char(32)  null  
     ,
     constraint PK_CHATEAU primary key (CODECHATEAU)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : CLASSEMENT1855
----------------------------------------------------------------------------- */

create table CLASSEMENT1855
  (
     NCLASSEMENT smallint identity (1, 1)   ,
     CODEVIN int  not null  ,
     CRU char(32)  null  ,
     COTE char(10)  null  ,
     PRIX smallint  null  
     ,
     constraint PK_CLASSEMENT1855 primary key (NCLASSEMENT)
  ) 
go



/*      INDEX DE CLASSEMENT1855      */



/* -----------------------------------------------------------------------------
      TABLE : VIN
----------------------------------------------------------------------------- */

create table VIN
  (
     CODEVIN int identity (1, 1)   ,
     CODECHATEAU smallint  null  ,
     MILLÉSIME char(32)  null  ,
     QUANTITÉ smallint  null  
     ,
     constraint PK_VIN primary key (CODEVIN)
  ) 
go



/*      INDEX DE VIN      */



/* -----------------------------------------------------------------------------
      TABLE : VIN_ACHETÉ
----------------------------------------------------------------------------- */

create table VIN_ACHETÉ
  (
     CODEVIN int  not null  ,
     NDECOMMANDE int  not null  ,
     PRIX smallint  null  ,
     QUANTITÉ smallint  null  
     ,
     constraint PK_VIN_ACHETÉ primary key (CODEVIN, NDECOMMANDE)
  ) 
go



/*      INDEX DE VIN_ACHETÉ      */



/* -----------------------------------------------------------------------------
      REFERENCES SUR LES TABLES
----------------------------------------------------------------------------- */



alter table COMMANDE 
     add constraint FK_COMMANDE_CHATEAU foreign key (CODECHATEAU) 
               references CHATEAU (CODECHATEAU)
go




alter table CLASSEMENT1855 
     add constraint FK_CLASSEMENT1855_VIN foreign key (CODEVIN) 
               references VIN (CODEVIN)
go




alter table VIN 
     add constraint FK_VIN_CHATEAU foreign key (CODECHATEAU) 
               references CHATEAU (CODECHATEAU)
go




alter table VIN_ACHETÉ 
     add constraint FK_VIN_ACHETÉ_VIN foreign key (CODEVIN) 
               references VIN (CODEVIN)
go




alter table VIN_ACHETÉ 
     add constraint FK_VIN_ACHETÉ_COMMANDE foreign key (NDECOMMANDE) 
               references COMMANDE (NDECOMMANDE)
go




/*
 -----------------------------------------------------------------------------
               FIN DE GENERATION
 -----------------------------------------------------------------------------
*/