GO
-- =============================================
-- Author:		hooyes
-- Create date: 2011-12-22
-- Update date: 2015-05-10
-- Desc:
-- @Type 0 行政 1 企业
-- Cate  0 选修 1 必修  
-- =============================================
CREATE PROCEDURE [dbo].[Get_MyCoursesList]
    @MID INT ,
    @Year INT = 2014 ,
    @Type INT = 0
AS 
    SELECT  *
    FROM    ( SELECT    c.CID ,
                        c.Name ,
						c.CName,
                        c.Year ,
                        Minutes = ISNULL(myc.Minutes, 0) ,
                        Second = ISNULL(myc.Second, 0) ,
                        Status = ISNULL(myc.Status, 0) ,
                        c.Type ,
                        c.Sort ,
                        c.Teacher ,
                        c.Length ,
                        Cate = c.Cate ,
                        oCate = c.Cate,
						c.Tag,
						c.Memo
              FROM      Courses c
                        INNER JOIN My_Products myp ON c.YEAR = myp.PID
                                                      AND myp.MID = @MID
                        LEFT OUTER JOIN ( SELECT    CID ,
                                                    [Minutes] ,
                                                    [Second] ,
                                                    [Status]
                                          FROM      My_Courses
                                          WHERE     MID = @MID
                                        ) myc ON myc.CID = c.CID
              WHERE     c.Year = @Year
            ) AS tb
    ORDER BY Cate DESC ,
            Sort ASC ,
            CID ASC
    RETURN 0