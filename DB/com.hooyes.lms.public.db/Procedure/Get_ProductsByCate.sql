-- =============================================
-- Version:     1.0.0.4
-- Author:		hooyes
-- Create date: 2015-07-12
-- Update date: 2015-07-12
-- Desc: 增加过期时间 ExpireDate , Duration
-- =============================================
CREATE PROCEDURE [dbo].[Get_ProductsByCate]
	@MID INT = 0,
	@CateID INT =-1
AS
    SELECT  p.*,
            MyID = ISNULL(myP.ID, 0)
    FROM    dbo.Products P
            LEFT JOIN dbo.My_Products myP ON P.PID = myP.PID
                                             AND myP.MID = @MID
											 AND (myP.[ExpireDate] >= GETDATE() or myP.[ExpireDate] is null)
    WHERE   ( @CateID = -1
              OR P.Cate = @CateID
            )
    ORDER BY p.Sort DESC
RETURN 0
