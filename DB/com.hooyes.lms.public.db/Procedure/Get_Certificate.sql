-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2013-09-24
-- Update date: 2015-02-16
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_Certificate] @MID INT
AS 
    SELECT  c.* ,
            CertID = 'SZFZY2014' + RIGHT(ISNULL(m.IDCert, '00000'), 5)
            + CONVERT(VARCHAR(10), c.ID)
    FROM    [Certificate] c
            INNER JOIN dbo.Member m ON c.MID = m.MID
    WHERE   c.MID = @MID
    RETURN 0
