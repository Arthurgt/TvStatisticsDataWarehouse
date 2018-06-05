CREATE VIEW Pivot_Data AS
select [Date]
      ,[Channel]
      ,[Description]
      ,[2nd Description]
      ,[Start time]
      ,[Duration],Target,[AMR],[AMR %],[SHR %],[RCH %  [Not cons. - TH: 0min.]]],[RCH  [Not cons. - TH: 0min.]]]
from
(
  select [Date]
      ,[Channel]
      ,[Description]
      ,[2nd Description]
      ,[Start time]
      ,[Duration],[Variable Target], Target, value
  from [HD].[dbo].[HD_projekt_event tydz 1 listopad 2015_full]

  unpivot
  (
    value for target in ([A16-49],[M16-49],[A4-15],[A4-9])
  ) unpiv
) src
pivot
(
  max(value)
  for [Variable Target] in ([AMR],[AMR %],[SHR %],[RCH %  [Not cons. - TH: 0min.]]],[RCH  [Not cons. - TH: 0min.]]])
) piv
