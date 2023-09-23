-- A Procedure realiza uma consulta em uma determindada tabela.
-- Poderá indicar quantas linhas deseja retornar através do parâmetro @top.
-- Poderá indicar qual tebela realizar a consulta através do parâmetro @tab.
-- Poderá indicar a coluna que deseja fazer o ordenamento através do parâmetro @ord.

CREATE PROC SQL_Dynamic(@top SMALLINT, @tab NVARCHAR(20),
@ord NVARCHAR(20))
AS
BEGIN
DECLARE @sql NVARCHAR(300)
SET @sql = CONCAT('SELECT TOP ', @top, ' * FROM ', '.',
QUOTENAME(@tab), ' ORDER BY ', QUOTENAME(@ord))
EXEC sp_executesql @sql
END