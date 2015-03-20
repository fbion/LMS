-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-03-08
-- Update date: 2015-03-08
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_SurveyFBListCount]
	@PageSize int = 100,
	@CurrentPage int = 1,
	@Filter varchar(700) = ''
AS
	IF @Filter = ''
		SELECT COUNT(1) FROM SurveyRecordsText 
	ELSE
	BEGIN
		DECLARE @SQL varchar(800)
		SET @SQL = 'SELECT COUNT(1) FROM SurveyRecordsText WHERE ' + @Filter
		EXECUTE(@SQL)
	END
RETURN 0
