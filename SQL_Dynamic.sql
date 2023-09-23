-- A Procedure realiza uma consulta em uma determindada tabela.
-- Poder� indicar quantas linhas deseja retornar atrav�s do par�metro @top.
-- Poder� indicar qual tebela realizar a consulta atrav�s do par�metro @tab.
-- Poder� indicar a coluna que deseja fazer o ordenamento atrav�s do par�metro @ord.

CREATE PROC SQL_Dynamic(@top SMALLINT, @tab NVARCHAR(20),
@ord NVARCHAR(20))
AS
BEGIN
DECLARE @sql NVARCHAR(300)
SET @sql = CONCAT('SELECT TOP ', @top, ' * FROM ', '.',
QUOTENAME(@tab), ' ORDER BY ', QUOTENAME(@ord))
EXEC sp_executesql @sql
END