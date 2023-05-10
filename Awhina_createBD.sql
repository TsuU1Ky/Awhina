/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  16/11/2022 16:37:17                      */
/*==============================================================*/


alter table Chef_d_equipe
   drop constraint FK_CHEF_D_E_ROLE4_IDSAL;

alter table Chef_d_exploitation
   drop constraint FK_CHEF_D_E_ROLE3_IDSAL;

alter table Commercial
   drop constraint FK_COMMERCI_ROLE2_IDSAL;

alter table Conducteur
   drop constraint FK_CONDUCTE_ROLE_IDSAL;

alter table Conduire
   drop constraint FK_CONDUIRE_CONDUIRE_IDVHC;

alter table Conduire
   drop constraint FK_CONDUIRE_CONDUIRE2_IDSAL;

alter table Conduire
   drop constraint FK_CONDUIRE_CONDUIRE3_IDCTR;

alter table Immobiliser
   drop constraint FK_IMMOBILI_IMMOBILIS_IDIMMO;

alter table Immobiliser
   drop constraint FK_IMMOBILI_IMMOBILIS_IDVHC;

alter table Immobiliser
   drop constraint FK_IMMOBILI_IMMOBILIS_IDGARAGE;

alter table Payer
   drop constraint FK_PAYER_PAYER_IDCLIENT;

alter table Payer
   drop constraint FK_PAYER_PAYER2_PAIEMENT;

alter table Payer
   drop constraint FK_PAYER_PAYER3_IDCTR;

alter table Responsable_d_agence
   drop constraint FK_RESPONSA_ROLE5_IDSAL;

alter table Travailler
   drop constraint FK_TRAVAILL_TRAVAILLE_IDSAL;

alter table Travailler
   drop constraint FK_TRAVAILL_TRAVAILLE_IDCTR;

alter table etre_absent
   drop constraint FK_ETRE_ABS_ETRE_ABSE_IDSAL2;

alter table etre_absent
   drop constraint FK_ETRE_ABS_ETRE_ABSE_IDABS;

alter table etre_immobiliser
   drop constraint FK_ETRE_IMM_ETRE_IMMO_IDIMMO;

alter table etre_immobiliser
   drop constraint FK_ETRE_IMM_ETRE_IMMO_IDVHC;

alter table etre_parent_de
   drop constraint FK_ETRE_PAR_ETRE_PARE_IDSAL;

alter table etre_parent_de
   drop constraint FK_ETRE_PAR_ETRE_PARE_IDENF;

alter table etre_present
   drop constraint FK_ETRE_PRE_ETRE_PRES_IDAG;

alter table etre_present
   drop constraint FK_ETRE_PRE_ETRE_PRES_IDSAL;

alter table idAbs
   drop constraint FK_IDABS_ETRE_DE_T_IDTPABS;

alter table idAbs
   drop constraint FK_IDABS_LIER_IDCTR;

alter table idAg
   drop constraint FK_IDAG_ETRE_RESP_RESPONSA;

alter table idCtr
   drop constraint FK_IDCTR_CONCERNER_IDCLIENT;

alter table idCtr
   drop constraint FK_IDCTR_PROVENIR__IDAG;

alter table idCtr
   drop constraint FK_IDCTR_ENCADRER_CHEF_D_E;

alter table idCtr
   drop constraint FK_IDCTR_ETRE_CHAR_COMMERCI;

alter table idCtr
   drop constraint FK_IDCTR_SE_BASER__IDFORM;

alter table idCtr
   drop constraint FK_IDCTR_SUPERVISE_CHEF_D_E;

alter table idImmo
   drop constraint FK_IDIMMO_ETRE_DE_T_IDTPIMMO;

alter table idVhc
   drop constraint FK_IDVHC_ETRE_DE_T_IDTPVHC;

drop table Chef_d_equipe cascade constraints;

drop table Chef_d_exploitation cascade constraints;

drop table Commercial cascade constraints;

drop table Conducteur cascade constraints;

drop index CONDUIRE3_FK;

drop index CONDUIRE2_FK;

drop index CONDUIRE_FK;

drop table Conduire cascade constraints;

drop index IMMOBILISER3_FK;

drop index IMMOBILISER2_FK;

drop index IMMOBILISER_FK;

drop table Immobiliser cascade constraints;

drop table Paiement cascade constraints;

drop index PAYER3_FK;

drop index PAYER2_FK;

drop index PAYER_FK;

drop table Payer cascade constraints;

drop table Responsable_d_agence cascade constraints;

drop index TRAVAILLER2_FK;

drop index TRAVAILLER_FK;

drop table Travailler cascade constraints;

drop index ETRE_ABSENT_FK;

drop table etre_absent cascade constraints;

drop index ETRE_IMMOBILISER2_FK;

drop index ETRE_IMMOBILISER_FK;

drop table etre_immobiliser cascade constraints;

drop index ETRE_PARENT_DE2_FK;

drop index ETRE_PARENT_DE_FK;

drop table etre_parent_de cascade constraints;

drop index ETRE_PRESENT2_FK;

drop index ETRE_PRESENT_FK;

drop table etre_present cascade constraints;

drop index LIER_FK;

drop index ETRE_DE_TYPE_ABSENCE_FK;

drop table idAbs cascade constraints;

drop index ETRE_RESPONSABLE_DE_FK;

drop table idAg cascade constraints;

drop table idClient cascade constraints;

drop index ENCADRER_FK;

drop index ETRE_CHARGE_DE_FK;

drop index SUPERVISER_FK;

drop index PROVENIR_DE_FK;

drop index CONCERNER_FK;

drop index SE_BASER_SUR_FK;

drop table idCtr cascade constraints;

drop table idEnf cascade constraints;

drop table idForm cascade constraints;

drop table idGarage cascade constraints;

drop index ETRE_DE_TYPE_D_IMMO_FK;

drop table idImmo cascade constraints;

drop table idSal cascade constraints;

drop table idTpAbs cascade constraints;

drop table idTpImmo cascade constraints;

drop table idTpVhc cascade constraints;

drop index ETRE_DE_TYPE_DE_VEHICULE_FK;

drop table idVhc cascade constraints;

/*==============================================================*/
/* Table : Chef_d_equipe                                        */
/*==============================================================*/
create table Chef_d_equipe 
(
   idSal                INTEGER              not null,
   nbDemenagement       INTEGER              not null,
   anc                  INTEGER              not null,
   capaciteChefEq       SMALLINT             not null
      constraint CKC_CAPACITECHEFEQ_CHEF_D_E check (capaciteChefEq in (>3 anc OR >=10 nbDemenagements)),
   constraint PK_CHEF_D_EQUIPE primary key (idSal)
);

/*==============================================================*/
/* Table : Chef_d_exploitation                                  */
/*==============================================================*/
create table Chef_d_exploitation 
(
   idSal                INTEGER              not null,
   constraint PK_CHEF_D_EXPLOITATION primary key (idSal)
);

/*==============================================================*/
/* Table : Commercial                                           */
/*==============================================================*/
create table Commercial 
(
   idSal                INTEGER              not null,
   constraint PK_COMMERCIAL primary key (idSal)
);

/*==============================================================*/
/* Table : Conducteur                                           */
/*==============================================================*/
create table Conducteur 
(
   idSal                INTEGER              not null,
   permis               INTEGER              not null,
   constraint PK_CONDUCTEUR primary key (idSal)
);

/*==============================================================*/
/* Table : Conduire                                             */
/*==============================================================*/
create table Conduire 
(
   idVhc                INTEGER              not null,
   idSal                INTEGER              not null,
   idCtr                INTEGER              not null,
   nbKm                 FLOAT                not null,
   tmpsConduite         FLOAT                not null,
   constraint PK_CONDUIRE primary key (idVhc, idSal, idCtr)
);

/*==============================================================*/
/* Index : CONDUIRE_FK                                          */
/*==============================================================*/
create index CONDUIRE_FK on Conduire (
   idVhc ASC
);

/*==============================================================*/
/* Index : CONDUIRE2_FK                                         */
/*==============================================================*/
create index CONDUIRE2_FK on Conduire (
   idSal ASC
);

/*==============================================================*/
/* Index : CONDUIRE3_FK                                         */
/*==============================================================*/
create index CONDUIRE3_FK on Conduire (
   idCtr ASC
);

/*==============================================================*/
/* Table : Immobiliser                                          */
/*==============================================================*/
create table Immobiliser 
(
   idImmo               INTEGER              not null,
   idVhc                INTEGER              not null,
   idGar                INTEGER              not null,
   constraint PK_IMMOBILISER primary key (idImmo, idVhc, idGar)
);

/*==============================================================*/
/* Index : IMMOBILISER_FK                                       */
/*==============================================================*/
create index IMMOBILISER_FK on Immobiliser (
   idImmo ASC
);

/*==============================================================*/
/* Index : IMMOBILISER2_FK                                      */
/*==============================================================*/
create index IMMOBILISER2_FK on Immobiliser (
   idVhc ASC
);

/*==============================================================*/
/* Index : IMMOBILISER3_FK                                      */
/*==============================================================*/
create index IMMOBILISER3_FK on Immobiliser (
   idGar ASC
);

/*==============================================================*/
/* Table : Paiement                                             */
/*==============================================================*/
create table Paiement 
(
   idPaiement           INTEGER              not null,
   montantPaiement      FLOAT                not null,
   constraint PK_PAIEMENT primary key (idPaiement)
);

/*==============================================================*/
/* Table : Payer                                                */
/*==============================================================*/
create table Payer 
(
   idClient             INTEGER              not null,
   idPaiement           INTEGER              not null,
   idCtr                INTEGER              not null,
   constraint PK_PAYER primary key (idClient, idPaiement, idCtr)
);

/*==============================================================*/
/* Index : PAYER_FK                                             */
/*==============================================================*/
create index PAYER_FK on Payer (
   idClient ASC
);

/*==============================================================*/
/* Index : PAYER2_FK                                            */
/*==============================================================*/
create index PAYER2_FK on Payer (
   idPaiement ASC
);

/*==============================================================*/
/* Index : PAYER3_FK                                            */
/*==============================================================*/
create index PAYER3_FK on Payer (
   idCtr ASC
);

/*==============================================================*/
/* Table : Responsable_d_agence                                 */
/*==============================================================*/
create table Responsable_d_agence 
(
   idSal                INTEGER              not null,
   constraint PK_RESPONSABLE_D_AGENCE primary key (idSal)
);

/*==============================================================*/
/* Table : Travailler                                           */
/*==============================================================*/
create table Travailler 
(
   idSal                INTEGER              not null,
   idCtr                INTEGER              not null,
   constraint PK_TRAVAILLER primary key (idSal, idCtr)
);

/*==============================================================*/
/* Index : TRAVAILLER_FK                                        */
/*==============================================================*/
create index TRAVAILLER_FK on Travailler (
   idSal ASC
);

/*==============================================================*/
/* Index : TRAVAILLER2_FK                                       */
/*==============================================================*/
create index TRAVAILLER2_FK on Travailler (
   idCtr ASC
);

/*==============================================================*/
/* Table : etre_absent                                          */
/*==============================================================*/
create table etre_absent 
(
   idSal                INTEGER              not null,
   idAbs                INTEGER              not null,
   constraint PK_ETRE_ABSENT primary key (idSal, idAbs)
);

/*==============================================================*/
/* Index : ETRE_ABSENT_FK                                       */
/*==============================================================*/
create index ETRE_ABSENT_FK on etre_absent (
   idSal ASC
);

/*==============================================================*/
/* Table : etre_immobiliser                                     */
/*==============================================================*/
create table etre_immobiliser 
(
   idImmo               INTEGER              not null,
   idVhc                INTEGER              not null,
   constraint PK_ETRE_IMMOBILISER primary key (idImmo, idVhc)
);

/*==============================================================*/
/* Index : ETRE_IMMOBILISER_FK                                  */
/*==============================================================*/
create index ETRE_IMMOBILISER_FK on etre_immobiliser (
   idImmo ASC
);

/*==============================================================*/
/* Index : ETRE_IMMOBILISER2_FK                                 */
/*==============================================================*/
create index ETRE_IMMOBILISER2_FK on etre_immobiliser (
   idVhc ASC
);

/*==============================================================*/
/* Table : etre_parent_de                                       */
/*==============================================================*/
create table etre_parent_de 
(
   idSal                INTEGER              not null,
   idEnf                INTEGER              not null,
   rolePar              VARCHAR2(2)          not null
      constraint CKC_ROLEPAR_ETRE_PAR check (rolePar in ('P','M','BP','BM','T')),
   constraint PK_ETRE_PARENT_DE primary key (idSal, idEnf)
);

/*==============================================================*/
/* Index : ETRE_PARENT_DE_FK                                    */
/*==============================================================*/
create index ETRE_PARENT_DE_FK on etre_parent_de (
   idSal ASC
);

/*==============================================================*/
/* Index : ETRE_PARENT_DE2_FK                                   */
/*==============================================================*/
create index ETRE_PARENT_DE2_FK on etre_parent_de (
   idEnf ASC
);

/*==============================================================*/
/* Table : etre_present                                         */
/*==============================================================*/
create table etre_present 
(
   idAg                 INTEGER              not null,
   idSal                INTEGER              not null,
   txPresence           FLOAT                not null
      constraint CKC_TXPRESENCE_ETRE_PRE check (txPresence in (>2)),
   constraint PK_ETRE_PRESENT primary key (idAg, idSal)
);

/*==============================================================*/
/* Index : ETRE_PRESENT_FK                                      */
/*==============================================================*/
create index ETRE_PRESENT_FK on etre_present (
   idAg ASC
);

/*==============================================================*/
/* Index : ETRE_PRESENT2_FK                                     */
/*==============================================================*/
create index ETRE_PRESENT2_FK on etre_present (
   idSal ASC
);

/*==============================================================*/
/* Table : idAbs                                                */
/*==============================================================*/
create table idAbs 
(
   idAbs                INTEGER              not null,
   idCtr                INTEGER              not null,
   idTpAbs              INTEGER              not null,
   dateDebAbs           DATE                 not null,
   dateFinAbs           DATE                 not null,
   dateDemAbs           DATE                 not null,
   dateRepAbs           DATE                 not null,
   etatAbs              VARCHAR2(100)        not null
      constraint CKC_ETATABS_IDABS check (etatAbs in ('OK','NO')),
   constraint PK_IDABS primary key (idAbs)
);

/*==============================================================*/
/* Index : ETRE_DE_TYPE_ABSENCE_FK                              */
/*==============================================================*/
create index ETRE_DE_TYPE_ABSENCE_FK on idAbs (
   idTpAbs ASC
);

/*==============================================================*/
/* Index : LIER_FK                                              */
/*==============================================================*/
create index LIER_FK on idAbs (
   idCtr ASC
);

/*==============================================================*/
/* Table : idAg                                                 */
/*==============================================================*/
create table idAg 
(
   idAg                 INTEGER              not null,
   idSal                INTEGER              not null,
   nomAg                VARCHAR2(100)        not null,
   CPAg                 VARCHAR2(6)          not null,
   adAg                 VARCHAR2(100)        not null,
   villeAg              VARCHAR2(100)        not null,
   coordAg              FLOAT                not null,
   constraint PK_IDAG primary key (idAg)
);

/*==============================================================*/
/* Index : ETRE_RESPONSABLE_DE_FK                               */
/*==============================================================*/
create index ETRE_RESPONSABLE_DE_FK on idAg (
   idSal ASC
);

/*==============================================================*/
/* Table : idClient                                             */
/*==============================================================*/
create table idClient 
(
   idClient             INTEGER              not null,
   nomClient            VARCHAR2(100)        not null,
   pnomClient           VARCHAR2(100)        not null,
   CPClient             VARCHAR2(6)          not null,
   villeClient          VARCHAR2(100)        not null,
   adClient             VARCHAR2(100)        not null,
   telClient            CHAR(10)             not null,
   emailClient          VARCHAR2(100)        not null,
   constraint PK_IDCLIENT primary key (idClient)
);

/*==============================================================*/
/* Table : idCtr                                                */
/*==============================================================*/
create table idCtr 
(
   idCtr                INTEGER              not null,
   idAg                 INTEGER              not null,
   idForm               INTEGER              not null,
   idClient             INTEGER              not null,
   idSal                INTEGER              not null,
   Che_idSal            INTEGER              not null,
   Com_idSal            INTEGER              not null,
   dateDemandeCtr       DATE                 not null,
   dateVisiteCtr        DATE                 not null,
   dateChargement       DATE                 not null,
   adChargement         VARCHAR2(100)        not null,
   villeChargement      VARCHAR2(100)        not null,
   CPChargement         VARCHAR2(6)          not null,
   longChargement       FLOAT                not null,
   latChargement        FLOAT                not null,
   dateLivraison        DATE                 not null,
   adLivraison          VARCHAR2(100)        not null,
   villeLivraison       VARCHAR2(100)        not null,
   CPLivraison          VARCHAR2(6)          not null,
   latLivraison         FLOAT                not null,
   longLivraison        FLOAT                not null,
   volMobilier          INTEGER              not null,
   remarques            VARCHAR2(500)        not null,
   dateCloture          DATE                 not null,
   tmpsDem              FLOAT                not null,
   nbDemenageurs        INTEGER              not null,
   etatDossier          VARCHAR2(10)         not null
      constraint CKC_ETATDOSSIER_IDCTR check (etatDossier in ('CONTACT','AVISITER','VISITEOK','PLAN','PLANOK','DEMOK','CLOS')),
   tmpsConduite         FLOAT                not null,
   dernierPaiement      DATE                 not null,
   constraint PK_IDCTR primary key (idCtr)
);

/*==============================================================*/
/* Index : SE_BASER_SUR_FK                                      */
/*==============================================================*/
create index SE_BASER_SUR_FK on idCtr (
   idForm ASC
);

/*==============================================================*/
/* Index : CONCERNER_FK                                         */
/*==============================================================*/
create index CONCERNER_FK on idCtr (
   idClient ASC
);

/*==============================================================*/
/* Index : PROVENIR_DE_FK                                       */
/*==============================================================*/
create index PROVENIR_DE_FK on idCtr (
   idAg ASC
);

/*==============================================================*/
/* Index : SUPERVISER_FK                                        */
/*==============================================================*/
create index SUPERVISER_FK on idCtr (
   Che_idSal ASC
);

/*==============================================================*/
/* Index : ETRE_CHARGE_DE_FK                                    */
/*==============================================================*/
create index ETRE_CHARGE_DE_FK on idCtr (
   Com_idSal ASC
);

/*==============================================================*/
/* Index : ENCADRER_FK                                          */
/*==============================================================*/
create index ENCADRER_FK on idCtr (
   idSal ASC
);

/*==============================================================*/
/* Table : idEnf                                                */
/*==============================================================*/
create table idEnf 
(
   idEnf                INTEGER              not null,
   nomEnf               VARCHAR2(100)        not null,
   pnomEnf              VARCHAR2(100)        not null,
   dateNaisEnf          DATE                 not null,
   constraint PK_IDENF primary key (idEnf)
);

/*==============================================================*/
/* Table : idForm                                               */
/*==============================================================*/
create table idForm 
(
   idForm               INTEGER              not null,
   libForm              VARCHAR2(11)         not null
      constraint CKC_LIBFORM_IDFORM check (libForm in ('Economique','Standard','De luxe','Sur mesure')),
   descForm             VARCHAR2(280)        not null
      constraint CKC_DESCFORM_IDFORM check (descForm in ('Les déménageurs s''occupent uniquement du chargement et de la livraison des meubles et des cartons','Toutes les prestations de la formule économique avec démontage et remontage des meubles si cela s''avère nécessaire. Les cartons sont fournis par l''entreprise','Toutes les prestations de la formule standard en plus de la mise en cartons et du déballage','Toutes les prestations de l''une des trois formules précédentes au choix de la cliente ou du client, enrichies par ses besoins spécifiques. Par exemple, la cliente ou le client peut choisir la formule économique en déléguant l''emballage des objets fragiles à l''entreprise Awhina')),
   prixFormHT           FLOAT                not null,
   constraint PK_IDFORM primary key (idForm)
);

/*==============================================================*/
/* Table : idGarage                                             */
/*==============================================================*/
create table idGarage 
(
   idGar                INTEGER              not null,
   nomGar               VARCHAR2(100)        not null,
   villeGar             VARCHAR2(100)        not null,
   adGar                VARCHAR2(100)        not null,
   CPGar                VARCHAR2(6)          not null,
   telGar               CHAR(10)             not null,
   constraint PK_IDGARAGE primary key (idGar)
);

/*==============================================================*/
/* Table : idImmo                                               */
/*==============================================================*/
create table idImmo 
(
   idImmo               INTEGER              not null,
   idTpImmo             INTEGER              not null,
   infoImmo             VARCHAR2(100)        not null,
   dateImmoDb           DATE                 not null,
   dateImmoFin          DATE                 not null,
   constraint PK_IDIMMO primary key (idImmo)
);

/*==============================================================*/
/* Index : ETRE_DE_TYPE_D_IMMO_FK                               */
/*==============================================================*/
create index ETRE_DE_TYPE_D_IMMO_FK on idImmo (
   idTpImmo ASC
);

/*==============================================================*/
/* Table : idSal                                                */
/*==============================================================*/
create table idSal 
(
   idSal                INTEGER              not null,
   nomSal               VARCHAR2(100)        not null,
   pnomSal              VARCHAR2(100)        not null,
   adSal                VARCHAR2(100)        not null,
   villeSal             VARCHAR2(100)        not null,
   CPSal                VARCHAR2(6)          not null,
   sxSal                CHAR(6)              not null,
   telSal               CHAR(10)             not null,
   salDispo             INTEGER              not null
      constraint CKC_SALDISPO_IDSAL check (salDispo in (HOMME,FEMME)),
   dateNaisSal          DATE                 not null,
   dateEmb              DATE                 not null,
   constraint PK_IDSAL primary key (idSal)
);

/*==============================================================*/
/* Table : idTpAbs                                              */
/*==============================================================*/
create table idTpAbs 
(
   idTpAbs              INTEGER              not null,
   libAbs               VARCHAR2(100)        not null,
   constraint PK_IDTPABS primary key (idTpAbs)
);

/*==============================================================*/
/* Table : idTpImmo                                             */
/*==============================================================*/
create table idTpImmo 
(
   idTpImmo             INTEGER              not null,
   libTpImmo            VARCHAR2(100)        not null,
   constraint PK_IDTPIMMO primary key (idTpImmo)
);

/*==============================================================*/
/* Table : idTpVhc                                              */
/*==============================================================*/
create table idTpVhc 
(
   idTpVhc              INTEGER              not null,
   libTpVhc             VARCHAR2(100)        not null,
   ptac                 FLOAT                not null,
   constraint PK_IDTPVHC primary key (idTpVhc)
);

/*==============================================================*/
/* Table : idVhc                                                */
/*==============================================================*/
create table idVhc 
(
   idVhc                INTEGER              not null,
   idTpVhc              INTEGER              not null,
   immatVhc             CHAR(7)              not null,
   vhcDispo             INTEGER              not null,
   volVhc               INTEGER              not null,
   optVhc               FLOAT                not null
      constraint CKC_OPTVHC_IDVHC check (optVhc in (Hayon,Couchette)),
   mqVhc                VARCHAR2(100)        not null,
   fqEntretien          INTEGER              not null,
   dateCirc             DATE                 not null,
   nbPlc                INTEGER              not null,
   kmVhc                INTEGER              not null,
   constraint PK_IDVHC primary key (idVhc)
);

/*==============================================================*/
/* Index : ETRE_DE_TYPE_DE_VEHICULE_FK                          */
/*==============================================================*/
create index ETRE_DE_TYPE_DE_VEHICULE_FK on idVhc (
   idTpVhc ASC
);

alter table Chef_d_equipe
   add constraint FK_CHEF_D_E_ROLE4_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table Chef_d_exploitation
   add constraint FK_CHEF_D_E_ROLE3_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table Commercial
   add constraint FK_COMMERCI_ROLE2_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table Conducteur
   add constraint FK_CONDUCTE_ROLE_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table Conduire
   add constraint FK_CONDUIRE_CONDUIRE_IDVHC foreign key (idVhc)
      references idVhc (idVhc);

alter table Conduire
   add constraint FK_CONDUIRE_CONDUIRE2_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table Conduire
   add constraint FK_CONDUIRE_CONDUIRE3_IDCTR foreign key (idCtr)
      references idCtr (idCtr);

alter table Immobiliser
   add constraint FK_IMMOBILI_IMMOBILIS_IDIMMO foreign key (idImmo)
      references idImmo (idImmo);

alter table Immobiliser
   add constraint FK_IMMOBILI_IMMOBILIS_IDVHC foreign key (idVhc)
      references idVhc (idVhc);

alter table Immobiliser
   add constraint FK_IMMOBILI_IMMOBILIS_IDGARAGE foreign key (idGar)
      references idGarage (idGar);

alter table Payer
   add constraint FK_PAYER_PAYER_IDCLIENT foreign key (idClient)
      references idClient (idClient);

alter table Payer
   add constraint FK_PAYER_PAYER2_PAIEMENT foreign key (idPaiement)
      references Paiement (idPaiement);

alter table Payer
   add constraint FK_PAYER_PAYER3_IDCTR foreign key (idCtr)
      references idCtr (idCtr);

alter table Responsable_d_agence
   add constraint FK_RESPONSA_ROLE5_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table Travailler
   add constraint FK_TRAVAILL_TRAVAILLE_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table Travailler
   add constraint FK_TRAVAILL_TRAVAILLE_IDCTR foreign key (idCtr)
      references idCtr (idCtr);

alter table etre_absent
   add constraint FK_ETRE_ABS_ETRE_ABSE_IDSAL2 foreign key (idSal)
      references idSal (idSal);

alter table etre_absent
   add constraint FK_ETRE_ABS_ETRE_ABSE_IDABS foreign key (idAbs)
      references idAbs (idAbs);

alter table etre_immobiliser
   add constraint FK_ETRE_IMM_ETRE_IMMO_IDIMMO foreign key (idImmo)
      references idImmo (idImmo);

alter table etre_immobiliser
   add constraint FK_ETRE_IMM_ETRE_IMMO_IDVHC foreign key (idVhc)
      references idVhc (idVhc);

alter table etre_parent_de
   add constraint FK_ETRE_PAR_ETRE_PARE_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table etre_parent_de
   add constraint FK_ETRE_PAR_ETRE_PARE_IDENF foreign key (idEnf)
      references idEnf (idEnf);

alter table etre_present
   add constraint FK_ETRE_PRE_ETRE_PRES_IDAG foreign key (idAg)
      references idAg (idAg);

alter table etre_present
   add constraint FK_ETRE_PRE_ETRE_PRES_IDSAL foreign key (idSal)
      references idSal (idSal);

alter table idAbs
   add constraint FK_IDABS_ETRE_DE_T_IDTPABS foreign key (idTpAbs)
      references idTpAbs (idTpAbs);

alter table idAbs
   add constraint FK_IDABS_LIER_IDCTR foreign key (idCtr)
      references idCtr (idCtr);

alter table idAg
   add constraint FK_IDAG_ETRE_RESP_RESPONSA foreign key (idSal)
      references Responsable_d_agence (idSal);

alter table idCtr
   add constraint FK_IDCTR_CONCERNER_IDCLIENT foreign key (idClient)
      references idClient (idClient);

alter table idCtr
   add constraint FK_IDCTR_PROVENIR__IDAG foreign key (idAg)
      references idAg (idAg);

alter table idCtr
   add constraint FK_IDCTR_ENCADRER_CHEF_D_E foreign key (idSal)
      references Chef_d_equipe (idSal);

alter table idCtr
   add constraint FK_IDCTR_ETRE_CHAR_COMMERCI foreign key (Com_idSal)
      references Commercial (idSal);

alter table idCtr
   add constraint FK_IDCTR_SE_BASER__IDFORM foreign key (idForm)
      references idForm (idForm);

alter table idCtr
   add constraint FK_IDCTR_SUPERVISE_CHEF_D_E foreign key (Che_idSal)
      references Chef_d_exploitation (idSal);

alter table idImmo
   add constraint FK_IDIMMO_ETRE_DE_T_IDTPIMMO foreign key (idTpImmo)
      references idTpImmo (idTpImmo);

alter table idVhc
   add constraint FK_IDVHC_ETRE_DE_T_IDTPVHC foreign key (idTpVhc)
      references idTpVhc (idTpVhc);

