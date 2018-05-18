USE [EEITDB]
GO

/****** Object:  Table [dbo].[QuestionList]    Script Date: 2018/5/15 下午 06:37:23 ******/
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

