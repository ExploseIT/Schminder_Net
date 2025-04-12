
use schminder_db
go


if (select count (*) from tblPageContent) < 12 
begin
print ('No data')
SET IDENTITY_INSERT [dbo].[tblPageContent] ON 
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (1, N'meta_description', N'EzeWay - Avon cosmetics, fragrances, hair & body, gift ideas', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (2, N'id_page_header', N'EzeWay - Avon cosmetics, fragrances, hair & body, gift ideas', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (3, N'id_about_p', N'Discover exclusive deals from top brands like Avon, VivaMK, Amazon, and more.<br/>Plus, explore opportunities to boost your income with our partner programs.', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (4, N'meta_keywords', N'VivaMK,Avon,Utility Warehouse,catalogues online,browse,home,beauty,kitchen,gifts,household,personalised gifts,christmas,eco friendly,cleaning,toys,health,bedding,fashion,hardware,memorial,pets,lipstick,deodorant,perfume,stain remover,pest control,cosmetics,Xmas', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (5, N'meta_description', N'EzeWay offers a range of deals, bargains and special offers to suit all needs, delivered to you, anywhere in the UK.', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (6, N'shortcut_icon', N'~/assets/brand/ezeway-favicon-2.jpg', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (7, N'shortcut_icon_type', N'image/jpeg', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (10, N'social_facebook', N'https://www.facebook.com/shopwithezeway', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (11, N'social_insta', N'https://www.instagram.com/ezeway_co_uk', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (14, N'ga_id', N'G-DDP0GBGJMC', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (15, N'gtm_id', N'GTM-5XL4XKPR', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tblPageContent] ([pc_id], [pc_name], [pc_value], [pc_pdpd_id]) VALUES (16, N'ga_admin_id', N'G-SVKBQB1T53', N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[tblPageContent] OFF
end
else
print ('Some data')

if not exists (select * from tblPageContent where pc_name='app_name')
INSERT [dbo].[tblPageContent] ([pc_name], [pc_value], [pc_pdpd_id]) VALUES (N'app_name', N'Schminder', N'00000000-0000-0000-0000-000000000000')

update tblPageContent set pc_value='~/site/favicon/schminder_favicon.png' where pc_name='shortcut_icon'
update tblPageContent set pc_value='image/png' where pc_name='shortcut_icon_type'
update tblPageContent set pc_value='G-JF0TMHZX82' where pc_name='ga_id'
update tblPageContent set pc_value='G-Z9HXGQVYSD' where pc_name='ga_admin_id'
update tblPageContent set pc_value=N'Schminder - Scheduling medication reminder and prescription scanner' where pc_name = N'meta_description' 
update tblPageContent set pc_value=N'Schminder, Medisafe,ExploseIT,MyTherapy,schedule,medication,reminder' where pc_name=N'meta_keywords'
update tblPageContent set pc_value=N'Schminder - Scheduling medication reminder and prescription scanner' where pc_name=N'id_page_header'
select * from tblPageContent

