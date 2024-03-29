﻿-- =============================================
-- Version:     1.0.1.0
-- Author:		hooyes
-- Create date: 2012-01-02
-- Update date: 2015-04-01
-- Desc: 
-- =============================================
CREATE PROCEDURE [dbo].[Get_MyPaper]
    @MID INT = 0 ,
    @Year INT = 0 ,
    @Type INT = 0
AS 
    DECLARE @Question TABLE
        (
          [QID] [int] NOT NULL ,
          [CName] [varchar](50) NOT NULL ,
          [Subject] [nvarchar](300) NOT NULL ,
          [A] [nvarchar](255) NULL ,
          [B] [nvarchar](255) NULL ,
          [C] [nvarchar](255) NULL ,
          [D] [nvarchar](255) NULL ,
          [Answer] [nvarchar](50) NOT NULL ,
          [Score] [int] NOT NULL ,
          [Cate] [int] NULL
        )


    DECLARE @Tags VARCHAR(100) ,
        @Count INT = 0 ,
        @Cate INT = 1    --- 目前 1,2,3


    WHILE ( @Cate < 4 ) 
        BEGIN
            SET @Tags ='0' 
			SET @Count = 0
			
            SELECT  @Tags = Tags ,
                    @Count = [Count]
            FROM    dbo.QuestionConfig
            WHERE   [Year] = @Year
                    AND [Cate] = @Cate
					AND [Type] = @Type
            INSERT  INTO @Question
                    ( [QID] ,
                      [CName] ,
                      [Subject] ,
                      [A] ,
                      [B] ,
                      [C] ,
                      [D] ,
                      [Answer] ,
                      [Score] ,
                      [Cate]
                    )
                    SELECT TOP ( @Count )
                            [QID] ,
                            [CName] ,
                            [Subject] ,
                            [A] ,
                            [B] ,
                            [C] ,
                            [D] ,
                            [Answer] ,
                            [Score] ,
                            [Cate]
                    FROM    Question
                    WHERE   [Cate] = @Cate
                            AND [CName] IN ( SELECT [value]
                                         FROM   [split](@Tags, ',') )
				    ORDER BY NEWID()
            SET @Cate = @Cate + 1
        END



	
    SELECT  *
    FROM    @Question
    ORDER BY Cate ASC

 
    RETURN 0