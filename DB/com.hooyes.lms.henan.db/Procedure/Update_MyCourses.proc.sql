﻿-- DROP PROC [Update_MyCourses]
GO
-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2011-12-18
-- Update date: 2013-04-11
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_MyCourses]
	@MID int = 0, 
	@CID int = 0,
	@Second decimal = 0,
	@Status int =0
AS
	DECLARE	@Minutes int = 0
	IF @Second < 0 
		SET @Second = 0
	UPDATE [My_Courses]
		SET 
			[Second]  = [Second]  + @Second
			,[Minutes] = ([Second]  + @Second)/60
		WHERE MID = @MID
			and CID = @CID
    IF @@ROWCOUNT = 0
	BEGIN
		SET @Minutes = @Second / 60
		INSERT INTO [My_Courses]
			   ([MID]
			   ,[CID]
			   ,[Minutes]
			   ,[Second]
			   ,[Status])
		 VALUES
			   (@MID
			   ,@CID
			   ,@Minutes
			   ,@Second
			   ,0)
	END

	-- EXECUTE Task_EvaluteContents @MID,@CID

	-- EXECUTE Task_EvaluteCourses @MID
RETURN 0