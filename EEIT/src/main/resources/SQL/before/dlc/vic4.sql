USE [EEITDB]
GO
/****** Object:  Table [dbo].[QuestionList]    Script Date: 2018/5/25 上午 10:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionList](
	[questionListSeqNo] [int] IDENTITY(1,1) NOT NULL,
	[questionListTitle] [varchar](max) NULL,
	[questionListArticle] [varchar](max) NULL,
	[questionListStatus] [varchar](1) NULL,
	[questionListUploadDate] [datetime] NULL,
	[managerId] [varchar](500) NULL,
	[questionListType] [int] NULL,
 CONSTRAINT [PK_QuestionList] PRIMARY KEY CLUSTERED 
(
	[questionListSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionList] ON 

INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1, N'sdafdafafasdf', N'dasfdsfasfsdfaf', N'1', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'dsfdasfas', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (2, N'dsafasfasdf', N'dsafsafsafaf', N'1', NULL, N'6546445', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (3, N'dsafasfsdaf', N'dsfasfsafsa', N'0', NULL, N'gfgdfsg', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (4, N'dsfdsadsafas', N'fdasfdasfasf', N'1', NULL, N'dsgdg', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (5, N'asdfasfasd', N'fdasfdasfasdf', N'1', NULL, N'dfgdgdsg', 2)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (6, N'afasdfdasfasd', N'asfassaf', N'1', NULL, N'sdgsdgsd', 2)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (7, N'safdasfsdf', N'sdafsdafdasf', N'1', NULL, N'gdsgsdg', 2)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (8, N'safdsfdsafdsaf', N'dsafasfasf', N'0', NULL, N'dsgdsgds', 3)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (9, N'dsafdsfsdafas', N'fdasfdasfasd', N'1', NULL, N'gdsgdsg', 3)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (10, N'fsdafdsafds', N'fsdfsdafafsadfewfw', N'1', NULL, N'dsgdgds', 3)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (11, N'fewfwefwf', N'wefewfewf', N'1', NULL, N'gdfsgdsg', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (12, N'wefdsafdsaf', N'xzvczxvcxzv', N'1', NULL, N'dfgdsgsdgsd', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (13, N'qwrewrqwrwqe', N'dsafsacvasvdas', N'1', NULL, N'dsfgds', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (14, N'afewqfqwfwfw', N'fewfwefwefewfw', N'0', NULL, N'gdsgdsg', 5)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (15, N'fewfewfewfwf', N'savsvvdvdsvasa', N'1', NULL, N'dsgdsgdsg', 5)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (16, N'eqfqwfqfewfwefwfwq', N'ewfewfewfwfewf', N'1', NULL, N'dsgsgs', 5)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (17, N'dsafsfsdfsdfsdfsafas', N'cvzxvxczvadvw', N'1', NULL, N'gdfgdsg', 6)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (18, N'ewfqfqwfqewfwqfqw', N'fwefwefwqe', N'1', NULL, N'dsgdsgds', 6)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (19, N'fwfwef', N'ewfwefewf', N'1', NULL, N'gdsgds', 6)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (20, N'ewfewf', N'ewfewsafds', N'0', NULL, N'gdsgdsg', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (21, N'fqf', N'ewqfewqfewq', N'1', NULL, N'dsgdsgdsg', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (22, N'fewfewf', N'ewfewfe', N'0', NULL, N'dsgdsg', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (23, N'erqwrqewr', N'qwrqwerqwr', N'1', NULL, NULL, 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (24, NULL, NULL, N'1', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QuestionList] OFF
