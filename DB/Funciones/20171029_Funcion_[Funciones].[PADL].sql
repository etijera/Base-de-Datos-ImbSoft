
--GO
---- Crear esquema Funciones: En este esquema se crearan todas las funciones de la base de datos.
--Create schema Funciones
--GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PADL]') AND type in (N'FN'))
	DROP PROCEDURE [Funciones].[PADL]
GO

CREATE function [Funciones].[PADL]  (@cString nvarchar(4000), @nLen smallint, @cPadCharacter nvarchar(4000) = ' ' )
returns nvarchar(4000)
as

-- Author:  Igor Nikiforov,  Montreal,  EMail: udfunctions@gmail.com   
 -- PADL(), PADR(), PADC() User-Defined Functions
 -- Returns a string from an expression, padded with spaces or characters to a specified length on the left or right sides, or both.
 -- PADL similar to the Oracle function PL/SQL  LPAD 

  begin
        declare @length smallint, @lengthPadCharacter smallint
        if @cPadCharacter is NULL or  datalength(@cPadCharacter) = 0
           set @cPadCharacter = space(1) 
        select  @length = datalength(@cString)/(case SQL_VARIANT_PROPERTY(@cString,'BaseType') when 'nvarchar' then 2  else 1 end) -- for unicode
        select  @lengthPadCharacter = datalength(@cPadCharacter)/(case SQL_VARIANT_PROPERTY(@cPadCharacter,'BaseType') when 'nvarchar' then 2  else 1 end) -- for unicode

        if @length >= @nLen
           set  @cString = left(@cString, @nLen)
        else
	       begin
              declare @nLeftLen smallint
              set @nLeftLen = @nLen - @length  -- Quantity of characters, added at the left
              set @cString = left(replicate(@cPadCharacter, ceiling(@nLeftLen/@lengthPadCharacter) + 2), @nLeftLen)+ @cString
           end

    return (@cString)
  end

