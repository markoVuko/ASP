USE [master]
GO
/****** Object:  Database [ASP.204.17]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE DATABASE [ASP.204.17]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASP.204.17', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ASP.204.17.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASP.204.17_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ASP.204.17_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ASP.204.17] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASP.204.17].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASP.204.17] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASP.204.17] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASP.204.17] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASP.204.17] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASP.204.17] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASP.204.17] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASP.204.17] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASP.204.17] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASP.204.17] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASP.204.17] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASP.204.17] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASP.204.17] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASP.204.17] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASP.204.17] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASP.204.17] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASP.204.17] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASP.204.17] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASP.204.17] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASP.204.17] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASP.204.17] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASP.204.17] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASP.204.17] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASP.204.17] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASP.204.17] SET  MULTI_USER 
GO
ALTER DATABASE [ASP.204.17] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASP.204.17] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASP.204.17] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASP.204.17] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASP.204.17] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASP.204.17] SET QUERY_STORE = OFF
GO
USE [ASP.204.17]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCase]    Script Date: 6/17/2021 6:32:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserUseCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210612114518_prva', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613235903_kom', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210614233008_config', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210616191138_cart', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210617023813_koncano', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, 2, 1, 1, CAST(N'2021-06-17T03:32:22.2712347' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:33:44.2464051' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, 1, 1, 11, CAST(N'2021-06-17T03:32:28.8707548' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:33:44.2466351' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, 1, 1, 20, CAST(N'2021-06-17T03:32:34.1935694' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:33:44.2466959' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, 11, 1, 9, CAST(N'2021-06-17T03:34:20.6453875' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:34:38.7972484' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, 4, 1, 25, CAST(N'2021-06-17T03:34:26.2761033' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:34:38.7973159' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, 1, 1, 12, CAST(N'2021-06-17T03:34:50.6646324' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, 1, 1, 4, CAST(N'2021-06-17T03:34:55.1561694' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, 1, 2, 21, CAST(N'2021-06-17T03:43:17.6608698' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:44:05.9720822' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, 2, 2, 6, CAST(N'2021-06-17T03:44:15.3437584' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:44:22.5869458' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, 1, 2, 8, CAST(N'2021-06-17T03:44:20.1090893' AS DateTime2), NULL, 1, CAST(N'2021-06-17T03:44:22.5869994' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, 7, 2, 14, CAST(N'2021-06-17T03:44:37.7217422' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, 1, 2, 2, CAST(N'2021-06-17T03:44:50.6288081' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, 1, 7, 18, CAST(N'2021-06-17T03:58:28.7951584' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:00:06.7366532' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, 1, 7, 4, CAST(N'2021-06-17T03:58:31.7117255' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:00:06.7366824' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, 1, 7, 15, CAST(N'2021-06-17T03:58:35.5148631' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:00:06.7367050' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, 3, 7, 11, CAST(N'2021-06-17T03:58:39.9818394' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:00:06.7367304' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, 1, 7, 21, CAST(N'2021-06-17T04:00:14.6703955' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:00:16.6822420' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, 1, 7, 25, CAST(N'2021-06-17T04:00:22.0352835' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, 4, 7, 2, CAST(N'2021-06-17T04:00:25.7121536' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, 1, 7, 1, CAST(N'2021-06-17T04:00:28.5336379' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, 3, 8, 3, CAST(N'2021-06-17T04:09:05.1593698' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:10:12.0661314' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, 1, 8, 25, CAST(N'2021-06-17T04:09:14.1460833' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:10:12.0664150' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, 4, 8, 7, CAST(N'2021-06-17T04:09:19.8730336' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:10:12.0664639' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, 1, 8, 15, CAST(N'2021-06-17T04:10:20.9208951' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:10:23.3273779' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, 2, 8, 19, CAST(N'2021-06-17T04:10:30.0050586' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:10:34.1077203' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, 1, 8, 6, CAST(N'2021-06-17T04:10:44.3997777' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, 1, 10, 14, CAST(N'2021-06-17T04:20:26.5317149' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:20:59.1997186' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, 3, 10, 1, CAST(N'2021-06-17T04:21:16.0520962' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:21:19.6804215' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, 1, 10, 1, CAST(N'2021-06-17T04:21:30.4519418' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:21:38.8619982' AS DateTime2), 0)
INSERT [dbo].[CartItems] ([Id], [Amount], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, 1, 10, 2, CAST(N'2021-06-17T04:21:35.4167850' AS DateTime2), NULL, 1, CAST(N'2021-06-17T04:21:38.8621103' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Shoes', N'The most comfortable shoes!', N'3aa2eae5-501f-4090-86ed-0c14a30515e8.jpg', CAST(N'2021-06-17T02:56:34.3965021' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Slippers', N'Very warm and fashionable slippers!', N'694b9501-56f9-4e6f-bd61-d47228196708.jpg', CAST(N'2021-06-17T02:57:10.3552989' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Boots', N'Waterproof and resistant boots!', N'119b312b-c327-48fb-b726-4049d56e829b.png', CAST(N'2021-06-17T02:57:28.0408192' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Pants', N'Pants for all occasions!', N'313896d0-a52c-4b5a-892f-771cea29491d.jpg', CAST(N'2021-06-17T02:57:54.4570813' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Socks', N'Winter and summer socks!', N'dce257e1-d1f3-4c41-8062-d268f8ecc305.jpg', CAST(N'2021-06-17T02:58:18.2073530' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Jackets', N'Both light and very warm jackets!', N'21c75c8c-6450-4f44-83c2-d79d4f734f24.jpg', CAST(N'2021-06-17T02:58:46.2315484' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'This is a cool product!', 1, 1, CAST(N'2021-06-17T03:21:56.9979263' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Not bad...', 1, 4, CAST(N'2021-06-17T03:22:06.0939809' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Could be better', 1, 7, CAST(N'2021-06-17T03:22:13.3085136' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Fantastic!', 1, 12, CAST(N'2021-06-17T03:22:22.9048014' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Amazing!!!', 1, 13, CAST(N'2021-06-17T03:22:31.1422318' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Pretty useful, would recommend', 1, 21, CAST(N'2021-06-17T03:22:41.0808339' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'Kinda ok I suppose.', 2, 19, CAST(N'2021-06-17T03:41:00.5630157' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'Genuinely great!', 2, 12, CAST(N'2021-06-17T03:41:24.8744173' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'Meh', 2, 1, CAST(N'2021-06-17T03:41:32.2329702' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'It''s pretty good, honestly.', 2, 11, CAST(N'2021-06-17T03:41:41.8785200' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'AWful! Do NOT buy!', 2, 24, CAST(N'2021-06-17T03:41:53.0329661' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'Worth the money, but not much more.', 2, 3, CAST(N'2021-06-17T03:45:11.6233828' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'Worth the money, but not much more.', 2, 3, CAST(N'2021-06-17T03:45:11.7636358' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'Fantastic product', 7, 12, CAST(N'2021-06-17T03:55:42.2052540' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'Decent', 7, 13, CAST(N'2021-06-17T03:55:51.5180974' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'Not bad at all for this price', 7, 5, CAST(N'2021-06-17T03:56:00.5159366' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'Stay away!!!', 7, 16, CAST(N'2021-06-17T03:56:10.3441753' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'Useful around the house', 7, 22, CAST(N'2021-06-17T03:56:22.4417446' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'I LOVE THIS PRODUCT!', 7, 18, CAST(N'2021-06-17T03:57:24.5766260' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'Not sure whether to recommend it', 7, 17, CAST(N'2021-06-17T03:57:36.5179684' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'This is a good enough product', 8, 15, CAST(N'2021-06-17T04:07:32.7119719' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'This product is terrible', 8, 21, CAST(N'2021-06-17T04:07:55.0541042' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'I am very satisfied with this!', 8, 3, CAST(N'2021-06-17T04:08:10.7420510' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'Terrific indeed!', 8, 9, CAST(N'2021-06-17T04:08:22.5376218' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'Never buying this again...', 8, 25, CAST(N'2021-06-17T04:08:34.4433321' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, N'Yep, I like this product', 9, 16, CAST(N'2021-06-17T04:14:53.5108179' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, N'Not bad at all', 9, 5, CAST(N'2021-06-17T04:15:02.4244259' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, N'Decent-ish', 9, 11, CAST(N'2021-06-17T04:15:13.3835737' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, N'Would absolutelly never ever recommend this to anyone', 9, 20, CAST(N'2021-06-17T04:15:28.8378915' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, N'Buy! buy! buy! This is just great!', 10, 12, CAST(N'2021-06-17T04:19:31.1164469' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, N'Best. Product. Ever.', 10, 6, CAST(N'2021-06-17T04:19:44.1222339' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ProductId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, N'I highly recommend!', 10, 18, CAST(N'2021-06-17T04:19:54.8682254' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProducts] ON 

INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'650ab732-88eb-4b67-b55f-905ec2bf79fc.jpg', N'Comfy Jacket', 2, 127, 1, 1, CAST(N'2021-06-17T05:33:44.2330000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'0b29fab6-e31d-4b20-8eec-29696a0bd5a8.jpg', N'Fancy Pants', 1, 84, 11, 1, CAST(N'2021-06-17T05:33:44.2330000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'2b46c978-69a0-4058-8ded-f815a35c9720.jpg', N'Sport Socks', 1, 21, 20, 1, CAST(N'2021-06-17T05:33:44.2330000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'57c374dc-91b6-4588-8f7a-bc579cb50ed2.jpg', N'Casual Pants', 11, 75, 9, 2, CAST(N'2021-06-17T05:34:38.7900000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'7fe2dd11-0eac-4fc0-82ca-42e893362b1d.jpg', N'Classic Allstar Shoes', 4, 75, 25, 2, CAST(N'2021-06-17T05:34:38.7900000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'904c5df9-5266-4215-bcf1-8f760f74be48.jpg', N'Running Shoes', 1, 55, 21, 3, CAST(N'2021-06-17T05:44:05.9630000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'1c650cdc-9d7d-402c-bf94-7e06d4961dee.jpg', N'Impressive Boots', 2, 92, 6, 4, CAST(N'2021-06-17T05:44:22.5830000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'ce7bc604-3b98-4892-b8d6-7a771a7a7da1.jpg', N'Extreme Boots', 1, 104, 8, 4, CAST(N'2021-06-17T05:44:22.5830000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'9e7660c9-457c-455b-9b65-c03a199ff668.jpg', N'Winter Socks', 1, 23, 18, 5, CAST(N'2021-06-17T06:00:06.7300000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'1dae2910-d403-43aa-91bf-b94c5a6d05b3.jpg', N'Deluxe Jacket', 1, 175, 4, 5, CAST(N'2021-06-17T06:00:06.7300000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'fb7f1006-5a26-46cd-8a20-75dbd87b5886.jpg', N'Slipperinos', 1, 25, 15, 5, CAST(N'2021-06-17T06:00:06.7300000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'0b29fab6-e31d-4b20-8eec-29696a0bd5a8.jpg', N'Fancy Pants', 3, 84, 11, 5, CAST(N'2021-06-17T06:00:06.7300000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'904c5df9-5266-4215-bcf1-8f760f74be48.jpg', N'Running Shoes', 1, 55, 21, 6, CAST(N'2021-06-17T06:00:16.6770000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'225a52a0-b80c-4017-b1e5-e3dc29242c40.jpg', N'Super Jacket', 3, 133, 3, 7, CAST(N'2021-06-17T06:10:12.0370000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'7fe2dd11-0eac-4fc0-82ca-42e893362b1d.jpg', N'Classic Allstar Shoes', 1, 75, 25, 7, CAST(N'2021-06-17T06:10:12.0370000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'9d57acfd-a9d1-49cc-95b3-bc392263b86d.jpg', N'Rainy Boots', 4, 92, 7, 7, CAST(N'2021-06-17T06:10:12.0370000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'fb7f1006-5a26-46cd-8a20-75dbd87b5886.jpg', N'Slipperinos', 1, 25, 15, 8, CAST(N'2021-06-17T06:10:23.3230000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'f5901d40-c9d7-452e-a944-14d4ae3b1760.jpg', N'Classic Socks', 2, 20, 19, 9, CAST(N'2021-06-17T06:10:34.1000000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'60852309-0bfc-4442-9e8d-d3d955a2c202.jpg', N'Mobile Slippers', 1, 27, 14, 13, CAST(N'2021-06-17T06:20:59.1730000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'650ab732-88eb-4b67-b55f-905ec2bf79fc.jpg', N'Comfy Jacket', 3, 127, 1, 14, CAST(N'2021-06-17T06:21:19.6700000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'650ab732-88eb-4b67-b55f-905ec2bf79fc.jpg', N'Comfy Jacket', 1, 127, 1, 15, CAST(N'2021-06-17T06:21:38.8570000' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderProducts] ([Id], [Image], [Name], [Amount], [Price], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'ba29df4a-6369-4074-a52a-601d6143ca33.jpg', N'Cool Jacket', 1, 105, 2, 15, CAST(N'2021-06-17T06:21:38.8570000' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[OrderProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Adminko', N'Adminkovic', N'admin@gmail.com', N'066323444', N'Serbia', N'Belgrade', N'ADresa 123', 1, CAST(N'2021-06-17T03:33:44.2170855' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Adminko', N'Adminkovic', N'admin@gmail.com', N'066323444', N'Serbia', N'Belgrade', N'ADresa 123', 1, CAST(N'2021-06-17T03:34:38.7888199' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Mirko', N'Mirkovic', N'mirko@gmail.com', N'062343566', N'Serbia', N'Novi Sad', N'Ulica 17', 2, CAST(N'2021-06-17T03:44:05.9585816' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Mirko', N'Mirkovic', N'mirko@gmail.com', N'062343566', N'Serbia', N'Novi Sad', N'Ulica 17', 2, CAST(N'2021-06-17T03:44:22.5858282' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Jovan', N'Petrovic', N'jovpet@gmail.com', N'06777777', N'Montenegro', N'Podgorica', N'Primorska 9', 7, CAST(N'2021-06-17T04:00:06.7296526' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Jovan', N'Petrovic', N'jovpet@gmail.com', N'06777777', N'Montenegro', N'Podgorica', N'Primorska 9', 7, CAST(N'2021-06-17T04:00:16.6723118' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'Goran', N'Ilic', N'gilic@gmail.com', N'066747223', N'Serbia', N'Belgrade', N'Jovanska 7', 8, CAST(N'2021-06-17T04:10:12.0025733' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'Goran', N'Ilic', N'gilic@gmail.com', N'066747223', N'Serbia', N'Belgrade', N'Jovanska 7', 8, CAST(N'2021-06-17T04:10:23.3224559' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'Goran', N'Ilic', N'gilic@gmail.com', N'066747223', N'Serbia', N'Belgrade', N'Jovanska 7', 8, CAST(N'2021-06-17T04:10:34.0946656' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'Mirko', N'Dragisic', N'dragisic@yahoo.co', N'062112233', N'Serbia', N'Cacak', N'Cacanska 1', 9, CAST(N'2021-06-17T04:16:27.4786050' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'Mirko', N'Dragisic', N'dragisic@yahoo.co', N'062112233', N'Serbia', N'Cacak', N'Cacanska 1', 9, CAST(N'2021-06-17T04:16:38.7308763' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'Mirko', N'Dragisic', N'dragisic@yahoo.co', N'062112233', N'Serbia', N'Cacak', N'Cacanska 1', 9, CAST(N'2021-06-17T04:17:00.9755038' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'Petar', N'Milovanovic', N'hohoho@gmail.com', N'06577385', N'Serbia', N'Belgrade', N'Cvijiceva 91', 10, CAST(N'2021-06-17T04:20:59.1690851' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'Petar', N'Milovanovic', N'hohoho@gmail.com', N'06577385', N'Serbia', N'Belgrade', N'Cvijiceva 91', 10, CAST(N'2021-06-17T04:21:19.6711004' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [FirstName], [LastName], [Email], [Phone], [Country], [City], [Address], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'Petar', N'Milovanovic', N'hohoho@gmail.com', N'06577385', N'Serbia', N'Belgrade', N'Cvijiceva 91', 10, CAST(N'2021-06-17T04:21:38.8443422' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Comfy Jacket', 127, N'This is a very comfy jacket!', N'650ab732-88eb-4b67-b55f-905ec2bf79fc.jpg', 6, CAST(N'2021-06-17T03:01:41.3575973' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Cool Jacket', 105, N'This is a very cool jacket!', N'ba29df4a-6369-4074-a52a-601d6143ca33.jpg', 6, CAST(N'2021-06-17T03:02:03.3593319' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Super Jacket', 133, N'Now this is a super jacket!', N'225a52a0-b80c-4017-b1e5-e3dc29242c40.jpg', 6, CAST(N'2021-06-17T03:02:21.5513829' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Deluxe Jacket', 175, N'Now this is a super jacket!', N'1dae2910-d403-43aa-91bf-b94c5a6d05b3.jpg', 6, CAST(N'2021-06-17T03:02:42.4680935' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Regular Boots', 85, N'Just your regular boots.', N'637421c7-8ebf-489d-a892-07962f696f79.jpg', 3, CAST(N'2021-06-17T03:04:58.3607898' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Impressive Boots', 92, N'This boots are very impressive.', N'1c650cdc-9d7d-402c-bf94-7e06d4961dee.jpg', 3, CAST(N'2021-06-17T03:05:17.0594371' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'Rainy Boots', 92, N'Boots made for the toughest rain.', N'9d57acfd-a9d1-49cc-95b3-bc392263b86d.jpg', 3, CAST(N'2021-06-17T03:05:35.9854717' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'Extreme Boots', 104, N'These boots are extreme!', N'ce7bc604-3b98-4892-b8d6-7a771a7a7da1.jpg', 3, CAST(N'2021-06-17T03:05:59.1763087' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'Casual Pants', 75, N'Very, very casual pants.', N'57c374dc-91b6-4588-8f7a-bc579cb50ed2.jpg', 4, CAST(N'2021-06-17T03:07:59.6728414' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'Winter Pants', 84, N'Warm pants for the winter.', N'49df2533-51da-4a73-b272-f2340f79b739.jpg', 4, CAST(N'2021-06-17T03:08:16.6108465' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'Fancy Pants', 84, N'The fanciest of pants!', N'0b29fab6-e31d-4b20-8eec-29696a0bd5a8.jpg', 4, CAST(N'2021-06-17T03:08:41.6622233' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'Camo Pants', 89, N'These pants will hide you in the forest!', N'17eed6ac-356a-4b1a-aff4-c3701411282e.jpg', 4, CAST(N'2021-06-17T03:09:03.7044582' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'Nice Slippers', 32, N'Hey, these slippers are pretty good!', N'7004ea67-ec59-445c-9fd6-dcaef625124e.jpg', 2, CAST(N'2021-06-17T03:10:30.3487663' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'Mobile Slippers', 27, N'You''re gonna be very fast in these slippers!', N'60852309-0bfc-4442-9e8d-d3d955a2c202.jpg', 2, CAST(N'2021-06-17T03:10:54.2225484' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'Slipperinos', 25, N'The slippiest of slippers!', N'fb7f1006-5a26-46cd-8a20-75dbd87b5886.jpg', 2, CAST(N'2021-06-17T03:11:17.0509224' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'Pijama Socks', 15, N'These socks are excellent for sleeping in!', N'4ee118b5-3ece-4712-b396-0b62787b8bfd.jpg', 5, CAST(N'2021-06-17T03:12:55.0221843' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'Silk Socks', 18, N'Extremely smooth silky socks!', N'bdc6f80d-f16e-4a78-9d2a-84b40f36a85c.jpg', 5, CAST(N'2021-06-17T03:13:13.9580090' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'Winter Socks', 23, N'Very warm, and very cozy!', N'9e7660c9-457c-455b-9b65-c03a199ff668.jpg', 5, CAST(N'2021-06-17T03:13:34.7421385' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'Classic Socks', 20, N'Can''t go wrong with these socks.', N'f5901d40-c9d7-452e-a944-14d4ae3b1760.jpg', 5, CAST(N'2021-06-17T03:14:06.9924758' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'Sport Socks', 21, N'Sport socks, allowing for extra air!', N'2b46c978-69a0-4058-8ded-f815a35c9720.jpg', 5, CAST(N'2021-06-17T03:14:30.4369396' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'Running Shoes', 55, N'Fast shoes for running!', N'904c5df9-5266-4215-bcf1-8f760f74be48.jpg', 1, CAST(N'2021-06-17T03:16:21.5895319' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'Office Shoes', 60, N'Comfortable but sleek shoes for the office.', N'fd492e20-a827-4df4-bfa0-fadf55082ffc.jpg', 1, CAST(N'2021-06-17T03:16:48.6287697' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'Hiking Shoes', 67, N'For the active hikers!', N'5c44d8c2-615e-4b78-86a9-4a16fc79347e.jpg', 1, CAST(N'2021-06-17T03:17:10.9776287' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'Autumn Shoes', 62, N'Shoes that will endure the rain.', N'e6b5cd76-04cb-479e-9c16-db01bc958f59.jpg', 1, CAST(N'2021-06-17T03:17:34.3689379' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [Image], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'Classic Allstar Shoes', 75, N'Allstar shoes that everyone enjoys.', N'7fe2dd11-0eac-4fc0-82ca-42e893362b1d.jpg', 1, CAST(N'2021-06-17T03:18:02.4633680' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Admin', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-17T02:50:05.0788034' AS DateTime2), 0, NULL, 0)
INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Customer', CAST(N'2021-06-17T02:50:23.1181549' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Roles] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Regular', CAST(N'2021-06-17T02:50:37.0867883' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Register User Command', N'Anonymous', N'{"Username":"admin","Password":"admin123123","FirstName":"Adminko","LastName":"Adminkovic","Email":"admin@gmail.com","Country":"Serbia","City":"Belgrade","Address":"Adresa 123","RoleId":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Edit Role Command', N'admin', N'{"Id":1,"Name":"Admin"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Get Roles Query', N'admin', N'{"Name":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Create Role Command', N'admin', N'{"Id":0,"Name":"Customer"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Create Role Command', N'admin', N'{"Id":0,"Name":"Regular"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Create Category Command', N'admin', N'{"Id":0,"Name":"Shoes","Description":"The most comfortable shoes!","Image":"3aa2eae5-501f-4090-86ed-0c14a30515e8.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"shoes.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"shoes.jpg\""],"Content-Type":["image/jpeg"]},"Length":28010,"Name":"FormImage","FileName":"shoes.jpg"}}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'Get Categories Query', N'admin', N'{"Name":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'Create Category Command', N'admin', N'{"Id":0,"Name":"Slippers","Description":"Very warm and fashionable slippers!","Image":"694b9501-56f9-4e6f-bd61-d47228196708.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"slippers.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"slippers.jpg\""],"Content-Type":["image/jpeg"]},"Length":61938,"Name":"FormImage","FileName":"slippers.jpg"}}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'Create Category Command', N'admin', N'{"Id":0,"Name":"Boots","Description":"Waterproof and resistant boots!","Image":"119b312b-c327-48fb-b726-4049d56e829b.png","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"image_2021-06-17_045725.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"image_2021-06-17_045725.png\""],"Content-Type":["image/png"]},"Length":2766788,"Name":"FormImage","FileName":"image_2021-06-17_045725.png"}}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'Get Categories Query', N'admin', N'{"Name":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, N'Create Category Command', N'admin', N'{"Id":0,"Name":"Pants","Description":"Pants for all occasions!","Image":"313896d0-a52c-4b5a-892f-771cea29491d.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"pants.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"pants.jpg\""],"Content-Type":["image/jpeg"]},"Length":465664,"Name":"FormImage","FileName":"pants.jpg"}}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, N'Create Category Command', N'admin', N'{"Id":0,"Name":"Pants","Description":"Pants for all occasions!","Image":"a4781735-2571-4ccc-a7b2-a0ef3f216e0e.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"pants.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"pants.jpg\""],"Content-Type":["image/jpeg"]},"Length":465664,"Name":"FormImage","FileName":"pants.jpg"}}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, N'Create Category Command', N'admin', N'{"Id":0,"Name":"Socks","Description":"Winter and summer socks!","Image":"dce257e1-d1f3-4c41-8062-d268f8ecc305.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"socks.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"socks.jpg\""],"Content-Type":["image/jpeg"]},"Length":19368,"Name":"FormImage","FileName":"socks.jpg"}}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, N'Create Category Command', N'admin', N'{"Id":0,"Name":"Jackets","Description":"Both light and very warm jackets!","Image":"21c75c8c-6450-4f44-83c2-d79d4f734f24.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"jackets.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"jackets.jpg\""],"Content-Type":["image/jpeg"]},"Length":89732,"Name":"FormImage","FileName":"jackets.jpg"}}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, N'Get Categories Query', N'admin', N'{"Name":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Comfy Jacket","Price":127,"Description":"This is a very comfy jacket!","Image":"650ab732-88eb-4b67-b55f-905ec2bf79fc.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"jacket1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"jacket1.jpg\""],"Content-Type":["image/jpeg"]},"Length":368804,"Name":"FormImage","FileName":"jacket1.jpg"},"Category":null,"CategoryId":6,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Cool Jacket","Price":127,"Description":"This is a very cool jacket!","Image":"ba29df4a-6369-4074-a52a-601d6143ca33.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"jacket2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"jacket2.jpg\""],"Content-Type":["image/jpeg"]},"Length":82539,"Name":"FormImage","FileName":"jacket2.jpg"},"Category":null,"CategoryId":6,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Super Jacket","Price":127,"Description":"Now this is a super jacket!","Image":"225a52a0-b80c-4017-b1e5-e3dc29242c40.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"jacket3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"jacket3.jpg\""],"Content-Type":["image/jpeg"]},"Length":79523,"Name":"FormImage","FileName":"jacket3.jpg"},"Category":null,"CategoryId":6,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Deluxe Jacket","Price":175,"Description":"Now this is a super jacket!","Image":"1dae2910-d403-43aa-91bf-b94c5a6d05b3.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"jacket4.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"jacket4.jpg\""],"Content-Type":["image/jpeg"]},"Length":132865,"Name":"FormImage","FileName":"jacket4.jpg"},"Category":null,"CategoryId":6,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Regular Boots","Price":85,"Description":"Just your regular boots.","Image":"637421c7-8ebf-489d-a892-07962f696f79.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"boot4.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"boot4.jpg\""],"Content-Type":["image/jpeg"]},"Length":19266,"Name":"FormImage","FileName":"boot4.jpg"},"Category":null,"CategoryId":3,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Impressive Boots","Price":92,"Description":"This boots are very impressive.","Image":"1c650cdc-9d7d-402c-bf94-7e06d4961dee.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"boot3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"boot3.jpg\""],"Content-Type":["image/jpeg"]},"Length":33179,"Name":"FormImage","FileName":"boot3.jpg"},"Category":null,"CategoryId":3,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Rainy Boots","Price":92,"Description":"Boots made for the toughest rain.","Image":"9d57acfd-a9d1-49cc-95b3-bc392263b86d.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"boot2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"boot2.jpg\""],"Content-Type":["image/jpeg"]},"Length":478090,"Name":"FormImage","FileName":"boot2.jpg"},"Category":null,"CategoryId":3,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Extreme Boots","Price":104,"Description":"These boots are extreme!","Image":"ce7bc604-3b98-4892-b8d6-7a771a7a7da1.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"boot1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"boot1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65563,"Name":"FormImage","FileName":"boot1.jpg"},"Category":null,"CategoryId":3,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Casual Pants","Price":75,"Description":"Very, very casual pants.","Image":"57c374dc-91b6-4588-8f7a-bc579cb50ed2.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"pants3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"pants3.jpg\""],"Content-Type":["image/jpeg"]},"Length":38636,"Name":"FormImage","FileName":"pants3.jpg"},"Category":null,"CategoryId":4,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Winter Pants","Price":84,"Description":"Warm pants for the winter.","Image":"49df2533-51da-4a73-b272-f2340f79b739.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"pants4.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"pants4.jpg\""],"Content-Type":["image/jpeg"]},"Length":39293,"Name":"FormImage","FileName":"pants4.jpg"},"Category":null,"CategoryId":4,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Fancy Pants","Price":84,"Description":"The fanciest of pants!","Image":"0b29fab6-e31d-4b20-8eec-29696a0bd5a8.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"pants1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"pants1.jpg\""],"Content-Type":["image/jpeg"]},"Length":18289,"Name":"FormImage","FileName":"pants1.jpg"},"Category":null,"CategoryId":4,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Camo Pants","Price":89,"Description":"These pants will hide you in the forest!","Image":"17eed6ac-356a-4b1a-aff4-c3701411282e.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"pants2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"pants2.jpg\""],"Content-Type":["image/jpeg"]},"Length":98867,"Name":"FormImage","FileName":"pants2.jpg"},"Category":null,"CategoryId":4,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":2}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (35, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Nice Slippers","Price":32,"Description":"Hey, these slippers are pretty good!","Image":"7004ea67-ec59-445c-9fd6-dcaef625124e.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"slippers3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"slippers3.jpg\""],"Content-Type":["image/jpeg"]},"Length":343233,"Name":"FormImage","FileName":"slippers3.jpg"},"Category":null,"CategoryId":2,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (36, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Mobile Slippers","Price":27,"Description":"You''re gonna be very fast in these slippers!","Image":"60852309-0bfc-4442-9e8d-d3d955a2c202.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"slippers2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"slippers2.jpg\""],"Content-Type":["image/jpeg"]},"Length":53877,"Name":"FormImage","FileName":"slippers2.jpg"},"Category":null,"CategoryId":2,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (37, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Slipperinos","Price":25,"Description":"The slippiest of slippers!","Image":"fb7f1006-5a26-46cd-8a20-75dbd87b5886.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"slippers1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"slippers1.jpg\""],"Content-Type":["image/jpeg"]},"Length":18909,"Name":"FormImage","FileName":"slippers1.jpg"},"Category":null,"CategoryId":2,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (38, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Pijama Socks","Price":15,"Description":"These socks are excellent for sleeping in!","Image":"4ee118b5-3ece-4712-b396-0b62787b8bfd.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"socks5.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"socks5.jpg\""],"Content-Type":["image/jpeg"]},"Length":173829,"Name":"FormImage","FileName":"socks5.jpg"},"Category":null,"CategoryId":5,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (39, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Silk Socks","Price":18,"Description":"Extremely smooth silky socks!","Image":"bdc6f80d-f16e-4a78-9d2a-84b40f36a85c.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"socks4.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"socks4.jpg\""],"Content-Type":["image/jpeg"]},"Length":38141,"Name":"FormImage","FileName":"socks4.jpg"},"Category":null,"CategoryId":5,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (40, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Winter Socks","Price":23,"Description":"Very warm, and very cozy!","Image":"9e7660c9-457c-455b-9b65-c03a199ff668.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"socks3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"socks3.jpg\""],"Content-Type":["image/jpeg"]},"Length":31219,"Name":"FormImage","FileName":"socks3.jpg"},"Category":null,"CategoryId":5,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (41, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Classic Socks","Price":20,"Description":"Can''t go wrong with these socks.","Image":"f5901d40-c9d7-452e-a944-14d4ae3b1760.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"socks2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"socks2.jpg\""],"Content-Type":["image/jpeg"]},"Length":171696,"Name":"FormImage","FileName":"socks2.jpg"},"Category":null,"CategoryId":5,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (42, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Sport Socks","Price":21,"Description":"Sport socks, allowing for extra air!","Image":"2b46c978-69a0-4058-8ded-f815a35c9720.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"socks1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"socks1.jpg\""],"Content-Type":["image/jpeg"]},"Length":63740,"Name":"FormImage","FileName":"socks1.jpg"},"Category":null,"CategoryId":5,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (43, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (44, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":2}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (45, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Running Shoes","Price":55,"Description":"Fast shoes for running!","Image":"904c5df9-5266-4215-bcf1-8f760f74be48.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"shoes1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"shoes1.jpg\""],"Content-Type":["image/jpeg"]},"Length":16630,"Name":"FormImage","FileName":"shoes1.jpg"},"Category":null,"CategoryId":1,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (46, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Office Shoes","Price":60,"Description":"Comfortable but sleek shoes for the office.","Image":"fd492e20-a827-4df4-bfa0-fadf55082ffc.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"shoes2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"shoes2.jpg\""],"Content-Type":["image/jpeg"]},"Length":162475,"Name":"FormImage","FileName":"shoes2.jpg"},"Category":null,"CategoryId":1,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (47, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Hiking Shoes","Price":67,"Description":"For the active hikers!","Image":"5c44d8c2-615e-4b78-86a9-4a16fc79347e.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"shoes3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"shoes3.jpg\""],"Content-Type":["image/jpeg"]},"Length":11961,"Name":"FormImage","FileName":"shoes3.jpg"},"Category":null,"CategoryId":1,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (48, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Autumn Shoes","Price":62,"Description":"Shoes that will endure the rain.","Image":"e6b5cd76-04cb-479e-9c16-db01bc958f59.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"shoes5.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"shoes5.jpg\""],"Content-Type":["image/jpeg"]},"Length":126769,"Name":"FormImage","FileName":"shoes5.jpg"},"Category":null,"CategoryId":1,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (49, N'Create Product Command', N'admin', N'{"Id":0,"Name":"Classic Allstar Shoes","Price":75,"Description":"Allstar shoes that everyone enjoys.","Image":"7fe2dd11-0eac-4fc0-82ca-42e893362b1d.jpg","FormImage":{"ContentDisposition":"form-data; name=\"FormImage\"; filename=\"shoes4.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"FormImage\"; filename=\"shoes4.jpg\""],"Content-Type":["image/jpeg"]},"Length":8370,"Name":"FormImage","FileName":"shoes4.jpg"},"Category":null,"CategoryId":1,"Comments":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (50, N'Get Products Query', N'admin', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":2}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (51, N'Create Comment Command', N'admin', N'{"Id":0,"Content":"This is a cool product!","Username":null,"UserId":0,"ProductId":1,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (52, N'Create Comment Command', N'admin', N'{"Id":0,"Content":"Not bad...","Username":null,"UserId":0,"ProductId":4,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (53, N'Create Comment Command', N'admin', N'{"Id":0,"Content":"Could be better","Username":null,"UserId":0,"ProductId":7,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (54, N'Create Comment Command', N'admin', N'{"Id":0,"Content":"Fantastic!","Username":null,"UserId":0,"ProductId":12,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (55, N'Create Comment Command', N'admin', N'{"Id":0,"Content":"Amazing!!!","Username":null,"UserId":0,"ProductId":13,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (56, N'Create Comment Command', N'admin', N'{"Id":0,"Content":"Pretty useful, would recommend","Username":null,"UserId":0,"ProductId":21,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (57, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":2,"Username":null,"Product":null,"ProductId":1,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (58, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":2,"Username":null,"Product":null,"ProductId":1,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (59, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":11,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (60, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":20,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (61, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (62, N'Create Order Command', N'admin', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Adminko","LastName":"Adminkovic","Email":"admin@gmail.com","Phone":"066323444","Country":"Serbia","City":"Belgrade","Address":"ADresa 123","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (63, N'Get Orders Query', N'admin', N'{"FirstName":null,"LastName":null,"Email":null,"Phone":null,"Country":null,"City":null,"Address":null,"Username":null,"ProductName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (64, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (65, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":11,"Username":null,"Product":null,"ProductId":9,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (66, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":4,"Username":null,"Product":null,"ProductId":25,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (67, N'Create Order Command', N'admin', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Adminko","LastName":"Adminkovic","Email":"admin@gmail.com","Phone":"066323444","Country":"Serbia","City":"Belgrade","Address":"ADresa 123","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (68, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":12,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (69, N'Create Cart Item Command', N'admin', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":4,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (70, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (71, N'Register User Command', N'Anonymous', N'{"Username":"kor99","Password":"pw123123","FirstName":"Mirko","LastName":"Mirkovic","Email":"kor@gmail.com","Country":"Serbia","City":"Novi Sad","Address":"Ulica 111"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (72, N'Get Comments Query', N'kor99', N'{"Content":null,"Username":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (73, N'Edit Comment Command', N'kor99', N'{"Id":1,"Content":"asdfsadf","Username":null,"UserId":0,"ProductId":0,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (74, N'Edit Comment Command', N'kor99', N'{"Id":1,"Content":"asdfsadf","Username":null,"UserId":0,"ProductId":1,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (75, N'Get Comments Query', N'kor99', N'{"Content":null,"Username":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (76, N'Create Comment Command', N'kor99', N'{"Id":0,"Content":"Kinda ok I suppose.","Username":null,"UserId":0,"ProductId":19,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (77, N'Create Comment Command', N'kor99', N'{"Id":0,"Content":"Genuinely great!","Username":null,"UserId":0,"ProductId":12,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (78, N'Create Comment Command', N'kor99', N'{"Id":0,"Content":"Meh","Username":null,"UserId":0,"ProductId":1,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (79, N'Create Comment Command', N'kor99', N'{"Id":0,"Content":"It''s pretty good, honestly.","Username":null,"UserId":0,"ProductId":11,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (80, N'Create Comment Command', N'kor99', N'{"Id":0,"Content":"AWful! Do NOT buy!","Username":null,"UserId":0,"ProductId":24,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (81, N'Create Cart Item Command', N'kor99', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":21,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (82, N'Create Order Command', N'kor99', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Mirko","LastName":"Mirkovic","Email":"mirko@gmail.com","Phone":"062343566","Country":"Serbia","City":"Novi Sad","Address":"Ulica 17","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (83, N'Create Cart Item Command', N'kor99', N'{"Id":0,"Amount":2,"Username":null,"Product":null,"ProductId":6,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (84, N'Create Cart Item Command', N'kor99', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":8,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (85, N'Create Order Command', N'kor99', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Mirko","LastName":"Mirkovic","Email":"mirko@gmail.com","Phone":"062343566","Country":"Serbia","City":"Novi Sad","Address":"Ulica 17","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (86, N'Create Cart Item Command', N'kor99', N'{"Id":0,"Amount":7,"Username":null,"Product":null,"ProductId":14,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (87, N'Create Cart Item Command', N'kor99', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":2,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (88, N'Create Comment Command', N'kor99', N'{"Id":0,"Content":"Worth the money, but not much more.","Username":null,"UserId":0,"ProductId":3,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (89, N'Create Comment Command', N'kor99', N'{"Id":0,"Content":"Worth the money, but not much more.","Username":null,"UserId":0,"ProductId":3,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (90, N'Register User Command', N'Anonymous', N'{"Username":"miomir_12","Password":"mio12mir","FirstName":"Miomir","LastName":"Jovanovic","Email":"mio@gmail.com","Country":"Croatia","City":"Zagreb","Address":"Zagrebacka 55"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (91, N'Register User Command', N'Anonymous', N'{"Username":"ste-fan","Password":"lozinka555","FirstName":"Stefan","LastName":"Despotovic","Email":"steFAN@gmail.com","Country":"Serbia","City":"Belgrade","Address":"Goce Delceva 70"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (92, N'Register User Command', N'Anonymous', N'{"Username":"u_s_e_r","Password":"p_w_123_123","FirstName":"Isidora","LastName":"Stefanovski","Email":"isidora676@gmail.com","Country":"Serbia","City":"Kragujevac","Address":"Pionirska 9"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (93, N'Register User Command', N'Anonymous', N'{"Username":"imeimeime","Password":"lozzzinka5","FirstName":"Dragana","LastName":"Milisavljevic","Email":"dragaana@gmail.com","Country":"Serbia","City":"Pancevo","Address":"Bulevarska 23"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (94, N'Register User Command', N'Anonymous', N'{"Username":"nanananana","Password":"logovanje00","FirstName":"Jovan","LastName":"Petrovic","Email":"jovpet@gmail.com","Country":"Montenegro","City":"Podgorica","Address":"Primorska 9"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (95, N'Create Comment Command', N'nanananana', N'{"Id":0,"Content":"Fantastic product","Username":null,"UserId":0,"ProductId":12,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (96, N'Create Comment Command', N'nanananana', N'{"Id":0,"Content":"Decent","Username":null,"UserId":0,"ProductId":13,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (97, N'Create Comment Command', N'nanananana', N'{"Id":0,"Content":"Not bad at all for this price","Username":null,"UserId":0,"ProductId":5,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (98, N'Create Comment Command', N'nanananana', N'{"Id":0,"Content":"Stay away!!!","Username":null,"UserId":0,"ProductId":16,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (99, N'Create Comment Command', N'nanananana', N'{"Id":0,"Content":"Useful around the house","Username":null,"UserId":0,"ProductId":22,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (100, N'Get Comments Query', N'nanananana', N'{"Content":null,"Username":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (101, N'Get Products Query', N'nanananana', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (102, N'Get Products Query', N'nanananana', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":2}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (103, N'Create Comment Command', N'nanananana', N'{"Id":0,"Content":"I LOVE THIS PRODUCT!","Username":null,"UserId":0,"ProductId":18,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (104, N'Create Comment Command', N'nanananana', N'{"Id":0,"Content":"Not sure whether to recommend it","Username":null,"UserId":0,"ProductId":17,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (105, N'Get Products Query', N'nanananana', N'{"Name":null,"Category":null,"PriceFrom":0,"PriceTo":0,"PerPage":10,"Page":2}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (106, N'Get Cart Items Query', N'nanananana', N'{"Username":null,"ProductName":null,"AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (107, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":18,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (108, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":4,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (109, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":15,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (110, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":3,"Username":null,"Product":null,"ProductId":11,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (111, N'Get Cart Items Query', N'nanananana', N'{"Username":null,"ProductName":null,"AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (112, N'Get Cart Items Query', N'nanananana', N'{"Username":null,"ProductName":null,"AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (113, N'Create Order Command', N'nanananana', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Jovan","LastName":"Petrovic","Email":"jovpet@gmail.com","Phone":"06777777","Country":"Montenegro","City":"Podgorica","Address":"Primorska 9","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (114, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":21,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (115, N'Create Order Command', N'nanananana', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Jovan","LastName":"Petrovic","Email":"jovpet@gmail.com","Phone":"06777777","Country":"Montenegro","City":"Podgorica","Address":"Primorska 9","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (116, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":25,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (117, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":4,"Username":null,"Product":null,"ProductId":2,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (118, N'Create Cart Item Command', N'nanananana', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":1,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (119, N'Register User Command', N'Anonymous', N'{"Username":"mr_user","Password":"lozinkos9","FirstName":"Goran","LastName":"Ilic","Email":"gilic@gmail.com","Country":"Serbia","City":"Belgrade","Address":"Jovanska 11"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (120, N'Create Comment Command', N'mr_user', N'{"Id":0,"Content":"This is a good enough product","Username":null,"UserId":0,"ProductId":15,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (121, N'Create Comment Command', N'mr_user', N'{"Id":0,"Content":"This product is terrible","Username":null,"UserId":0,"ProductId":121,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (122, N'Create Comment Command', N'mr_user', N'{"Id":0,"Content":"This product is terrible","Username":null,"UserId":0,"ProductId":21,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (123, N'Create Comment Command', N'mr_user', N'{"Id":0,"Content":"I am very satisfied with this!","Username":null,"UserId":0,"ProductId":3,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (124, N'Create Comment Command', N'mr_user', N'{"Id":0,"Content":"Terrific indeed!","Username":null,"UserId":0,"ProductId":9,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (125, N'Create Comment Command', N'mr_user', N'{"Id":0,"Content":"Never buying this again...","Username":null,"UserId":0,"ProductId":25,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (126, N'Create Cart Item Command', N'mr_user', N'{"Id":0,"Amount":3,"Username":null,"Product":null,"ProductId":3,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (127, N'Create Cart Item Command', N'mr_user', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":25,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (128, N'Create Cart Item Command', N'mr_user', N'{"Id":0,"Amount":4,"Username":null,"Product":null,"ProductId":7,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (129, N'Create Order Command', N'mr_user', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Goran","LastName":"Ilic","Email":"gilic@gmail.com","Phone":"066747223","Country":"Serbia","City":"Belgrade","Address":"Jovanska 7","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (130, N'Create Cart Item Command', N'mr_user', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":15,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (131, N'Create Order Command', N'mr_user', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Goran","LastName":"Ilic","Email":"gilic@gmail.com","Phone":"066747223","Country":"Serbia","City":"Belgrade","Address":"Jovanska 7","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (132, N'Create Cart Item Command', N'mr_user', N'{"Id":0,"Amount":2,"Username":null,"Product":null,"ProductId":19,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (133, N'Create Order Command', N'mr_user', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Goran","LastName":"Ilic","Email":"gilic@gmail.com","Phone":"066747223","Country":"Serbia","City":"Belgrade","Address":"Jovanska 7","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (134, N'Create Cart Item Command', N'mr_user', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":6,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (135, N'Register User Command', N'Anonymous', N'{"Username":"mir_ko","Password":"lll123123","FirstName":"Mirko","LastName":"Dragisic","Email":"dragisic@yahoo.co","Country":"Serbia","City":"Cacak","Address":"Cacanska 1"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (136, N'Create Comment Command', N'mir_ko', N'{"Id":0,"Content":"Yep, I like this product","Username":null,"UserId":0,"ProductId":16,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (137, N'Create Comment Command', N'mir_ko', N'{"Id":0,"Content":"Not bad at all","Username":null,"UserId":0,"ProductId":5,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (138, N'Create Comment Command', N'mir_ko', N'{"Id":0,"Content":"Decent-ish","Username":null,"UserId":0,"ProductId":11,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (139, N'Create Comment Command', N'mir_ko', N'{"Id":0,"Content":"Would absolutelly never ever recommend this to anyone","Username":null,"UserId":0,"ProductId":20,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (140, N'Create Order Command', N'mir_ko', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Mirko","LastName":"Dragisic","Email":"dragisic@yahoo.co","Phone":null,"Country":"Serbia","City":"Cacak","Address":"Cacanska 1","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (141, N'Create Order Command', N'mir_ko', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Mirko","LastName":"Dragisic","Email":"dragisic@yahoo.co","Phone":null,"Country":"Serbia","City":"Cacak","Address":"Cacanska 1","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (142, N'Create Order Command', N'mir_ko', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Mirko","LastName":"Dragisic","Email":"dragisic@yahoo.co","Phone":null,"Country":"Serbia","City":"Cacak","Address":"Cacanska 1","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (143, N'Register User Command', N'Anonymous', N'{"Username":"ime_korisnika","Password":"lozinka_korisnika","FirstName":"Petar","LastName":"Milovanovic","Email":"hohoho@gmail.com","Country":"Serbia","City":"Belgrade","Address":"Cvijiceva 91"}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (144, N'Create Comment Command', N'ime_korisnika', N'{"Id":0,"Content":"Buy! buy! buy! This is just great!","Username":null,"UserId":0,"ProductId":12,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (145, N'Create Comment Command', N'ime_korisnika', N'{"Id":0,"Content":"Best. Product. Ever.","Username":null,"UserId":0,"ProductId":6,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (146, N'Create Comment Command', N'ime_korisnika', N'{"Id":0,"Content":"I highly recommend!","Username":null,"UserId":0,"ProductId":18,"PostedAt":"0001-01-01T00:00:00","ModifiedAt":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (147, N'Create Cart Item Command', N'ime_korisnika', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":14,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (148, N'Create Order Command', N'ime_korisnika', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Petar","LastName":"Milovanovic","Email":"hohoho@gmail.com","Phone":null,"Country":"Serbia","City":"Belgrade","Address":"Cvijiceva 91","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (149, N'Create Cart Item Command', N'ime_korisnika', N'{"Id":0,"Amount":3,"Username":null,"Product":null,"ProductId":1,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (150, N'Create Order Command', N'ime_korisnika', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Petar","LastName":"Milovanovic","Email":"hohoho@gmail.com","Phone":null,"Country":"Serbia","City":"Belgrade","Address":"Cvijiceva 91","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (151, N'Create Cart Item Command', N'ime_korisnika', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":1,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (152, N'Create Cart Item Command', N'ime_korisnika', N'{"Id":0,"Amount":1,"Username":null,"Product":null,"ProductId":2,"UserId":0}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (153, N'Create Order Command', N'ime_korisnika', N'{"Id":0,"DateOfOrder":"0001-01-01T00:00:00","FirstName":"Petar","LastName":"Milovanovic","Email":"hohoho@gmail.com","Phone":null,"Country":"Serbia","City":"Belgrade","Address":"Cvijiceva 91","UserId":0,"OrderProducts":null}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (154, N'Get Categories Query', N'admin', N'{"Name":null,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (155, N'Get Categories Query', N'admin', N'{"Name":"p","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (156, N'Get Cart Items Query', N'admin', N'{"Username":"kor","ProductName":null,"AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (157, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":"sh","AmountFrom":0,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (158, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":2,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (159, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":1,"AmountTo":0,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (160, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":1,"AmountTo":2,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (161, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":2,"AmountTo":2,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (162, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":2,"AmountTo":3,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (163, N'Get Cart Items Query', N'admin', N'{"Username":null,"ProductName":null,"AmountFrom":2,"AmountTo":4,"PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (164, N'Get Orders Query', N'admin', N'{"FirstName":"D","LastName":null,"Email":null,"Phone":null,"Country":null,"City":null,"Address":null,"Username":null,"ProductName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (165, N'Get Orders Query', N'admin', N'{"FirstName":null,"LastName":null,"Email":null,"Phone":null,"Country":null,"City":null,"Address":"k","Username":null,"ProductName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (166, N'Get Orders Query', N'admin', N'{"FirstName":null,"LastName":null,"Email":null,"Phone":null,"Country":null,"City":null,"Address":"1","Username":null,"ProductName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (167, N'Get Orders Query', N'admin', N'{"FirstName":null,"LastName":null,"Email":null,"Phone":null,"Country":null,"City":null,"Address":null,"Username":null,"ProductName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (168, N'Get Orders Query', N'admin', N'{"FirstName":null,"LastName":null,"Email":null,"Phone":null,"Country":null,"City":null,"Address":null,"Username":null,"ProductName":null,"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
INSERT [dbo].[UseCaseLogs] ([Id], [Name], [Actor], [Data], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (169, N'Get Orders Query', N'admin', N'{"FirstName":null,"LastName":null,"Email":null,"Phone":null,"Country":null,"City":null,"Address":null,"Username":null,"ProductName":"sh","DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","PerPage":10,"Page":1}', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'admin', N'd138768d3b5eca407f0dd579c5ca3767', N'Adminko', N'Adminkovic', N'admin@gmail.com', N'Serbia', N'Belgrade', N'Adresa 123', 1, CAST(N'2021-06-17T02:43:55.5353847' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'kor99', N'd2ae401ea44ee4e08b210e66ea79df30', N'Mirko', N'Mirkovic', N'kor@gmail.com', N'Serbia', N'Novi Sad', N'Ulica 111', 2, CAST(N'2021-06-17T03:36:21.0683697' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'miomir_12', N'6f66c64da30c956ed11fa19a30bba7cf', N'Miomir', N'Jovanovic', N'mio@gmail.com', N'Croatia', N'Zagreb', N'Zagrebacka 55', 2, CAST(N'2021-06-17T03:47:35.0924200' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'ste-fan', N'd79d2a65d1ae9201fa6fcb7b05474498', N'Stefan', N'Despotovic', N'steFAN@gmail.com', N'Serbia', N'Belgrade', N'Goce Delceva 70', 2, CAST(N'2021-06-17T03:48:35.2737974' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'u_s_e_r', N'03f45ed85e875b6564ff0a7d29e24d23', N'Isidora', N'Stefanovski', N'isidora676@gmail.com', N'Serbia', N'Kragujevac', N'Pionirska 9', 2, CAST(N'2021-06-17T03:49:47.6636511' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'imeimeime', N'86935172a78b84de27b6d24b58561d9c', N'Dragana', N'Milisavljevic', N'dragaana@gmail.com', N'Serbia', N'Pancevo', N'Bulevarska 23', 2, CAST(N'2021-06-17T03:50:49.8662312' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'nanananana', N'3736d52155edb71d58ff8aa51fce4b4e', N'Jovan', N'Petrovic', N'jovpet@gmail.com', N'Montenegro', N'Podgorica', N'Primorska 9', 2, CAST(N'2021-06-17T03:51:32.8378780' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, N'mr_user', N'8455cac2f7eeb1262fe9dc1fec21cef3', N'Goran', N'Ilic', N'gilic@gmail.com', N'Serbia', N'Belgrade', N'Jovanska 11', 2, CAST(N'2021-06-17T04:06:43.6827150' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, N'mir_ko', N'bcabb46672334954cddb93415222d5cc', N'Mirko', N'Dragisic', N'dragisic@yahoo.co', N'Serbia', N'Cacak', N'Cacanska 1', 2, CAST(N'2021-06-17T04:14:00.8141655' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [Country], [City], [Address], [RoleId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, N'ime_korisnika', N'838835d3485ee8a9eae1458e5df751e7', N'Petar', N'Milovanovic', N'hohoho@gmail.com', N'Serbia', N'Belgrade', N'Cvijiceva 91', 2, CAST(N'2021-06-17T04:18:24.1913179' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCase] ON 

INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, 9, 1, CAST(N'2021-06-17T02:43:55.5356760' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, 10, 1, CAST(N'2021-06-17T02:43:55.5356798' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, 21, 1, CAST(N'2021-06-17T02:43:55.5356800' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, 26, 1, CAST(N'2021-06-17T02:43:55.5356801' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, 22, 1, CAST(N'2021-06-17T02:43:55.5356802' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, 23, 1, CAST(N'2021-06-17T02:43:55.5356807' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, 24, 1, CAST(N'2021-06-17T02:43:55.5356808' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (8, 25, 1, CAST(N'2021-06-17T02:43:55.5356810' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (9, 28, 1, CAST(N'2021-06-17T02:43:55.5356811' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (10, 29, 1, CAST(N'2021-06-17T02:43:55.5356813' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (11, 30, 1, CAST(N'2021-06-17T02:43:55.5356814' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (12, 41, 1, CAST(N'2021-06-17T02:43:55.5356816' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (13, 42, 1, CAST(N'2021-06-17T02:43:55.5356817' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (14, 43, 1, CAST(N'2021-06-17T02:43:55.5356818' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (15, 44, 1, CAST(N'2021-06-17T02:43:55.5356819' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (16, 45, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (17, 1, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (18, 2, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (19, 3, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (20, 4, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (21, 5, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (22, 6, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (23, 7, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (24, 8, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (25, 11, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (26, 12, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (27, 13, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (28, 14, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (29, 15, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (30, 16, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (31, 17, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (32, 18, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (33, 19, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (34, 20, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (35, 27, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (36, 31, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (37, 32, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (38, 33, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (39, 34, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (40, 35, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (41, 36, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (42, 37, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (43, 38, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (44, 39, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (46, 40, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (47, 46, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (48, 47, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (49, 48, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (50, 49, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (51, 50, 1, CAST(N'2021-06-17T02:43:55.5356820' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (52, 9, 2, CAST(N'2021-06-17T03:36:21.0685141' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (53, 10, 2, CAST(N'2021-06-17T03:36:21.0685187' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (54, 21, 2, CAST(N'2021-06-17T03:36:21.0685188' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (55, 26, 2, CAST(N'2021-06-17T03:36:21.0685190' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (56, 22, 2, CAST(N'2021-06-17T03:36:21.0685191' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (57, 23, 2, CAST(N'2021-06-17T03:36:21.0685195' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (58, 24, 2, CAST(N'2021-06-17T03:36:21.0685292' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (59, 25, 2, CAST(N'2021-06-17T03:36:21.0685294' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (60, 28, 2, CAST(N'2021-06-17T03:36:21.0685296' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (61, 29, 2, CAST(N'2021-06-17T03:36:21.0685298' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (62, 30, 2, CAST(N'2021-06-17T03:36:21.0685299' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (63, 41, 2, CAST(N'2021-06-17T03:36:21.0685300' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (64, 42, 2, CAST(N'2021-06-17T03:36:21.0685302' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (65, 43, 2, CAST(N'2021-06-17T03:36:21.0685303' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (66, 44, 2, CAST(N'2021-06-17T03:36:21.0685304' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (67, 45, 2, CAST(N'2021-06-17T03:36:21.0685305' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (68, 9, 3, CAST(N'2021-06-17T03:47:35.0924289' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (69, 10, 3, CAST(N'2021-06-17T03:47:35.0924293' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (70, 21, 3, CAST(N'2021-06-17T03:47:35.0924295' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (71, 26, 3, CAST(N'2021-06-17T03:47:35.0924296' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (72, 22, 3, CAST(N'2021-06-17T03:47:35.0924297' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (73, 23, 3, CAST(N'2021-06-17T03:47:35.0924301' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (74, 24, 3, CAST(N'2021-06-17T03:47:35.0924302' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (75, 25, 3, CAST(N'2021-06-17T03:47:35.0924303' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (76, 28, 3, CAST(N'2021-06-17T03:47:35.0924304' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (77, 29, 3, CAST(N'2021-06-17T03:47:35.0924306' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (78, 30, 3, CAST(N'2021-06-17T03:47:35.0924307' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (79, 41, 3, CAST(N'2021-06-17T03:47:35.0924309' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (80, 42, 3, CAST(N'2021-06-17T03:47:35.0924310' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (81, 43, 3, CAST(N'2021-06-17T03:47:35.0924311' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (82, 44, 3, CAST(N'2021-06-17T03:47:35.0924312' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (83, 45, 3, CAST(N'2021-06-17T03:47:35.0924313' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (84, 9, 4, CAST(N'2021-06-17T03:48:35.2738031' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (85, 10, 4, CAST(N'2021-06-17T03:48:35.2738036' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (86, 21, 4, CAST(N'2021-06-17T03:48:35.2738038' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (87, 26, 4, CAST(N'2021-06-17T03:48:35.2738039' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (88, 22, 4, CAST(N'2021-06-17T03:48:35.2738040' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (89, 23, 4, CAST(N'2021-06-17T03:48:35.2738043' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (90, 24, 4, CAST(N'2021-06-17T03:48:35.2738044' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (91, 25, 4, CAST(N'2021-06-17T03:48:35.2738045' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (92, 28, 4, CAST(N'2021-06-17T03:48:35.2738047' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (93, 29, 4, CAST(N'2021-06-17T03:48:35.2738049' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (94, 30, 4, CAST(N'2021-06-17T03:48:35.2738050' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (95, 41, 4, CAST(N'2021-06-17T03:48:35.2738051' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (96, 42, 4, CAST(N'2021-06-17T03:48:35.2738052' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (97, 43, 4, CAST(N'2021-06-17T03:48:35.2738053' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (98, 44, 4, CAST(N'2021-06-17T03:48:35.2738054' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (99, 45, 4, CAST(N'2021-06-17T03:48:35.2738055' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (100, 9, 5, CAST(N'2021-06-17T03:49:47.6636626' AS DateTime2), NULL, 0, NULL, 1)
GO
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (101, 10, 5, CAST(N'2021-06-17T03:49:47.6636637' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (102, 21, 5, CAST(N'2021-06-17T03:49:47.6636638' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (103, 26, 5, CAST(N'2021-06-17T03:49:47.6636641' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (104, 22, 5, CAST(N'2021-06-17T03:49:47.6636643' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (105, 23, 5, CAST(N'2021-06-17T03:49:47.6636647' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (106, 24, 5, CAST(N'2021-06-17T03:49:47.6636650' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (107, 25, 5, CAST(N'2021-06-17T03:49:47.6636653' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (108, 28, 5, CAST(N'2021-06-17T03:49:47.6636655' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (109, 29, 5, CAST(N'2021-06-17T03:49:47.6636658' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (110, 30, 5, CAST(N'2021-06-17T03:49:47.6636659' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (111, 41, 5, CAST(N'2021-06-17T03:49:47.6636660' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (112, 42, 5, CAST(N'2021-06-17T03:49:47.6636662' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (113, 43, 5, CAST(N'2021-06-17T03:49:47.6636664' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (114, 44, 5, CAST(N'2021-06-17T03:49:47.6636665' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (115, 45, 5, CAST(N'2021-06-17T03:49:47.6636668' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (116, 9, 6, CAST(N'2021-06-17T03:50:49.8662382' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (117, 10, 6, CAST(N'2021-06-17T03:50:49.8662388' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (118, 21, 6, CAST(N'2021-06-17T03:50:49.8662389' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (119, 26, 6, CAST(N'2021-06-17T03:50:49.8662390' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (120, 22, 6, CAST(N'2021-06-17T03:50:49.8662391' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (121, 23, 6, CAST(N'2021-06-17T03:50:49.8662395' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (122, 24, 6, CAST(N'2021-06-17T03:50:49.8662396' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (123, 25, 6, CAST(N'2021-06-17T03:50:49.8662397' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (124, 28, 6, CAST(N'2021-06-17T03:50:49.8662398' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (125, 29, 6, CAST(N'2021-06-17T03:50:49.8662400' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (126, 30, 6, CAST(N'2021-06-17T03:50:49.8662401' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (127, 41, 6, CAST(N'2021-06-17T03:50:49.8662402' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (128, 42, 6, CAST(N'2021-06-17T03:50:49.8662403' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (129, 43, 6, CAST(N'2021-06-17T03:50:49.8662404' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (130, 44, 6, CAST(N'2021-06-17T03:50:49.8662406' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (131, 45, 6, CAST(N'2021-06-17T03:50:49.8662407' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (132, 9, 7, CAST(N'2021-06-17T03:51:32.8378879' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (133, 10, 7, CAST(N'2021-06-17T03:51:32.8378886' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (134, 21, 7, CAST(N'2021-06-17T03:51:32.8378889' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (135, 26, 7, CAST(N'2021-06-17T03:51:32.8378890' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (136, 22, 7, CAST(N'2021-06-17T03:51:32.8378892' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (137, 23, 7, CAST(N'2021-06-17T03:51:32.8378895' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (138, 24, 7, CAST(N'2021-06-17T03:51:32.8378896' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (139, 25, 7, CAST(N'2021-06-17T03:51:32.8378897' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (140, 28, 7, CAST(N'2021-06-17T03:51:32.8378898' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (141, 29, 7, CAST(N'2021-06-17T03:51:32.8378900' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (142, 30, 7, CAST(N'2021-06-17T03:51:32.8378903' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (143, 41, 7, CAST(N'2021-06-17T03:51:32.8378904' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (144, 42, 7, CAST(N'2021-06-17T03:51:32.8378905' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (145, 43, 7, CAST(N'2021-06-17T03:51:32.8378906' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (146, 44, 7, CAST(N'2021-06-17T03:51:32.8378907' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (147, 45, 7, CAST(N'2021-06-17T03:51:32.8378908' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (148, 9, 8, CAST(N'2021-06-17T04:06:43.6830233' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (149, 10, 8, CAST(N'2021-06-17T04:06:43.6830268' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (150, 21, 8, CAST(N'2021-06-17T04:06:43.6830270' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (151, 26, 8, CAST(N'2021-06-17T04:06:43.6830271' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (152, 22, 8, CAST(N'2021-06-17T04:06:43.6830272' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (153, 23, 8, CAST(N'2021-06-17T04:06:43.6830278' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (154, 24, 8, CAST(N'2021-06-17T04:06:43.6830279' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (155, 25, 8, CAST(N'2021-06-17T04:06:43.6830280' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (156, 28, 8, CAST(N'2021-06-17T04:06:43.6830281' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (157, 29, 8, CAST(N'2021-06-17T04:06:43.6830284' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (158, 30, 8, CAST(N'2021-06-17T04:06:43.6830285' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (159, 41, 8, CAST(N'2021-06-17T04:06:43.6830287' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (160, 42, 8, CAST(N'2021-06-17T04:06:43.6830288' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (161, 43, 8, CAST(N'2021-06-17T04:06:43.6830289' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (162, 44, 8, CAST(N'2021-06-17T04:06:43.6830290' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (163, 45, 8, CAST(N'2021-06-17T04:06:43.6830291' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (164, 9, 9, CAST(N'2021-06-17T04:14:00.8144713' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (165, 10, 9, CAST(N'2021-06-17T04:14:00.8144745' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (166, 21, 9, CAST(N'2021-06-17T04:14:00.8144748' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (167, 26, 9, CAST(N'2021-06-17T04:14:00.8144749' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (168, 22, 9, CAST(N'2021-06-17T04:14:00.8144750' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (169, 23, 9, CAST(N'2021-06-17T04:14:00.8144755' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (170, 24, 9, CAST(N'2021-06-17T04:14:00.8144757' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (171, 25, 9, CAST(N'2021-06-17T04:14:00.8144758' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (172, 28, 9, CAST(N'2021-06-17T04:14:00.8144759' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (173, 29, 9, CAST(N'2021-06-17T04:14:00.8144762' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (174, 30, 9, CAST(N'2021-06-17T04:14:00.8144763' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (175, 41, 9, CAST(N'2021-06-17T04:14:00.8144764' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (176, 42, 9, CAST(N'2021-06-17T04:14:00.8144766' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (177, 43, 9, CAST(N'2021-06-17T04:14:00.8144767' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (178, 44, 9, CAST(N'2021-06-17T04:14:00.8144768' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (179, 45, 9, CAST(N'2021-06-17T04:14:00.8144769' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (180, 9, 10, CAST(N'2021-06-17T04:18:24.1913287' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (181, 10, 10, CAST(N'2021-06-17T04:18:24.1913315' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (182, 21, 10, CAST(N'2021-06-17T04:18:24.1913316' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (183, 26, 10, CAST(N'2021-06-17T04:18:24.1913317' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (184, 22, 10, CAST(N'2021-06-17T04:18:24.1913318' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (185, 23, 10, CAST(N'2021-06-17T04:18:24.1913321' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (186, 24, 10, CAST(N'2021-06-17T04:18:24.1913322' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (187, 25, 10, CAST(N'2021-06-17T04:18:24.1913324' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (188, 28, 10, CAST(N'2021-06-17T04:18:24.1913325' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (189, 29, 10, CAST(N'2021-06-17T04:18:24.1913327' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (190, 30, 10, CAST(N'2021-06-17T04:18:24.1913328' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (191, 41, 10, CAST(N'2021-06-17T04:18:24.1913329' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (192, 42, 10, CAST(N'2021-06-17T04:18:24.1913330' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (193, 43, 10, CAST(N'2021-06-17T04:18:24.1913332' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (194, 44, 10, CAST(N'2021-06-17T04:18:24.1913333' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (195, 45, 10, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (196, 18, 2, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (197, 18, 10, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (198, 18, 9, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (199, 18, 8, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (200, 18, 7, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (201, 18, 6, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (202, 18, 5, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (203, 18, 4, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[UserUseCase] ([Id], [UseCaseId], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (204, 18, 3, CAST(N'2021-06-17T04:18:24.1913334' AS DateTime2), NULL, 0, NULL, 1)

SET IDENTITY_INSERT [dbo].[UserUseCase] OFF
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_UserId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_UserId] ON [dbo].[CartItems]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ProductId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ProductId] ON [dbo].[Comments]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProducts_OrderId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderProducts_OrderId] ON [dbo].[OrderProducts]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProducts_ProductId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderProducts_ProductId] ON [dbo].[OrderProducts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCase_UserId]    Script Date: 6/17/2021 6:32:28 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCase_UserId] ON [dbo].[UserUseCase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [ProductId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products_ProductId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Users_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products_ProductId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUseCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCase_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCase] CHECK CONSTRAINT [FK_UserUseCase_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [ASP.204.17] SET  READ_WRITE 
GO
