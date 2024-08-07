USE [master]
GO
/****** Object:  Database [sale_manager]    Script Date: 6/29/2024 9:18:45 PM ******/
CREATE DATABASE [sale_manager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sale_manager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.STUDY\MSSQL\DATA\sale_manager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sale_manager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.STUDY\MSSQL\DATA\sale_manager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [sale_manager] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sale_manager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sale_manager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sale_manager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sale_manager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sale_manager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sale_manager] SET ARITHABORT OFF 
GO
ALTER DATABASE [sale_manager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sale_manager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sale_manager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sale_manager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sale_manager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sale_manager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sale_manager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sale_manager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sale_manager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sale_manager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sale_manager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sale_manager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sale_manager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sale_manager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sale_manager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sale_manager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sale_manager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sale_manager] SET RECOVERY FULL 
GO
ALTER DATABASE [sale_manager] SET  MULTI_USER 
GO
ALTER DATABASE [sale_manager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sale_manager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sale_manager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sale_manager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sale_manager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sale_manager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sale_manager', N'ON'
GO
ALTER DATABASE [sale_manager] SET QUERY_STORE = ON
GO
ALTER DATABASE [sale_manager] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [sale_manager]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 6/29/2024 9:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[Country] [varchar](15) NOT NULL,
	[Password] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/29/2024 9:18:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/29/2024 9:18:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/29/2024 9:18:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [varchar](40) NOT NULL,
	[Weight] [varchar](20) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (1, N'minhdlh.dev@gmail.com', N'FPT', N'Ho Chi Minh', N'Viet Nam', N'12345')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (2, N'dlhminh2003@gmail.com', N'FPT', N'HCM', N'HCM', N'12345')
GO
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (0, 1, CAST(N'2024-06-27T11:59:38.257' AS DateTime), CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-06-27T15:25:45.817' AS DateTime), 30.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (1, 1, CAST(N'2024-06-27T14:22:19.517' AS DateTime), CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-06-27T15:30:31.500' AS DateTime), 30.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (2, 1, CAST(N'2024-06-27T15:52:55.513' AS DateTime), CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-06-27T19:58:48.990' AS DateTime), 30.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (3, 1, CAST(N'2024-06-27T15:57:48.603' AS DateTime), CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(N'2024-06-27T20:52:33.317' AS DateTime), 30.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (4, 1, CAST(N'2024-06-27T16:04:21.570' AS DateTime), CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-06-27T20:52:34.740' AS DateTime), 30.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (5, 1, CAST(N'2024-06-27T21:01:59.240' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), CAST(N'2024-06-27T21:02:21.243' AS DateTime), 30.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (6, 1, CAST(N'2024-06-27T21:13:07.817' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), CAST(N'2024-06-27T21:13:32.623' AS DateTime), 30.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (7, 1, CAST(N'2024-06-27T21:19:07.663' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), CAST(N'2024-06-27T21:19:30.540' AS DateTime), 30.0000)
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (0, 0, 100000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 0, 75000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 25000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 2, 10000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 3, 1000000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (2, 0, 75000.0000, 5, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 0, 75000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 1, 25000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 2, 10000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 3, 1000000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 0, 75000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 1, 25000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 3, 1000000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 0, 75000.0000, 2, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 1, 25000.0000, 2, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 0, 75000.0000, 2, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 1, 25000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 2, 10000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 3, 1000000.0000, 1, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 4, 33000.0000, 2, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 5, 39000.0000, 2, 0)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 6, 18000.0000, 2, 0)
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (0, 1, N'Thu?c ng?', N'5', 75000.0000, 96)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (1, 1, N'Thu?c x?', N'10', 25000.0000, 97)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (2, 1, N'Thu?c nhu?n tràng', N'12', 10000.0000, 99)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (3, 1, N'Thu?c l?c', N'10', 1000000.0000, 99)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (4, 2, N'Thu?c axetot', N'4', 33000.0000, 98)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (5, 2, N'Thu?c s?t', N'2', 39000.0000, 98)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (6, 2, N'Thu?c chu?t', N'1', 18000.0000, 98)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [sale_manager] SET  READ_WRITE 
GO
