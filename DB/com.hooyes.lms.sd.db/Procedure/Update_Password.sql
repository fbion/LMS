-- DROP PROC [M_Update_Password]
GO
-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2015-03-10
-- Update date: 2015-03-10
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_Password]
    @MID INT ,
    @Password VARCHAR(50)
AS 
    DECLARE @NewPassword VARCHAR(50)  
    SET @NewPassword = sys.fn_VarBinToHexStr(HASHBYTES('md5',
                                                       @Password + 'lms'
                                                       + CONVERT(VARCHAR, @MID)))
    UPDATE  [Member]
    SET     [Password] = @NewPassword
    WHERE   MID = @MID

    RETURN 0
