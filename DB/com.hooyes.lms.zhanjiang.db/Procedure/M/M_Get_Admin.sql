﻿-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2013-11-12
-- Update date: 2013-11-12
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_Admin] @AID INT = 0
AS 
    SELECT  *
    FROM    dbo.[Admin]
    WHERE   AID = @AID
    RETURN 0
