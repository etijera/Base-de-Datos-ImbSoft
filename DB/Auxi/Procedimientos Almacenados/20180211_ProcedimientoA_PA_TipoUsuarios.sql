
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PA_TipoUsuarios]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[PA_TipoUsuarios]
GO


	CREATE PROCEDURE [dbo].[PA_TipoUsuarios] 
		@Operacion				VARCHAR(20)		= NULL
		,@Id					INT				= NULL
		,@Codigo				VARCHAR(4)		= NULL	
		,@Nombre				VARCHAR(50)		= NULL	
		,@PoderAdicionar		BIT				= NULL	
		,@PoderEliminar			BIT				= NULL	
		,@PoderEditar			BIT				= NULL	
		,@PoderImprimir			BIT				= NULL	
		,@PoderGuardar			BIT				= NULL
		,@PoderExportar			BIT				= NULL		
	AS

	/*
	============================================================================================================================
	Nombre:			[dbo].[PA_TipoUsuarios]
	============================================================================================================================
	Tipo:			Procedimiento Almacenado
	Creación:		11-02-2018
	Desarrollador:  Erick Tijera
	Proposito:		Procedimiento almacenado para gestión los tipo de usuarios.
	Parámetros:						
					@Operacion				VARCHAR(20)		= Recibe la operacion a realizar
					,@Id					INT				= Id del tipo usuario
					,@Codigo				VARCHAR(8)		= Código del tipo usuario	
					,@Nombre				VARCHAR(50)		= Nombre del tipo usuario (No debe contener espacios)		
					,@PoderAdicionar		BIT				= Parametro bit 
					,@PoderEliminar			BIT				= Parametro bit 
					,@PoderEditar			BIT				= Parametro bit 
					,@PoderImprimir			BIT				= Parametro bit 
					,@PoderGuardar			BIT				= Parametro bit 
					,@PoderExportar			BIT				= Parametro bit 		
	============================================================================================================================
	Salidas:	    N/A
	============================================================================================================================
	Modificaciones:
		
	============================================================================================================================
	Pruebas y Ejemplos:	
		EXEC [dbo].[PA_TipoUsuarios] @Operacion = 'SELECTALL'
		
		EXEC [dbo].[PA_TipoUsuarios] @Operacion = 'INSERTBASICO'
		 @Codigo				= 'TU01'
		,@Nombre				= 'SUPERUSUARIO'
		,@PoderAdicionar		= 0		
		,@PoderEliminar			= 0		
		,@PoderEditar			= 0		
		,@PoderImprimir			= 0		
		,@PoderGuardar			= 0		
		,@PoderExportar			= 0		

	==========================================================================================================================================
*/


	BEGIN
		
		DECLARE @CodTipoUsuario VARCHAR(4)		
		SET		@CodTipoUsuario = '' --TU01
		
		IF @Operacion = 'SELECTID'
		BEGIN
			SELECT	TU.Id					
					,TU.Codigo
					,TU.Nombre
					,TU.PoderAdicionar
					,TU.PoderEliminar
					,TU.PoderEditar
					,TU.PoderImprimir
					,TU.PoderGuardar
					,TU.PoderExportar
			FROM	TipoUsuarios AS TU WITH(nolock) 					
			WHERE	TU.Id = @Id 			
		END

		IF @Operacion = 'SELECTALL'
		BEGIN
			SELECT	TU.Id					
					,TU.Codigo
					,TU.Nombre
					,TU.PoderAdicionar
					,TU.PoderEliminar
					,TU.PoderEditar
					,TU.PoderImprimir
					,TU.PoderGuardar
					,TU.PoderExportar
			FROM	TipoUsuarios AS TU WITH(nolock) 					
			WHERE	TU.MarcaBorrado = '1'
		END

		IF @Operacion = 'SELECTNAME'
		BEGIN
			SELECT	TU.Id					
					,TU.Codigo
					,TU.Nombre
					,TU.PoderAdicionar
					,TU.PoderEliminar
					,TU.PoderEditar
					,TU.PoderImprimir
					,TU.PoderGuardar
					,TU.PoderExportar
			FROM	TipoUsuarios AS TU WITH(nolock) 
			WHERE	TU.MarcaBorrado = '1' 
					AND TU.Nombre = @Nombre
		END
		
		IF @Operacion = 'INSERTBASICO'
		BEGIN
			SELECT @CodTipoUsuario = 'TU'+LTRIM(RTRIM([Funciones].[PADL](ISNULL(Max(Id),0)+1,2,'0'))) FROM TipoUsuarios

			INSERT INTO TipoUsuarios	(Codigo
										,Nombre
										,PoderAdicionar
										,PoderEditar
										,PoderEliminar
										,PoderExportar
										,PoderGuardar
										,PoderImprimir)
			VALUES						(@CodTipoUsuario
										,@Nombre
										,@PoderAdicionar
										,@PoderEditar
										,@PoderEliminar
										,@PoderExportar
										,@PoderGuardar
										,@PoderImprimir)--por aqui
			
			SELECT @Id = @@IDENTITY

			SELECT @Id AS Id, @CodTipoUsuario AS CodTipoUsuario
		END
		
		IF @Operacion = 'UPDATE'
		BEGIN			

			UPDATE	TU  
			SET		PoderAdicionar	= @PoderAdicionar	
					,PoderEditar	= @PoderEditar
					,PoderEliminar	= @PoderEliminar
					,PoderExportar	= @PoderExportar
					,PoderGuardar	= @PoderGuardar
					,PoderImprimir 	= @PoderImprimir 
			FROM	TipoUsuarios AS TU
			WHERE	Id = @Id

		END

		IF @Operacion = 'DEL'
		BEGIN	

			DELETE FROM TipoUsuarios WHERE	Id = @Id
					
		END

	END

