

USE [schminder_db]
GO


if not exists (select * from sys.tables where name='tblFirebaseTokenInfo' and type='U')
CREATE TABLE [dbo].[tblFirebaseTokenInfo](
	[fbt_id] [uniqueidentifier] NOT NULL,
	[fbt_uid] [nvarchar](128) NOT NULL,
	[fbt_token] [nvarchar](2048) NOT NULL,
	[fbt_issuedat] [datetimeoffset](7) NOT NULL,
	[fbt_expiresat] [datetimeoffset](7) NULL,
	[fbt_isanonymous] [bit] NOT NULL,
	[fbt_lastusedat] [datetimeoffset](7) NULL,
	[fbt_createdat] [datetimeoffset](7) NOT NULL,
	[fbt_status] [nvarchar](20) NOT NULL,
	[fbt_error] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblFirebaseTokenInfo] PRIMARY KEY CLUSTERED 
(
	[fbt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

if not exists (select * from sys.tables where name='tblFirebaseTokenInfo2' and type='U')
CREATE TABLE [dbo].[tblFirebaseTokenInfo2](
	[fbtIntId] [int] IDENTITY(1,1) NOT NULL,
	[fbtId] [uniqueidentifier] NOT NULL,
	[fbtUid] [nvarchar](128) NOT NULL,
	[fbtToken] [nvarchar](2048) NOT NULL,
	[fbtIssuedAt] [datetimeoffset](7) NOT NULL,
	[fbtExpiresAt] [datetimeoffset](7) NULL,
	[fbtIsAnonymous] [bit] NOT NULL,
	[fbtLastUsedAt] [datetimeoffset](7) NULL,
	[fbtCreatedAt] [datetimeoffset](7) NOT NULL,
	[fbtStatus] [nvarchar](20) NOT NULL,
	[fbtError] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblFirebaseTokenInfo2] PRIMARY KEY CLUSTERED 
(
	[fbtIntId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

if not exists (select * from sys.columns where name='fbtVersion' and OBJECT_NAME(object_id)='tblFirebaseTokenInfo2')
alter table tblFirebaseTokenInfo2 add fbtVersion nvarchar(50)

if not exists (select * from sys.columns where name='fbtDevice' and OBJECT_NAME(object_id)='tblFirebaseTokenInfo2')
alter table tblFirebaseTokenInfo2 add fbtDevice nvarchar(50)

if not exists (select * from sys.columns where name='fbtUserUid' and OBJECT_NAME(object_id)='tblFirebaseTokenInfo2')
alter table tblFirebaseTokenInfo2 add fbtUserUid nvarchar(50)

if exists (select * from sys.procedures where name='spFirebaseTokenInfoUpdate' and type='P')
drop procedure spFirebaseTokenInfoUpdate
go

create procedure spFirebaseTokenInfoUpdate
			@fbt_id uniqueidentifier
           ,@fbt_uid nvarchar(128)
           ,@fbt_token nvarchar(2048)
		   ,@fbt_createdat datetimeoffset(7)
           ,@fbt_issuedat datetimeoffset(7)
           ,@fbt_expiresat datetimeoffset(7)
           ,@fbt_lastusedat datetimeoffset(7)
		   ,@fbt_isanonymous bit
           ,@fbt_status nvarchar(20)
           ,@fbt_error nvarchar(200)
as
INSERT INTO [dbo].[tblFirebaseTokenInfo2]
           ([fbtId]
           ,[fbtUid]
           ,[fbtToken]
           ,[fbtIssuedAt]
           ,[fbtExpiresAt]
           ,[fbtIsAnonymous]
           ,[fbtLastUsedAt]
           ,[fbtCreatedAt]
           ,[fbtStatus]
           ,[fbtError])
     VALUES
           (@fbt_id
           ,@fbt_uid
           ,@fbt_token
           ,@fbt_issuedat
           ,@fbt_expiresat
           ,@fbt_isanonymous
           ,@fbt_lastusedat
           ,@fbt_createdat
           ,@fbt_status
           ,@fbt_error
		   )
SELECT [fbtId]
      ,[fbtUid]
      ,[fbtToken]
      ,[fbtIssuedAt]
      ,[fbtExpiresat]
      ,[fbtIsAnonymous]
      ,[fbtLastUsedAt]
      ,[fbtCreatedAt]
      ,[fbtStatus]
      ,[fbtError]
  FROM [dbo].[tblFirebaseTokenInfo2]
  where fbtIntId = SCOPE_IDENTITY()
GO


if exists (select * from sys.procedures where name='spFirebaseTokenInfoUpdate2' and type='P')
drop procedure spFirebaseTokenInfoUpdate2
go

create procedure spFirebaseTokenInfoUpdate2
			@fbtIntId int
		   ,@fbtVersion nvarchar(50)
		   ,@fbtDevice nvarchar(10)
		   --,@fbtUserUid nvarchar(50)
		   ,@fbtId uniqueidentifier		   
           ,@fbtUid nvarchar(128)
           ,@fbtToken nvarchar(2048)
		   ,@fbtCreatedAt datetimeoffset(7)
           ,@fbtIssuedAt datetimeoffset(7)
           ,@fbtExpiresAt datetimeoffset(7)
           ,@fbtLastUsedAt datetimeoffset(7)
		   ,@fbtIsAnonymous bit
           ,@fbtStatus nvarchar(20)
           ,@fbtError nvarchar(200)
as
INSERT INTO [dbo].[tblFirebaseTokenInfo2]
           ([fbtId]
		   ,[fbtVersion]
		   ,[fbtDevice]
		   --,[fbtUserUid]
           ,[fbtUid]
           ,[fbtToken]
           ,[fbtIssuedAt]
           ,[fbtExpiresAt]
           ,[fbtIsAnonymous]
           ,[fbtLastUsedAt]
           ,[fbtCreatedAt]
           ,[fbtStatus]
           ,[fbtError])
     VALUES
           (@fbtId
		   ,@fbtVersion
		   ,@fbtDevice
		   --,@fbtUserUid
           ,@fbtUid
           ,@fbtToken
           ,@fbtIssuedAt
           ,@fbtExpiresAt
           ,@fbtIsAnonymous
           ,@fbtLastUsedAt
           ,@fbtCreatedAt
           ,@fbtStatus
           ,@fbtError
		   )
SELECT [fbtIntId]
	  ,[fbtId]
	  ,[fbtVersion]
	  ,[fbtDevice]
	  --,[fbtUserUid]
      ,[fbtUid]
      ,[fbtToken]
      ,[fbtIssuedAt]
      ,[fbtExpiresAt]
      ,[fbtIsAnonymous]
      ,[fbtLastUsedAt]
      ,[fbtCreatedAt]
      ,[fbtStatus]
      ,[fbtError]
  FROM [dbo].[tblFirebaseTokenInfo2]
  where fbtId = @fbtId
GO

INSERT INTO dbo.tblFirebaseTokenInfo2 (
    fbtId,
    fbtUid,
    fbtToken,
    fbtIssuedAt,
    fbtExpiresAt,
    fbtIsAnonymous,
    fbtLastUsedAt,
    fbtCreatedAt,
    fbtStatus,
    fbtError
)
SELECT
    t1.fbt_id,
    t1.fbt_uid,
    t1.fbt_token,
    t1.fbt_issuedat,
    t1.fbt_expiresat,
    t1.fbt_isanonymous,
    t1.fbt_lastusedat,
    t1.fbt_createdat,
    t1.fbt_status,
    t1.fbt_error
FROM dbo.tblFirebaseTokenInfo t1
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.tblFirebaseTokenInfo2 t2
    WHERE t2.fbtId = t1.fbt_id
      AND t2.fbtToken = t1.fbt_token
      AND t2.fbtIssuedAt = t1.fbt_issuedat
      AND t2.fbtExpiresAt = t1.fbt_expiresat
);

go

SELECT [fbtIntId]
	  ,[fbtVersion]
	  ,[fbtDevice]
	  --,[fbtUserUid]
	  ,[fbtId]
      ,[fbtUid]
      ,[fbtToken]
      ,[fbtIssuedAt]
      ,[fbtExpiresAt]
      ,[fbtIsAnonymous]
      ,[fbtLastUsedAt]
      ,[fbtCreatedAt]
      ,[fbtStatus]
      ,[fbtError]
  FROM [dbo].[tblFirebaseTokenInfo2] order by fbtIntId desc

