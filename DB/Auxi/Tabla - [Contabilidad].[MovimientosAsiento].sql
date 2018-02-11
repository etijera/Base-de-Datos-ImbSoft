--aqui
----cMovimientos
--DROP TABLE [Contabilidad].[MovimientosAsiento]
--ALTER TABLE [Contabilidad].[MovimientosAsiento] DROP CONSTRAINT FK_CabeceraAsientos_Terceros

CREATE TABLE [Contabilidad].[MovimientosAsiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Asiento] [int] NOT NULL,
	[Cuenta] [varchar](12) NOT NULL,
	[Documento] [varchar](20) NOT NULL,
	[Descripcion] [varchar](1000) NULL CONSTRAINT [DF_MovimientosAsiento_Descripcion]  DEFAULT (''),
	[ValorDebe] [money] NOT NULL,
	[ValorHaber] [money] NOT NULL,
	[CodTercero] [varchar](10) NULL CONSTRAINT [DF_MovimientosAsiento_CodTercero]  DEFAULT (''),
	[DocAlternativo] [varchar](12) NULL CONSTRAINT [DF_MovimientosAsiento_DocAlternativo]  DEFAULT (''),
	[CodCentroCosto] [varchar](4) NULL CONSTRAINT [DF_MovimientosAsiento_CodCentroCosto]  DEFAULT (''),
	[BaseRetencion] [money] NULL CONSTRAINT [DF_MovimientosAsiento_BaseRetencion]  DEFAULT (0),
	[Usuario] [varchar](16) NULL CONSTRAINT [DF_MovimientosAsiento_Usuario]  DEFAULT (''),
	[FechaRegistro] [smalldatetime] NOT NULL CONSTRAINT [DF_MovimientosAsiento_FechaRegistro]  DEFAULT (getdate()),
	[Control] [smallint] NULL CONSTRAINT [DF_MovimientosAsiento_Control]  DEFAULT ((1)),
	[UsuarioSistema] [varchar](30) NULL CONSTRAINT [DF_MovimientosAsiento_UsuarioSistema]  DEFAULT (left(suser_sname(),(30))),
 CONSTRAINT [PK_MovimientosAsiento] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [Contabilidad].[MovimientosAsiento]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosAsiento_CabeceraAsientos] FOREIGN KEY([Asiento])
REFERENCES [Contabilidad].[CabeceraAsientos] ([Id])
GO
ALTER TABLE [Contabilidad].[MovimientosAsiento] CHECK CONSTRAINT [FK_MovimientosAsiento_CabeceraAsientos]
GO

ALTER TABLE [Contabilidad].[MovimientosAsiento]   WITH CHECK ADD  CONSTRAINT [FK_MovimientosAsiento_Terceros] FOREIGN KEY([CodTercero])
REFERENCES [dbo].[Terceros] ([Codigo])
GO
ALTER TABLE [Contabilidad].[MovimientosAsiento]  CHECK CONSTRAINT [FK_MovimientosAsiento_Terceros]
GO

ALTER TABLE [Contabilidad].[MovimientosAsiento]   WITH CHECK ADD  CONSTRAINT [FK_MovimientosAsiento_Puc] FOREIGN KEY([Cuenta])
REFERENCES [Contabilidad].[Puc] ([Codigo])
GO
ALTER TABLE [Contabilidad].[MovimientosAsiento]  CHECK CONSTRAINT [FK_MovimientosAsiento_Puc]
GO

ALTER TABLE [Contabilidad].[MovimientosAsiento]   WITH CHECK ADD  CONSTRAINT [FK_MovimientosAsiento_CentroCostos] FOREIGN KEY([CodCentroCosto])
REFERENCES [Contabilidad].[CentroCostos] ([Codigo])
GO
ALTER TABLE [Contabilidad].[MovimientosAsiento]  CHECK CONSTRAINT [FK_MovimientosAsiento_CentroCostos]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del movimiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'Asiento'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cuenta contable.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'Cuenta'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Documento del movimiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'Documento'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del movimiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'Descripcion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor débito.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'ValorDebe'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor crédito.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'ValorHaber'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del tercero del movimiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'CodTercero'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del Centro de Costo.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'CodCentroCosto'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Consecutivo de documento alternativo, OT, CT Etc.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'DocAlternativo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Base de Retención.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'BaseRetencion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario que realiza el asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'Usuario'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FechaRegistro del asiento.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'FechaRegistro'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Este campo se utiliza para control de modificaciones.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'Control'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario del sistema.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'MovimientosAsiento', @level2type=N'COLUMN',@level2name=N'UsuarioSistema'


GO
