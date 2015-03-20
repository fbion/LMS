-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-03-07
-- Update date: 2015-03-07
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_SurveySummary]
    @SubjectID INT = 1 ,
    @CateID INT = 0 ,
    @ItemID INT = 0
AS 

    SELECT  [ID] ,
            [ItemID] ,
            [CateID] ,
            [SubjectID] ,
            [ItemName] ,
            [ItemValue] ,
            [ICount]
    FROM    v_m_survey_records_sum
    WHERE   SubjectID = @SubjectID
            AND ( @CateID = 0
                  OR CateID = @CateID
                )
            AND ( @ItemID = 0
                  OR ItemID = @ItemID
                )
    ORDER BY ItemID ,
            ItemValue DESC
    RETURN 0
