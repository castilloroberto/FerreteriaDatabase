
-- IF NOT EXISTS Ferreteria_AL CREATE DATABASE Ferreteria_AL 
-- GO
--create database Ferreteria_DB
--GO

--USE [FerreteriaDB]
--GO


/****** Object:  Table [dbo].[Empleado]    Script Date: 13/07/2021 22:20:34 ******/

create table Cargos(
	IDCargo int primary key identity, 
	Cargo nvarchar(25)
)
go

CREATE TABLE [dbo].[Empleados](
	[Cod_Empleado] [nvarchar](13) primary key NOT NULL,
	[NomEmpleado] [nvarchar](30) NOT NULL,
	[ApellEmpleado] [nvarchar](30) NOT NULL,
	[Direccion] [nvarchar](70) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Cargo] int FOREIGN key references Cargos(IDCargo) NOT NULL
) 
GO



create table Niveles(
	IDNivel int primary key identity, 
	Nivel nvarchar(25)  
)
GO

/****** Object:  Table [dbo].[Usuario]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Usuarios](
	[Nom_Usuario] [nvarchar](20) primary key NOT NULL,
	[Contra_Usuario] [nvarchar](20) NOT NULL,
	[Cod_Empleado] [nvarchar](13) FOREIGN key references Empleados(Cod_Empleado),
	[IDNivel] int FOREIGN key references Niveles(IDNivel) NOT NULL
) 
GO

/****** Object:  Table [dbo].[Accion]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Acciones](
	[Cod_Accion] [int] primary key identity,
	[Accion] [nvarchar](50) NOT NULL,
 
)
GO



/****** Object:  Table [dbo].[Bitacora]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Bitacora](
	[Cod_Bitacora] [int] PRIMARY KEY IDENTITY NOT NULL,
	[Usuario] [nvarchar](20) FOREIGN key references Usuarios(Nom_Usuario) NOT NULL,
	[Cod_Accion] [int] foreign key references Acciones(Cod_Accion) NOT NULL,
	[Fecha] [datetime] NOT NULL DEFAULT GETDATE(),
)
GO




/****** Object:  Table [dbo].[CAI]    Script Date: 13/07/2021 22:20:34 ******/
-- 78787878-1
-- 78787878-2
CREATE TABLE [dbo].[CAI](
	[Cod_CAI] [nvarchar](50) PRIMARY KEY NOT NULL, -- parte estatica del CAI
	-- [CAI] [nvarchar](50) NOT NULL,
	[Fecha_Inicio] [datetime] NOT NULL,
	[Fecha_Final] [datetime] NOT NULL,
	[Rango_Inicio] [nvarchar](50) NOT NULL,
	[Rango_Final] [nvarchar](50) NOT NULL,
) 
GO




/****** Object:  Table [dbo].[Categoria]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Categorias](
	[Cod_Categoria] [int] PRIMARY KEY IDENTITY NOT NULL,
	[Nom_Categoria] [nvarchar](50) NOT NULL,
) 
GO





/****** Object:  Table [dbo].[Cliente]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Clientes](
	[Cod_Cliente] [NVARCHAR](13) PRIMARY KEY NOT NULL, --identidad o DNI
	[Nom_Cliente] [nvarchar](30) NOT NULL,
	[Apell_Cliente] [nvarchar](30) NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
	[Telefono] [nvarchar](8) NOT NULL
) 
GO



/****** Object:  Table [dbo].[Proveedor]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Proveedor](
	[Cod_Proveedor] [int] primary key identity NOT NULL,
	[Nom_Proveedor] [nvarchar](30) NOT NULL,
	[Apell_Proveedor] [nvarchar](30) NOT NULL,
	[Nomb_Empresa] [nvarchar](30) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Correo] [nvarchar](70) NOT NULL
) 
GO

/****** Object:  Table [dbo].[Compra]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Compras](
	[Cod_Compra] [uniqueidentifier] PRIMARY KEY NOT NULL,
	[Cod_Proveedor] [int] foreign key references Proveedor(Cod_Proveedor)NOT NULL,
	[Cod_Categoria] [int] foreign key references Categorias(Cod_Categoria)NOT NULL,
	[Fecha_Compra] [datetime] NOT NULL DEFAULT GETDATE(),
) 
GO


/****** Object:  Table [dbo].[Marca]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Marcas](
	[Cod_Marca] [int] primary key identity NOT NULL,
	[Marca] [nvarchar](50) NOT NULL
)
GO



/****** Object:  Table [dbo].[Producto]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Productos](
	[Cod_Producto] [int] primary key identity ,
	[Producto] [nvarchar](70) NOT NULL,
	[Precio] [decimal](7, 2) NOT NULL,
	[Stock] [int] NULL,
	[Cod_Categoria] [int] foreign key references Categorias(Cod_Categoria)NOT NULL,
	[Cod_Marca] [int] foreign key references Marcas(Cod_Marca) NOT NULL,
	[Cod_Proveedor] [int] foreign key references Proveedor(Cod_Proveedor)NOT NULL 
) 
GO

/****** Object:  Table [dbo].[Detalle_Compra]    Script Date: 13/07/2021 22:20:34 ******/
CREATE TABLE [dbo].[Detalle_Compra](
	[Cod_Compra] [uniqueidentifier] foreign key references Compras(Cod_Compra) NOT NULL,
	[Cod_Producto] [int] foreign key references Productos(Cod_Producto) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](7, 2) NOT NULL,
	[ISV] [decimal](7, 2) NOT NULL,
	
) 
GO





/****** Object:  Table [dbo].[Venta]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Ventas](
	[Cod_Venta] [uniqueidentifier] primary key NOT NULL,
	[Codigofactura] int identity not null,
	[Cod_Cliente] [nvarchar](13)  FOREIGN key references Clientes(Cod_Cliente),
	[Nom_Usuario] nvarchar(20) FOREIGN key references Usuarios(Nom_Usuario),
	[Cod_CAI] [nvarchar](50) NULL,
	[Fecha] [datetime] NULL default GETDATE(),
) 
GO


-- codigo CAI

-- 5A76D1-04BA7B-0647B6-9E1DCB-2A9D25-29


/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 13/07/2021 22:20:34 ******/

CREATE TABLE [dbo].[Detalle_Venta](
	[Cod_Venta] [uniqueidentifier] FOREIGN key references Ventas(Cod_Venta) NOT NULL,
	[Cod_Producto] [int] foreign key references Productos(Cod_Producto) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](7, 2) NOT NULL
) 
GO
















