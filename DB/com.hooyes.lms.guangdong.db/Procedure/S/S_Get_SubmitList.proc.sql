-- DROP PROC [S_Get_SubmitList]
GO
-- =============================================
-- Version:     1.0.1.1
-- Author:		hooyes
-- Create date: 2012-07-23
-- Update date: 2015-03-23
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[S_Get_SubmitList] @count INT = 100
AS --UPDATE TOP ( 15 )
    --        Member
    --SET     Tag = 0
    --WHERE   Tag = 100
    --        AND DATEDIFF(DAY, regdate, GETDATE()) > 5

    SELECT TOP(@count) R.ID ,
            M.MID ,
            cardNumberType = 1 ,
            cardNumber = M.IDCard ,
            areaName = '省本级' ,
            [year] = LEFT(R.Year, 4) ,
            classCode = P.Memo ,
            classLearnTimeCount = CAST(ISNULL(R.Minutes, 0) AS DECIMAL(18, 0))  ,
            score = ISNULL(R.Score, 0)
    FROM    Member M
            INNER JOIN Report R ON R.MID = M.MID
                                   AND ( R.Status = 0
                                         OR R.Status IS NULL
                                       )
                                   AND R.Minutes >= 1440
                                   AND R.score >= 60
            INNER JOIN dbo.Products P ON p.PID = R.Year
    WHERE   DATEDIFF(HOUR, M.RegDate, GETDATE()) >= 20
            AND ( M.ExpireDate IS NULL
                  OR M.ExpireDate >= GETDATE()
                )
            AND M.MID >= 10000
    ORDER BY NEWID()
    RETURN 0