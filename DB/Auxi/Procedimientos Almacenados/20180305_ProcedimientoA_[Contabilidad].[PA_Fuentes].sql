



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[PA_Fuentes]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Contabilidad].[PA_Fuentes]
GO

CREATE PROCEDURE [Contabilidad].[PA_Fuentes]
	
	@Operacion		VARCHAR(10)		= NULL
	,@Codigo		VARCHAR (4)		= NULL
	,@Nombre		VARCHAR (50)	= NULL
	,@Consecutivo	VARCHAR (6)		= NULL

AS

/*
	============================================================================================================================
	Nombre:			[Contabilidad].[PA_Fuentes]
	============================================================================================================================
	Tipo:			Procedimiento Almacenado
	Creación:		05-03-2017
	Desarrollador:  Erick Tijera
	Proposito:		Procedimiento almacenado para gestión de las fuentes
	Parámetros:						
					@Operacion		VARCHAR(10)		= Operación
					,@Codigo		VARCHAR (4)		= Código fuente
					,@Nombre		VARCHAR (50)	= Nombre fuente
					,@Consecutivo	VARCHAR (6)		= Consecutivo fuente



	============================================================================================================================
	Salidas:	    N/A
	============================================================================================================================
	Modificaciones:
		
	============================================================================================================================
	Pruebas y Ejemplos:	
		
	==========================================================================================================================================
*/

BEGIN
	SET NOCOUNT ON;

	--Fuentes--
	IF @Operacion = 'GETMAXFUENTE'
	BEGIN
		SELECT MAX(CAST(Codigo AS INT)) FROM Contabilidad.Fuentes		
	END
	
	--IF @Operacion = 'INSFUENTE'
	--BEGIN		
	--	INSERT INTO Contabilidad.Fuentes(Codigo
	--									,Nombre
	--									,Conse)
	--					VALUES			(@ftecod
	--									,@ftenom
	--									,@ftecon)

	--	SELECT @Codigo AS Codigo
	--END
	
	--IF @Operacion = 'UPDFUENTE'
	--BEGIN
	--	UPDATE profuentes SET ftenom = @ftenom
	--						 ,ftecon = @ftecon
	--	WHERE ftecod = @ftecod
	--END
	
	--IF @Operacion = 'GETFUENTE'
	--	SELECT ftenom, ftecon FROM profuentes WHERE ftecod = @ftecod
		
	------
END	