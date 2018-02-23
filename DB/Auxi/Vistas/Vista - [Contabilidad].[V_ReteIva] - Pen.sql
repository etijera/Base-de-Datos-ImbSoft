


--	DROP VIEW [Contabilidad].[V_ReteIva]
CREATE VIEW [Contabilidad].[V_ReteIva]
AS
SELECT	PUC.MarcaBorrado
		,PUC.Codigo as Codigo
		,PUC.Nombre as Nombre
		,PUC.MontoRetencion As Monto
		,PUC.PorcentajeRetencion As Porcentaje
		,PUC.TipoRetencion As Tipo
FROM	Contabilidad.Puc AS PUC
		INNER JOIN Contabilidad.ClasificacionPucDetalles AS PUD_DET ON PUD_DET.CodigoPuc = PUC.Codigo
WHERE	PUD_DET.CodigoClasificacion = '0003' --and (TipoRetencion <> 3 OR (select ImpuestoTer From CXP_GL_CFG) = 1)

-- SELECT * FROM [Contabilidad].[V_ReteIva]
