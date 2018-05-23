USE [EEITDB]
GO
/****** Object:  Table [dbo].[WatchLaterVideo]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[WatchLaterVideo]
GO
/****** Object:  Table [dbo].[WatchHistory]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[WatchHistory]
GO
/****** Object:  Table [dbo].[VideoType]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[VideoType]
GO
/****** Object:  Table [dbo].[VideoReportType]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[VideoReportType]
GO
/****** Object:  Table [dbo].[VideoReport]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[VideoReport]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[SubscriptionUploader]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[SubscriptionUploader]
GO
/****** Object:  Table [dbo].[streetname]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[streetname]
GO
/****** Object:  Table [dbo].[Sticker]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Sticker]
GO
/****** Object:  Table [dbo].[shopReport]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[shopReport]
GO
/****** Object:  Table [dbo].[ReplyCommentVideoLikeUnlike]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ReplyCommentVideoLikeUnlike]
GO
/****** Object:  Table [dbo].[ReplyCommentVideo]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ReplyCommentVideo]
GO
/****** Object:  Table [dbo].[QuestionList]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[QuestionList]
GO
/****** Object:  Table [dbo].[ProTransport]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProTransport]
GO
/****** Object:  Table [dbo].[ProPayType]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProPayType]
GO
/****** Object:  Table [dbo].[productReport]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[productReport]
GO
/****** Object:  Table [dbo].[ProductPicture]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProductPicture]
GO
/****** Object:  Table [dbo].[ProductHot]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProductHot]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[ProCategory]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProCategory]
GO
/****** Object:  Table [dbo].[ProCartList]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProCartList]
GO
/****** Object:  Table [dbo].[ProCart]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProCart]
GO
/****** Object:  Table [dbo].[ProBrand]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProBrand]
GO
/****** Object:  Table [dbo].[ProAdvertisement]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[ProAdvertisement]
GO
/****** Object:  Table [dbo].[PersonShop]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[PersonShop]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[OrderProduct]
GO
/****** Object:  Table [dbo].[OrderPdf]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[OrderPdf]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[OrderList]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[NotificationRecording]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[NotificationRecording]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[MyMessage]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[MyMessage]
GO
/****** Object:  Table [dbo].[MessageVideo]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[MessageVideo]
GO
/****** Object:  Table [dbo].[MessageType]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[MessageType]
GO
/****** Object:  Table [dbo].[MessageImage]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[MessageImage]
GO
/****** Object:  Table [dbo].[MessageFile]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[MessageFile]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Message]
GO
/****** Object:  Table [dbo].[MemberReport]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[MemberReport]
GO
/****** Object:  Table [dbo].[MemberQues]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[MemberQues]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Member]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Manager]
GO
/****** Object:  Table [dbo].[LiveStreamReport]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[LiveStreamReport]
GO
/****** Object:  Table [dbo].[LiveStreamHistory]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[LiveStreamHistory]
GO
/****** Object:  Table [dbo].[LiveStream]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[LiveStream]
GO
/****** Object:  Table [dbo].[LiveChat]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[LiveChat]
GO
/****** Object:  Table [dbo].[LikeUnlikeVideos]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[LikeUnlikeVideos]
GO
/****** Object:  Table [dbo].[Friend]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Friend]
GO
/****** Object:  Table [dbo].[Customized]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Customized]
GO
/****** Object:  Table [dbo].[CommentVideosLikeUnlike]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[CommentVideosLikeUnlike]
GO
/****** Object:  Table [dbo].[CommentVideos]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[CommentVideos]
GO
/****** Object:  Table [dbo].[Bid]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Bid]
GO
/****** Object:  Table [dbo].[AuctionEnd]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[AuctionEnd]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[Auction]
GO
/****** Object:  Table [dbo].[AdviceReport]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP TABLE [dbo].[AdviceReport]
GO
USE [master]
GO
/****** Object:  Database [EEITDB]    Script Date: 2018/5/23 下午 03:49:14 ******/
DROP DATABASE [EEITDB]
GO
/****** Object:  Database [EEITDB]    Script Date: 2018/5/23 下午 03:49:14 ******/
CREATE DATABASE [EEITDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EEITDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EEITDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EEITDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EEITDB_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EEITDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EEITDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EEITDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EEITDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EEITDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EEITDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EEITDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EEITDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EEITDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EEITDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EEITDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EEITDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EEITDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EEITDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EEITDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EEITDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EEITDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EEITDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EEITDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EEITDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EEITDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EEITDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EEITDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EEITDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EEITDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EEITDB] SET  MULTI_USER 
GO
ALTER DATABASE [EEITDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EEITDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EEITDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EEITDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EEITDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EEITDB', N'ON'
GO
ALTER DATABASE [EEITDB] SET QUERY_STORE = OFF
GO
USE [EEITDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EEITDB]
GO
/****** Object:  Table [dbo].[AdviceReport]    Script Date: 2018/5/23 下午 03:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdviceReport](
	[adviceSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[adviceTime] [datetime] NOT NULL,
	[adviceType] [varchar](50) NOT NULL,
	[adviceTitle] [varchar](50) NOT NULL,
	[adviceContent] [varchar](max) NOT NULL,
	[adviceStatus] [varchar](50) NOT NULL,
	[replyTime] [datetime] NULL,
	[replyContent] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 2018/5/23 下午 03:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[account] [varchar](50) NOT NULL,
	[auctionSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[aucBegin] [datetime] NOT NULL,
	[aucEnd] [datetime] NOT NULL,
	[liveStreamSeqNo] [int] NOT NULL,
	[productSeqNo] [bigint] NOT NULL,
	[proPrice] [bigint] NOT NULL,
	[auctionStatus] [int] NOT NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[auctionSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionEnd]    Script Date: 2018/5/23 下午 03:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionEnd](
	[auctionEndSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[proPrice] [int] NOT NULL,
	[proTime] [datetime] NOT NULL,
	[productSeqNo] [int] NOT NULL,
	[picSeqNo] [int] NULL,
	[proName] [varchar](max) NULL,
 CONSTRAINT [PK_AuctionEnd] PRIMARY KEY CLUSTERED 
(
	[auctionEndSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bid]    Script Date: 2018/5/23 下午 03:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid](
	[auctionSeqNo] [int] NOT NULL,
	[bidSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[bidTime] [datetime] NOT NULL,
	[bidPrice] [int] NOT NULL,
	[account] [varchar](50) NOT NULL,
	[productSeqNo] [bigint] NOT NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[bidSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentVideos]    Script Date: 2018/5/23 下午 03:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentVideos](
	[commentVideoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](255) NOT NULL,
	[commentArticle] [varchar](max) NOT NULL,
	[commentDate] [datetime2](7) NOT NULL,
	[commentLike] [int] NOT NULL,
	[commentUnLike] [int] NOT NULL,
	[commentVideoStatus] [varchar](255) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
 CONSTRAINT [PK__CommentV__E23E0716FEE5638D] PRIMARY KEY CLUSTERED 
(
	[commentVideoSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentVideosLikeUnlike]    Script Date: 2018/5/23 下午 03:49:14 ******/
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
/****** Object:  Table [dbo].[Customized]    Script Date: 2018/5/23 下午 03:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customized](
	[customizedSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[customizedPic] [varchar](max) NOT NULL,
	[customizedTitle] [varchar](max) NOT NULL,
	[customizedTime] [datetime] NOT NULL,
	[customizedDesc] [varchar](max) NOT NULL,
	[customizedStatus] [int] NOT NULL,
	[account] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friend]    Script Date: 2018/5/23 下午 03:49:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend](
	[friendseqNo] [int] IDENTITY(1,1) NOT NULL,
	[friendsend] [varchar](50) NOT NULL,
	[friendto] [varchar](50) NOT NULL,
	[time] [datetime] NOT NULL,
	[friendStatus] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeUnlikeVideos]    Script Date: 2018/5/23 下午 03:49:14 ******/
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
/****** Object:  Table [dbo].[LiveChat]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveChat](
	[liveChatSesNo] [int] IDENTITY(1,1) NOT NULL,
	[liveChatArticle] [varchar](max) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[liveChatDate] [datetime] NOT NULL,
	[liveChatStatus] [varchar](50) NOT NULL,
	[liveChatType] [nchar](10) NOT NULL,
	[liveStreamSeqNo] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiveStream]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveStream](
	[account] [varchar](50) NOT NULL,
	[liveStreamSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[liveStart] [datetime] NOT NULL,
	[liveEnd] [datetime] NULL,
	[videoSeqNo] [int] NOT NULL,
	[streamName] [varchar](max) NOT NULL,
	[liveStatus] [varchar](50) NOT NULL,
	[liveCoverPath] [varchar](500) NOT NULL,
	[liveCoverName] [varchar](500) NOT NULL,
	[liveStreamPath] [varchar](500) NULL,
	[liveStreamView] [int] NULL,
	[allLiveStreamView] [int] NULL,
 CONSTRAINT [PK_LiveStream] PRIMARY KEY CLUSTERED 
(
	[liveStreamSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiveStreamHistory]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveStreamHistory](
	[account] [varchar](50) NOT NULL,
	[LiveStreamHistorySeqNo] [int] IDENTITY(1,1) NOT NULL,
	[LiveStreamSeqNo] [int] NOT NULL,
	[HistoryTime] [datetime] NOT NULL,
	[LiveStreamStatus] [varchar](1) NOT NULL,
	[LiveStreamView] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiveStreamReport]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveStreamReport](
	[liveStreamReportSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[accountFrom] [varchar](50) NOT NULL,
	[accountTo] [varchar](50) NOT NULL,
	[reportTitle] [varchar](50) NOT NULL,
	[reportContent] [varchar](max) NOT NULL,
	[reportTime] [datetime] NOT NULL,
	[reportStatus] [varchar](50) NOT NULL,
	[replyTime] [datetime] NULL,
	[replyContent] [varchar](max) NULL,
	[reportType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LiveStreamReport] PRIMARY KEY CLUSTERED 
(
	[liveStreamReportSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[managerSeqNo] [int] IDENTITY(20000,1) NOT NULL,
	[managerId] [varchar](500) NOT NULL,
	[managerPwd] [varchar](500) NOT NULL,
	[managerName] [varchar](1000) NOT NULL,
	[managerStatus] [int] NOT NULL,
 CONSTRAINT [PK__Manager__47E0141F1F88A00E] PRIMARY KEY CLUSTERED 
(
	[managerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[MemberQues]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberQues](
	[memberQuesSeqNo] [int] IDENTITY(10000,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[memTopic] [varchar](1000) NOT NULL,
	[memTitle] [varchar](1000) NOT NULL,
	[memAsk] [varchar](3000) NOT NULL,
	[memQuesTime] [datetime] NOT NULL,
	[memFileName] [varchar](1000) NOT NULL,
	[memFilePath] [varchar](1000) NOT NULL,
 CONSTRAINT [PK__MemberQu__CEBD0F946CDF9311] PRIMARY KEY CLUSTERED 
(
	[memberQuesSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberReport]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberReport](
	[memberReportSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[accountFrom] [varchar](50) NOT NULL,
	[accountTo] [varchar](50) NOT NULL,
	[reportTitle] [varchar](50) NOT NULL,
	[reportContent] [varchar](max) NOT NULL,
	[reportTime] [datetime] NOT NULL,
	[imageName] [varchar](500) NULL,
	[imagePath] [varchar](500) NULL,
	[reportStatus] [varchar](50) NOT NULL,
	[replyTime] [datetime] NULL,
	[replyContent] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[MessageFile]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageFile](
	[messageFileSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[messageFileName] [varchar](max) NOT NULL,
	[messageFileOriginalName] [varchar](max) NOT NULL,
	[messageFilePath] [varchar](max) NOT NULL,
	[messageFileType] [varchar](50) NOT NULL,
	[messageFileStatus] [varchar](5) NOT NULL,
	[messageFileScore] [int] NOT NULL,
	[messageFileUploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MessageFile] PRIMARY KEY CLUSTERED 
(
	[messageFileSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageImage]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[MessageType]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[MessageVideo]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageVideo](
	[messageVideoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[messageVideoName] [varchar](max) NOT NULL,
	[messageVideoOriginalName] [varchar](max) NOT NULL,
	[messageVideoPath] [varchar](max) NOT NULL,
	[messageVideoType] [varchar](50) NOT NULL,
	[messageVideoStatus] [varchar](5) NOT NULL,
	[messageVideoScore] [int] NOT NULL,
	[messageVideoUploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MessageVideo] PRIMARY KEY CLUSTERED 
(
	[messageVideoSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyMessage]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyMessage](
	[myMessageSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[myMessageFrom] [varchar](50) NOT NULL,
	[myMessageTo] [varchar](50) NOT NULL,
	[myMessageTitle] [varchar](50) NOT NULL,
	[myMessageContent] [varchar](max) NOT NULL,
	[myMessageStatus] [varchar](50) NOT NULL,
	[myMessageTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
	[eventPK] [varchar](50) NULL,
 CONSTRAINT [PK_Notification_1] PRIMARY KEY CLUSTERED 
(
	[notificationSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationRecording]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
	[eventPK] [varchar](50) NULL,
 CONSTRAINT [PK_notificationRecording] PRIMARY KEY CLUSTERED 
(
	[notificationRecordingSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[OrderList]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[orderSeqNo] [int] IDENTITY(18050000,1) NOT NULL,
	[orderproductNum] [int] NULL,
	[ordererName] [varchar](50) NULL,
	[ordererTel] [int] NULL,
	[ordererHomeTel] [int] NULL,
	[ordererEmail] [varchar](max) NULL,
	[ordererAddr] [varchar](max) NULL,
	[recipientName] [varchar](50) NULL,
	[recipientTel] [int] NULL,
	[recipientHomeTel] [int] NULL,
	[recipientEmail] [varchar](50) NULL,
	[recipientAddr] [varchar](50) NULL,
	[proPayTypeSeqNo] [int] NULL,
	[proTransportSeqNo] [int] NULL,
	[orderTime] [datetime] NULL,
	[orderStatus] [int] NULL,
	[orderTotalPrice] [bigint] NULL,
	[account] [varchar](50) NULL,
 CONSTRAINT [PK_OrderList] PRIMARY KEY CLUSTERED 
(
	[orderSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPdf]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPdf](
	[orderPdfSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[orderPdfFileName] [varchar](max) NULL,
	[orderPdfFilePath] [varchar](max) NULL,
	[orderSeqNo] [int] NULL,
 CONSTRAINT [PK_OrderPdf] PRIMARY KEY CLUSTERED 
(
	[orderPdfSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[productSeqNo] [int] NULL,
	[productCount] [int] NULL,
	[productPrice] [bigint] NULL,
	[account] [varchar](50) NULL,
	[orderSeqNo] [int] NOT NULL,
	[productTotal] [bigint] NULL,
	[orderproductNum] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[orderproductNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonShop]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[ProAdvertisement]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[ProBrand]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[ProCart]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[ProCartList]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[ProCategory]    Script Date: 2018/5/23 下午 03:49:15 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productSeqNo] [bigint] IDENTITY(201805000,1) NOT NULL,
	[proName] [varchar](max) NOT NULL,
	[proCategorySeqNo] [int] NOT NULL,
	[proBrand] [varchar](max) NULL,
	[proPrice] [bigint] NOT NULL,
	[proStatus] [int] NOT NULL,
	[proPayTypeSeqNo] [int] NOT NULL,
	[proPcs] [int] NOT NULL,
	[proDescription] [varchar](max) NOT NULL,
	[proTransSeqNo] [int] NOT NULL,
	[proAdverSeqNo] [int] NOT NULL,
	[proDate] [datetime] NOT NULL,
	[account] [varchar](50) NOT NULL,
	[picSeqNo] [int] NULL,
	[auctionStatus] [int] NULL,
	[auctionPic] [varchar](50) NULL,
	[auctionSeqNo] [int] NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[productSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductHot]    Script Date: 2018/5/23 下午 03:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductHot](
	[productSeqNo] [int] NOT NULL,
	[productHot] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPicture]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[productReport]    Script Date: 2018/5/23 下午 03:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productReport](
	[productReportSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[accountFrom] [varchar](50) NOT NULL,
	[productSeqNo] [varchar](50) NOT NULL,
	[reportTitle] [varchar](50) NOT NULL,
	[reportContent] [varchar](max) NOT NULL,
	[reportTime] [datetime] NOT NULL,
	[imageName] [varchar](500) NULL,
	[imagePath] [varchar](500) NULL,
	[reportStatus] [varchar](50) NOT NULL,
	[replyTime] [datetime] NULL,
	[replyContent] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProPayType]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[ProTransport]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[QuestionList]    Script Date: 2018/5/23 下午 03:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionList](
	[questionListSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[questionListTitle] [varchar](max) NULL,
	[questionListArticle] [varchar](max) NULL,
	[questionListStatus] [varchar](1) NULL,
	[questionListUploadDate] [varchar](max) NULL,
	[managerId] [varchar](500) NULL,
 CONSTRAINT [PK_QuestionList] PRIMARY KEY CLUSTERED 
(
	[questionListSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyCommentVideo]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[ReplyCommentVideoLikeUnlike]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[shopReport]    Script Date: 2018/5/23 下午 03:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopReport](
	[shopReportSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[accountFrom] [varchar](50) NOT NULL,
	[personShopSeqNo] [int] NOT NULL,
	[reportTitle] [varchar](50) NOT NULL,
	[reportContent] [varchar](max) NOT NULL,
	[reportTime] [datetime] NOT NULL,
	[imageName] [varchar](500) NULL,
	[imagePath] [varchar](500) NULL,
	[reportStatus] [varchar](50) NOT NULL,
	[replyTime] [datetime] NULL,
	[replyContent] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sticker]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[streetname]    Script Date: 2018/5/23 下午 03:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[streetname](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[mailcode] [varchar](10) NOT NULL,
	[city] [varchar](10) NOT NULL,
	[country] [varchar](10) NOT NULL,
	[road] [varchar](10) NOT NULL,
 CONSTRAINT [PK__streetna__DD701264CAA25652] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionUploader]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[Video]    Script Date: 2018/5/23 下午 03:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[videoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[videoTitle] [varchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[VideoReport]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[VideoReportType]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[VideoType]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[WatchHistory]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
/****** Object:  Table [dbo].[WatchLaterVideo]    Script Date: 2018/5/23 下午 03:49:16 ******/
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
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([managerSeqNo], [managerId], [managerPwd], [managerName], [managerStatus]) VALUES (20000, N'mana1', N'123', N'123', 1)
SET IDENTITY_INSERT [dbo].[Manager] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10000, N'bob', N'123', N'BOB', N'包柏', N'陳', N'男性', N'2222@gmail.com', N'台北市', CAST(N'1968-06-04T00:00:00.000' AS DateTime), N'C:/resources/images/members/bob/photo/bob.PNG', N'h2.PNG', N'0937123456', CAST(N'2018-05-06T14:34:24.653' AS DateTime), CAST(N'2018-05-22T12:56:16.097' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10006, N'boen', N'123', N'博博', N'恩恩', N'米', N'男性', N'boen@gmail.com', N'bb', CAST(N'2018-01-28T00:00:00.000' AS DateTime), N'C:/resources/images/members/boen/photo/boen.jpg', N'1011.jpg', N'11131', CAST(N'2018-05-15T12:03:03.267' AS DateTime), CAST(N'2018-05-21T13:54:50.930' AS DateTime), 0, 0)
INSERT [dbo].[Member] ([memberSeqNo], [account], [password], [nickname], [firstname], [lastname], [gender], [email], [address], [birthday], [photoPath], [photoName], [phone], [registerdate], [lastlogin], [subscription], [ban]) VALUES (10001, N'micky', N'123', N'MICKY', N'米奇', N'陳', N'男性', N'333@gmail.com', N'台灣', CAST(N'2018-05-03T00:00:00.000' AS DateTime), N'C:/resources/images/members/micky/photo/micky.png', N'javascript.png', N'0937456789', CAST(N'2018-05-06T14:35:36.587' AS DateTime), CAST(N'2018-05-22T09:59:47.930' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (1, N'Apple Mac Book Air 2', 1, N'Apple', 55000, 1, 4, 94, N'我們打造 MacBook 的目標，意在實現種種不可能：打造出史上最輕盈、最纖薄的 Mac 筆記型電腦，卻仍能提供完整的全尺寸使用體驗。在精巧之餘，還要具備更強勁的威力。新款 MacBook 採用全新第七代 Intel Core m3、i5 及 i7 處理器，效能表現速度提升達 20%1， SSD 儲存裝置更快達 50%2。', 1, 0, CAST(N'2018-05-16T15:17:17.393' AS DateTime), N'bob', 1, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (2, N'ASUS X5500 GTX990獨顯', 1, N'ASUS', 30000, 1, 2, 51, N'輕薄1.08 kg
ASUS Splendid 色溫校正功能
長效11H續航力
附贈Microsolft Office Mobile (Word Mobile, Excel Mobile, PowerPoint Mobile & OneNote)

規格說明：
10.1" HD 1366x768 螢幕顯示器
Intel Atom x5-Z8350四核心處理器(1.44-1.92 GHz)
64G eMMC 儲存空間
2G DDR3 記憶體 DRAM
Windows 10 作業系統', 3, 0, CAST(N'2018-05-16T15:34:37.843' AS DateTime), N'bob', 2, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (3, N'MSI GT73 1070Ti 6G SSD512GB', 1, N'MSI', 39900, 1, 1, 90, N'獨家Matrix Display矩陣式3+1螢幕輸出功能
微星是世界第一家在高階遊戲筆電產品上導入Matrix display多螢幕輸出功能，GT72內建HDMI 1.4（支援4K@30Hz）和兩組Mini Display-port 1.2（支援4K@60Hz），能夠打造Surround view環視可讓遊戲畫面一次橫跨三台高畫質螢幕，大幅提升遊戲過程中的臨場體驗，或者是輕鬆地外接三台高畫質螢幕顯示輸出，即使目前最受矚目的4K*2K超高解析度電視畫面也有支援。加上筆記型電腦內建的螢幕，提供優異的3+1螢幕輸出高畫質，使用者可以享受到多螢幕輸出所帶來的多工使用效率。兩組Mini Display-port 1.2皆支援連接120Hz高畫質液晶顯示器作為影像輸出，不論是進行極速快感的3D遊戲或驚心動魄的電影，都將提供使用者感受到畫面流暢無殘影的立體視覺震撼。', 1, 0, CAST(N'2018-05-16T15:40:16.703' AS DateTime), N'bob', 3, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (4, N'MSI NVIDIA1080 超強獨顯 雙風扇 ', 1, N'MSI', 22000, 1, 4, 66, N'PC電競平台 
GeForceR GTX專為遊戲優化
GeForce GTX 支援新一代遊戲技術 (NVIDIA GameWorks?) 和完整遊戲體驗 (GeForce Experience?)，提供流暢極速的對戰體驗。
 絕妙的虛擬實境饗宴
NVIDIA 針對虛擬實境提供獨家技術，給你清晰的影像顯示和流暢的視覺表現，讓你的虛擬實境體驗驚艷難忘。
 專屬你的遊戲體驗
不僅隨時更新驅動程式，讓你有最佳的遊戲體驗，還能分享你的光榮時刻。
 更即時、更順暢的遊戲體驗
突破性的顯示技術 NVIDIA G-SYNC ，同步從GeForce GTX GPU更新影像至顯示器，有效排除遊戲的畫面撕裂與降低螢幕跳動與延遲，大幅提升你的戰鬥力。
TORX 2.0 風扇 
優越的性能來自卓越的團隊
MSI TORX 2.0 獨家風扇技術，優異的結構整合，讓Twin Frozr VI 散熱表現達到更高的水準。
TORX 2.0風扇設計，提升22％的氣流量，卻悄然無聲，讓您不受打擾，專注於激戰中。', 1, 0, CAST(N'2018-05-16T15:45:12.903' AS DateTime), N'bob', 4, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (5, N'Panasonic EH-NA98奈米水離子吹風機', 4, N'Panasonic', 4800, 1, 3, 99, N'◆奈米水離子: 含水量是負離子的 1000倍，分子量是負離子的10萬分之1,可以深入頭髮讓張開的毛麟片閉鎖, 增加頭髮的保濕度,提高頭髮的亮澤感。
◆白金負離子:白金負離子會附著在頭髮表面,形成保護膜,減低紫外線對頭髮的傷害。
◆雙重呵護-頭皮到髮尾完整保養，  維持頭皮清爽健康，同時潤澤細微髮絲，長期使用，頭髮受損降低、恢復健康秀髮。   ', 2, 0, CAST(N'2018-05-17T11:59:18.900' AS DateTime), N'micky', 5, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (6, N'Nikon D750 單機身(公司貨)', 3, NULL, 43480, 1, 1, 97, N'全新 NIKON D750 搭載2430 萬像素、EXPEED 4 影像處理引擎以及1080/60p 攝錄 Full HD 短片的強大拍攝功能，可傾斜的 LCD 螢幕令攝影體驗更便利，內置 Wi-Fi？ 功能，可立即與人分享。此款相機是NIKON  FX 格式型號中最小巧輕盈，採用嶄新研發單殼式機身的 FX 格式 DSLR，堅韌包覆式結構令外殼小巧耐用，是您攝影旅途上的理想拍檔。', 1, 0, CAST(N'2018-05-17T12:42:31.903' AS DateTime), N'micky', 6, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (7, N'Dyson Cyclone V10 Absolute 手持無線吸塵器', 1, NULL, 26900, 1, 2, 99, N' || 最新第十代戴森數位馬達  雙吸頭機皇升級版 ||
數量有限！趕緊搶購

專利科技,深層清潔家居每個角落
長達60分鐘, 無線輕巧 吸力不減

Dyson V10歐美發表會上，品牌創辦人James Dyson就表示：「Dyson V10的出現讓他不再研發有線吸塵器。」之所以能讓輕巧的手持無線吸塵器也能擁有強大吸力，秘密就是這顆新一代研發的Dyson V10數位馬達，重量比上一代的V8數位馬達減半，但轉速高達每分鐘125000轉，讓Dyson V10 無線吸塵器能夠輕巧又擁有強勁吸力。', 4, 0, CAST(N'2018-05-17T12:50:31.737' AS DateTime), N'micky', 7, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (8, N'ikea TARVA 床架, 松木, Luroy', 4, NULL, 790, 1, 1, 55, N'簡約設計的TARVA床框採用未經處理的木材，是現代呈現北歐傢具傳統的典範。歷久不衰的風格完美融入其他風格，並配襯其他傢具。', 1, 0, CAST(N'2018-05-19T22:25:07.967' AS DateTime), N'micky', 9, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (9, N'ikea NESTTUN 床架, 白色, Luroy', 4, NULL, 950, 1, 2, 12, N'耐用鋼製結構，配合網狀床頭板，營造輕巧的感覺。簡約設計，可與其他風格傢具完美配合', 1, 0, CAST(N'2018-05-19T22:26:47.310' AS DateTime), N'micky', 10, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (10, N'(代購)EVE QUICK 頭痛藥 ', 6, NULL, 150, 1, 1, 20, N'EVE A錠小顆粒，易於吞服，對生理痛或頭痛非常有效。EVE A錠EX是含有200mg布洛芬的藥劑，能對劇烈的生理痛或頭痛發揮優異的功效。 EVE QUICK頭痛藥, EVE QUICK頭痛藥DX是在鎮痛成分布洛芬中添加氧化鎂的獨自處方。此處方在鎮痛成分快速被吸收的同時可以保護胃黏膜，為名副其實的「止痛速效、對胃溫和」的止痛藥。 尤其在「EVE QUICK頭痛藥DX」內所含的鎮痛成分布洛芬的單次使用劑量為200mg，是能更加有效擊退劇烈頭痛、速效的頭痛藥。', 1, 0, CAST(N'2018-05-19T22:29:17.827' AS DateTime), N'micky', 11, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (11, N'A & F 圖樣圓領 T 恤', 8, NULL, 680, 1, 1, 55, N'產品詳細資料
經典圓領 T 恤，左胸圖樣，輕盈材質，直筒下襬。進口商品。

布料和護理
100% 棉
冷水清洗（30°c）, 與同色系衣物一起清洗
僅可用不含氯的漂白劑
低溫機器烘乾
若有需要，請低溫熨燙
不可乾洗', 1, 0, CAST(N'2018-05-19T22:32:48.600' AS DateTime), N'micky', 12, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805000, N'IKEA BESTA 電視收納組合/玻璃門板, 黑棕色 Grundsviken, 深灰色 透明玻璃', 4, NULL, 22500, 1, 1, 5, N'可提供更多儲物空間，也能整齊收納電線，使電視周圍保持整潔；你可以選擇現成收納組合或創造專屬收納組合，而且你也能隨心搭配，創造更多可能
商品尺寸
240x40x230 公分', 1, 0, CAST(N'2018-05-20T15:41:18.243' AS DateTime), N'boen', 1009, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805001, N'Samsung GALAXY S8 (4G/64G) 5.8吋旗艦機', 2, NULL, 15990, 1, 1, 3, N'顛覆思維 打破框限

精湛工藝美學再劃時代。近乎無邊界的曲面設計，無邊框視覺效果帶來左右無限延伸的開闊感受；由康寧第五代大猩猩玻璃搭配航太金屬邊框所組成的機身，純淨無死角視覺設計。美麗弧形完美對稱，絕非凡品
了解更多', 3, 0, CAST(N'2018-05-20T15:52:19.727' AS DateTime), N'boen', 1010, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805002, N'Apple iPhone7 PLUS 128G 5.5吋智慧型手機', 2, NULL, 28100, 1, 1, 10, N'iPhone 7
iPhone 7 將 iPhone 體驗中最重要的環節，大幅提升。它全新推出先進的攝錄鏡頭系統，與 iPhone 歷來最出色的效能表現、最持久的電池續航力，讓人身歷其境的立體聲揚聲器，最亮麗、色彩最豐富的 iPhone 顯示器，而且還能防潑抗水1，更有足以媲美強大效能的耀眼外觀。這，就是 iPhone 7。

iPhone 7 的創新和精確，都達到了一個全新層次。不僅機身防潑抗水，「主畫面」按鈕更經過徹底重新設計。加上細緻無縫的全新 unibody 一體式機身設計，讓 iPhone 7 的質感與外表同樣耀眼。

兩種尺寸， 五款外觀。
與 iPhone 7 、 iPhone 7 Plus 攜手登場的，是兩款新色外觀：優美細緻的霧面黑色，以及深邃、光澤耀眼的曜石黑色。除了這兩款新顏色外，還備有經典的銀色、金色和玫瑰金色外觀可供選擇。4.7 吋和 5.5 吋兩種機型，都採用極其堅硬的 7000 系鋁金屬製成。', 1, 0, CAST(N'2018-05-20T15:54:16.333' AS DateTime), N'boen', 1011, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805003, N'【Apple】iPhone 8 256G 4.7吋 智慧型手機 紅色', 2, NULL, 30900, 1, 1, 10, N'A11 Bionic 晶片
1200 萬像鏡頭相機
700 萬畫素前置鏡頭', 1, 0, CAST(N'2018-05-20T15:57:01.667' AS DateTime), N'boen', 1012, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805004, N'【Apple Watch】不鏽鋼錶帶 38mm 太空黑(Apple Watch錶帶)', 2, NULL, 2632, 1, 1, 5, N'抗過敏316不鏽鋼材質
精密金屬耳扣，易於拆裝
獨特蝴蝶暗釦，卡扣穩固', 1, 0, CAST(N'2018-05-20T15:59:01.200' AS DateTime), N'boen', 1013, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805005, N'XYZprinting - 3D列印機 da Vinci 1.1Plus★Wifi無線列印! 觸控面板超輕鬆!', 1, NULL, 12990, 1, 1, 10, N'◆雙料升級款，ABS&PLA雙材質使用 
◆不可思議的平民價格 
◆最大尺寸為20x20x20cm立體範圍 
◆機體外壁包覆式設計使用安全無慮 
◆噴頭均為單色，一次印一色 
◆Wifi無線列印 
◆觸控面板輕鬆點選 
◆內建攝影鏡頭(列印進度顯示) 
◆平台校正功能 
◆上百種雲端3D圖庫可下載 
', 1, 0, CAST(N'2018-05-20T16:23:14.763' AS DateTime), N'BOB', 1014, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805006, N'PX大通 HD-8000 高畫質數位電視接收機 影音教主II', 1, NULL, 4999, 1, 1, 10, N'1080P多媒體播放 電影、照片、音樂
高畫質數位電視 HD精采影音 更勝現場
開機免掃描 電視隨開即看', 1, 0, CAST(N'2018-05-20T16:25:04.057' AS DateTime), N'BOB', 1015, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805007, N'小米行動電源 2 10000mah QC 2.0 雙向快充 安全保護', 2, NULL, 475, 1, 1, 20, N'小米行動電源2  10000mAh
電池類型：鋰聚合物電芯
電池能量：10000mAh 3.85V ( 38.5Wh )
額定容量：6900mAh 5.1V
輸入接口：Micro USB
輸出接口：USB-A
產品尺寸：130 * 71 * 14.1mm
商品內容物：行動電源、充電短線
輸入電流：5.0V2.0A    9V/12V18W
輸出電流：5.1V2.4A    9V/12V15W MAX
充電時間：約 4.2 小時 ( 18W 充電器*，標準充電線 )
　　　　　約 6.2 小時 ( 10W 充電器*，標準充電線 )
*18W 充電器是指市面上支援輸出為 DC5.0V / 2.0A 9.0V / 2.0A 12V / 1.5A 的充電器。
*10W 充電器是指市面上支援輸出為 DC5.0V / 2.0A 的充電器。', 1, 0, CAST(N'2018-05-20T16:26:17.367' AS DateTime), N'BOB', 1016, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805008, N'休足時間 清涼舒緩貼片18枚入【屈臣氏】', 5, NULL, 319, 1, 1, 20, N'', 1, 0, CAST(N'2018-05-20T16:28:25.980' AS DateTime), N'BOB', 1017, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805009, N'美國百分百【Abercrombie & Fitch】T恤 AF 短袖 麋鹿 ', 4, NULL, 1200, 3, 1, 10, N'品 牌	 	Abercrombie & Fitch	 
 	 	 	 	 
 	顏 色	 	如圖	 
 	 	 	 	 
 	尺 寸	 	肩寬*胸寬*衣長*袖長：XS號 35*44*59*18公分、S號 36*46*60*18公分。此款是美國青年版，版型較小，青年版 XL號等於正常版S號，依此類推。	 
 	 	 	 	 
 	美 國 尺 寸	 	買家若有商品問題，歡迎用問與答發問。	 
 	 	 	 	 
 	說 明	 	100%純棉穿著舒適透氣又有型。此款是美國青年版，版型較小，青年版 XL號等於正常版S號，依此類推。	 
 	 	 	 	 
 	產 品 說 明	 	我們賣場上的產品全部購買於美國加州專櫃，空運回台。買家可參考關於我內美國實況採買影片	 
 	 	 	 	 
 	運 送 時 間	 	賣場上大部份台灣都現貨，兩天之內可以收到；產品若需要美國補貨，則要5-12工作天	 
 	 	 	 	 
 	面 交 資 訊	 	面交客服資訊請參考關於我。如不確定尺寸，歡迎來台北板橋 / 高雄門市參觀試穿 （關於我內有門市地圖）', 1, 0, CAST(N'2018-05-20T16:30:29.127' AS DateTime), N'BOB', 1018, 0, N'0', 0)
INSERT [dbo].[Product] ([productSeqNo], [proName], [proCategorySeqNo], [proBrand], [proPrice], [proStatus], [proPayTypeSeqNo], [proPcs], [proDescription], [proTransSeqNo], [proAdverSeqNo], [proDate], [account], [picSeqNo], [auctionStatus], [auctionPic], [auctionSeqNo]) VALUES (201805010, N'藍色 adidas 9號半 boost', 7, NULL, 2990, 1, 3, 40, N'- Multi colour running shoes
- The mesh upper flashes a colour-shifting look over a geometric graphic, while the moulded heel counter offers a snug fit.
- Textile upper
- Textile insole
- Rubber outsole
- Cushioned Cloudfoam adds extra comfort with every step.
- A polished trainer with a fast feel.
- These shoes flash a cool 3D colour-shifting geometric effect on the mesh upper.
- Dual-density Cloudfoam gives them a comfortable feel all day.', 1, 0, CAST(N'2018-05-23T12:15:07.203' AS DateTime), N'kings86170', 1019, 0, N'0', 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductPicture] ON 

INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1, 1, N'51cFAc8QHLL._SL1024_.jpg', N'C:/resources/images/product/bob/51cFAc8QHLL._SL1024_.jpg', 1)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (2, 1, N'asuscomputer.jpg', N'C:/resources/images/product/bob/asuscomputer.jpg', 2)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (3, 1, N'710gWuPyQSL._SX679_.jpg', N'C:/resources/images/product/bob/710gWuPyQSL._SX679_.jpg', 3)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (4, 1, N'GX323MS_141785_750x750.jpg', N'C:/resources/images/product/bob/GX323MS_141785_750x750.jpg', 4)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (5, 1, N'3.jpg', N'C:/resources/images/product/micky/3.jpg', 5)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (6, 1, N'71DjqEeoijL._SX679_.jpg', N'C:/resources/images/product/micky/71DjqEeoijL._SX679_.jpg', 6)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (7, 1, N'71Zlv0VT6-L._SX679_.jpg', N'C:/resources/images/product/micky/71Zlv0VT6-L._SX679_.jpg', 7)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (8, 1, N'91E6nmXpbML._UY741_.jpg', N'C:/resources/images/product/micky/91E6nmXpbML._UY741_.jpg', 8)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (9, 1, N'0550511_PE658198_S5.JPG', N'C:/resources/images/product/micky/0550511_PE658198_S5.JPG', 8)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (10, 1, N'nesttun-chuang-kuang-bai-se__0418617_PE575682_S4.JPG', N'C:/resources/images/product/micky/nesttun-chuang-kuang-bai-se__0418617_PE575682_S4.JPG', 9)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (11, 1, N'1408456229-735379039_n.jpg', N'C:/resources/images/product/micky/1408456229-735379039_n.jpg', 10)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (12, 1, N'af-pic001.jpg', N'C:/resources/images/product/micky/af-pic001.jpg', 11)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1009, 1, N'besta-eket-dian-shi-gui-zu-he-lan-se__0493478_PE627322_S4.JPG', N'C:/resources/images/product/boen/besta-eket-dian-shi-gui-zu-he-lan-se__0493478_PE627322_S4.JPG', 201805000)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1010, 1, N'aramid-case-samsung-s8-overview-black-grey-twill_grande.jpg', N'C:/resources/images/product/boen/aramid-case-samsung-s8-overview-black-grey-twill_grande.jpg', 201805001)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1011, 1, N'iphone7-colors.jpg', N'C:/resources/images/product/boen/iphone7-colors.jpg', 201805002)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1012, 1, N'iphone8-iphone8plus-product-red-angled-back-041018-1523294255.jpg', N'C:/resources/images/product/boen/iphone8-iphone8plus-product-red-angled-back-041018-1523294255.jpg', 201805003)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1013, 1, N's-l1600.jpg', N'C:/resources/images/product/boen/s-l1600.jpg', 201805004)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1014, 1, N'201712011716110.jpg', N'C:/resources/images/product/BOB/201712011716110.jpg', 201805005)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1015, 1, N'0566D14E510EA2963FBCCF5C069215798168A9A4.jpg', N'C:/resources/images/product/BOB/0566D14E510EA2963FBCCF5C069215798168A9A4.jpg', 201805006)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1016, 1, N'24256272_B.jpg', N'C:/resources/images/product/BOB/24256272_B.jpg', 201805007)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1017, 1, N'1378718820-2670814866.jpg', N'C:/resources/images/product/BOB/1378718820-2670814866.jpg', 201805008)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1018, 1, N'p094089064751-item-7987xf3x1000x1000-m.jpg', N'C:/resources/images/product/BOB/p094089064751-item-7987xf3x1000x1000-m.jpg', 201805009)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1019, 1, N'81fyc1ScI2L._UX695_.jpg', N'C:/resources/images/product/kings86170/81fyc1ScI2L._UX695_.jpg', 201805010)
INSERT [dbo].[ProductPicture] ([picSeqNo], [proPicSerial], [proPicName], [proPicPath], [productSeqNo]) VALUES (1020, 1, N'81fyc1ScI2L._UX695_.jpg', N'C:/resources/images/product/kings86170/81fyc1ScI2L._UX695_.jpg', 201805011)
SET IDENTITY_INSERT [dbo].[ProductPicture] OFF
USE [master]
GO
ALTER DATABASE [EEITDB] SET  READ_WRITE 
GO
