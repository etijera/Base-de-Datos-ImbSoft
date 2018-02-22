

SELECT * FROM [dbo].[TipoUsuarios]

--DBCC CHECKIDENT (TipoUsuarios, RESEED, 0)
--DROP TABLE [dbo].[TipoUsuarios]
CREATE TABLE [dbo].[TipoUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarcaBorrado] [varchar](1) NOT NULL CONSTRAINT [DF_TipoUsuarios_MarcaBorrado]  DEFAULT ('1'),
	[Codigo] [varchar](4) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PoderAdicionar] [bit] NOT NULL CONSTRAINT [DF_TipoUsuarios_Adicionar]  DEFAULT ((0)),
	[PoderEliminar] [bit] NOT NULL CONSTRAINT [DF_TipoUsuarios_PoderEliminar]  DEFAULT ((0)),
	[PoderEditar] [bit] NOT NULL CONSTRAINT [DF_TipoUsuarios_PoderEditar]  DEFAULT ((0)),
	[PoderImprimir] [bit] NOT NULL CONSTRAINT [DF_TipoUsuarios_PoderImprimir]  DEFAULT ((0)),
	[PoderGuardar] [bit] NOT NULL CONSTRAINT [DF_TipoUsuarios_PoderGuardar]  DEFAULT ((0)),
	[PoderExportar] [bit] NOT NULL CONSTRAINT [DF_TipoUsuarios_PoderExportar]  DEFAULT ((0)),
 CONSTRAINT [PK_TipoUsuarios] PRIMARY KEY NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id de tipo uasuario, auntoincremental.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marca de borrado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'MarcaBorrado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la fuente.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'Codigo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la fuente.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'Nombre'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el usuario puede o no Adicionar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'PoderAdicionar'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el usuario puede o no Eliminar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'PoderEliminar'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el usuario puede o no Editar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'PoderEditar'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el usuario puede o no Imprimir.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'PoderImprimir'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el usuario puede o no Guardar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'PoderGuardar'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el usuario puede o no Exportar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoUsuarios', @level2type=N'COLUMN',@level2name=N'PoderExportar'
