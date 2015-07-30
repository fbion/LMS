-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2013-09-15
-- Update date: 2015-02-06
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_Cards]
    @NO VARCHAR(50) = '' ,
    @SN VARCHAR(50)
AS 
    SELECT  *
    FROM    Cards
    WHERE   SN = @SN
            AND [NO] = @NO
    RETURN 0
