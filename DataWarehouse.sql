/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2018-04-12 12:12:09                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Channel') and o.name = 'FK_CHANNEL_RELATIONS_CATEGORY')
alter table Channel
   drop constraint FK_CHANNEL_RELATIONS_CATEGORY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Programme') and o.name = 'FK_PROGRAMM_RELATIONS_CHANNEL')
alter table Programme
   drop constraint FK_PROGRAMM_RELATIONS_CHANNEL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Target') and o.name = 'FK_TARGET_RELATIONS_TVSTATIS')
alter table Target
   drop constraint FK_TARGET_RELATIONS_TVSTATIS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TvStatisticsFacts') and o.name = 'FK_TVSTATIS_RELATIONS_PROGRAMM')
alter table TvStatisticsFacts
   drop constraint FK_TVSTATIS_RELATIONS_PROGRAMM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TvStatisticsFacts') and o.name = 'FK_TVSTATIS_RELATIONS_DATE')
alter table TvStatisticsFacts
   drop constraint FK_TVSTATIS_RELATIONS_DATE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Category')
            and   type = 'U')
   drop table Category
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Channel')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Channel.Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Channel')
            and   type = 'U')
   drop table Channel
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Date')
            and   type = 'U')
   drop table Date
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Programme')
            and   name  = 'Relationship_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Programme.Relationship_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Programme')
            and   type = 'U')
   drop table Programme
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Target')
            and   name  = 'Relationship_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index Target.Relationship_6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Target')
            and   type = 'U')
   drop table Target
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TvStatisticsFacts')
            and   name  = 'Relationship_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index TvStatisticsFacts.Relationship_4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TvStatisticsFacts')
            and   name  = 'Relationship_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index TvStatisticsFacts.Relationship_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TvStatisticsFacts')
            and   type = 'U')
   drop table TvStatisticsFacts
go

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category (
   CategoryID           int                  not null,
   CategoryName         text                 null,
   constraint PK_CATEGORY primary key nonclustered (CategoryID)
)
go

/*==============================================================*/
/* Table: Channel                                               */
/*==============================================================*/
create table Channel (
   ChannelID            int                  not null,
   CategoryID           int                  null,
   ChannelName          text                 null,
   constraint PK_CHANNEL primary key nonclustered (ChannelID)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/
create index Relationship_1_FK on Channel (
CategoryID ASC
)
go

/*==============================================================*/
/* Table: Date                                                  */
/*==============================================================*/
create table Date (
   DateID               int                  not null,
   Year                 int                  null,
   Month                int                  null,
   Day                  int                  null,
   constraint PK_DATE primary key nonclustered (DateID)
)
go

/*==============================================================*/
/* Table: Programme                                             */
/*==============================================================*/
create table Programme (
   ProgrammeID          int                  not null,
   ChannelID            int                  null,
   ProgrammeName        text                 null,
   Description          text                 null,
   "2nd Description"    text                 null,
   Duration             datetime             null,
   constraint PK_PROGRAMME primary key nonclustered (ProgrammeID)
)
go

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/
create index Relationship_2_FK on Programme (
ChannelID ASC
)
go

/*==============================================================*/
/* Table: Target                                                */
/*==============================================================*/
create table Target (
   TargetID             int                  not null,
   TvStatisticID        int                  null,
   TargetVariable       text                 null,
   TotalIndividuals     int                  null,
   Subgroup             int                  null,
   "A16-49"             float                null,
   "M16-49"             float                null,
   "A4-15"              float                null,
   "A4-9"               float                null,
   constraint PK_TARGET primary key nonclustered (TargetID)
)
go

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/
create index Relationship_6_FK on Target (
TvStatisticID ASC
)
go

/*==============================================================*/
/* Table: TvStatisticsFacts                                     */
/*==============================================================*/
create table TvStatisticsFacts (
   TvStatisticID        int                  not null,
   ProgrammeID          int                  null,
   DateID               int                  null,
   StartTime            datetime             null,
   Duration             datetime             null,
   constraint PK_TVSTATISTICSFACTS primary key nonclustered (TvStatisticID)
)
go

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create index Relationship_3_FK on TvStatisticsFacts (
ProgrammeID ASC
)
go

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/
create index Relationship_4_FK on TvStatisticsFacts (
DateID ASC
)
go

alter table Channel
   add constraint FK_CHANNEL_RELATIONS_CATEGORY foreign key (CategoryID)
      references Category (CategoryID)
go

alter table Programme
   add constraint FK_PROGRAMM_RELATIONS_CHANNEL foreign key (ChannelID)
      references Channel (ChannelID)
go

alter table Target
   add constraint FK_TARGET_RELATIONS_TVSTATIS foreign key (TvStatisticID)
      references TvStatisticsFacts (TvStatisticID)
go

alter table TvStatisticsFacts
   add constraint FK_TVSTATIS_RELATIONS_PROGRAMM foreign key (ProgrammeID)
      references Programme (ProgrammeID)
go

alter table TvStatisticsFacts
   add constraint FK_TVSTATIS_RELATIONS_DATE foreign key (DateID)
      references Date (DateID)
go

