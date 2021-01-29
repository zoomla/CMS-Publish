CREATE TABLE [dbo].[ZL_Notifications](
[ID] [int] IDENTITY(1,1) NOT NULL,
[IsRead] [bit] NOT NULL,
[Type] [int] NOT NULL,
[Title] [nvarchar](50) NULL,
[Content] [nvarchar](800) NULL,
[CDate] [datetime] NOT NULL,
[UserID] [int] NOT NULL,
[UserName] [nvarchar](100) NULL,
CONSTRAINT [PK_ZL_Notifications] PRIMARY KEY CLUSTERED 
([ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET IDENTITY_INSERT [ZL_Notifications]ON
INSERT [ZL_Notifications]([ID],[IsRead],[Type],[Title],[Content],[CDate],[UserID],[UserName]) VALUES ( 1,1,4,'/admin/default','欢迎进入后台',N'2020/9/14 10:09:00',0,'')
INSERT [ZL_Notifications]([ID],[IsRead],[Type],[Title],[Content],[CDate],[UserID],[UserName]) VALUES ( 2,1,4,'/admin/default','ALT+i可快速进入首页',N'2020/9/14 10:09:00',0,'')
INSERT [ZL_Notifications]([ID],[IsRead],[Type],[Title],[Content],[CDate],[UserID],[UserName]) VALUES ( 3,1,4,'/admin/default','ALT+X进入超级控制台',N'2020/9/14 10:09:00',0,'')
INSERT [ZL_Notifications]([ID],[IsRead],[Type],[Title],[Content],[CDate],[UserID],[UserName]) VALUES ( 4,1,4,'/admin/default','请妥善保存后台密码，工作中途离开可按ALT+Q锁定屏幕。',N'2020/9/14 10:09:00',0,'')
SET IDENTITY_INSERT [ZL_Notifications]OFF