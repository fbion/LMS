-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2013-09-29
-- Update date: 2015-06-28
-- Desc: 增加过期时间 ExpireDate 
-- =============================================
CREATE PROCEDURE [dbo].[Get_MyProducts] @MID INT = 0
AS 
    SELECT  [ID] ,
            [MID] ,
            [PID] ,
            [CreateDate] ,
			[ExpireDate] = ISNULL([ExpireDate],'2100-01-01'),
            [Memo]
    FROM    [My_Products]
    WHERE   MID = @MID
    RETURN 0
