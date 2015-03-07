-- =============================================
-- Version:     1.0.0.3
-- Author:		hooyes
-- Create date: 2013-09-24
-- Update date: 2014-12-22
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_Certificate] @MID INT
AS 
    DECLARE @ID INT ,
        @BeginDate DATETIME ,
        @EndDate DATETIME

    
    SELECT  @BeginDate = MIN(CreateDate)
    FROM    dbo.Report
    WHERE   MID = @MID

    SELECT  @EndDate = ISNULL(MAX(CommitDate), MAX(UpdateDate))
    FROM    dbo.Report
    WHERE   MID = @MID
            AND [Status] = 1
    IF @EndDate < '2014-12-21' 
        BEGIN
            SET @EndDate = '2014-12-21'
        END   

    UPDATE  [Certificate]
    SET     BeginDate = @BeginDate ,
            EndDate = @EndDate ,
            @ID = ID
    WHERE   MID = @MID
    IF @@ROWCOUNT = 0 
        BEGIN
            EXECUTE [Get_Seed] 
                @ID = 5 ,
                @Value = @ID OUTPUT      
            INSERT  INTO [Certificate]
                    ( [ID] ,
                      [MID] ,
                      [BeginDate] ,
                      [EndDate] ,
                      [CreateDate]
                    )
            VALUES  ( @ID ,
                      @MID ,
                      @BeginDate ,
                      @EndDate ,
                      GETDATE()
                    )
        END  

    RETURN @ID
