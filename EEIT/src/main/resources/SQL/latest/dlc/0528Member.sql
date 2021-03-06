USE [EEITDB]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2018/5/28 上午 11:18:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[memberSeqNo] [int] IDENTITY(10000,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[password] [varchar](max) NULL,
	[nickname] [varchar](50) NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
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
	[googleMark] [bit] NULL,
 CONSTRAINT [PK__Member__EA162E107C9E0CE0] PRIMARY KEY CLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10023, N'abb', N'123', N'傑瑞', N'張', N'傑瑞', N'男性', N'strike5931@gmail.com', N'台北市大安區復興南路一段390號', CAST(N'1994-06-01T00:00:00.000' AS DateTime), N'C:/resources/images/members/abb/photo/abb.jpg', N'下載 (1).jpg', N'0954873548', CAST(N'2018-05-27T13:53:41.350' AS DateTime), CAST(N'2018-05-27T13:53:49.447' AS DateTime), 0, 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10030, N'axbxsd10', N'eyJhbGciOiJSUzI1NiIsImtpZCI6IjNiY2YwYjNjYzg2MmEwYWM3NzA5MmY3MmI0ZGZkYjIwYTgxMDBkZjAifQ.eyJhenAiOiI2Mzk3NzE4MDg1MC1samxpbmJjN2pzZDFlcGV1bzNlYzM0bGhtcjk0YXQ1aC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImF1ZCI6IjYzOTc3MTgwODUwLWxqbGluYmM3anNkMWVwZXVvM2VjMzRsaG1yOTRhdDVoLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTE1OTk5NTgwNzEzNDk3NDg0MTUyIiwiZW1haWwiOiJheGJ4c2QxMEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IjNhM1hfN2ZfdFdGLWpaOTZIVFhRdUEiLCJleHAiOjE1Mjc0ODA2MDksImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJqdGkiOiJhZTMyZTkzMmIxMjNjZjVhZGE0OWI2NDljMDM3ZWIyOTEwOWYwYWI0IiwiaWF0IjoxNTI3NDc3MDA5LCJuYW1lIjoi6aOf5p2QIiwicGljdHVyZSI6Imh0dHBzOi8vbGg0Lmdvb2dsZXVzZXJjb250ZW50LmNvbS8tYUFCVVd5ZzVjdFkvQUFBQUFBQUFBQUkvQUFBQUFBQUFBQUEvQUljZmRYQVBZSms5X1Bud3VtTnp3WTd2RDlhRzZGLXNady9zOTYtYy9waG90by5qcGciLCJnaXZlbl9uYW1lIjoi5p2QIiwiZmFtaWx5X25hbWUiOiLpo58iLCJsb2NhbGUiOiJ6aC1UVyJ9.VWxV4H_qnmLYM8mc_kqw0EkG6ee16zY00Rf2DUUm4sWr5JEKXh_jxPkVG1LkZMVMDHoVgPx5iHXVvodzeRprmucrpXC3O73p5BZwNJHlcB8CZTsbF0zRwu2zkjwHHuQarvprrOuuUXQlJRROPm37LMJekTnN_-3kBByANXS8XEC3w1fIb9U2krrZTSQ3wY-BkD0HlWKCxY2upqzrw07vMAQmeTGj1AW9SeKoDsMSPU9h-1575c3o2COrKAu-t3LS3P8OG0xROPt1FSrfKOswPu2tJ732Km6GjYe-zkZ0fBBFMjpyUYFQXltd1vnbHMSIg5bzTDTe_bjKGBS78N-dnQ', NULL, NULL, NULL, NULL, N'axbxsd10@gmail.com', NULL, NULL, N'C:\resources\images\members\axbxsd10\photo\\axbxsd10.png', NULL, NULL, CAST(N'2018-05-28T11:10:09.137' AS DateTime), CAST(N'2018-05-28T11:10:09.137' AS DateTime), 0, 0, 1)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10000, N'bob', N'123', N'BOB', N'包柏', N'陳', N'男性', N'2222@gmail.com', N'台北市', CAST(N'1968-06-04T00:00:00.000' AS DateTime), N'C:/resources/images/members/bob/photo/bob.jpg', N'eclipse.jpg', N'0937123456', CAST(N'2018-05-06T14:34:24.653' AS DateTime), CAST(N'2018-05-26T11:32:00.027' AS DateTime), 0, 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10006, N'boen', N'123', N'博博', N'恩恩', N'米', N'男性', N'boen@gmail.com', N'bb', CAST(N'2018-01-28T00:00:00.000' AS DateTime), N'C:/resources/images/members/boen/photo/boen.jpg', N'1011.jpg', N'11131', CAST(N'2018-05-15T12:03:03.267' AS DateTime), CAST(N'2018-05-21T13:54:50.930' AS DateTime), 0, 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10005, N'dddsda', N'123', N'123', N'123', N'123', N'男性', N'123@123', N'', CAST(N'2001-01-01T00:00:00.000' AS DateTime), N'C:/resources/images/members/dddsda/photo/dddsda.jpg', N'1001.jpg', N'5555555', CAST(N'2018-05-10T09:16:17.143' AS DateTime), CAST(N'2018-05-10T09:16:17.143' AS DateTime), 0, 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10007, N'Jack', N'123', N'傑克', N'王', N'捷克', N'男性', N'Jack@gmail.com', N'苗栗', CAST(N'1995-01-19T00:00:00.000' AS DateTime), N'C:/resources/images/members/Jack/photo/Jack.gif', N'1e30e924b899a9012f6cc08a11950a7b0208f535.gif', N'0988754231', CAST(N'2018-05-17T10:32:13.490' AS DateTime), CAST(N'2018-05-17T10:32:13.490' AS DateTime), 0, 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10001, N'micky', N'123', N'MICKY', N'米奇', N'陳', N'男性', N'333@gmail.com', N'台灣', CAST(N'2018-05-03T00:00:00.000' AS DateTime), N'C:/resources/images/members/micky/photo/micky.png', N'javascript.png', N'0937456789', CAST(N'2018-05-06T14:35:36.587' AS DateTime), CAST(N'2018-05-25T01:14:55.207' AS DateTime), 0, 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10002, N'snoopy', N'123', N'SNOOPY', N'奴比', N'使', N'男性', N'444@gmail.com', N'天堂', CAST(N'1966-01-03T00:00:00.000' AS DateTime), N'C:/resources/images/members/snoopy/photo/snoopy.jpg', N'net.jpg', N'0932963852', CAST(N'2018-05-06T14:36:53.253' AS DateTime), CAST(N'2018-05-20T16:59:21.870' AS DateTime), 0, 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban], [googleMark]) VALUES (10008, N'vic', N'123', N'安安', N'陳', N'小安', N'男性', N'vic@gmail.com', N'北市', CAST(N'1998-02-12T00:00:00.000' AS DateTime), N'C:/resources/images/members/vic/photo/vic.jpg', N'1011.jpg', N'0988776542', CAST(N'2018-05-20T11:31:16.193' AS DateTime), CAST(N'2018-05-20T15:19:45.087' AS DateTime), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Member] OFF
