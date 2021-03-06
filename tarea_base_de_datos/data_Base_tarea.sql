USE [master]
GO
/****** Object:  Database [MerceriaAna]    Script Date: 22/01/2022 22:21:13 ******/
CREATE DATABASE [MerceriaAna]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MerceriaAna', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MerceriaAna.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MerceriaAna_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MerceriaAna_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MerceriaAna] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MerceriaAna].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MerceriaAna] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MerceriaAna] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MerceriaAna] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MerceriaAna] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MerceriaAna] SET ARITHABORT OFF 
GO
ALTER DATABASE [MerceriaAna] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MerceriaAna] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MerceriaAna] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MerceriaAna] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MerceriaAna] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MerceriaAna] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MerceriaAna] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MerceriaAna] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MerceriaAna] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MerceriaAna] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MerceriaAna] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MerceriaAna] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MerceriaAna] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MerceriaAna] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MerceriaAna] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MerceriaAna] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MerceriaAna] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MerceriaAna] SET RECOVERY FULL 
GO
ALTER DATABASE [MerceriaAna] SET  MULTI_USER 
GO
ALTER DATABASE [MerceriaAna] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MerceriaAna] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MerceriaAna] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MerceriaAna] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MerceriaAna] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MerceriaAna] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MerceriaAna', N'ON'
GO
ALTER DATABASE [MerceriaAna] SET QUERY_STORE = OFF
GO
USE [MerceriaAna]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/01/2022 22:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[DNI] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [text] NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 22/01/2022 22:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[Id] [varchar](20) NOT NULL,
	[Articulo] [text] NOT NULL,
	[Fecha Compra] [date] NOT NULL,
	[CodigoProductos] [varchar](20) NOT NULL,
	[DNIClients] [varchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costureras]    Script Date: 22/01/2022 22:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costureras](
	[DNI] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Articulo] [text] NULL,
	[Telefono] [int] NULL,
 CONSTRAINT [PK_Costureras] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/01/2022 22:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Codigo] [varchar](20) NOT NULL,
	[Articulo] [text] NOT NULL,
	[Existencias] [int] NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 22/01/2022 22:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Codigo] [varchar](20) NOT NULL,
	[Articulo] [text] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [text] NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suministran]    Script Date: 22/01/2022 22:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suministran](
	[Id] [varchar](20) NOT NULL,
	[Articulo] [text] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[CodigoProductos] [varchar](20) NOT NULL,
	[CodigoProveedores] [varchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 22/01/2022 22:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [varchar](20) NOT NULL,
	[Articulo] [text] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[CodigoProveedores] [varchar](20) NOT NULL,
	[DNICostureras] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Clientes] FOREIGN KEY([DNIClients])
REFERENCES [dbo].[Clientes] ([DNI])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Clientes]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Productos] FOREIGN KEY([CodigoProductos])
REFERENCES [dbo].[Productos] ([Codigo])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Productos]
GO
ALTER TABLE [dbo].[Suministran]  WITH CHECK ADD  CONSTRAINT [FK_Suministran_Productos] FOREIGN KEY([CodigoProductos])
REFERENCES [dbo].[Productos] ([Codigo])
GO
ALTER TABLE [dbo].[Suministran] CHECK CONSTRAINT [FK_Suministran_Productos]
GO
ALTER TABLE [dbo].[Suministran]  WITH CHECK ADD  CONSTRAINT [FK_Suministran_Proveedores] FOREIGN KEY([CodigoProveedores])
REFERENCES [dbo].[Proveedores] ([Codigo])
GO
ALTER TABLE [dbo].[Suministran] CHECK CONSTRAINT [FK_Suministran_Proveedores]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Costureras] FOREIGN KEY([DNICostureras])
REFERENCES [dbo].[Costureras] ([DNI])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Costureras]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Proveedores] FOREIGN KEY([CodigoProveedores])
REFERENCES [dbo].[Proveedores] ([Codigo])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Proveedores]
GO
USE [master]
GO
ALTER DATABASE [MerceriaAna] SET  READ_WRITE 
GO
