




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[PA_Retenciones]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Contabilidad].[PA_Retenciones]
GO

CREATE PROCEDURE [Contabilidad].[PA_Retenciones]
	
	@Operacion		VARCHAR(20)		= NULL
	,@CodigoPuc		VARCHAR (12)	= NULL
	,@Nombre		VARCHAR (50)	= NULL
	,@Monto			MONEY			= NULL
	,@Porcentaje	MONEY			= NULL
	,@Tipo			MONEY			= NULL

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
					,@CodigoPuc		VARCHAR (12)	= Codigo Puc
					,@Nombre		VARCHAR (50)	= Nombre Retencion
					,@Monto			MONEY			= Monto
					,@Porcentaje	MONEY			= Porcentaje
					,@Tipo			MONEY			= Tipo



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

	IF @Operacion = 'INSRETEICA'
	BEGIN
		INSERT INTO Contabilidad.V_ReteIca (Nombre
							,Monto
							,Porcentaje
							,Tipo
							,Codigo)
					VALUES	(@Nombre
							,@Monto
							,@Porcentaje
							,@Tipo
							,@CodigoPuc)
	END

	IF @Operacion = 'INSRETECREE'
	BEGIN
		INSERT INTO Contabilidad.V_ReteCree(Nombre
											,Monto
											,Porcentaje
											,Tipo
											,Codigo)
					VALUES	(@Nombre
							,@Monto
							,@Porcentaje
							,@Tipo
							,@CodigoPuc)
	END
	
	IF @Operacion = 'INSRETEIVA'
	BEGIN
		INSERT INTO Contabilidad.V_ReteIva (Nombre
							,Monto
							,Porcentaje
							,Tipo
							,Codigo)
					VALUES	(@Nombre
							,@Monto
							,@Porcentaje
							,@Tipo
							,@CodigoPuc)
	END
	
	IF @Operacion = 'INSRETEFTE'
	BEGIN
		INSERT INTO Contabilidad.V_ReteFte (Nombre
							,Monto
							,Porcentaje
							,Tipo
							,Codigo)
					VALUES	(@Nombre
							,@Monto
							,@Porcentaje
							,@Tipo
							,@CodigoPuc)
	END
	
	IF @Operacion = 'UPDRETEFTE'
	BEGIN
		UPDATE	Contabilidad.V_ReteFte 
		SET		Nombre		= @Nombre
				,Monto		= @Monto
				,Porcentaje = @Porcentaje
				,Tipo		= @Tipo
		WHERE	Codigo		= @CodigoPuc
	END	
	
	IF @Operacion = 'UPDRETEICA'
	BEGIN
		UPDATE	Contabilidad.V_ReteIca 
		SET		Nombre		= @Nombre
				,Monto		= @Monto
				,Porcentaje = @Porcentaje
				,Tipo		= @Tipo
		WHERE	Codigo		= @CodigoPuc
	END

	IF @Operacion = 'UPDRETEIVA'
	BEGIN
		UPDATE Contabilidad.V_ReteIva	
		SET		Nombre		= @Nombre
				,Monto		= @Monto
				,Porcentaje = @Porcentaje
				,Tipo		= @Tipo
		WHERE	Codigo		= @CodigoPuc
	END
	
	IF @Operacion = 'UPDRETECREE'
	BEGIN
		UPDATE	Contabilidad.V_ReteCree 
		SET		Nombre		= @Nombre
				,Monto		= @Monto
				,Porcentaje = @Porcentaje
				,Tipo		= @Tipo
		WHERE	Codigo		= @CodigoPuc
	END
	
	IF @Operacion = 'GETRETEFTE'
	BEGIN
		SELECT	Monto		AS Monto
			   ,Porcentaje	AS Porcentaje
			   ,Tipo		AS Tipo
		FROM	Contabilidad.V_ReteFte
		WHERE	Codigo = @CodigoPuc
	END
	
	IF @Operacion = 'GETRETEICA'
	BEGIN
		SELECT	Monto		AS Monto
			   ,Porcentaje	AS Porcentaje
			   ,Tipo		AS Tipo
		FROM	Contabilidad.V_ReteIca
		WHERE	Codigo = @CodigoPuc
	END
	
	IF @Operacion = 'GETRETEIVA'
	BEGIN
		SELECT	Monto		AS Monto
			   ,Porcentaje	AS Porcentaje
			   ,Tipo		AS Tipo
		FROM	Contabilidad.V_ReteIva
		WHERE	Codigo = @CodigoPuc
	END
	
	IF @Operacion = 'GETRETECREE'
	BEGIN
		SELECT	Monto		AS Monto
			   ,Porcentaje	AS Porcentaje
			   ,Tipo		AS Tipo
		FROM	Contabilidad.V_ReteCree
		WHERE	Codigo = @CodigoPuc
	END
	
END