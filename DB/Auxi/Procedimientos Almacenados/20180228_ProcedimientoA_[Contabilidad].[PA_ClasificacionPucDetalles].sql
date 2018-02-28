
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[PA_ClasificacionPucDetalles]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Contabilidad].[PA_ClasificacionPucDetalles]
GO


CREATE PROCEDURE [Contabilidad].[PA_ClasificacionPucDetalles]
	
	@Operacion				VARCHAR(10)		= NULL
	,@CodigoClasificacion	VARCHAR(4)		= NULL
	,@CodigoPuc				VARCHAR(12)		= NULL

AS
BEGIN
	SET NOCOUNT ON;

	IF @Operacion = 'I'
	BEGIN
		DECLARE @Codigo VARCHAR(12)
		SET		@Codigo = ''
	
		SELECT	@Codigo = CodigoClasificacion
		FROM	Contabilidad.ClasificacionPucDetalles
		WHERE	CodigoClasificacion	= @CodigoClasificacion
				AND CodigoPuc	= @CodigoPuc
				
		IF @Codigo =''
		BEGIN
			INSERT INTO Contabilidad.ClasificacionPucDetalles (CodigoClasificacion
											  ,CodigoPuc)
			VALUES							  (@CodigoClasificacion
											  ,@CodigoPuc)
		END		
	END
	
	IF @Operacion = 'D'
	BEGIN	
		DELETE 
		FROM	Contabilidad.ClasificacionPucDetalles
		WHERE	CodigoPuc = @CodigoPuc
	END
END
