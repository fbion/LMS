-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-03-07
-- Update date: 2015-03-07
-- Desc:
-- =============================================
CREATE VIEW [dbo].v_m_survey_records_sum
AS
    SELECT  b.* ,
            a.ItemValue ,
            a.ICount
    FROM    ( SELECT    ItemID ,
                        ItemValue ,
                        ICount = COUNT(1)
              FROM      SurveyRecordsInt
              GROUP BY  ItemID ,
                        ItemValue
            ) a
            INNER JOIN dbo.SurveyItem b ON b.ItemID = a.ItemID
  