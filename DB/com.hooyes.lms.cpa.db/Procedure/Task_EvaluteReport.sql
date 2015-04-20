-- =============================================
-- Version:     1.0.0.5
-- Author:		hooyes
-- Create date: 2012-04-13
-- Update date: 2015-04-13
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Task_EvaluteReport]
    @MID INT ,
    @PID INT = 2013 ,
    @RegionCode INT = 0
AS /* 10755 不用考试，分钟数够即可以结业 */
    IF @RegionCode = 10755 
        BEGIN
            UPDATE  dbo.Report
            SET     [Status] = 1 ,
                    CommitDate = GETDATE() ,
                    UpdateDate = GETDATE()
            WHERE   [Minutes] >= 1125
                    AND MID = @MID
                    AND [Year] = @PID
                    AND ( Status = 0
                          OR Status IS NULL
                        )
        END   

    RETURN 0