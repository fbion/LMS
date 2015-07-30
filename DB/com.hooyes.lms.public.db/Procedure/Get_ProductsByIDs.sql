-- =============================================
-- Version:     1.0.0.4
-- Author:		hooyes
-- Create date: 2015-07-06
-- Update date: 2015-07-14
-- Desc: 增加过期时间 ExpireDate , Duration
-- =============================================
CREATE PROCEDURE [dbo].[Get_ProductsByIDs]
    @IDs VARCHAR(2000) ,
    @MID INT = 0
AS
    IF @MID = 0
        BEGIN
            SELECT  P.*
            FROM    dbo.Products P
            WHERE   P.ID IN ( SELECT    value
                              FROM      dbo.split(@IDs, ',') )
        END
    ELSE
        BEGIN
            SELECT  P.* ,
                    MyID = ISNULL(myP.ID, 0)
            FROM    dbo.Products P
                    LEFT JOIN dbo.My_Products myP ON P.PID = myP.PID
                                                     AND myP.MID = @MID
                                                     AND ( myP.[ExpireDate] >= GETDATE()
                                                           OR myP.[ExpireDate] IS NULL
                                                         )
            WHERE   P.ID IN ( SELECT    value
                              FROM      dbo.split(@IDs, ',') )
        END
    RETURN 0
