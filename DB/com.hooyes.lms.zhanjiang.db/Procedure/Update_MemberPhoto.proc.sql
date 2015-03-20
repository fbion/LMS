-- =============================================
-- Version:     1.0.0.4
-- Author:		hooyes
-- Create date: 2012-02-02
-- Update date: 2015-02-16
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_MemberPhoto]
    @MID INT ,
    @Photo VARCHAR(50) = ''
AS 
    UPDATE  Member
    SET     Photo = @Photo
    WHERE   MID = @MID
    RETURN 0