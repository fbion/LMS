-- =============================================
-- Version:     1.1.0.3
-- Author:		hooyes
-- Create date: 2012-01-14
-- Update date: 2015-01-19
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_MyContents] @MID INT, @CID INT
AS 
    SELECT  c.CID ,
            c.CCID ,
            c.Name ,
            c.Url ,
            c.MIME ,
            Minutes = ISNULL(myc.Minutes, 0) ,
            Second = ISNULL(myc.Second, 0) ,
            Status = ISNULL(myc.Status, 0) ,
            Sort = c.Sort
    FROM    ( SELECT    cs.CID ,
                        ct.[CCID] ,
                        ct.[CCName] ,
                        ct.[Name] ,
                        ct.[Url] ,
                        ct.[MIME] ,
                        ct.Sort
              FROM      dbo.Contents ct
                        INNER JOIN dbo.Courses cs ON cs.CName = ct.CName
              WHERE     cs.CID = @CID
            ) AS c
            LEFT OUTER JOIN ( SELECT    CID ,
                                        CCID ,
                                        MID ,
                                        [Minutes] ,
                                        [Second] ,
                                        [Status]
                              FROM      My_Contents
                              WHERE     MID = @MID
                                        AND CID = @CID
                            ) AS myc ON myc.CCID = c.CCID
    ORDER BY c.Sort ASC 
    RETURN 0