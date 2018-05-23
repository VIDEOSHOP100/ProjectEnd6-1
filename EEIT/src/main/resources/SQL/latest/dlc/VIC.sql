USE [EEITDB]
GO
/****** Object:  Table [dbo].[QuestionList]    Script Date: 2018/5/23 下午 07:28:13 ******/
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

INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (15, N'註冊會員帳號有大小寫之分嗎?', N'僅接受小寫英文字母、數字、以及「 _ 」與「 - 」符號的組合，最短4個，最長24個字元。 不可含有符號如「@」、「&」、「%」、「!」、「$」、「^」、「*」、「‘」、「<」等等， 或空格或跳位字元。         提示：若你想將字元間隔以便區分，可利用連字號，例如：kiki_ikik_123。', N'1', N'2018-05-18 15:49:45.7930000', N'mana1', NULL)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (16, N'如何註冊成為會員?', N'請選擇「加入會員」。 詳細閱讀完會員使用條款後，如果同意請按「我同意遵守以上規定」，繼續填寫會員基本資料。  若您欲透過第三方註冊，請點入選項輸入會員資料， 過程中您所填寫的會員帳號與密碼，將是日後登入使用的會員帳號與密碼。', N'1', N'2018-05-18 15:50:01.6070000', N'mana1', NULL)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (17, N'888', N'222', N'0', NULL, N'8888', 1)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (18, N'註冊會員需要支付任何費用嗎?', N'不需要支付任何費用。', N'1', N'2018-05-18 15:50:33.3730000', N'mana1', NULL)
INSERT [dbo].[QuestionList] ([questionListSeqNo], [questionListTitle], [questionListArticle], [questionListStatus], [questionListUploadDate], [managerId], [questionListType]) VALUES (19, N'7474747', N'747474747', NULL, NULL, N'747474', 2)
SET IDENTITY_INSERT [dbo].[QuestionList] OFF
