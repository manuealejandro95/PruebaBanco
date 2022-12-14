USE [PRUEBA]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 16/09/2022 8:27:48 ******/
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
	[Ciudad] [varchar](50) NOT NULL,
	[Celular] [numeric](18, 0) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUENTA]    Script Date: 16/09/2022 8:27:48 ******/
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
/****** Object:  Table [dbo].[MOVIMIENTO]    Script Date: 16/09/2022 8:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTO](
	[IdMovimiento] [int] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([Id], [Identificacion], [Apellido1], [Apellido2], [Nombre1], [Nombre2], [Direccion], [Ciudad], [Celular], [Email]) VALUES (8, 1067939594, N'Pacheco', N'Zapata', N'Manuel', N'Alejandro', N'Dorado', N'Montería', CAST(3017709061 AS Numeric(18, 0)), N'manuealejandro95@gmail.com')
INSERT [dbo].[CLIENTE] ([Id], [Identificacion], [Apellido1], [Apellido2], [Nombre1], [Nombre2], [Direccion], [Ciudad], [Celular], [Email]) VALUES (12, 95042210, N'Perez', N'Oviedo', N'Anastacio', N'Andres ', N'Montería', N'Montería', CAST(3017709061 AS Numeric(18, 0)), N'manuelalejandro1995@gmail.com')
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
INSERT [dbo].[CUENTA] ([IdCuenta], [NumeroCuenta], [IdCliente], [Activa], [FechaCreacion], [UsuarioCrea], [SaldoActual]) VALUES (1295942022, 1295942022, 1067939594, 0, CAST(N'2022-09-12T21:13:28.380' AS DateTime), N'ADMIN', CAST(1500000.00 AS Numeric(21, 2)))
INSERT [dbo].[CUENTA] ([IdCuenta], [NumeroCuenta], [IdCliente], [Activa], [FechaCreacion], [UsuarioCrea], [SaldoActual]) VALUES (1422102022, 1422102022, 95042210, 0, CAST(N'2022-09-14T16:30:25.867' AS DateTime), N'ADMIN', CAST(6900000.00 AS Numeric(21, 2)))
GO
SET IDENTITY_INSERT [dbo].[MOVIMIENTO] ON 

INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (1, CAST(N'2022-09-15T17:29:47.977' AS DateTime), N'Consignacion', CAST(2000000.00 AS Numeric(21, 2)), 1067939594, 1295942022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (2, CAST(N'2022-09-15T18:11:45.623' AS DateTime), N'Consignacion', CAST(-2000000.00 AS Numeric(21, 2)), 1067939594, 1295942022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (3, CAST(N'2022-09-15T20:30:01.640' AS DateTime), N'CONSIGNACION', CAST(700000.00 AS Numeric(21, 2)), 95042210, 1422102022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (4, CAST(N'2022-09-15T20:34:22.473' AS DateTime), N'Consignacion', CAST(700000.00 AS Numeric(21, 2)), 95042210, 1422102022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (5, CAST(N'2022-09-15T20:35:31.487' AS DateTime), N'Consignacion', CAST(700000.00 AS Numeric(21, 2)), 95042210, 1422102022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (6, CAST(N'2022-09-15T20:36:23.217' AS DateTime), N'Consignacion', CAST(1500000.00 AS Numeric(21, 2)), 95042210, 1422102022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (7, CAST(N'2022-09-15T20:38:05.620' AS DateTime), N'Consignacion', CAST(1500000.00 AS Numeric(21, 2)), 95042210, 1422102022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (8, CAST(N'2022-09-15T20:48:07.910' AS DateTime), N'Retiro', CAST(1800000.00 AS Numeric(21, 2)), 95042210, 1422102022)
INSERT [dbo].[MOVIMIENTO] ([IdMovimiento], [MovFecha], [MovOrigen], [MovValor], [IdCliente], [IdCuenta]) VALUES (9, CAST(N'2022-09-16T08:14:15.957' AS DateTime), N'Consignacion', CAST(1500000.00 AS Numeric(21, 2)), 1067939594, 1295942022)
SET IDENTITY_INSERT [dbo].[MOVIMIENTO] OFF
GO
/****** Object:  StoredProcedure [dbo].[CRUDMVTOS]    Script Date: 16/09/2022 8:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUDMVTOS]
	@Id VARCHAR(20),
	@MOVORIGEN VARCHAR(100),
	@MOVVALOR VARCHAR(100),
	@IDCUENTA VARCHAR(100),
	@ACCION VARCHAR(20)
AS
BEGIN
	IF(@ACCION = 'CONSIGNAR' OR @ACCION = 'RETIRAR')
		BEGIN
			INSERT INTO MOVIMIENTO(MovFecha,MovOrigen,MovValor,IdCliente,IdCuenta) VALUES(GETDATE(), @MOVORIGEN,@MOVVALOR,@Id,@IDCUENTA);

			UPDATE CUENTA SET SaldoActual =(SELECT SUM(MovValor) 
			FROM MOVIMIENTO
			WHERE IdCliente=@Id)
			WHERE IdCliente=@Id;
		END
	ELSE
	IF(@ACCION = 'SEARCHID')
		BEGIN
			SELECT TOP(10) CONCAT(C.Nombre1,' ',C.Nombre2,' ',C.Apellido1,' ',C.Apellido2) AS Nombre, C.Identificacion, Cu.NumeroCuenta, M.IdMovimiento, FORMAT(M.MovFecha,'dd/MM/yyyy') AS FECHA,M.MovOrigen,M.MovValor
			FROM CLIENTE C INNER JOIN CUENTA Cu ON C.Identificacion = Cu.IdCliente INNER JOIN MOVIMIENTO M ON C.Identificacion=M.IdCliente
			WHERE C.Identificacion=@Id;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDPERSON]    Script Date: 16/09/2022 8:27:48 ******/
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
			INSERT INTO CLIENTE(Identificacion,Apellido1,Apellido2,Nombre1,Nombre2,Direccion,Ciudad,Celular,Email) VALUES(@Id,@APELLIDO1,@APELLIDO2,@NOMBRE1,@NOMBRE2,@DIRECCION,@CIUDAD,@CELULAR,@CORREO);
			INSERT INTO CUENTA VALUES(@NUMCUENTA,@NUMCUENTA,@Id,0,GETDATE(),@USUARIO,0)
		END
	ELSE IF(@ACCION = 'SEARCH')
		BEGIN
			SELECT C.Identificacion,C.Apellido1,C.Apellido2,C.Nombre1,C.Nombre2,C.Direccion,C.Ciudad,C.Celular,C.Email,Cu.NumeroCuenta,Cu.UsuarioCrea,Cu.SaldoActual,FORMAT(Cu.FechaCreacion,'dd/MM/yyyy') AS FechaCreacion
			FROM CLIENTE C INNER JOIN CUENTA Cu ON C.Identificacion = Cu.IdCliente
			WHERE C.Identificacion LIKE ''+ @Id + '%'
			ORDER BY C.Id;
		END
	ELSE IF(@ACCION = 'SEARCHID')
		BEGIN
			SELECT C.Identificacion,C.Apellido1,C.Apellido2,C.Nombre1,C.Nombre2,C.Direccion,C.Ciudad,C.Celular,C.Email,Cu.Activa
			FROM CLIENTE C INNER JOIN CUENTA Cu ON C.Identificacion = Cu.IdCliente
			WHERE C.Identificacion=@Id;
		END
	ELSE IF(@ACCION = 'UPDATE')
		BEGIN
			UPDATE CLIENTE SET Identificacion = @Id, Apellido1 = @APELLIDO1, Apellido2=@APELLIDO2, Nombre1=@NOMBRE1, Nombre2=@NOMBRE2,Direccion=@DIRECCION,Ciudad =@CIUDAD, Celular=@CELULAR, Email=@CORREO
			WHERE Identificacion=@Id;
		END
	ELSE IF(@ACCION = 'DELETE')
		BEGIN
			DELETE
			FROM CLIENTE
			WHERE Identificacion=@Id;

			DELETE
			FROM CUENTA
			WHERE IdCliente = @Id;

			DELETE
			FROM MOVIMIENTO
			WHERE IdCliente = @Id
		END
	ELSE
		BEGIN
			SELECT TOP(10) C.Identificacion,C.Apellido1,C.Apellido2,C.Nombre1,C.Nombre2,C.Direccion,C.Ciudad,C.Celular,C.Email,Cu.NumeroCuenta,Cu.UsuarioCrea,Cu.SaldoActual,FORMAT(Cu.FechaCreacion,'dd/MM/yyyy') AS FechaCreacion
			FROM CLIENTE C INNER JOIN CUENTA Cu ON C.Identificacion = Cu.IdCliente;
		END
END
GO
