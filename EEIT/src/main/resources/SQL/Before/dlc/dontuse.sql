use EEITDB
go



---  �w����table
create table Member(
memberSeqNo integer IDENTITY (10000,1),    --�|���s��
account  varchar(20)  primary key,  --�b��
password varchar(20),				--�K�X
nickname varchar(50) NOT NULL,  --�|���ʺ�
firstname varchar(50) NOT NULL,  --�|���m�W  �m
lastname varchar(50) NOT NULL,   --�|���m�W  �W
gender varchar(10) NOT NULL,	--�ʧO
email	 varchar(30),			--email
address  varchar(50),			--�a�}
birthday datetime NOT NULL,		--�ͤ�
fileNamePath varchar(50) NOT NULL,	--�j�Y�K���|(��Ƨ�)
phone	 varchar(15),				--�p���q��
registerdate datetime,				--���U���
lastlogin datetime,					--�̫�n�J���
subscription bigint NOT NULL,		--�q�\��
ban bit,								--�|���H�W�ᵲ BOOLEAN

)



create table Manager  --�s�W�޲z���b��
(
  managerSeqNo int identity(20000,1),
  managerId varchar(500) primary key ,
  managerPwd varchar (500),
  managerName varchar (1000),
  managerStatus varchar(10),
) 
go


--Jerry��table

CREATE TABLE [dbo].[LiveStream](
 [liveStreamSeqNo] [int] IDENTITY(1,1) NOT NULL,
 [startLiveTime] [datetime] NOT NULL,
 [endLiveTime] [datetime] NOT NULL,
 [userAccount] [varchar](500) NOT NULL,
 [videoSeqNo] [int] NOT NULL,
 [liveStreamTitle] [varchar](500) NOT NULL,
 [liveStreamDescription] [varchar](max) NOT NULL,
 [liveStreamTotalViews] [int] NOT NULL,
 [liveStreamStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LiveStream] PRIMARY KEY CLUSTERED 
(
 [liveStreamSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



-- Vic ��table
CREATE TABLE [dbo].[Product](
	productSeqNo integer IDENTITY(1,1)  primary key NOT NULL,  --���~�s��
	proName varchar(30)  NOT NULL,                      --���~�W��
	proPicPath varchar(max) NOT NULL,				--���~�j�Y�Ӹ��|
	price decimal(20,2) NOT NULL,                     --���~����
	probrand varchar(30) NULL,                         --�~�P
	proSpeicNo1 varchar(max),						--���~�ԭz	1
	proSpeicNo2 varchar(max),						--���~�ԭz	2
	proPicFile varchar(max) NOT NULL,				--���~�Ϥ����|(��Ƨ�)
	prostock decimal(10,2) NULL,						--�w�s										
	prodiscount decimal(10,2) NULL,						--�馩
	proCategory varchar(100),                           --�ӫ~���O
	account  varchar(20),							    --��a�b��
	proDate datetime,                                       --�W�[�ɶ�
	prostatus varchar(1),                                --�ӫ~���A
)
GO

drop table product;

CREATE TABLE [dbo].[Product](
 [productSeqNo] [int] IDENTITY(1,1) NOT NULL,
 [proName] [varchar](30) NULL,
 [proPicPath] [varchar](max) NULL,
 [price] [decimal](20, 2) NULL,
 [brandSeqNo] [int] NULL,
 [proSpeicNo1] [varchar](max) NULL,
 [proSpeicNo2] [varchar](max) NULL,
 [picSeqNo] [int] NULL,
 [prostock] [decimal](10, 2) NULL,
 [prodiscount] [decimal](10, 2) NULL,
 [ClassName] [varchar](50) NULL,
 [account] [varchar](50) NULL,
 [proDate] [datetime] NULL,
 [prostatus] [varchar](1) NULL,
 [volume] [varchar](max) NULL,
 [weight] [decimal](10, 2) NULL,
 [transport] [varchar](max) NULL,)

CREATE TABLE [dbo].[Cart](
	cartSeqNo int iDENTITY(1,1) primary key, --�ʪ����s��
	orderNo int ,
	pro_id varchar(30) NULL,
	[orderDate] [varchar](20) NULL,
	[shoppingDate] [varchar](20) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Order](
	orderSeqNo integer iDENTITY(1,1) primary key,--�q��s��
	productSeqNo integer NOT NULL,  --���~�s��
	account  varchar(20) ,			 --�b��  �~����
	orderDate [datetime] NULL ,	     --�q����
	totalPrice decimal(20,2) NULL,	 --�`�B
	payStatus varchar(50),           --�I�ڪ��A
	logisticStatus varchar(50)       --�t�e���A
	
	)
	GO


create table OrderList (
	orderSeqNo integer, 							 --�q��s��	�~����	
	orderlistSeqNo integer iDENTITY(1,1) primary key,--�q�涵�ؽs��;
	proId varchar(max),								 --���~�W��				

	quantity integer,                                --�ƶq
	unitPrice decimal(20,2),                         --���
	discount decimal(10,1),                          --�馩
	)

	
	
	--Bob��table 

	--�v�����^��
	CREATE TABLE [dbo].[CommentVideo](
	[commentVideoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
	[commentArticle] [varchar](max) NOT NULL,
	[commentDate] [datetime] NOT NULL,
	[commentLike] [int] NOT NULL,
	[commentUnLike] [int] NOT NULL,
	[commentVideoStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CommentsVideo] PRIMARY KEY CLUSTERED 
(
	[commentVideoSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentVideoLikeUnlike]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�^�����g �άO �����w
CREATE TABLE [dbo].[CommentVideoLikeUnlike](
	[commentLikeUnlikeSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
	[commentVideoSeqNo] [int] NOT NULL,
	[commentLikeUnlikeStatus] [varchar](50) NOT NULL,
	[commentLikeUnLikeDate] [datetime] NOT NULL,
	[commentLikeUnLikeScore] [int] NOT NULL,
 CONSTRAINT [PK_CommentsVideoLikeUnlike] PRIMARY KEY CLUSTERED 
(
	[commentLikeUnlikeSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeUnlikeVideos]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�v�������w�����w
CREATE TABLE [dbo].[LikeUnlikeVideos](
	[likeUnlikeVideosSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[LiveStream]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--������ѫ�
CREATE TABLE [dbo].[Message](
	[messageSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[messageArticle] [varchar](max) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
	[receiverAccount] [varchar](500) NOT NULL,
	[messageDate] [datetime] NOT NULL,
	[messageStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[messageSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�T���u�X�q��
CREATE TABLE [dbo].[Notification](
	[notificationSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[notificationArticle] [varchar](max) NOT NULL,
	[notificationType] [varchar](50) NOT NULL,
	[notificationDate] [datetime] NOT NULL,
	[notificationStatus] [varchar](50) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Notification_1] PRIMARY KEY CLUSTERED 
(
	[notificationSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyCommentVideo]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�v���^�Яd��
CREATE TABLE [dbo].[ReplyCommentVideo](
	[replyCommentVideoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[ReplyCommentVideoLikeUnlike]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�v���U��^�Яd�����g�Τ���
CREATE TABLE [dbo].[ReplyCommentVideoLikeUnlike](
	[replyCommentVideoLikeUnlikeSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
	[replyCommentVideoVideoSeqNo] [int] NOT NULL,
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
/****** Object:  Table [dbo].[SubscriptionUploader]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�O�_�q�\�v���W�Ǫ�
CREATE TABLE [dbo].[SubscriptionUploader](
	[subscriptionUploaderSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
	[uploaderAccount] [varchar](500) NOT NULL,
	[subscriptionUploaderStatus] [varchar](50) NOT NULL,
	[subscriptionUploaderDate] [datetime] NOT NULL,
	[subscriptionUploaderScore] [int] NOT NULL,
 CONSTRAINT [PK_SubscriptionUploader_1] PRIMARY KEY CLUSTERED 
(
	[subscriptionUploaderSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserReports]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�g����(�ϧΤ��R)
CREATE TABLE [dbo].[UserReports](
	[userReportsSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Table_1UserReports] PRIMARY KEY CLUSTERED 
(
	[userReportsSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�v�����s�W
CREATE TABLE [dbo].[Video](
	[videoSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[videoTitle] [varchar](500) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
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
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[videoSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoType]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�v��������
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
/****** Object:  Table [dbo].[WatchHistory]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�[�ݬ���
CREATE TABLE [dbo].[WatchHistory](
	[watchHistorySeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[WatchLaterVideos]    Script Date: 2018/4/21 �U�� 03:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--�y���[�ݪ��v��
CREATE TABLE [dbo].[WatchLaterVideos](
	[watchLaterVideosSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[userAccount] [varchar](500) NOT NULL,
	[videoSeqNo] [int] NOT NULL,
	[watchLaterVideoDate] [datetime] NOT NULL,
	[watchLaterVideosScore] [int] NOT NULL,
	[watchLaterVideosStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_WatchLaterVideos] PRIMARY KEY CLUSTERED 
(
	[watchLaterVideosSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



	--Boen��Table

	create table MemberQues
( 
  memberQuesSeqNo  int  primary key identity(10000,1), --�|���s�� �~����
  account  varchar(20) ,  --�b��
  memTopic  varchar(1000),  --����
  memTitle varchar(1000),   --���D�D��
  memAsk   varchar(3000),       --�|�����D  
  memQuesTime datetime,         --���D�ɶ�  
  memFileName varchar(1000),   --�Ϥ��W 
  memQuespic varbinary(max),    --�Ϥ��I��       
);   
GO




create table ServiceAns(  --�s�W�޲z���^�����D�����

	memberQuesSeqNo  int ,			 --�Ȥ᪺���D�s��
	managerSeqNo int ,				 --�޲z�����s��		
	
	
	manageResponse varchar(max),	 --�޲z�����^��
	responseDay datetime,	         --�޲z���^�����ɶ�,
  )



