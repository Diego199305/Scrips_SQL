-- A Procedure realiza os backups Full (@op = 'F'), Differential (@op = 'D'), e do Log (@op = 'L') de um banco de dados.
-- Com o parâmetro @op será indicado o tipo de backup que deseja realizar.
-- Se o parâmetro indicado for incorreto, a operação será inválida.

CREATE PROC SP_BACKUP (@op CHAR(1), @db NVARCHAR(20))
AS
BEGIN
DECLARE @DATA VARCHAR(25), @ext CHAR(4), @cam NVARCHAR(50)
SET @DATA = CONVERT(VARCHAR(25), GETDATE(), 104)
SET @cam = 'C:\Backup\'
IF @op = 'F'
	BEGIN
	DECLARE @sql NVARCHAR(250)
	SET @ext = '.bak' 
	SET @sql = CONCAT('BACKUP DATABASE ', @db, ' TO DISK = N''',@cam, @db, '_FULL_', @DATA, @ext,'''', ' WITH COMPRESSION, CHECKSUM')
	EXEC sp_executesql @sql 
	END
ELSE IF @op = 'D'
	BEGIN
	SET @ext = '.bak' 
	SET @sql = CONCAT('BACKUP DATABASE ', @db, ' TO DISK = N''',@cam, @db,'_DIFF_', @DATA, @ext,'''', ' WITH DIFFERENTIAL, COMPRESSION, CHECKSUM')
	EXEC sp_executesql @sql 
	END
ELSE IF @op = 'L'
	BEGIN
	SET @ext = '.bak' 
	SET @sql = CONCAT('BACKUP LOG ', @db, ' TO DISK = N''',@cam, @db, '_LOG_', @DATA, @ext,'''', ' WITH COMPRESSION, CHECKSUM')
	EXEC sp_executesql @sql 
	END
ELSE 
	BEGIN
	PRINT 'Operação inválida!'
	END
END
GO
