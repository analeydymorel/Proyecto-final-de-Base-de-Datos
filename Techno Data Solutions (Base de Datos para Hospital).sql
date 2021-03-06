USE [master]
GO
/****** Base de datos para un Hospital creada por ******/
/****** Ana Leydy Morel Castillo	20-SIIT-1-031 Seccion: 0541 ******/
CREATE DATABASE [Techno_Data_Solutions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Techno_Data_Solutions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Techno_Data_Solutions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Techno_Data_Solutions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Techno_Data_Solutions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Techno_Data_Solutions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Techno_Data_Solutions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Techno_Data_Solutions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET ARITHABORT OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Techno_Data_Solutions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Techno_Data_Solutions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Techno_Data_Solutions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Techno_Data_Solutions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Techno_Data_Solutions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Techno_Data_Solutions] SET  MULTI_USER 
GO
ALTER DATABASE [Techno_Data_Solutions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Techno_Data_Solutions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Techno_Data_Solutions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Techno_Data_Solutions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Techno_Data_Solutions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Techno_Data_Solutions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Techno_Data_Solutions] SET QUERY_STORE = OFF
GO
USE [Techno_Data_Solutions]
GO
/****** Object:  Table [dbo].[Camas]    Script Date: 8/4/2022 4:41:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camas](
	[Cama_Id] [int] IDENTITY(118,2001) NOT NULL,
	[planta_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cama_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 8/4/2022 4:41:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[Medico_Id] [int] IDENTITY(118,2001) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Medico_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 8/4/2022 4:41:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[Paciente_Id] [int] IDENTITY(10,10) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Fech_Nacimiento] [date] NOT NULL,
	[Edad] [varchar](3) NULL,
	[Sexo] [varchar](1) NOT NULL,
	[Cedula] [decimal](11, 0) NOT NULL,
	[Telefono] [decimal](10, 0) NULL,
	[Direccion] [varchar](100) NULL,
	[ARS] [varchar](20) NULL,
	[NSS] [decimal](9, 0) NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Paciente_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes_Cama]    Script Date: 8/4/2022 4:41:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes_Cama](
	[PacienteCama_Id] [int] IDENTITY(10,10) NOT NULL,
	[Fech_Asignacion] [date] NOT NULL,
	[Cama_Id] [int] NULL,
	[Paciente_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PacienteCama_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planta]    Script Date: 8/4/2022 4:41:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planta](
	[Planta_Id] [int] IDENTITY(114,77) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Numero_de_Camas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Planta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visita_Medica]    Script Date: 8/4/2022 4:41:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visita_Medica](
	[Fech_Hora_Visita] [date] NULL,
	[Diagnostico_Enfermedad] [varchar](500) NULL,
	[Medico_Id] [int] NULL,
	[PacienteCama_Id] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Camas] ON 

INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (118, 268)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (2119, 345)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (4120, 422)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (6121, 499)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (8122, 268)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (10123, 807)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (12124, 807)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (14125, 730)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (16126, 653)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (22129, 499)
INSERT [dbo].[Camas] ([Cama_Id], [planta_Id]) VALUES (24130, 268)
SET IDENTITY_INSERT [dbo].[Camas] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (118, N'Hector Enrique', N'Zorrilla Brea')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (2119, N'Alba ', N'Gil Thomas')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (4120, N'Ruth', N'Vasquez Mora')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (6121, N'Veronica ', N'Feliz Slujalkovsky')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (8122, N'Rafael ', N'Matos Sanchez')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (10123, N'Doriceli', N'Urbaez Felix')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (12124, N'Elizabeth', N'Cornielle Hidalgo')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (14125, N'Wadilys ', N'De Leon Leyba')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (16126, N'Ilonka ', N'Inoa Mendez')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (18127, N'Taella Michelle', N'Dotel Matias')
INSERT [dbo].[Medicos] ([Medico_Id], [Nombres], [Apellidos]) VALUES (20128, N'willianny', N'Romeo Alburquerque')
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (20, N'Dariana', N'Mieses Rodriguez', CAST(N'2001-11-14' AS Date), N'20', N'F', CAST(1589476478 AS Decimal(11, 0)), CAST(8495671428 AS Decimal(10, 0)), N'Calle Diagonal #20 Campechito 2do', N'Senasa', CAST(478749456 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (30, N'Emmanuel', N'Dionisio Sanchez', CAST(N'2001-05-17' AS Date), N'20', N'M', CAST(4025897461 AS Decimal(11, 0)), CAST(8295761485 AS Decimal(10, 0)), N'Eduardo Vicioso #1 La Julia ', N'Humano', CAST(180120117 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (40, N'Marcos Augusto', N'Diaz Ramirez', CAST(N'2001-01-29' AS Date), N'21', N'M', CAST(4024859872 AS Decimal(11, 0)), CAST(8492547846 AS Decimal(10, 0)), N'30 Marzo 9sd', N'Mapfre', CAST(547484894 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (50, N'Edwin', N'Luis Cerda', CAST(N'2002-09-19' AS Date), N'19', N'M', CAST(4025684471 AS Decimal(11, 0)), CAST(8492101408 AS Decimal(10, 0)), N'AV. Tiradente 22', N'Senasa', CAST(191801212 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (60, N'Rafael ', N'Vicente Rodruguez', CAST(N'1993-01-02' AS Date), N'29', N'M', CAST(5500011455 AS Decimal(11, 0)), CAST(8295671458 AS Decimal(10, 0)), N'C/Luis F. Thomen No.456', N'Humamo', CAST(458675664 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (70, N'Ana Maria', N'Lapaez Villa', CAST(N'2000-03-04' AS Date), N'22', N'F', CAST(2300262315 AS Decimal(11, 0)), CAST(8096566473 AS Decimal(10, 0)), N'Ensache Naco No. 59', N'ARS Palic', CAST(568475666 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (100, N'Juan Carlos', N'Mora de la Cruz', CAST(N'1995-09-19' AS Date), N'28', N'M', CAST(6100248225 AS Decimal(11, 0)), CAST(8498280660 AS Decimal(10, 0)), N'C. Evaristo Morales No. 52', N'Seguros Universal', CAST(489575478 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (110, N'Maritza Mayelin ', N'Polanco Nuñez', CAST(N'2002-12-25' AS Date), N'18', N'F', CAST(8459671478 AS Decimal(11, 0)), CAST(8295457692 AS Decimal(10, 0)), N'C. 3ra Los Guaricanos No. 36', N'Senasa', CAST(454758687 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (150, N'Lisandra', N'Orlando Matos', CAST(N'1958-01-18' AS Date), N'64', N'F', CAST(9556879458 AS Decimal(11, 0)), CAST(8095788746 AS Decimal(10, 0)), N'Av. Los Restaurantes No.8', N'ARS Futuro', CAST(669758757 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (160, N'Mercedes', N'Mejia Mendez', CAST(N'2000-05-03' AS Date), N'22', N'F', CAST(5647889742 AS Decimal(11, 0)), CAST(8495672318 AS Decimal(10, 0)), N'Av, Tiradentes Calle B No.8', N'ARS Palic', CAST(145778956 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (170, N'Carmen Lucia', N'Lopez Arias', CAST(N'1964-02-25' AS Date), N'58', N'F', CAST(2547857948 AS Decimal(11, 0)), CAST(8095647852 AS Decimal(10, 0)), N'Buena Vista 1r No 54', N'Mapfre', CAST(654788896 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (200, N'Jose Antonio', N'Perez Espinal', CAST(N'2002-08-26' AS Date), N'19', N'M', CAST(1486665736 AS Decimal(11, 0)), CAST(8492736548 AS Decimal(10, 0)), N'C. 3ra. Los Tamarindo 28', N'Humano', CAST(394237464 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (220, N'Maria Esmerlina', N'Crespo Vargas', CAST(N'2000-04-06' AS Date), N'22', N'F', CAST(2524184545 AS Decimal(11, 0)), CAST(8294856476 AS Decimal(10, 0)), N'Av. Tiradentes 65', N'ARS APS', CAST(554866981 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (230, N'Hector ', N'Casanovas Mejia', CAST(N'1958-05-02' AS Date), N'64', N'M', CAST(3698745824 AS Decimal(11, 0)), CAST(8096443825 AS Decimal(10, 0)), N'Av. Charles De Gaulle', N'Senasa', CAST(328945682 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (250, N'Josefina', N'Peña Gomez', CAST(N'1960-01-05' AS Date), N'62', N'F', CAST(2300262315 AS Decimal(11, 0)), CAST(8495632148 AS Decimal(10, 0)), N'C. Lic Polibio| Diaz No.45, Torre Gil Roma XXV', N'Universal', CAST(456984631 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (260, N'Killua Luis', N'Santana Reyna', CAST(N'2003-05-15' AS Date), N'18', N'M', CAST(4028850340 AS Decimal(11, 0)), CAST(8093468512 AS Decimal(10, 0)), N'C. Imbert No.19. 2do Nivel', N'Senasa', CAST(789515546 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (280, N'Santiago Jose', N'Fernandez Mejia', CAST(N'1987-08-25' AS Date), N'34', N'M', CAST(1140710041 AS Decimal(11, 0)), CAST(8492566547 AS Decimal(10, 0)), N'C. Narciso Gonzalez No. 24, Villa Hermosa', N' Futuro', CAST(456848248 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (290, N'Pancracia', N'Boyer Pua', CAST(N'1958-09-27' AS Date), N'63', N'F', CAST(1488597655 AS Decimal(11, 0)), CAST(8296547311 AS Decimal(10, 0)), N'C. La Milagrosa No. 31, Villa Mella', N'ARS Yunen', CAST(354857547 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (300, N'Bartolomeo', N'Simpson Rosario', CAST(N'2000-02-25' AS Date), N'22', N'M', CAST(4027489647 AS Decimal(11, 0)), CAST(8095556478 AS Decimal(10, 0)), N'Av. Tiradentes, Calle B No, 9', N'ARS Palic', CAST(378945612 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (310, N'Yulibersy', N'Castillo De La Cruz', CAST(N'1996-12-11' AS Date), N'25', N'F', CAST(4020019611 AS Decimal(11, 0)), CAST(8491110048 AS Decimal(10, 0)), N'Av.Charles De Gaulle, No. 77', N'Mapfre', CAST(456879455 AS Decimal(9, 0)))
INSERT [dbo].[Pacientes] ([Paciente_Id], [Nombres], [Apellidos], [Fech_Nacimiento], [Edad], [Sexo], [Cedula], [Telefono], [Direccion], [ARS], [NSS]) VALUES (320, N'Antonio ', N'Cerda Cruz', CAST(N'1944-08-08' AS Date), N'77', N'M', CAST(4846684684 AS Decimal(11, 0)), CAST(8292680172 AS Decimal(10, 0)), N'Av. Abraham Lincoln No. 26 3r Nivel', N'Senasa', CAST(146669328 AS Decimal(9, 0)))
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes_Cama] ON 

INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (10, CAST(N'2022-01-25' AS Date), 118, 150)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (20, CAST(N'2022-01-30' AS Date), 2119, 170)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (30, CAST(N'2022-02-05' AS Date), 4120, 200)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (40, CAST(N'2022-02-06' AS Date), 24130, 220)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (50, CAST(N'2022-02-15' AS Date), 10123, 310)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (60, CAST(N'2022-02-28' AS Date), 12124, 250)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (70, CAST(N'2022-03-05' AS Date), 16126, 260)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (80, CAST(N'2022-03-18' AS Date), 6121, 280)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (90, CAST(N'2022-03-27' AS Date), 8122, 300)
INSERT [dbo].[Pacientes_Cama] ([PacienteCama_Id], [Fech_Asignacion], [Cama_Id], [Paciente_Id]) VALUES (100, CAST(N'2022-03-30' AS Date), 22129, 320)
SET IDENTITY_INSERT [dbo].[Pacientes_Cama] OFF
GO
SET IDENTITY_INSERT [dbo].[Planta] ON 

INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (114, N'Pediatria', 350)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (191, N'Materno', 600)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (268, N'Traumatologico', 650)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (345, N'Cardiologia', 250)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (422, N'Fisiatria', 150)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (499, N'Emergencia', 100)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (576, N'Dermatologia', 30)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (653, N'Consultorios', 18)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (730, N'Laboratorio', 2)
INSERT [dbo].[Planta] ([Planta_Id], [Nombre], [Numero_de_Camas]) VALUES (807, N'Ginecologia', 20)
SET IDENTITY_INSERT [dbo].[Planta] OFF
GO
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-01-26' AS Date), N'Fractura en la caja Toracica', 4120, 10)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-02-02' AS Date), N'Obstrucion en la carotida', 8122, 20)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-02-07' AS Date), N'Desgaste en la articulaciones', 20128, 30)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-02-07' AS Date), N'Fractura en las rodillas', 4120, 40)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-02-17' AS Date), N'Desgarre en el cuello uterino', 12124, 50)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-03-01' AS Date), N'Quistes en las tropas de falopio', 18127, 60)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-03-05' AS Date), N'Observacion por trombosis', 14125, 70)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-03-20' AS Date), N'Fiebre y diarrea', 16126, 80)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-03-30' AS Date), N'Perforacion en el pulmon izquierdo', 10123, 90)
INSERT [dbo].[Visita_Medica] ([Fech_Hora_Visita], [Diagnostico_Enfermedad], [Medico_Id], [PacienteCama_Id]) VALUES (CAST(N'2022-03-31' AS Date), N'Covid 19', 16126, 100)
GO
ALTER TABLE [dbo].[Camas]  WITH CHECK ADD FOREIGN KEY([planta_Id])
REFERENCES [dbo].[Planta] ([Planta_Id])
GO
ALTER TABLE [dbo].[Pacientes_Cama]  WITH CHECK ADD FOREIGN KEY([Cama_Id])
REFERENCES [dbo].[Camas] ([Cama_Id])
GO
ALTER TABLE [dbo].[Pacientes_Cama]  WITH CHECK ADD FOREIGN KEY([Paciente_Id])
REFERENCES [dbo].[Pacientes] ([Paciente_Id])
GO
ALTER TABLE [dbo].[Visita_Medica]  WITH CHECK ADD FOREIGN KEY([Medico_Id])
REFERENCES [dbo].[Medicos] ([Medico_Id])
GO
ALTER TABLE [dbo].[Visita_Medica]  WITH CHECK ADD FOREIGN KEY([PacienteCama_Id])
REFERENCES [dbo].[Pacientes_Cama] ([PacienteCama_Id])
GO
USE [master]
GO
ALTER DATABASE [Techno_Data_Solutions] SET  READ_WRITE 
GO
