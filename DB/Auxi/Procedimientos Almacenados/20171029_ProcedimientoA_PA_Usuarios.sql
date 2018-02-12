
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PA_Usuarios]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[PA_Usuarios]
GO


	CREATE PROCEDURE [dbo].[PA_Usuarios] 
		@Operacion				VARCHAR(20)		= NULL
		,@Id					INT				= NULL
		,@Codigo				VARCHAR(8)		= NULL	
		,@Nombre				VARCHAR(50)		= NULL	
		,@Usuario				VARCHAR(20)		= NULL		
		,@Clave					VARCHAR(50)		= NULL			
		,@CodTipoUsuario		VARCHAR(4)		= NULL	
	AS

	/*
	============================================================================================================================
	Nombre:			[dbo].[PA_Usuarios]
	============================================================================================================================
	Tipo:			Procedimiento Almacenado
	Creación:		29-09-2017
	Desarrollador:  Erick Tijera
	Proposito:		Procedimiento almacenado para gestión los usuarios.
	Parámetros:						
					@Operacion				VARCHAR(20)		= Recibe la operacion a realizar
					,@Id					INT				= Id del usuario
					,@Codigo				VARCHAR(8)		= Código del usuario	
					,@Nombre				VARCHAR(50)		= Nombre del usuario (No debe contener espacios)		
					,@Contrasenia			VARCHAR(50)		= Contraseña del usuario	
	============================================================================================================================
	Salidas:	    N/A
	============================================================================================================================
	Modificaciones:
		
	============================================================================================================================
	Pruebas y Ejemplos:	
		EXEC [dbo].[PA_Usuarios] @Operacion = 'SELECTALL'
		
		EXEC [dbo].[PA_Usuarios] @Operacion = 'INSERTBASICO', @Nombre = 'ADMIN',@Usuario = 'ADMIN',@Clave = 'ADMIN', @CodTipoUsuario	= '0001'
	==========================================================================================================================================
*/


	BEGIN
		
		DECLARE @CodUsuario VARCHAR(8)		
		SET		@CodUsuario = 'USU00000'
		
		IF @Operacion = 'SELECTID'
		BEGIN
			SELECT	US.Id					
					,US.Codigo
					,US.Nombre
					,US.Clave 
			FROM	Usuarios AS US WITH(nolock) 					
			WHERE	US.Id = @Id 			
		END

		IF @Operacion = 'SELECTALL'
		BEGIN
			SELECT	US.Id					
					,US.Codigo
					,US.Nombre
					,US.Clave 
			FROM	Usuarios AS US WITH(nolock) 					
			WHERE	US.MarcaBorrado = '1'
		END

		IF @Operacion = 'SELECTNAME'
		BEGIN
			SELECT	US.Id										
					,US.Codigo
					,US.Nombre
					,US.Clave 
			FROM	Usuarios AS US WITH(nolock) 
			WHERE	US.MarcaBorrado = '1' 
					AND US.Nombre = @Nombre
		END
		
		IF @Operacion = 'INSERTBASICO'
		BEGIN
			SELECT @CodUsuario = 'USU'+LTRIM(RTRIM([Funciones].[PADL](ISNULL(Max(Id),0)+1,5,'0'))) FROM Usuarios

			INSERT INTO Usuarios	(Codigo
									,Nombre
									,Usuario
									,Clave
									,CodTipoUsuario)
			VALUES					(@CodUsuario
									,@Nombre
									,@Usuario
									,@Clave
									,@CodTipoUsuario)
			
			SELECT @Id = @@IDENTITY

			SELECT @Id AS IdUsuario, @CodUsuario AS CodUsuario
		END
		
		IF @Operacion = 'UPDATE'
		BEGIN			

			UPDATE	Usuarios 
			SET		Clave			= @Clave
					,CodTipoUsuario = @CodTipoUsuario
					, Nombre		= @Nombre
			WHERE	Id = @Id

		END

		IF @Operacion = 'DEL'
		BEGIN	

			DELETE FROM Usuarios WHERE	Id = @Id
					
		END

	END

