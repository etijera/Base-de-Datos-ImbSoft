



--	DROP VIEW [Contabilidad].[V_TarIva]
CREATE VIEW [Contabilidad].[V_TarIva]
AS
SELECT	PUC.MarcaBorrado
		,PUC.Codigo as Codigo
		,PUC.PorcentajeRetencion As Tarifa
		,PUC.Codigo as CodigoPuc
		,PUC.TipoRetencion As Tipo
		,PUC.Modalidad AS Modalidad
FROM	Contabilidad.Puc AS PUC
		INNER JOIN Contabilidad.ClasificacionPucDetalles AS PUD_DET ON PUD_DET.CodigoPuc = PUC.Codigo
WHERE	PUD_DET.CodigoClasificacion = '0004' 

-- SELECT * FROM [Contabilidad].[V_TarIva]