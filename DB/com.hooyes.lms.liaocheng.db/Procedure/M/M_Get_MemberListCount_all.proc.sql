﻿-- DROP PROC [M_Get_MemberListCount]
GO
-- =============================================
-- Author:		hooyes
-- Create date: 2012-05-12
-- Update date: 2015-05-12
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_MemberListCount_all]
	@Filter varchar(700) = ''
AS
	IF @Filter = ''
		SELECT COUNT(1) FROM v_m_member_all
	ELSE
	BEGIN
		DECLARE @SQL varchar(800)
		SET @SQL = 'SELECT COUNT(1) FROM v_m_member_all WHERE ' + @Filter
		EXECUTE(@SQL)
	END
RETURN 0