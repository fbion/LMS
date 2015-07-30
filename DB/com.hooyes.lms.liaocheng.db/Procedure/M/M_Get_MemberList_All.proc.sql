-- DROP PROC [M_Get_MemberList]
GO
-- =============================================
-- Author:		hooyes
-- Create date: 2015-05-12
-- Update date: 2015-05-12
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_MemberList_All]
	@PageSize int = 100,
	@CurrentPage int = 1,
	@Filter varchar(700) = ''
AS
	DECLARE @Records int = 0
	SET @CurrentPage = @CurrentPage - 1;
	IF @CurrentPage < 0 
		SET @CurrentPage = 0
	EXEC ZGetRecordByPageV3
		@TableNames ='v_m_member_all',     
		@PrimaryKey ='ID',           
		@Fields   ='',                 
		@PageSize = @PageSize,         
		@CurrentPage = @CurrentPage,   
		@Filter  = @Filter,           
		@Group  = '',                  
		@Order  = ' ID DESC'   
	  
RETURN @Records