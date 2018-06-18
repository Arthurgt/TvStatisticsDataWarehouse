use [HD_PROD]
drop table if exists TV_STATISTICS_FACTS;

drop table if exists PROGRAMME;

drop table if exists DIC_GROUP;

drop table if exists DATE;

drop table if exists CHANNEL;

drop table if exists CATEGORY;


/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY 
(
   CATEGORY_ID           INTEGER IDENTITY               not null,
   CATEGORY_NAME         varchar(50)                    null,
   constraint PK_CATEGORY primary key clustered (CATEGORY_ID)
);

/*==============================================================*/
/* Table: "DATE"                                                */
/*==============================================================*/
create table "DATE" 
(
   DATE_ID            INTEGER IDENTITY               not null,
   YEAR               integer                        null,
   MONTH              integer                        null,
   DAY                integer                        null,
   DATE               date			     null,
   constraint PK_DATE primary key clustered (DATE_ID)
);

/*==============================================================*/
/* Table: DIC_GROUP                                                */
/*==============================================================*/
create table DIC_GROUP 
(
   GROUP_ID             INTEGER IDENTITY                     not null,
   DESCRIPTION        varchar(50)                            null,
   constraint PK_DIC_GROUP primary key clustered (GROUP_ID)
);

/*==============================================================*/
/* Table: CHANNEL                                               */
/*==============================================================*/
create table CHANNEL 
(
   CHANNEL_ID           INTEGER IDENTITY               not null,
   CATEGORY_ID          integer                            null,
   CHANNEL_NAME         varchar(50)                        null,
   constraint PK_CHANNEL primary key clustered (CHANNEL_ID)
);

/*==============================================================*/
/* Table: PROGRAMME                                             */
/*==============================================================*/
create table PROGRAMME 
(
   PROGRAMME_ID         INTEGER IDENTITY                        not null,
   CHANNEL_ID           integer                                 null,
   DESCRIPTION          varchar(100)                            null,
   SECOND_DESCRIPTION   varchar(100)                            null,
   DURATION 			time                                    null,
   START_TIME           varchar(50)                                     null,
   constraint PK_PROGRAMME primary key clustered (PROGRAMME_ID)
);

/*==============================================================*/
/* Table: TV_STATISTICS_FACTS                                           */
/*==============================================================*/
create table TV_STATISTICS_FACTS 
(
   FACT_ID              INTEGER IDENTITY               not null,
   PROGRAMME_ID         integer                        null,
   DATE_ID              integer                        null,
   GROUP_ID             integer                        null,
   AMR                  integer                        null,
   [AMR%]               float                          null,
   [SHR%]               float                          null,
   [RCH%]               float                          null,
   [RCH]                float                          null,
   constraint PK_TV_STATISTICS_FACTS primary key clustered (FACT_ID)
);

alter table TV_STATISTICS_FACTS
   add constraint FK_FACTS_TA_RELATIONS_DIC_GROUP foreign key (GROUP_ID)
      references DIC_GROUP (GROUP_ID);

alter table TV_STATISTICS_FACTS
   add constraint FK_FACTS_TA_RELATIONS_PROGRAMM foreign key (PROGRAMME_ID)
      references PROGRAMME (PROGRAMME_ID);

alter table TV_STATISTICS_FACTS
   add constraint FK_FACTS_TA_RELATIONS_DATE foreign key (DATE_ID)
      references "DATE" (DATE_ID);
	  
alter table PROGRAMME
   add constraint FK_FACTS_TA_RELATIONS_CHANNEL foreign key (CHANNEL_ID)
      references CHANNEL (CHANNEL_ID);
	  
alter table CHANNEL
   add constraint FK_FACTS_TA_RELATIONS_CATEGORY foreign key (CATEGORY_ID)
      references CATEGORY (CATEGORY_ID);

