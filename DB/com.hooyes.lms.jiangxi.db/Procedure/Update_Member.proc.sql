﻿-- =============================================
-- Version:     1.0.0.1
-- Author:		hooyes
-- Create date: 2012-02-02
-- Update date: 2013-10-02
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Update_Member]
    @MID INT OUTPUT ,
    @Login VARCHAR(50) ,
    @Password VARCHAR(50) =NULL,
    @Name VARCHAR(50) = '' ,
    @IDCard VARCHAR(20) = '' ,
    @IDSN VARCHAR(30) = '' ,
    @Year INT = 0 ,
    @Type INT = 0 ,
    @Level INT = 0 ,
    @Flag INT = 0 ,
    @RegionCode INT = 0
AS 
    IF @MID <= 0 
        BEGIN
            IF EXISTS ( SELECT  *
                        FROM    [Member]
                        WHERE   [Login] = @Login ) 
                BEGIN
                    SELECT  @MID = MID
                    FROM    [Member]
                    WHERE   [Login] = @Login
                END
            ELSE 
                BEGIN
                    DECLARE @SID INT
                    EXECUTE [Get_Seed] @ID = 1, @Value = @SID OUTPUT
                    SET @MID = @SID
                    SET @Password = sys.fn_VarBinToHexStr(HASHBYTES('md5',
                                                              @Password
                                                              + 'lms'
                                                              + CONVERT(VARCHAR, @MID)))
                    INSERT  INTO [Member]
                            ( [MID] ,
                              [Login] ,
                              [Password] ,
                              [Name] ,
                              [IDCard] ,
                              [IDSN] ,
                              [Year] ,
                              [Type] ,
                              [Level] ,
                              [Flag] ,
                              [RegionCode]
                            )
                    VALUES  ( @MID ,
                              @Login ,
                              @Password ,
                              @Name ,
                              @IDCard ,
                              @IDSN ,
                              @Year ,
                              @Type ,
                              @Level ,
                              @Flag ,
                              @RegionCode
                            )
                END
        END
    ELSE 
        BEGIN
            /* 修改密码 */      
            IF @Password != ''
                AND @Password IS NOT NULL 
                BEGIN
                    SET @Password = sys.fn_VarBinToHexStr(HASHBYTES('md5',
                                                              @Password
                                                              + 'lms'
                                                              + CONVERT(VARCHAR, @MID)))
                    UPDATE  [Member]
                    SET     Name = @Name ,
                            [Password] = @Password
                    WHERE   MID = @MID
                END
  
             /* 修改登录名，不能与其它用户重名 */   
            IF @Login != ''
                AND @Login IS NOT NULL 
                BEGIN
                    UPDATE  dbo.Member
                    SET     [Login] = @Login
                    WHERE   MID = @MID
                            AND NOT EXISTS ( SELECT 1
                                             FROM   dbo.Member
                                             WHERE  MID != @MID
                                                    AND [Login] = @Login )
                END
  
           /* 修改基本信息 */        
            UPDATE  dbo.Member
            SET     [IDCard] = @IDCard ,
                    RegionCode = @RegionCode ,
                    [Name] = @Name
            WHERE   MID = @MID      
                 
        END
    RETURN 0