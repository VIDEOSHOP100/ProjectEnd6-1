USE [EEITDB]
GO
/****** Object:  Table [dbo].[ProTransport]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProTransport]
GO
/****** Object:  Table [dbo].[ProPayType]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProPayType]
GO
/****** Object:  Table [dbo].[ProductPicture]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProductPicture]
GO
/****** Object:  Table [dbo].[ProductHot]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProductHot]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[ProCategory]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProCategory]
GO
/****** Object:  Table [dbo].[ProCartList]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProCartList]
GO
/****** Object:  Table [dbo].[ProCart]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProCart]
GO
/****** Object:  Table [dbo].[ProBrand]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProBrand]
GO
/****** Object:  Table [dbo].[ProAdvertisement]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[ProAdvertisement]
GO
/****** Object:  Table [dbo].[PersonShop]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[PersonShop]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[OrderList]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2018/5/14 上午 10:09:34 ******/
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[productSeqNo] [int] NOT NULL,
	[account] [varchar](20) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[totalPrice] [decimal](20, 2) NOT NULL,
	[payStatus] [varchar](50) NOT NULL,
	[logisticStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Order__47082FD67F78A013] PRIMARY KEY CLUSTERED 
(
	[orderSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[orderSeqNo] [int] NOT NULL,
	[proCartListSeqNo] [int] NOT NULL,
	[recipientName] [varchar](50) NOT NULL,
	[recipientTel] [int] NOT NULL,
	[recipientTel2] [int] NULL,
	[recipientAddr] [decimal](10, 1) NOT NULL,
	[recipientNum] [int] NULL,
	[proPayTypeSeqNo] [int] NULL,
 CONSTRAINT [PK_OrderList] PRIMARY KEY CLUSTERED 
(
	[orderSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonShop]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonShop](
	[personShopSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[personShopName] [varchar](max) NOT NULL,
	[personShopCoverFileName] [varchar](max) NOT NULL,
	[personShopCoverFilePath] [varchar](max) NOT NULL,
	[personShopDescription] [varchar](max) NOT NULL,
	[account] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProAdvertisement]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProAdvertisement](
	[proAdverSeqNo] [int] NOT NULL,
	[proAdverName] [varchar](50) NOT NULL,
	[proAdverDay] [int] NOT NULL,
	[proAdverPrice] [varchar](10) NOT NULL,
	[proAdverStatus] [int] NOT NULL,
	[proAdverPicName] [varchar](max) NULL,
	[proAdverPicPath] [varchar](max) NULL,
	[productSeqNo] [nchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProBrand]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProBrand](
	[brandSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [varchar](30) NOT NULL,
	[brandPicPath] [varchar](max) NOT NULL,
 CONSTRAINT [PK__ProBrand__A72B91883E78E390] PRIMARY KEY CLUSTERED 
(
	[brandSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProCart]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCart](
	[proCartSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[proCreateDay] [datetime] NULL,
	[account] [varchar](50) NULL,
 CONSTRAINT [PK_ProCart] PRIMARY KEY CLUSTERED 
(
	[proCartSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProCartList]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCartList](
	[proCartListSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[productSeqNo] [int] NULL,
	[productCount] [int] NULL,
	[account] [varchar](50) NULL,
	[productStatus] [int] NOT NULL,
 CONSTRAINT [PK_ProCartList] PRIMARY KEY CLUSTERED 
(
	[proCartListSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProCategory]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCategory](
	[categorySeqNo] [int] IDENTITY(1,1) NOT NULL,
	[className] [varchar](50) NOT NULL,
	[classChildName] [varchar](50) NOT NULL,
	[productSeqNo] [nchar](10) NULL,
 CONSTRAINT [PK_ProductClass] PRIMARY KEY CLUSTERED 
(
	[categorySeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productSeqNo] [bigint] IDENTITY(1,1) NOT NULL,
	[proName] [varchar](max) NOT NULL,
	[proCategorySeqNo] [int] NOT NULL,
	[proBrand] [varchar](max) NOT NULL,
	[proPrice] [bigint] NOT NULL,
	[proStatus] [int] NOT NULL,
	[proPayTypeSeqNo] [int] NOT NULL,
	[proPcs] [int] NOT NULL,
	[proDescription] [varchar](max) NOT NULL,
	[proTransSeqNo] [int] NOT NULL,
	[proAdverSeqNo] [int] NOT NULL,
	[proVolume] [varchar](50) NOT NULL,
	[proWeight] [decimal](10, 2) NOT NULL,
	[proDate] [datetime] NOT NULL,
	[account] [varchar](50) NOT NULL,
	[picSeqNo] [int] NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[productSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductHot]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductHot](
	[productSeqNo] [int] NOT NULL,
	[productHot] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPicture]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPicture](
	[picSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[proPicSerial] [int] NOT NULL,
	[proPicName] [varchar](max) NOT NULL,
	[proPicPath] [varchar](max) NOT NULL,
	[productSeqNo] [int] NOT NULL,
 CONSTRAINT [PK__ProductP__A35C877CBC8392A5] PRIMARY KEY CLUSTERED 
(
	[picSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProPayType]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProPayType](
	[proPayTypeSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[payType] [varchar](50) NOT NULL,
	[payTypeStatus] [int] NOT NULL,
 CONSTRAINT [PK_ProPayType] PRIMARY KEY CLUSTERED 
(
	[proPayTypeSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProTransport]    Script Date: 2018/5/14 上午 10:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProTransport](
	[proTransSeqNo] [int] NOT NULL,
	[proTransType] [varchar](max) NOT NULL,
	[proTransStatus] [int] NOT NULL,
 CONSTRAINT [PK_ProTransport] PRIMARY KEY CLUSTERED 
(
	[proTransSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProCartList] ON 

INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (1, 1, 6, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (2, 2, 7, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (3, 1, 3, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (4, 2, 3, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (5, 3, 3, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (6, 1, 3, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (7, 2, 3, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (8, 1, 5, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (9, 1, 15, N'micky', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (10, 2, 5, N'micky', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (11, 1, 5, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (12, 2, 5, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (13, 1, 5, N'micky', 1)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (14, 2, 39, N'micky', 1)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (15, 4, 2, N'bob', 2)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (16, 3, 2, N'bob', 1)
INSERT [dbo].[ProCartList] ([proCartListSeqNo], [productSeqNo], [productCount], [account], [productStatus]) VALUES (17, 1, 1, N'bob', 1)
SET IDENTITY_INSERT [dbo].[ProCartList] OFF
SET IDENTITY_INSERT [dbo].[ProCategory] ON 

INSERT [dbo].[ProCategory] ([categorySeqNo], [className], [classChildName], [productSeqNo]) VALUES (1, N'3C', N'筆電', N'2         ')
SET IDENTITY_INSERT [dbo].[ProCategory] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proVolume], [proWeight], [proDate], [account], [picSeqNo]) VALUES (1, N'iphone', 2, N'apple', 1000, 1, 1, 2, N'好用的手機', 2, 5, N'0.2m x0.1m x0.3m', CAST(40.00 AS Decimal(10, 2)), CAST(N'2018-05-09T00:06:09.500' AS DateTime), N'bob', NULL)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proVolume], [proWeight], [proDate], [account], [picSeqNo]) VALUES (2, N'ps4', 1, N'sony', 5000, 1, 1, 2, N'超低特價', 2, 2, N'100m3', CAST(10.00 AS Decimal(10, 2)), CAST(N'2018-05-09T00:07:04.117' AS DateTime), N'bob', NULL)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proVolume], [proWeight], [proDate], [account], [picSeqNo]) VALUES (3, N'ps4', 1, N'sony', 88, 1, 1, 2, N'超低特價', 2, 2, N'100m3', CAST(10.00 AS Decimal(10, 2)), CAST(N'2018-05-09T00:07:35.997' AS DateTime), N'bob', NULL)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proVolume], [proWeight], [proDate], [account], [picSeqNo]) VALUES (4, N'google 耳機', 1, N'google', 20, 1, 1, 1, N'藍芽耳機喔', 1, 1, N'20m3', CAST(50.00 AS Decimal(10, 2)), CAST(N'2018-05-09T00:10:55.613' AS DateTime), N'micky', NULL)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proVolume], [proWeight], [proDate], [account], [picSeqNo]) VALUES (5, N'msi筆電', 1, N'msi', 50000, 1, 2, 20, N'超級電競筆電', 2, 0, N'0.2m x0.1m x0.3m', CAST(5.00 AS Decimal(10, 2)), CAST(N'2018-05-09T22:37:10.193' AS DateTime), N'bob', 5)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proVolume], [proWeight], [proDate], [account], [picSeqNo]) VALUES (6, N'dafas', 1, N'fdsfadfa', 34134, 1, 1, 12, N'adsfadf', 1, 0, N'adfa', CAST(123.00 AS Decimal(10, 2)), CAST(N'2018-05-09T23:34:28.883' AS DateTime), N'', 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductPicture] ON 

INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1, 1, N'商品05.jpg', N'C:/resources/images/product/bob/商品05.jpg', 1)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (2, 1, N'003.jpg', N'C:/resources/images/product/bob/003.jpg', 2)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (3, 1, N'001.jpg', N'C:/resources/images/product/bob/001.jpg', 3)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (4, 1, N'0481838_google-chromecast-hdmi-v3-.jpeg', N'C:/resources/images/product/micky/0481838_google-chromecast-hdmi-v3-.jpeg', 4)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (5, 1, N'商品01.jpg', N'C:/resources/images/product/bob/商品01.jpg', 5)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (6, 1, N'clothes02.jpg', N'C:/resources/images/product//clothes02.jpg', 6)
SET IDENTITY_INSERT [dbo].[ProductPicture] OFF
SET IDENTITY_INSERT [dbo].[ProPayType] ON 

INSERT [dbo].[ProPayType] ([proPayTypeSeqNo], [payType], [payTypeStatus]) VALUES (1, N'WebATM', 0)
INSERT [dbo].[ProPayType] ([proPayTypeSeqNo], [payType], [payTypeStatus]) VALUES (2, N'信用卡付款', 0)
INSERT [dbo].[ProPayType] ([proPayTypeSeqNo], [payType], [payTypeStatus]) VALUES (3, N'ATM轉帳', 0)
INSERT [dbo].[ProPayType] ([proPayTypeSeqNo], [payType], [payTypeStatus]) VALUES (4, N'線上支付(歐付寶)', 0)
INSERT [dbo].[ProPayType] ([proPayTypeSeqNo], [payType], [payTypeStatus]) VALUES (5, N'貨到付款', 0)
SET IDENTITY_INSERT [dbo].[ProPayType] OFF
INSERT [dbo].[ProTransport] ([proTransSeqNo], [proTransType], [proTransStatus]) VALUES (1, N'包裹郵寄', 0)
INSERT [dbo].[ProTransport] ([proTransSeqNo], [proTransType], [proTransStatus]) VALUES (2, N'7-11店到店', 0)
INSERT [dbo].[ProTransport] ([proTransSeqNo], [proTransType], [proTransStatus]) VALUES (3, N'Fami 店到店', 0)
INSERT [dbo].[ProTransport] ([proTransSeqNo], [proTransType], [proTransStatus]) VALUES (4, N'黑貓宅配', 0)
