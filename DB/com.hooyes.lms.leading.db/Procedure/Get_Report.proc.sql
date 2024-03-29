﻿-- =============================================
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
    SELECT  [ID],
	        [MID] ,
            [Year] ,
            Score = ISNULL([Score], 0) ,
            Compulsory = ISNULL([Compulsory], 0) ,
            Elective = ISNULL([Elective], 0) ,
            [Status] = ISNULL([Status], 0) ,
			[Minutes] = ISNULL([Minutes],0),
            Memo = ISNULL([Memo], 0),
			CreateDate,
			UpdateDate,
			CommitDate
	 FROM [Report]
	 WHERE [MID] = @MID
	      AND [Year] = @Year
RETURN 0