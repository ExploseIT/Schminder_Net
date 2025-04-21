


USE [schminder_db]
GO

Drop TABLE [dbo].[tblMedsTypeIndex]
go
Drop TABLE [dbo].[tblMedsType]
go
Drop TABLE [dbo].[tblMedsBase]
go


if not exists (select * from sys.tables where name='tblMedsBase' and type='U')
CREATE TABLE [dbo].[tblMedsBase](
	[mb_id] [uniqueidentifier] NOT NULL,
	[mb_name] [nvarchar](200) NOT NULL,
	[mb_desc] [nvarchar](max) NOT NULL,
	[mb_dt_entered] [datetime] NOT NULL,
	[mb_enabled] [bit] NOT NULL,
	[mb_nhs_url] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tblMedsBase] PRIMARY KEY CLUSTERED 
(
	[mb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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