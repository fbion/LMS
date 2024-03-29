﻿-- =============================================
-- Version:     1.0.0.3
-- Author:		hooyes
-- Create date: 2012-09-24
-- Update date: 2015-06-18
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_MyReport] 
   @MID INT = 0
AS 
    SELECT  [ID] = myp.ID,
	        [MID] = myp.MID  ,
            [Year]= P.Year,
            Score = ISNULL(R.[Score], 0) ,
            Compulsory = ISNULL(R.[Compulsory], 0) ,
            Elective = ISNULL(R.[Elective], 0) ,
            [Status] = ISNULL(R.[Status], 0) ,
			[Minutes] = ISNULL(R.[Minutes],0),
            Memo = ISNULL(R.[Memo], 0),
			CreateDate = R.CreateDate,
			UpdateDate = R.UpdateDate,
			CommitDate = R.CommitDate
    FROM    My_Products myp
	INNER JOIN dbo.Products P ON P.PID =myp.PID
	LEFT JOIN Report R ON myp.MID = R.MID AND myp.PID = R.Year
    WHERE   myp.[MID] = @MID
	ORDER BY myp.[PID] DESC
	      
	      
    RETURN 0