USE [EEITDB]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2018/5/22 下午 04:42:44 ******/
DROP TABLE [dbo].[Member]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2018/5/22 下午 04:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[memberSeqNo] [int] IDENTITY(10000,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[password] [varchar](max) NULL,
	[nickname] [varchar](50) NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[gender] [varchar](10) NULL,
	[email] [varchar](max) NOT NULL,
	[address] [varchar](50) NULL,
	[birthday] [datetime] NULL,
	[photoPath] [varchar](max) NULL,
	[photoName] [varchar](500) NULL,
	[phone] [varchar](15) NULL,
	[registerdate] [datetime] NOT NULL,
	[lastlogin] [datetime] NOT NULL,
	[subscription] [bigint] NOT NULL,
	[ban] [bit] NOT NULL,
 CONSTRAINT [PK__Member__EA162E107C9E0CE0] PRIMARY KEY CLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10004, N'AXB', N'56j50da5ek2', N'DD', N'ASAA', N'CC', N'男性', N'axbxsd10@gmail.com', N'1321231', CAST(N'2019-12-30T00:00:00.000' AS DateTime), N'C:/resources/images/members/AXB/photo/AXB.jpg', N'1001.jpg', N'121321', CAST(N'2018-05-09T15:51:45.143' AS DateTime), CAST(N'2018-05-09T15:51:45.143' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10000, N'bob', N'123', N'BOB', N'包柏', N'陳', N'男性', N'2222@gmail.com', N'台北市', CAST(N'1968-06-04T00:00:00.000' AS DateTime), N'C:/resources/images/members/bob/photo/bob.PNG', N'h2.PNG', N'0937123456', CAST(N'2018-05-06T14:34:24.653' AS DateTime), CAST(N'2018-05-22T12:56:16.097' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10006, N'boen', N'123', N'博博', N'恩恩', N'米', N'男性', N'boen@gmail.com', N'bb', CAST(N'2018-01-28T00:00:00.000' AS DateTime), N'C:/resources/images/members/boen/photo/boen.jpg', N'1011.jpg', N'11131', CAST(N'2018-05-15T12:03:03.267' AS DateTime), CAST(N'2018-05-21T13:54:50.930' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10005, N'dddsda', N'123', N'123', N'123', N'123', N'男性', N'123@123', N'', CAST(N'2001-01-01T00:00:00.000' AS DateTime), N'C:/resources/images/members/dddsda/photo/dddsda.jpg', N'1001.jpg', N'5555555', CAST(N'2018-05-10T09:16:17.143' AS DateTime), CAST(N'2018-05-10T09:16:17.143' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10007, N'Jack', N'123', N'傑克', N'王', N'捷克', N'男性', N'Jack@gmail.com', N'苗栗', CAST(N'1995-01-19T00:00:00.000' AS DateTime), N'C:/resources/images/members/Jack/photo/Jack.gif', N'1e30e924b899a9012f6cc08a11950a7b0208f535.gif', N'0988754231', CAST(N'2018-05-17T10:32:13.490' AS DateTime), CAST(N'2018-05-17T10:32:13.490' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10003, N'jerry', N'lekc900fi8kdji', N'小87', N'米', N'米', N'男性', N'sara77656@gmail.com', N'123131231', CAST(N'2018-12-29T00:00:00.000' AS DateTime), N'C:/resources/images/members/jerry/photo/jerry.jpg', N'h1.jpg', N'213113213', CAST(N'2018-05-09T15:36:11.000' AS DateTime), CAST(N'2018-05-09T15:36:11.000' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10001, N'micky', N'123', N'MICKY', N'米奇', N'陳', N'男性', N'333@gmail.com', N'台灣', CAST(N'2018-05-03T00:00:00.000' AS DateTime), N'C:/resources/images/members/micky/photo/micky.png', N'javascript.png', N'0937456789', CAST(N'2018-05-06T14:35:36.587' AS DateTime), CAST(N'2018-05-22T09:59:47.930' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10020, N'projectstorageeeit100', N'029f269f3f06af1e93dac67063977f713a77f19e', N'', N'資料庫', N'專題', NULL, N'projectstorageeeit100@gmail.com', N'', NULL, N'C:\resources\images\members\projectstorageeeit100\photo\\projectstorageeeit100.png', NULL, N'', CAST(N'2018-05-22T16:37:21.120' AS DateTime), CAST(N'2018-05-22T16:39:41.310' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10002, N'snoopy', N'123', N'SNOOPY', N'奴比', N'使', N'男性', N'444@gmail.com', N'天堂', CAST(N'1966-01-03T00:00:00.000' AS DateTime), N'C:/resources/images/members/snoopy/photo/snoopy.jpg', N'net.jpg', N'0932963852', CAST(N'2018-05-06T14:36:53.253' AS DateTime), CAST(N'2018-05-20T16:59:21.870' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10014, N'tom ya', N'029f269f3f06af1e93dac67063977f713a77f19e', NULL, N'tom', N'ya', NULL, N'strike5931@gmail.com', NULL, NULL, NULL, NULL, NULL, CAST(N'2018-05-22T16:01:52.717' AS DateTime), CAST(N'2018-05-22T16:27:25.003' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10008, N'vic', N'123', N'安安', N'陳', N'小安', N'男性', N'vic@gmail.com', N'北市', CAST(N'1998-02-12T00:00:00.000' AS DateTime), N'C:/resources/images/members/vic/photo/vic.jpg', N'1011.jpg', N'0988776542', CAST(N'2018-05-20T11:31:16.193' AS DateTime), CAST(N'2018-05-20T15:19:45.087' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Member] OFF
