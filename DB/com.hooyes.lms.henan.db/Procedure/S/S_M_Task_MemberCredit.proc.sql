﻿-- DROP PROC [S_M_Task_MemberCredit]
GO
-- =============================================
-- Version:     1.0.1.3
-- Author:		hooyes
-- Create date: 2012-07-22
-- Update date: 2014-04-14
-- Desc: 72 & 18
-- =============================================
CREATE PROCEDURE [dbo].[S_M_Task_MemberCredit] @count INT = 22
AS 
    DECLARE @MID INT ,
        @Year INT ,
        @Type INT ,
        @ID INT ,
        @M_Type INT ,
        @M_Phone VARCHAR(50) ,
        @score INT = 65
    DECLARE MCursor CURSOR LOCAL STATIC
    FOR
        SELECT TOP ( @count )
                M.MID ,
                M.Year ,
                M.Type ,
                MC.ID ,
                MC.Type ,
                MC.Phone
        FROM    MemberCredit MC
                INNER JOIN Member M ON ( MC.IDCard = M.IDCard
                                         AND MC.IDSN = M.IDSN
                                       )
        WHERE   MC.flag = 0
                AND MC.tag IN ( 100, 200 )
                AND ( ( Token = '0x7696218b99a86597d8d417008b1f10f0'
                        AND DATEDIFF(HOUR, M.RegDate, GETDATE()) >= 20
                      )
                      OR DATEDIFF(HOUR, M.RegDate, GETDATE()) >= 60
                    )
        ORDER BY MC.Year ASC ,
                MC.tstamp ASC

    OPEN MCursor 
    FETCH NEXT FROM MCursor INTO @MID, @Year, @Type, @ID, @M_Type, @M_Phone
    WHILE ( @@FETCH_STATUS = 0 ) 
        BEGIN
  
  	-- 2014 年的学员
            IF @Year = 2014 
                BEGIN
                    IF @Type = -1 
                        SET @Type = @M_Type
                    IF @Type = 0 
                        BEGIN
            /* 14031,14032,14002,14003,14006,14015 */      
                            EXECUTE [S_M_Update_Courses] @MID, 14031
                            EXECUTE [S_M_Update_Courses] @MID, 14032
                            EXECUTE [S_M_Update_Courses] @MID, 14002
                            EXECUTE [S_M_Update_Courses] @MID, 14003
                            EXECUTE [S_M_Update_Courses] @MID, 14006
                            EXECUTE [S_M_Update_Courses] @MID, 14015
                        END

                    IF @Type = 1 
                        BEGIN
		    /* 14016,14017,14018,14023,14030 */
                            EXECUTE [S_M_Update_Courses] @MID, 14016
                            EXECUTE [S_M_Update_Courses] @MID, 14017
                            EXECUTE [S_M_Update_Courses] @MID, 14018
                            EXECUTE [S_M_Update_Courses] @MID, 14023
                            EXECUTE [S_M_Update_Courses] @MID, 14030
                        END

		-- 更新成绩
                    IF NOT EXISTS ( SELECT  *
                                    FROM    Report
                                    WHERE   MID = @MID
                                            AND Score >= 60 ) 
                        BEGIN

                            SET @score = 60
                            SELECT  @score = @score + RAND() * 21

                            EXECUTE [Update_Report] @MID, @score
                        END

                END      
  
	-- 2013 年的学员
            IF @Year = 2013 
                BEGIN
                    IF @Type = -1 
                        SET @Type = @M_Type
                    IF @Type = 0 
                        BEGIN
                            EXECUTE [S_M_Update_Courses] @MID, 6101
                            EXECUTE [S_M_Update_Courses] @MID, 6102
                            EXECUTE [S_M_Update_Courses] @MID, 6108
                            EXECUTE [S_M_Update_Courses] @MID, 6112
                            EXECUTE [S_M_Update_Courses] @MID, 6109
                            EXECUTE [S_M_Update_Courses] @MID, 6110
                        END

                    IF @Type = 1 
                        BEGIN
                            EXECUTE [S_M_Update_Courses] @MID, 6113
                            EXECUTE [S_M_Update_Courses] @MID, 6114
                            EXECUTE [S_M_Update_Courses] @MID, 6127
                            EXECUTE [S_M_Update_Courses] @MID, 6128
                            EXECUTE [S_M_Update_Courses] @MID, 6133
                            EXECUTE [S_M_Update_Courses] @MID, 6134
                        END

		-- 更新成绩
                    IF NOT EXISTS ( SELECT  *
                                    FROM    Report
                                    WHERE   MID = @MID
                                            AND Score >= 60 ) 
                        BEGIN

                            SET @score = 60
                            SELECT  @score = @score + RAND() * 21

                            EXECUTE [Update_Report] @MID, @score
                        END

                END    

	-- 2012 年的学员
            IF @Year = 2012 
                BEGIN
                    IF @Type = -1 
                        SET @Type = @M_Type
                    IF @Type = 0 
                        BEGIN
                            EXECUTE [S_M_Update_Courses] @MID, 6001
                            EXECUTE [S_M_Update_Courses] @MID, 6002
                            EXECUTE [S_M_Update_Courses] @MID, 6005
                            EXECUTE [S_M_Update_Courses] @MID, 6006
                            EXECUTE [S_M_Update_Courses] @MID, 6007
                            EXECUTE [S_M_Update_Courses] @MID, 6008
                            EXECUTE [S_M_Update_Courses] @MID, 6009
                            EXECUTE [S_M_Update_Courses] @MID, 6010
                        END

                    IF @Type = 1 
                        BEGIN
                            EXECUTE [S_M_Update_Courses] @MID, 6003
                            EXECUTE [S_M_Update_Courses] @MID, 6004
                            EXECUTE [S_M_Update_Courses] @MID, 6030
                            EXECUTE [S_M_Update_Courses] @MID, 6025
                            EXECUTE [S_M_Update_Courses] @MID, 6026
                        END

		-- 更新成绩
                    IF NOT EXISTS ( SELECT  *
                                    FROM    Report
                                    WHERE   MID = @MID
                                            AND Score >= 60 ) 
                        BEGIN

                            SET @score = 60
                            SELECT  @score = @score + RAND() * 21

                            EXECUTE [Update_Report] @MID, @score
                        END

                END

	-- 2011 年的学员
            IF @Year = 2011 
                BEGIN
                    IF @Type = -1 
                        SET @Type = @M_Type
                    IF @Type = 0 
                        BEGIN
                            EXECUTE [S_M_Update_Courses] @MID, 3001
                            EXECUTE [S_M_Update_Courses] @MID, 3002
                            EXECUTE [S_M_Update_Courses] @MID, 3003
                            EXECUTE [S_M_Update_Courses] @MID, 3004
                            EXECUTE [S_M_Update_Courses] @MID, 3005
                            EXECUTE [S_M_Update_Courses] @MID, 3006
                        END

                    IF @Type = 1 
                        BEGIN
                            EXECUTE [S_M_Update_Courses] @MID, 3007
                            EXECUTE [S_M_Update_Courses] @MID, 3008
                            EXECUTE [S_M_Update_Courses] @MID, 3009
                            EXECUTE [S_M_Update_Courses] @MID, 3010
                        END

                END

	-- 2010 年的学员
            IF @Year = 2010 
                BEGIN
                    EXECUTE [S_M_Update_Courses] @MID, 3011
                    EXECUTE [S_M_Update_Courses] @MID, 3012
                    EXECUTE [S_M_Update_Courses] @MID, 3013
                    EXECUTE [S_M_Update_Courses] @MID, 3014
                    EXECUTE [S_M_Update_Courses] @MID, 3015
                END

	-- 2009 年的学员
            IF @Year = 2009 
                BEGIN
                    EXECUTE [S_M_Update_Courses] @MID, 3016
                    EXECUTE [S_M_Update_Courses] @MID, 3017
                    EXECUTE [S_M_Update_Courses] @MID, 3018
                    EXECUTE [S_M_Update_Courses] @MID, 3019
                END
	-- 2008 年的学员
            IF @Year = 2008 
                BEGIN
                    EXECUTE [S_M_Update_Courses] @MID, 3020
                    EXECUTE [S_M_Update_Courses] @MID, 3021
                    EXECUTE [S_M_Update_Courses] @MID, 3022
                    EXECUTE [S_M_Update_Courses] @MID, 3023
                    EXECUTE [S_M_Update_Courses] @MID, 3024
                END
	-- 2007 年的学员
            IF @Year = 2007 
                BEGIN
                    EXECUTE [S_M_Update_Courses] @MID, 3025
                    EXECUTE [S_M_Update_Courses] @MID, 3026
                    EXECUTE [S_M_Update_Courses] @MID, 3027
                    EXECUTE [S_M_Update_Courses] @MID, 3028
                END

	-- 2006 年的学员
            IF @Year = 2006 
                BEGIN
                    EXECUTE [S_M_Update_Courses] @MID, 3029
                    EXECUTE [S_M_Update_Courses] @MID, 3030
                    EXECUTE [S_M_Update_Courses] @MID, 3031
                    EXECUTE [S_M_Update_Courses] @MID, 3032
                    EXECUTE [S_M_Update_Courses] @MID, 3033
                    EXECUTE [S_M_Update_Courses] @MID, 3034
                END

	-- 评估
            EXECUTE [Task_EvaluteCourses] @MID


            UPDATE  MemberCredit
            SET     flag = 1 ,
                    MID = @MID
            WHERE   ID = @ID

	-- 更新电话和类型
            UPDATE  Member
            SET     Phone = CASE WHEN Phone IS NULL THEN @M_Phone
                                 WHEN Phone = '' THEN @M_Phone
                                 ELSE Phone
                            END ,
                    [Type] = CASE WHEN [Type] = -1 THEN @M_Type
                                  ELSE [type]
                             END
            WHERE   MID = @MID
    

            FETCH NEXT FROM MCursor INTO @MID, @Year, @Type, @ID, @M_Type,
                @M_Phone
        END
    CLOSE MCursor 
    DEALLOCATE MCursor 
    RETURN 0