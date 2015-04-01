-- =============================================
-- Version:     1.0.0.5
-- Author:		hooyes
-- Create date: 2013-09-14
-- Update date: 2015-04-01
-- Desc: MemberExt
-- =============================================
CREATE PROCEDURE [dbo].[Get_Products] @MID INT = 0, @PID INT = 0
AS 
    SELECT  p.ID ,
            p.PID ,
            P.Price ,
            p.Name ,
            p.Sort ,
            p.Memo ,
            MyID = ISNULL(myP.ID, 0),
			Ext.IDSN,
			Ext.Flag,
			PayDate = myP.CreateDate
    FROM    dbo.Products P
            INNER JOIN MemberExt Ext ON Ext.MID = @MID
                                        AND Ext.[PID] = P.PID
                                        AND Ext.Flag >= 10
            LEFT JOIN dbo.My_Products myP ON P.PID = myP.PID
                                             AND myP.MID = @MID
    WHERE   ( @PID = 0
              OR P.PID = @PID
            )
    ORDER BY p.Sort DESC
    RETURN 0
