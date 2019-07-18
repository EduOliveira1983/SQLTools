create FUNCTION dbo.LastIndexOf(@text NTEXT, @delimiter NTEXT)  
--Fonte https://stackoverflow.com/questions/39002025/is-there-a-lastindexof-in-sql-server
RETURNS INT
AS       
BEGIN  
  IF (@text IS NULL) RETURN NULL;
  IF (@delimiter IS NULL) RETURN NULL;
  DECLARE @Text2 AS NVARCHAR(MAX) = @text;
  DECLARE @Delimiter2 AS NVARCHAR(MAX) = @delimiter;
  DECLARE @Index AS INT = CHARINDEX(REVERSE(@Delimiter2), REVERSE(@Text2));
  IF (@Index < 1) RETURN 0;
  DECLARE @ContentLength AS INT = (LEN('|' + @Text2 + '|') - 2);
  DECLARE @DelimiterLength AS INT = (LEN('|' + @Delimiter2 + '|') - 2);
  DECLARE @Result AS INT = (@ContentLength - @Index - @DelimiterLength + 2);
  RETURN @Result;
END
