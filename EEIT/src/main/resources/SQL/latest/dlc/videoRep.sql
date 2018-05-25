USE [EEITDB]
GO
/****** Object:  Table [dbo].[VideoReport]    Script Date: 2018/5/25 下午 03:06:45 ******/
DROP TABLE [dbo].[VideoReport]
GO
/****** Object:  Table [dbo].[VideoReport]    Script Date: 2018/5/25 下午 03:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoReport](
	[videoReportSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[videoReportArticle] [varchar](max) NOT NULL,
	[videoReportDate] [datetime] NOT NULL,
	[videoReportStatus] [varchar](50) NOT NULL,
	[account] [varchar](255) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
	[videoReportType] [varchar](50) NOT NULL,
	[videoReportReply] [varchar](max) NULL,
	[videoTitle] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VideoReport] ON 

INSERT [dbo].[VideoReport] ([videoReportSeqNo], [videoReportArticle], [videoReportDate], [videoReportStatus], [account], [videoSeqNo], [videoReportType], [videoReportReply], [videoTitle]) VALUES (2, N'暴力~~', CAST(N'2018-05-24T21:46:08.390' AS DateTime), N'pending', N'micky', 71, N'暴力', NULL, N'zzzzzzzzzzzzzzzzcx')
SET IDENTITY_INSERT [dbo].[VideoReport] OFF
