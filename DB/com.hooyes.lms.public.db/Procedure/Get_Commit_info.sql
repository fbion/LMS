-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2015-04-02
-- Update date: 2015-04-08
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_Commit_info] @MID INT = 0, @PID INT
AS 
    SELECT  R.ID ,
            M.MID ,
            P.PID ,
            cardNumberType = 1 ,
            cardNumber = M.IDCard ,
            areaName = '省本级' ,
            [year] = P.[Year] ,
            classCode = P.Memo ,
            classLearnTimeCount = CAST(ISNULL(R.Minutes, 0)*1.334 AS DECIMAL(18, 0)) ,
            score = ISNULL(R.Score, 0)
    FROM    Member M
            INNER JOIN Report R ON R.MID = M.MID
            INNER JOIN dbo.Products P ON P.PID = R.Year
    WHERE   M.MID = @MID
            AND P.PID = @PID
    RETURN 0
