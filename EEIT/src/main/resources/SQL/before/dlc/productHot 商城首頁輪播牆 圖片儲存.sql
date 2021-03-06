USE [EEITDB]
GO
/****** Object:  Table [dbo].[ProductHot]    Script Date: 2018/5/25 上午 03:01:45 ******/
DROP TABLE [dbo].[ProductHot]
GO
/****** Object:  Table [dbo].[ProductHot]    Script Date: 2018/5/25 上午 03:01:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductHot](
	[productHotSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[productHotFileName] [varchar](max) NOT NULL,
	[productHotFilePath] [varchar](max) NOT NULL,
	[productName] [varchar](max) NULL,
 CONSTRAINT [PK_ProductHot] PRIMARY KEY CLUSTERED 
(
	[productHotSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductHot] ON 

INSERT [dbo].[ProductHot] ([productHotSeqNo], [productHotFileName], [productHotFilePath], [productName]) VALUES (1, N'product01.jpg', N'C:/resources/images/marketcover/product01.jpg', N'productcover1')
INSERT [dbo].[ProductHot] ([productHotSeqNo], [productHotFileName], [productHotFilePath], [productName]) VALUES (2, N'product02.jpg', N'C:/resources/images/marketcover/product02.jpg', N'productcover2')
INSERT [dbo].[ProductHot] ([productHotSeqNo], [productHotFileName], [productHotFilePath], [productName]) VALUES (3, N'product03.jpg', N'C:/resources/images/marketcover/product03.jpg', N'productcover3')
INSERT [dbo].[ProductHot] ([productHotSeqNo], [productHotFileName], [productHotFilePath], [productName]) VALUES (4, N'product04.jpg', N'C:/resources/images/marketcover/product04.jpg', N'productcover4')
INSERT [dbo].[ProductHot] ([productHotSeqNo], [productHotFileName], [productHotFilePath], [productName]) VALUES (5, N'product05.jpg', N'C:/resources/images/marketcover/product05.jpg', N'productcover5')
INSERT [dbo].[ProductHot] ([productHotSeqNo], [productHotFileName], [productHotFilePath], [productName]) VALUES (7, N'product06.jpg', N'C:/resources/images/marketcover/product06.jpg', N'最新圖')
INSERT [dbo].[ProductHot] ([productHotSeqNo], [productHotFileName], [productHotFilePath], [productName]) VALUES (8, N'004.jpg', N'C:/resources/images/marketcover/004.jpg', N'最新圖')
SET IDENTITY_INSERT [dbo].[ProductHot] OFF
