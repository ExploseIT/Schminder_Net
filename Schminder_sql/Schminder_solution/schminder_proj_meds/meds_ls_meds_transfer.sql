USE schminder_db;
GO

--SELECT name FROM sys.databases WHERE name = 'schminder_db';

--SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tblAmpp';
-- Run this on your local server
--SELECT * FROM [EXPLOSE_REMOTE].[schminder_db].sys.tables WHERE name = 'tblAmpp';

-- Sync tblAmpp from local to remote
INSERT INTO [EXPLOSE_REMOTE].[schminder_db].dbo.tblAmpp (
    amp_appId, amp_apid, amp_vppid, amp_legal_catcode,
    amp_name, amp_subp, amp_dtdisc,
    amp_combpackcd, amp_disccd, amp_invalid
)
SELECT 
    amp_appId, amp_apid, amp_vppid, amp_legal_catcode,
    amp_name, amp_subp, amp_dtdisc,
    amp_combpackcd, amp_disccd, amp_invalid
FROM dbo.tblAmpp AS L
WHERE NOT EXISTS (
    SELECT 1
    FROM [EXPLOSE_REMOTE].[schminder_db].dbo.tblAmpp AS R
    WHERE R.amp_appId = L.amp_appId
);

-- Sync tblVmpp from local to remote
INSERT INTO [EXPLOSE_REMOTE].[schminder_db].dbo.tblVmpp (
    vmp_vppId, vmp_vpid, vmp_name,
    vmp_combpackcd, vmp_qtyval, vmp_uomcd, vmp_invalid
)
SELECT 
    vmp_vppId, vmp_vpid, vmp_name,
    vmp_combpackcd, vmp_qtyval, vmp_uomcd, vmp_invalid
FROM dbo.tblVmpp AS L
WHERE NOT EXISTS (
    SELECT 1
    FROM [EXPLOSE_REMOTE].[schminder_db].dbo.tblVmpp AS R
    WHERE R.vmp_vppId = L.vmp_vppId
);
