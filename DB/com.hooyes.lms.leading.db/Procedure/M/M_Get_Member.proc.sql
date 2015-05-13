-- =============================================
-- Version:     1.0.0.5
-- Author:		hooyes
-- Create date: 2012-03-03
-- Update date: 2015-04-29
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[M_Get_Member]
    @keyword VARCHAR(30) ,
    @AID INT = 0
AS 
    IF @AID < 10000 
        BEGIN
            SELECT TOP 100
                    IID = 0 ,
                    Status = ISNULL(R.Status, 0) ,
                    minutes = ISNULL(R.minutes, 0) ,
                    Score = ISNULL(R.Score, 0) ,
                    M.[ID] ,
                    M.[MID] ,
                    M.[Name] ,
                    M.[IDCard] ,
                    M.[IDSN] ,
                    [Year] = ISNULL(P.Year, 0) ,
                    M.[Type] ,
                    M.[Level] ,
                    M.[Phone] ,
                    M.[RegDate] ,
                    M.[ExpireDate] ,
                    M.[Tag] ,
                    RegionCode =Rg.Code,
                    P.PID ,
                    RegionName = Rg.Name
            FROM    Member M
                    
                    LEFT JOIN dbo.My_Products myp ON myp.MID = M.MID
					LEFT JOIN dbo.Region Rg ON Rg.Code = myp.PID
                    LEFT JOIN dbo.Products P ON P.PID = myp.PID
                    LEFT OUTER JOIN Report R ON R.MID = M.MID
                                                AND myp.PID = R.Year
            WHERE   ( M.Login LIKE @keyword
                      OR M.IDCard LIKE @keyword
                      OR M.Name LIKE @keyword
                    )

        END 
    ELSE 
        BEGIN
            SELECT TOP 100
                    IID = 0 ,
                    Status = ISNULL(R.Status, 0) ,
                    minutes = ISNULL(R.minutes, 0) ,
                    Score = ISNULL(R.Score, 0) ,
                    M.[ID] ,
                    M.[MID] ,
                    M.[Name] ,
                    M.[IDCard] ,
                    M.[IDSN] ,
                    [Year] = ISNULL(P.Year, 0) ,
                    M.[Type] ,
                    M.[Level] ,
                    M.[Phone] ,
                    M.[RegDate] ,
                    M.[ExpireDate] ,
                    M.[Tag] ,
                    RegionCode =Rg.Code,
                    P.PID ,
                    RegionName = Rg.Name
            FROM    Member M
                    LEFT JOIN dbo.My_Products myp ON myp.MID = M.MID
					LEFT JOIN dbo.Region Rg ON Rg.Code = myp.PID
                    LEFT JOIN dbo.Products P ON P.PID = myp.PID
                    LEFT OUTER JOIN Report R ON R.MID = M.MID
                                                AND myp.PID = R.Year
            WHERE   ( M.Login LIKE @keyword
                      OR M.IDCard LIKE @keyword
                      OR M.Name LIKE @keyword
                    )
                    AND M.RegionCode IN ( SELECT    RegionCode
                                          FROM      dbo.AdminRegions
                                          WHERE     AID = @AID )
        END   

    RETURN 0