-- =============================================
-- Version:     1.0.0.5
-- Author:		hooyes
-- Create date: 2013-09-16
-- Update date: 2015-07-14
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_CommitOrder]
    @MID INT ,
    @ID INT ,
    @Cash MONEY ,
    @Credit MONEY ,
    @Code INT = 0 OUTPUT ,
    @Message NVARCHAR(4000) = '' OUTPUT
AS
    BEGIN TRY
        BEGIN TRANSACTION  
        DECLARE @Tags VARCHAR(2000) ,
            @OrderAmount MONEY
        SELECT  @Tags = Tags ,
                @OrderAmount = Amount
        FROM    Orders
        WHERE   ID = @ID
                AND Cash = @Cash
                AND Credit = @Credit
                AND [Status] < 10
                AND ( Cash > 0
                      OR Credit > 0
                    )
        IF @Tags IS NOT NULL
            BEGIN
                INSERT  INTO [My_Products]
                        ( [MID] ,
                          [PID] ,
                          [CreateDate] ,
                          [Memo] ,
                          [ExpireDate]
                        )
                        SELECT  MID = @MID ,
                                PID = p.PID ,
                                CreateDate = GETDATE() ,
                                Memo = @ID ,
                                [ExpireDate] = DATEADD(MONTH, p.Duration,
                                                       GETDATE())
                        FROM    dbo.split(@Tags, ',') t
                                INNER JOIN Products p ON CONVERT(INT, t.[value]) = p.ID
                        WHERE   NOT EXISTS ( SELECT 1
                                             FROM   [My_Products]
                                             WHERE  MID = @MID
                                                    AND PID = t.[value] )	
                IF @@ROWCOUNT > 0
                    BEGIN
                        UPDATE  Orders
                        SET     [Status] = 10 ,
                                UpdateDate = GETDATE()
                        WHERE   ID = @ID
                                AND MID = @MID
					/* 余额扣款 */
                        IF @Credit > 0
                            BEGIN
                                EXECUTE [Update_BalanceDebit]
                                    @MID ,
                                    @Credit ,
                                    @Code OUTPUT ,
                                    @Message OUTPUT
                            END 
                        ELSE
                            BEGIN            
                                SET @Code = 0
                                SET @Message = 'Success' 
                            END    
                    END
                ELSE
                    BEGIN
                        SET @Code = 1
                        SET @Message = 'Parse error'  
                    END          
            END
        ELSE
            BEGIN
                SET @Code = -1
                SET @Message = 'Error'
            END 
		
		/* 记录交易明细 */ 
        IF @Code = 0
            BEGIN

			    /* 2 现金充值 */
                IF @Cash > 0
                    BEGIN
                        INSERT  INTO dbo.Transactions
                                ( MID ,
                                  Amount ,
                                  Cate ,
                                  Source ,
                                  Memo ,
                                  CreateDate
		                        )
                        VALUES  ( @MID ,
                                  @Cash ,
                                  2 ,
                                  CONVERT(VARCHAR(10), @ID) ,
                                  N'' ,
                                  GETDATE()
                                )
                    END 
			    /* 101 订单消费 */
                INSERT  INTO dbo.Transactions
                        ( MID ,
                          Amount ,
                          Cate ,
                          Source ,
                          Memo ,
                          CreateDate
		                )
                VALUES  ( @MID ,
                          @OrderAmount ,
                          101 ,
                          CONVERT(VARCHAR(10), @ID) ,
                          N'' ,
                          GETDATE()
                        )

			    /* 卡消费 */

                EXECUTE [Update_MyCardsDebit]
                    @MID = @MID ,
                    @Amount = @Credit

			     
            END

        COMMIT 
    END TRY
    BEGIN CATCH
        ROLLBACK   
        SET @Code = -100
        SET @Message = 'Transaction Error:' + ERROR_MESSAGE()
    END CATCH  
    RETURN 0
