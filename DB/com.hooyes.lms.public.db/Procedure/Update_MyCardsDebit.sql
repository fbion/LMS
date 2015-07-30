-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-07-14
-- Update date: 2015-07-14
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_MyCardsDebit]
    @MID INT = 0 ,
    @Amount MONEY = 0
AS
    DECLARE @ID INT = 0 ,
        @Surplus MONEY = 0
    DECLARE SCursor CURSOR
    FOR
        SELECT  ID ,
                MID ,
                Surplus
        FROM    dbo.My_Cards
        WHERE   MID = @MID
                AND Surplus > 0
                AND ExpDate > GETDATE()
                AND Status = 1
        ORDER BY ExpDate ASC
    OPEN SCursor 
    FETCH NEXT FROM SCursor INTO @ID, @MID, @Surplus
    WHILE ( @@FETCH_STATUS = 0 )
        BEGIN
        
            IF @Surplus >= @Amount
                BEGIN
                    SET @Surplus = @Surplus - @Amount
                    UPDATE  dbo.My_Cards
                    SET     Surplus = @Surplus ,
                            UpdateDate = GETDATE()
                    WHERE   ID = @ID
                    BREAK
                END 
            IF @Surplus < @Amount
                BEGIN
                    UPDATE  dbo.My_Cards
                    SET     Surplus = 0 ,
                            Status = 10 ,
                            UpdateDate = GETDATE()
                    WHERE   ID = @ID
                    SET @Amount = @Amount - @Surplus
                END
       
            FETCH NEXT FROM SCursor INTO @ID, @MID, @Surplus
        END
    CLOSE SCursor 
    DEALLOCATE SCursor
    RETURN 0
