-- =============================================
-- Version:     1.0.0.3
-- Author:		hooyes
-- Create date: 2013-09-14
-- Update date: 2015-03-30
-- Desc: 
-- =============================================
CREATE PROCEDURE [dbo].[Get_Products] @MID INT = 0, @PID INT = 0
AS 
    SELECT  p.ID ,
            p.PID ,
            P.Price ,
            p.Name ,
            p.Sort ,
            p.Memo ,
            MyID = ISNULL(myP.ID, 0)
    FROM    dbo.Products P
            INNER JOIN ProductsRegion PR ON PR.PID = P.PID
            INNER JOIN Member M ON M.MID = @MID
                                   AND PR.RegionCode = M.RegionCode
            LEFT JOIN dbo.My_Products myP ON P.PID = myP.PID
                                             AND myP.MID = @MID
    WHERE   ( @PID = 0
              OR P.PID = @PID
            )
    ORDER BY p.Sort DESC
    RETURN 0
