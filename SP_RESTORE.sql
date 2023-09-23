-- A Procedure realiza o Restore de um banco de dados.
-- Com o parâmetro @bd indica o banco de dados que deseja realizar o restore.
-- Com o parâmetro @cm indica caminho de onde está o arquivo de backup que deseja realizar o restore.

CREATE PROC SP_RESTORE (@bd NVARCHAR(20), @cm NVARCHAR(150))
AS
BEGIN
DECLARE @sql NVARCHAR(150)
SET @sql = 'RESTORE DATABASE ' + @bd + 
' FROM DISK = N''' + @cm + ''''
EXEC sp_executesql @sql
END 
GO