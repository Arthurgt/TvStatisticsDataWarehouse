INSERT INTO [HD_PROD].[dbo].[DIC_GROUP] (DESCRIPTION)
SELECT Kod
FROM   [HD].[dbo].[target.groups-2]

INSERT INTO [HD_PROD].[dbo].[DIC_GROUP] (DESCRIPTION)
VALUES ('Total Individuals'), ('Podgrupa')

INSERT INTO [HD_PROD].[dbo].[CATEGORY] (CATEGORY_NAME)
SELECT DISTINCT Nazwa_Kategorii
FROM   [HD].[dbo].[kategorie]

INSERT INTO [HD_PROD].[dbo].[CHANNEL] (CHANNEL_NAME,CATEGORY_ID)
SELECT Nazwa_programu,cat.CATEGORY_ID
FROM   [HD].[dbo].[kategorie] kat
JOIN [HD_PROD].[dbo].[CATEGORY] cat ON kat.Nazwa_kategorii=cat.CATEGORY_NAME

INSERT INTO [HD_PROD].[dbo].[Date] (YEAR,MONTH,DAY,[Date])
SELECT DISTINCT convert(integer,DatePART(YEAR,["Date"])),convert(integer,DatePART(DAY,["Date"])),convert(integer,DatePART(MONTH,["Date"])),Convert(Date,["Date"],103)
FROM [HD].[dbo].[STAGE]


INSERT INTO [HD_PROD].[dbo].[PROGRAMME]
	  ([CHANNEL_ID]
      ,[Description]
      ,[SECOND_DESCRIPTION]
      ,[Duration]
      ,[START_TIME])
SELECT CHANNEL_ID,["Description"],["2nd Description"],CAST(["Duration"] AS TIME(0)) ["Duration"],["Start time"]
FROM   [HD].[dbo].[STAGE] sam JOIN
[HD_PROD].[dbo].[CHANNEL] chan ON sam.["Channel"]=chan.CHANNEL_NAME
GROUP BY ["Start time"],CHANNEL_ID,["Description"],["2nd Description"],["Duration"]

INSERT INTO [HD_PROD].[dbo].[TV_STATISTICS_FACTS] ([PROGRAMME_ID]
      ,[Date_ID]
      ,[GROUP_ID]
      ,[AMR]
      ,[AMR%]
      ,[SHR%]
      ,[RCH%]
      ,[RCH])
SELECT [PROGRAMME_ID]
      ,[Date_ID]
      ,[GROUP_ID]
      ,[AMR]
      ,[AMR %]
      ,[SHR %]
      ,[RCH %  [Not cons. - TH: 0min.]]]
      ,[RCH  [Not cons. - TH: 0min.]]]
FROM   [HD].[dbo].[PIVOT] hd 
JOIN [HD_PROD].[dbo].[DIC_GROUP] dic ON dic.DESCRIPTION=hd.Target
JOIN [HD_PROD].[dbo].[CHANNEL] cha ON cha.CHANNEL_NAME=hd.["CHANNEL"]
JOIN [HD_PROD].[dbo].[PROGRAMME] pro ON pro.DESCRIPTION=hd.["Description"] AND pro.START_TIME=hd.["Start time"] AND pro.DURATION=hd.["DURATION"] AND pro.CHANNEL_ID=cha.channel_ID
JOIN [HD_PROD].[dbo].[Date] dat ON dat.YEAR=YEAR(hd.["Date"]) AND dat.DAY=DAY(CONVERT(Date,hd.["Date"],104)) AND dat.MONTH=MONTH(CONVERT(Date,hd.["Date"],104))