USE [master]
GO
/****** Base de datos de estudiante creada por ******/
/****** KIARA ACEVEDO                    20-EIIN-1-047 ******/
/****** ESCARLEN MELENCIANO LASOSE       18-SIIT-1-005 ******/
/****** SANDY JAVIER RUIZ OGANDO         19-EIIT-1-032 ******/
CREATE DATABASE [SOLUCIONDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SOLUCIONDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SOLUCIONDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SOLUCIONDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SOLUCIONDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SOLUCIONDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SOLUCIONDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SOLUCIONDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SOLUCIONDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SOLUCIONDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SOLUCIONDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SOLUCIONDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SOLUCIONDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SOLUCIONDB] SET  MULTI_USER 
GO
ALTER DATABASE [SOLUCIONDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SOLUCIONDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SOLUCIONDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SOLUCIONDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SOLUCIONDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SOLUCIONDB] SET QUERY_STORE = OFF
GO
USE [SOLUCIONDB]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 3/5/2021 11:12:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[Articulo] [varchar](30) NOT NULL,
	[Descripcion] [varchar](240) NOT NULL,
	[Nombre_Busqueda] [varchar](30) NOT NULL,
	[Grupo_Art] [int] NOT NULL,
	[Tipo_Art] [varchar](30) NOT NULL,
	[Impuesto] [varchar](30) NOT NULL,
	[Unidad] [varchar](30) NOT NULL,
	[Costo] [decimal](16, 4) NULL,
	[Precio] [decimal](16, 4) NULL,
	[Inactivo] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 3/5/2021 11:12:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Cliente] [varchar](9) NOT NULL,
	[Nombre] [varchar](90) NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
	[Grupo_Cl] [int] NOT NULL,
	[Numero_registro_Nacional] [varchar](11) NOT NULL,
	[Direccion] [text] NULL,
	[Telefono] [varchar](60) NULL,
	[Email] [varchar](60) NULL,
	[Inactivo] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura_Detalle]    Script Date: 3/5/2021 11:12:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_Detalle](
	[Numero] [varchar](9) NOT NULL,
	[Linea] [int] NOT NULL,
	[Articulo] [varchar](30) NOT NULL,
	[Costo] [decimal](16, 4) NOT NULL,
	[Precio] [decimal](16, 4) NOT NULL,
	[Cantidad] [decimal](16, 4) NOT NULL,
	[Unidad] [varchar](30) NOT NULL,
	[Sub_Total] [decimal](16, 4) NOT NULL,
	[Monto_Impuesto] [decimal](16, 4) NOT NULL,
	[Monto_Descuento] [decimal](16, 4) NOT NULL,
	[Monto_Total] [decimal](16, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura_Encabezado]    Script Date: 3/5/2021 11:12:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_Encabezado](
	[Numero] [varchar](9) NOT NULL,
	[Cliente] [varchar](9) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Condicion_Pago] [varchar](30) NOT NULL,
	[Sub_Total] [decimal](16, 4) NOT NULL,
	[Monto_Impuesto] [decimal](16, 4) NOT NULL,
	[Monto_Descuento] [decimal](16, 4) NOT NULL,
	[Monto_Total] [decimal](16, 4) NOT NULL,
	[Nota] [text] NULL,
	[NCF] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo_articulos]    Script Date: 3/5/2021 11:12:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo_articulos](
	[Grupo_Art] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[Inactivo] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Grupo_Art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo_Clientes]    Script Date: 3/5/2021 11:12:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo_Clientes](
	[Grupo_Cl] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[Inactivo] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Grupo_Cl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'AC-000001', N'Aceita de Soya Crisol', N'Aceite', 17, N'Producto', N'18', N'Litro', CAST(190.0000 AS Decimal(16, 4)), CAST(244.9500 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'B-000001', N'Cerveza Presidente 12OZ', N'Cerveza', 8, N'Producto', N'18', N'Unidad', CAST(25.0000 AS Decimal(16, 4)), CAST(45.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'CP-000001', N'Jabón Dove', N'Jabón', 7, N'Producto', N'18', N'Unidad', CAST(35.5000 AS Decimal(16, 4)), CAST(50.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'ED-000001', N'Azúcar morena 5 LB', N'Azúcar', 11, N'Producto', N'18', N'Libra', CAST(78.5000 AS Decimal(16, 4)), CAST(150.9900 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'EM-000001', N'Salami Induveca Mediano', N'Salami', 4, N'Producto', N'18', N'Libra', CAST(99.0000 AS Decimal(16, 4)), CAST(160.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'FE-000001', N'Martillo', N'Martillo', 2, N'Producto', N'18', N'Unidad', CAST(120.0000 AS Decimal(16, 4)), CAST(220.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'FR-000001', N'Manzana Roja', N'Manzana', 15, N'Producto', N'18', N'Libra', CAST(45.0000 AS Decimal(16, 4)), CAST(60.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'FR-000002', N'Uvas Rojas', N'Uvas', 15, N'Producto', N'18', N'Libra', CAST(55.0000 AS Decimal(16, 4)), CAST(75.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'GA-000001', N'Galleta de Soda Hatuey', N'Galleta', 10, N'Producto', N'18', N'Unidad', CAST(1.5000 AS Decimal(16, 4)), CAST(5.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'H-000001', N'Aire Acondicionado 12,000 BTU', N'Aire', 1, N'Producto', N'18', N'Unidad', CAST(15000.0000 AS Decimal(16, 4)), CAST(28000.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'JU-000001', N'Jugo Rica', N'Jugos', 5, N'Producto', N'18', N'Litro', CAST(45.0000 AS Decimal(16, 4)), CAST(65.9900 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'LE-000001', N'Leche Dos Pinos', N'Leche', 13, N'Producto', N'Exento', N'Litro', CAST(25.0000 AS Decimal(16, 4)), CAST(49.9500 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'LE-000002', N'Leche Rica', N'Leche', 13, N'Producto', N'Exento', N'Litro', CAST(26.0000 AS Decimal(16, 4)), CAST(50.9900 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'LI-000001', N'Lava Platos Líquido', N'Limpieza', 6, N'Producto', N'18', N'Litro', CAST(45.0000 AS Decimal(16, 4)), CAST(75.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'P-000001', N'Spaguettis Princesa', N'Pastas', 14, N'Producto', N'18', N'Libra', CAST(15.0000 AS Decimal(16, 4)), CAST(22.9500 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'PA-000001', N'Pan Pepín Funda Grande', N'Pan', 12, N'Producto', N'18', N'Unidad', CAST(55.0000 AS Decimal(16, 4)), CAST(100.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'Q-000001', N'Queso Gouda', N'Queso', 20, N'Producto', N'18', N'Libra', CAST(180.0000 AS Decimal(16, 4)), CAST(229.5000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'Q-000002', N'Queso Danes', N'Queso', 20, N'Producto', N'18', N'Libra', CAST(165.0000 AS Decimal(16, 4)), CAST(218.5000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'Q-000003', N'Queso Cheddar', N'Queso', 20, N'Producto', N'18', N'Libra', CAST(185.0000 AS Decimal(16, 4)), CAST(234.9500 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'R-000001', N'Coca-Cola', N'Cola', 21, N'Producto', N'18', N'Unidad', CAST(18.0000 AS Decimal(16, 4)), CAST(29.9500 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'R-000002', N'Seven-Up', N'Refresco', 21, N'Producto', N'18', N'Unidad', CAST(17.0000 AS Decimal(16, 4)), CAST(28.9500 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'SER-000001', N'Instalación Aire', N'Instalación', 1, N'Servicio', N'Exento', N'Unidad', CAST(1500.0000 AS Decimal(16, 4)), CAST(2500.0000 AS Decimal(16, 4)), NULL)
INSERT [dbo].[Articulos] ([Articulo], [Descripcion], [Nombre_Busqueda], [Grupo_Art], [Tipo_Art], [Impuesto], [Unidad], [Costo], [Precio], [Inactivo]) VALUES (N'SER-000002', N'Reparación Aire acondicionado', N'Reparación', 1, N'Servicio', N'Exento', N'Unidad', CAST(2500.0000 AS Decimal(16, 4)), CAST(4000.0000 AS Decimal(16, 4)), NULL)
GO
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000001', N'Cliente Contado', N'Persona', 7, N'00000000000', N'N/A', N'N/A', N'N/A', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000002', N'Colmado Papolo', N'Empresa', 1, N'136598745', N'Calle 4, Las Palmas de Herrera, Santo Domingo Oeste', N'8099635663', N'papolo45@gmail.com', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000003', N'Alberto Preciado', N'Persona', 1, N'04701232456', N'Ave. Pedro Rivera, La Vega', N'8095731595', N'apreciado@outlook.com', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000004', N'Pepsico', N'Empresa', 5, N'12365489rr6', N'133 Street, Bronx, New York', N'14015633215', N'pepsicoadm@pepsico.com.do', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000005', N'Zona Franca Five Star', N'Empresa', 4, N'136325698', N'Zona industrial de Herrera', N'8095635565', N'fivestar@fivestar.com.do', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000006', N'Juan soto', N'Persona', 6, N'00103256963', N'Av. sarasota, Distrito Nacional', N'8296369665', N'N/A', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000007', N'Ministerio de Educación', N'Empresa', 3, N'136598765', N'Av. Máximo Gómez 2, Santo Domingo', N'8095556666', N'info@minerd.gob.do', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000008', N'Colamdo Juan', N'Empresa', 1, N'659856325', N'Respaldo 4 No. 50, Santo Domingo', N'8496365245', N'N/A', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000009', N'Cafetería La Hermana', N'Empresa', 1, N'963654898', N'Av. Jacobo Majluta', N'N/A', N'N/A', NULL)
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Tipo], [Grupo_Cl], [Numero_registro_Nacional], [Direccion], [Telefono], [Email], [Inactivo]) VALUES (N'CL-000010', N'Domingo Pérez', N'Persona', 6, N'04702566325', N'La esperilla, Distrito Nacional', N'8496541236', N'N/A', NULL)
GO
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000001', 1, N'Q-000001', CAST(180.0000 AS Decimal(16, 4)), CAST(229.5000 AS Decimal(16, 4)), CAST(2.0000 AS Decimal(16, 4)), N'Libra', CAST(459.0000 AS Decimal(16, 4)), CAST(82.6200 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(541.6200 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000001', 2, N'P-000001', CAST(15.0000 AS Decimal(16, 4)), CAST(22.9500 AS Decimal(16, 4)), CAST(1.0000 AS Decimal(16, 4)), N'Libra', CAST(22.9500 AS Decimal(16, 4)), CAST(4.1310 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(27.0810 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000001', 3, N'R-000001', CAST(18.0000 AS Decimal(16, 4)), CAST(29.9500 AS Decimal(16, 4)), CAST(1.0000 AS Decimal(16, 4)), N'Unidad', CAST(29.9500 AS Decimal(16, 4)), CAST(5.3910 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(35.3410 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000002', 1, N'H-000001', CAST(15000.0000 AS Decimal(16, 4)), CAST(28000.0000 AS Decimal(16, 4)), CAST(1.0000 AS Decimal(16, 4)), N'Unidad', CAST(28000.0000 AS Decimal(16, 4)), CAST(5040.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(33040.0000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000002', 2, N'SER-000001', CAST(1500.0000 AS Decimal(16, 4)), CAST(2500.0000 AS Decimal(16, 4)), CAST(1.0000 AS Decimal(16, 4)), N'Unidad', CAST(2500.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(2500.0000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000003', 1, N'LE-000001', CAST(25.0000 AS Decimal(16, 4)), CAST(49.9500 AS Decimal(16, 4)), CAST(500.0000 AS Decimal(16, 4)), N'Unidad', CAST(24975.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(1000.0000 AS Decimal(16, 4)), CAST(23975.0000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000004', 1, N'LE-000002', CAST(26.0000 AS Decimal(16, 4)), CAST(50.9900 AS Decimal(16, 4)), CAST(1000.0000 AS Decimal(16, 4)), N'Unidad', CAST(50990.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(2000.0000 AS Decimal(16, 4)), CAST(48990.0000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000004', 2, N'JU-000001', CAST(45.0000 AS Decimal(16, 4)), CAST(65.9900 AS Decimal(16, 4)), CAST(1000.0000 AS Decimal(16, 4)), N'Unidad', CAST(65990.0000 AS Decimal(16, 4)), CAST(11878.2000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(77868.2000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000005', 1, N'B-000001', CAST(25.0000 AS Decimal(16, 4)), CAST(45.0000 AS Decimal(16, 4)), CAST(96.0000 AS Decimal(16, 4)), N'Unidad', CAST(4320.0000 AS Decimal(16, 4)), CAST(777.6000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(5097.6000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000006', 1, N'AC-000001', CAST(190.0000 AS Decimal(16, 4)), CAST(244.9500 AS Decimal(16, 4)), CAST(2.0000 AS Decimal(16, 4)), N'Litro', CAST(489.9000 AS Decimal(16, 4)), CAST(88.1820 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(578.8020 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000007', 1, N'EM-000001', CAST(99.0000 AS Decimal(16, 4)), CAST(160.0000 AS Decimal(16, 4)), CAST(2500.0000 AS Decimal(16, 4)), N'Libra', CAST(400000.0000 AS Decimal(16, 4)), CAST(72000.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(472000.0000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000008', 1, N'LI-000001', CAST(45.0000 AS Decimal(16, 4)), CAST(75.0000 AS Decimal(16, 4)), CAST(5.0000 AS Decimal(16, 4)), N'Litro', CAST(375.0000 AS Decimal(16, 4)), CAST(67.5000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(442.5000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000009', 1, N'CP-000001', CAST(35.5000 AS Decimal(16, 4)), CAST(50.0000 AS Decimal(16, 4)), CAST(1.0000 AS Decimal(16, 4)), N'Unidad', CAST(50.0000 AS Decimal(16, 4)), CAST(9.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(59.0000 AS Decimal(16, 4)))
INSERT [dbo].[Factura_Detalle] ([Numero], [Linea], [Articulo], [Costo], [Precio], [Cantidad], [Unidad], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total]) VALUES (N'FT-000010', 1, N'R-000001', CAST(18.0000 AS Decimal(16, 4)), CAST(29.9500 AS Decimal(16, 4)), CAST(50.0000 AS Decimal(16, 4)), N'Unidad', CAST(1497.5000 AS Decimal(16, 4)), CAST(269.5000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(1767.0000 AS Decimal(16, 4)))
GO
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000001', N'CL-000001', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Contado', CAST(511.9000 AS Decimal(16, 4)), CAST(92.1420 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(604.0420 AS Decimal(16, 4)), NULL, N'B0232659878')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000002', N'CL-000003', CAST(N'2021-01-15T00:00:00.000' AS DateTime), N'60', CAST(30500.0000 AS Decimal(16, 4)), CAST(5040.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(35540.0000 AS Decimal(16, 4)), N'0', N'B0136548962')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000003', N'CL-000005', CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'60', CAST(24975.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(1000.0000 AS Decimal(16, 4)), CAST(23975.0000 AS Decimal(16, 4)), N'Entrega a Domicilio', N'B1454236987')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000004', N'CL-000007', CAST(N'2021-01-31T00:00:00.000' AS DateTime), N'120', CAST(116980.0000 AS Decimal(16, 4)), CAST(11878.2000 AS Decimal(16, 4)), CAST(2000.0000 AS Decimal(16, 4)), CAST(126858.2000 AS Decimal(16, 4)), N'', N'B1596547896')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000005', N'CL-000002', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'30', CAST(4320.0000 AS Decimal(16, 4)), CAST(777.6000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(5097.6000 AS Decimal(16, 4)), NULL, N'B0145636987')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000006', N'CL-000010', CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Contado', CAST(244.9500 AS Decimal(16, 4)), CAST(88.1820 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(578.8020 AS Decimal(16, 4)), N'Empleado', N'B0256986325')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000007', N'CL-000004', CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'90', CAST(400000.0000 AS Decimal(16, 4)), CAST(72000.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(472000.0000 AS Decimal(16, 4)), N'Exportación', N'B1631458963')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000008', N'CL-000009', CAST(N'2021-02-05T00:00:00.000' AS DateTime), N'30', CAST(375.0000 AS Decimal(16, 4)), CAST(67.5000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(442.5000 AS Decimal(16, 4)), NULL, N'B0163698569')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000009', N'CL-000006', CAST(N'2021-02-06T00:00:00.000' AS DateTime), N'Contado', CAST(50.0000 AS Decimal(16, 4)), CAST(9.0000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(59.0000 AS Decimal(16, 4)), NULL, N'B0265136963')
INSERT [dbo].[Factura_Encabezado] ([Numero], [Cliente], [Fecha], [Condicion_Pago], [Sub_Total], [Monto_Impuesto], [Monto_Descuento], [Monto_Total], [Nota], [NCF]) VALUES (N'FT-000010', N'CL-000002', CAST(N'2021-02-07T00:00:00.000' AS DateTime), N'30', CAST(1497.5000 AS Decimal(16, 4)), CAST(269.5000 AS Decimal(16, 4)), CAST(0.0000 AS Decimal(16, 4)), CAST(1767.0000 AS Decimal(16, 4)), NULL, N'B0178963214')
GO
SET IDENTITY_INSERT [dbo].[Grupo_articulos] ON 

INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (1, N'Hogar', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (2, N'Ferreteria', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (3, N'Carnes', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (4, N'Embutidos', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (5, N'Jugos', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (6, N'Limpieza', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (7, N'Cuidado Personal', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (8, N'Bebidas Alcoholicas', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (9, N'Cereales', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (10, N'Galletas', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (11, N'Edulcorantes', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (12, N'Panadería', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (13, N'Leches', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (14, N'Pastas', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (15, N'Frutas', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (16, N'Vegetales', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (17, N'Aceites', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (18, N'Chocolates', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (19, N'Pescados', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (20, N'Quesos', NULL)
INSERT [dbo].[Grupo_articulos] ([Grupo_Art], [Descripcion], [Inactivo]) VALUES (21, N'Refrescos', NULL)
SET IDENTITY_INSERT [dbo].[Grupo_articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Grupo_Clientes] ON 

INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (1, N'Local', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (2, N'Extranjero', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (3, N'Gubernamental', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (4, N'Zona Franca', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (5, N'Socio Extranjero', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (6, N'Empleado', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (7, N'Contado', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (8, N'Interno', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (9, N'Intercambio', NULL)
INSERT [dbo].[Grupo_Clientes] ([Grupo_Cl], [Descripcion], [Inactivo]) VALUES (10, N'Socio Local', NULL)
SET IDENTITY_INSERT [dbo].[Grupo_Clientes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__E33CFD000A1096EC]    Script Date: 3/5/2021 11:12:41 p. m. ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[Numero_registro_Nacional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD FOREIGN KEY([Grupo_Art])
REFERENCES [dbo].[Grupo_articulos] ([Grupo_Art])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([Grupo_Cl])
REFERENCES [dbo].[Grupo_Clientes] ([Grupo_Cl])
GO
ALTER TABLE [dbo].[Factura_Detalle]  WITH CHECK ADD FOREIGN KEY([Articulo])
REFERENCES [dbo].[Articulos] ([Articulo])
GO
ALTER TABLE [dbo].[Factura_Encabezado]  WITH CHECK ADD FOREIGN KEY([Cliente])
REFERENCES [dbo].[Clientes] ([Cliente])
GO
USE [master]
GO
ALTER DATABASE [SOLUCIONDB] SET  READ_WRITE 
GO
