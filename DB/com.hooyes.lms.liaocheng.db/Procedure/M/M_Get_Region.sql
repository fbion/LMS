-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2014-05-22
-- Update date: 2015-04-29
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_Region] @AID INT = 0
AS 
    IF @AID < 10000 
        BEGIN
            SELECT  r.*
            FROM    dbo.Region r     
			ORDER BY r.ID DESC 
        END 
    ELSE 
        BEGIN  
            SELECT  r.*
            FROM    dbo.Region r
                    INNER JOIN dbo.AdminRegions ar ON ar.RegionCode = r.Code
            WHERE   ar.AID = @AID
			ORDER BY r.ID DESC 
        END   
    RETURN 0
