USE [schminder_db]
GO
/****** Object:  Table [dbo].[tblSettings]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSettings](
	[setName] [nvarchar](100) NOT NULL,
	[setValue] [nvarchar](500) NOT NULL,
	[setDescription] [nvarchar](500) NOT NULL,
	[setId] [int] NOT NULL,
 CONSTRAINT [PK_tblSettings] PRIMARY KEY CLUSTERED 
(
	[setId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwSettings]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[vwSettings]
as
SELECT
setId
, setName
, setValue
, setDescription
FROM            dbo.tblSettings
GO
/****** Object:  Table [dbo].[tblMenu]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu](
	[menu_id] [uniqueidentifier] NOT NULL,
	[menu_parent] [uniqueidentifier] NULL,
	[menu_title] [nvarchar](100) NULL,
	[menu_url] [nvarchar](100) NULL,
	[menu_status] [nvarchar](20) NULL,
	[menu_type] [nvarchar](20) NULL,
	[menu_order] [int] NULL,
 CONSTRAINT [PK_tblMenu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwMenu]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vwMenu] AS

SELECT 
  menu_id = case menu_type when 'menutype_new' then newid() else menu_id end
  ,menu_parent, menu_title, menu_url, menu_status, menu_type, menu_order
FROM            dbo.tblMenu menu
GO
/****** Object:  Table [dbo].[tblPost]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPost](
	[post_id] [uniqueidentifier] NOT NULL,
	[post_author] [uniqueidentifier] NULL,
	[post_date] [datetime] NULL,
	[post_content] [text] NULL,
	[post_title] [nvarchar](500) NULL,
	[post_excerpt] [text] NULL,
	[post_status] [nvarchar](20) NULL,
	[post_comment_status] [nvarchar](20) NULL,
	[post_name] [nvarchar](10) NULL,
	[post_type] [nvarchar](20) NULL,
	[post_page_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblPosts] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPage]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPage](
	[page_id] [uniqueidentifier] NOT NULL,
	[page_title] [nvarchar](200) NOT NULL,
	[page_status] [nvarchar](20) NOT NULL,
	[page_date] [datetime] NULL,
	[page_author_id] [uniqueidentifier] NULL,
	[page_type] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblPage] PRIMARY KEY CLUSTERED 
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPost]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwPost]
AS
SELECT        post_id, post_page_id, post_author, post_date, post_content, post_title, post_excerpt, post_status, post_comment_status, post_name, post_type,
page.page_title as post_page_title
FROM            dbo.tblPost post
join dbo.tblPage page on post.post_page_id=page.page_id
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[user_id] [uniqueidentifier] NOT NULL,
	[user_firstname] [nvarchar](100) NULL,
	[user_lastname] [nvarchar](100) NULL,
	[user_username] [nvarchar](100) NULL,
	[user_email] [nvarchar](100) NULL,
	[user_phone] [nvarchar](20) NULL,
	[user_pwd] [nvarchar](50) NULL,
	[user_isreg] [bit] NOT NULL,
	[user_dtreg] [datetime] NULL,
	[user_dtdob] [datetime] NULL,
	[user_settings] [nvarchar](500) NULL,
	[user_title] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTitle]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTitle](
	[tit_name] [nvarchar](10) NOT NULL,
	[tit_value] [nvarchar](10) NULL,
	[tit_index] [int] NOT NULL,
 CONSTRAINT [PK_tblTitle] PRIMARY KEY CLUSTERED 
(
	[tit_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwUser]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vwUser]
as
SELECT        user_id
, user_firstname
, user_lastname
, user_username
, user_email
, user_phone
, user_pwd
, user_isreg
, user_dtdob
, user_dtreg
, cast (JSON_VALUE(user_settings,'$.userRegTest') as bit) as user_regtest
, tit.tit_value as user_title
, cast (0 as bit) as user_rememberme

FROM            dbo.tblUser usr
inner join dbo.tblTitle tit on usr.user_title=tit.tit_name
GO
/****** Object:  View [dbo].[vwPage]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vwPage] AS

SELECT 
  page_id = case page_type when 'pagetype_new' then newid() else page_id end
  , page_date = case page_type when 'pagetype_new' then current_timestamp else page_date end
, page_title, page_status, page_type
, page_author_id
,usr.user_username as page_author
FROM            dbo.tblPage page
join tblUser usr on usr.user_id = page.page_author_id

GO
/****** Object:  Table [dbo].[tblProductSource]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductSource](
	[prdsId] [uniqueidentifier] NOT NULL,
	[prdsName] [nvarchar](100) NOT NULL,
	[prdsDTAdded] [datetime] NOT NULL,
	[prdsDesc] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_tblProductSource] PRIMARY KEY CLUSTERED 
(
	[prdsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductData]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductData](
	[prdId] [uniqueidentifier] NOT NULL,
	[prdEnabled] [bit] NOT NULL,
	[prdFeatured] [bit] NOT NULL,
	[prdTitle] [nvarchar](200) NOT NULL,
	[prdSource] [uniqueidentifier] NOT NULL,
	[prdUrlCompany] [nvarchar](200) NOT NULL,
	[prdUrl] [nvarchar](100) NOT NULL,
	[prdProductId] [nvarchar](10) NOT NULL,
	[prdImageUrl] [nvarchar](100) NOT NULL,
	[prdDesc] [nvarchar](max) NULL,
	[prdPriceUK] [float] NOT NULL,
	[prdPriceEuro] [float] NULL,
	[prdSpecialOfferId] [uniqueidentifier] NOT NULL,
	[prdCTA] [nvarchar](50) NOT NULL,
	[prdIsLive] [bit] NOT NULL,
	[prdCategory] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tblProductData] PRIMARY KEY CLUSTERED 
(
	[prdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductCat]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductCat](
	[prdcId] [uniqueidentifier] NOT NULL,
	[prdcName] [nvarchar](100) NOT NULL,
	[prdcDTAdded] [datetime] NOT NULL,
	[prdcDesc] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_tblProductCat] PRIMARY KEY CLUSTERED 
(
	[prdcId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwProductData]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vwProductData] as
SELECT [prdId]
      ,[prdEnabled]
      ,[prdFeatured]
	  ,[prdIsLive]
      ,[prdTitle]
      ,[prdSource]
      ,[prdCategory]
      ,[prdUrlCompany]
      ,[prdUrl]
      ,[prdProductId]
      ,[prdImageUrl]
      ,[prdDesc]
      ,[prdPriceUK]
      ,[prdPriceEuro]
      ,[prdSpecialOfferId]
      ,[prdCTA]
	  , prds.prdsName
	  , prds.prdsDesc
	  , prds.prdsDTAdded
	  , prdc.prdcName
	  , prdc.prdcDesc
	  , prdc.prdcDTAdded
  FROM [dbo].[tblProductData] prd
  inner join tblProductSource prds on prd.prdSource=prds.prdsId
  inner join tblProductCat prdc on prd.prdCategory=prdc.prdcId
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[cust_id] [uniqueidentifier] NOT NULL,
	[cust_firstname] [nvarchar](100) NULL,
	[cust_lastname] [nvarchar](100) NULL,
	[cust_email] [nvarchar](50) NULL,
	[cust_mobile] [nvarchar](20) NULL,
	[cust_pwd] [nvarchar](100) NULL,
	[cust_signup_dt] [datetime] NOT NULL,
	[cust_browserdetails] [nvarchar](300) NOT NULL,
	[cust_flags] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwCustomer]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vwCustomer] AS
SELECT [cust_id]
      ,isnull([cust_firstname],'') cust_firstname
      ,isnull([cust_lastname],'') cust_lastname
      ,isnull([cust_email],'') cust_email
      ,isnull([cust_mobile],'') cust_mobile
      ,isnull([cust_pwd],'') cust_pwd
      ,[cust_signup_dt]
	  ,isnull([cust_browserdetails],'') cust_browserdetails 
      ,cast (json_value([cust_flags], '$.cust_avon') as bit) cust_avon
	  ,cast (json_value([cust_flags], '$.cust_vivamk') as bit) cust_vivamk
	  ,cast (json_value([cust_flags], '$.cust_offers') as bit) cust_offers
	  
  FROM [dbo].[tblCustomer]
GO
/****** Object:  Table [dbo].[tblBlogStatus]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlogStatus](
	[blgs_id] [nvarchar](20) NOT NULL,
	[blgs_name] [nvarchar](100) NOT NULL,
	[blgs_order] [int] NOT NULL,
 CONSTRAINT [PK_tblBlogStatus] PRIMARY KEY CLUSTERED 
(
	[blgs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlogOrder]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlogOrder](
	[blgo_id] [int] IDENTITY(1,1) NOT NULL,
	[blgo_uid] [uniqueidentifier] NOT NULL,
	[blgo_index] [int] NOT NULL,
 CONSTRAINT [PK_tblBlogOrder] PRIMARY KEY CLUSTERED 
(
	[blgo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[blgo_uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[blog_id] [uniqueidentifier] NOT NULL,
	[blog_author] [uniqueidentifier] NOT NULL,
	[blog_dt_created] [datetime] NOT NULL,
	[blog_dt_modified] [datetime] NOT NULL,
	[blog_content] [nvarchar](max) NULL,
	[blog_title] [nvarchar](500) NOT NULL,
	[blog_url] [nvarchar](100) NOT NULL,
	[blog_status] [nvarchar](20) NULL,
	[blog_dt_display] [datetime] NOT NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwBlog]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE View [dbo].[vwBlog]
as
SELECT [blog_id]
      ,[blog_author]
      ,[blog_dt_created]
      ,[blog_dt_modified]
	  ,[blog_dt_display]
      ,[blog_content]
      ,[blog_title]
      ,[blog_status]
	  ,[blog_url]
	  ,[blgs_name]
	  ,case when blgo.[blgo_index] is null then 999999 else blgo.[blgo_index] end [blgo_index]
  FROM [dbo].[tblBlog] blog
  inner join [dbo].[tblBlogStatus] blgs on blog.blog_status=blgs.blgs_id
  left outer join [dbo].[tblBlogOrder] blgo on blog.blog_id = blgo.blgo_uid 
GO
/****** Object:  Table [dbo].[tblContact]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContact](
	[ctactId] [int] IDENTITY(1,1) NOT NULL,
	[ctactName] [nvarchar](100) NOT NULL,
	[ctactPhone] [nvarchar](30) NOT NULL,
	[ctactEmail] [nvarchar](100) NOT NULL,
	[ctactSubject] [nvarchar](200) NOT NULL,
	[ctactMessage] [text] NOT NULL,
	[ctactDTMessage] [datetime] NULL,
 CONSTRAINT [PK_tblContact] PRIMARY KEY CLUSTERED 
(
	[ctactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPageContent]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPageContent](
	[pc_id] [int] IDENTITY(1,1) NOT NULL,
	[pc_name] [nvarchar](100) NOT NULL,
	[pc_value] [nvarchar](max) NOT NULL,
	[pc_pdpd_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tblPageContent] PRIMARY KEY CLUSTERED 
(
	[pc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPageData]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPageData](
	[pd_id] [uniqueidentifier] NOT NULL,
	[pd_page] [nvarchar](100) NOT NULL,
	[pd_controller] [nvarchar](100) NOT NULL,
	[pd_action] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblPageData] PRIMARY KEY CLUSTERED 
(
	[pd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[role_id] [nvarchar](20) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[role_index] [int] NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRole]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRole](
	[usrrol_userid] [uniqueidentifier] NOT NULL,
	[usrrol_roleid] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPage] ADD  DEFAULT ('pagetype_normal') FOR [page_type]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_tblBlogStatus] FOREIGN KEY([blog_status])
REFERENCES [dbo].[tblBlogStatus] ([blgs_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_tblBlogStatus]
GO
ALTER TABLE [dbo].[tblPageContent]  WITH CHECK ADD  CONSTRAINT [FK_tblPageContent_tblPageData] FOREIGN KEY([pc_pdpd_id])
REFERENCES [dbo].[tblPageData] ([pd_id])
GO
ALTER TABLE [dbo].[tblPageContent] CHECK CONSTRAINT [FK_tblPageContent_tblPageData]
GO
ALTER TABLE [dbo].[tblPageData]  WITH CHECK ADD  CONSTRAINT [FK_tblPageData_tblPageData] FOREIGN KEY([pd_id])
REFERENCES [dbo].[tblPageData] ([pd_id])
GO
ALTER TABLE [dbo].[tblPageData] CHECK CONSTRAINT [FK_tblPageData_tblPageData]
GO
ALTER TABLE [dbo].[tblProductData]  WITH CHECK ADD  CONSTRAINT [FK_tblProductData_tblProductCat] FOREIGN KEY([prdCategory])
REFERENCES [dbo].[tblProductCat] ([prdcId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProductData] CHECK CONSTRAINT [FK_tblProductData_tblProductCat]
GO
ALTER TABLE [dbo].[tblProductData]  WITH CHECK ADD  CONSTRAINT [FK_tblProductData_tblProductSource] FOREIGN KEY([prdSource])
REFERENCES [dbo].[tblProductSource] ([prdsId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProductData] CHECK CONSTRAINT [FK_tblProductData_tblProductSource]
GO
ALTER TABLE [dbo].[tblTitle]  WITH CHECK ADD  CONSTRAINT [FK_tblTitle_tblTitle] FOREIGN KEY([tit_name])
REFERENCES [dbo].[tblTitle] ([tit_name])
GO
ALTER TABLE [dbo].[tblTitle] CHECK CONSTRAINT [FK_tblTitle_tblTitle]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblTitle] FOREIGN KEY([user_title])
REFERENCES [dbo].[tblTitle] ([tit_name])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblTitle]
GO
ALTER TABLE [dbo].[tblUserRole]  WITH CHECK ADD  CONSTRAINT [FK_tblUserRole_tblRole] FOREIGN KEY([usrrol_roleid])
REFERENCES [dbo].[tblRole] ([role_id])
GO
ALTER TABLE [dbo].[tblUserRole] CHECK CONSTRAINT [FK_tblUserRole_tblRole]
GO
ALTER TABLE [dbo].[tblUserRole]  WITH CHECK ADD  CONSTRAINT [FK_tblUserRole_tblUser] FOREIGN KEY([usrrol_userid])
REFERENCES [dbo].[tblUser] ([user_id])
GO
ALTER TABLE [dbo].[tblUserRole] CHECK CONSTRAINT [FK_tblUserRole_tblUser]
GO
/****** Object:  StoredProcedure [dbo].[spBlogList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spBlogList]
	@is_local bit
	, @is_all bit
as
begin
	select * from vwBlog
	where ((blog_status = 'blgs_live' or blog_status='blgs_local' and @is_local=1) or 1=@is_all)
	order by blgo_index, blog_dt_display
end
GO
/****** Object:  StoredProcedure [dbo].[spBlogReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spBlogReadById]
	@blog_id uniqueidentifier
as
begin
	select * from vwBlog where blog_id=@blog_id
end
GO
/****** Object:  StoredProcedure [dbo].[spBlogReadByUrl]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spBlogReadByUrl]
	@blog_url nvarchar(100)
as
begin
	select * from vwBlog where blog_url=@blog_url
end
GO
/****** Object:  StoredProcedure [dbo].[spBlogStatusList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spBlogStatusList]
as
begin
select * from tblBlogStatus order by blgs_order
end
GO
/****** Object:  StoredProcedure [dbo].[spBlogUpdate]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spBlogUpdate]
			@blog_id uniqueidentifier
           ,@blog_author uniqueidentifier
           ,@blog_dt_created datetime
           ,@blog_dt_modified datetime
		   ,@blog_dt_display datetime
           ,@blog_content nvarchar(max)
           ,@blog_title nvarchar(500)
		   ,@blog_url nvarchar(100)
           ,@blog_status nvarchar(20)
		   ,@blgo_index int
as 
begin
if @blog_id = N'00000000-0000-0000-0000-000000000000'
 set @blog_id = NEWID()
 if exists (select * from tblBlog where blog_id=@blog_id)
 UPDATE [dbo].[tblBlog]
   SET [blog_id] = @blog_id
      ,[blog_author] = @blog_author
      ,[blog_dt_created] = @blog_dt_created
      ,[blog_dt_modified] = @blog_dt_modified
	  ,[blog_dt_display] = @blog_dt_display
      ,[blog_content] = @blog_content
      ,[blog_title] = @blog_title
      ,[blog_status] = @blog_status
	  ,[blog_url] = @blog_url
 WHERE blog_id=@blog_id
 else
INSERT INTO [dbo].[tblBlog]
           ([blog_id]
           ,[blog_author]
           ,[blog_dt_created]
           ,[blog_dt_modified]
		   ,[blog_dt_display]
           ,[blog_content]
           ,[blog_title]
           ,[blog_status]
		   ,[blog_url]
		   )
     VALUES
           (@blog_id
           ,@blog_author
           ,@blog_dt_created
           ,@blog_dt_modified
		   ,@blog_dt_display
           ,@blog_content
           ,@blog_title
           ,@blog_status
		   ,@blog_url
		   )

	if not exists(select * from tblBlogOrder where blgo_uid=@blog_id)
	 insert into tblBlogOrder (blgo_uid, blgo_index) values (@blog_id, @blgo_index)
	else if (@blgo_index != (select blgo_id from tblBlogOrder where blgo_uid=@blog_id))
	 update tblBlogOrder set blgo_index = @blgo_index where blgo_uid=@blog_id

	select * from vwBlog where blog_id=@blog_id
end
GO
/****** Object:  StoredProcedure [dbo].[spContactUpdate]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spContactUpdate]
			@ctactId int
           ,@ctactName nvarchar(100)
           ,@ctactPhone nvarchar(30)
           ,@ctactEmail nvarchar(100)
           ,@ctactSubject nvarchar(200)
           ,@ctactMessage text
		   ,@ctactDTMessage datetime
as
begin
INSERT INTO [dbo].[tblContact]
           (
           [ctactName]
           ,[ctactPhone]
           ,[ctactEmail]
           ,[ctactSubject]
           ,[ctactMessage]
		   ,[ctactDTMessage]
		   )
     VALUES
           (
		   --@ctactId, int,>
           @ctactName
           ,@ctactPhone
           ,@ctactEmail
           ,@ctactSubject
           ,@ctactMessage
		   ,@ctactDTMessage
		   )
select top 1 * from tblContact
order by ctactId desc
end
GO
/****** Object:  StoredProcedure [dbo].[spCustomerListByEmail]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spCustomerListByEmail]
 @cust_email nvarchar(100)
as
SELECT *
  FROM [dbo].[vwCustomer]
  where isnull(@cust_email,'')<>'' and @cust_email=cust_email
GO
/****** Object:  StoredProcedure [dbo].[spCustomerListByEmailOrMobile]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spCustomerListByEmailOrMobile]
 @cust_email nvarchar(100)
 ,@cust_mobile nvarchar(100)
as
SELECT *
  FROM [dbo].[vwCustomer]
  where (isnull(@cust_email,'')<>'' and @cust_email=cust_email)
  or (isnull(@cust_mobile,'')<>'' and @cust_mobile=cust_mobile)
GO
/****** Object:  StoredProcedure [dbo].[spCustomerListByMobile]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spCustomerListByMobile]
 @cust_mobile nvarchar(100)
as
SELECT *
  FROM [dbo].[vwCustomer]
  where isnull(@cust_mobile,'')<>'' and @cust_mobile=cust_mobile
GO
/****** Object:  StoredProcedure [dbo].[spCustomerNextId]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spCustomerNextId]
as
declare @cust_id uniqueidentifier
select @cust_id = newid()
while exists (select * from tblCustomer where cust_id=@cust_id)
begin
select @cust_id = newid()
end
select @cust_id
GO
/****** Object:  StoredProcedure [dbo].[spCustomerReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spCustomerReadById]
	@cust_id uniqueidentifier
as
begin
 select * from vwCustomer where cust_id=@cust_id
end
GO
/****** Object:  StoredProcedure [dbo].[spCustomerUpdate]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spCustomerUpdate]
			@cust_id uniqueidentifier
           ,@cust_firstname nvarchar(100)
           ,@cust_lastname nvarchar(100)
           ,@cust_email nvarchar(50)
           ,@cust_mobile nvarchar(20)
           ,@cust_pwd nvarchar(100)
           ,@cust_signup_dt datetime
		   ,@cust_browserdetails nvarchar(300)
		   ,@cust_avon bit
		   ,@cust_vivamk bit
		   ,@cust_offers bit

as
begin
declare @cust_flags nvarchar(100)
set @cust_flags = N'{"cust_avon":false, "cust_vivamk":false, "cust_offers":false}'

set @cust_flags = JSON_MODIFY(@cust_flags, '$.cust_avon',@cust_avon)
set @cust_flags = JSON_MODIFY(@cust_flags, '$.cust_vivamk',@cust_vivamk)
set @cust_flags = JSON_MODIFY(@cust_flags, '$.cust_offers',@cust_offers)
if not exists (select * from vwCustomer where cust_id=@cust_id) 
INSERT INTO [dbo].[tblCustomer]
           ([cust_id]
           ,[cust_firstname]
           ,[cust_lastname]
           ,[cust_email]
           ,[cust_mobile]
           ,[cust_pwd]
           ,[cust_signup_dt]
		   ,[cust_browserdetails]
		   ,[cust_flags]
		   )
     VALUES
           (@cust_id
           ,@cust_firstname
           ,@cust_lastname
           ,@cust_email
           ,@cust_mobile
           ,@cust_pwd
           ,@cust_signup_dt
		   ,@cust_browserdetails
		   ,@cust_flags
		   )
else
UPDATE [dbo].[tblCustomer]
   SET [cust_id] = @cust_id
      ,[cust_firstname] = @cust_firstname
      ,[cust_lastname] = @cust_lastname
      ,[cust_email] = @cust_email
      ,[cust_mobile] = @cust_mobile
      ,[cust_pwd] = @cust_pwd
      ,[cust_signup_dt] = @cust_signup_dt
	  ,[cust_browserdetails] = @cust_browserdetails
      ,[cust_flags] = @cust_flags
 WHERE cust_id=@cust_id

 select * from vwCustomer where cust_id=@cust_id
end
GO
/****** Object:  StoredProcedure [dbo].[spMenuReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spMenuReadById]
	@menu_id uniqueidentifier
	As
	begin
	if @menu_id is null
	select *
from vwmenu
   WHERE menu_type like  '%new%'
else
select *
from vwMenu
   WHERE menu_id = @menu_Id
   end
GO
/****** Object:  StoredProcedure [dbo].[spMenuReadList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Read menu list 
-- =============================================
CREATE PROCEDURE [dbo].[spMenuReadList]
	As
	begin

select * from vwMenu
	where menu_type not like '%new%' 
   order by menu_title asc
 end
GO
/****** Object:  StoredProcedure [dbo].[spMenuUpdateById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Menu create / update by id
-- =============================================
CREATE PROCEDURE [dbo].[spMenuUpdateById]
	@menu_id uniqueidentifier NULL,
	@menu_parent uniqueidentifier NULL,
	@menu_title nvarchar(100) NULL,
	@menu_url nvarchar(100) NULL,
	@menu_status nvarchar(20) NULL,
	@menu_type nvarchar(20) NULL,
	@menu_order int NULL

	As
	begin
	
if  @menu_id = null
set @menu_id=NEWID()

if not exists (select * from tblMenu where menu_id=@menu_id)

INSERT INTO [dbo].[tblMenu]
           (
	[menu_id] 
	,[menu_parent]
	,[menu_title]
	,[menu_url]
	,[menu_status]
	,[menu_type]
	,[menu_order]
			)
     VALUES
           (
		   	@menu_id
	,@menu_parent
	,@menu_title
	,@menu_url
	,@menu_status
	,@menu_type
	,@menu_order
			)
else

UPDATE [dbo].[tblMenu]
   SET
	[menu_id] = @menu_id
	,[menu_parent] = @menu_parent
	,[menu_title] = @menu_title
	,[menu_url] = @menu_url
	,[menu_status] = @menu_status
	,[menu_type] = @menu_type
	,[menu_order] = @menu_order
	WHERE menu_id = @menu_id
 
select * from vwMenu
   WHERE menu_id = @menu_id
   
   end
GO
/****** Object:  StoredProcedure [dbo].[spPageContentList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spPageContentList]
	@pd_id uniqueidentifier
as
begin
SELECT [pc_id]
	  ,[pc_name]
      ,[pc_value]
      ,[pc_pdpd_id]
	  --, pd.[pd_id] --AS pd_id
      ,pd.[pd_page] --AS pd_page
  FROM [dbo].[tblPageContent] pc
  left join tblPageData pd on pc.pc_pdpd_id=pd.pd_id
  where pc_pdpd_id = @pd_id or pc_pdpd_id='00000000-0000-0000-0000-000000000000'
end
GO
/****** Object:  StoredProcedure [dbo].[spPageContentListAll]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spPageContentListAll]
as
begin
SELECT [pc_id]
	  ,[pc_name]
      ,[pc_value]
      ,[pc_pdpd_id]
	  --, pd.[pd_id] --AS pd_id
      ,pd.[pd_page] --AS pd_page
  FROM [dbo].[tblPageContent] pc
  left join tblPageData pd on pc.pc_pdpd_id=pd.pd_id
  order by pc.pc_id asc
end
GO
/****** Object:  StoredProcedure [dbo].[spPageContentListByControllerAction]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spPageContentListByControllerAction]
	@pd_controller nvarchar(100)
	, @pd_action nvarchar(100)
as
begin
SELECT [pc_id]
      ,[pc_name]
      ,[pc_value]
	  ,[pc_pdpd_id]
	  --, pd.[pd_id] --AS pd_id
      ,pd.[pd_page] --AS pd_page
	  ,pd.pd_controller
	  ,pd.pd_action
  FROM [dbo].[tblPageContent] pc
  left join tblPageData pd on pc.pc_pdpd_id=pd.pd_id
  where
		(
		(pd.pd_controller = @pd_controller or @pd_controller='*')
		and 
		(pd.pd_action = @pd_action or @pd_action='*')
		)
	   or pd.pd_id='00000000-0000-0000-0000-000000000000'
end
GO
/****** Object:  StoredProcedure [dbo].[spPageContentListByName]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spPageContentListByName]
	@pc_pd_name nvarchar(100)
as
begin
SELECT [pc_id]
      ,[pc_name]
      ,[pc_value]
	  ,[pc_pdpd_id]
  FROM [dbo].[tblPageContent] pc
  left join tblPageData pd on pc.pc_pdpd_id=pd.pd_id
end


GO
/****** Object:  StoredProcedure [dbo].[spPageContentListByPage]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spPageContentListByPage]
	@pd_page nvarchar(100)
as
begin
SELECT [pc_id]
      ,[pc_name]
      ,[pc_value]
	  ,[pc_pdpd_id]
	  --, pd.[pd_id] --AS pd_id
      ,pd.[pd_page] --AS pd_page
  FROM [dbo].[tblPageContent] pc
  left join tblPageData pd on pc.pc_pdpd_id=pd.pd_id
  where pd.pd_page = @pd_page or pd.pd_id='00000000-0000-0000-0000-000000000000'
end
GO
/****** Object:  StoredProcedure [dbo].[spPageContentReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spPageContentReadById]
	@pc_id int
as
begin
SELECT [pc_id]
      ,[pc_name]
      ,[pc_value]
	  ,[pc_pdpd_id]
	  --, pd.[pd_id] --AS pd_id
      ,pd.[pd_page] --AS pd_page
  FROM [dbo].[tblPageContent] pc
  left join tblPageData pd on pc.pc_pdpd_id=pd.pd_id
  where pc_id=@pc_id
end
GO
/****** Object:  StoredProcedure [dbo].[spPageContentUpdate]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spPageContentUpdate]
	@pc_id int
	, @pc_name nvarchar(100)
	, @pc_value nvarchar(max)
	, @pc_pdpd_id uniqueidentifier

as
begin
if not exists (select * from tblPageContent where pc_id=@pc_id)
begin
INSERT INTO [dbo].[tblPageContent]
           ([pc_name]
           ,[pc_value]
           ,[pc_pdpd_id])
     VALUES
           (
		    @pc_name
           , @pc_value
           , @pc_pdpd_id
		   )
set @pc_id= (select top 1 pc_id from tblPageContent order by pc_id desc)
end
else
UPDATE [dbo].[tblPageContent]
   SET [pc_name] = @pc_name
      ,[pc_value] = @pc_value
 WHERE pc_id=@pc_id

SELECT [pc_id]
      ,[pc_name]
      ,[pc_value]
	  ,[pc_pdpd_id]
	  --, pd.[pd_id] --AS pd_id
      ,pd.[pd_page] --AS pd_page
  FROM [dbo].[tblPageContent] pc
  left join tblPageData pd on pc.pc_pdpd_id=pd.pd_id
  WHERE pc_id=@pc_id
end
GO
/****** Object:  StoredProcedure [dbo].[spPageDataList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spPageDataList]
as
begin
SELECT [pd_id]
      ,[pd_page]
  FROM [dbo].[tblPageData]
end
GO
/****** Object:  StoredProcedure [dbo].[spPageDataRead]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spPageDataRead]
	@pd_id uniqueidentifier
as
begin
SELECT [pd_id]
      ,[pd_page]
  FROM [dbo].[tblPageData]
  where pd_id=@pd_id
end
GO
/****** Object:  StoredProcedure [dbo].[spPageDataReadByControllerAction]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spPageDataReadByControllerAction]
	@pd_controller nvarchar(100)
	, @pd_action nvarchar(100)
as
begin
SELECT top 1 *
  FROM [dbo].[tblPageData]
  where (pd_controller=@pd_controller) and
  (pd_action=@pd_action)

end
GO
/****** Object:  StoredProcedure [dbo].[spPageDataUpdate]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spPageDataUpdate]
	@pd_id uniqueidentifier
	, @pd_page nvarchar(100)

as
begin
if not exists (select * from tblPageData where pd_id=@pd_id)

INSERT INTO [dbo].[tblPageData]
           ([pd_id]
           ,[pd_page])
     VALUES
           (@pd_id
           ,@pd_page)

else
UPDATE [dbo].[tblPageData]
   SET [pd_id] = @pd_id
      ,[pd_page] = @pd_page
 WHERE pd_id = @pd_id

select * from tblPageData where pd_id=@pd_id

end
GO
/****** Object:  StoredProcedure [dbo].[spPageReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spPageReadById]
	@page_Id uniqueidentifier
	As
	begin
	if @page_Id is null
	select *
from vwPage
   WHERE page_type like  '%new%'
else
select *
from vwPage
   WHERE page_Id = @page_Id
   end
GO
/****** Object:  StoredProcedure [dbo].[spPageReadHome]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 08/08/2023
-- Description:	Read home page
-- =============================================
Create PROCEDURE [dbo].[spPageReadHome]
	As
	begin

select * from vwPage
   WHERE page_title = 'home'
 end
GO
/****** Object:  StoredProcedure [dbo].[spPageReadList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Read page list 
-- =============================================
CREATE PROCEDURE [dbo].[spPageReadList]
	As
	begin


select * from vwPage
	where page_type not like '%new%' 
   order by page_date desc
 end
GO
/****** Object:  StoredProcedure [dbo].[spPageUpdateById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Post create / update by id
-- =============================================
CREATE PROCEDURE [dbo].[spPageUpdateById]
	@page_id uniqueidentifier
	,@page_author_id uniqueidentifier
	,@page_date datetime 
	,@page_title nvarchar(200)
	,@page_status nvarchar(20)
	As
	begin
	
if  @page_id = CAST(CAST(0 AS BINARY) AS UNIQUEIDENTIFIER)
set @page_id=NEWID()

if not exists (select * from tblPage where page_id=@page_id)

INSERT INTO [dbo].[tblPage]
           ([page_id]
           ,[page_author_id]
           ,[page_date]
		   ,[page_title]
           ,[page_status]
			)
     VALUES
           (@page_id
           ,@page_author_id
           ,@page_date
		   ,@page_title
		   ,@page_status
			)
else

UPDATE [dbo].[tblPage]
   SET [page_id] = @page_id
	  ,[page_author_id] = @page_author_id
      ,[page_date] = @page_date
	  ,[page_title] = @page_title
      ,[page_status] = @page_status
 WHERE page_id = @page_id
 
 
select * from vwPage
   WHERE page_id = @page_id
   
   end
GO
/****** Object:  StoredProcedure [dbo].[spPostReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Read post by id
-- =============================================
CREATE PROCEDURE [dbo].[spPostReadById]
	@postId uniqueidentifier

	As
	begin
	if @postId != '00000000-0000-0000-0000-000000000000'
select * from vwPost
   WHERE post_Id = @postId
   else
   begin
SELECT        post_id = newid(),
post_date = CURRENT_TIMESTAMP,
post_page_id, post_author, post_content, post_title, post_excerpt, post_status, post_comment_status, post_name, post_type,
page.page_title as post_page_title
FROM            dbo.tblPost post
join dbo.tblPage page on post.post_page_id=page.page_id
   WHERE post_Id = @postId
   end
 end
GO
/****** Object:  StoredProcedure [dbo].[spPostReadByType]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Read post by type
-- =============================================
CREATE PROCEDURE [dbo].[spPostReadByType]
	@post_type nvarchar(20)

	As
	begin

select * from vwPost
   WHERE post_type = @post_type

 end
GO
/****** Object:  StoredProcedure [dbo].[spPostReadInitial]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Read initial post
-- =============================================
Create PROCEDURE [dbo].[spPostReadInitial]

	As
	begin

select * from vwPost
   WHERE post_type like '%initial%'
   
   end
GO
/****** Object:  StoredProcedure [dbo].[spPostReadListByPageId]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Read post list by page id
-- =============================================
CREATE PROCEDURE [dbo].[spPostReadListByPageId]
	@post_page_id uniqueidentifier
	,@post_type nvarchar(20)
	As
	begin

	if @post_type='all'
select * from vwPost
   WHERE post_page_id = @post_page_id
      and post_id != '00000000-0000-0000-0000-000000000000'
   order by post_date desc
	else
select * from vwPost
   WHERE post_page_id = @post_page_id
   and post_id != '00000000-0000-0000-0000-000000000000'
   and post_type = 'posttype_post'
   and post_status = 'poststatus_public'
   order by post_date desc
 end
GO
/****** Object:  StoredProcedure [dbo].[spPostUpdateById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 24/06/2023
-- Description:	Post create / update by id
-- =============================================
CREATE PROCEDURE [dbo].[spPostUpdateById]
	@post_id uniqueidentifier
	,@post_page_id uniqueidentifier
	,@post_author uniqueidentifier
	,@post_date datetime 
	,@post_content text
	,@post_title nvarchar(500)
	,@post_excerpt text
	,@post_status nvarchar(20)
	,@post_comment_status nvarchar(20)
	,@post_name nvarchar(10)
	,@post_type nvarchar(20)
	As
	begin
	
if  @post_id = CAST(CAST(0 AS BINARY) AS UNIQUEIDENTIFIER)
set @post_id=NEWID()

if not exists (select * from tblPost where post_id=@post_id)

INSERT INTO [dbo].[tblPost]
           ([post_id]
		   ,[post_page_id]
           ,[post_author]
           ,[post_date]
           ,[post_content]
           ,[post_title]
           ,[post_excerpt]
           ,[post_status]
           ,[post_comment_status]
           ,[post_name]
           ,[post_type])
     VALUES
           (@post_id
		   ,@post_page_id
           ,@post_author
           ,@post_date
           ,@post_content
           ,@post_title
           ,@post_excerpt
		   ,@post_status
           ,@post_comment_status
		   ,@post_name
           ,@post_type)
else

UPDATE [dbo].[tblPost]
   SET [post_id] = @post_id
   ,[post_page_id] = @post_page_id
   ,[post_author] = @post_author
      ,[post_date] = @post_date
      ,[post_content] = @post_content
      ,[post_title] = @post_title
      ,[post_excerpt] = @post_excerpt
      ,[post_status] = @post_status
      ,[post_comment_status] = @post_comment_status
      ,[post_name] = @post_name
      ,[post_type] = @post_type
 WHERE post_id = @post_id
 
 
select * from vwPost
   WHERE post_id = @post_id
   
   end
GO
/****** Object:  StoredProcedure [dbo].[spProductCatList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spProductCatList]

as
begin
SELECT *
  FROM [dbo].[tblProductCat]
  end

GO
/****** Object:  StoredProcedure [dbo].[spProductDataInsert]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spProductDataInsert]
           @prdId uniqueidentifier
           ,@prdEnabled bit
           , @prdFeatured bit
		   , @prdIsLive bit
           , @prdTitle nvarchar(200)
           , @prdSource nvarchar(50)
           ,@prdCategory nvarchar(50)
           ,@prdUrlCompany nvarchar(200)
           ,@prdUrl nvarchar(100)
           ,@prdProductId nvarchar(10)
           ,@prdImageUrl nvarchar(100)
           ,@prdDesc text
           ,@prdPriceUK float
           ,@prdPriceEuro float
           ,@prdSpecialOfferId uniqueidentifier
           ,@prdCTA nvarchar(50)
as
begin
if not exists (select * from tblProductData where prdId=@prdId)
INSERT INTO [dbo].[tblProductData]
           ([prdId]
           ,[prdEnabled]
           ,[prdFeatured]
		   ,[prdIsLive]
           ,[prdTitle]
           ,[prdSource]
           ,[prdCategory]
           ,[prdUrlCompany]
           ,[prdUrl]
           ,[prdProductId]
           ,[prdImageUrl]
           ,[prdDesc]
           ,[prdPriceUK]
           ,[prdPriceEuro]
           ,[prdSpecialOfferId]
           ,[prdCTA])
     VALUES
           (
           @prdId
           ,@prdEnabled
           , @prdFeatured
		   , @prdIsLive
           , @prdTitle
           , @prdSource
           ,@prdCategory
           ,@prdUrlCompany
           ,@prdUrl
           ,@prdProductId
           ,@prdImageUrl
           ,@prdDesc
           ,@prdPriceUK
           ,@prdPriceEuro
           ,@prdSpecialOfferId
           ,@prdCTA
		   )

select  * from vwProductData where prdId=@prdId

end
GO
/****** Object:  StoredProcedure [dbo].[spProductDataList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spProductDataList]
	@IsLive bit
as
begin
SELECT *
  FROM [dbo].[vwProductData] prd
  where prd.prdEnabled=1
  and prd.prdIsLive = 1
  or @IsLive = 0
 end

GO
/****** Object:  StoredProcedure [dbo].[spProductDataListAll]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spProductDataListAll]

as
begin
SELECT *
  FROM [dbo].[vwProductData] prd
  where prd.prdEnabled=1
  end

GO
/****** Object:  StoredProcedure [dbo].[spProductDataReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spProductDataReadById]
	@prdId uniqueidentifier
as
begin
SELECT *
  FROM [dbo].[vwProductData]
  where prdId=@prdId
  end

GO
/****** Object:  StoredProcedure [dbo].[spProductDataReadByUrl]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spProductDataReadByUrl]
	@prdUrl nvarchar(100)
as
begin
SELECT *
  FROM [dbo].[vwProductData]
  where prdUrl=@prdUrl
  end

GO
/****** Object:  StoredProcedure [dbo].[spProductDataUpdate]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[spProductDataUpdate]
           @prdId uniqueidentifier
           ,@prdEnabled bit
           , @prdFeatured bit
		   , @prdIsLive bit
           , @prdTitle nvarchar(200)
           , @prdSource uniqueidentifier
           ,@prdCategory uniqueidentifier
           ,@prdUrlCompany nvarchar(200)
           ,@prdUrl nvarchar(100)
           ,@prdProductId nvarchar(10)
           ,@prdImageUrl nvarchar(100)
           ,@prdDesc nvarchar(max)
           ,@prdPriceUK float
           ,@prdPriceEuro float
           ,@prdSpecialOfferId uniqueidentifier
           ,@prdCTA nvarchar(50)
as
begin
if not exists (select * from tblProductData where prdId=@prdId)
INSERT INTO [dbo].[tblProductData]
           ([prdId]
           ,[prdEnabled]
           ,[prdFeatured]
		   ,[prdIsLive]
           ,[prdTitle]
           ,[prdSource]
           ,[prdCategory]
           ,[prdUrlCompany]
           ,[prdUrl]
           ,[prdProductId]
           ,[prdImageUrl]
           ,[prdDesc]
           ,[prdPriceUK]
           ,[prdPriceEuro]
           ,[prdSpecialOfferId]
           ,[prdCTA])
     VALUES
           (
           @prdId
           ,@prdEnabled
           , @prdFeatured
		   , @prdIsLive
           , @prdTitle
           , @prdSource
           ,@prdCategory
           ,@prdUrlCompany
           ,@prdUrl
           ,@prdProductId
           ,@prdImageUrl
           ,@prdDesc
           ,@prdPriceUK
           ,@prdPriceEuro
           ,@prdSpecialOfferId
           ,@prdCTA
		   )
else
UPDATE [dbo].[tblProductData]
   SET [prdId] = @prdId
      ,[prdEnabled] = @prdEnabled
      ,[prdFeatured] = @prdFeatured
      ,[prdTitle] = @prdTitle
      ,[prdSource] = @prdSource
      ,[prdCategory] = @prdCategory
      ,[prdUrlCompany] = @prdUrlCompany
      ,[prdUrl] = @prdUrl
      ,[prdProductId] = @prdProductId
      ,[prdImageUrl] = @prdImageUrl
      ,[prdDesc] = @prdDesc
      ,[prdPriceUK] = @prdPriceUK
      ,[prdPriceEuro] = @prdPriceEuro
      ,[prdSpecialOfferId] = @prdSpecialOfferId
      ,[prdCTA] = @prdCTA
      ,[prdIsLive] = @prdIsLive
 WHERE prdId = @prdId

select  * from vwProductData where prdId=@prdId

end
GO
/****** Object:  StoredProcedure [dbo].[spProductSourceList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spProductSourceList]

as
begin
SELECT *
  FROM [dbo].[tblProductSource]
  end

GO
/****** Object:  StoredProcedure [dbo].[spSettingsList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Get settings list by value
-- =============================================
CREATE PROCEDURE [dbo].[spSettingsList]
	@setName nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

select * from vwSettings where setName = @setName
order by setid asc

END
GO
/****** Object:  StoredProcedure [dbo].[spSettingsListAll]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Get all in settings list
-- =============================================
Create PROCEDURE [dbo].[spSettingsListAll]

AS
BEGIN
	SET NOCOUNT ON;

select * from vwSettings
order by setId asc

END
GO
/****** Object:  StoredProcedure [dbo].[spSettingsUpdateById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Update settings value
-- =============================================
Create PROCEDURE [dbo].[spSettingsUpdateById]
	@setId int
	,@setValue nvarchar(500)
	As
	begin
	if exists (select * from tblSettings where setId = @setId)
	
UPDATE [dbo].[tblSettings]
   SET [setValue] = @setValue
 WHERE [setId] = @setId

 select * from vwSettings where setId = @setId
 order by setid asc

 end
GO
/****** Object:  StoredProcedure [dbo].[spUserReadById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Read user by id
-- =============================================
CREATE PROCEDURE [dbo].[spUserReadById]
	@user_id uniqueidentifier
	As
	begin

select * from vwUser
   WHERE user_id = @user_id
 end
GO
/****** Object:  StoredProcedure [dbo].[spUserReadByUsernameId]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Read user by username and password
-- =============================================
CREATE PROCEDURE [dbo].[spUserReadByUsernameId]
	@user_id uniqueidentifier
	,@user_username nvarchar(100)
	As
	begin

SELECT * from vwUser
   WHERE user_username = @user_username and user_id = @user_id
 end
GO
/****** Object:  StoredProcedure [dbo].[spUserReadByUsernamePwd]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Read user by username and password
-- =============================================
CREATE PROCEDURE [dbo].[spUserReadByUsernamePwd]
	@user_username nvarchar(100)
	,@user_pwd nvarchar(50)
	As
	begin

SELECT * from vwUser
   WHERE user_username = @user_username and user_pwd = @user_pwd
 end
GO
/****** Object:  StoredProcedure [dbo].[spUserReadIsRegTest]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Read user record which is used for registration testing
-- =============================================
Create PROCEDURE [dbo].[spUserReadIsRegTest]
	As
	begin

select * from vwUser
   WHERE user_regtest = 1
 end
GO
/****** Object:  StoredProcedure [dbo].[spUserTitleList]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	User title read list
-- =============================================
Create PROCEDURE [dbo].[spUserTitleList]
as
select * from tblTitle order by tit_index asc
GO
/****** Object:  StoredProcedure [dbo].[spUserUpdateById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Create/update user by id
-- =============================================
CREATE PROCEDURE [dbo].[spUserUpdateById]
           @user_id uniqueidentifier
           ,@user_firstname nvarchar(100)
           ,@user_lastname nvarchar(100)
           ,@user_username nvarchar(100)
           ,@user_email nvarchar(100)
           ,@user_phone nvarchar(20)
           ,@user_pwd nvarchar(50)
           ,@user_isreg bit
           ,@user_dtreg datetime
           ,@user_dtdob datetime
		   ,@user_settings nvarchar(500)
As

Begin
if  @user_id = CAST(CAST(0 AS BINARY) AS UNIQUEIDENTIFIER)
begin
set @user_id=NEWID()
INSERT INTO [dbo].[tblUser]
           ([user_id]
           ,[user_firstname]
           ,[user_lastname]
           ,[user_username]
           ,[user_email]
           ,[user_phone]
           ,[user_pwd]
           ,[user_isreg]
           ,[user_dtreg]
           ,[user_dtdob]
		   ,[user_settings]
		   )
     VALUES
           (@user_id
           ,@user_firstname
           ,@user_lastname
           ,@user_username
           ,@user_email
           ,@user_phone
           ,@user_pwd
           ,@user_isreg
           ,@user_dtreg
           ,@user_dtdob
		   ,@user_settings
		   )
end
else
UPDATE [dbo].[tblUser]
   SET [user_id] = @user_id
      ,[user_firstname] = @user_firstname
      ,[user_lastname] = @user_lastname
      ,[user_username] = @user_username
      ,[user_email] = @user_email
      ,[user_phone] = @user_phone
      ,[user_pwd] = @user_pwd
      ,[user_isreg] = @user_isreg
      ,[user_dtreg] = @user_dtreg
      ,[user_dtdob] = @user_dtdob
	  ,[user_settings] = @user_settings
 WHERE [user_id]=@user_id

SELECT [user_id]
      ,[user_firstname]
      ,[user_lastname]
      ,[user_username]
      ,[user_email]
      ,[user_phone]
      ,[user_pwd]
      ,[user_isreg]
      ,[user_dtreg]
      ,[user_dtdob]
	  ,[user_settings]
  FROM [dbo].[tblUser]
   WHERE user_id = @user_id
end
GO
/****** Object:  StoredProcedure [dbo].[spUserUpdatePwdById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Update user's hashed password by id
-- =============================================
CREATE PROCEDURE [dbo].[spUserUpdatePwdById]
	@user_id uniqueidentifier
	,@user_pwd nvarchar(50)
	As
	begin
UPDATE [dbo].[tblUser]
   SET [user_pwd] = @user_pwd

 WHERE user_id = @user_id

select * from vwUser
   WHERE user_id = @user_id
 end
GO
/****** Object:  StoredProcedure [dbo].[spUserUpdateRegById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Update user's userRegTest by id
-- =============================================
CREATE PROCEDURE [dbo].[spUserUpdateRegById]
	@user_id uniqueidentifier
	,@user_regtest bit
	As
	begin
declare @user_settings nvarchar(500)
declare @user_regteststr nvarchar(10)
if @user_regtest = 1
set @user_regteststr='true'
else
set @user_regteststr='false'
set @user_settings = '{"user_regtest":"'+@user_regteststr+'"}'

UPDATE [dbo].[tblUser]
   SET [user_settings] = @user_settings

 WHERE user_id = @user_id

select * from vwUsers
   WHERE user_id = @user_id
 end
GO
/****** Object:  StoredProcedure [dbo].[spUserUpdateRegTestById]    Script Date: 10/04/2025 23:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tony Stoddart
-- Create date: 15/05/2023
-- Description:	Update user's userRegTest by id
-- =============================================
Create PROCEDURE [dbo].[spUserUpdateRegTestById]
	@user_id uniqueidentifier
	,@user_regtest bit
	As
	begin
declare @user_settings nvarchar(500)
set @user_settings = '{"userRegTest":'+convert(nvarchar(10), @user_regtest)+'}'

UPDATE [dbo].[tblUser]
   SET [user_settings] = @user_settings

 WHERE user_id = @user_id

select * from vwUsers
   WHERE user_id = @user_id
 end
GO
