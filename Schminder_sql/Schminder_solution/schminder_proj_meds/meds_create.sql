
USE [schminder_db]
GO


if exists (select * from sys.procedures where name='spAmppUpdate' and type='P')
drop procedure spAmppUpdate
go

create procedure spAmppUpdate
	@amp_appid bigint,
	@amp_apid bigint,
	@amp_vppid bigint,
	@amp_name nvarchar(300),
	@amp_legal_catcode nvarchar(10),
	@amp_combpackcd nvarchar(50),
	@amp_subp nvarchar(300),
	@amp_disccd nvarchar(20),
	@amp_invalid nvarchar(20),
	@amp_dtdisc date

as
begin
if not exists (select * from tblAmpp where amp_appId = @amp_appId)
INSERT INTO [dbo].[tblAmpp]
           ([amp_appId]
           ,[amp_apid]
           ,[amp_vppid]
           ,[amp_legal_catcode]
           ,[amp_name]
           ,[amp_subp]
           ,[amp_dtdisc]
           ,[amp_combpackcd]
           ,[amp_disccd]
           ,[amp_invalid])
     VALUES
           (@amp_appId
           ,@amp_apid
           ,@amp_vppid
           ,@amp_legal_catcode
           ,@amp_name
           ,@amp_subp
           ,@amp_dtdisc
           ,@amp_combpackcd
           ,@amp_disccd
           ,@amp_invalid
		   )

	select [amp_appId]
      ,[amp_apid]
      ,[amp_vppid]
      ,[amp_legal_catcode]
      ,[amp_name]
      ,[amp_subp]
      ,[amp_dtdisc]
      ,[amp_combpackcd]
      ,[amp_disccd]
      ,[amp_invalid] from tblAmpp where amp_appId=@amp_appid
end
GO

if exists (select * from sys.procedures where name='spAmppReadById' and type='P')
drop procedure spAmppReadById
go

create procedure spAmppReadById
	@amp_appid bigint
as
begin
	select [amp_appId]
      ,[amp_apid]
      ,[amp_vppid]
      ,[amp_legal_catcode]
      ,[amp_name]
      ,[amp_subp]
      ,[amp_dtdisc]
      ,[amp_combpackcd]
      ,[amp_disccd]
      ,[amp_invalid] from tblAmpp where amp_appId=@amp_appid
end
go


if exists (select * from sys.procedures where name='spVmppUpdate' and type='P')
drop procedure spVmppUpdate
go

create procedure spVmppUpdate
		@vmp_vppId bigint,
        @vmp_vpid bigint,
        @vmp_name nvarchar(300),
		@vmp_combpackcd nvarchar(50),
        @vmp_qtyval nvarchar(50),
        @vmp_uomcd nvarchar(50),
        @vmp_invalid nvarchar(20)
as
begin
if not exists (select * from tblVmpp where vmp_vppId = @vmp_vppId)
INSERT INTO [dbo].[tblVmpp]
           ([vmp_vppId]
           ,[vmp_vpid]
           ,[vmp_name]
           ,[vmp_combpackcd]
           ,[vmp_qtyval]
           ,[vmp_uomcd]
           ,[vmp_invalid])
     VALUES
           (@vmp_vppId
           ,@vmp_vpid
           ,@vmp_name
           ,@vmp_combpackcd
           ,@vmp_qtyval
           ,@vmp_uomcd
           ,@vmp_invalid
		   )
	select [vmp_vppId]
      ,[vmp_vpid]
      ,[vmp_name]
      ,[vmp_combpackcd]
      ,[vmp_qtyval]
      ,[vmp_uomcd]
      ,[vmp_invalid]
  from [dbo].[tblVmpp] where vmp_vppId=@vmp_vppid
end
go

if exists (select * from sys.procedures where name='spVmppReadById' and type='P')
drop procedure spVmppReadById
go

create procedure spVmppReadById
	@vmp_vppid bigint
as
begin
	select [vmp_vppId]
      ,[vmp_vpid]
      ,[vmp_name]
      ,[vmp_combpackcd]
      ,[vmp_qtyval]
      ,[vmp_uomcd]
      ,[vmp_invalid] from tblVmpp where vmp_vppId=@vmp_vppid
end
go

if exists (select * from sys.procedures where name='spAmppVmppSearchByName' and type='P')
drop procedure spAmppVmppSearchByName
go

create procedure spAmppVmppSearchByName
	@name nvarchar(200)
as
begin
	select * from vwAmppVmpp vw
	where vw.vmp_name LIKE '%' + @name +'%'
   or vw.amp_name LIKE '%' + @name +'%';
end
go



if exists (select * from sys.views where name='vwAmppVmpp')
drop view vwAmppVmpp
go
create view vwAmppVmpp
as
select 
    v.vmp_name
    --v.vmp_combpackcd
    , v.vmp_vpid
    , v.vmp_vppid
    , v.vmp_qtyval
    , v.vmp_uomcd
    , a.amp_name
    --a.amp_subp,
    --a.amp_legal_catcode
FROM tblVmpp v
LEFT JOIN tblAmpp a ON v.vmp_vppid = a.amp_vppid
go


if exists (select * from sys.procedures where name = 'spMedSearchByName' and type = 'P')
    drop procedure spMedSearchByName
go

create procedure spMedSearchByName
    @med_search nvarchar(200)
as
begin
    with meds as (
        select
            vw.med_id,
            vw.med_pid,
            vw.med_qtyval,
            vw.med_uomcd,
            vw.med_name,
            RowNum = ROW_NUMBER() over (partition by vw.med_name order by vw.med_id)
        from vwMed vw
        where vw.med_name LIKE '%' + @med_search + '%'
    )
    select med_id, 
	med_pid, 
	med_qtyval, 
	med_uomcd, 
	med_name
    from meds
    where RowNum = 1
end
go

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'spMedListAll' AND type = 'P')
    DROP PROCEDURE spMedListAll;
GO

CREATE PROCEDURE spMedListAll
AS
BEGIN

    WITH cte AS (
        SELECT 
            replace(LEFT(med_name, CHARINDEX(' ', med_name + ' ') - 1),'_',' ') AS med_name_indiv,
            med_id,
            med_pid,
			med_both,
            ROW_NUMBER() OVER (
                PARTITION BY LEFT(med_name, CHARINDEX(' ', med_name + ' ') - 1)
                ORDER BY med_id -- or some other order if preferred
            ) AS rn
        FROM vwMed
        WHERE med_name IS NOT NULL AND LEN(med_name) > 0
    )
    SELECT  med_id, med_pid, med_name_indiv, med_both
    FROM cte
    WHERE (rn = 1 and LEN(med_name_indiv)>3) and (not med_name_indiv in ('oral','date', 'auto','control'))
    ORDER BY med_name_indiv;
END
GO

if exists (select * from sys.procedures where name='spMedSearchByName' and type='P')
drop procedure spMedSearchByName
go

create procedure spMedSearchByName
    @med_search nvarchar(500)
as
begin
    -- Split the search string into a table
    declare @terms table (term nvarchar(100))

    insert into @terms (term)
    select LTRIM(RTRIM(value))
    from string_split(@med_search, ',')

    -- Search for med_name containing ALL the terms
    select *
    from vwMed vw
    where not exists (
        select 1
        from @terms t
        where vw.med_name not like '%' + t.term + '%'
    )
end
go


/*
select * from tblAmpp where amp_name like '%Nepafenac%'
select * from tblAmpp where amp_name like '%Maxitrol%'
--select * from tblAmpp where amp_name like '%Aceta%'
select * from tblAmpp where amp_name like '%Acetazolamide%'
select * from tblVmpp where vmp_name like '%Nepafenac%' or vmp_name like '%Acetazolamide%' or vmp_name like '%Maxitrol%' 
select * from tblAmpp where amp_name like '%Acetazolamide%' or amp_name like '%Maxitrol%' or amp_name like '%Nepafenac%'
select count(*) from tblAmpp
select count(*) from tblVmpp

select * from tblVmpp where vmp_name like '%Maxitrol%' 
select * from tblAmpp where amp_name like '%Maxitrol%'
select * from tblVmpp where vmp_name like '%insulin%' 
select * from tblAmpp where amp_name like '%insulin%'
select * from tblVmpp where vmp_name like '%novorapid%' 
select * from tblAmpp where amp_name like '%novorapid%'
select * from tblVmpp where vmp_name like '%lanctus%' 
select * from tblAmpp where amp_name like '%lanctus%'
select * from tblVmpp where vmp_name like '%flexpen%' 
select * from tblAmpp where amp_name like '%flexpen%'
select * from tblVmpp where vmp_name like '%injection%' order by vmp_name
select * from tblAmpp where amp_name like '%injection%' order by amp_name
*/

/*
exec spAmppVmppSearchByName 'Maxitrol'
exec spAmppVmppSearchByName 'Acetazolamide'
exec spAmppVmppSearchByName 'Nepafenac'
*/

--select * from vwMed where med_whole like '%lantus%' or med_whole like '%novorapid%'
--select * from vwMed2 where med_whole like '%lantus%' or med_whole like '%novorapid%'

--goto skip

if exists (select * from sys.views where name='vwMed')
drop view vwMed
go
create view vwMed
as
select 
	cast(v.vmp_vpid as bigint) as med_id
    , cast(v.vmp_vppid as bigint) as med_pid
	, 
	case when v.vmp_name like '%insulin %' and not a.amp_name like 'insulin%' then a.amp_name
	when v.vmp_name like '%insulin %' then replace (v.vmp_name, 'insulin ', 'Insulin_') 
	when v.vmp_name like '%generic%' then replace (v.vmp_name, 'generic ', '') 
	when v.vmp_name like '%anal %' then replace (v.vmp_name, 'anal ', 'Anal_') 
		else v.vmp_name end as med_name
	, a.amp_name + ' -- ' + v.vmp_name as med_both
    , cast(v.vmp_qtyval as float) as med_qtyval
    , v.vmp_uomcd as med_uomcd
FROM tblVmpp v
LEFT JOIN tblAmpp a ON v.vmp_vppid = a.amp_vppid
go

select * from vwMed where med_name like '%positive control%' or med_name like '%positive%' or med_name like '%negative%' order by med_name asc
select * from vwMed where med_name like '%insulin human%' or med_name like '%insulin_human%' order by med_name asc
select v.vmp_name, replace (v.vmp_name, 'insulin human', 'Insulin_human') from tblVmpp v LEFT JOIN tblAmpp a ON v.vmp_vppid = a.amp_vppid
where v.vmp_name like '%insulin human%'

select v.vmp_name, a.amp_name from tblVmpp v LEFT JOIN tblAmpp a ON v.vmp_vppid = a.amp_vppid
where v.vmp_name like '%insulin%'

select * from vwMed where med_name like '%control%' order by med_name asc


--or med_whole like '%nepafenac%' or med_whole like '%lantus%' or med_whole like '%novorapid%'

--select * from vwMed where med_whole like '%maxitrol%' or med_whole like '%Acetazolamide%'
--or med_whole like '%nepafenac%' or med_whole like '%lantus%' or med_whole like '%novorapid%'

if exists (select * from sys.tables where name='tblMedIndiv' and type='U')
drop table tblMedIndiv
go
create table tblMedIndiv
(
 med_id bigint
 , med_pid bigint
 ,med_name_indiv nvarchar(200)
 ,med_name_both nvarchar(400)
 )
 insert into tblMedIndiv
exec spMedListAll

select * from tblMedIndiv where med_name_indiv like '%maxitrol%' or med_name_indiv like '%Acetazolamide%'
or med_name_indiv like '%nepafenac%' or med_name_indiv like '%lantus%' or med_name_indiv = 'novorapid'
or med_name_indiv like '%anal%' or med_name_indiv = 'control' or med_name_indiv like '%insulin%'

exec spMedSearchByName 'Anal'
exec spMedSearchByName 'Maxitrol'
exec spMedSearchByName 'Acetazol'
exec spMedSearchByName 'Nepafenac'
exec spMedSearchByName 'Lantus'
exec spMedSearchByName 'NovoRapid, flexpen, 100 units, novo nordisk, 3ml'
exec spMedSearchByName 'Anal'
exec spMedSearchByName 'Control'
goto skip

select * from vwAmppVmpp where amp_name like '%novorapid%' or vmp_name like '%novorapid%'
--exec spMedSearchByName 'Maxitrol'
--exec spMedSearchByName 'Acetazol'
--exec spMedSearchByName 'Nepafenac'

goto skip




exec spMedSearchByName 'NovoRapid'

skip:
