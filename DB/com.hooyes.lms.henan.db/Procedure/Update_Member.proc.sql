﻿-- DROP PROC [Update_Member]
GO
-- =============================================
-- Version: 1.0.0.2
-- Author:		hooyes
-- Create date: 2012-02-02
-- Update date: 2015-03-07
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_Member]
	 @MID int output 
	,@Name varchar(50) = ''
	,@IDCard varchar(20) 
	,@IDSN varchar(30) 
	,@Year int  = 2015
	,@Type int  = -1
	,@Level int = -1
	,@Phone varchar(50) = ''
AS
	IF @MID <= 0
	BEGIN
	IF EXISTS( SELECT * FROM [Member] WHERE IDSN = @IDSN )
	BEGIN
		SELECT @MID = MID FROM [Member] WHERE IDSN = @IDSN
	END
	ELSE
	BEGIN
		DECLARE @SID int
		EXECUTE [Get_Seed] 
		   @ID = 1
		  ,@Value = @SID OUTPUT
		SET @MID = @SID
		INSERT INTO [Member]
			   ([MID]
			   ,[Name]
			   ,[IDCard]
			   ,[IDSN]
			   ,[Year]
			   ,[Type]
			   ,[Level]
			   ,[Phone]
			   )
		 VALUES
			   (@MID
			   ,@Name
			   ,@IDCard
			   ,@IDSN
			   ,@Year
			   ,@Type
			   ,@Level
			   ,@Phone
			   )
	END
	END
	ELSE
	BEGIN
		UPDATE [Member] SET Name = @Name WHERE MID = @MID
	END
RETURN 0