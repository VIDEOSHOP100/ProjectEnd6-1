USE [EEITDB]
GO
/****** Object:  Table [dbo].[QuestionList]    Script Date: 2018/5/24 下午 04:48:11 ******/
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
	[questionListType] [int] NULL,
 CONSTRAINT [PK_QuestionList] PRIMARY KEY CLUSTERED 
(
	[questionListSeqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionList] ON 

INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (15, N'註冊會員帳號有大小寫之分嗎?', N'僅接受小寫英文字母、數字、以及「 _ 」與「 - 」符號的組合，最短4個，最長24個字元。 不可含有符號如「@」、「&」、「%」、「!」、「$」、「^」、「*」、「‘」、「<」等等， 或空格或跳位字元。         提示：若你想將字元間隔以便區分，可利用連字號，例如：kiki_ikik_123。', N'1', N'2018-05-18 15:49:45.7930000', N'mana1', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (16, N'如何註冊成為會員?', N'請選擇「加入會員」。 詳細閱讀完會員使用條款後，如果同意請按「我同意遵守以上規定」，繼續填寫會員基本資料。  若您欲透過第三方註冊，請點入選項輸入會員資料， 過程中您所填寫的會員帳號與密碼，將是日後登入使用的會員帳號與密碼。', N'1', N'2018-05-18 15:50:01.6070000', N'mana1', 2)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (17, N'888', N'222', N'1', NULL, N'8888', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (18, N'註冊會員需要支付任何費用嗎?', N'不需要支付任何費用。', N'1', N'2018-05-18 15:50:33.3730000', N'mana1', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (19, N'7474747', N'747474747', N'1', NULL, N'747474', 2)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1021, N'12121', N'fasdfdas', N'1', NULL, N'13212', 3)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1022, N'212', N'fasdfdasfdasfsa', N'1', NULL, N'32123213', 3)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1023, N'NULL1212', N'asdfdasfdasfdas', N'1', NULL, N'3123232', 3)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1024, N'1221', N'fsadfasdf', N'1', NULL, N'132132132', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1025, N'1212', N'asdfasfdas', N'1', NULL, N'132132', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1026, N'1111122121', N'dfasfdasf', N'1', NULL, N'13232132', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1027, N'122121122', N'fasfasfas', N'1', NULL, N'132132132132', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1028, N'3113123213', N'fasfasfas', N'1', NULL, N'132132', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1029, N'dfaasfsafsfss', N'asdfasfasd', N'1', NULL, N'321', 4)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1030, N'645645', N'65454', N'1', NULL, N'8', 5)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1031, N'54646', N'65456', N'1', NULL, N'8', 5)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1032, N'56464', N'fasfasfasf', N'1', NULL, N'8', 5)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1033, N'654dsdasf', N'dsfsafas', N'1', NULL, N'8', 6)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1034, N'dsafdasf', N'ewfewf', N'1', NULL, N'8', 6)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1035, N'asdfdasfas', N'sdfewfewafws', N'1', NULL, N'8', 6)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1036, N'dsfasf', N'fewfwfewf', N'1', NULL, N'8', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1037, N'asdfasdfa', N'dsads', N'1', NULL, N'NULL8', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1038, N'fdasfdasfas', N'wfewfew', N'1', NULL, N'8', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1039, N'fdasfasfas', N'cszcadfawef', N'1', NULL, N'8', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1040, N'fsdafasfas', N'ewfwqfeq', N'1', NULL, N'8', 7)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (1041, N'wewewew', N'sadfa', N'1', NULL, N'8', 7)
SET IDENTITY_INSERT [dbo].[QuestionList] OFF
