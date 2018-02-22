

--	DROP VIEW [Contabilidad].[V_Cajamenor]
CREATE VIEW [Contabilidad].[V_Cajamenor]
AS
SELECT	PUC.MarcaBorrado
		,PUC.Codigo As Codigo
		,PUC.Nombre As Nombre
		,PUC.Codigo As CodigoPuc
		,PUC.MontoCajaMenor As Monto
		,PUC.ContraPartidaCajaMenor As ContraPartida
		,PUC.ResponsableCajaMenor As Responsable
		,PUC.TipoConCepto AS TipoConcepto
FROM	Contabilidad.Puc AS PUC
		INNER JOIN Contabilidad.ClasificacionPucDetalles AS PUD_DET ON PUD_DET.CodigoPuc = PUC.Codigo
WHERE	PUD_DET.CodigoClasificacion = '0006'

--SELECT * FROM [Contabilidad].[V_Cajamenor]


