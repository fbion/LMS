﻿-- DROP PROC [Update_Report]
GO
-- =============================================
-- Version:     1.0.0.3
-- Author:		hooyes
-- Create date: 2012-01-03
-- Update date: 2014-12-04
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_Report]
	@MID int = 0, 
	@Score int = null,
	@Compulsory decimal = null,
	@Elective decimal = null,
	@Status int = null,
	@Minutes decimal = null,
	@Memo varchar(100) = null
AS
	IF EXISTS(SELECT * FROM Report WHERE MID = @MID)
		BEGIN
			UPDATE Report 
			SET Score = CASE  
							WHEN Score < @Score OR Score IS null THEN @Score
							ELSE Score
					    END
				,Compulsory = CASE
								WHEN Compulsory < @Compulsory OR Compulsory IS null THEN @Compulsory
								ELSE  Compulsory
							  END
				,Elective =  CASE 
								WHEN Elective < @Elective OR Elective IS null THEN @Elective
								ELSE Elective
							 END
				,Minutes = ISNULL(@Minutes,Minutes)
				,Status = ISNULL(@Status,Status)
				,Memo = ISNULL(@Memo,Memo)
				,UpdateDate = GETDATE()
				,CommitDate = CASE 
								WHEN @Status = 1 THEN GETDATE()
								ELSE CommitDate
							  END 
			WHERE MID = @MID
		END
	ELSE
		BEGIN
			INSERT INTO Report(MID,Score,Compulsory,Elective,Status,Minutes,Memo) 
			VALUES(@MID,@Score,@Compulsory,@Elective,@Status,@Minutes,@Memo)
		END
RETURN 0