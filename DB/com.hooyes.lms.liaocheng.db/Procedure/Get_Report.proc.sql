-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2012-01-03
-- Update date: 2013-09-24
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Get_Report]
	@MID int = 0,
	@Year int = 2013
AS
    SELECT  R.[ID],
	        R.[MID] ,
            [Year] = P.[Year] ,
            Score = ISNULL(R.[Score], 0) ,
            Compulsory = ISNULL(R.[Compulsory], 0) ,
            Elective = ISNULL(R.[Elective], 0) ,
            [Status] = ISNULL(R.[Status], 0) ,
			[Minutes] = ISNULL(R.[Minutes],0),
            Memo = ISNULL(R.[Memo], 0),
			R.CreateDate,
			R.UpdateDate,
			R.CommitDate
	 FROM [Report] R
	 INNER JOIN Products P ON R.[Year] = P.PID
	 WHERE R.[MID] = @MID
	      AND R.[Year] = @Year
RETURN 0