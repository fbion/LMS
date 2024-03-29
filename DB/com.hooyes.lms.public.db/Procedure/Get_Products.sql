﻿-- =============================================
-- Version:     1.0.0.4
-- Author:		hooyes
-- Create date: 2013-09-14
-- Update date: 2015-07-13
-- Desc: 增加过期时间 ExpireDate , Duration
-- =============================================
CREATE PROCEDURE [dbo].[Get_Products] @MID INT = 0, @PID INT = 0
AS 
    SELECT  P.*,
            MyID = ISNULL(myP.ID, 0)
    FROM    dbo.Products P
            LEFT JOIN dbo.My_Products myP ON P.PID = myP.PID
                                             AND myP.MID = @MID
											 AND (myP.[ExpireDate] >= GETDATE() or myP.[ExpireDate] is null)
    WHERE   ( @PID = 0
              OR P.PID = @PID
            )
    ORDER BY p.Sort DESC
    RETURN 0
