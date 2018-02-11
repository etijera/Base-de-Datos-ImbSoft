
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[PA_IngresarDocumentosCtt]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Contabilidad].[PA_IngresarDocumentosCtt]
GO

CREATE PROCEDURE [Contabilidad].[PA_IngresarDocumentosCtt]  
		@Operacion			VARCHAR(12)		= NULL
		,@Consecutivo		VARCHAR(24)		= NULL
		,@Fuente			VARCHAR(6)		= NULL
		,@Fecha				DATETIME		= NULL
		--,@NotaAclaratoria	VARCHAR(MAX)	= NULL		
AS

-- =====================================================================================================
-- Nombre:			[Contabilidad].[PA_IngresarDocumentosCtt]
-- =====================================================================================================
-- Tipo:			Procedimiento Almacenado.
-- Creación:		05-02-2018
-- Desarrollador:  	Erick Tijera(etijera)
-- Proposito:		Procedimiento almacenado para gestionar el ingreso de los documentos
-- =====================================================================================================
-- Parámetros:						
--		@Operacion			= Operación.
--		,@Consecutivo		= Consecutivo del documento
--		,@Fuente			= Fuente del documento
--		,@Fecha				= Fecha del documento.		
-- =====================================================================================================		
-- Salidas:			N/A
-- =====================================================================================================
-- Modificaciones: 

-- =====================================================================================================
-- Pruebas y Ejemplos
-- EXEC [Contabilidad].[PA_IngresarDocumentosCtt]  @Operacion = 'SD', @Fuente = '001', @Fecha = '20180205'
-- =====================================================================================================

BEGIN
	IF @Operacion = 'SD'
	BEGIN
		SELECT  MA.Cuenta							Codigo	
				,ISNULL(PUC.Nombre,'')				Cuenta 					
				,ISNULL(MA.Descripcion,'')			Detalle
				,ISNULL(MA.CodCentroCosto,'')		Ccosto	
				,ISNULL(CC.Nombre,'')				DesCcosto
				,ISNULL(TE.DocumentoIdentidad,'')	Tercero 
				,ISNULL(TE.RazonSocial,'')			NomTercero 
				,MA.ValorDebe						Debe 
				,0									Haber 
				,PUC.Ccosto							RCcosto
				,''									CTT
				,''									DetCTT
		FROM	Contabilidad.CabeceraAsientos AS CA
				INNER JOIN Contabilidad.MovimientosAsiento AS MA ON MA.Asiento = CA.Id
				LEFT JOIN dbo.Terceros AS TE ON TE.Codigo = MA.CodTercero 
				LEFT JOIN Contabilidad.CentroCostos AS CC ON CC.Codigo = MA.CodCentroCosto
				LEFT JOIN Contabilidad.Puc AS PUC ON PUC.Codigo = MA.Cuenta
				--LEFT JOIN ordenes       ON ordenes.ordnro    = accGLMAS.MasOT Debe ser la tabla de contrato
		WHERE	CA.CodigoFuente = @Fuente 
				AND CA.Comprobante =  @Consecutivo AND CA.Fecha = @Fecha
				AND MA.ValorDebe > 0 			
		UNION ALL
		SELECT  MA.Cuenta							Codigo	
				,ISNULL(PUC.Nombre,'')				Cuenta 					
				,ISNULL(MA.Descripcion,'')			Detalle
				,ISNULL(MA.CodCentroCosto,'')		Ccosto	
				,ISNULL(CC.Nombre,'')				DesCcosto
				,ISNULL(TE.DocumentoIdentidad,'')	Tercero 
				,ISNULL(TE.RazonSocial,'')			NomTercero 
				,0									Debe 
				,MA.ValorHaber						Haber 
				,PUC.Ccosto							RCcosto
				,''									CTT
				,''									DetCTT
		FROM	Contabilidad.CabeceraAsientos AS CA
				INNER JOIN Contabilidad.MovimientosAsiento AS MA ON MA.Asiento = CA.Id
				LEFT JOIN dbo.Terceros AS TE ON TE.Codigo = MA.CodTercero 
				LEFT JOIN Contabilidad.CentroCostos AS CC ON CC.Codigo = MA.CodCentroCosto
				LEFT JOIN Contabilidad.Puc AS PUC ON PUC.Codigo = MA.Cuenta
				--LEFT JOIN ordenes       ON ordenes.ordnro    = accGLMAS.MasOT Debe ser la tabla de contrato
		WHERE	CA.CodigoFuente = @Fuente 
				AND CA.Comprobante =  @Consecutivo AND CA.Fecha = @Fecha
				AND MA.ValorDebe > 0 	
	END	
END
