USE [master]
GO
/****** Object:  Database [OUD_Perfume]    Script Date: 6/29/2025 12:59:20 AM ******/
CREATE DATABASE [OUD_Perfume]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OUD_Perfume', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OUD_Perfume.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OUD_Perfume_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OUD_Perfume_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OUD_Perfume] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OUD_Perfume].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OUD_Perfume] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OUD_Perfume] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OUD_Perfume] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OUD_Perfume] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OUD_Perfume] SET ARITHABORT OFF 
GO
ALTER DATABASE [OUD_Perfume] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OUD_Perfume] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OUD_Perfume] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OUD_Perfume] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OUD_Perfume] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OUD_Perfume] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OUD_Perfume] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OUD_Perfume] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OUD_Perfume] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OUD_Perfume] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OUD_Perfume] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OUD_Perfume] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OUD_Perfume] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OUD_Perfume] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OUD_Perfume] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OUD_Perfume] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OUD_Perfume] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OUD_Perfume] SET RECOVERY FULL 
GO
ALTER DATABASE [OUD_Perfume] SET  MULTI_USER 
GO
ALTER DATABASE [OUD_Perfume] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OUD_Perfume] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OUD_Perfume] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OUD_Perfume] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OUD_Perfume] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OUD_Perfume] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OUD_Perfume', N'ON'
GO
ALTER DATABASE [OUD_Perfume] SET QUERY_STORE = ON
GO
ALTER DATABASE [OUD_Perfume] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OUD_Perfume]
GO
/****** Object:  Table [dbo].[tblCartItems]    Script Date: 6/29/2025 12:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCartItems](
	[CartItemID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PerfumeID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_tblCartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 6/29/2025 12:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[PerfumeID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 6/29/2025 12:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TotalPrice] [decimal](10, 2) NULL,
	[OrderDate] [datetime] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPerfumes]    Script Date: 6/29/2025 12:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPerfumes](
	[PerfumeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NULL,
	[Discount] [decimal](10, 2) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[Origin] [nvarchar](max) NULL,
	[Size] [int] NULL,
 CONSTRAINT [PK_tblPerfumes] PRIMARY KEY CLUSTERED 
(
	[PerfumeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTestimonials]    Script Date: 6/29/2025 12:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestimonials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblTestimonials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/29/2025 12:59:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [PerfumeID], [Quantity], [UnitPrice]) VALUES (3026, 3013, 6, 3, CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [PerfumeID], [Quantity], [UnitPrice]) VALUES (3027, 3013, 5, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [PerfumeID], [Quantity], [UnitPrice]) VALUES (3028, 3014, 1, 1, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[tblOrderDetails] ([OrderDetailID], [OrderID], [PerfumeID], [Quantity], [UnitPrice]) VALUES (3029, 3014, 2, 1, CAST(400.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([OrderID], [UserID], [TotalPrice], [OrderDate], [PhoneNumber], [Address]) VALUES (3013, 2015, CAST(3630.00 AS Decimal(10, 2)), CAST(N'2025-06-12T16:40:50.077' AS DateTime), N'01094171542', N'El-Bajour')
INSERT [dbo].[tblOrders] ([OrderID], [UserID], [TotalPrice], [OrderDate], [PhoneNumber], [Address]) VALUES (3014, 2014, CAST(990.00 AS Decimal(10, 2)), CAST(N'2025-06-24T02:58:52.963' AS DateTime), N'01094171542', N'El-Bajour')
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPerfumes] ON 

INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (1, N'Chanel', N'Chanel No.5 is an iconic and timeless fragrance from the French fashion house. Known for its floral-aldehydic scent, it''s elegant, classic, and best suited for sophisticated women who love a bold, clean signature scent.', CAST(500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/img4.png', N'France', 50)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (2, N'Black Oud', N'Black Oud is a deep and mysterious fragrance featuring rich notes of oud wood, smoky leather, and spices. Perfect for evening wear and cold weather, it offers a luxurious and long-lasting scent trail.', CAST(400.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/black.jpg', N'Egypt', 50)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (3, N'Golden Oud', N'Golden Oud combines the richness of oud with sweet amber and hints of saffron. It creates a warm and inviting fragrance that feels both regal and sensual—great for special occasions.', CAST(600.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/golden.jpg', N'Egypt', 100)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (4, N'Versace', N'Versace Eros is a bold, fresh, and sexy scent for men. With notes of mint, green apple, and tonka bean, it’s energetic and youthful, ideal for casual and night-time wear.', CAST(800.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/1.jpg', N'Italy', 100)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (5, N'Si', N'Si is a modern chypre fragrance for women. It features notes of blackcurrant, vanilla, and rose, making it sweet, elegant, and empowering. It suits confident, modern women who embrace their femininity.', CAST(1200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/6f.png', N'Italy', 150)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (6, N'Sauvage', N'Sauvage is a fresh and spicy fragrance for men. With bergamot, pepper, and ambroxan, it delivers a rugged, masculine scent that’s clean yet intense—perfect for daily wear and leaving a bold impression.', CAST(700.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/3.jpg', N'France', 100)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (7, N'Jimmy Choo', N'Jimmy Choo EDP is a glamorous, feminine fragrance. It blends pear, tiger orchid, and toffee into a sweet and seductive scent ideal for a night out or romantic evenings.', CAST(400.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/4.png', N'France', 50)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (8, N'Sedley', N'Sedley is a luxurious fresh-woody fragrance that blends citrus, mint, lavender, and woody notes. It''s refined, energetic, and balanced, making it great for men who want elegance with freshness.', CAST(900.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/5.jpg', N'France', 30)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (9, N'Erba Pura', N'Erba Pura is a luxurious unisex fragrance that combines fresh citrus fruits with sweet exotic notes and a warm base of vanilla, musk, and amber. It''s a vibrant, long-lasting scent that feels both elegant and modern — perfect for any occasion.

', CAST(500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/2fm.jpg', N'Italy', 50)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (10, N'Bleu de Chanel', N'Bleu de Chanel is a timeless and sophisticated men’s fragrance. It opens with a burst of fresh citrus and mint, balanced by aromatic woods and a warm, sensual base of sandalwood, incense, and amber. Bold yet refined, this scent is perfect for the confident man who leaves a lasting impression.', CAST(1100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/4333fm.jpg', N'France', 100)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (11, N'Varsace Crystal', N'Versace Bright Crystal is a fresh, feminine, and elegant fragrance for women. It features sparkling top notes of pomegranate and yuzu, a floral heart of peony, magnolia, and lotus, and a soft base of musk and amber. A light yet sensual scent that''s perfect for everyday wear.', CAST(1500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/ww7.png', N'France', 100)
INSERT [dbo].[tblPerfumes] ([PerfumeID], [Name], [Description], [Price], [Discount], [ImageURL], [Origin], [Size]) VALUES (12, N'Sultanahmet', N'Sultanahmet', CAST(950.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Images/mahmoud1.jpg', N'Egypt', 150)
SET IDENTITY_INSERT [dbo].[tblPerfumes] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTestimonials] ON 

INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (3, N'Mahmoud Essam', N'mahmoud@fcai.usc.edu.eg', N'This Website is very Amazing and very Beautiful and very Responsive  ')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (5, N'Yazan Mahmoud', N'Yaza@fcai.usc.edu.eg', N'From the most wonderful sites where I bought perfumes and the finest original types, thank you with all my heart, oud')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (1006, N'Yazan Mahmoud', N'mahmoud@fcai.usc.edu.eg', N'This Website is very Amazing and very Beautiful and very Responsive ')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (1007, N'Essam Mahmoud', N'Essam@gmail.com', N'From the most wonderful sites where I bought perfumes and the finest original types, thank you with all my heart, oud')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (1008, N'Mohamed Adel', N'Adel@gmail.com', N'The perfume is amazing! I got so many compliments. Definitely buying again.')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (2007, N'Ali Ahemd', N'Ali@gmail.com', N'From the most wonderful sites where I bought perfumes and the finest original types, thank you with all my heart, oud')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (2008, N'Yazan Mahmoud', N'mahmoud@fcai.usc.edu.eg', N'kkkck;laskd')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (2009, N'Mohamed Adel', N'Mohamed@gmail.com', N'From the most wonderful sites where I bought perfumes and the finest original types, thank you with all my heart, oud')
INSERT [dbo].[tblTestimonials] ([ID], [Name], [Email], [Message]) VALUES (3009, N'abdlrhman', N'ah@gmail.com', N'this site has a very big programing truples that you can discover it easyar then take a candy from baby ')
SET IDENTITY_INSERT [dbo].[tblTestimonials] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserID], [FirstName], [LastName], [Email], [Password], [Role]) VALUES (2014, N'Mahmoud ', N'Essam', N'mahmoud@fcai.usc.edu.eg', N's8WiZg', NULL)
INSERT [dbo].[tblUsers] ([UserID], [FirstName], [LastName], [Email], [Password], [Role]) VALUES (2015, N'Essam', N'Hammad', N'Essam@gmail.com', N's8WiZg', NULL)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
ALTER TABLE [dbo].[tblCartItems] ADD  CONSTRAINT [DF_tblCartItems_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_tblOrders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[tblCartItems]  WITH CHECK ADD  CONSTRAINT [FK_tblCartItems_tblPerfumes] FOREIGN KEY([PerfumeID])
REFERENCES [dbo].[tblPerfumes] ([PerfumeID])
GO
ALTER TABLE [dbo].[tblCartItems] CHECK CONSTRAINT [FK_tblCartItems_tblPerfumes]
GO
ALTER TABLE [dbo].[tblCartItems]  WITH CHECK ADD  CONSTRAINT [FK_tblCartItems_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblCartItems] CHECK CONSTRAINT [FK_tblCartItems_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrders] ([OrderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblPerfumes] FOREIGN KEY([PerfumeID])
REFERENCES [dbo].[tblPerfumes] ([PerfumeID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblPerfumes]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [OUD_Perfume] SET  READ_WRITE 
GO
