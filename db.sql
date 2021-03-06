USE [master]
GO
/****** Object:  Database [BlogProject]    Script Date: 19.07.2018 13:29:36 ******/
CREATE DATABASE [BlogProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BlogProject.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BlogProject_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogProject] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogProject] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BlogProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogProject] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogProject] SET  MULTI_USER 
GO
ALTER DATABASE [BlogProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlogProject', N'ON'
GO
USE [BlogProject]
GO
/****** Object:  Table [dbo].[Iletisim]    Script Date: 19.07.2018 13:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iletisim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nchar](50) NULL,
	[Email] [nchar](50) NULL,
	[Mesaj] [nchar](200) NULL,
 CONSTRAINT [PK_Iletisim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 19.07.2018 13:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [varchar](50) NULL,
	[Sira] [int] NULL,
	[CreateUserId] [int] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 19.07.2018 13:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Parola] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Yetki] [int] NULL,
	[Onay] [bit] NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KullaniciYetki]    Script Date: 19.07.2018 13:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KullaniciYetki](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YetkiAdi] [varchar](50) NULL,
 CONSTRAINT [PK_KullaniciYetki] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Makale]    Script Date: 19.07.2018 13:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Makale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MakaleAdi] [varchar](50) NULL,
	[MakaleOzeti] [varchar](200) NULL,
	[MakaleDetayi] [varchar](max) NULL,
	[Resim] [varchar](50) NULL,
	[KategoriId] [int] NULL,
	[CreateUserId] [int] NULL,
	[Hit] [int] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Makale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 19.07.2018 13:29:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Yorum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Yorum] [varchar](250) NULL,
	[MakaleId] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Onay] [bit] NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Iletisim] ON 

INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (5, N'meliha                                            ', N'musabaran46@gmail.com                             ', N'deneme                                                                                                                                                                                                  ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (6, N'meliha                                            ', N'melihasayar6@gmail.com                            ', N'ilk mesaj                                                                                                                                                                                               ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (7, N'meliha                                            ', N'musa.baran@hotmail.com                            ', N'deneme                                                                                                                                                                                                  ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (8, N'meliha                                            ', N'melihasayar6@gmail.com                            ', N'test                                                                                                                                                                                                    ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (9, N'musa baran                                        ', N'musa.baran@hotmail.com                            ', N'merhaba musa ? naber                                                                                                                                                                                    ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (10, N'Ahmet test                                        ', N'musabaran46@gmail.com                             ', N'asfsdfsdfsdfsa                                                                                                                                                                                          ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (11, N'Ahmet test                                        ', N'musabaran46@gmail.com                             ', N'asfsdfsdfsdfsa                                                                                                                                                                                          ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (12, N'musa baran                                        ', N'musabaran46@gmail.com                             ', N'musaaaa musaaa barannn                                                                                                                                                                                  ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (15, N'meliha                                            ', N'melihasayar9@gmail.com                            ', N'ilk mesaj                                                                                                                                                                                               ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (21, N'büşra                                             ', N'melihasayar9@gmail.com                            ', N'merhaba                                                                                                                                                                                                 ')
INSERT [dbo].[Iletisim] ([Id], [AdSoyad], [Email], [Mesaj]) VALUES (22, N'Ayşe                                              ', N'melihasayar9@gmail.com                            ', N'bir mesaj bıraktım                                                                                                                                                                                      ')
SET IDENTITY_INSERT [dbo].[Iletisim] OFF
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([Id], [KategoriAdi], [Sira], [CreateUserId], [CreateTime]) VALUES (1, N'Genel', 1, 1, CAST(0x0000A91800000000 AS DateTime))
INSERT [dbo].[Kategori] ([Id], [KategoriAdi], [Sira], [CreateUserId], [CreateTime]) VALUES (10, N'Günlük', 6, 1, CAST(0x0000A91A00BEE9B5 AS DateTime))
INSERT [dbo].[Kategori] ([Id], [KategoriAdi], [Sira], [CreateUserId], [CreateTime]) VALUES (11, N'Teknoloji', 3, 1, CAST(0x0000A91B00ABC93D AS DateTime))
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([Id], [AdSoyad], [KullaniciAdi], [Parola], [Email], [Yetki], [Onay]) VALUES (1, N'Meliha Sayar', N'admin', N'123', N'melihasayar@gmail.com', 2, 1)
INSERT [dbo].[Kullanici] ([Id], [AdSoyad], [KullaniciAdi], [Parola], [Email], [Yetki], [Onay]) VALUES (2, N'Hande Acar', N'Hande', N'234', N'hande@gmail.com', 1, 0)
INSERT [dbo].[Kullanici] ([Id], [AdSoyad], [KullaniciAdi], [Parola], [Email], [Yetki], [Onay]) VALUES (3, N'Betül Test', N'Betül', N'567', N'betul@gmail.com', 2, 0)
INSERT [dbo].[Kullanici] ([Id], [AdSoyad], [KullaniciAdi], [Parola], [Email], [Yetki], [Onay]) VALUES (4, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Kullanici] ([Id], [AdSoyad], [KullaniciAdi], [Parola], [Email], [Yetki], [Onay]) VALUES (5, NULL, N'fdgsr', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[KullaniciYetki] ON 

INSERT [dbo].[KullaniciYetki] ([Id], [YetkiAdi]) VALUES (1, N'Admin')
INSERT [dbo].[KullaniciYetki] ([Id], [YetkiAdi]) VALUES (2, N'Editör')
SET IDENTITY_INSERT [dbo].[KullaniciYetki] OFF
SET IDENTITY_INSERT [dbo].[Makale] ON 

INSERT [dbo].[Makale] ([Id], [MakaleAdi], [MakaleOzeti], [MakaleDetayi], [Resim], [KategoriId], [CreateUserId], [Hit], [CreateTime]) VALUES (3, N'İlk deneme', N'tets test', N'ilk deneme', N'b4c06145-acba-4ce2-8349-0c56d383d834.jpg', 1, 1, 1, CAST(0x0000A91800000000 AS DateTime))
INSERT [dbo].[Makale] ([Id], [MakaleAdi], [MakaleOzeti], [MakaleDetayi], [Resim], [KategoriId], [CreateUserId], [Hit], [CreateTime]) VALUES (4, N'deneme', N'test', N'<p>test test</p>', N'cicek.jpg', 10, 1, 0, CAST(0x0000A91900EA10B0 AS DateTime))
INSERT [dbo].[Makale] ([Id], [MakaleAdi], [MakaleOzeti], [MakaleDetayi], [Resim], [KategoriId], [CreateUserId], [Hit], [CreateTime]) VALUES (8, N'İkinci Deneme', N'test', N'<p>testtest<br></p>', N'cicek.jpg', 10, 1, 0, CAST(0x0000A91900F2FB53 AS DateTime))
INSERT [dbo].[Makale] ([Id], [MakaleAdi], [MakaleOzeti], [MakaleDetayi], [Resim], [KategoriId], [CreateUserId], [Hit], [CreateTime]) VALUES (12, N'BU BENİM BLOG YAZIM', N'TEST AMAÇLI', N'<p>GFGFGHFGHFH</p>', N'ebca819c-21ba-40ee-8338-e1456cf6f489.jpg', 10, 1, 0, CAST(0x0000A91A01178FCE AS DateTime))
INSERT [dbo].[Makale] ([Id], [MakaleAdi], [MakaleOzeti], [MakaleDetayi], [Resim], [KategoriId], [CreateUserId], [Hit], [CreateTime]) VALUES (13, N'İkinci Deneme', N'test', N'<p>testtest<br></p>', N'e59903d8-b64d-4b7a-8d97-f430b3ef9388.jpg', 10, 1, 0, CAST(0x0000A91A011810F8 AS DateTime))
INSERT [dbo].[Makale] ([Id], [MakaleAdi], [MakaleOzeti], [MakaleDetayi], [Resim], [KategoriId], [CreateUserId], [Hit], [CreateTime]) VALUES (14, N'İlk Makalem', N'Resim kaydetme', N'<p>Resim kaydetme<small></small><br></p>', N'938ebf5d-5216-4f65-b4a8-1a91fd5f797e1303287541', 10, 1, 0, CAST(0x0000A91F00BFBD8A AS DateTime))
INSERT [dbo].[Makale] ([Id], [MakaleAdi], [MakaleOzeti], [MakaleDetayi], [Resim], [KategoriId], [CreateUserId], [Hit], [CreateTime]) VALUES (15, N'deneme-3', N'kdfks', N'<p>sffdggs</p>', N'08543f1f-c3f8-4fe6-a592-07e1d4d8f000.jpg', 1, 1, 0, CAST(0x0000A91F00C3F6A0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Makale] OFF
SET IDENTITY_INSERT [dbo].[Yorum] ON 

INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (1, N'Esra Aycan', N'esra@gmail.com', N'fjdjkgkfgklksdf', 3, CAST(0x0000A91800000000 AS DateTime), 1)
INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (8, N'Ayşe', N'ayse@gmail.com', N'Yorum yapıldı', 3, CAST(0x0000A91B010958C6 AS DateTime), 0)
INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (9, N'Mehmet Kaya', N'mehmet@gmail.com', N'Yorum yorum', 3, CAST(0x0000A91B010DB87F AS DateTime), 0)
INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (10, N'Burak Yılmaz', N'burak@gmail.com', N'son yorum', 3, CAST(0x0000A91B010E8767 AS DateTime), 0)
INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (11, N'Fatma', N'fatma@gmail.com', N'jfjskjfsf', 4, CAST(0x0000A91B010F8831 AS DateTime), 0)
INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (12, N'meltem', N'meltem@gmail.com', N'ksklfd', 4, CAST(0x0000A91B011C3FD5 AS DateTime), 0)
INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (13, N'Ezgi', N'ezgi@gmail.com', N'lglhfgj', 4, CAST(0x0000A91B011D4F20 AS DateTime), 0)
INSERT [dbo].[Yorum] ([Id], [AdSoyad], [Email], [Yorum], [MakaleId], [CreateTime], [Onay]) VALUES (14, N'musa', N'musabaran46@gmail.com', N'test', 3, CAST(0x0000A920010ECC1E AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Yorum] OFF
ALTER TABLE [dbo].[Kategori]  WITH CHECK ADD  CONSTRAINT [FK_Kategori_Kullanici] FOREIGN KEY([CreateUserId])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[Kategori] CHECK CONSTRAINT [FK_Kategori_Kullanici]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_KullaniciYetki] FOREIGN KEY([Yetki])
REFERENCES [dbo].[KullaniciYetki] ([Id])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_KullaniciYetki]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kategori] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategori] ([Id])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kategori]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kullanici] FOREIGN KEY([CreateUserId])
REFERENCES [dbo].[Kullanici] ([Id])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kullanici]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Makale] FOREIGN KEY([MakaleId])
REFERENCES [dbo].[Makale] ([Id])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Makale]
GO
USE [master]
GO
ALTER DATABASE [BlogProject] SET  READ_WRITE 
GO
