

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PA_UsuarioPermisos]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[PA_UsuarioPermisos]
GO

CREATE PROCEDURE [dbo].[PA_UsuarioPermisos]
	@Usuario		VARCHAR (50) = NULL	
AS

-- =====================================================================================================
-- Nombre:			[dbo].[PA_UsuarioPermisos]
-- =====================================================================================================
-- Tipo:			Procedimiento Almacenado.
-- Creación:		06-02-2018
-- Desarrollador:  	Erick Tijera(etijera)
-- Proposito:		Procedimiento almacenado para gestionar los permisos de los usuarios
-- =====================================================================================================
-- Parámetros:						
--		@Usuario	= Usuario del sistema.	
-- =====================================================================================================		
-- Salidas:			N/A
-- =====================================================================================================
-- Modificaciones: 

-- =====================================================================================================
-- Pruebas y Ejemplos
-- EXEC [dbo].[PA_UsuarioPermisos]  @Usuario = 'ADMIN'
-- =====================================================================================================


BEGIN
	SELECT	CAST (ISNULL(TU.PoderAdicionar,1) AS BIT)	AS Adicionar
			,CAST (ISNULL(TU.PoderEditar,1)  AS BIT)	AS Editar
			,CAST (ISNULL(TU.PoderEliminar,1) AS BIT)	AS Eliminar
			,CAST (ISNULL(TU.PoderImprimir,1) AS BIT)	AS Imprimir
			,CAST (ISNULL(TU.PoderGuardar,1) AS BIT)	AS Guardar
			,CAST (ISNULL(TU.PoderExportar,1) AS BIT)	AS Exportar
	FROM	dbo.Usuarios AS U
			LEFT JOIN dbo.TipoUsuarios AS TU ON U.CodTipoUsuario = TU.Codigo
	WHERE	U.Codigo = @Usuario --OR U.Codigo = @Usuario
END

