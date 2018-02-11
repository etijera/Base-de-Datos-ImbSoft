
SELECT * FROM [dbo].[Usuarios]
SELECT * FROM [dbo].TipoUsuarios
SELECT * FROM Usuarios WHERE MarcaBorrado = '1'

-- Insertar Tipo de usuario SUPERUSUARIO
--INSERT INTO TipoUsuarios (Codigo,Nombre,PoderAdicionar,PoderEditar,PoderEliminar,PoderExportar,PoderGuardar,PoderImprimir) VALUES ('0001','SUPERUSUARIO',1,1,1,1,1,1)

-- Insertar Usruario ADMINISTRADOR
--INSERT INTO Usuarios (Codigo,Nombre,Usuario,Clave,CodTipoUsuario) VALUES 

--EXEC [dbo].[PA_Usuarios] @Operacion = 'INSERTBASICO', @Nombre = 'ADMINISTRADOR',@Usuario = 'ADMIN',@Clave = 'ADMIN', @CodTipoUsuario = '0001'


--DROP TABLE [dbo].[Usuarios]

CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarcaBorrado] [varchar](1) NOT NULL CONSTRAINT [DF_Usuarios_delmrk]  DEFAULT ((1)),
	[Codigo] [varchar](8) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[CodTipoUsuario] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_TipoUsuarios] FOREIGN KEY([CodTipoUsuario])
REFERENCES [dbo].[TipoUsuarios] ([Codigo])
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_TipoUsuarios]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id de uasuario, auntoincremental.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marca si el registro esta o no esta borrado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios', @level2type=N'COLUMN',@level2name=N'MarcaBorrado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del usuario, llave principal.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios', @level2type=N'COLUMN',@level2name=N'Codigo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la persona usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios', @level2type=N'COLUMN',@level2name=N'Nombre'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de usuario;  no contiene espacio.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios', @level2type=N'COLUMN',@level2name=N'Usuario'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contraseña del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios', @level2type=N'COLUMN',@level2name=N'Clave'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del tipo de usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios', @level2type=N'COLUMN',@level2name=N'CodTipoUsuario'



