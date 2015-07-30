﻿-- =============================================
-- Version:     1.0.0.2
-- Author:		hooyes
-- Create date: 2013-09-24
-- Update date: 2015-03-12
-- Desc:
-- =============================================
CREATE PROCEDURE [dbo].[Task_BackupDB]
   @Path VARCHAR(500)  --- E:\Backup\
AS 
    DECLARE @SubPath VARCHAR(100) ,
        @FileName VARCHAR(1000)
    SET @SubPath = CONVERT(VARCHAR(8), GETDATE(), 112)
    SET @FileName = @Path + 'LMS_public_' + @SubPath + '.bak'
    BACKUP DATABASE [LMS_public] TO  DISK =@FileName --    N'D:\mssql_bak\bak20130924.bak'
	WITH NOFORMAT, NOINIT,  NAME = N'LMS_public-完整 数据库 备份', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
    RETURN 0
