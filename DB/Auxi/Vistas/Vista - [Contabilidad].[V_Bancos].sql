


--IF NOT  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[V_Bancos]') AND type in (N'V '))
--BEGIN	
--	DROP VIEW [Contabilidad].[V_Bancos]
	CREATE VIEW [Contabilidad].[V_Bancos]
	AS
	SELECT	PUC.MarcaBorrado
			,PUC.Codigo As Codigo
			,PUC.Nombre As Nombre
			,PUC.Saldo As Saldo
			,PUC.Cheque As Cheque
			,PUC.Gravamen As Gravamen
			,PUC.Fecha As Fecha
			,PUC.InicialBanco As Inicial
			--,'' As banrep1
			--,'' As banrep2
			--,glPlano As banpla
			,PUC.BancoNumero As Numero
			,PUC.BancoTipo As Tipo
			,PUC.TipoConCepto AS TipoConcepto
	FROM	Contabilidad.Puc AS PUC 
			INNER JOIN Contabilidad.ClasificacionPucDetalles AS PUD_DET ON PUD_DET.CodigoPuc = PUC.Codigo
	WHERE	PUD_DET.CodigoClasificacion = '0005'
--END

-- select * from [Contabilidad].[V_Bancos]