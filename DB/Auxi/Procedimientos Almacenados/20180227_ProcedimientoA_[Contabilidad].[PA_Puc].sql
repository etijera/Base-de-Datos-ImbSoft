
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[PA_Puc]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Contabilidad].[PA_Puc]
GO

CREATE PROCEDURE [Contabilidad].[PA_Puc]
	
	@Operacion					VARCHAR(10)		= NULL
	,@Codigo					VARCHAR(12)		= NULL
	,@ContraPartidaCajaMenor	VARCHAR(20)		= NULL
	,@ResponsableCajaMenor		VARCHAR(20)		= NULL
	,@MontoCajaMenor			MONEY			= NULL
	--,@GlPlano					VARCHAR(4)		= NULL
	,@Cheque					VARCHAR(12)		= NULL
	,@Gravamen					INT				= NULL
	,@Modalidad					INT				= NULL
	,@TipoRetencion				INT				= NULL
	,@PorcentajeRetencion		MONEY			= NULL
	,@Nombre					VARCHAR(50)		= NULL
	--,@Version					VARCHAR(10)		= NULL
	--,@CodigoDIAN				VARCHAR(10)		= NULL
	,@TipoConcepto				VARCHAR(12)		= ''
	,@Ccosto					INT				= NULL
	,@Tercero					INT				= NULL

AS

/*
	============================================================================================================================
	Nombre:			[Contabilidad].[PA_Puc]
	============================================================================================================================
	Tipo:			Procedimiento Almacenado
	Creación:		27-02-2017
	Desarrollador:  Erick Tijera
	Proposito:		Procedimiento almacenado para gestión del plan único de cuenta.
	Parámetros:						
					@Operacion					VARCHAR(20)		= Recibe la operacion a realizar
					,@Codigo					VARCHAR(12)		= Código del puc
					,@ContraPartidaCajaMenor	VARCHAR(20)		= Contra partida caja menor	
					,@ResponsableCajaMenor		VARCHAR(20)		= Responsable de caja menor			
					,@MontoCajaMenor			MONEY			= Monto caja menor	
					--,@GlPlano					----------------------------------------------------------			
					,@Cheque					VARCHAR(12)		= Numero Cheque
					,@Gravamen					INT				= 
					,@Modalidad					INT				= 
					,@TipoRetencion				INT				= 
					,@PorcentajeRetencion		MONEY			= 
					,@Nombre					VARCHAR(50)		= 
					--,@GlVersion				----------------------------------------------------------
					--,@GlCodDIAN				----------------------------------------------------------
					,@TipoConcepto				VARCHAR(12)		= 
					,@Ccosto					INT				= Requiere Ccosto
					,@Tercero					INT				= Requiere Tercero




	============================================================================================================================
	Salidas:	    N/A
	============================================================================================================================
	Modificaciones:
		
	============================================================================================================================
	Pruebas y Ejemplos:	
		EXEC [dbo].[PA_Usuarios] @Operacion = 'SELECTALL'
		
		EXEC [dbo].[PA_Usuarios] @Operacion = 'INSERTBASICO', @Nombre = 'ADMIN',@Usuario = 'ADMIN',@Clave = 'ADMIN', @CodTipoUsuario	= '0001'
	==========================================================================================================================================
*/

BEGIN
	SET NOCOUNT ON;

	SET @TipoConcepto = ''

	IF @Operacion = 'SCLC'
	BEGIN
		DECLARE @ChkF BIT 
				,@ChkT BIT
		SET		@ChkF = 'false'
		SET		@ChkT = 'true'
		
		--SELECT	Codigo
		--		,Descripcion
		--		,@CHK		Sel
		--FROM	puc_clasificacion
		--ORDER BY Descripcion
		
		SELECT	 CLA_PUC.codigo		Codigo
				,CLA_PUC.descripcion	Descripcion
				,CASE
					WHEN SUB.Det_codigo != '' THEN @ChkT
					ELSE @ChkF
				END								Sel
		FROM	Contabilidad.ClasificacionPuc AS CLA_PUC
				LEFT JOIN 
				(SELECT ISNULL(PUC_DET.CodigoClasificacion,'') Det_codigo
						,PUC_DET.CodigoPuc
				 FROM	Contabilidad.ClasificacionPucDetalles AS PUC_DET 
				 WHERE	PUC_DET.CodigoPuc = @Codigo) AS SUB ON CLA_PUC.Codigo = SUB.Det_codigo
		WHERE	CLA_PUC.MarcaBorrado = 1
		ORDER BY Descripcion
	END
	
	IF @Operacion = 'S'
	BEGIN
		SELECT	PUC.Codigo			Codigo
				,PUC.Nombre			Nombre
				,''					Version
				,''					Dian
				,PUC.TipoConcepto	Clasificacion
				,PUC.Ccosto			Ccosto
				,PUC.Tercero		Tercero
				,PUC.MarcaBorrado	MarcaBorrado
		FROM	Contabilidad.Puc AS PUC
		WHERE	PUC.Codigo	= @Codigo
		
	END
	
	IF @Operacion = 'IUPUC'
	BEGIN
		
		DECLARE @CodigoP			VARCHAR(12)
				,@CodigoSubCuenta	VARCHAR(12)
				,@GlcctSubCuenta	INT				
				,@GlterSubCuenta	INT				
				
		SET		@CodigoP				= ''
		SET		@CodigoSubCuenta	= ''				
		SET		@GlcctSubCuenta		= 0
		SET		@GlterSubCuenta		= 0
		
		SELECT	@CodigoP = PUC.Codigo
		FROM	Contabilidad.Puc AS PUC
		WHERE	PUC.Codigo = @Codigo
	
		IF LEN(@Codigo)>6
		BEGIN
			SET @CodigoSubCuenta = LEFT(@Codigo,6)
			
			SELECT	@Ccosto		= PUC.Ccosto
					,@Tercero	= PUC.Tercero
			FROM	Contabilidad.Puc AS PUC
			WHERE	PUC.Codigo = @CodigoSubCuenta
		END
		
		IF LEN(@Codigo)=6
		BEGIN
			UPDATE	Contabilidad.Puc
			SET		Ccosto		= @Ccosto
					,Tercero	= @Tercero	
			WHERE Codigo  LIKE (@CodigoP+'%')
		END
	
		IF @CodigoP = ''
		BEGIN
			INSERT INTO Contabilidad.Puc	(Codigo			
											,Nombre			
											--,glVersion		
											--,glCodDIAN		
											,TipoConcepto	
											,Ccosto			
											,Tercero)
					VALUES					(@Codigo
											,@Nombre
											--,@GlVersion	
											--,@GlCodDIAN	
											,@TipoConcepto
											,@Ccosto
											,@Tercero)
		END
		ELSE
		BEGIN
			UPDATE	Contabilidad.Puc
			SET		Nombre			= @Nombre			
					--,glVersion		= @GlVersion	
					--,glCodDIAN		= @GlCodDIAN	
					,TipoConcepto	= @TipoConcepto	
					,Ccosto			= @Ccosto	
					,Tercero		= @Tercero
			WHERE	Codigo= @Codigo
									
		END				
	END
	
	IF @Operacion = 'SCM' -- Selecionar Caja menor
	BEGIN
		SELECT	Codigo
				,ContraPartidaCajaMenor
				,ResponsableCajaMenor
				,MontoCajaMenor 
		FROM	Contabilidad.Puc  				
		WHERE	Codigo = @Codigo
	END
	
	IF @Operacion = 'ICM' -- Insertar Caja menor
	BEGIN
		INSERT INTO Contabilidad.Puc   (Codigo
										,ContraPartidaCajaMenor
										,ResponsableCajaMenor
										,MontoCajaMenor) 
		VALUES				 (@Codigo
							  ,@ContraPartidaCajaMenor
							  ,@ResponsableCajaMenor
							  ,@MontoCajaMenor)
	END
	
	IF @Operacion = 'UCM' -- Actualizar Caja Menor
	BEGIN
		UPDATE	Contabilidad.Puc 
		SET		ContraPartidaCajaMenor	= @ContraPartidaCajaMenor
				,ResponsableCajaMenor	= @ResponsableCajaMenor
				,MontoCajaMenor			= @MontoCajaMenor
		WHERE	Codigo = @Codigo
	END
	
	IF @Operacion = 'SCB' --Seleccionar Bancos
	BEGIN
		SELECT  @Codigo
				--,glPlano
				,Cheque
				,Gravamen
		FROM	Contabilidad.Puc  
		WHERE	Codigo = @Codigo
	END
	
	IF @Operacion = 'ICB' -- Insertar Banco
	BEGIN
		INSERT INTO Contabilidad.Puc (Cheque
									 --,glPlano
									 ,Gravamen)
		VALUES				 (	@Cheque
								 --,@GlPlano
								 ,@Gravamen)					
	END
	
	IF @Operacion = 'UCB' -- Actualizar banco
	BEGIN
		UPDATE	Contabilidad.Puc 
		SET		Cheque		= @Cheque
				--,glPlano	= @GlPlano
				,Gravamen	= @Gravamen
		WHERE	Codigo		= @Codigo					
	END	
	
	IF @Operacion = 'STI' -- Seleccionar Iva
	BEGIN
		SELECT  Codigo
				,Modalidad		
				,TipoRetencion
				,PorcentajeRetencion
		FROM	Contabilidad.Puc  
		WHERE	Codigo = @Codigo
	END
	
	IF @Operacion = 'ITI' -- Insertar Iva
	BEGIN
		INSERT INTO Contabilidad.Puc (Modalidad		
							,TipoRetencion
							,PorcentajeRetencion)
		VALUES				(@Modalidad		
							,@TipoRetencion
							,@PorcentajeRetencion)
		
	END
	
	IF @Operacion = 'UTI' -- Actualizar Iva
	BEGIN
		UPDATE	Contabilidad.Puc 
		SET		Modalidad				= @Modalidad
				,TipoRetencion			= @TipoRetencion
				,PorcentajeRetencion	= @PorcentajeRetencion
		WHERE	Codigo = @Codigo		
		
	END
	
	--IF @Operacion = 'VIDF' -- Verificar insercion activos diferidos
	--BEGIN
	--	SELECT	DifPuc
	--	FROM	prodiferidos
	--	WHERE	DifPuc = @Glcod		
	--END
	
	--IF @Operacion = 'VICN' -- Verificar insercion conceptos nomina
	--BEGIN
	--	SELECT	conAux
	--			,conCod
	--	FROM	neconceptos
	--	WHERE	conAux = @Glcod	
	--END
	
	--IF @Operacion = 'VIAF' -- Verificar insercion activos fijos
	--BEGIN
	--	SELECT	tacpuc
	--	FROM	accgltipoact
	--	WHERE	tacpuc = @Glcod	
	--END
	
	IF @Operacion = 'R'
	BEGIN
		UPDATE	Contabilidad.Puc 
		SET		MarcaBorrado='1'
		WHERE	Codigo = @Codigo
	END
END
