

SELECT * FROM Contabilidad.ClasificacionPuc
SELECT * FROM Contabilidad.ClasificacionPucDetalles
SELECT * FROM Contabilidad.Puc

IF NOT  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contabilidad].[V_Bancos]') AND type in (N'V '))
BEGIN	
	CREATE VIEW [Contabilidad].[V_Bancos]
	AS
	SELECT	MarcaBorrado
			,Codigo As bancod
			,Nombre As bannom
			,Saldo As bansal
			,Cheque As banch
			--,glgravamen As bangr
			,fe As banfec
			,glIniBanco As banini
			,'' As banrep1
			,'' As banrep2
			,glPlano As banpla
			,glBanNro As BanNro
			,glBanTip As BanTip
			,TipoConCepto
	FROM	Contabilidad.Puc AS PUC 
			INNER JOIN Puc_Clasificacion_Det ON Puc_Clasificacion_Det.Det_Puc = AccglPuc.glCod
	WHERE	Puc_Clasificacion_Det.Det_Codigo = '0005'
END