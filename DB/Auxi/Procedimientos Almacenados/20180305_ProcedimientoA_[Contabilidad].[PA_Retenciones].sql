




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[PA_Retenciones]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Contabilidad].[PA_Retenciones]
GO

CREATE PROCEDURE [Contabilidad].[PA_Retenciones]
	
	@Operacion	VARCHAR(10)		= NULL
	,@retpuc	VARCHAR (12)	= NULL
	,@retnom	VARCHAR (50)	= NULL
	,@retmon	NUMERIC (9)		= NULL
	,@retpor	NUMERIC (9)		= NULL
	,@rettip	NUMERIC (9)		= NULL

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

END