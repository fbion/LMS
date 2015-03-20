-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2015-03-07
-- Update date: 2015-03-07
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_SurveyItem]
    @SubjectID INT = 0 ,
    @CateID INT = 0
AS 
    SELECT  [ID] ,
            [ItemID] ,
            [CateID] ,
            [SubjectID] ,
            [ItemName]
    FROM    [dbo].[SurveyItem]
    WHERE   [SubjectID] = @SubjectID
            AND ( @CateID = 0
                  OR CateID = @CateID
                )
    RETURN 0
