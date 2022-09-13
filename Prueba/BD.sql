IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'PRUEBA')
BEGIN
	CREATE DATABASE PRUEBA;
END
USE [PRUEBA]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 12/09/2022 21:45:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NOT NULL,
	[Nombre1] [varchar](50) NOT NULL,
	[Nombre2] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Celular] [numeric](18, 0) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUENTA]    Script Date: 12/09/2022 21:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUENTA](
	[IdCuenta] [int] NOT NULL,
	[NumeroCuenta] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Activa] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCrea] [varchar](100) NOT NULL,
	[SaldoActual] [numeric](21, 2) NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIMIENTO]    Script Date: 12/09/2022 21:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTO](
	[IdMovimiento] [int] NOT NULL,
	[MovFecha] [datetime] NOT NULL,
	[MovOrigen] [varchar](50) NOT NULL,
	[MovValor] [numeric](21, 2) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdCuenta] [int] NOT NULL,
 CONSTRAINT [PK_MOVIMIENTO] PRIMARY KEY CLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 12/09/2022 21:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[identificador] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Numeroident] [numeric](18, 0) NOT NULL,
	[email] [varchar](100) NULL,
	[tipoidentificacion] [varchar](3) NULL,
	[Fechacreacion] [date] NULL,
	[Id_tipoid]  AS (concat([tipoidentificacion],'-',[Numeroident])),
	[Nombrecompleto]  AS (concat([Nombres],' ',[Apellidos])),
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Numeroident] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/09/2022 21:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Identificador] [numeric](18, 0) NOT NULL,
	[Usuario] [varchar](100) NULL,
	[Pass] [varchar](100) NULL,
	[Fecha_creacion] [date] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Identificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([Id], [Identificacion], [Apellido1], [Apellido2], [Nombre1], [Nombre2], [Direccion], [Celular], [Email]) VALUES (8, 1067939594, N'Pacheco', N'Zapata', N'Manuel', N'Alejandro', N'Dorado', CAST(3017709061 AS Numeric(18, 0)), N'manuealejandro95@gmail.com')
INSERT [dbo].[CLIENTE] ([Id], [Identificacion], [Apellido1], [Apellido2], [Nombre1], [Nombre2], [Direccion], [Celular], [Email]) VALUES (9, 123456789, N'Perez', N'Oviedo', N'Pepito', N'Andres ', N'Dorado', CAST(3017709061 AS Numeric(18, 0)), N'manuealejandro95@gmail.com')
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
INSERT [dbo].[CUENTA] ([IdCuenta], [NumeroCuenta], [IdCliente], [Activa], [FechaCreacion], [UsuarioCrea], [SaldoActual]) VALUES (1267892022, 1267892022, 123456789, 0, CAST(N'2022-09-12T21:36:07.073' AS DateTime), N'ADMIN', CAST(0.00 AS Numeric(21, 2)))
INSERT [dbo].[CUENTA] ([IdCuenta], [NumeroCuenta], [IdCliente], [Activa], [FechaCreacion], [UsuarioCrea], [SaldoActual]) VALUES (1295942022, 1295942022, 1067939594, 0, CAST(N'2022-09-12T21:13:28.380' AS DateTime), N'ADMIN', CAST(0.00 AS Numeric(21, 2)))
GO
/****** Object:  StoredProcedure [dbo].[CRUDPERSON]    Script Date: 12/09/2022 21:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MANUEL PACHECO>
-- Create date: <30/08/2022>
-- Description:	<CRUD TABLE PERSON>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDPERSON]
	@Id VARCHAR(20),
	@NOMBRE1 VARCHAR(100),
	@NOMBRE2 VARCHAR(100),
	@APELLIDO1 VARCHAR(100),
	@APELLIDO2 VARCHAR(100),
	@DIRECCION VARCHAR(100),
	@CIUDAD VARCHAR(100),
	@CELULAR VARCHAR(20),
	@CORREO VARCHAR(100),
	@NUMCUENTA VARCHAR(20),
	@USUARIO VARCHAR(50),
	@ACCION VARCHAR(20)
AS
BEGIN
	IF(@ACCION = 'INSERT')
		BEGIN
			INSERT INTO CLIENTE(Identificacion,Apellido1,Apellido2,Nombre1,Nombre2,Direccion,Celular,Email) VALUES(@Id,@APELLIDO1,@APELLIDO2,@NOMBRE1,@NOMBRE2,@DIRECCION,@CELULAR,@CORREO);
			INSERT INTO CUENTA VALUES(@NUMCUENTA,@NUMCUENTA,@Id,0,GETDATE(),@USUARIO,0)
		END
	--ELSE IF(@ACCION = 'SEARCH')
	--	BEGIN
	--		
	--	END
	--ELSE IF(@ACCION = 'SEARCHID')
	--	BEGIN
	--		
	--	END
	--ELSE IF(@ACCION = 'UPDATE')
	--	BEGIN
	--		
	--	END
	--ELSE IF(@ACCION = 'DELETE')
	--	BEGIN

	--	END
	--ELSE
		BEGIN
			SELECT TOP(10) *
			FROM CLIENTE C INNER JOIN CUENTA Cu ON C.Identificacion = Cu.IdCliente;
		END
END
GO
