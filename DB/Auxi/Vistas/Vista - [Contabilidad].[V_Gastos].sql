

--	DROP VIEW [Contabilidad].[V_Gastos]
CREATE VIEW [Contabilidad].[V_Gastos]
AS
SELECT	PUC.MarcaBorrado
		,PUC.Codigo As Codigo
		,PUC.Nombre As GNom
		,PUC.Ccosto As CCostos
		,PUC.Tercero As Tercero
		,PUC.TipoConCepto
FROM	Contabilidad.Puc AS PUC
		INNER JOIN Contabilidad.ClasificacionPucDetalles AS PUD_DET ON PUD_DET.CodigoPuc = PUC.Codigo
WHERE	PUD_DET.CodigoClasificacion = '0007'

-- SELECT * FROM [Contabilidad].[V_Gastos]