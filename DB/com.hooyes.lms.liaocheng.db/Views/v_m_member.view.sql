-- =============================================
-- Version:     1.0.0.6
-- Author:		hooyes
-- Create date: 2012-04-21
-- Update date: 2015-03-30
-- Desc:
-- =============================================
CREATE VIEW [dbo].[v_m_member]
AS
    SELECT  IID = 0 ,
            Status = ISNULL(R.Status, 0) ,
            minutes = ISNULL(R.minutes, 0) ,
            Score = ISNULL(R.Score, 0) ,
            ID = ROW_NUMBER() OVER ( ORDER BY myp.ID ASC, M.MID ASC ) ,
            M.[MID] ,
            M.[Name] ,
            M.[IDCard] ,
            M.[IDSN] ,
            [Year] = P.Year ,
            M.[Type] ,
            M.[Level] ,
            M.[Phone] ,
            M.[RegDate] ,
            M.RegionCode ,
            R.CommitDate ,
            PayDate = myp.CreateDate,
			P.PID,
			RegionName =Rg.Name
    FROM    Member M
	        INNER JOIN Region Rg ON Rg.Code = M.RegionCode
            INNER JOIN My_Products myp ON myp.MID = M.MID
			INNER JOIN Products P ON P.PID = myp.PID
            LEFT OUTER JOIN Report R ON R.MID = M.MID
                                        AND myp.PID = R.Year
    WHERE   M.Tag = 0
	--AND   M.MID > 10000