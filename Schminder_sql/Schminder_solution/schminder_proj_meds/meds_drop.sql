


USE [schminder_db]
GO



/*
  drop table tblAmpp
  go
*/

if not exists (select * from sys.tables where name='tblAmpp' and type='U')
create table tblAmpp (
    amp_appId bigint primary key,
    amp_apid bigint,
	amp_vppid bigint,
	amp_legal_catcode nvarchar(10),
    amp_name nvarchar(300),
	amp_subp nvarchar(300),
    amp_dtdisc date,
    amp_combpackcd nvarchar(50),
	amp_disccd nvarchar(20) null,
    amp_invalid nvarchar(20) null, -- Y/N or 1/0
)
go

/*
drop table tblVmpp
go
*/

if not exists (select * from sys.tables where name='tblVmpp' and type='U')
create table tblVmpp (
    vmp_vppId bigint primary key,
    vmp_vpid bigint,
    vmp_name nvarchar(300),
    vmp_combpackcd nvarchar(50),
	vmp_qtyval nvarchar(50),
	vmp_uomcd nvarchar(50),
    vmp_invalid nvarchar(20) null, -- Y/N or 1/0
)
go



select * from tblAmpp
select * from tblVmpp