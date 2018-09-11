IF OBJECT_ID('concat_ws') IS NOT NULL DROP FUNCTION concat_ws
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION concat_ws(@string VARCHAR(MAX), @delimiter VARCHAR(10))
RETURNS VARCHAR(MAX) AS
BEGIN
	DECLARE @tmp_concat_string VARCHAR(MAX)
	DECLARE @concat_string VARCHAR(MAX)

	DECLARE @index int
    SET @index = -1

	WHILE (LEN(@string) > 0) BEGIN
	    SET @index = CHARINDEX(',' , @string)

        IF (@index = 0) AND (LEN(@string) > 0) BEGIN
			SET @concat_string = CONCAT(@concat_string, LTRIM(RTRIM(@string)))
            BREAK 
        END

        IF (@index > 1) BEGIN
			SET @concat_string = CONCAT(@concat_string, LTRIM(RTRIM(LEFT(@string, @index - 1))),@delimiter)
            SET @string = RIGHT(@string, (LEN(@string) - @index))
        END
        ELSE
			SET @string = RIGHT(@string, (LEN(@string) - @index))
    END
	RETURN @concat_string
END
GO
