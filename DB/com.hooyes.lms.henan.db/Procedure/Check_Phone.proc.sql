﻿-- DROP PROC [Check_Phone]
GO
-- =============================================
-- Version: 1.0.0.1
-- Author:		hooyes
-- Create date: 2012-02-18
-- Update date: 2015-03-07
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Check_Phone]
	 @MID int = 0
	,@Year int = 2012
	,@Phone varchar(50)
	,@Code int = 0 output
	,@Message varchar(200) = '' output
AS
	IF EXISTS( SELECT * FROM Member WHERE Year = @Year and Phone = @Phone AND MID ! = @MID)
	BEGIN
		SET @Code = 205
		SET @Message ='Phone Has been used'
	END
	ELSE
	BEGIN
	    SET @Code = 0
		SET @Message =''
	END
RETURN 0