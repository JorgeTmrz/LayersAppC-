USE [master]
GO
/****** Object:  Database [Bd_Condominios]    Script Date: 1/6/2020 1:22:54 p. m. ******/
CREATE DATABASE [Bd_Condominios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bd_Condominios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Bd_Condominios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bd_Condominios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Bd_Condominios_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bd_Condominios] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bd_Condominios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bd_Condominios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bd_Condominios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bd_Condominios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bd_Condominios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bd_Condominios] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bd_Condominios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bd_Condominios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bd_Condominios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bd_Condominios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bd_Condominios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bd_Condominios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bd_Condominios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bd_Condominios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bd_Condominios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bd_Condominios] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bd_Condominios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bd_Condominios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bd_Condominios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bd_Condominios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bd_Condominios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bd_Condominios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bd_Condominios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bd_Condominios] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bd_Condominios] SET  MULTI_USER 
GO
ALTER DATABASE [Bd_Condominios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bd_Condominios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bd_Condominios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bd_Condominios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bd_Condominios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bd_Condominios] SET QUERY_STORE = OFF
GO
USE [Bd_Condominios]
GO
/****** Object:  Table [dbo].[Manzana]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manzana](
	[Manzana_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Manzana] PRIMARY KEY CLUSTERED 
(
	[Manzana_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Edificio]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edificio](
	[Ediifcio_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
	[Manzana_id] [int] NOT NULL,
 CONSTRAINT [PK_Edificio] PRIMARY KEY CLUSTERED 
(
	[Ediifcio_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartamento]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartamento](
	[Apto_id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
	[Edificio_id] [int] NOT NULL,
 CONSTRAINT [PK_Apartamento] PRIMARY KEY CLUSTERED 
(
	[Apto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Persona_id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
	[Cedula] [nchar](25) NOT NULL,
	[Apto_id] [int] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Personas]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Personas] 
AS
SELECT P.Nombre Nombre, P.cedula Cedula, A.Nombre Apartamento, E.Nombre Edificio, M.Nombre Manzana  
FROM Persona P, Apartamento A, Edificio E, Manzana M
WHERE P.Apto_id = A.Apto_id AND a.Edificio_id = e.Ediifcio_Id AND E.Manzana_id = M.Manzana_Id
GO
/****** Object:  View [dbo].[vPersonasPorManzana]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPersonasPorManzana] AS
SELECT M.Nombre "Nombre de la Manzana", P.Nombre "Nombre del inquilino" 
FROM Manzana M, Persona P, Apartamento A, Edificio E 
WHERE P.Apto_id = A.Apto_id AND A.Edificio_id = E.Ediifcio_Id AND E.Manzana_id = M.Manzana_Id
GO
/****** Object:  View [dbo].[vPersonasPorEdifico]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPersonasPorEdifico] AS
SELECT E.Nombre "Edifico", P.Nombre "Nombre del inquilino" 
FROM Persona P, Apartamento A, Edificio E 
WHERE P.Apto_id = A.Apto_id AND A.Edificio_id = E.Ediifcio_Id
GO
ALTER TABLE [dbo].[Apartamento]  WITH CHECK ADD  CONSTRAINT [FK_Apartamento_Edificio] FOREIGN KEY([Edificio_id])
REFERENCES [dbo].[Edificio] ([Ediifcio_Id])
GO
ALTER TABLE [dbo].[Apartamento] CHECK CONSTRAINT [FK_Apartamento_Edificio]
GO
ALTER TABLE [dbo].[Edificio]  WITH CHECK ADD  CONSTRAINT [FK_Edificio_Manzana] FOREIGN KEY([Manzana_id])
REFERENCES [dbo].[Manzana] ([Manzana_Id])
GO
ALTER TABLE [dbo].[Edificio] CHECK CONSTRAINT [FK_Edificio_Manzana]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Apartamento] FOREIGN KEY([Apto_id])
REFERENCES [dbo].[Apartamento] ([Apto_id])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Apartamento]
GO
/****** Object:  StoredProcedure [dbo].[addPersonForProgram]    Script Date: 1/6/2020 1:22:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addPersonForProgram] @name VARCHAR, @idCard VARCHAR, @apartamento VARCHAR
AS
DECLARE @Apto_id INT
SET @Apto_id = (SELECT TOP 1 Apto_id FROM Apartamento WHERE Nombre = @apartamento)
INSERT INTO Persona(Nombre,Cedula,Apto_id) VALUES(@name,@idCard,@Apto_id);
GO
USE [master]
GO
ALTER DATABASE [Bd_Condominios] SET  READ_WRITE 
GO
