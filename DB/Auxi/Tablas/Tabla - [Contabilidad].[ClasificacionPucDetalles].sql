
CREATE TABLE [Contabilidad].[ClasificacionPucDetalles](
	[CodigoClasificacion] [varchar](4) NOT NULL CONSTRAINT [DF_ClasificacionPucDetalles_CodigoClasificacion] DEFAULT (''),
	[CodigoPuc] [varchar](12) NOT NULL CONSTRAINT [DF_ClasificacionPucDetalles_CodigoPuc] DEFAULT ('')
PRIMARY KEY CLUSTERED 
(
	[CodigoClasificacion],[CodigoPuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [Contabilidad].[ClasificacionPucDetalles]  WITH CHECK ADD  CONSTRAINT [FK_ClasificacionPucDetalles_ClasificacionPuc] FOREIGN KEY([CodigoClasificacion])
REFERENCES [Contabilidad].[ClasificacionPuc] ([Codigo])
GO
ALTER TABLE [Contabilidad].[ClasificacionPucDetalles] CHECK CONSTRAINT [FK_ClasificacionPucDetalles_ClasificacionPuc]
GO

ALTER TABLE [Contabilidad].[ClasificacionPucDetalles]  WITH CHECK ADD  CONSTRAINT [FK_ClasificacionPucDetalles_Puc] FOREIGN KEY([CodigoPuc])
REFERENCES [Contabilidad].[Puc] ([Codigo])
GO
ALTER TABLE [Contabilidad].[ClasificacionPucDetalles] CHECK CONSTRAINT [FK_ClasificacionPucDetalles_Puc]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la clasificación Puc.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'ClasificacionPucDetalles', @level2type=N'COLUMN',@level2name=N'CodigoClasificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la cuenta Puc.' , @level0type=N'SCHEMA',@level0name=N'Contabilidad', @level1type=N'TABLE',@level1name=N'ClasificacionPucDetalles', @level2type=N'COLUMN',@level2name=N'CodigoPuc'
GO

