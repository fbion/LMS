-- =============================================
-- Version:1.0.0.1
-- Author:		hooyes
-- Create date: 2015-03-23
-- Update date: 2015-03-23
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[S_Update_Report] @ID INT = 0, @Status INT
AS 
    DECLARE @now DATETIME  = GETDATE()

    UPDATE  Report
    SET     [Status] = @Status ,
            UpdateDate = @now
    WHERE   ID = @ID

    IF @Status = 1 
        BEGIN
            UPDATE  Report
            SET     [Status] = @Status ,
                    CommitDate = @now
            WHERE   ID = @ID
        END   


    RETURN 0
