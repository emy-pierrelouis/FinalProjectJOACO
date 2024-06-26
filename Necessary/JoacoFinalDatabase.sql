USE [master]
GO
/****** Object:  Database [Joaco]    Script Date: 2024-03-15 10:38:33 AM ******/
CREATE DATABASE [Joaco]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Joaco', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Joaco.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Joaco_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Joaco_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Joaco] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Joaco].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Joaco] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Joaco] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Joaco] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Joaco] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Joaco] SET ARITHABORT OFF 
GO
ALTER DATABASE [Joaco] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Joaco] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Joaco] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Joaco] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Joaco] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Joaco] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Joaco] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Joaco] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Joaco] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Joaco] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Joaco] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Joaco] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Joaco] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Joaco] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Joaco] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Joaco] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Joaco] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Joaco] SET RECOVERY FULL 
GO
ALTER DATABASE [Joaco] SET  MULTI_USER 
GO
ALTER DATABASE [Joaco] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Joaco] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Joaco] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Joaco] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Joaco] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Joaco] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Joaco', N'ON'
GO
ALTER DATABASE [Joaco] SET QUERY_STORE = ON
GO
ALTER DATABASE [Joaco] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Joaco]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2024-03-15 10:38:33 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abonnement]    Script Date: 2024-03-15 10:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abonnement](
	[abonne_id] [int] IDENTITY(1,1) NOT NULL,
	[abonne_email] [nvarchar](255) NOT NULL,
	[abonne_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[abonne_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adresses]    Script Date: 2024-03-15 10:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresses](
	[adresse_id] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NOT NULL,
	[adresse] [nchar](50) NOT NULL,
	[ville] [nchar](50) NOT NULL,
	[pays] [nchar](50) NOT NULL,
	[code_postal] [nchar](7) NOT NULL,
	[adresse_livraison] [nchar](200) NULL,
 CONSTRAINT [PK_Adresse_Utilisateurs] PRIMARY KEY CLUSTERED 
(
	[adresse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2024-03-15 10:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2024-03-15 10:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2024-03-15 10:38:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NULL,
	[article_titre] [nchar](50) NOT NULL,
	[article_contenu] [text] NULL,
	[date_publication] [date] NOT NULL,
	[auteur] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commandes]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commandes](
	[commande_id] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NULL,
	[adresse_livraison_id] [int] NOT NULL,
	[date_commande] [date] NOT NULL,
	[statut_commande] [nchar](20) NOT NULL,
	[methode_paiement] [nchar](20) NULL,
	[commentaire] [text] NULL,
 CONSTRAINT [PK_Commandes] PRIMARY KEY CLUSTERED 
(
	[commande_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventaire]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventaire](
	[inventaire_id] [int] IDENTITY(1,1) NOT NULL,
	[produit_id] [int] NOT NULL,
	[stock_quantite] [int] NOT NULL,
	[statu_dispo] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Inventaire] PRIMARY KEY CLUSTERED 
(
	[inventaire_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[media_id] [int] IDENTITY(1,1) NOT NULL,
	[produit_id] [int] NOT NULL,
	[media_chemin] [text] NOT NULL,
	[media_description] [text] NOT NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[media_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NOT NULL,
	[contenu] [text] NOT NULL,
	[sujet] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paiements]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paiements](
	[paiement_id] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NOT NULL,
	[commande_id] [int] NOT NULL,
	[montant] [decimal](10, 0) NOT NULL,
	[methode] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Paiements] PRIMARY KEY CLUSTERED 
(
	[paiement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produits]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits](
	[produit_id] [int] IDENTITY(1,1) NOT NULL,
	[inventaire_id] [int] NULL,
	[produit_type] [nchar](50) NOT NULL,
	[produit_nom] [nchar](50) NOT NULL,
	[produit_description] [text] NOT NULL,
	[prix] [decimal](10, 0) NOT NULL,
	[stock_quantite] [int] NOT NULL,
	[statut_dispo] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Produits] PRIMARY KEY CLUSTERED 
(
	[produit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produits_Commandes]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits_Commandes](
	[produit_commande_id] [int] IDENTITY(1,1) NOT NULL,
	[commande_id] [int] NOT NULL,
	[produit_id] [int] NOT NULL,
	[quantite] [int] NOT NULL,
	[prix_unitaire] [decimal](10, 0) NOT NULL,
	[promotions] [decimal](10, 0) NULL,
 CONSTRAINT [PK_Produits_Commandes] PRIMARY KEY CLUSTERED 
(
	[produit_commande_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Retour_Commandes]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retour_Commandes](
	[retour_id] [int] IDENTITY(1,1) NOT NULL,
	[commande_id] [int] NOT NULL,
	[raison] [text] NOT NULL,
	[date_retour] [date] NOT NULL,
	[statut_retour] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Retour_Commandes] PRIMARY KEY CLUSTERED 
(
	[retour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suivi_Commandes]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suivi_Commandes](
	[suivi_id] [int] IDENTITY(1,1) NOT NULL,
	[commande_id] [int] NOT NULL,
	[date_suivi] [date] NOT NULL,
	[statut] [nchar](20) NOT NULL,
	[commentaire] [text] NOT NULL,
 CONSTRAINT [PK_Suivi_Commandes] PRIMARY KEY CLUSTERED 
(
	[suivi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateurs_info]    Script Date: 2024-03-15 10:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateurs_info](
	[utilisateur_id] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NULL,
	[nom] [nchar](50) NOT NULL,
	[prenom] [nchar](50) NOT NULL,
	[date_creation] [date] NOT NULL,
 CONSTRAINT [PK_Utilisateurs_info] PRIMARY KEY CLUSTERED 
(
	[utilisateur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'7.0.5')
GO
SET IDENTITY_INSERT [dbo].[Abonnement] ON 

INSERT [dbo].[Abonnement] ([abonne_id], [abonne_email], [abonne_date]) VALUES (1, N'aaa-aaa1@joaco.com', CAST(N'2024-03-13T21:36:37.327' AS DateTime))
INSERT [dbo].[Abonnement] ([abonne_id], [abonne_email], [abonne_date]) VALUES (2, N'aba-aba1@joaco.com', CAST(N'2024-03-13T23:25:05.233' AS DateTime))
INSERT [dbo].[Abonnement] ([abonne_id], [abonne_email], [abonne_date]) VALUES (3, N'maryse.lelelevie@gmail.com', CAST(N'2024-03-14T03:37:47.320' AS DateTime))
INSERT [dbo].[Abonnement] ([abonne_id], [abonne_email], [abonne_date]) VALUES (4, N'jojo@joaco.com', CAST(N'2024-03-14T22:38:17.457' AS DateTime))
SET IDENTITY_INSERT [dbo].[Abonnement] OFF
GO
SET IDENTITY_INSERT [dbo].[Adresses] ON 

INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (1, N'776fe28b-5500-4011-94f6-68891157020d', N'6-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 6 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (2, N'776fe28b-5500-4011-94f6-68891157020d', N'6-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 6 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (3, N'776fe28b-5500-4011-94f6-68891157020d', N'6-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 6 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (4, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'12-124 Main St                                    ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'124 Main St 12 Quebec Canada A1A 1A1                                                                                                                                                                    ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (5, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'12-124 Main St                                    ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'124 Main St 12 Quebec Canada A1A 1A1                                                                                                                                                                    ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (6, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'1-131 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'131 Main St 1 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (7, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'2-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 2 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (8, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'5-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 5 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (9, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'6-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 6 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (10, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'6-124 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'124 Main St 6 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (11, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'5-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 5 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (12, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'5-124 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'124 Main St 5 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (13, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'5-124 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'124 Main St 5 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (14, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'5-124 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'124 Main St 5 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (15, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'12-123 Main St                                    ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 12 Quebec Canada A1A 1A1                                                                                                                                                                    ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (16, N'33c77ae4-62ba-4f2c-951e-8e3e4e4fa33e', N'6-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 6 Quebec Canada A1A 1A1                                                                                                                                                                     ')
INSERT [dbo].[Adresses] ([adresse_id], [Id], [adresse], [ville], [pays], [code_postal], [adresse_livraison]) VALUES (17, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'6-123 Main St                                     ', N'Quebec                                            ', N'Canada                                            ', N'A1A 1A1', N'123 Main St 6 Quebec Canada A1A 1A1                                                                                                                                                                     ')
SET IDENTITY_INSERT [dbo].[Adresses] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'17691b2f-46bf-4455-b9be-0a5799a0d4b9', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4bf1cf9a-32d3-4a3b-a7da-3c3c94c55160', N'Customer', N'CUSTOMER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c3b8d14e-6c59-4e47-a15c-c138bba3aadb', N'Manager', N'MANAGER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1208daf2-36ef-47e9-8d73-398b81124aa9', N'17691b2f-46bf-4455-b9be-0a5799a0d4b9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'17691b2f-46bf-4455-b9be-0a5799a0d4b9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'66a61f12-8d92-4c1c-88b4-44688477c163', N'17691b2f-46bf-4455-b9be-0a5799a0d4b9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9f6d7cba-8a9b-490c-9017-99a86489e52f', N'17691b2f-46bf-4455-b9be-0a5799a0d4b9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a93a214f-0403-4c8c-bf0b-ab063ddb3cc8', N'17691b2f-46bf-4455-b9be-0a5799a0d4b9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bf07055d-adfa-4ba0-ac1c-af7ec13e550b', N'17691b2f-46bf-4455-b9be-0a5799a0d4b9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c38294f1-a05f-4354-8ad2-9a0a1545b1b6', N'17691b2f-46bf-4455-b9be-0a5799a0d4b9')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1208daf2-36ef-47e9-8d73-398b81124aa9', N'admininistrator@joaco.com', N'ADMININISTRATOR@JOACO.COM', N'admininistrator@joaco.com', N'ADMININISTRATOR@JOACO.COM', 0, N'AQAAAAIAAYagAAAAECkswSUzctP9Dht9X9cYPNPPUwjSKKxnoUt60MNRuHbKUyAXrPbXk2Z8CBLo+rqVOw==', N'EYI655IVZL4OMJ4DV5ZHLXNQFGIJPW6P', N'b8fc8965-48ae-4c4b-850e-680d255a8d35', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'emy.pierrelouis@gmail.com', N'EMY.PIERRELOUIS@GMAIL.COM', N'emy.pierrelouis@gmail.com', N'EMY.PIERRELOUIS@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJVx3HAsUuGbOxS0c1xakmdOUHohInYuktlLZhPw29I0fuqQD9uK/y4Iy0XEi1aW4Q==', N'BGXEN5VMIAZQRX6WA3YRK3HQOODE3QBA', N'0299f932-059b-4d32-ab8c-fb0789f91718', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'33c77ae4-62ba-4f2c-951e-8e3e4e4fa33e', N'dufourk.tester@gmail.com', N'DUFOURK.TESTER@GMAIL.COM', N'dufourk.tester@gmail.com', N'DUFOURK.TESTER@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEIEeHKjWNWt34sZnJOmNdMrAOdv/ac7nZbccwZLfKK7rjCrP8zYHoG+SzlCRUthj5w==', N'62PP6HHNDLUONDCTLIDLGECUOYKTQFRV', N'a9a5db92-edf0-4c40-850a-40f0bb3889c1', N'(514) 613-0101', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'459947c1-492e-4af1-a49b-3175e1a39ceb', N'victoria.st.pierre.tester@gmail.com', N'VICTORIA.ST.PIERRE.TESTER@GMAIL.COM', N'victoria.st.pierre.tester@gmail.com', N'VICTORIA.ST.PIERRE.TESTER@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEGS+Vk+ko1sA1R1OMz4fWTP18An2O8GcLZBSB0Vec8i3BUVF9e0TXwUVFevjgp5+7g==', N'WQ42REEFVIJWEVULBVNPZ4YJAARXDGE6', N'526076a6-88ca-46da-8244-98297222a6b4', N'(514) 234-0001', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'66a61f12-8d92-4c1c-88b4-44688477c163', N'administrator@joaco.com', N'ADMINISTRATOR@JOACO.COM', N'administrator@joaco.com', N'ADMINISTRATOR@JOACO.COM', 1, N'AQAAAAIAAYagAAAAEN78kt8yYpLe+X/Qd0UQc+WCvkl8XW8ih2spJrkbzcskYW/YcdQwqi9mwxeDs2H8lA==', N'22TJPQ2S3AC2F3IYE3GSGF2ISXBKORIX', N'6d2f5a5c-c144-4310-9d7c-1079fe88e67a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'776fe28b-5500-4011-94f6-68891157020d', N'emilie.langlois1816@gmail.com', N'EMILIE.LANGLOIS1816@GMAIL.COM', N'emilie.langlois1816@gmail.com', N'EMILIE.LANGLOIS1816@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEBodKK77o4NDNMwhbLOpZDdppTGhhfHedkWdSRj/JexgNa1GHZdRXetwx0IwghI4Vg==', N'D7CPZWD4AXF77RF4XB7DZWP4DQQEX6BZ', N'd130fd4d-e599-488f-a052-0dfb60ace9cd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'88f56e04-1cef-4b43-a571-4411126b4dd8', N'dufour.k.tester@gmail.com', N'DUFOUR.K.TESTER@GMAIL.COM', N'dufour.k.tester@gmail.com', N'DUFOUR.K.TESTER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEP3NbP+UC86pbqzexL5dhqp0PMRPAjMgNSMl0yX4scj3Lb4k6fIImpfHjRQGpKxC8w==', N'Y3A4QIDZUEA4TV4UCAUO4YBTJQIV7XVY', N'0e4f4c28-cfbf-4807-b145-786e1a6677c3', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9f6d7cba-8a9b-490c-9017-99a86489e52f', N'admin3@joaco.com', N'ADMIN3@JOACO.COM', N'admin3@joaco.com', N'ADMIN3@JOACO.COM', 0, N'AQAAAAIAAYagAAAAEHQU5yh4YUBqWYOsXb9z5r/cFveUV9QEzmIzGyctVCc9LQy/I0pOP51/pute3W1OcA==', N'DN3ZHSN7C4H3EAOZPDFEXXUQYLXU6GPU', N'2fdcb385-dca6-4c8b-8dd3-95d22f4afcf3', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a93a214f-0403-4c8c-bf0b-ab063ddb3cc8', N'admin2@joaco.com', N'ADMIN2@JOACO.COM', N'admin2@joaco.com', N'ADMIN2@JOACO.COM', 0, N'AQAAAAIAAYagAAAAEAvAX/hz8faltm9zxpVFKDxY1fpSG2jqI+XFTdV4bnaLqD0pelVYQva3maAMfb820Q==', N'QR373Y4IXDYICL4VNFDGSATIHP4MNLMM', N'36d1ad58-8b69-46b1-bd35-fa487f21db56', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'aa16b725-fb51-4501-85fb-5b181317ba9b', N'joanne.stcyr@gmail.com', N'JOANNE.STCYR@GMAIL.COM', N'joanne.stcyr@gmail.com', N'JOANNE.STCYR@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAENjRXssDuvigTyEs4wGdQH8GfyCk8Qiy0cQt/L7kEZRto8aunnNbPw5ew1Q5PditcQ==', N'34SH3L6VC6Q4NBACNT7ALACV34ZMRVLO', N'7ea76278-9792-460a-82de-f5d51f61029e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bf07055d-adfa-4ba0-ac1c-af7ec13e550b', N'admin@joaco.com', N'ADMIN@JOACO.COM', N'admin@joaco.com', N'ADMIN@JOACO.COM', 0, N'AQAAAAIAAYagAAAAEI3qty3pW30ycHJAveU9QrrjLNK/D14uv0qcsjF1b9DaRgo2o4ozl38quVtJy+s5aQ==', N'E5VJN6AALIQD2UOXAG5UWUJWBO6AR65R', N'fca06100-ad1f-44c0-bc7f-b7bf56c88d81', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c38294f1-a05f-4354-8ad2-9a0a1545b1b6', N'admins@joaco.com', N'ADMINS@JOACO.COM', N'admins@joaco.com', N'ADMINS@JOACO.COM', 1, N'AQAAAAIAAYagAAAAEHSbZF/UNsY7O0+ZnF2zXcNcQY2QGL3NaSEV8Qh5beL7LCrBcC1hAFFBoRekpR+aAw==', N'4GJ7X6PHFJ5VFBARJDSAJ2N3ZTRS6XQ6', N'14f2eb1e-d5ec-4118-b3dd-85efbc689d06', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e85377df-abe2-4928-b914-cad626cb1bdf', N'marie.tremblay@hotmail.com', N'MARIE.TREMBLAY@HOTMAIL.COM', N'marie.tremblay@hotmail.com', N'MARIE.TREMBLAY@HOTMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJeMJ9WUEH+7vdp/xpxv9eEqESn234TeWx5i8Vn/GxuQl+9tY40YDU3rfCj5cnMgYA==', N'DPSJ6PAEWNEICB5FBT5DODN2M66TKXBB', N'9a5bc17c-33b7-4704-b97d-2a0ca09a281a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fc0bb256-e635-4c30-a05d-400db3b2c72e', N'maryse.t.tester@gmail.com', N'MARYSE.T.TESTER@GMAIL.COM', N'maryse.t.tester@gmail.com', N'MARYSE.T.TESTER@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEB3gXSFMvQLTmWl7Ngkim3r5qXZ1Hf//UsENY7mybxbUUzuTGUsQoDTCcI0yYz0SMw==', N'VQHNSCKFY4JFIBOGYTGRX4M5TVR3YXL6', N'7aea6486-da0f-466c-b6b1-59aaa552827b', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Commandes] ON 

INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (1, N'776fe28b-5500-4011-94f6-68891157020d', 1, CAST(N'2024-03-07' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (2, N'776fe28b-5500-4011-94f6-68891157020d', 2, CAST(N'2024-03-12' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (3, N'776fe28b-5500-4011-94f6-68891157020d', 3, CAST(N'2024-03-12' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (4, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 4, CAST(N'2024-03-12' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (5, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 5, CAST(N'2024-03-13' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (6, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 6, CAST(N'2024-03-13' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (7, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 7, CAST(N'2024-03-14' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (8, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 8, CAST(N'2024-03-14' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (9, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 9, CAST(N'2024-03-14' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (10, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 10, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (11, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 11, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (12, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 12, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (13, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 13, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (14, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 14, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (15, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 15, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (16, N'33c77ae4-62ba-4f2c-951e-8e3e4e4fa33e', 16, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
INSERT [dbo].[Commandes] ([commande_id], [Id], [adresse_livraison_id], [date_commande], [statut_commande], [methode_paiement], [commentaire]) VALUES (17, N'29f891f8-2fee-4f40-904b-b171bb142ba5', 17, CAST(N'2024-03-15' AS Date), N'En cours            ', N'VISA                ', NULL)
SET IDENTITY_INSERT [dbo].[Commandes] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventaire] ON 

INSERT [dbo].[Inventaire] ([inventaire_id], [produit_id], [stock_quantite], [statu_dispo]) VALUES (1, 65, 1, N'Disponible          ')
INSERT [dbo].[Inventaire] ([inventaire_id], [produit_id], [stock_quantite], [statu_dispo]) VALUES (2, 66, 9, N'Disponible          ')
INSERT [dbo].[Inventaire] ([inventaire_id], [produit_id], [stock_quantite], [statu_dispo]) VALUES (3, 67, 20, N'Disponible          ')
INSERT [dbo].[Inventaire] ([inventaire_id], [produit_id], [stock_quantite], [statu_dispo]) VALUES (4, 68, 15, N'Disponible          ')
INSERT [dbo].[Inventaire] ([inventaire_id], [produit_id], [stock_quantite], [statu_dispo]) VALUES (5, 69, 20, N'Disponible          ')
INSERT [dbo].[Inventaire] ([inventaire_id], [produit_id], [stock_quantite], [statu_dispo]) VALUES (6, 11, 70, N'Indisponible        ')
SET IDENTITY_INSERT [dbo].[Inventaire] OFF
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (15, 59, N'0004cd83-f566-49ac-95c8-9c17f557a186_creamtester3.jpg', N'creme cute')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (16, 62, N'ace01316-0348-4743-afed-d7e81ee808f7_creamtester2.jpg', N'4 creams')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (22, 13, N'0da5758f-6fe0-4e1e-a098-76710091d422_creamtester4.jpg', N'creme cute')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (23, 8, N'563b3640-4ecc-4e98-9447-58bdfeb3d1e4_bundletester.jpg', N'essentials bundle')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (24, 2, N'7251a7a1-0a29-4960-907c-cc10714bf1fa_perftester.jpg', N'un parfum')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (25, 3, N'6f18d9c1-3f07-475e-95c7-dfc399c778a5_deotester2.jpg', N'deo standard')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (28, 15, N'd8d906f2-9dfb-4abd-ada5-8fe263770b5a_spraytester2.jpg', N'spray look')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (30, 24, N'daaf270c-2f35-4b15-ab8f-41e258daed0f_spraytester4.jpg', N'spray look')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (31, 6, N'18bf80ed-6ee6-4cc5-a5a8-dfdbc56c45c3_spraytester3.jpg', N'spray look')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (33, 64, N'5b694d6e-62c3-4a23-bb95-1d567500f0fe_spraytester.jpg', N'spray look')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (34, 63, N'ffb372ea-4e5c-4915-86cc-84855d54dbdb_perftester2.jpg', N'un parfum')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (35, 61, N'4adf94b0-89d9-486c-8aa2-bf4080b4ca10_deotester.jpg', N'deo le plus cher pour peaux sensibles')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (37, 10, N'5d6a95b5-5476-44ca-82fe-476daf971dd9_exfoliantester.jpg', N'lil exfoliants')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (38, 19, N'61f4e76a-3314-4e98-b415-6bdfc6bb29cc_exfoliantester2.jpg', N'lil exfoliants')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (46, 67, N'59d3156c-28ea-40f4-9950-8eeba901e922_savon-phytopur-precieux-flat.jpg', N'a soap')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (48, 65, N'ec663271-3605-40d7-9d5b-75555570c495_kidtester.jpg', N'lil exfoliants')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (49, 66, N'ff5cd37f-953a-4d6a-ae40-3293617b640a_bundletester8.jpg', N'spray look')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (50, 68, N'465e8e10-aa2c-48bf-96e5-f20293e6fe4c_bundletester4.jpg', N'special')
INSERT [dbo].[Media] ([media_id], [produit_id], [media_chemin], [media_description]) VALUES (52, 11, N'47711d22-db6f-45e2-a5d0-ad473b79e315_perftester3.jpg', N'un parfum')
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
SET IDENTITY_INSERT [dbo].[Produits] ON 

INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (2, NULL, N'perfume                                           ', N'Parfum pour pieds                                 ', N'Un parfum délicat pour garder vos pieds frais toute la journée.', CAST(20 AS Decimal(10, 0)), 80, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (3, NULL, N'deodorant                                         ', N'Déodorant pour pieds                              ', N'Contrôle les odeurs et garde vos pieds au sec.', CAST(12 AS Decimal(10, 0)), 120, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (6, NULL, N'spray                                             ', N'Spray rafraîchissant pour pieds                   ', N'Revitalise et rafraîchit instantanément vos pieds fatigués.', CAST(15 AS Decimal(10, 0)), 110, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (8, NULL, N'bundle                                            ', N'Collection Essentielle                            ', N'Hydratez vos pieds tout au long de la journée avec ces chaussettes spéciales.', CAST(22 AS Decimal(10, 0)), 95, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (10, NULL, N'exfoliant                                         ', N'Exfoliant doux pour pieds                         ', N'Élimine en douceur les impuretés pour des pieds plus doux.', CAST(20 AS Decimal(10, 0)), 84, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (11, NULL, N'perfume                                           ', N'Parfum relaxant pour pieds                        ', N'Un parfum apaisant pour une détente totale des pieds.', CAST(12 AS Decimal(10, 0)), 70, N'Indisponible        ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (13, NULL, N'cream                                             ', N'Crème réparatrice pour talons                     ', N'Répare et hydrate les talons secs et fendillés.', CAST(20 AS Decimal(10, 0)), 75, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (15, NULL, N'spray                                             ', N'Spray antibactérien pour pieds                    ', N'Élimine les bactéries et rafraîchit instantanément vos pieds.', CAST(18 AS Decimal(10, 0)), 90, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (19, NULL, N'exfoliant                                         ', N'Exfoliant pétillant pour pieds                    ', N'Une expérience exfoliante pétillante pour des pieds revitalisés.', CAST(19 AS Decimal(10, 0)), 85, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (24, NULL, N'spray                                             ', N'Spray antibactérien rafraîchissant                ', N'Protège contre les bactéries tout en rafraîchissant les pieds.', CAST(18 AS Decimal(10, 0)), 90, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (59, NULL, N'cream                                             ', N'Crème aux roses                                   ', N'Une nouvelle crème parfait pour les soirées.', CAST(42 AS Decimal(10, 0)), 100, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (61, NULL, N'deodorant                                         ', N'Déodorant ultra-chic ultra-sensible               ', N'Un déo dispendieux mais qui marche', CAST(10 AS Decimal(10, 0)), 100, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (62, NULL, N'bundle                                            ', N'Collection des Fleurs                             ', N'La collection complète avec les 4 fragrances', CAST(240 AS Decimal(10, 0)), 20, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (63, NULL, N'perfume                                           ', N'Parfum classique                                  ', N'Un parfum avec une odeur classique', CAST(5 AS Decimal(10, 0)), 165, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (64, NULL, N'spray                                             ', N'Spray aux eucalyptus                              ', N'Un spray avec une odeur rappellant le vicks. Parfait pour traiter une infection.', CAST(21 AS Decimal(10, 0)), 9, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (65, NULL, N'exfoliant                                         ', N'Exfoliant pour enfants                            ', N'Le premier exfoliant pour vos enfants', CAST(21 AS Decimal(10, 0)), 0, N'Indisponible        ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (66, NULL, N'bundle                                            ', N'Starter Kit                                       ', N'Une collection pour débutants', CAST(25 AS Decimal(10, 0)), 8, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (67, 3, N'soap                                              ', N'Savon antibactérien                               ', N'Un savon qui tue les bactéries', CAST(12 AS Decimal(10, 0)), 20, N'Disponible          ')
INSERT [dbo].[Produits] ([produit_id], [inventaire_id], [produit_type], [produit_nom], [produit_description], [prix], [stock_quantite], [statut_dispo]) VALUES (68, NULL, N'bundle                                            ', N'Collection Spéciale Em&Em                         ', N'Une collection avec des produits sélections par les Ems', CAST(35 AS Decimal(10, 0)), 15, N'Disponible          ')
SET IDENTITY_INSERT [dbo].[Produits] OFF
GO
SET IDENTITY_INSERT [dbo].[Produits_Commandes] ON 

INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (1, 2, 2, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (2, 2, 10, 1, CAST(17 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (3, 2, 13, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (4, 2, 15, 1, CAST(18 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (5, 2, 11, 6, CAST(132 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (6, 3, 8, 4, CAST(88 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (7, 3, 11, 1, CAST(22 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (8, 3, 15, 1, CAST(18 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (9, 4, 3, 10, CAST(120 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (10, 5, 59, 5, CAST(250 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (11, 5, 62, 1, CAST(230 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (12, 5, 6, 1, CAST(15 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (13, 5, 15, 1, CAST(18 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (14, 6, 62, 1, CAST(240 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (15, 6, 61, 1, CAST(50 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (16, 6, 64, 1, CAST(50 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (17, 6, 24, 5, CAST(90 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (18, 7, 2, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (19, 8, 59, 3, CAST(126 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (20, 8, 61, 1, CAST(10 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (21, 8, 3, 1, CAST(12 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (22, 9, 8, 1, CAST(22 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (23, 10, 8, 1, CAST(22 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (24, 10, 13, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (25, 10, 2, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (26, 10, 11, 1, CAST(22 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (27, 10, 62, 1, CAST(240 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (28, 11, 65, 1, CAST(21 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (29, 12, 64, 4, CAST(84 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (30, 13, 64, 6, CAST(126 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (31, 14, 66, 1, CAST(25 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (32, 15, 2, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (33, 16, 2, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (34, 16, 3, 1, CAST(12 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (35, 16, 6, 1, CAST(15 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (36, 16, 59, 1, CAST(42 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (37, 17, 10, 1, CAST(20 AS Decimal(10, 0)), NULL)
INSERT [dbo].[Produits_Commandes] ([produit_commande_id], [commande_id], [produit_id], [quantite], [prix_unitaire], [promotions]) VALUES (38, 17, 66, 1, CAST(25 AS Decimal(10, 0)), NULL)
SET IDENTITY_INSERT [dbo].[Produits_Commandes] OFF
GO
SET IDENTITY_INSERT [dbo].[Utilisateurs_info] ON 

INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (1, N'776fe28b-5500-4011-94f6-68891157020d', N'Bearshire                                         ', N'Taeddie                                           ', CAST(N'2024-03-07' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (2, N'776fe28b-5500-4011-94f6-68891157020d', N'Tremblay                                          ', N'Marie                                             ', CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (3, N'776fe28b-5500-4011-94f6-68891157020d', N'Tremblay                                          ', N'Marie                                             ', CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (5, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Pierre-Louis                                      ', N'Emy                                               ', CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (7, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Gagnon                                            ', N'Judith                                            ', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (8, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Vézina                                            ', N'Karine                                            ', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (9, N'33c77ae4-62ba-4f2c-951e-8e3e4e4fa33e', N'Dufour                                            ', N'Kathy                                             ', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (10, N'459947c1-492e-4af1-a49b-3175e1a39ceb', N'St. Pierre                                        ', N'Tori                                              ', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (11, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Pierre-Louis                                      ', N'Emy                                               ', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (13, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Cola                                              ', N'Jojo                                              ', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (14, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Tremblay                                          ', N'Marie                                             ', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (18, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Tremblay                                          ', N'Karine                                            ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (19, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Pierre-Louis                                      ', N'Emy                                               ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (20, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Pierre-Louis                                      ', N'Emy                                               ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (21, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Pierre-Louis                                      ', N'Emy                                               ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (22, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Pierre-Louis                                      ', N'Emy                                               ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (23, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Tremblay                                          ', N'Augustine                                         ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (24, N'aa16b725-fb51-4501-85fb-5b181317ba9b', N'St. Cyr                                           ', N'Joanne                                            ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (25, N'33c77ae4-62ba-4f2c-951e-8e3e4e4fa33e', N'Tremblay                                          ', N'Marie                                             ', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Utilisateurs_info] ([utilisateur_id], [Id], [nom], [prenom], [date_creation]) VALUES (26, N'29f891f8-2fee-4f40-904b-b171bb142ba5', N'Tremblay                                          ', N'Marie                                             ', CAST(N'2024-03-15' AS Date))
SET IDENTITY_INSERT [dbo].[Utilisateurs_info] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Abonnement_abonne_email]    Script Date: 2024-03-15 10:38:34 AM ******/
ALTER TABLE [dbo].[Abonnement] ADD  CONSTRAINT [UC_Abonnement_abonne_email] UNIQUE NONCLUSTERED 
(
	[abonne_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2024-03-15 10:38:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2024-03-15 10:38:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2024-03-15 10:38:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2024-03-15 10:38:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2024-03-15 10:38:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2024-03-15 10:38:34 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2024-03-15 10:38:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abonnement] ADD  DEFAULT (getdate()) FOR [abonne_date]
GO
ALTER TABLE [dbo].[Adresses]  WITH CHECK ADD  CONSTRAINT [FK_Adresses_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Adresses] CHECK CONSTRAINT [FK_Adresses_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_AspNetUsers]
GO
ALTER TABLE [dbo].[Commandes]  WITH CHECK ADD  CONSTRAINT [FK_Commandes_Adresses] FOREIGN KEY([adresse_livraison_id])
REFERENCES [dbo].[Adresses] ([adresse_id])
GO
ALTER TABLE [dbo].[Commandes] CHECK CONSTRAINT [FK_Commandes_Adresses]
GO
ALTER TABLE [dbo].[Commandes]  WITH CHECK ADD  CONSTRAINT [FK_Commandes_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Commandes] CHECK CONSTRAINT [FK_Commandes_AspNetUsers]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Produits] FOREIGN KEY([produit_id])
REFERENCES [dbo].[Produits] ([produit_id])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Produits]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AspNetUsers]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_Produits_Inventaire1] FOREIGN KEY([inventaire_id])
REFERENCES [dbo].[Inventaire] ([inventaire_id])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_Produits_Inventaire1]
GO
ALTER TABLE [dbo].[Produits_Commandes]  WITH CHECK ADD  CONSTRAINT [FK_Produits_Commandes_Commandes] FOREIGN KEY([commande_id])
REFERENCES [dbo].[Commandes] ([commande_id])
GO
ALTER TABLE [dbo].[Produits_Commandes] CHECK CONSTRAINT [FK_Produits_Commandes_Commandes]
GO
ALTER TABLE [dbo].[Produits_Commandes]  WITH CHECK ADD  CONSTRAINT [FK_Produits_Commandes_Produits] FOREIGN KEY([produit_id])
REFERENCES [dbo].[Produits] ([produit_id])
GO
ALTER TABLE [dbo].[Produits_Commandes] CHECK CONSTRAINT [FK_Produits_Commandes_Produits]
GO
ALTER TABLE [dbo].[Retour_Commandes]  WITH CHECK ADD  CONSTRAINT [FK_Retour_Commandes_Commandes] FOREIGN KEY([commande_id])
REFERENCES [dbo].[Commandes] ([commande_id])
GO
ALTER TABLE [dbo].[Retour_Commandes] CHECK CONSTRAINT [FK_Retour_Commandes_Commandes]
GO
ALTER TABLE [dbo].[Utilisateurs_info]  WITH CHECK ADD  CONSTRAINT [FK_Utilisateurs_info_AspNetUsers] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Utilisateurs_info] CHECK CONSTRAINT [FK_Utilisateurs_info_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [Joaco] SET  READ_WRITE 
GO
