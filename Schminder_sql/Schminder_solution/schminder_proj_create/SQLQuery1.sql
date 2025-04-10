
USE schminder_db;
GO

-- Check if the login exists at the server level
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'IIS APPPOOL\schminder_net')
BEGIN
    PRINT 'Creating SQL Server login for IIS APPPOOL\schminder_net...';
    CREATE LOGIN [IIS APPPOOL\schminder_net] FROM WINDOWS;
END
ELSE
BEGIN
    PRINT 'Login already exists.';
END
GO

-- Check if the user exists in the current database
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'IIS APPPOOL\schminder_net')
BEGIN
    PRINT 'Creating database user for IIS APPPOOL\schminder_net...';
    CREATE USER [IIS APPPOOL\schminder_net] FOR LOGIN [IIS APPPOOL\schminder_net];
    ALTER ROLE db_owner ADD MEMBER [IIS APPPOOL\schminder_net];
END
ELSE
BEGIN
    PRINT 'Database user already exists.';
END
GO
