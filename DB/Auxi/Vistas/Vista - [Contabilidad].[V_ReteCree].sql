

--	DROP VIEW [Contabilidad].[V_ReteCree]
CREATE VIEW [Contabilidad].[V_ReteCree]
AS
SELECT	PUC.MarcaBorrado
		,PUC.Codigo as Codigo
		,PUC.Nombre as Nombre
		,PUC.MontoRetencion As Monto
		,PUC.PorcentajeRetencion As Porcentaje
		,PUC.TipoRetencion As Tipo
FROM	Contabilidad.Puc AS PUC
		INNER JOIN Contabilidad.ClasificacionPucDetalles AS PUD_DET ON PUD_DET.CodigoPuc = PUC.Codigo
WHERE	PUD_DET.CodigoClasificacion = '0014'

-- SELECT * FROM [Contabilidad].[V_ReteCree]