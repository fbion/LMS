-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2015-03-07
-- Update date: 2015-03-07
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_SurveyRecordsText]
    @UserID INT = 0 ,
    @ItemID INT ,
    @ItemValue varchar(500)
AS 
    INSERT  INTO dbo.SurveyRecordsText
            ( UserID, ItemID, ItemValue )
    VALUES  ( @UserID, @ItemID, @ItemValue )
    RETURN 0
