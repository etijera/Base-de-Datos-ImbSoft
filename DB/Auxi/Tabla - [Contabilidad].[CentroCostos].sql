

CREATE TABLE [Contabilidad].[CentroCostos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarcaBorrado] [varchar](1) NOT NULL CONSTRAINT [DF_CentroCostos_MarcaBorrado]  DEFAULT ('1'),
	[Codigo] [varchar](4) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CentroCostos] PRIMARY KEY NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del Centro de Costo.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CentroCostos', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marca de borrado.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CentroCostos', @level2type=N'COLUMN',@level2name=N'MarcaBorrado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del centrp de costo.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CentroCostos', @level2type=N'COLUMN',@level2name=N'Codigo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del centro de costo.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CentroCostos', @level2type=N'COLUMN',@level2name=N'Nombre'
