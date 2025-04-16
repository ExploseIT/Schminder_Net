
use schminder_db
go

if exists (select * from sys.columns where name='setId' and OBJECT_NAME(object_id)='tblSettings' and is_identity=0)
begin
Drop TABLE [dbo].[tblSettings]
CREATE TABLE [dbo].[tblSettings](
	[setId] [int]  IDENTITY(1,1) NOT NULL,
	[setName] [nvarchar](100) NOT NULL,
	[setValue] [nvarchar](500) NOT NULL,
	[setDescription] [nvarchar](500) NOT NULL,

 CONSTRAINT [PK_tblSettings] PRIMARY KEY CLUSTERED 
(
	[setId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
end
GO


if (select count (*) from tblSettings) < 3 
begin
print ('No data')
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription]) VALUES (N'AppName', N'Schminder', N'Name of application')
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription]) VALUES (N'PasswordSalt', N'pN1UH7z/LaI3PVPQQ9fy9w==', N'Salt used for password')
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription]) VALUES (N'SmtpDetails', N'{"defaultCredentials":"false", "host":"mx496593.smtp-engine.com", "password":"Smtp$2022_", "port":"587", "username":"outmail@explose.co.uk","enablessl":"true"}', N'Smtp Details')
end
update tblSettings set setValue=N'DrugTime'  where setName=N'AppName'

if not exists (select * from tblSettings where setName='AppNameFull')
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription]) VALUES (N'AppNameFull', N'DrugTime - Medication reminder', N'Application full name')
go

select * from tblSettings


