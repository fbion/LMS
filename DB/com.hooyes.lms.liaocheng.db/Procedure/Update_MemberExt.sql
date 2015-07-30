-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2015-03-29
-- Update date: 2015-03-29
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_MemberExt]
    @MID INT ,
    @IDSN VARCHAR(30) , -- Primary Key
    @PID INT ,
    @Flag INT
AS 
    UPDATE  MemberExt
    SET     [PID] = @PID ,
            Flag = @Flag
    WHERE   IDSN = @IDSN
    IF @@ROWCOUNT = 0 AND @MID > 0 
        BEGIN 
            INSERT  INTO [dbo].[MemberExt]
                    ( [MID], [IDSN], [PID], [Flag] )
            VALUES  ( @MID, @IDSN, @PID, @Flag )
        END

    RETURN 0
