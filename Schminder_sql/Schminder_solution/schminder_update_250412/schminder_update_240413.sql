
use schminder_db
go

if (select count (*) from tblSettings) < 3 
begin
print ('No data')
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription], [setId]) VALUES (N'AppName', N'Schminder', N'Name of application', 1)
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription], [setId]) VALUES (N'PasswordSalt', N'pN1UH7z/LaI3PVPQQ9fy9w==', N'Salt used for password', 2)
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription], [setId]) VALUES (N'SmtpDetails', N'{"defaultCredentials":"false", "host":"mx496593.smtp-engine.com", "password":"Smtp$2021_", "port":"587", "username":"outmail@explose.co.uk","enablessl":"true"}', N'Smtp Details', 3)

end
go

select * from tblSettings

