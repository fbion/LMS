-- =============================================
-- Version:     1.1.0.2
-- Author:		hooyes
-- Create date: 2011-12-18
-- Update date: 2014-12-23
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_Contents] @CID INT
AS 
    SELECT  cs.CID ,
            ct.[ID] ,
            ct.[CName] ,
            ct.[CCID] ,
            ct.[CCName] ,
            ct.[Name] ,
            ct.[Duration] ,
            ct.[Url] ,
			ct.MIME 
    FROM    dbo.Contents ct
            INNER JOIN dbo.Courses cs ON cs.CName = ct.CName
    WHERE   cs.CID = @CID
    RETURN 0