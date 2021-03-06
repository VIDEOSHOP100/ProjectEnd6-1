USE [EEITDB]
GO
ALTER TABLE [dbo].[WatchHistory] DROP CONSTRAINT [FK_WatchHistory_Video]
GO
ALTER TABLE [dbo].[WatchHistory] DROP CONSTRAINT [FK_WatchHistory_Member]
GO
ALTER TABLE [dbo].[Video] DROP CONSTRAINT [FK_Video_VideoType]
GO
ALTER TABLE [dbo].[SubscriptionUploader] DROP CONSTRAINT [FK_SubscriptionUploader_Member1]
GO
ALTER TABLE [dbo].[SubscriptionUploader] DROP CONSTRAINT [FK_SubscriptionUploader_Member]
GO
ALTER TABLE [dbo].[ReplyCommentVideoLikeUnlike] DROP CONSTRAINT [FK_ReplyCommentVideoLikeUnlike_ReplyCommentVideo]
GO
ALTER TABLE [dbo].[ReplyCommentVideoLikeUnlike] DROP CONSTRAINT [FK_ReplyCommentVideoLikeUnlike_Member]
GO
ALTER TABLE [dbo].[ReplyCommentVideo] DROP CONSTRAINT [FK_ReplyCommentVideo_Member]
GO
ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_Member]
GO
ALTER TABLE [dbo].[LikeUnlikeVideos] DROP CONSTRAINT [FK_LikeUnlikeVideos_Video]
GO
ALTER TABLE [dbo].[LikeUnlikeVideos] DROP CONSTRAINT [FK_LikeUnlikeVideos_Member]
GO
/****** Object:  Table [dbo].[WatchLaterVideo]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[WatchLaterVideo]
GO
/****** Object:  Table [dbo].[WatchHistory]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[WatchHistory]
GO
/****** Object:  Table [dbo].[VideoType]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[VideoType]
GO
/****** Object:  Table [dbo].[VideoReportType]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[VideoReportType]
GO
/****** Object:  Table [dbo].[VideoReport]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[VideoReport]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[SubscriptionUploader]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[SubscriptionUploader]
GO
/****** Object:  Table [dbo].[Sticker]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[Sticker]
GO
/****** Object:  Table [dbo].[ReplyCommentVideoLikeUnlike]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[ReplyCommentVideoLikeUnlike]
GO
/****** Object:  Table [dbo].[ReplyCommentVideo]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[ReplyCommentVideo]
GO
/****** Object:  Table [dbo].[NotificationRecording]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[NotificationRecording]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[MessageType]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[MessageType]
GO
/****** Object:  Table [dbo].[MessageImage]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[MessageImage]
GO
/****** Object:  Table [dbo].[MessageFile]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[MessageFile]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[Message]
GO
/****** Object:  Table [dbo].[LikeUnlikeVideos]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[LikeUnlikeVideos]
GO
/****** Object:  Table [dbo].[CommentVideosLikeUnlike]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[CommentVideosLikeUnlike]
GO
/****** Object:  Table [dbo].[CommentVideos]    Script Date: 2018/5/13 下午 04:04:37 ******/
DROP TABLE [dbo].[CommentVideos]
GO
/****** Object:  Table [dbo].[CommentVideos]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentVideos](
	[commentVideoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](255) NOT NULL,
	[commentArticle] [varchar](255) NOT NULL,
	[commentDate] [datetime2](7) NOT NULL,
	[commentLike] [int] NOT NULL,
	[commentUnLike] [int] NOT NULL,
	[commentVideoStatus] [varchar](255) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
 CONSTRAINT [PK__CommentV__E23E0716FEE5638D] PRIMARY KEY CLUSTERED 
(
	[commentVideoSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentVideosLikeUnlike]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentVideosLikeUnlike](
	[commentLikeUnlikeSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](255) NOT NULL,
	[commentLikeUnLikeDate] [datetime2](7) NOT NULL,
	[commentLikeUnLikeScore] [int] NOT NULL,
	[commentLikeUnlikeStatus] [varchar](255) NOT NULL,
	[commentVideoSeqNo] [int] NOT NULL,
 CONSTRAINT [PK__CommentV__506E0B952BB36D2B] PRIMARY KEY CLUSTERED 
(
	[commentLikeUnlikeSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeUnlikeVideos]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeUnlikeVideos](
	[likeUnlikeVideosSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
	[LikeUnlikeVideosStatus] [varchar](50) NOT NULL,
	[likeUnLikeVideosDate] [datetime] NOT NULL,
	[likeUnlikeVideosScore] [int] NOT NULL,
 CONSTRAINT [PK_LikeUnlikeVideos] PRIMARY KEY CLUSTERED 
(
	[likeUnlikeVideosSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[messageSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[messageArticle] [varchar](max) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[receiverAccount] [varchar](50) NOT NULL,
	[messageDate] [datetime] NOT NULL,
	[messageStatus] [varchar](50) NOT NULL,
	[messageType] [varchar](50) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[messageSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageFile]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageFile](
	[messageFileSeqNo] [int] NULL,
	[messageFileName] [varchar](max) NULL,
	[messageFileFileName] [varchar](max) NULL,
	[messageFileFilePath] [varchar](max) NULL,
	[messageFileType] [varchar](50) NULL,
	[messageFileStatus] [varchar](5) NULL,
	[messageFileScore] [int] NULL,
	[messageFileUploadDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageImage]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageImage](
	[messageImageSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[messageImageName] [varchar](max) NOT NULL,
	[messageImageFileName] [varchar](max) NOT NULL,
	[messageImageFilePath] [varchar](max) NOT NULL,
	[messageImageType] [varchar](50) NOT NULL,
	[messageImageStatus] [varchar](5) NOT NULL,
	[messageImageScore] [int] NOT NULL,
	[messageImageUploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MessageImage] PRIMARY KEY CLUSTERED 
(
	[messageImageSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageType]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageType](
	[messageTypeSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[messageType] [varchar](50) NOT NULL,
	[messageTypeScore] [int] NOT NULL,
	[messageTypeStatus] [varchar](10) NOT NULL,
 CONSTRAINT [PK_messageType] PRIMARY KEY CLUSTERED 
(
	[messageTypeSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notificationSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[notificationArticle] [varchar](max) NOT NULL,
	[notificationType] [varchar](50) NOT NULL,
	[notificationDate] [datetime] NOT NULL,
	[notificationStatus] [varchar](50) NOT NULL,
	[account] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Notification_1] PRIMARY KEY CLUSTERED 
(
	[notificationSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationRecording]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationRecording](
	[notificationRecordingSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](255) NOT NULL,
	[receiverAccount] [varchar](255) NULL,
	[notificationSeqNo] [int] NOT NULL,
	[notificationRecordingStatus] [varchar](50) NOT NULL,
	[notificationDate] [datetime] NOT NULL,
	[notificationReadDate] [datetime] NULL,
	[notificationArticle] [varchar](max) NULL,
 CONSTRAINT [PK_notificationRecording] PRIMARY KEY CLUSTERED 
(
	[notificationRecordingSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyCommentVideo]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyCommentVideo](
	[replyCommentVideoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[commentVideoSeqNo] [int] NOT NULL,
	[replyCommentArticle] [varchar](max) NOT NULL,
	[replyCommentDate] [datetime] NOT NULL,
	[replyCommentLike] [int] NOT NULL,
	[replyCommentUnLike] [int] NOT NULL,
	[replyCommentVideoStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ReplyCommentVideo] PRIMARY KEY CLUSTERED 
(
	[replyCommentVideoSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyCommentVideoLikeUnlike]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyCommentVideoLikeUnlike](
	[replyCommentVideoLikeUnlikeSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[replyCommentVideoLikeUnlikeStatus] [varchar](50) NOT NULL,
	[replyCommentVideoLikeUnlikeDate] [datetime] NOT NULL,
	[replyCommentVideoLikeUnLikeScore] [int] NOT NULL,
	[replyCommentVideoSeqNo] [int] NOT NULL,
 CONSTRAINT [PK_ReplyCommentLikeUnlike] PRIMARY KEY CLUSTERED 
(
	[replyCommentVideoLikeUnlikeSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sticker]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sticker](
	[stickerSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[stickerName] [varchar](max) NOT NULL,
	[stickerFileName] [varchar](max) NOT NULL,
	[stickerFilePath] [varchar](max) NOT NULL,
	[stickerType] [varchar](50) NOT NULL,
	[stickerStatus] [varchar](5) NOT NULL,
	[stickerScore] [int] NOT NULL,
	[stickerUploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_sticker] PRIMARY KEY CLUSTERED 
(
	[stickerSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionUploader]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionUploader](
	[subscriptionUploaderSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[uploaderAccount] [varchar](50) NOT NULL,
	[subscriptionUploaderStatus] [varchar](50) NOT NULL,
	[subscriptionUploaderDate] [datetime] NOT NULL,
	[subscriptionUploaderScore] [int] NOT NULL,
 CONSTRAINT [PK_SubscriptionUploader_1] PRIMARY KEY CLUSTERED 
(
	[subscriptionUploaderSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[videoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[videoTitle] [varchar](500) NOT NULL,
	[videoDescription] [varchar](max) NOT NULL,
	[videoType] [varchar](50) NOT NULL,
	[videoUplodaerListType] [varchar](500) NOT NULL,
	[videoUploadDate] [datetime] NOT NULL,
	[videoLikes] [int] NOT NULL,
	[videoUnlikes] [int] NOT NULL,
	[videoViews] [int] NOT NULL,
	[videoStatus] [varchar](50) NOT NULL,
	[videoFilePath] [varchar](500) NOT NULL,
	[VideoFileName] [varchar](500) NOT NULL,
	[videoImageFilePath] [varchar](500) NOT NULL,
	[videoImageFileName] [varchar](500) NOT NULL,
	[account] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[videoSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoReport]    Script Date: 2018/5/13 下午 04:04:37 ******/
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
	[videoReportReply] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoReportType]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoReportType](
	[videoReportTypeSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[videoReportType] [varchar](50) NOT NULL,
	[videoReportTypeStatus] [varchar](10) NOT NULL,
	[videoReportTypeScore] [int] NOT NULL,
 CONSTRAINT [PK_videoReportType] PRIMARY KEY CLUSTERED 
(
	[videoReportTypeSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoType]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoType](
	[sortedVideosSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[videoType] [varchar](50) NOT NULL,
	[sortedVideosScore] [int] NOT NULL,
	[sortedVideosStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SortedVideos] PRIMARY KEY CLUSTERED 
(
	[videoType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchHistory]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchHistory](
	[watchHistorySeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
	[watchVideoDate] [datetime] NOT NULL,
	[watchHistoryScore] [int] NOT NULL,
	[watchHistoryStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_WatchHistory] PRIMARY KEY CLUSTERED 
(
	[watchHistorySeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchLaterVideo]    Script Date: 2018/5/13 下午 04:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchLaterVideo](
	[watchLaterVideosSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](255) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
	[watchLaterVideoDate] [datetime2](7) NOT NULL,
	[watchLaterVideosScore] [int] NOT NULL,
	[watchLaterVideosStatus] [varchar](255) NOT NULL,
 CONSTRAINT [PK__WatchLat__8F57D8EA2288716D] PRIMARY KEY CLUSTERED 
(
	[watchLaterVideosSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CommentVideos] ON 

INSERT [dbo].[CommentVideos] ([commentVideoSeqNo], [account], [commentArticle], [commentDate], [commentLike], [commentUnLike], [commentVideoStatus], [videoSeqNo]) VALUES (1, N'bob', N'nbmbmvbnm', CAST(N'2018-05-07T21:28:35.7470000' AS DateTime2), 1, 0, N'1', 3)
SET IDENTITY_INSERT [dbo].[CommentVideos] OFF
SET IDENTITY_INSERT [dbo].[CommentVideosLikeUnlike] ON 

INSERT [dbo].[CommentVideosLikeUnlike] ([commentLikeUnlikeSeqNo], [account], [commentLikeUnLikeDate], [commentLikeUnLikeScore], [commentLikeUnlikeStatus], [commentVideoSeqNo]) VALUES (1, N'bob', CAST(N'2018-05-07T21:28:36.9060000' AS DateTime2), 0, N'like', 1)
SET IDENTITY_INSERT [dbo].[CommentVideosLikeUnlike] OFF
SET IDENTITY_INSERT [dbo].[LikeUnlikeVideos] ON 

INSERT [dbo].[LikeUnlikeVideos] ([likeUnlikeVideosSeqNo], [account], [videoSeqNo], [LikeUnlikeVideosStatus], [likeUnLikeVideosDate], [likeUnlikeVideosScore]) VALUES (1, N'bob', 3, N'like', CAST(N'2018-05-11T12:46:35.247' AS DateTime), 0)
INSERT [dbo].[LikeUnlikeVideos] ([likeUnlikeVideosSeqNo], [account], [videoSeqNo], [LikeUnlikeVideosStatus], [likeUnLikeVideosDate], [likeUnlikeVideosScore]) VALUES (2, N'bob', 1, N'like', CAST(N'2018-05-11T12:32:36.880' AS DateTime), 0)
INSERT [dbo].[LikeUnlikeVideos] ([likeUnlikeVideosSeqNo], [account], [videoSeqNo], [LikeUnlikeVideosStatus], [likeUnLikeVideosDate], [likeUnlikeVideosScore]) VALUES (3, N'bob', 4, N'like', CAST(N'2018-05-10T19:22:43.230' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[LikeUnlikeVideos] OFF
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (6, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T17:00:28.647' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (10, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T17:00:39.773' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (15, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T18:00:34.580' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (16, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T18:00:34.580' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (17, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T18:00:36.993' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (18, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T18:00:36.993' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (19, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T18:05:15.840' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (20, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T18:05:15.840' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (21, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T18:05:59.760' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (22, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T18:05:59.763' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (23, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T18:07:42.750' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (24, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T18:07:42.747' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (25, N'asdfasdfasdf', N'bob', N'snoopy', CAST(N'2018-05-09T18:07:50.460' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (27, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:07:53.097' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (28, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:07:53.097' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (29, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:07:59.777' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (30, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:07:59.787' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (31, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:08:16.830' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (32, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:08:16.830' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (33, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:08:43.470' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (34, N'asdf', N'bob', N'micky', CAST(N'2018-05-09T19:08:59.737' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (35, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:09:00.310' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (36, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:09:00.640' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (37, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:09:00.927' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (38, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:09:01.177' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (39, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:09:01.417' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (40, N' as', N'bob', N'micky', CAST(N'2018-05-09T19:09:01.657' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (41, N' df', N'bob', N'micky', CAST(N'2018-05-09T19:09:02.817' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (42, N'asdfasdf', N'micky', N'bob', CAST(N'2018-05-09T19:09:04.273' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (43, N' asdf', N'micky', N'bob', CAST(N'2018-05-09T19:09:04.617' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (44, N' asdf', N'micky', N'bob', CAST(N'2018-05-09T19:09:04.917' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (45, N' asdf', N'micky', N'bob', CAST(N'2018-05-09T19:09:05.320' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (46, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:11:05.070' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (47, N'幹你娘', N'bob', N'micky', CAST(N'2018-05-09T19:11:13.667' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (48, N'jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:16.157' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (49, N' 去你媽的', N'bob', N'micky', CAST(N'2018-05-09T19:11:18.577' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (50, N' adsf', N'bob', N'micky', CAST(N'2018-05-09T19:11:21.857' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (51, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:22.177' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (52, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:22.407' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (53, N' asd', N'bob', N'micky', CAST(N'2018-05-09T19:11:22.593' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (54, N' fa', N'bob', N'micky', CAST(N'2018-05-09T19:11:22.817' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (55, N' sdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:23.070' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (56, N' adsf', N'bob', N'micky', CAST(N'2018-05-09T19:11:23.280' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (57, N' as', N'bob', N'micky', CAST(N'2018-05-09T19:11:23.487' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (58, N' dfa', N'bob', N'micky', CAST(N'2018-05-09T19:11:23.720' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (59, N' sdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:23.967' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (60, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:24.370' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (61, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:24.667' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (62, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:24.970' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (63, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:25.257' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (64, N' adsf', N'bob', N'micky', CAST(N'2018-05-09T19:11:25.577' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (65, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:25.857' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (66, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:26.153' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (67, N' adsf', N'bob', N'micky', CAST(N'2018-05-09T19:11:27.897' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (68, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:28.377' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (69, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:28.943' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (70, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:29.777' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (71, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:30.300' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (72, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:30.780' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (73, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:31.223' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (74, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:31.627' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (75, N'jack 69 ', N'micky', N'bob', CAST(N'2018-05-09T19:11:36.817' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (76, N' jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:37.250' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (77, N' jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:37.593' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (78, N' jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:37.797' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (79, N' jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:37.963' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (80, N' jack 69jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:38.137' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (81, N' jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:38.313' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (82, N' jack 69', N'micky', N'bob', CAST(N'2018-05-09T19:11:38.477' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (83, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:48.123' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (84, N' adsfa', N'bob', N'micky', CAST(N'2018-05-09T19:11:48.457' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (85, N' sdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:48.710' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (86, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:48.993' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (87, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:49.257' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (88, N' asdfa', N'bob', N'micky', CAST(N'2018-05-09T19:11:49.567' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (89, N' sdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:49.777' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (90, N' asd', N'bob', N'micky', CAST(N'2018-05-09T19:11:49.967' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (91, N' fasdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:50.327' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (92, N' ads', N'bob', N'micky', CAST(N'2018-05-09T19:11:50.457' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (93, N' f', N'bob', N'micky', CAST(N'2018-05-09T19:11:50.630' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (94, N' asd', N'bob', N'micky', CAST(N'2018-05-09T19:11:50.817' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (95, N' fa', N'bob', N'micky', CAST(N'2018-05-09T19:11:51.017' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (96, N' dsf', N'bob', N'micky', CAST(N'2018-05-09T19:11:51.183' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (97, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:51.400' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (98, N' as', N'bob', N'micky', CAST(N'2018-05-09T19:11:51.583' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (99, N' df', N'bob', N'micky', CAST(N'2018-05-09T19:11:51.750' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (100, N' asd', N'bob', N'micky', CAST(N'2018-05-09T19:11:51.897' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (101, N' fa', N'bob', N'micky', CAST(N'2018-05-09T19:11:52.057' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (102, N' sdf', N'bob', N'micky', CAST(N'2018-05-09T19:11:52.217' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (103, N' a', N'bob', N'micky', CAST(N'2018-05-09T19:11:52.400' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (104, N'jack 69 with u ', N'micky', N'bob', CAST(N'2018-05-09T19:11:52.730' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (105, N' sd', N'bob', N'micky', CAST(N'2018-05-09T19:11:53.387' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (106, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:13:09.967' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (107, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:13:09.967' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (108, N'asdf', N'bob', N'micky', CAST(N'2018-05-09T19:13:15.183' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (109, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:13:15.450' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (110, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:13:15.690' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (111, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T19:13:15.947' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (112, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:31:54.257' AS DateTime), N'1', NULL)
GO
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (113, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:31:54.257' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (114, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:32:30.057' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (115, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:32:30.053' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (116, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:33:32.657' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (117, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:33:32.657' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (118, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:35:45.867' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (119, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:35:45.867' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (120, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:38:42.840' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (121, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:38:42.840' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (122, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:40:58.683' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (123, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:40:58.683' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (124, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:41:32.630' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (125, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:41:32.630' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (126, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:41:52.710' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (127, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:41:52.710' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (128, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:42:44.363' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (129, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:42:44.363' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (130, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:48:56.080' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (131, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:48:56.080' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (132, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:49:34.103' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (133, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:49:34.103' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (134, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:50:23.210' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (135, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:50:23.210' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (136, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:54:28.153' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (137, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:54:28.157' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (138, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:58:01.877' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (139, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:58:01.877' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (140, N'aaaaaaaaaaaaaaaaaaaaaa', N'micky', N'bob', CAST(N'2018-05-09T19:58:45.093' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (141, N'aaaaaaaaaaaaaaaaaaaaaa', N'snoopy', N'bob', CAST(N'2018-05-09T19:58:45.093' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (142, N'asdfasdfasdf', N'bob', N'micky', CAST(N'2018-05-09T20:01:29.127' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (143, N' dsgasdf', N'bob', N'micky', CAST(N'2018-05-09T20:01:30.440' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (144, N' adsf', N'bob', N'micky', CAST(N'2018-05-09T20:01:30.703' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (145, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T20:01:30.953' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (146, N' adsf', N'bob', N'micky', CAST(N'2018-05-09T20:01:31.170' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (147, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T20:01:31.407' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (148, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T20:01:31.617' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (149, N' asd', N'bob', N'micky', CAST(N'2018-05-09T20:01:31.863' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (150, N' fas', N'bob', N'micky', CAST(N'2018-05-09T20:01:32.087' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (151, N' dfa', N'bob', N'micky', CAST(N'2018-05-09T20:01:32.320' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (152, N' sdf', N'bob', N'micky', CAST(N'2018-05-09T20:01:32.553' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (153, N' asdf', N'bob', N'micky', CAST(N'2018-05-09T20:01:32.800' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (154, N'asdf', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:37.737' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (155, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:38.787' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (156, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:39.857' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (157, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:40.430' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (158, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:41.023' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (159, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:41.410' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (160, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:41.670' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (161, N' asd', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:41.953' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (162, N' f', N'bob', N'snoopy', CAST(N'2018-05-09T20:01:42.207' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (163, N'asdfasdf', N'micky', N'bob', CAST(N'2018-05-09T21:24:35.880' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (164, N' asdf', N'micky', N'bob', CAST(N'2018-05-09T21:24:36.287' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (165, N' asdf', N'micky', N'bob', CAST(N'2018-05-09T21:24:36.673' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (166, N'asdfdasf', N'micky', N'bob', CAST(N'2018-05-10T13:28:33.443' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (167, N'asdfadsf', N'bob', N'micky', CAST(N'2018-05-10T13:28:39.320' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (168, N' asdfasdf', N'bob', N'micky', CAST(N'2018-05-10T13:28:41.087' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (169, N'asdfadsf\', N'micky', N'bob', CAST(N'2018-05-10T20:20:33.143' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (170, N' adsfasdf\', N'micky', N'bob', CAST(N'2018-05-10T20:20:43.447' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (171, N' asdfasdf', N'micky', N'bob', CAST(N'2018-05-10T20:21:07.657' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (172, N' aaaaa', N'micky', N'bob', CAST(N'2018-05-10T20:21:13.627' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (173, N'asdfasdfasdf', N'micky', N'bob', CAST(N'2018-05-10T20:21:19.857' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (174, N'asdfasdf', N'micky', N'bob', CAST(N'2018-05-10T20:21:26.627' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (175, N'zzzzz', N'micky', N'bob', CAST(N'2018-05-10T20:21:44.700' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (176, N'asdfadsf', N'bob', N'micky', CAST(N'2018-05-10T20:21:59.163' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (177, N'asdfasdf', N'bob', N'micky', CAST(N'2018-05-10T20:23:11.043' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (178, N' adsf', N'bob', N'micky', CAST(N'2018-05-10T20:23:12.033' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (179, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:23:12.747' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (180, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:23:13.267' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (181, N' asdfasdf', N'bob', N'micky', CAST(N'2018-05-10T20:23:17.833' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (182, N' asdfasdf', N'bob', N'micky', CAST(N'2018-05-10T20:23:19.147' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (183, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:23:19.800' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (184, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:23:20.227' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (185, N'asdf', N'micky', N'bob', CAST(N'2018-05-10T20:23:23.073' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (186, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:23:23.460' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (187, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:23:23.797' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (188, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:23:24.107' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (189, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:23:24.420' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (190, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:23:24.827' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (191, N'qrewqwer', N'micky', N'bob', CAST(N'2018-05-10T20:24:45.663' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (192, N' qewr', N'micky', N'bob', CAST(N'2018-05-10T20:24:48.307' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (193, N' qwer', N'micky', N'bob', CAST(N'2018-05-10T20:24:48.717' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (194, N' qwerq', N'micky', N'bob', CAST(N'2018-05-10T20:24:49.050' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (195, N' wer', N'micky', N'bob', CAST(N'2018-05-10T20:24:49.370' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (196, N' qwer', N'micky', N'bob', CAST(N'2018-05-10T20:24:49.730' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (197, N' qwer', N'micky', N'bob', CAST(N'2018-05-10T20:24:50.147' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (198, N'dwfg', N'micky', N'bob', CAST(N'2018-05-10T20:25:17.683' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (199, N' dfswg', N'micky', N'bob', CAST(N'2018-05-10T20:25:17.997' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (200, N' dwfg', N'micky', N'bob', CAST(N'2018-05-10T20:25:18.283' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (201, N' sdf', N'micky', N'bob', CAST(N'2018-05-10T20:25:18.617' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (202, N' sdfg', N'micky', N'bob', CAST(N'2018-05-10T20:25:18.980' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (203, N'asdfdasf', N'micky', N'bob', CAST(N'2018-05-10T20:27:31.533' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (204, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:27:32.217' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (205, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:27:32.627' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (206, N' asdfa', N'micky', N'bob', CAST(N'2018-05-10T20:27:32.947' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (207, N' sdfa', N'micky', N'bob', CAST(N'2018-05-10T20:27:33.250' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (208, N' sdf', N'micky', N'bob', CAST(N'2018-05-10T20:27:33.547' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (209, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:27:33.883' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (210, N' asdfa', N'micky', N'bob', CAST(N'2018-05-10T20:27:34.257' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (211, N' sdfa', N'micky', N'bob', CAST(N'2018-05-10T20:27:34.610' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (212, N' sdfa', N'micky', N'bob', CAST(N'2018-05-10T20:27:34.923' AS DateTime), N'1', NULL)
GO
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (213, N' sdf', N'micky', N'bob', CAST(N'2018-05-10T20:27:35.393' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (214, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:27:36.977' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (215, N'asdf', N'micky', N'bob', CAST(N'2018-05-10T20:27:41.433' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (216, N'asdf', N'bob', N'micky', CAST(N'2018-05-10T20:27:56.267' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (217, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:27:56.587' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (218, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:27:56.890' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (219, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:27:57.233' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (220, N'asdf', N'bob', N'micky', CAST(N'2018-05-10T20:42:15.247' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (221, N' adsf', N'bob', N'micky', CAST(N'2018-05-10T20:42:17.460' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (222, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:42:17.867' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (223, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:42:18.170' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (224, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:42:18.433' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (225, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:42:18.747' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (226, N'asdfadsf', N'micky', N'bob', CAST(N'2018-05-10T20:42:51.547' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (227, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:52.010' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (228, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:52.290' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (229, N' adsf', N'micky', N'bob', CAST(N'2018-05-10T20:42:52.570' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (230, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:52.883' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (231, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:53.763' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (232, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:54.130' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (233, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:54.530' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (234, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:55.737' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (235, N' asdef', N'micky', N'bob', CAST(N'2018-05-10T20:42:56.780' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (236, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:57.243' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (237, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:57.673' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (238, N' adsf', N'micky', N'bob', CAST(N'2018-05-10T20:42:58.813' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (239, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:42:59.547' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (240, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:43:00.017' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (241, N'asdfasdf', N'bob', N'micky', CAST(N'2018-05-10T20:49:15.963' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (242, N' adsf', N'bob', N'micky', CAST(N'2018-05-10T20:49:16.400' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (243, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:49:16.747' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (244, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:49:17.027' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (245, N' asd', N'bob', N'micky', CAST(N'2018-05-10T20:49:17.290' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (246, N' f', N'bob', N'micky', CAST(N'2018-05-10T20:49:17.560' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (247, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:49:17.857' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (248, N'asdf', N'micky', N'bob', CAST(N'2018-05-10T20:49:34.050' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (249, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:49:34.363' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (250, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:49:34.683' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (251, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:49:35.257' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (252, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:49:35.603' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (253, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:49:36.117' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (254, N' asd', N'micky', N'bob', CAST(N'2018-05-10T20:49:36.323' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (255, N' f', N'micky', N'bob', CAST(N'2018-05-10T20:49:36.537' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (256, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:49:37.247' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (257, N' as', N'micky', N'bob', CAST(N'2018-05-10T20:49:37.730' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (258, N' df', N'micky', N'bob', CAST(N'2018-05-10T20:49:38.050' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (259, N'adsf', N'micky', N'bob', CAST(N'2018-05-10T20:51:39.363' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (260, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:52:00.770' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (261, N' asfd', N'micky', N'bob', CAST(N'2018-05-10T20:52:01.473' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (262, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:52:02.187' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (263, N'asdf', N'snoopy', N'bob', CAST(N'2018-05-10T20:52:05.243' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (264, N' asdf', N'snoopy', N'bob', CAST(N'2018-05-10T20:52:05.810' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (265, N' adsf', N'snoopy', N'bob', CAST(N'2018-05-10T20:52:06.233' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (266, N'asdf', N'bob', N'micky', CAST(N'2018-05-10T20:52:18.370' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (267, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:52:18.987' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (268, N' asdf', N'bob', N'micky', CAST(N'2018-05-10T20:52:19.440' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (269, N'adsf', N'bob', N'snoopy', CAST(N'2018-05-10T20:52:22.633' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (270, N' adfs', N'bob', N'snoopy', CAST(N'2018-05-10T20:52:23.050' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (271, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-10T20:52:23.443' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (272, N' adsf', N'bob', N'snoopy', CAST(N'2018-05-10T20:52:23.817' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (273, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-10T20:52:24.233' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (274, N' asdf', N'bob', N'snoopy', CAST(N'2018-05-10T20:52:24.657' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (275, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:52:30.913' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (276, N' adfs', N'micky', N'bob', CAST(N'2018-05-10T20:52:31.323' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (277, N' adfs', N'micky', N'bob', CAST(N'2018-05-10T20:52:31.803' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (278, N' asdf', N'micky', N'bob', CAST(N'2018-05-10T20:52:32.387' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (279, N' asdf', N'snoopy', N'bob', CAST(N'2018-05-10T20:52:37.837' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (280, N' asdf', N'snoopy', N'bob', CAST(N'2018-05-10T20:52:38.977' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (281, N' adsf', N'snoopy', N'bob', CAST(N'2018-05-10T20:52:39.713' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (282, N'asdfg', N'micky', N'bob', CAST(N'2018-05-11T09:13:41.553' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (283, N' sdfg', N'micky', N'bob', CAST(N'2018-05-11T09:13:43.307' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (284, N' sdfg', N'micky', N'bob', CAST(N'2018-05-11T09:13:44.010' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (285, N' sdfg', N'micky', N'bob', CAST(N'2018-05-11T09:13:44.610' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (286, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:14:36.917' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (287, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:15:37.643' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (288, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:17:17.563' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (289, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:26:28.217' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (290, N' asdfadsf', N'micky', N'bob', CAST(N'2018-05-11T09:30:05.240' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (291, N' asaaaaadsf', N'micky', N'bob', CAST(N'2018-05-11T09:30:46.263' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (292, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:31:12.523' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (293, N' asdfasdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:08.010' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (294, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:11.597' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (295, N' aaaaaaaaasdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:13.753' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (296, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:14.283' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (297, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:14.610' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (298, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:14.870' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (299, N' adsf', N'micky', N'bob', CAST(N'2018-05-11T09:32:15.147' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (300, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:15.417' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (301, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:15.670' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (302, N' asd', N'micky', N'bob', CAST(N'2018-05-11T09:32:15.970' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (303, N' fads', N'micky', N'bob', CAST(N'2018-05-11T09:32:16.233' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (304, N' fasd', N'micky', N'bob', CAST(N'2018-05-11T09:32:16.500' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (305, N' fa', N'micky', N'bob', CAST(N'2018-05-11T09:32:16.753' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (306, N' sdfa', N'micky', N'bob', CAST(N'2018-05-11T09:32:17.057' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (307, N' sdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:17.317' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (308, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:17.610' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (309, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:17.887' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (310, N' asd', N'micky', N'bob', CAST(N'2018-05-11T09:32:18.127' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (311, N' fas', N'micky', N'bob', CAST(N'2018-05-11T09:32:18.420' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (312, N' dfa', N'micky', N'bob', CAST(N'2018-05-11T09:32:18.720' AS DateTime), N'1', NULL)
GO
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (313, N' sdf', N'micky', N'bob', CAST(N'2018-05-11T09:32:19.003' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (314, N' asdfadsf', N'micky', N'bob', CAST(N'2018-05-11T09:34:51.340' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (315, N' asdfasdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:06.550' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (316, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:07.823' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (317, N' asdf.', N'micky', N'bob', CAST(N'2018-05-11T09:36:08.190' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (318, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:08.527' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (319, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:08.797' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (320, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:09.037' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (321, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:09.250' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (322, N' asd', N'micky', N'bob', CAST(N'2018-05-11T09:36:09.460' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (323, N' fa', N'micky', N'bob', CAST(N'2018-05-11T09:36:09.677' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (324, N' sdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:09.907' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (325, N' asd', N'micky', N'bob', CAST(N'2018-05-11T09:36:10.140' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (326, N' f', N'micky', N'bob', CAST(N'2018-05-11T09:36:10.383' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (327, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:10.717' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (328, N' a', N'micky', N'bob', CAST(N'2018-05-11T09:36:10.900' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (329, N' dsf', N'micky', N'bob', CAST(N'2018-05-11T09:36:11.150' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (330, N' adsf', N'micky', N'bob', CAST(N'2018-05-11T09:36:11.433' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (331, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:19.547' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (332, N' adsf.', N'micky', N'bob', CAST(N'2018-05-11T09:36:20.177' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (333, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:20.610' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (334, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:20.923' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (335, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:21.240' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (336, N' asd', N'micky', N'bob', CAST(N'2018-05-11T09:36:21.540' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (337, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:21.827' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (338, N' as', N'micky', N'bob', CAST(N'2018-05-11T09:36:22.077' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (339, N' df', N'micky', N'bob', CAST(N'2018-05-11T09:36:22.330' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (340, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:22.597' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (341, N' asd', N'micky', N'bob', CAST(N'2018-05-11T09:36:22.810' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (342, N' a', N'micky', N'bob', CAST(N'2018-05-11T09:36:23.043' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (343, N' sdf', N'micky', N'bob', CAST(N'2018-05-11T09:36:23.277' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (344, N' asd', N'micky', N'bob', CAST(N'2018-05-11T09:36:23.537' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (345, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:41:22.993' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (346, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:41:23.323' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (347, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:41:23.703' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (348, N'asdf', N'bob', N'micky', CAST(N'2018-05-11T09:41:25.967' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (349, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T09:41:26.350' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (350, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T09:41:26.647' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (351, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:52:18.707' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (352, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T09:52:50.620' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (353, N' adsf', N'micky', N'bob', CAST(N'2018-05-11T09:52:51.873' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (354, N' asdfasdf', N'micky', N'bob', CAST(N'2018-05-11T09:53:48.860' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (355, N' sdfgsdfg', N'micky', N'bob', CAST(N'2018-05-11T09:55:56.140' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (356, N' asdfasdf', N'micky', N'bob', CAST(N'2018-05-11T09:57:07.017' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (357, N' asdfdasf', N'micky', N'bob', CAST(N'2018-05-11T10:00:16.273' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (358, N' asdfasdf', N'micky', N'bob', CAST(N'2018-05-11T10:00:29.337' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (359, N'adsf', N'micky', N'bob', CAST(N'2018-05-11T10:40:20.007' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (360, N' asdasd', N'micky', N'bob', CAST(N'2018-05-11T10:45:12.897' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (361, N' asdfadsf', N'micky', N'bob', CAST(N'2018-05-11T10:48:22.620' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (362, N' asdfasdf', N'micky', N'bob', CAST(N'2018-05-11T10:48:30.227' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (363, N' asdfasdfasdf', N'micky', N'bob', CAST(N'2018-05-11T10:48:36.077' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (364, N'asdfasdf', N'bob', N'micky', CAST(N'2018-05-11T13:05:17.587' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (365, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T13:05:17.987' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (366, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T13:05:18.387' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (367, N' asdfas', N'bob', N'micky', CAST(N'2018-05-11T13:05:18.777' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (368, N'adsf', N'micky', N'bob', CAST(N'2018-05-11T13:05:21.333' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (369, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T13:05:21.703' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (370, N' adsf', N'micky', N'bob', CAST(N'2018-05-11T13:05:22.127' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (371, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T13:05:22.693' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (372, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T13:05:23.143' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (373, N'asdfasdf', N'micky', N'bob', CAST(N'2018-05-11T20:24:52.820' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (374, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T20:24:53.053' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (375, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T20:24:53.567' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (376, N' asdf', N'micky', N'bob', CAST(N'2018-05-11T20:24:53.963' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (377, N'asdf', N'bob', N'micky', CAST(N'2018-05-11T20:24:58.263' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (378, N' adsf', N'bob', N'micky', CAST(N'2018-05-11T20:24:58.667' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (379, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T20:24:59.170' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (380, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T20:24:59.787' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (381, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T20:25:00.410' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (382, N' asdf', N'bob', N'micky', CAST(N'2018-05-11T20:25:00.987' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (383, N'10', N'bob', N'micky', CAST(N'2018-05-12T23:25:45.670' AS DateTime), N'1', NULL)
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (384, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:29:02.467' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (385, N'10', N'bob', N'micky', CAST(N'2018-05-12T23:30:10.970' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (386, N'10', N'bob', N'micky', CAST(N'2018-05-12T23:31:00.427' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (387, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:31:13.357' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (388, N'10', N'bob', N'micky', CAST(N'2018-05-12T23:32:02.707' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (389, N'9', N'bob', N'micky', CAST(N'2018-05-12T23:32:04.577' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (390, N'7', N'bob', N'micky', CAST(N'2018-05-12T23:32:05.570' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (391, N'6', N'bob', N'micky', CAST(N'2018-05-12T23:32:06.090' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (392, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:35.573' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (393, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:37.500' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (394, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:38.313' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (395, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:38.643' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (396, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:38.843' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (397, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:39.027' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (398, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:39.220' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (399, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:32:39.407' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (400, N'6', N'bob', N'micky', CAST(N'2018-05-12T23:32:46.753' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (401, N'7', N'bob', N'micky', CAST(N'2018-05-12T23:32:48.417' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (402, N'9', N'bob', N'micky', CAST(N'2018-05-12T23:32:49.793' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (403, N'10', N'bob', N'micky', CAST(N'2018-05-12T23:32:52.403' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (404, N'9', N'micky', N'bob', CAST(N'2018-05-12T23:38:00.813' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (405, N'8', N'micky', N'bob', CAST(N'2018-05-12T23:38:02.797' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (406, N'6', N'micky', N'bob', CAST(N'2018-05-12T23:38:03.580' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (407, N'7', N'micky', N'bob', CAST(N'2018-05-12T23:38:04.587' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (408, N'9', N'micky', N'bob', CAST(N'2018-05-12T23:38:05.363' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (409, N'9', N'micky', N'bob', CAST(N'2018-05-12T23:38:05.553' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (410, N'9', N'micky', N'bob', CAST(N'2018-05-12T23:38:05.730' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (411, N'9', N'micky', N'bob', CAST(N'2018-05-12T23:38:05.913' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (412, N'9', N'micky', N'bob', CAST(N'2018-05-12T23:38:06.090' AS DateTime), N'1', N'sticker')
GO
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (413, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:38:08.427' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (414, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:38:08.610' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (415, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:38:08.810' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (416, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:38:08.993' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (417, N'8', N'bob', N'micky', CAST(N'2018-05-12T23:38:09.177' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (418, N'8', N'micky', N'bob', CAST(N'2018-05-12T23:38:12.780' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (419, N'9', N'micky', N'bob', CAST(N'2018-05-12T23:38:22.047' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (420, N'11', N'bob', N'micky', CAST(N'2018-05-12T23:40:49.730' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (421, N'10', N'bob', N'micky', CAST(N'2018-05-13T11:04:40.387' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (422, N'8', N'bob', N'micky', CAST(N'2018-05-13T11:04:41.873' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (423, N'6', N'bob', N'micky', CAST(N'2018-05-13T11:04:42.600' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (424, N'7', N'bob', N'micky', CAST(N'2018-05-13T11:04:43.033' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (425, N'9', N'bob', N'micky', CAST(N'2018-05-13T11:04:43.537' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (426, N'11', N'bob', N'micky', CAST(N'2018-05-13T11:04:43.960' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (427, N'10', N'bob', N'micky', CAST(N'2018-05-13T11:53:49.827' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (428, N'11', N'bob', N'micky', CAST(N'2018-05-13T11:53:52.283' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (429, N'11', N'bob', N'micky', CAST(N'2018-05-13T12:57:54.253' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (430, N'8', N'bob', N'micky', CAST(N'2018-05-13T12:57:55.343' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (431, N'6', N'bob', N'micky', CAST(N'2018-05-13T12:58:35.247' AS DateTime), N'1', N'sticker')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (432, N'7', N'bob', N'', CAST(N'2018-05-13T15:17:33.727' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (433, N'8', N'bob', N'', CAST(N'2018-05-13T15:20:51.377' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (434, N'9', N'bob', N'', CAST(N'2018-05-13T15:20:52.010' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (435, N'10', N'bob', N'micky', CAST(N'2018-05-13T15:28:47.430' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (436, N'11', N'bob', N'micky', CAST(N'2018-05-13T15:38:59.253' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (437, N'12', N'bob', N'micky', CAST(N'2018-05-13T15:40:15.973' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (438, N'13', N'bob', N'micky', CAST(N'2018-05-13T15:40:22.597' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (439, N'14', N'bob', N'micky', CAST(N'2018-05-13T15:40:42.197' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (440, N'15', N'micky', N'bob', CAST(N'2018-05-13T15:43:51.050' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (441, N'16', N'bob', N'micky', CAST(N'2018-05-13T15:53:12.557' AS DateTime), N'1', N'image')
INSERT [dbo].[Message] ([messageSeqNo], [messageArticle], [account], [receiverAccount], [messageDate], [messageStatus], [messageType]) VALUES (442, N'17', N'bob', N'micky', CAST(N'2018-05-13T15:55:12.597' AS DateTime), N'1', N'image')
SET IDENTITY_INSERT [dbo].[Message] OFF
SET IDENTITY_INSERT [dbo].[MessageImage] ON 

INSERT [dbo].[MessageImage] ([messageImageSeqNo], [messageImageName], [messageImageFileName], [messageImageFilePath], [messageImageType], [messageImageStatus], [messageImageScore], [messageImageUploadDate]) VALUES (11, N'', N'cherry.jpg', N'C:/resources/images/message/image/normal/11.jpg', N'normal', N'1', 0, CAST(N'2018-05-13T15:38:53.500' AS DateTime))
INSERT [dbo].[MessageImage] ([messageImageSeqNo], [messageImageName], [messageImageFileName], [messageImageFilePath], [messageImageType], [messageImageStatus], [messageImageScore], [messageImageUploadDate]) VALUES (12, N'', N'cherry.jpg', N'C:/resources/images/message/image/normal/12.jpg', N'normal', N'1', 0, CAST(N'2018-05-13T15:40:15.960' AS DateTime))
INSERT [dbo].[MessageImage] ([messageImageSeqNo], [messageImageName], [messageImageFileName], [messageImageFilePath], [messageImageType], [messageImageStatus], [messageImageScore], [messageImageUploadDate]) VALUES (13, N'', N'egg.png', N'C:/resources/images/message/image/normal/13.png', N'normal', N'1', 0, CAST(N'2018-05-13T15:40:22.580' AS DateTime))
INSERT [dbo].[MessageImage] ([messageImageSeqNo], [messageImageName], [messageImageFileName], [messageImageFilePath], [messageImageType], [messageImageStatus], [messageImageScore], [messageImageUploadDate]) VALUES (14, N'', N'cherry.jpg', N'C:/resources/images/message/image/normal/14.jpg', N'normal', N'1', 0, CAST(N'2018-05-13T15:40:42.187' AS DateTime))
INSERT [dbo].[MessageImage] ([messageImageSeqNo], [messageImageName], [messageImageFileName], [messageImageFilePath], [messageImageType], [messageImageStatus], [messageImageScore], [messageImageUploadDate]) VALUES (15, N'', N'egg.png', N'C:/resources/images/message/image/normal/15.png', N'normal', N'1', 0, CAST(N'2018-05-13T15:43:51.040' AS DateTime))
INSERT [dbo].[MessageImage] ([messageImageSeqNo], [messageImageName], [messageImageFileName], [messageImageFilePath], [messageImageType], [messageImageStatus], [messageImageScore], [messageImageUploadDate]) VALUES (16, N'', N'cherry.jpg', N'C:/resources/images/message/image/normal/16.jpg', N'normal', N'1', 0, CAST(N'2018-05-13T15:53:12.540' AS DateTime))
INSERT [dbo].[MessageImage] ([messageImageSeqNo], [messageImageName], [messageImageFileName], [messageImageFilePath], [messageImageType], [messageImageStatus], [messageImageScore], [messageImageUploadDate]) VALUES (17, N'', N'cherry.jpg', N'C:/resources/images/message/image/normal/17.jpg', N'normal', N'1', 0, CAST(N'2018-05-13T15:55:12.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[MessageImage] OFF
SET IDENTITY_INSERT [dbo].[MessageType] ON 

INSERT [dbo].[MessageType] ([messageTypeSeqNo], [messageType], [messageTypeScore], [messageTypeStatus]) VALUES (1, N'text', 0, N'1')
INSERT [dbo].[MessageType] ([messageTypeSeqNo], [messageType], [messageTypeScore], [messageTypeStatus]) VALUES (2, N'sticker', 0, N'1')
INSERT [dbo].[MessageType] ([messageTypeSeqNo], [messageType], [messageTypeScore], [messageTypeStatus]) VALUES (3, N'file', 0, N'1')
INSERT [dbo].[MessageType] ([messageTypeSeqNo], [messageType], [messageTypeScore], [messageTypeStatus]) VALUES (4, N'image', 0, N'1')
SET IDENTITY_INSERT [dbo].[MessageType] OFF
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notificationSeqNo], [notificationArticle], [notificationType], [notificationDate], [notificationStatus], [account]) VALUES (64, N'發布新影片啦!!!!', N'video', CAST(N'2018-05-10T20:50:03.773' AS DateTime), N'1', N'bob')
INSERT [dbo].[Notification] ([notificationSeqNo], [notificationArticle], [notificationType], [notificationDate], [notificationStatus], [account]) VALUES (65, N'發布新影片啦!!!!', N'video', CAST(N'2018-05-11T08:56:32.160' AS DateTime), N'1', N'bob')
SET IDENTITY_INSERT [dbo].[Notification] OFF
SET IDENTITY_INSERT [dbo].[NotificationRecording] ON 

INSERT [dbo].[NotificationRecording] ([notificationRecordingSeqNo], [account], [receiverAccount], [notificationSeqNo], [notificationRecordingStatus], [notificationDate], [notificationReadDate], [notificationArticle]) VALUES (117, N'bob', N'snoopy', 64, N'unread', CAST(N'2018-05-10T20:50:03.810' AS DateTime), NULL, N'發布新影片啦!!!!')
INSERT [dbo].[NotificationRecording] ([notificationRecordingSeqNo], [account], [receiverAccount], [notificationSeqNo], [notificationRecordingStatus], [notificationDate], [notificationReadDate], [notificationArticle]) VALUES (118, N'bob', N'micky', 64, N'unread', CAST(N'2018-05-10T20:50:03.810' AS DateTime), NULL, N'發布新影片啦!!!!')
INSERT [dbo].[NotificationRecording] ([notificationRecordingSeqNo], [account], [receiverAccount], [notificationSeqNo], [notificationRecordingStatus], [notificationDate], [notificationReadDate], [notificationArticle]) VALUES (119, N'bob', N'snoopy', 65, N'unread', CAST(N'2018-05-11T08:56:32.313' AS DateTime), NULL, N'發布新影片啦!!!!')
INSERT [dbo].[NotificationRecording] ([notificationRecordingSeqNo], [account], [receiverAccount], [notificationSeqNo], [notificationRecordingStatus], [notificationDate], [notificationReadDate], [notificationArticle]) VALUES (120, N'bob', N'micky', 65, N'unread', CAST(N'2018-05-11T08:56:32.313' AS DateTime), NULL, N'發布新影片啦!!!!')
SET IDENTITY_INSERT [dbo].[NotificationRecording] OFF
SET IDENTITY_INSERT [dbo].[ReplyCommentVideo] ON 

INSERT [dbo].[ReplyCommentVideo] ([replyCommentVideoSeqNo], [account], [commentVideoSeqNo], [replyCommentArticle], [replyCommentDate], [replyCommentLike], [replyCommentUnLike], [replyCommentVideoStatus]) VALUES (1, N'bob', 1, N'vbnm', CAST(N'2018-05-07T21:28:38.897' AS DateTime), 0, 0, N'1')
SET IDENTITY_INSERT [dbo].[ReplyCommentVideo] OFF
SET IDENTITY_INSERT [dbo].[Sticker] ON 

INSERT [dbo].[Sticker] ([stickerSeqNo], [stickerName], [stickerFileName], [stickerFilePath], [stickerType], [stickerStatus], [stickerScore], [stickerUploadDate]) VALUES (6, N'cat', N'1.gif', N'C:/resources/images/message/sticker/dog/6.gif', N'dog', N'1', 0, CAST(N'2018-05-12T21:41:06.777' AS DateTime))
INSERT [dbo].[Sticker] ([stickerSeqNo], [stickerName], [stickerFileName], [stickerFilePath], [stickerType], [stickerStatus], [stickerScore], [stickerUploadDate]) VALUES (7, N'cat2', N'2.gif', N'C:/resources/images/message/sticker/dog/7.gif', N'dog', N'1', 0, CAST(N'2018-05-12T21:41:13.067' AS DateTime))
INSERT [dbo].[Sticker] ([stickerSeqNo], [stickerName], [stickerFileName], [stickerFilePath], [stickerType], [stickerStatus], [stickerScore], [stickerUploadDate]) VALUES (8, N'dog', N'3.gif', N'C:/resources/images/message/sticker/dog/8.gif', N'dog', N'1', 0, CAST(N'2018-05-12T21:41:19.853' AS DateTime))
INSERT [dbo].[Sticker] ([stickerSeqNo], [stickerName], [stickerFileName], [stickerFilePath], [stickerType], [stickerStatus], [stickerScore], [stickerUploadDate]) VALUES (9, N'people', N'4.gif', N'C:/resources/images/message/sticker/dog/9.gif', N'dog', N'1', 0, CAST(N'2018-05-12T21:41:31.223' AS DateTime))
INSERT [dbo].[Sticker] ([stickerSeqNo], [stickerName], [stickerFileName], [stickerFilePath], [stickerType], [stickerStatus], [stickerScore], [stickerUploadDate]) VALUES (10, N'thank', N'5.gif', N'C:/resources/images/message/sticker/dog/10.gif', N'dog', N'1', 0, CAST(N'2018-05-12T21:41:37.130' AS DateTime))
INSERT [dbo].[Sticker] ([stickerSeqNo], [stickerName], [stickerFileName], [stickerFilePath], [stickerType], [stickerStatus], [stickerScore], [stickerUploadDate]) VALUES (11, N'pig', N'pig.gif', N'C:/resources/images/message/sticker/dog/11.gif', N'dog', N'1', 0, CAST(N'2018-05-12T23:40:37.683' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sticker] OFF
SET IDENTITY_INSERT [dbo].[SubscriptionUploader] ON 

INSERT [dbo].[SubscriptionUploader] ([subscriptionUploaderSeqNo], [account], [uploaderAccount], [subscriptionUploaderStatus], [subscriptionUploaderDate], [subscriptionUploaderScore]) VALUES (2, N'snoopy', N'bob', N'subscription', CAST(N'2018-05-09T09:11:50.410' AS DateTime), 0)
INSERT [dbo].[SubscriptionUploader] ([subscriptionUploaderSeqNo], [account], [uploaderAccount], [subscriptionUploaderStatus], [subscriptionUploaderDate], [subscriptionUploaderScore]) VALUES (3, N'micky', N'bob', N'subscription', CAST(N'2018-05-10T09:39:56.750' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[SubscriptionUploader] OFF
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (1, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-06T14:39:52.587' AS DateTime), 1, 1, 84, N'1', N'C:/resources/videos/video/bob/bob_2.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_2.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (2, N'跟iPhone完美連動！？Apple藍牙耳機AirPods開箱！【小馬 】', N'? 訂閱小馬：https://goo.gl/C6in0o ?Instagram：lin19940 ?FB粉絲專頁:https://www.facebook.com/lin19940/ - - - - - - - - - - - - - - - - - - - - - - 藍牙耳機這項科技已經有許多年了 apple終於在今年年初推出了藍牙耳機airpods 不過實在是很難買到 過了這麼久終於買到了 實測過後發現airpods真的很實用 跟iPhone的連動也是花了一番功夫 只是有些小缺點 我就來為AirPods做個簡單的評測吧～ - - - - - - - - - - - - - - - - - - - - - - 也許你會喜歡： Apple iOS 11介紹：https://youtu.be/MJZyCT5DTww  4.5G網路解析：https://youtu.be/_wrqFWFlrus', N'科技', N'', CAST(N'2018-05-06T14:41:32.997' AS DateTime), 0, 1, 7, N'1', N'C:/resources/videos/video/bob/bob_3.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_3.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (3, N'iPhone 8 and iPhone 8 Plus — Unveiled — Apple', N'iPhone 8 and iPhone 8 Plus. A new durable glass design and Retina HD display with True Tone. Wireless charging, augmented reality, and even better cameras. A11 Bionic, the most powerful and smartest chip in a smartphone. And introducing Portrait Lighting on iPhone 8 Plus. A new generation of iPhone.   Learn more: http://apple.com/iphone-8  Song: “Area” by MagnusTheMagnus https://itunes.apple.com/us/album/are...  The AirPower mat has not been authorized as required by the rules of the Federal Communications Commission. This device is not, and may not be, offered for sale or lease, or sold or leased, until authorization is obtained.', N'科技', N'', CAST(N'2018-05-06T14:43:23.783' AS DateTime), 2, 0, 23, N'1', N'C:/resources/videos/video/bob/bob_4.mp4', N'3.mp4', N'C:/resources/images/video/bob/bob_4.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (4, N'Game 3: Cleveland Cavaliers vs Toronto Raptors | 2018 NBA Playoffs', N'Game 3: Cleveland Cavaliers vs Toronto Raptors | 2018 NBA Playoffs', N'運動', N'', CAST(N'2018-05-06T14:44:56.130' AS DateTime), 2, 0, 23, N'1', N'C:/resources/videos/video/bob/bob_5.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_5.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (5, N'影片標題 影片標題 影片標題 影片標題 ', N'影片描述影片描述影片描述影片描述', N'其他', N'', CAST(N'2018-05-10T11:38:13.003' AS DateTime), 0, 0, 28, N'1', N'C:/resources/videos/video/bob/bob_5.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_5.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (6, N'影片標題 影片標題 影片標題 影片標題 ', N'影片描述影片描述影片描述影片描述', N'其他', N'', CAST(N'2018-05-10T11:40:58.573' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_6.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_6.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (7, N'影片標題', N'影片描述', N'運動', N'', CAST(N'2018-05-10T11:52:37.847' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_7.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_7.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (8, N'影片標題', N'影片描述', N'運動', N'', CAST(N'2018-05-10T11:53:21.510' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_8.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_8.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (9, N'影片標題', N'影片描述', N'科技', N'', CAST(N'2018-05-10T12:06:30.740' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_9.mp4', N'3.mp4', N'C:/resources/images/video/bob/bob_9.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (10, N'影片標題', N'影片描述', N'科技', N'', CAST(N'2018-05-10T12:07:26.903' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_10.mp4', N'3.mp4', N'C:/resources/images/video/bob/bob_10.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (11, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:24:27.490' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_11.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_11.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (12, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:25:50.467' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_12.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_12.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (13, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:26:17.333' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_13.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_13.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (14, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:36:53.590' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_14.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_14.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (15, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:37:58.753' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_15.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_15.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (16, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:41:02.500' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_16.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_16.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (17, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:43:12.943' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_17.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_17.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (18, N'adsf', N'asdf', N'音樂', N'', CAST(N'2018-05-10T12:44:09.883' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_18.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_18.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (19, N'asdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T12:44:54.363' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_19.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_19.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (20, N'asdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T12:45:49.647' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_20.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_20.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (21, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:49:37.377' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_21.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_21.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (22, N'影片標題', N'adsf', N'音樂', N'', CAST(N'2018-05-10T12:51:06.627' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_22.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_22.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (23, N'影片標題', N'adsf', N'音樂', N'', CAST(N'2018-05-10T12:51:40.190' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_23.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_23.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (24, N'dfasgasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T12:53:18.567' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_24.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_24.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (25, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T12:56:54.227' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_25.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_25.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (26, N'asdfasdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T13:02:35.837' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_26.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_26.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (27, N'asdfasdf', N'fasdfasdf', N'音樂', N'', CAST(N'2018-05-10T13:03:30.373' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_27.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_27.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (28, N'gdfsgsdfg', N'dsfgsdfgsdfg', N'音樂', N'', CAST(N'2018-05-10T13:04:45.087' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_28.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_28.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (29, N'xczfxcds', N'fasdfasdf', N'音樂', N'', CAST(N'2018-05-10T13:06:13.103' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_29.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_29.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (30, N'asdfasdfasd', N'fasdfasdfasdf', N'運動', N'', CAST(N'2018-05-10T13:09:29.340' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_30.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_30.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (31, N'asdfasdfasd', N'fasdfasdfasdf', N'運動', N'', CAST(N'2018-05-10T13:11:15.367' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_31.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_31.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (32, N'dasfdsfas', N'dfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T13:14:44.500' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_32.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_32.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (33, N'rtygsgfhd', N'sdfgsdfgsdfg', N'遊戲', N'', CAST(N'2018-05-10T13:17:02.827' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_33.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_33.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (34, N'asdfasdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T13:20:19.393' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_34.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_34.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (35, N'asdfasdfasdf', N'asdfasdfadsf', N'音樂', N'', CAST(N'2018-05-10T13:25:35.113' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_35.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_35.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (36, N'影片標題', N'影片描述', N'音樂', N'', CAST(N'2018-05-10T14:33:53.223' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_36.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_36.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (37, N'dasfasdfas', N'dfasdfas', N'音樂', N'', CAST(N'2018-05-10T14:38:09.780' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_37.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_37.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (38, N'asd', N'asdf', N'音樂', N'', CAST(N'2018-05-10T14:40:54.793' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_38.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_38.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (39, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:21:23.883' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_39.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_39.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (40, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:22:14.083' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_40.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_40.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (41, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:27:19.377' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_41.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_41.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (42, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:30:10.380' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_42.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_42.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (43, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:32:01.910' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_43.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_43.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (44, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:37:19.357' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_44.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_44.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (45, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:38:40.737' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_45.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_45.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (46, N'sdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:38:52.557' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_46.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_46.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (47, N'asdfasdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T15:45:03.477' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_47.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_47.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (48, N'dfgdfg', N'dfsgsdfg', N'音樂', N'', CAST(N'2018-05-10T15:53:01.597' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_48.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_48.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (49, N'dfgdfg', N'dfsgsdfg', N'音樂', N'', CAST(N'2018-05-10T15:58:15.683' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_49.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_49.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (52, N'fregdsfg', N'dsfgsdfg', N'音樂', N'', CAST(N'2018-05-10T16:01:01.057' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_52.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_52.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (53, N'dasfasdfas', N'dfasdfas', N'音樂', N'', CAST(N'2018-05-10T16:04:35.520' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_53.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_53.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (54, N'dasfasdfas', N'dfasdfas', N'音樂', N'', CAST(N'2018-05-10T16:04:57.470' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_54.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_54.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (55, N'fdasfasdfas', N'dfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:05:16.517' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_55.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_55.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (56, N'fdasfasdfas', N'dfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:05:33.150' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_56.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_56.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (57, N'影片標題', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:36:52.827' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_57.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_57.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (58, N'影片標題', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:37:43.137' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_58.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_58.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (59, N'影片標題', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:38:46.447' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_59.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_59.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (60, N'影片標題d', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:40:39.207' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_60.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_60.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (61, N'影片標題d', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:40:55.603' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_61.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_61.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (62, N'asdfasdfasdfa', N'sdfasdfasdf', N'運動', N'', CAST(N'2018-05-10T16:41:16.047' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_62.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_62.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (63, N'asdfasdfasdf', N'asdfasdfadsf', N'音樂', N'', CAST(N'2018-05-10T16:42:31.100' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_63.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_63.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (64, N'sdfdasfasdfa', N'sdfasdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:43:48.887' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_64.mp4', N'3.mp4', N'C:/resources/images/video/bob/bob_64.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (65, N'asdfasdfasdfasdf', N'asdfasdfasdf', N'運動', N'', CAST(N'2018-05-10T16:45:00.350' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_65.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_65.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (66, N'dasfasdfasdf', N'asdfasdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T16:46:53.747' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_66.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_66.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (67, N'asdfasdfas', N'dfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T17:23:37.090' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_67.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_67.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (68, N'asdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T18:16:50.387' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_68.mp4', N'3.mp4', N'C:/resources/images/video/bob/bob_68.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (69, N'asdfasdfasdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T18:38:14.113' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_69.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_69.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (70, N'rtghrthdgf', N'hdgfhdgfhdfgh', N'音樂', N'', CAST(N'2018-05-10T18:44:49.313' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_70.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_70.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (71, N'asdfasdfasdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T18:47:54.093' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_71.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_71.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (72, N'dsfdasfasdfasd', N'fasdfasdfasf', N'音樂', N'', CAST(N'2018-05-10T18:52:57.303' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_72.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_72.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (73, N'asdfasdfasdf', N'asdfasdf', N'運動', N'', CAST(N'2018-05-10T18:57:42.597' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_73.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_73.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (74, N'asdfasdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T18:59:19.727' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_74.mp4', N'3.mp4', N'C:/resources/images/video/bob/bob_74.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (75, N'asdfasdfasdfasdfasdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T19:00:13.697' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_75.mp4', N'3.mp4', N'C:/resources/images/video/bob/bob_75.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (76, N'asdfasdfasdfasdff', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T19:01:18.007' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_76.mp4', N'2.mp4', N'C:/resources/images/video/bob/bob_76.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (77, N'asdfasdfasdfasdffasdfasdf', N'asdfasdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T19:02:09.223' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_77.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_77.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (78, N'sdfgsdfgsdf', N'gsdfgsdfg', N'音樂', N'', CAST(N'2018-05-10T19:03:58.767' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_78.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_78.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (79, N'sdfgsdfgsdfasdfasdfas', N'gsdfgsdfgdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T19:04:17.493' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_79.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_79.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (80, N'sdfgsdfgsdfasdfasdfas', N'gsdfgsdfgdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T19:04:21.957' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_80.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_80.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (81, N'sdfgsdfgsdfasdfasdfas', N'gsdfgsdfgdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T19:04:24.177' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_81.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_81.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (82, N'sdfgsdfgsdfasdfasdfas', N'gsdfgsdfgdfasdfasdf', N'音樂', N'', CAST(N'2018-05-10T19:04:25.760' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_82.mp4', N'videoplayback.mp4', N'C:/resources/images/video/bob/bob_82.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (83, N'asdfasdfasdf', N'asdfasdf', N'音樂', N'', CAST(N'2018-05-10T20:50:03.750' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_83.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_83.jpeg', N'videoImage.jpeg', N'bob')
INSERT [dbo].[Video] ([videoSeqNo], [videoTitle], [videoDescription], [videoType], [videoUplodaerListType], [videoUploadDate], [videoLikes], [videoUnlikes], [videoViews], [videoStatus], [videoFilePath], [VideoFileName], [videoImageFilePath], [videoImageFileName], [account]) VALUES (84, N'adsfasdfasdf', N'asdfasdfasdf', N'音樂', N'', CAST(N'2018-05-11T08:56:32.070' AS DateTime), 0, 0, 0, N'1', N'C:/resources/videos/video/bob/bob_84.mp4', N'4.mp4', N'C:/resources/images/video/bob/bob_84.jpeg', N'videoImage.jpeg', N'bob')
SET IDENTITY_INSERT [dbo].[Video] OFF
SET IDENTITY_INSERT [dbo].[VideoReport] ON 

INSERT [dbo].[VideoReport] ([videoReportSeqNo], [videoReportArticle], [videoReportDate], [videoReportStatus], [account], [videoSeqNo], [videoReportType], [videoReportReply]) VALUES (1, N'fasdfsdf', CAST(N'2018-05-11T14:56:17.880' AS DateTime), N'pending', N'bob', 1, N'色情', NULL)
INSERT [dbo].[VideoReport] ([videoReportSeqNo], [videoReportArticle], [videoReportDate], [videoReportStatus], [account], [videoSeqNo], [videoReportType], [videoReportReply]) VALUES (2, N'aaa', CAST(N'2018-05-11T14:56:29.653' AS DateTime), N'pending', N'bob', 1, N'暴力', NULL)
INSERT [dbo].[VideoReport] ([videoReportSeqNo], [videoReportArticle], [videoReportDate], [videoReportStatus], [account], [videoSeqNo], [videoReportType], [videoReportReply]) VALUES (3, N'fffff', CAST(N'2018-05-13T12:59:41.747' AS DateTime), N'pending', N'bob', 3, N'色情', NULL)
SET IDENTITY_INSERT [dbo].[VideoReport] OFF
SET IDENTITY_INSERT [dbo].[VideoReportType] ON 

INSERT [dbo].[VideoReportType] ([videoReportTypeSeqNo], [videoReportType], [videoReportTypeStatus], [videoReportTypeScore]) VALUES (1, N'sex', N'1', 0)
INSERT [dbo].[VideoReportType] ([videoReportTypeSeqNo], [videoReportType], [videoReportTypeStatus], [videoReportTypeScore]) VALUES (2, N'violence', N'1', 0)
INSERT [dbo].[VideoReportType] ([videoReportTypeSeqNo], [videoReportType], [videoReportTypeStatus], [videoReportTypeScore]) VALUES (3, N'other', N'1', 0)
SET IDENTITY_INSERT [dbo].[VideoReportType] OFF
SET IDENTITY_INSERT [dbo].[VideoType] ON 

INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (1, N'其他', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (2, N'直播', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (3, N'政治', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (4, N'科技', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (5, N'美食', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (6, N'音樂', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (7, N'時尚', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (8, N'新聞', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (9, N'運動', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (10, N'遊戲', 0, N'1')
INSERT [dbo].[VideoType] ([sortedVideosSeqNo], [videoType], [sortedVideosScore], [sortedVideosStatus]) VALUES (11, N'電影', 0, N'1')
SET IDENTITY_INSERT [dbo].[VideoType] OFF
SET IDENTITY_INSERT [dbo].[WatchHistory] ON 

INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (1, N'bob', 3, CAST(N'2018-05-07T09:30:26.027' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (2, N'bob', 1, CAST(N'2018-05-07T10:24:58.653' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (3, N'bob', 1, CAST(N'2018-05-07T10:25:22.293' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (4, N'bob', 1, CAST(N'2018-05-07T10:36:06.193' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (5, N'bob', 3, CAST(N'2018-05-07T21:28:30.687' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (6, N'bob', 3, CAST(N'2018-05-07T21:28:40.467' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (7, N'micky', 3, CAST(N'2018-05-08T10:26:49.570' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (8, N'micky', 1, CAST(N'2018-05-08T10:26:53.690' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (9, N'micky', 3, CAST(N'2018-05-08T10:28:39.987' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (10, N'micky', 1, CAST(N'2018-05-08T10:46:43.300' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (11, N'micky', 3, CAST(N'2018-05-08T10:58:40.870' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (12, N'micky', 2, CAST(N'2018-05-08T16:49:01.080' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (13, N'snoopy', 2, CAST(N'2018-05-09T09:10:04.013' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (14, N'snoopy', 2, CAST(N'2018-05-09T09:11:48.773' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (15, N'micky', 1, CAST(N'2018-05-09T20:21:07.243' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (16, N'micky', 4, CAST(N'2018-05-09T20:25:36.110' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (17, N'bob', 4, CAST(N'2018-05-09T20:25:47.873' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (18, N'bob', 3, CAST(N'2018-05-10T09:39:40.933' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (19, N'micky', 2, CAST(N'2018-05-10T09:39:55.573' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (20, N'bob', 4, CAST(N'2018-05-10T19:22:39.697' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (21, N'bob', 3, CAST(N'2018-05-11T08:55:38.340' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (22, N'bob', 2, CAST(N'2018-05-11T10:49:33.073' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (23, N'bob', 4, CAST(N'2018-05-11T11:42:28.843' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (24, N'bob', 4, CAST(N'2018-05-11T11:43:39.137' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (25, N'bob', 4, CAST(N'2018-05-11T11:43:46.983' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (26, N'bob', 4, CAST(N'2018-05-11T11:47:05.390' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (27, N'bob', 4, CAST(N'2018-05-11T11:47:33.920' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (28, N'bob', 4, CAST(N'2018-05-11T11:47:49.883' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (29, N'bob', 4, CAST(N'2018-05-11T11:48:11.240' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (30, N'bob', 4, CAST(N'2018-05-11T11:49:16.190' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (31, N'bob', 4, CAST(N'2018-05-11T11:49:17.517' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (32, N'bob', 4, CAST(N'2018-05-11T11:49:42.480' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (33, N'bob', 4, CAST(N'2018-05-11T11:49:44.977' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (34, N'bob', 4, CAST(N'2018-05-11T11:51:47.850' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (35, N'bob', 4, CAST(N'2018-05-11T11:52:32.507' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (36, N'bob', 4, CAST(N'2018-05-11T11:52:45.057' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (37, N'bob', 4, CAST(N'2018-05-11T11:54:19.263' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (38, N'bob', 4, CAST(N'2018-05-11T11:55:20.620' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (39, N'bob', 4, CAST(N'2018-05-11T12:21:53.493' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (40, N'bob', 5, CAST(N'2018-05-11T12:22:07.750' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (41, N'bob', 5, CAST(N'2018-05-11T12:23:54.187' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (42, N'bob', 5, CAST(N'2018-05-11T12:27:50.317' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (43, N'bob', 1, CAST(N'2018-05-11T12:29:13.257' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (44, N'bob', 1, CAST(N'2018-05-11T12:30:20.373' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (45, N'bob', 1, CAST(N'2018-05-11T12:30:35.490' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (46, N'bob', 1, CAST(N'2018-05-11T12:30:37.043' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (47, N'bob', 1, CAST(N'2018-05-11T12:31:30.887' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (48, N'bob', 1, CAST(N'2018-05-11T12:32:29.567' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (49, N'bob', 1, CAST(N'2018-05-11T12:33:25.610' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (50, N'bob', 1, CAST(N'2018-05-11T12:33:41.813' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (51, N'bob', 1, CAST(N'2018-05-11T12:37:39.890' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (52, N'bob', 1, CAST(N'2018-05-11T12:37:47.170' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (53, N'bob', 1, CAST(N'2018-05-11T12:37:50.523' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (54, N'bob', 1, CAST(N'2018-05-11T12:39:03.137' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (55, N'bob', 3, CAST(N'2018-05-11T12:40:08.160' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (56, N'bob', 3, CAST(N'2018-05-11T12:40:16.940' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (57, N'bob', 3, CAST(N'2018-05-11T12:42:56.570' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (58, N'bob', 3, CAST(N'2018-05-11T12:46:41.120' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (59, N'bob', 3, CAST(N'2018-05-11T12:46:53.367' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (60, N'bob', 3, CAST(N'2018-05-11T12:47:54.367' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (61, N'bob', 3, CAST(N'2018-05-11T12:48:06.810' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (62, N'bob', 1, CAST(N'2018-05-11T12:48:22.747' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (63, N'bob', 5, CAST(N'2018-05-11T12:54:46.863' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (64, N'bob', 5, CAST(N'2018-05-11T12:54:48.417' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (65, N'bob', 5, CAST(N'2018-05-11T12:55:07.147' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (66, N'bob', 5, CAST(N'2018-05-11T12:56:26.587' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (67, N'bob', 5, CAST(N'2018-05-11T12:56:31.763' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (68, N'bob', 5, CAST(N'2018-05-11T12:57:04.777' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (69, N'bob', 5, CAST(N'2018-05-11T12:58:15.943' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (70, N'bob', 5, CAST(N'2018-05-11T13:00:33.720' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (71, N'bob', 5, CAST(N'2018-05-11T13:00:37.397' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (72, N'bob', 5, CAST(N'2018-05-11T13:00:38.063' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (73, N'bob', 5, CAST(N'2018-05-11T13:03:50.293' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (74, N'bob', 5, CAST(N'2018-05-11T13:04:48.707' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (75, N'bob', 4, CAST(N'2018-05-11T13:05:30.667' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (76, N'bob', 1, CAST(N'2018-05-11T13:10:21.440' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (77, N'bob', 1, CAST(N'2018-05-11T13:12:51.720' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (78, N'bob', 1, CAST(N'2018-05-11T13:32:47.930' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (79, N'bob', 1, CAST(N'2018-05-11T13:33:05.753' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (80, N'bob', 1, CAST(N'2018-05-11T13:36:56.563' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (81, N'bob', 1, CAST(N'2018-05-11T13:37:36.713' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (82, N'bob', 1, CAST(N'2018-05-11T13:37:48.227' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (83, N'bob', 1, CAST(N'2018-05-11T13:38:14.910' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (84, N'bob', 1, CAST(N'2018-05-11T13:38:18.060' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (85, N'bob', 1, CAST(N'2018-05-11T13:38:40.897' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (86, N'bob', 1, CAST(N'2018-05-11T13:38:45.753' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (87, N'bob', 1, CAST(N'2018-05-11T13:39:32.040' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (88, N'bob', 1, CAST(N'2018-05-11T13:39:39.190' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (89, N'bob', 1, CAST(N'2018-05-11T13:39:52.867' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (90, N'bob', 1, CAST(N'2018-05-11T13:40:51.517' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (91, N'bob', 1, CAST(N'2018-05-11T13:41:34.853' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (92, N'bob', 1, CAST(N'2018-05-11T13:41:47.497' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (93, N'bob', 1, CAST(N'2018-05-11T13:41:56.683' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (94, N'bob', 1, CAST(N'2018-05-11T13:43:38.927' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (95, N'bob', 1, CAST(N'2018-05-11T13:43:56.047' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (96, N'bob', 1, CAST(N'2018-05-11T13:45:48.777' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (97, N'bob', 1, CAST(N'2018-05-11T13:47:16.250' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (98, N'bob', 1, CAST(N'2018-05-11T13:51:17.727' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (99, N'bob', 1, CAST(N'2018-05-11T13:53:55.970' AS DateTime), 0, N'1')
GO
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (100, N'bob', 1, CAST(N'2018-05-11T14:00:48.827' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (101, N'bob', 1, CAST(N'2018-05-11T14:01:33.567' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (102, N'bob', 1, CAST(N'2018-05-11T14:27:05.793' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (103, N'bob', 1, CAST(N'2018-05-11T14:27:13.060' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (104, N'bob', 1, CAST(N'2018-05-11T14:29:04.873' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (105, N'bob', 1, CAST(N'2018-05-11T14:29:35.850' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (106, N'bob', 1, CAST(N'2018-05-11T14:30:00.667' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (107, N'bob', 1, CAST(N'2018-05-11T14:30:13.770' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (108, N'bob', 5, CAST(N'2018-05-11T14:30:51.730' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (109, N'bob', 5, CAST(N'2018-05-11T14:33:17.403' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (110, N'bob', 5, CAST(N'2018-05-11T14:38:14.923' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (111, N'bob', 5, CAST(N'2018-05-11T14:39:42.843' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (112, N'bob', 5, CAST(N'2018-05-11T14:40:42.133' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (113, N'bob', 5, CAST(N'2018-05-11T14:41:01.927' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (114, N'bob', 5, CAST(N'2018-05-11T14:41:59.527' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (115, N'bob', 5, CAST(N'2018-05-11T14:44:03.303' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (116, N'bob', 5, CAST(N'2018-05-11T14:44:29.330' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (117, N'bob', 5, CAST(N'2018-05-11T14:45:14.873' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (118, N'bob', 5, CAST(N'2018-05-11T14:51:03.873' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (119, N'bob', 5, CAST(N'2018-05-11T14:51:11.137' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (120, N'bob', 1, CAST(N'2018-05-11T14:52:46.437' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (121, N'bob', 1, CAST(N'2018-05-11T14:54:22.380' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (122, N'bob', 5, CAST(N'2018-05-11T15:09:10.813' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (123, N'bob', 1, CAST(N'2018-05-11T15:09:58.150' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (124, N'bob', 1, CAST(N'2018-05-11T15:10:24.643' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (125, N'bob', 1, CAST(N'2018-05-11T15:10:39.190' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (126, N'bob', 1, CAST(N'2018-05-11T15:11:10.573' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (127, N'bob', 1, CAST(N'2018-05-11T15:11:34.200' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (128, N'bob', 1, CAST(N'2018-05-11T15:11:59.743' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (129, N'bob', 1, CAST(N'2018-05-11T15:12:59.537' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (130, N'bob', 1, CAST(N'2018-05-11T15:13:14.640' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (131, N'bob', 1, CAST(N'2018-05-11T15:13:33.847' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (132, N'bob', 1, CAST(N'2018-05-11T15:14:38.483' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (133, N'bob', 1, CAST(N'2018-05-11T15:15:26.267' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (134, N'bob', 1, CAST(N'2018-05-11T15:15:47.123' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (135, N'bob', 1, CAST(N'2018-05-11T15:16:35.813' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (136, N'bob', 1, CAST(N'2018-05-11T15:16:50.547' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (137, N'bob', 1, CAST(N'2018-05-11T15:17:23.363' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (138, N'bob', 1, CAST(N'2018-05-11T15:17:42.173' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (139, N'bob', 1, CAST(N'2018-05-11T15:17:58.583' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (140, N'bob', 1, CAST(N'2018-05-11T15:18:57.467' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (141, N'bob', 1, CAST(N'2018-05-11T15:19:59.417' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (142, N'bob', 1, CAST(N'2018-05-11T15:20:21.257' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (143, N'bob', 1, CAST(N'2018-05-11T15:21:11.433' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (144, N'bob', 1, CAST(N'2018-05-11T15:21:14.930' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (145, N'bob', 1, CAST(N'2018-05-11T15:22:01.623' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (146, N'bob', 1, CAST(N'2018-05-11T15:22:09.550' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (147, N'bob', 1, CAST(N'2018-05-11T15:22:54.393' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (148, N'bob', 1, CAST(N'2018-05-11T15:23:56.353' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (149, N'bob', 1, CAST(N'2018-05-11T15:24:12.650' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (150, N'bob', 1, CAST(N'2018-05-11T15:24:56.147' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (151, N'bob', 2, CAST(N'2018-05-12T12:04:34.940' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (152, N'bob', 1, CAST(N'2018-05-12T16:29:15.853' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (153, N'bob', 1, CAST(N'2018-05-12T16:29:16.183' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (154, N'bob', 3, CAST(N'2018-05-13T12:59:30.143' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (155, N'bob', 3, CAST(N'2018-05-13T13:06:29.150' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (156, N'bob', 3, CAST(N'2018-05-13T13:06:48.530' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (157, N'bob', 3, CAST(N'2018-05-13T13:10:17.053' AS DateTime), 0, N'1')
INSERT [dbo].[WatchHistory] ([watchHistorySeqNo], [account], [videoSeqNo], [watchVideoDate], [watchHistoryScore], [watchHistoryStatus]) VALUES (158, N'bob', 3, CAST(N'2018-05-13T13:10:28.577' AS DateTime), 0, N'1')
SET IDENTITY_INSERT [dbo].[WatchHistory] OFF
SET IDENTITY_INSERT [dbo].[WatchLaterVideo] ON 

INSERT [dbo].[WatchLaterVideo] ([watchLaterVideosSeqNo], [account], [videoSeqNo], [watchLaterVideoDate], [watchLaterVideosScore], [watchLaterVideosStatus]) VALUES (1, N'bob', 1, CAST(N'2018-05-07T09:26:37.3080000' AS DateTime2), 0, N'1')
INSERT [dbo].[WatchLaterVideo] ([watchLaterVideosSeqNo], [account], [videoSeqNo], [watchLaterVideoDate], [watchLaterVideosScore], [watchLaterVideosStatus]) VALUES (2, N'bob', 2, CAST(N'2018-05-07T09:26:40.9500000' AS DateTime2), 0, N'1')
INSERT [dbo].[WatchLaterVideo] ([watchLaterVideosSeqNo], [account], [videoSeqNo], [watchLaterVideoDate], [watchLaterVideosScore], [watchLaterVideosStatus]) VALUES (3, N'bob', 4, CAST(N'2018-05-07T09:29:55.6870000' AS DateTime2), 0, N'1')
INSERT [dbo].[WatchLaterVideo] ([watchLaterVideosSeqNo], [account], [videoSeqNo], [watchLaterVideoDate], [watchLaterVideosScore], [watchLaterVideosStatus]) VALUES (4, N'bob', 3, CAST(N'2018-05-07T09:29:59.1430000' AS DateTime2), 0, N'1')
INSERT [dbo].[WatchLaterVideo] ([watchLaterVideosSeqNo], [account], [videoSeqNo], [watchLaterVideoDate], [watchLaterVideosScore], [watchLaterVideosStatus]) VALUES (5, N'micky', 3, CAST(N'2018-05-08T10:27:38.5670000' AS DateTime2), 0, N'1')
INSERT [dbo].[WatchLaterVideo] ([watchLaterVideosSeqNo], [account], [videoSeqNo], [watchLaterVideoDate], [watchLaterVideosScore], [watchLaterVideosStatus]) VALUES (6, N'micky', 2, CAST(N'2018-05-08T10:28:44.9230000' AS DateTime2), 0, N'1')
SET IDENTITY_INSERT [dbo].[WatchLaterVideo] OFF
ALTER TABLE [dbo].[LikeUnlikeVideos]  WITH CHECK ADD  CONSTRAINT [FK_LikeUnlikeVideos_Member] FOREIGN KEY([account])
REFERENCES [dbo].[Member] ([account])
GO
ALTER TABLE [dbo].[LikeUnlikeVideos] CHECK CONSTRAINT [FK_LikeUnlikeVideos_Member]
GO
ALTER TABLE [dbo].[LikeUnlikeVideos]  WITH CHECK ADD  CONSTRAINT [FK_LikeUnlikeVideos_Video] FOREIGN KEY([videoSeqNo])
REFERENCES [dbo].[Video] ([videoSeqNo])
GO
ALTER TABLE [dbo].[LikeUnlikeVideos] CHECK CONSTRAINT [FK_LikeUnlikeVideos_Video]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Member] FOREIGN KEY([account])
REFERENCES [dbo].[Member] ([account])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Member]
GO
ALTER TABLE [dbo].[ReplyCommentVideo]  WITH CHECK ADD  CONSTRAINT [FK_ReplyCommentVideo_Member] FOREIGN KEY([account])
REFERENCES [dbo].[Member] ([account])
GO
ALTER TABLE [dbo].[ReplyCommentVideo] CHECK CONSTRAINT [FK_ReplyCommentVideo_Member]
GO
ALTER TABLE [dbo].[ReplyCommentVideoLikeUnlike]  WITH CHECK ADD  CONSTRAINT [FK_ReplyCommentVideoLikeUnlike_Member] FOREIGN KEY([account])
REFERENCES [dbo].[Member] ([account])
GO
ALTER TABLE [dbo].[ReplyCommentVideoLikeUnlike] CHECK CONSTRAINT [FK_ReplyCommentVideoLikeUnlike_Member]
GO
ALTER TABLE [dbo].[ReplyCommentVideoLikeUnlike]  WITH CHECK ADD  CONSTRAINT [FK_ReplyCommentVideoLikeUnlike_ReplyCommentVideo] FOREIGN KEY([replyCommentVideoSeqNo])
REFERENCES [dbo].[ReplyCommentVideo] ([replyCommentVideoSeqNo])
GO
ALTER TABLE [dbo].[ReplyCommentVideoLikeUnlike] CHECK CONSTRAINT [FK_ReplyCommentVideoLikeUnlike_ReplyCommentVideo]
GO
ALTER TABLE [dbo].[SubscriptionUploader]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionUploader_Member] FOREIGN KEY([account])
REFERENCES [dbo].[Member] ([account])
GO
ALTER TABLE [dbo].[SubscriptionUploader] CHECK CONSTRAINT [FK_SubscriptionUploader_Member]
GO
ALTER TABLE [dbo].[SubscriptionUploader]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionUploader_Member1] FOREIGN KEY([uploaderAccount])
REFERENCES [dbo].[Member] ([account])
GO
ALTER TABLE [dbo].[SubscriptionUploader] CHECK CONSTRAINT [FK_SubscriptionUploader_Member1]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_VideoType] FOREIGN KEY([videoType])
REFERENCES [dbo].[VideoType] ([videoType])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_VideoType]
GO
ALTER TABLE [dbo].[WatchHistory]  WITH CHECK ADD  CONSTRAINT [FK_WatchHistory_Member] FOREIGN KEY([account])
REFERENCES [dbo].[Member] ([account])
GO
ALTER TABLE [dbo].[WatchHistory] CHECK CONSTRAINT [FK_WatchHistory_Member]
GO
ALTER TABLE [dbo].[WatchHistory]  WITH CHECK ADD  CONSTRAINT [FK_WatchHistory_Video] FOREIGN KEY([videoSeqNo])
REFERENCES [dbo].[Video] ([videoSeqNo])
GO
ALTER TABLE [dbo].[WatchHistory] CHECK CONSTRAINT [FK_WatchHistory_Video]
GO
