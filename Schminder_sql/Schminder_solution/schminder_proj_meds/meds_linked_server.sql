EXEC sp_addlinkedserver 
    @server = 'EXPLOSE_REMOTE', 
    @srvproduct = '', 
    @provider = 'SQLNCLI', 
    @datasrc = 'explose.info';

EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = 'EXPLOSE_REMOTE', 
    @useself = 'false', 
    @rmtuser = 'schminder_user', 
    @rmtpassword = 'xxx';

