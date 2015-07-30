-- =============================================
-- Version: 1.0.0.1
-- Author:		hooyes
-- Create date: 2015-06-01
-- Update date: 2015-06-01
-- Desc:
-- =============================================
CREATE VIEW [dbo].[v_m_incomes2]
AS
    SELECT  [Date] = CONVERT(INT, CONVERT(VARCHAR(10), UpdateDate, 112)) ,
            [Amount] = SUM(Cash) ,
            [Count] = COUNT(1) ,
            [Avg] = AVG(cash) ,
            M.RegionCode
    FROM    Orders o
            INNER JOIN dbo.Member M ON M.MID = o.MID
    WHERE   [Status] = 10
    GROUP BY CONVERT(VARCHAR(10), UpdateDate, 112) ,
            M.RegionCode
