-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-06-01
-- Update date: 2015-06-01
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_IncomesList2]
	@PageSize INT = 100,
	@CurrentPage INT = 1,
	@Filter VARCHAR(700) = ''
AS
	DECLARE @Records INT = 0
	SET @CurrentPage = @CurrentPage - 1;
	IF @CurrentPage < 0 
		SET @CurrentPage = 0
	EXEC ZGetRecordByPageV3
		@TableNames ='v_m_incomes2',     
		@PrimaryKey ='Date',           
		@Fields   ='',                 
		@PageSize = @PageSize,         
		@CurrentPage = @CurrentPage,   
		@Filter  = @Filter,           
		@Group  = '',                  
		@Order  = ' Date DESC'   

RETURN 0