-- A Procedure realiza o Restore de um banco de dados.
-- Com o par�metro @bd indica o banco de dados que deseja realizar o restore.
-- Com o par�metro @cm indica caminho de onde est� o arquivo de backup que deseja realizar o restore.

CREATE PROC SP_RESTORE (@bd NVARCHAR(20), @cm NVARCHAR(150))
AS
BEGIN
DECLARE @sql NVARCHAR(150)
SET @sql = 'RESTORE DATABASE ' + @bd + 
' FROM DISK = N''' + @cm + ''''
EXEC sp_executesql @sql
END 
GO