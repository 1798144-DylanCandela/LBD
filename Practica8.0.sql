USE [master]
GO
/****** Object:  Database [Practica6.1]    Script Date: 02/11/2019 0:55:34 ******/
CREATE DATABASE [Practica6.1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica6.1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Practica6.1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Practica6.1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Practica6.1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Practica6.1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica6.1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica6.1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica6.1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica6.1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica6.1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica6.1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica6.1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica6.1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica6.1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica6.1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica6.1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica6.1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica6.1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica6.1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica6.1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica6.1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica6.1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica6.1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica6.1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica6.1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica6.1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica6.1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica6.1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica6.1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica6.1] SET  MULTI_USER 
GO
ALTER DATABASE [Practica6.1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica6.1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica6.1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica6.1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Practica6.1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Practica6.1]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Producto]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[F_Producto] (
@valor1 int
)
returns  int
as 
begin
declare @cantidad int
set @cantidad = @valor1
return @cantidad
end
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[ID_Categoria] [int] NOT NULL,
	[Descripcion_Categoria] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] NOT NULL,
	[Nombre_Cliente] [nvarchar](30) NOT NULL,
	[Apellido_Uno_Cliente] [nvarchar](30) NOT NULL,
	[Apellido_Dos_Cliente] [nvarchar](30) NOT NULL,
	[FechaNacimiento_Cliente] [date] NOT NULL,
	[Pais_Cliente] [nvarchar](30) NOT NULL,
	[Estado_Cliente] [nvarchar](30) NOT NULL,
	[Municipio_Cliente] [nvarchar](30) NOT NULL,
	[Colonia_Cliente] [nvarchar](30) NOT NULL,
	[Numero_Ext_Cliente] [int] NOT NULL,
	[Codigo_Postal_Cliente] [nvarchar](30) NOT NULL,
	[Telefono_Cliente] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compra]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[ID_Compra] [int] NOT NULL,
	[Fecha_Compra] [date] NULL,
	[Encargado_Compra] [nvarchar](30) NOT NULL,
	[ID_Negocio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle_Compra]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Compra](
	[ID_Detalle_Compra] [int] NOT NULL,
	[ID_Compra] [int] NULL,
	[ID_Proveedor] [int] NULL,
	[Precio_Unidad_Detalle_Compra] [int] NOT NULL,
	[Cantidad_Detalle_Compra] [int] NOT NULL,
	[Descuento_Detalle_Compra] [int] NULL,
	[PrecioTotal_Detalle_Compra] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Venta](
	[ID_Detalle_Venta] [int] NOT NULL,
	[ID_Venta] [int] NULL,
	[ID_Producto] [int] NULL,
	[ID_Cliente] [int] NULL,
	[Precio_Producto] [int] NOT NULL,
	[Cantidad_Producto] [int] NOT NULL,
	[Descuento_Producto] [int] NULL,
	[PrecioTotal_Producto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID_Empleado] [int] NOT NULL,
	[Nombre_Empleado] [nvarchar](30) NOT NULL,
	[Apellido_Primero_Empleado] [nvarchar](30) NOT NULL,
	[Apellido_Segundo_Empleado] [nvarchar](30) NOT NULL,
	[Telefono_Empleado] [nvarchar](30) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Pais_Empleado] [nvarchar](30) NOT NULL,
	[Estado_Empleado] [nvarchar](30) NOT NULL,
	[Municipio_Empleado] [nvarchar](30) NOT NULL,
	[Colonia_Empleado] [nvarchar](30) NOT NULL,
	[Numero_Interior_Empleado] [int] NULL,
	[Numero_Ext_Empleado] [int] NOT NULL,
	[Local_Asig_Empleado] [int] NOT NULL,
	[ID_Puestos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marca]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[ID_Marca] [int] NOT NULL,
	[Nombre_Marca] [nvarchar](80) NOT NULL,
	[Tipo_Marca] [nvarchar](80) NOT NULL,
	[Pais_Marca] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Negocio]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Negocio](
	[ID_Negocio] [int] NOT NULL,
	[Nombre_Nego] [varchar](30) NOT NULL,
	[Telefono_Nego] [nvarchar](30) NOT NULL,
	[Horario_Nego] [time](7) NOT NULL,
	[Nombre_Respon_Nego] [nvarchar](30) NOT NULL,
	[Apellido_Respon_Nego] [nvarchar](30) NOT NULL,
	[Nombre_Completo_Respon_Nego] [nvarchar](30) NOT NULL,
	[Pais_Nego] [int] NOT NULL,
	[Estado_Nego] [int] NOT NULL,
	[Municipio_Nego] [int] NOT NULL,
	[Colonia_Nego] [int] NOT NULL,
	[Numero_Ext_Nego] [int] NOT NULL,
	[Codigo_Postal_Nego] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Negocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[ID_Presentacion] [int] NOT NULL,
	[Desc_Presentacion] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Presentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID_Producto] [int] NOT NULL,
	[Nombre_PR] [nvarchar](200) NOT NULL,
	[Descripcion_PR] [nvarchar](200) NOT NULL,
	[Precio] [int] NOT NULL,
	[Sabor] [nvarchar](30) NULL,
	[Peso] [int] NOT NULL,
	[ID_Categoria] [int] NULL,
	[ID_Proveedor] [int] NULL,
	[ID_UnidadMedida] [int] NULL,
	[ID_Presentacion] [int] NULL,
	[ID_Marca] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[ID_Proveedor] [int] NOT NULL,
	[Descripcion_Produc_Provedor] [nvarchar](30) NOT NULL,
	[Nombre_Proveedor] [nvarchar](30) NOT NULL,
	[Tipo_Provedora] [nvarchar](30) NOT NULL,
	[Pais_Proveedor] [nvarchar](30) NOT NULL,
	[Estado_Proveedor] [nvarchar](30) NOT NULL,
	[Municipio_Proveedor] [nvarchar](30) NOT NULL,
	[Colonia_Proveedor] [nvarchar](30) NOT NULL,
	[Numero_Ext_Proveedor] [int] NOT NULL,
	[Codigo_Postal_Proveedor] [nvarchar](30) NOT NULL,
	[Telefono_Proveedor] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[ID_Puestos] [int] NOT NULL,
	[Descripcion_Puesto] [nvarchar](30) NOT NULL,
	[Sueldo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Puestos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ID_Ticket] [int] NOT NULL,
	[ID_Detalle_Venta] [int] NULL,
	[ID_Tipo_Pago] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket_Detalle]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_Detalle](
	[ID_Ticket_Detalle] [int] NOT NULL,
	[ID_Producto] [int] NULL,
	[Cantidad_Articulos] [int] NOT NULL,
	[Total_Productos] [int] NOT NULL,
	[ID_Ticket] [int] NULL,
	[Total_Monto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ticket_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Pago]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Pago](
	[ID_Tipo_Pago] [int] NOT NULL,
	[Descripcion_TipoPago] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tipo_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadMedida](
	[ID_UnidadMedida] [int] NOT NULL,
	[Tipo_UnidadMedida] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_UnidadMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venta]    Script Date: 02/11/2019 0:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[ID_Venta] [int] NOT NULL,
	[Fecha_Venta] [date] NOT NULL,
	[Hora_Venta] [time](7) NOT NULL,
	[ID_Empleado] [int] NULL,
	[ID_Negocio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [Fk_Negocio2] FOREIGN KEY([ID_Negocio])
REFERENCES [dbo].[Negocio] ([ID_Negocio])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [Fk_Negocio2]
GO
ALTER TABLE [dbo].[Detalle_Compra]  WITH CHECK ADD  CONSTRAINT [Fk_Compra] FOREIGN KEY([ID_Compra])
REFERENCES [dbo].[Compra] ([ID_Compra])
GO
ALTER TABLE [dbo].[Detalle_Compra] CHECK CONSTRAINT [Fk_Compra]
GO
ALTER TABLE [dbo].[Detalle_Compra]  WITH CHECK ADD  CONSTRAINT [Fk_Proveedores] FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedor] ([ID_Proveedor])
GO
ALTER TABLE [dbo].[Detalle_Compra] CHECK CONSTRAINT [Fk_Proveedores]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [Fk_Clientes] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [Fk_Clientes]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [Fk_Productos] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [Fk_Productos]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [Fk_Venta] FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Venta] ([ID_Venta])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [Fk_Venta]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [Fk_Puestos] FOREIGN KEY([ID_Puestos])
REFERENCES [dbo].[Puestos] ([ID_Puestos])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [Fk_Puestos]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Fk_Categoria] FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[Categoria] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Fk_Categoria]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Fk_Marca] FOREIGN KEY([ID_Marca])
REFERENCES [dbo].[Marca] ([ID_Marca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Fk_Marca]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Fk_Presentacion] FOREIGN KEY([ID_Presentacion])
REFERENCES [dbo].[Presentacion] ([ID_Presentacion])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Fk_Presentacion]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Fk_Proveedor] FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedor] ([ID_Proveedor])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Fk_Proveedor]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Fk_UnidadMedida] FOREIGN KEY([ID_UnidadMedida])
REFERENCES [dbo].[UnidadMedida] ([ID_UnidadMedida])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Fk_UnidadMedida]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [Fk_Detalle_Venta] FOREIGN KEY([ID_Detalle_Venta])
REFERENCES [dbo].[Detalle_Venta] ([ID_Detalle_Venta])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [Fk_Detalle_Venta]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [Fk_Tipo_Pago] FOREIGN KEY([ID_Tipo_Pago])
REFERENCES [dbo].[Tipo_Pago] ([ID_Tipo_Pago])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [Fk_Tipo_Pago]
GO
ALTER TABLE [dbo].[Ticket_Detalle]  WITH CHECK ADD  CONSTRAINT [Fk_Productoss] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Ticket_Detalle] CHECK CONSTRAINT [Fk_Productoss]
GO
ALTER TABLE [dbo].[Ticket_Detalle]  WITH CHECK ADD  CONSTRAINT [Fk_Ticket] FOREIGN KEY([ID_Ticket])
REFERENCES [dbo].[Ticket] ([ID_Ticket])
GO
ALTER TABLE [dbo].[Ticket_Detalle] CHECK CONSTRAINT [Fk_Ticket]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [Fk_Empleado] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleado] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [Fk_Empleado]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [Fk_Negocio] FOREIGN KEY([ID_Negocio])
REFERENCES [dbo].[Negocio] ([ID_Negocio])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [Fk_Negocio]
GO
USE [master]
GO
ALTER DATABASE [Practica6.1] SET  READ_WRITE 
GO
