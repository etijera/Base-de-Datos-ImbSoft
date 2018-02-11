
--DROP TABLE [Contabilidad].[Fuentes]
CREATE TABLE [Contabilidad].[Fuentes](
	[MarcaBorrado] [varchar](1) NOT NULL CONSTRAINT [DF_Fuentes_MarcaBorrado]  DEFAULT ('1'),
	[Codigo] [varchar](6) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Prefijo] [varchar](6) NULL CONSTRAINT [DF_Fuentes_Prefijo]  DEFAULT (''),
	[ExigeNit] [bit] NOT NULL CONSTRAINT [DF_Fuentes_ExigeNit]  DEFAULT ((0)),
	[Observacion] [varchar](500) NULL CONSTRAINT [DF_Fuentes_Observacion]  DEFAULT (''),
	[Leyenda] [varchar](250) NULL CONSTRAINT [DF_Fuentes_Leyenda]  DEFAULT (''),
	[Numeracion] [int] NULL CONSTRAINT [DF_Fuentes_Numero]  DEFAULT ((0)),
	[Mascara] [varchar](10) NULL CONSTRAINT [DF_Fuentes_Mascara]  DEFAULT (''),
	[RutaRep] [varchar](250) NULL CONSTRAINT [DF_Fuentes_RutaRep]  DEFAULT (''),
	[TipoMov] [varchar](2) NOT NULL CONSTRAINT [DF_Fuentes_TipoMov]  DEFAULT ('C'),
 CONSTRAINT [PK_Fuentes] PRIMARY KEY NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marca de borrado.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'MarcaBorrado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'Codigo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'Nombre'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prerfijo de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'Prefijo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si se exije NIT ó no.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'ExigeNit'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Observaciones de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'Observacion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Leyenda de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'Leyenda'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Describe la numeración en que va la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'Numeracion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mascara de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'Mascara'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta del reporte de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'RutaRep'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica la naturaleza de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'Fuentes', @level2type=N'COLUMN',@level2name=N'TipoMov'



