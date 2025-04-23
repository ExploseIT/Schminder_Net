

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
INSERT INTO [dbo].[tblFirebaseTokenInfo]
           ([fbt_id]
           ,[fbt_uid]
           ,[fbt_token]
           ,[fbt_issuedat]
           ,[fbt_expiresat]
           ,[fbt_isanonymous]
           ,[fbt_lastusedat]
           ,[fbt_createdat]
           ,[fbt_status]
           ,[fbt_error])
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
SELECT [fbt_id]
      ,[fbt_uid]
      ,[fbt_token]
      ,[fbt_issuedat]
      ,[fbt_expiresat]
      ,[fbt_isanonymous]
      ,[fbt_lastusedat]
      ,[fbt_createdat]
      ,[fbt_status]
      ,[fbt_error]
  FROM [dbo].[tblFirebaseTokenInfo]
  where fbt_id = @fbt_id
GO

SELECT [fbt_id]
      ,[fbt_uid]
      ,[fbt_token]
      ,[fbt_issuedat]
      ,[fbt_expiresat]
      ,[fbt_isanonymous]
      ,[fbt_lastusedat]
      ,[fbt_createdat]
      ,[fbt_status]
      ,[fbt_error]
  FROM [dbo].[tblFirebaseTokenInfo]
