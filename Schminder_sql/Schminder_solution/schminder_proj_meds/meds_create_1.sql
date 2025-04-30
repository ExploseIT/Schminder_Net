
USE [schminder_db]
GO


IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'spMedIndivListAll' AND type = 'P')
    DROP PROCEDURE spMedIndivListAll
GO

CREATE PROCEDURE spMedIndivListAll
AS
begin
select 
 med_id
 , med_pid
 , med_name_indiv
 , med_name_indiv as med_name
-- , med_name_both
from tblMedIndiv
--where med_name_indiv <> 'Fiasp'
--where med_name_indiv like '%r%'
order by med_name_indiv asc
end
go
declare @tab table
(
 med_id bigint
 , med_pid bigint
 ,med_name_indiv nvarchar(200)
 ,med_name_both nvarchar(400)
)
insert into @tab
exec spMedIndivListAll
select * from @tab where med_name_indiv like '%maxitrol%' or med_name_indiv like '%Acetazolamide%'
or med_name_indiv like '%nepafenac%' or med_name_indiv like '%lantus%' or med_name_indiv = 'novorapid'
or med_name_indiv like '%anal%' or med_name_indiv = 'control' or med_name_indiv = 'fiasp' or med_name_indiv = 'insulin'

go

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'spMedIndivListAll2_0' AND type = 'P')
    DROP PROCEDURE spMedIndivListAll2_0
GO

CREATE PROCEDURE spMedIndivListAll2_0
AS
begin
select 
 med_id as medId
 , med_pid as medPid
 , med_name_indiv as medNameIndiv
 , med_name_indiv as medName
-- , med_name_both
from tblMedIndiv
--where med_name_indiv <> 'Fiasp'
--where med_name_indiv like '%r%'
order by med_name_indiv asc
end
go
declare @tab table
(
 medId bigint
 , medPid bigint
 ,medNameIndiv nvarchar(200)
 ,medNameBoth nvarchar(400)
)
insert into @tab
exec spMedIndivListAll2_0
select * from @tab where medNameIndiv like '%maxitrol%' or medNameIndiv like '%Acetazolamide%'
or medNameIndiv like '%nepafenac%' or medNameIndiv like '%lantus%' or medNameNndiv = 'novorapid'
or medNameIndiv like '%anal%' or medNameIndiv = 'control' or medNameIndiv = 'fiasp' or medNameIndiv = 'insulin'

go

