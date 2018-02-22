
CREATE TABLE [Contabilidad].[ClasificacionPuc](
	[MarcaBorrado] [varchar](1) NOT NULL CONSTRAINT [DF_ClasificacionPuc_MarcaBorrado]  DEFAULT ((1)),
	[Codigo] [varchar](4) NOT NULL CONSTRAINT [DF_ClasificacionPuc_Codigo] DEFAULT (''),
	[Descripcion] [varchar](100) NULL CONSTRAINT [DF_ClasificacionPuc_Descripcion] DEFAULT (''),
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la clasificación.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'ClasificacionPuc', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de la clasificación.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'ClasificacionPuc', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO

