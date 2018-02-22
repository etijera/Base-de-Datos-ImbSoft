

--DROP TABLE [Contabilidad].[CabeceraAsientos]
CREATE TABLE [Contabilidad].[CabeceraAsientos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFuente] [varchar](6) NOT NULL,
	[Comprobante] [varchar](24) NOT NULL,
	[Valor] [money] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[Descripcion] [varchar](1000) NULL CONSTRAINT [DF_CabeceraAsientos_Descripcion]  DEFAULT (''),
	[CodTercero] [varchar](10) NOT NULL,
	[Estado] [varchar](6) NOT NULL CONSTRAINT [DF_CabeceraAsientos_Estado]  DEFAULT (''),
	[Manual] [bit] NULL CONSTRAINT [DF_CabeceraAsientos_Manual]  DEFAULT ((0)),
	[Usuario] [varchar](16) NULL CONSTRAINT [DF_CabeceraAsientos_Usuario]  DEFAULT (''),
	[FechaRegistro] [smalldatetime] NOT NULL CONSTRAINT [DF_CabeceraAsientos_FechaRegistro]  DEFAULT (getdate()),
	[Control] [smallint] NULL CONSTRAINT [DF_CabeceraAsientos_Control]  DEFAULT ((1)),
	[UsuarioSistema] [varchar](30) NULL CONSTRAINT [DF_CabeceraAsientos_UsuarioSistema]  DEFAULT (left(suser_sname(),(30))),
	[Periodo]  AS (CONVERT([char](6),[Fecha],(112))),
 CONSTRAINT [PK_CabeceraAsientos] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [Contabilidad].[CabeceraAsientos]  WITH CHECK ADD  CONSTRAINT [FK_CabeceraAsientos_Fuentes] FOREIGN KEY([CodigoFuente])
REFERENCES [Contabilidad].[Fuentes] ([Codigo])
GO
ALTER TABLE [Contabilidad].[CabeceraAsientos] CHECK CONSTRAINT [FK_CabeceraAsientos_Fuentes]
GO

ALTER TABLE [Contabilidad].[CabeceraAsientos]  WITH CHECK ADD  CONSTRAINT [FK_CabeceraAsientos_Terceros] FOREIGN KEY([CodTercero])
REFERENCES [dbo].[Terceros] ([Codigo])
GO

ALTER TABLE [Contabilidad].[CabeceraAsientos] CHECK CONSTRAINT [FK_CabeceraAsientos_Terceros]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del asiento, autoincremental.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la fuente.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'CodigoFuente'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Consecutivo del Comprobante contable.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Comprobante'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Valor'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Fecha'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Descripcion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nit Tercero del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'CodTercero'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Estado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el asiento fue Manual.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Manual'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario que realiza el asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Usuario'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FechaRegistro del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'FechaRegistro'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Este campo se utiliza para control de modificaciones.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Control'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario del sistema.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'UsuarioSistema'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Periodo en que se realiza el asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'CabeceraAsientos', @level2type=N'COLUMN',@level2name=N'Periodo'


GO



