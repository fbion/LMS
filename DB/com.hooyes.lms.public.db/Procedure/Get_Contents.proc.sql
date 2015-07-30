-- =============================================
-- Version:     1.1.0.3
-- Author:		hooyes
-- Create date: 2011-12-18
-- Update date: 2015-06-28
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
            ct.[Url],
			ct.MIME,
			ct.Sort
    FROM    dbo.Contents ct
            INNER JOIN dbo.Courses cs ON cs.CName = ct.CName
    WHERE   cs.CID = @CID
RETURN 0