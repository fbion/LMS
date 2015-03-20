-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-03-07
-- Update date: 2015-03-07
-- Desc:
-- =============================================
CREATE VIEW [dbo].[v_m_survey_records]
AS
    SELECT  ItemID ,
            ItemValue ,
            ItemValueType = 2
    FROM    dbo.SurveyRecordsText
    UNION ALL
    SELECT  ItemID ,
            ItemValue = CAST(ItemValue AS VARCHAR(10)) ,
            ItemValueType = 1
    FROM    dbo.SurveyRecordsInt
