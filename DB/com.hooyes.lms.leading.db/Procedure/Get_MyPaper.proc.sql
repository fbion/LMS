-- =============================================
-- Version:     1.0.1.0
-- Author:		hooyes
-- Create date: 2012-01-02
-- Update date: 2015-03-26
-- Desc: 单科考试用
-- =============================================
CREATE PROCEDURE [dbo].[Get_MyPaper]
    @MID INT = 0 ,
    @Year INT = 0 ,
    @CID INT = 0
AS 
    DECLARE @Question TABLE
        (
          [QID] [int] NOT NULL ,
          [CID] [int] NOT NULL ,
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
        @Cate INT = 1 ,    --- 目前 1,2,3
        @CName VARCHAR(50)

    SELECT  @CName = CName
    FROM    dbo.Courses
    WHERE   CID = @CID

    WHILE ( @Cate < 4 ) 
        BEGIN
            SET @Tags = '0' 
            SET @Count = 0
			
            SELECT  @Tags = Tags ,
                    @Count = [Count]
            FROM    dbo.QuestionConfig
            WHERE   [Year] = @Year
                    AND [Cate] = @Cate
            INSERT  INTO @Question
                    ( [QID] ,
                      [CID] ,
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
                            [CID] = @CID ,
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
                            AND [CName] = @CName
                    ORDER BY NEWID()
            SET @Cate = @Cate + 1
        END

    SELECT  @Count = COUNT(1)
    FROM    @Question

	/* 取不到题，取默认题库*/
    IF @Count > 0 
        BEGIN
            SELECT  *
            FROM    @Question
            ORDER BY Cate ASC
        END 
    ELSE 
        BEGIN
            EXECUTE [Get_MyPaper_Defaut] 
                @MID = @MID ,
                @Year = @Year ,
                @CID = @CID
        END   

	

 
    RETURN 0