USE [master]
GO
/****** Object:  Database [Electro]    Script Date: 10/17/2024 8:45:46 AM ******/
CREATE DATABASE [Electro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Electro', FILENAME = N'C:\Users\haole\Downloads\ElectroMVC\ElectroMVC\Electro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Electro_log', FILENAME = N'C:\Users\haole\Downloads\ElectroMVC\ElectroMVC\Electro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Electro] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Electro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Electro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Electro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Electro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Electro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Electro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Electro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Electro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Electro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Electro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Electro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Electro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Electro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Electro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Electro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Electro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Electro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Electro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Electro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Electro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Electro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Electro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Electro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Electro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Electro] SET  MULTI_USER 
GO
ALTER DATABASE [Electro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Electro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Electro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Electro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Electro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Electro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Electro] SET QUERY_STORE = ON
GO
ALTER DATABASE [Electro] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Electro]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/17/2024 8:45:47 AM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
	[BrandDescription] [nvarchar](50) NOT NULL,
	[BrandOrder] [int] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryDescription] [nvarchar](50) NOT NULL,
	[CategoryOrder] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[CusAddress] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductPrice] [decimal](18, 2) NULL,
	[ProductDescription] [nvarchar](500) NULL,
	[ProductQuantity] [int] NOT NULL,
	[ProductImage] [nvarchar](255) NULL,
	[CategoryId] [int] NULL,
	[BrandId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[ReviewDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240906124503_initUserTable', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240906143501_brandcategoryproduct', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240921085409_brandcategoryproduct', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandDescription], [BrandOrder]) VALUES (3, N'Samsung', N'Brand for Samsung', 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandDescription], [BrandOrder]) VALUES (4, N'Iphone', N'Iphone brands', 2)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandDescription], [BrandOrder]) VALUES (5, N'Oppo', N'Oppo brand', 3)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandDescription], [BrandOrder]) VALUES (6, N'Nokia', N'Nokia brand', 20)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryOrder]) VALUES (1, N'Smartphones', N'Smartphones', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryOrder]) VALUES (2, N'Accessories', N'Accessories', 2)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 2, CAST(125.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 2, 1, CAST(125.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 3, 1, CAST(150.50 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (4, 3, 1, 1, CAST(100.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalPrice], [Status], [FullName], [CusAddress], [PhoneNumber]) VALUES (1, 1, CAST(N'2024-10-01T10:00:00.000' AS DateTime), CAST(250.00 AS Decimal(10, 2)), 1, N'Lê Hào', N'123 Tây th?nh', N'0902367794')
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalPrice], [Status], [FullName], [CusAddress], [PhoneNumber]) VALUES (2, 2, CAST(N'2024-10-02T11:00:00.000' AS DateTime), CAST(150.50 AS Decimal(10, 2)), 2, N'Van Tru?ng', N'123 Lê tr?ng t?n', N'1234567891')
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalPrice], [Status], [FullName], [CusAddress], [PhoneNumber]) VALUES (3, 1, CAST(N'2024-10-03T12:30:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)), 1, N'Danh', N'123 alo alo', N'9876543211')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentID], [OrderID], [PaymentMethod], [PaymentStatus], [PaymentDate]) VALUES (1, 1, N'Credit Card', N'Completed', CAST(N'2024-10-01T10:05:00.000' AS DateTime))
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [PaymentMethod], [PaymentStatus], [PaymentDate]) VALUES (2, 2, N'PayPal', N'Pending', CAST(N'2024-10-02T11:05:00.000' AS DateTime))
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [PaymentMethod], [PaymentStatus], [PaymentDate]) VALUES (3, 3, N'Bank Transfer', N'Completed', CAST(N'2024-10-03T12:35:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (1, N'Iphone 15 Pro Max', CAST(3000.00 AS Decimal(18, 2)), N'iPhone 15 Pro Max có thiết kế tinh tế với khung titan chắc chắn và nhẹ hơn so với các thế hệ trước. Mặt lưng được làm bằng kính ceramic shield để tăng cường độ bền và khả năng chống xước.', 20, N'-/img/product01.png', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (2, N'Samsung Galaxy Z Fold6', CAST(2800.00 AS Decimal(18, 2)), N'Samsung Galaxy Z Fold6 là một trong những mẫu smartphone gập màn hình mới nhất của Samsung, thuộc dòng Galaxy Z Fold. Đây là một thiết bị cao cấp với nhiều cải tiến và tính năng nổi bật.', 10, N'-/img/product03.png', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (3, N'Iphone 15 Pro Max', CAST(3000.00 AS Decimal(18, 2)), N'iPhone 15 Pro Max có thiết kế tinh tế với khung titan chắc chắn và nhẹ hơn so với các thế hệ trước. Mặt lưng được làm bằng kính ceramic shield để tăng cường độ bền và khả năng chống xước.', 30, N'img/products01.png', 1, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (4, N'Samsung Galaxy Z Fold6', CAST(2800.00 AS Decimal(18, 2)), N'Samsung Galaxy Z Fold6 là một trong những mẫu smartphone gập màn hình mới nhất của Samsung, thuộc dòng Galaxy Z Fold. Đây là một thiết bị cao cấp với nhiều cải tiến và tính năng nổi bật.', 10, N'img/products03.png', 1, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (5, N'Galaxy Buds Pro', CAST(2000.00 AS Decimal(18, 2)), N'Hỗ trợ âm thanh chất lượng cao với công nghệ âm thanh vòm 360 độ, tích hợp công nghệ chống ồn chủ động (ANC) và chế độ âm thanh xung quanh.', 20, N'img/product02.png', 2, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (6, N'Oppo Enco X', CAST(2100.00 AS Decimal(18, 2)), N'Tai nghe true wireless với công nghệ chống ồn chủ động (ANC) và âm thanh chất lượng cao.', 5, N'img/product05.png', 2, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (12, N'DASDASDAS', CAST(12.00 AS Decimal(18, 2)), N'QWE1212', 12, N'/uploads/products/280c0582-b6bd-4af3-b549-f240e7dfe3dd.jpg', 2, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (14, N'Tên S?n Ph?m', CAST(500.00 AS Decimal(18, 2)), N'Mô t? chi ti?t s?n ph?m', 10, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (15, N'Iphone16', CAST(500.00 AS Decimal(18, 2)), N'm?i ra m?t', 10, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductPrice], [ProductDescription], [ProductQuantity], [ProductImage], [CategoryId], [BrandId]) VALUES (16, N'asdasdas', CAST(12.00 AS Decimal(18, 2)), N'sadasd', 12312, N'/uploads/products/6f39dfd9-271c-415c-ab21-4d112b8a66b7.jpg', 1, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [ProductID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (1, 1, 1, 5, N'S?n ph?m r?t t?t!', CAST(N'2024-10-01T10:30:00.000' AS DateTime))
INSERT [dbo].[Review] ([ReviewID], [ProductID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (2, 2, 2, 4, N'Ch?t lu?ng ?n, giao hàng nhanh.', CAST(N'2024-10-02T11:15:00.000' AS DateTime))
INSERT [dbo].[Review] ([ReviewID], [ProductID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (3, 3, 1, 3, N'S?n ph?m bình thu?ng, không nhu mong d?i.', CAST(N'2024-10-03T12:45:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [UserEmail], [UserPassword], [UserRole]) VALUES (1, N'admin', N'admin@gmail.com', N'123456', N'Administrator')
INSERT [dbo].[User] ([UserId], [UserName], [UserEmail], [UserPassword], [UserRole]) VALUES (2, N'customer', N'customer@gmail.com', N'123456', N'Customer')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID], [CreatedAt]) VALUES (1, 1, 1, CAST(N'2024-10-01T09:00:00.000' AS DateTime))
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID], [CreatedAt]) VALUES (2, 2, 2, CAST(N'2024-10-02T10:00:00.000' AS DateTime))
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID], [CreatedAt]) VALUES (3, 1, 3, CAST(N'2024-10-03T11:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
/****** Object:  Index [IX_Product_BrandId]    Script Date: 10/17/2024 8:45:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_BrandId] ON [dbo].[Product]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 10/17/2024 8:45:47 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Unknown') FOR [FullName]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Unknown') FOR [CusAddress]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand_BrandId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryId]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
    @ProductName NVARCHAR(100),
    @ProductPrice DECIMAL(10, 2),
    @ProductDescription NVARCHAR(500),
    @ProductQuantity INT
AS
BEGIN
    INSERT INTO Product (ProductName, ProductPrice, ProductDescription, ProductQuantity)
    VALUES (@ProductName, @ProductPrice, @ProductDescription, @ProductQuantity);
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
AS
BEGIN
    SELECT ProductId, ProductName, ProductPrice, ProductDescription, ProductQuantity
    FROM Product;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetBrandByName]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBrandByName]
    @BrandName NVARCHAR(100)
AS
BEGIN
    SELECT BrandID, BrandName, BrandDescription
    FROM Brand
    WHERE BrandName LIKE '%' + @BrandName + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCategoriesByName]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategoriesByName]
    @CategoryName NVARCHAR(50)
AS
BEGIN
    SELECT CategoryId, CategoryName, CategoryDescription, CategoryOrder
    FROM Category
    WHERE CategoryName LIKE '%' + @CategoryName + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrderById]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrderById]
    @OrderID INT
AS
BEGIN
    SELECT OrderID, UserID, OrderDate, TotalPrice, Status
    FROM Orders
    WHERE OrderID = @OrderID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrderDetailsByID]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrderDetailsByID]
    @OrderID INT
AS
BEGIN
    SELECT od.OrderDetailID, od.ProductID, od.Quantity, od.Price, o.OrderDate, o.Status
    FROM OrderDetail od
    INNER JOIN Orders o ON od.OrderID = o.OrderID
    WHERE od.OrderID = @OrderID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentById]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPaymentById]
    @PaymentID INT
AS
BEGIN
    SELECT PaymentID, OrderID, PaymentMethod, PaymentStatus, PaymentDate
    FROM Payment
    WHERE PaymentID = @PaymentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductsByName]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductsByName]
    @ProductName NVARCHAR(100)
AS
BEGIN
    SELECT ProductId, ProductName, ProductPrice, ProductDescription, ProductQuantity
    FROM Product
    WHERE ProductName LIKE '%' + @ProductName + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[GetReviewById]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReviewById]
    @ReviewID INT
AS
BEGIN
    SELECT ReviewID, ProductID, UserID, Rating, Comment, ReviewDate
    FROM Review
    WHERE ReviewID = @ReviewID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByName]    Script Date: 10/17/2024 8:45:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersByName]
    @UserName NVARCHAR(50)
AS
BEGIN
    SELECT UserId, UserName, UserEmail, UserPassword, UserRole
    FROM [User]
    WHERE UserName LIKE '%' + @UserName + '%';
END;
GO
USE [master]
GO
ALTER DATABASE [Electro] SET  READ_WRITE 
GO
