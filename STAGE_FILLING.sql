DECLARE @pom varchar(120);
DECLARE @pom2 varchar(120);




UPDATE [HD].[dbo].[STAGE]
SET ["Channel"] = CASE WHEN ["Channel"]  LIKE '"%"'  THEN SUBSTRING(["Channel"],2,LEN(["Channel"])-2) ELSE '' END
, ["Description"] = CASE WHEN ["Description"]  LIKE '"%"'  THEN SUBSTRING(["Description"],2,LEN(["Description"])-2) ELSE '' END
, ["2nd Description"] = CASE WHEN ["2nd Description"]  LIKE '"%"'  THEN SUBSTRING(["2nd Description"],2,LEN(["2nd Description"])-2) ELSE '' END
, ["Start time"] = CASE WHEN ["Start time"]  LIKE '"%"'  THEN SUBSTRING(["Start time"],2,LEN(["Start time"])-2) ELSE '' END
, ["Duration"] = CASE WHEN ["Duration"]  LIKE '"%"'  THEN SUBSTRING(["Duration"],2,LEN(["Duration"])-2) ELSE '' END
, ["Variable Target"] = CASE WHEN ["Variable Target"]  LIKE '"%"'  THEN SUBSTRING(["Variable Target"],2,LEN(["Variable Target"])-2) ELSE '' END
, ["Date"] = CASE WHEN ["Date"]  LIKE '"%"'  THEN SUBSTRING(["Date"],2,LEN(["Date"])-2) ELSE '' END

set @pom=''
UPDATE [HD].[dbo].[STAGE]
SET @pom = ["Date"] = CASE WHEN len(["Date"])<1 THEN @pom ELSE ["Date"] END

set @pom=''
UPDATE [HD].[dbo].[STAGE]
SET @pom = ["Channel"] = CASE WHEN len(["Channel"])<1 THEN @pom ELSE 

CASE WHEN CHARINDEX ( '[' ,["Channel"] , 0 ) =0 THEN ["Channel"] ELSE SUBSTRING ( ["Channel"] ,0 , CHARINDEX ( '[' ,["Channel"] , 0 )   )END  END

set @pom=''
set @pom2=''
UPDATE [HD].[dbo].[STAGE]
SET @pom2 = ["2nd Description"] = CASE WHEN len(["Description"])<1 THEN @pom2 ELSE ["2nd Description"] END, @pom = ["Description"] = CASE WHEN len(["Description"])<1 THEN @pom ELSE ["Description"] END


set @pom=''
UPDATE [HD].[dbo].[STAGE]
SET @pom = ["Start time"] = CASE WHEN len(["Start time"])<1 THEN @pom ELSE ["Start time"] END

set @pom=''
UPDATE [HD].[dbo].[STAGE]
SET @pom = ["Duration"] = CASE WHEN len(["Duration"])<1 THEN @pom ELSE ["Duration"] END


UPDATE [HD].[dbo].[STAGE]
SET ["A16-49"] = CASE WHEN ["A16-49"] NOT LIKE '%[%]'  THEN ["A16-49"] ELSE SUBSTRING ( ["A16-49"] ,0 , CHARINDEX ( '%' ,["A16-49"] , 0 )   )END 

UPDATE [HD].[dbo].[STAGE]
SET ["M16-49"] = CASE WHEN ["M16-49"] NOT LIKE '%[%]'  THEN ["M16-49"] ELSE SUBSTRING ( ["M16-49"] ,0 , CHARINDEX ( '%' ,["M16-49"] , 0 )   )END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-15"] = CASE WHEN ["A4-15"] NOT LIKE '%[%]'  THEN ["A16-49"] ELSE SUBSTRING ( ["A4-15"] ,0 , CHARINDEX ( '%' ,["A4-15"] , 0 )   )END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-9"] = CASE WHEN ["A4-9"] NOT LIKE '%[%;]'  THEN ["A4-9"] ELSE SUBSTRING ( ["A4-9"] ,0 , CHARINDEX ( '%' ,["A4-9"] , 0 )   )END 

UPDATE [HD].[dbo].[STAGE]
SET ["Total Individuals"] = CASE WHEN ["Total Individuals"] NOT LIKE '%[%]'  THEN ["Total Individuals"] ELSE SUBSTRING ( ["Total Individuals"] ,0 , CHARINDEX ( '%' ,["Total Individuals"] , 0 )   )END 

UPDATE [HD].[dbo].[STAGE]
SET ["Podgrupa"] = CASE WHEN ["Podgrupa"] NOT LIKE '%[%]'  THEN ["Podgrupa"] ELSE SUBSTRING ( ["Podgrupa"] ,0 , CHARINDEX ( '%' ,["Podgrupa"] , 0 )   )END 
------------------------------------------------------------------------------------------------------------------------------------------------------

UPDATE [HD].[dbo].[STAGE]
SET ["A16-49"] = CASE WHEN ["A16-49"] NOT LIKE '%,%'  THEN ["A16-49"] ELSE REPLACE(["A16-49"], ',', '.') END 

UPDATE [HD].[dbo].[STAGE]
SET ["M16-49"] = CASE WHEN ["M16-49"] NOT LIKE '%,%'  THEN ["M16-49"] ELSE REPLACE(["M16-49"], ',', '.') END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-15"] = CASE WHEN ["A4-15"] NOT LIKE '%,%'  THEN ["A4-15"] ELSE REPLACE(["A4-15"], ',', '.') END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-9"] = CASE WHEN ["A4-9"] NOT LIKE '%,%'  THEN ["A4-9"] ELSE REPLACE(["A4-9"], ',', '.') END 

UPDATE [HD].[dbo].[STAGE]
SET ["Total Individuals"] = CASE WHEN ["Total Individuals"] NOT LIKE '%,%'  THEN ["Total Individuals"] ELSE REPLACE(["Total Individuals"], ',', '.') END 

UPDATE [HD].[dbo].[STAGE]
SET ["Podgrupa"] = CASE WHEN ["Podgrupa"] NOT LIKE '%,%'  THEN ["Podgrupa"] ELSE REPLACE(["Podgrupa"], ',', '.') END 

------------------------------------------------------------------------------------------------------------------------------------------------------

UPDATE [HD].[dbo].[STAGE]
SET ["A16-49"] = CASE WHEN ["A16-49"] NOT LIKE 'n.a.'  THEN ["A16-49"] ELSE null END 

UPDATE [HD].[dbo].[STAGE]
SET ["M16-49"] = CASE WHEN ["M16-49"] NOT LIKE 'n.a.' THEN ["M16-49"] ELSE null END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-15"] = CASE WHEN ["A4-15"] NOT LIKE 'n.a.'   THEN ["A4-15"] ELSE null END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-9"] = CASE WHEN ["A4-9"] NOT LIKE 'n.a.'   THEN ["A4-9"] ELSE null END 

-------------------------------------------------------------------------------------------------------------------

UPDATE [HD].[dbo].[STAGE]
SET ["A16-49"] = CASE WHEN ["A16-49"] NOT LIKE '% %'  THEN ["A16-49"] ELSE REPLACE(["A16-49"], ' ', '') END 

UPDATE [HD].[dbo].[STAGE]
SET ["M16-49"] = CASE WHEN ["M16-49"] NOT LIKE '% %'  THEN ["M16-49"] ELSE REPLACE(["M16-49"], ' ', '') END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-15"] = CASE WHEN ["A4-15"] NOT LIKE '% %'  THEN ["A4-15"] ELSE REPLACE(["A4-15"], ' ', '') END 

UPDATE [HD].[dbo].[STAGE]
SET ["A4-9"] = CASE WHEN ["A4-9"] NOT LIKE '% %'  THEN ["A4-9"] ELSE REPLACE(["A4-9"], ' ', '') END 

UPDATE [HD].[dbo].[STAGE]
SET ["Total Individuals"] = CASE WHEN ["Total Individuals"] NOT LIKE '% %'  THEN ["Total Individuals"] ELSE REPLACE(["Total Individuals"], ' ', '') END 

UPDATE [HD].[dbo].[STAGE]
SET ["Podgrupa"] = CASE WHEN ["Podgrupa"] NOT LIKE '% %'  THEN ["Podgrupa"] ELSE REPLACE(["Podgrupa"], ' ', '') END 