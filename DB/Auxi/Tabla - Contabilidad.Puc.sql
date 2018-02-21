
--CREATE SCHEMA Contabilidad;  
--GO;
DROP TABLE  [Contabilidad].[Puc]
DROP TABLE  Contabilidad.ClasificacionPuc
DROP TABLE  Contabilidad.ClasificacionPucDetalles
DROP TABLE  Contabilidad.MovimientosAsiento

CREATE TABLE [Contabilidad].[Puc](
	[MarcaBorrado] [varchar](1) NOT NULL CONSTRAINT [DF_Puc_MarcaBorrado]  DEFAULT ((1)),
	[Codigo] [varchar](12) NOT NULL CONSTRAINT [DF_Puc_Codigo] DEFAULT (''),
	[Nombre] [varchar](50) NOT NULL CONSTRAINT [DF_Puc_Nombre] DEFAULT (''),
	[Naturaleza] [varchar](1) NOT NULL CONSTRAINT [DF_Puc_Naturaleza] DEFAULT (''),
	[Inicial] [money] NOT NULL CONSTRAINT [DF_Puc_Inicial] DEFAULT ((0)),
	[Saldo] [money] NOT NULL CONSTRAINT [DF_Puc_Saldo] DEFAULT ((0)),
	[Balance] [bit] NOT NULL CONSTRAINT [DF_Puc_Balance] DEFAULT ((1)),
	[Tercero] [bit] NOT NULL CONSTRAINT [DF_Puc_Tercero] DEFAULT ((0)),
	[Ccosto] [bit] NOT NULL CONSTRAINT [DF_Puc_Ccosto] DEFAULT ((0)),
	[Cheque] [varchar](12) NOT NULL CONSTRAINT [DF_Puc_Cheque] DEFAULT (''),
	[TipoConcepto] [varchar](12) NOT NULL CONSTRAINT [DF_Puc_TipoConcepto] DEFAULT (''),
	[Gravamen] [int] NOT NULL CONSTRAINT [DF_Puc_Gravamen] DEFAULT ((0)),
	[InicialBanco] [money] NOT NULL CONSTRAINT [DF_Puc_InicialBanco] DEFAULT ((0)),
	[BancoNumero] [varchar](50) NOT NULL CONSTRAINT [DF_Puc_BancoNumero] DEFAULT (''),
	[BancoTipo] [varchar](50) NOT NULL CONSTRAINT [DF_Puc_BancoTipo] DEFAULT (''),
	[MontoCajaMenor] [money] NOT NULL CONSTRAINT [DF_Puc_MontoCajaMenor] DEFAULT ((0)),
	[Fecha] [datetime] NOT NULL CONSTRAINT [DF_Puc_Fecha] DEFAULT (''),
	[ContraPartidaCajaMenor] [varchar](20) NOT NULL CONSTRAINT [DF_Puc_ContraPartidaCajaMenor] DEFAULT (''),
	[ResponsableCajaMenor] [varchar](20) NOT NULL CONSTRAINT [DF_Puc_ResponsableCajaMenor] DEFAULT (''),
	[MontoRetencion] [money] NOT NULL CONSTRAINT [DF_Puc_MontoRetencion] DEFAULT ((0)),
	[PorcentajeRetencion] [money] NOT NULL CONSTRAINT [DF_Puc_PorcentajeRetencion] DEFAULT ((0)),
	[TipoRetencion] [int] NOT NULL CONSTRAINT [DF_Puc_TipoRetencion] DEFAULT ((0)),
	[Modalidad] [int] NOT NULL CONSTRAINT [DF_Puc_Modalidad] DEFAULT ((0)),
	[CodigoNiif] [varchar](20) NOT NULL CONSTRAINT [DF_Puc_CodigoNiif] DEFAULT (''),
 CONSTRAINT [PK_Puc] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la cuenta.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la cuenta.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Naturaleza de la cuenta.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Naturaleza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor inicial de la cuenta.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Inicial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la cuenta es de balance' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la cuenta requiere tercero' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Tercero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si la cuenta requiere cCosto' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Ccosto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica el numero de cheque de la cuenta' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Cheque'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica el monto de caja menor de la cuenta' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'MontoCajaMenor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica la contra partida caja menor de la cuenta' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'ContraPartidaCajaMenor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Responsable de la caja menor de la cuenta' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'ResponsableCajaMenor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto de la retencion, si la cuenta es una retención' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'MontoRetencion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje de la retencion, si la cuenta es una retención' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'PorcentajeRetencion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de retencion, si la cuenta es una retención' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'TipoRetencion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modalidad de la cuenta' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'Modalidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo Niif de la cuenta' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Puc', @level2type=N'COLUMN',@level2name=N'CodigoNiif'
GO


SELECT * FROM [Contabilidad].[Puc]