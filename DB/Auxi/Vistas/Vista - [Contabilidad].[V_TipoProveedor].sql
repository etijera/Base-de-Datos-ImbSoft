


--	DROP VIEW [Contabilidad].[V_TipoProveedor]
CREATE VIEW [Contabilidad].[V_TipoProveedor]
AS
SELECT	PUC.MarcaBorrado
		,PUC.Codigo as Codigo
		,PUC.Nombre As Nombre
FROM	Contabilidad.Puc AS PUC
		INNER JOIN Contabilidad.ClasificacionPucDetalles AS PUD_DET ON PUD_DET.CodigoPuc = PUC.Codigo
WHERE	PUD_DET.CodigoClasificacion = '0009' 

-- SELECT * FROM [Contabilidad].[V_TipoProveedor]