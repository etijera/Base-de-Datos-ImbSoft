
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
	--,@GlVersion					VARCHAR(10)		= NULL
	--,@GlCodDIAN					VARCHAR(10)		= NULL
	,@TipoConcepto				VARCHAR(12)		= NULL
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
		ORDER BY Descripcion
	END
	
	IF @Operacion = 'S'
	BEGIN
		SELECT	PUC.Codigo			Codigo
				,PUC.Nombre			Nombre
				--,PUC.glVersion		Version
				--,PUC.glCodDIAN		Dian
				,PUC.TipoConcepto	Clasificacion
				,PUC.Ccosto			Ccosto
				,PUC.Tercero		Tercero
				,PUC.MarcaBorrado	MarcaBorrado
		FROM	Contabilidad.Puc AS PUC
		WHERE	PUC.Codigo	= @Codigo
		
	END
	
	IF @Operacion = 'IUPUC'
	BEGIN
		
		DECLARE @CodigoP				VARCHAR(12)
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
			UPDATE	AccglPuc
			SET		glnum			= @Glnum			
					,glVersion		= @GlVersion	
					,glCodDIAN		= @GlCodDIAN	
					,TipoConcepto	= @TipoConcepto	
					,glcct			= @Glcct	
					,glter			= @Glter
			WHERE	glcod= @Glcod
									
		END				
	END
	
	IF @Operacion = 'SCM'
	BEGIN
		SELECT	glcod
				,glContraPartidaCajaMenor
				,glResponsableCajaMenor
				,glMotoCajaMenor 
		FROM	AccglPUC 				
		WHERE	glcod=@Glcod
	END
	
	IF @Operacion = 'ICM'
	BEGIN
		INSERT INTO AccglPUC (glcod
							  ,glContraPartidaCajaMenor
							  ,glResponsableCajaMenor
							  ,glMotoCajaMenor) 
		VALUES				 (@Glcod
							  ,@GlContraPartidaCajaMenor
							  ,@GlResponsableCajaMenor
							  ,@GlMotoCajaMenor)
	END
	
	IF @Operacion = 'UCM'
	BEGIN
		UPDATE	AccglPUC 
		SET		glContraPartidaCajaMenor = @GlContraPartidaCajaMenor
				,glResponsableCajaMenor  = @GlResponsableCajaMenor
				,glMotoCajaMenor		 = @GlMotoCajaMenor
		WHERE glcod = @Glcod
	END
	
	IF @Operacion = 'SCB'
	BEGIN
		SELECT  glcod
				,glPlano
				,glcheque
				,glgravamen
		FROM AccglPUC where glcod=@Glcod
	END
	
	IF @Operacion = 'ICB'
	BEGIN
		INSERT INTO accglPUC (glPlano
							 ,glcheque
							 ,glgravamen)
		VALUES				 (@GlPlano
							 ,@Glcheque
							 ,@Glgravamen)					
	END
	
	IF @Operacion = 'UCB'
	BEGIN
		UPDATE	accglPUC 
		SET		glPlano		= @GlPlano
				,glcheque	= @Glcheque
				,glgravamen	= @Glgravamen
		WHERE	glcod		= @Glcod 					
	END	
	
	IF @Operacion = 'STI'
	BEGIN
		SELECT  glcod
				,glModalidad		
				,glRetTipo
				,glRetPorCentaje
		FROM	AccglPUC 
		WHERE	glcod=@Glcod
	END
	
	IF @Operacion = 'ITI'
	BEGIN
		INSERT INTO AccglPUC(glModalidad		
							,glRetTipo
							,glRetPorCentaje)
		VALUES				(@GlModalidad		
							,@GlRetTipo
							,@GlRetPorCentaje)
		
	END
	
	IF @Operacion = 'UTI'
	BEGIN
		UPDATE	AccglPUC
		SET		glModalidad		= @GlModalidad
				,glRetTipo		= @GlRetTipo
				,glRetPorCentaje= @GlRetPorCentaje
		WHERE	glcod = @Glcod		
		
	END
	
	IF @Operacion = 'VIDF' -- Verificar insercion activos diferidos
	BEGIN
		SELECT	DifPuc
		FROM	prodiferidos
		WHERE	DifPuc = @Glcod		
	END
	
	IF @Operacion = 'VICN' -- Verificar insercion conceptos nomina
	BEGIN
		SELECT	conAux
				,conCod
		FROM	neconceptos
		WHERE	conAux = @Glcod	
	END
	
	IF @Operacion = 'VIAF' -- Verificar insercion activos fijos
	BEGIN
		SELECT	tacpuc
		FROM	accgltipoact
		WHERE	tacpuc = @Glcod	
	END
	
	IF @Operacion = 'R'
	BEGIN
		UPDATE	accglPUC
		SET		delmrk='1'
		WHERE	glcod = @Glcod
	END
END
