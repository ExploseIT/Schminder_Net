
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


if exists (select * from sys.views where name='vwMed')
drop view vwMed
go
create view vwMed
as
select 
	v.vmp_vpid as med_id
    , v.vmp_vppid as med_pid
    --, case when (not v.vmp_name like '%generic %' ) then v.vmp_name else a.amp_name end as med_whole
	, replace (v.vmp_name, 'generic ', '') as med_whole
    , cast(v.vmp_qtyval as float) as med_qtyval
    , v.vmp_uomcd as med_uomcd
    --, a.amp_name
FROM tblVmpp v
LEFT JOIN tblAmpp a ON v.vmp_vppid = a.amp_vppid
go

if exists (select * from sys.procedures where name='spMedSearchByName' and type='P')
drop procedure spMedSearchByName
go

create procedure spMedSearchByName
	@med_search nvarchar(200)
as
begin
	select * from vwMed vw
	where vw.med_whole LIKE '%' + @med_search +'%'
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
            vw.med_whole,
            RowNum = ROW_NUMBER() over (partition by vw.med_whole order by vw.med_id)
        from vwMed vw
        where vw.med_whole LIKE '%' + @med_search + '%'
    )
    select med_id, 
	med_pid, 
	med_qtyval, 
	med_uomcd, 
	med_whole
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
            LEFT(med_whole, CHARINDEX(' ', med_whole + ' ') - 1) AS med_name,
            med_id,
            med_pid,
            ROW_NUMBER() OVER (
                PARTITION BY LEFT(med_whole, CHARINDEX(' ', med_whole + ' ') - 1)
                ORDER BY med_id -- or some other order if preferred
            ) AS rn
        FROM vwMed
        WHERE med_whole IS NOT NULL AND LEN(med_whole) > 0
    )
    SELECT med_name, med_id, med_pid
    FROM cte
    WHERE rn = 1
    ORDER BY med_name;
END
GO

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
*/

/*
exec spAmppVmppSearchByName 'Maxitrol'
exec spAmppVmppSearchByName 'Acetazolamide'
exec spAmppVmppSearchByName 'Nepafenac'
*/

exec spMedListAll
exec spMedSearchByName 'Maxitrol'
exec spMedSearchByName 'Acetazol'
exec spMedSearchByName 'Nepafenac'
