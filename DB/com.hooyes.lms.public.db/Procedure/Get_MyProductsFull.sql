-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-06-28
-- Update date: 2015-06-28
-- Desc: 增加过期时间 ExpireDate 
-- =============================================
CREATE PROCEDURE [dbo].[Get_MyProductsFull] @MID INT = 0
AS 
    SELECT  myID = myP.ID,
	        myP.MID,
			myP.PID ,
			myP.CreateDate,
			[ExpireDate] = ISNULL(myP.[ExpireDate],'2100-01-01'),
			ID = P.ID,
			p.[Year],
            P.Price ,
            p.Name ,
            p.Sort ,
            p.Memo 
    FROM    dbo.Products P
            INNER JOIN dbo.My_Products myP ON P.PID = myP.PID
                                             AND myP.MID = @MID
											 AND (myP.[ExpireDate] >= GETDATE() or myP.[ExpireDate] is null)
    
    ORDER BY p.Sort DESC
    RETURN 0
