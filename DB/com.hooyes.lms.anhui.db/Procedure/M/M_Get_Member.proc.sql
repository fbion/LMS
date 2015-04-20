﻿-- =============================================
-- Version:     1.0.0.4
-- Author:		hooyes
-- Create date: 2012-03-03
-- Update date: 2015-04-13
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_Member] 
    @keyword VARCHAR(30)
AS 
    SELECT TOP 100
            IID = 0 ,
            Status = ISNULL(R.Status, 0) ,
            minutes = ISNULL(R.minutes, 0) ,
            Score = ISNULL(R.Score, 0) ,
            M.[ID] ,
            M.[MID] ,
            M.[Name] ,
            M.[IDCard] ,
            M.[IDSN] ,
            [Year] = ISNULL(P.Year, 0) ,
            M.[Type] ,
            M.[Level] ,
            M.[Phone] ,
            M.[RegDate] ,
            M.[ExpireDate] ,
            M.[Tag],
			P.PID,
			R.CommitDate,
			R.Flag
    FROM    Member M 
	        LEFT JOIN dbo.My_Products myp ON myp.MID = M.MID
			LEFT JOIN Products P ON P.PID = myp.PID
            LEFT JOIN Report R ON R.MID = M.MID AND myp.PID = R.Year
    WHERE   ( M.Login LIKE @keyword
              OR M.IDCard LIKE @keyword
              OR M.Name LIKE @keyword
            )
    RETURN 0