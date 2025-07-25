USE [ezeway_db]
GO
INSERT [dbo].[tblTitle] ([tit_name], [tit_value], [tit_index]) VALUES (N'titEmpty', N'', 0)
INSERT [dbo].[tblTitle] ([tit_name], [tit_value], [tit_index]) VALUES (N'titMr', N'Mr', 1)
INSERT [dbo].[tblTitle] ([tit_name], [tit_value], [tit_index]) VALUES (N'titMrs', N'Mrs', 2)
INSERT [dbo].[tblTitle] ([tit_name], [tit_value], [tit_index]) VALUES (N'titMs', N'Ms', 3)
GO
INSERT [dbo].[tblUser] ([user_id], [user_firstname], [user_lastname], [user_username], [user_email], [user_phone], [user_pwd], [user_isreg], [user_dtreg], [user_dtdob], [user_settings], [user_title]) VALUES (N'cef213f0-5e8b-41fc-9a57-c8e7860474df', N'Tony', N'Stoddart', N'SupaTee', N'me@supatee.co.uk', N'07915280808', N'1f6AlCou2KhNbkHQem5sBlGXlotfCgj9T64zHd+yFv8=', 0, CAST(N'2023-07-10T08:50:00.000' AS DateTime), CAST(N'1959-12-17T04:30:00.000' AS DateTime), N'{"userRegTest":"false"}', N'titMr')
GO
INSERT [dbo].[tblRole] ([role_id], [role_name], [role_index]) VALUES (N'role_admin', N'Administrator', 0)
INSERT [dbo].[tblRole] ([role_id], [role_name], [role_index]) VALUES (N'role_guest', N'Guest', 2)
INSERT [dbo].[tblRole] ([role_id], [role_name], [role_index]) VALUES (N'role_user', N'User', 1)
GO
INSERT [dbo].[tblUserRole] ([usrrol_userid], [usrrol_roleid]) VALUES (N'cef213f0-5e8b-41fc-9a57-c8e7860474df', N'role_user')
INSERT [dbo].[tblUserRole] ([usrrol_userid], [usrrol_roleid]) VALUES (N'cef213f0-5e8b-41fc-9a57-c8e7860474df', N'role_admin')
GO
INSERT [dbo].[tblProductSource] ([prdsId], [prdsName], [prdsDTAdded], [prdsDesc]) VALUES (N'c85c8cf4-32d7-4232-a5ff-0aaf4f9f9a02', N'Avon', CAST(N'2025-01-22T21:32:46.980' AS DateTime), N'-')
INSERT [dbo].[tblProductSource] ([prdsId], [prdsName], [prdsDTAdded], [prdsDesc]) VALUES (N'8d7f6b28-896c-4cd8-8e46-96fc6c31d4b1', N'Amazon', CAST(N'2025-01-22T21:33:40.753' AS DateTime), N'-')
GO
INSERT [dbo].[tblProductCat] ([prdcId], [prdcName], [prdcDTAdded], [prdcDesc]) VALUES (N'77de11cc-f8da-4329-9ab3-33c2d09b3b1f', N'Stocking fillers', CAST(N'2025-01-23T23:17:58.630' AS DateTime), N'-')
INSERT [dbo].[tblProductCat] ([prdcId], [prdcName], [prdcDTAdded], [prdcDesc]) VALUES (N'c0abe1dc-1212-4c2e-9913-4f27053270b0', N'Health & Personal Care', CAST(N'2025-01-23T23:19:28.090' AS DateTime), N'-')
INSERT [dbo].[tblProductCat] ([prdcId], [prdcName], [prdcDTAdded], [prdcDesc]) VALUES (N'4abaaaf5-d1c1-4189-9476-95d4007ad389', N'Hair & Body', CAST(N'2025-01-23T23:17:16.667' AS DateTime), N'-')
GO
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'fae52192-7ad3-4822-bee8-026eae69e661', 1, 0, N'Seven Seas JointCare MAX GLUCOSAMINE with Omega-3', N'8d7f6b28-896c-4cd8-8e46-96fc6c31d4b1', N'https://www.amazon.co.uk/dp/B0D797XDNN?th=1&linkCode=ll1&tag=ezewayaaid-21&linkId=4e23b545aa32a1507d8d010cae24eabf&language=en_GB&ref_=as_li_ss_tl', N'amazon_seven_seas_jointcare_max_glucosamine_with_omega_3', N'', N'amazon/amazon_products/71l-P2lMMUL._AC_SX679_.jpg', N'Seven Seas JointCare MAX GLUCOSAMINE with Omega-3, Glucosamine, Chondroitin, Vitamins C and D, Manganese and Zinc, Food Supplements, 30-Day Pack', 17.99, 17.99, N'00000000-0000-0000-0000-000000000000', N'', 1, N'c0abe1dc-1212-4c2e-9913-4f27053270b0')
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'6662e3fc-ea9b-4849-859b-12ab46f84c89', 1, 0, N'Coach Soak Recovery Bath Soak', N'8d7f6b28-896c-4cd8-8e46-96fc6c31d4b1', N'https://www.amazon.co.uk/Coach-Soak-Rejuvenating-Magnesium-Essential/dp/B07W4M3797?content-id=amzn1.sym.cbcd6b2f-bf40-4893-9f24-99d7130bfc90%3Aamzn1.sym.cbcd6b2f-bf40-4893-9f24-99d7130bfc90&crid=JDOL7', N'amazon_coach_soak_recovery_bath_soak', N'', N'amazon/amazon_products/61ewO0uWAZL._AC_SX679_.jpg', N'Coach Soak Recovery Bath Soak – Rejuvenating Post Workout Magnesium Flakes - 21 Minerals, Essential Oils & Dead Sea Bath Salts Absorbs Faster Than Epsom Salts for Soaking, 1.36kg - Calming Lavender.
', 17.99, 0, N'00000000-0000-0000-0000-000000000000', N'Visit Amazon', 1, N'c0abe1dc-1212-4c2e-9913-4f27053270b0')
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'c1c685b3-a49e-4a17-82ec-a39547be225f', 1, 1, N'Planet Spa Sleep Ritual Pillow Mist', N'c85c8cf4-32d7-4232-a5ff-0aaf4f9f9a02', N'https://online.shopwithmyrep.co.uk/c12_uk_2024/3xca3vnii9ev1x5fozpo0k1m1lijap8myeyxsjsc/index.html?rep_id=rep3813381498129#page/49-50/product/38513', N'Avon_Planet_Spa_Sleep_Ritual_Pillow_Mist', N'38513', N'avon/avon_products/prod_1225952_1_613x613.jpg', N'About me
Avon sells 1 every minute* and it comes in a recyclable bottle (but please remove the pump first!). Our bedtime bestseller is infused with French lavender and chamomile essential oils for a relaxing aroma, so you can catch those well-earned zzz''s.
 
Product specification:
• Pillow mist with a relaxing aroma.
• With French lavender and chamomile essential oils.
• Recyclable bottle (but please remove the pump first!).
 
How to use me:
Spritz liberally over your body and bedding to inspire a sense of relaxation.
 
*Based on total sales from 01.02.2022 to 31.05.2022.', 5.5, NULL, N'00000000-0000-0000-0000-000000000000', N'Shop this Avon item', 1, N'c0abe1dc-1212-4c2e-9913-4f27053270b0')
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'5d5a51c3-96b3-4d4d-877f-b5b5cc8768d3', 1, 0, N'Warmer Electric Heated Throw Blanket', N'8d7f6b28-896c-4cd8-8e46-96fc6c31d4b1', N'https://www.amazon.co.uk/dp/B07XLSHWP5?th=1&linkCode=ll1&tag=ezewayaaid-21&linkId=7282af382f7aef9e2819744d33824601&language=en_GB&ref_=as_li_ss_tl', N'amazon_warmer_electric_heated_throw_blanket', N'', N'amazon/amazon_products/81weVhZw17L._AC_SX679_.jpg', N'Warmer Electric Heated Throw Blanket - Digital Controller - 9 Hour Timer, 9 Heat Settings, Auto Shutoff, Detachable Controller - Machine Washable - Large 160cm x 120cm', 44.99, 44.99, N'00000000-0000-0000-0000-000000000000', N'', 1, N'c0abe1dc-1212-4c2e-9913-4f27053270b0')
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'086e6432-14a1-4d0c-ba93-c8e2ab7c3fae', 1, 1, N'Senses Goodnight Sweetheart Bubble Bath - 1 Litre', N'c85c8cf4-32d7-4232-a5ff-0aaf4f9f9a02', N'https://online.shopwithmyrep.co.uk/c12_uk_2024/4ltfu4m4ihwqgmf1wlviq172gjy0snzue3acnrdh/products/senses-goodnight-sweetheart-bubble-bath-1-litre-1000ml-28597.html?prodId=01910191_00&variantId=28597&ca', N'Avon_Senses_Goodnight_Sweetheart_Bubble_Bath_-_1_Litre', N'28597', N'avon/avon_products/prod_1223493_1_613x613.jpg', N'About me:
Prepare to drift off into the deepest of sleeps with the dreamy scent of our Senses Goodnight Sweetheart Bubble Bath: Bergamot & Vanilla. This relaxing bubble bath with natural extracts is the perfect way to wind down after a busy day, and help you catch those well-deserved zzz''s.

Product specification:

• Bubble bath infused with the scent of bergamot and vanilla.
• Enriched with natural extracts.
• Recyclable packaging.
• Size: 1 litre, also available in 500ml.

How to use me:

Pour 1-2 capfuls under warm running water and watch clouds of blissful bubbles appear.

', 3, NULL, N'00000000-0000-0000-0000-000000000000', N'Shop this Avon item', 1, N'c0abe1dc-1212-4c2e-9913-4f27053270b0')
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'ddc6fd12-00fa-4e11-b275-df849a6661d0', 1, 1, N'Mens Grooming Set', N'c85c8cf4-32d7-4232-a5ff-0aaf4f9f9a02', N'https://online.shopwithmyrep.co.uk/c12_uk_2024/3xca3vnii9ev1x5fozpo0k1m1lijap8myeyxsjsc/index.html?rep_id=rep3813381498129#page/177-178/product/26245', N'Avon_Mens_Grooming_Set', N'26245', N'avon/avon_products/prod_5638493_1_613x613.jpg', N'About me:
Enjoy all your grooming essentials in this handy, neatly packed case. This must-have set, includes:
- Stainless steel nail clippers with nail file
- Nail scissors
- Tweezer
- Recycled plastic black comb
 
Metal silver colour carbon framed case made from PU in black.
 
Approx. 11.8 x 7.5 x 2cm.
 
Why you''ll love it:
 
• Everything you need to keep yourself well groomed.
• Handy case to keep things neat and tidy.
• Perfect as a gift for a loved one.
 
How to use it:
 
Keep your nails trimmed and filed to perfection with the nail clippers and file - correcting any issues with the handy nail scissors.
 
The tweezers are ideal for any pesky hairs, like stray eyebrow hairs.
 
Finally, keep your hair looking swish on-the-go with the handy hair comb.', 7, NULL, N'00000000-0000-0000-0000-000000000000', N'Shop this Avon item', 1, N'c0abe1dc-1212-4c2e-9913-4f27053270b0')
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'c832db57-fc4c-4533-8e9f-e9bbcd28ae44', 1, 1, N'Avon Care Berry Fusion Radiance Body Lotion - 400ml', N'c85c8cf4-32d7-4232-a5ff-0aaf4f9f9a02', N'https://online.shopwithmyrep.co.uk/c01_uk_2025/umu8v2vd5xri3wfppkz1yhtgolgysuumkknbtc0y/products/C01_25742.html?prodId=01660166_001&variantId=25742&campaignId=C01_UK_2025&rep_id=rep3813381498129', N'Avon_Avon_Care_Berry_Fusion_Radiance_Body_Lotion_-_400ml', N'26245', N'avon/avon_products/prod_1231208_1_613x613.jpg', N'
	  About me:

Reveal your skin at its best with our glow-getting Berry Fusion Body Lotion, enriched with blueberry and strawberry for an intensive radiance boost. Suitable for the whole family, it drenches skin in 48-hour moisture* leaving it feeling soft, smooth and nourished with a fresh berry scent. Plus, the gentle formula absorbs quickly so you don''t have to wait for it to dry.

 

Product specification:

• Body lotion formulated with blueberry and strawberry extracts and vitamin E.

• Dermatologically tested and suitable for normal to extra-dry skin.

• Part of the Avon Care Berry Fusion collection.

• Size: 400ml.

 

How to use me:

Apply liberally to your skin where needed and reapply as often as necessary.

 

*After multiple applications. Based on a clinical efficacy study with 30 participants.
	  ', 3.5, NULL, N'00000000-0000-0000-0000-000000000000', N'Shop this Avon item', 1, N'c0abe1dc-1212-4c2e-9913-4f27053270b0')
INSERT [dbo].[tblProductData] ([prdId], [prdEnabled], [prdFeatured], [prdTitle], [prdSource], [prdUrlCompany], [prdUrl], [prdProductId], [prdImageUrl], [prdDesc], [prdPriceUK], [prdPriceEuro], [prdSpecialOfferId], [prdCTA], [prdIsLive], [prdCategory]) VALUES (N'bda31699-c840-4b4a-b1f4-fa6f830c3bc2', 1, 0, N'DrSALTS+ Muscle Ease Therapy Epsom Salts', N'8d7f6b28-896c-4cd8-8e46-96fc6c31d4b1', N'https://www.amazon.co.uk/dp/B0BW4HF456?pd_rd_i=B0BW4HF456&pd_rd_w=lNQT5&content-id=amzn1.sym.7b0d8b34-54be-4fd2-9baf-2d658b11dc53&pf_rd_p=7b0d8b34-54be-4fd2-9baf-2d658b11dc53&pf_rd_r=4023THSGF2SK710NE', N'amazon_drsalts_muscle_ease_therapy_epsom_salts', N'', N'amazon/amazon_products/81HRXcz5MqL._AC_SX425_PIbundle-4,TopRight,0,0_SH20_.jpg', N'DrSALTS+ Muscle Ease Therapy Epsom Salts - Soothing Epsom Bath Salts to Relieve Strains, Pain & Stiffness with Eucalyptus & Ginger Essential Oils - Vegan & Cruelty-Free, 3kg', 17.1, 17.1, N'00000000-0000-0000-0000-000000000000', N'', 1, N'4abaaaf5-d1c1-4189-9476-95d4007ad389')
GO
INSERT [dbo].[tblBlogStatus] ([blgs_id], [blgs_name], [blgs_order]) VALUES (N'blgs_draft', N'Draft', 0)
INSERT [dbo].[tblBlogStatus] ([blgs_id], [blgs_name], [blgs_order]) VALUES (N'blgs_live', N'Live', 2)
INSERT [dbo].[tblBlogStatus] ([blgs_id], [blgs_name], [blgs_order]) VALUES (N'blgs_local', N'Local only', 1)
GO
INSERT [dbo].[tblBlog] ([blog_id], [blog_author], [blog_dt_created], [blog_dt_modified], [blog_content], [blog_title], [blog_url], [blog_status], [blog_dt_display]) VALUES (N'fc1896cb-18d5-4053-9d04-07e8a620e32c', N'00000000-0000-0000-0000-000000000000', CAST(N'2025-02-08T23:22:18.890' AS DateTime), CAST(N'2025-02-08T23:22:18.890' AS DateTime), N'
<p data-pm-slice="1 1 []"><strong>Support Your Joints with Seven Seas JointCare MAX GLUCOSAMINE</strong></p><p>If you’re looking for a high-quality supplement to support your joints, mobility, and overall well-being, <strong>Seven Seas JointCare MAX</strong> is an excellent choice. Designed to promote joint health, flexibility, and comfort, this <strong>30-day pack</strong> is packed with essential nutrients, including <strong>Omega-3, Glucosamine, Chondroitin, Vitamins C and D, Manganese, and Zinc.</strong></p><h3><strong>Why Choose Seven Seas JointCare MAX?</strong></h3><p>Our joints go through a lot every day, whether it''s through exercise, work, or simply the natural aging process. <strong>Seven Seas JointCare MAX</strong> provides a comprehensive solution to maintain and support your joint health. Here’s what makes it stand out:</p><p>? <strong>Glucosamine &amp; Chondroitin</strong> – These are natural components of cartilage, the tissue that cushions joints. They help maintain flexibility and mobility.</p><p>? <strong>Omega-3 Fatty Acids</strong> – Known for their anti-inflammatory properties, Omega-3 helps to support joint comfort and overall health.</p><p>? <strong>Vitamin C</strong> – Contributes to normal collagen formation, essential for healthy cartilage.</p><p>? <strong>Vitamin D</strong> – Supports normal bone health, crucial for strong and mobile joints.</p><p>? <strong>Manganese &amp; Zinc</strong> – These essential minerals contribute to the maintenance of normal bones and connective tissue.</p><h3><strong>Who Can Benefit from Seven Seas JointCare MAX?</strong></h3><p><span style="background-color: var(--bs-body-bg); color: var(--bs-body-color); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);">✅</span>&nbsp;<strong>Active Individuals</strong> – Whether you’re into sports or fitness, keeping your joints healthy is essential for optimal performance.</p><p>?? <strong>People with Joint Discomfort</strong> – If you experience stiffness or discomfort, this supplement can help provide support and relief.</p><p>?? <strong>Aging Adults</strong> – As we get older, joint health becomes even more important. Seven Seas JointCare MAX helps maintain flexibility and mobility.</p><p>?? <strong>Anyone Looking to Maintain Healthy Joints</strong> – Even if you’re not experiencing issues, taking proactive steps to care for your joints can help you stay active for years to come.</p><h3><strong>How to Use Seven Seas JointCare MAX</strong></h3><p>For best results, take <strong>two capsules per day</strong> with a cold drink. Regular daily use will ensure that your joints receive continuous support.</p><h3><strong>Where to Buy Seven Seas JointCare MAX?</strong></h3><p>You can conveniently purchase <strong>Seven Seas JointCare MAX</strong> online through <strong>Amazon</strong>. Check out the best deals and get it delivered straight to your doorstep.</p><p>?? <a disabled="true"><strong>Buy Now on Amazon</strong></a></p><h3><strong>Final Thoughts</strong></h3><p>Joint health is essential for leading an active and comfortable life. <strong>Seven Seas JointCare MAX</strong> is a trusted supplement that provides a powerful blend of nutrients to support and protect your joints. Whether you''re an athlete, an aging adult, or simply looking to maintain mobility, this supplement is a great addition to your daily routine.</p><p>Start prioritizing your joint health today with Seven Seas JointCare MAX!</p>', N'Support Your Joints with Seven Seas JointCare MAX GLUCOSAMINE', N'support_your_joints_with_seven_seas_jointcare_max_glucosamine', N'blgs_local', CAST(N'2025-02-08T23:22:18.890' AS DateTime))
INSERT [dbo].[tblBlog] ([blog_id], [blog_author], [blog_dt_created], [blog_dt_modified], [blog_content], [blog_title], [blog_url], [blog_status], [blog_dt_display]) VALUES (N'd6273bdf-df6f-48cf-a4aa-1d8735d93dfe', N'00000000-0000-0000-0000-000000000000', CAST(N'2025-02-09T00:00:32.383' AS DateTime), CAST(N'2025-02-09T00:00:32.383' AS DateTime), N'
<strong>Support Your Joints with Seven Seas JointCare MAX GLUCOSAMINE</strong><p></p><p>If you’re looking for a high-quality supplement to support your joints, mobility, and overall well-being, <strong>Seven Seas JointCare MAX</strong> is an excellent choice. Designed to promote joint health, flexibility, and comfort, this <strong>30-day pack</strong> is packed with essential nutrients, including <strong>Omega-3, Glucosamine, Chondroitin, Vitamins C and D, Manganese, and Zinc.</strong></p><h3><strong>Why Choose Seven Seas JointCare MAX?</strong></h3><p>Our joints go through a lot every day, whether it''s through exercise, work, or simply the natural aging process. <strong>Seven Seas JointCare MAX</strong> provides a comprehensive solution to maintain and support your joint health. Here’s what makes it stand out:</p><p>? <strong>Glucosamine &amp; Chondroitin</strong> – These are natural components of cartilage, the tissue that cushions joints. They help maintain flexibility and mobility.</p><p>? <strong>Omega-3 Fatty Acids</strong> – Known for their anti-inflammatory properties, Omega-3 helps to support joint comfort and overall health.</p><p>? <strong>Vitamin C</strong> – Contributes to normal collagen formation, essential for healthy cartilage.</p><p>? <strong>Vitamin D</strong> – Supports normal bone health, crucial for strong and mobile joints.</p><p>? <strong>Manganese &amp; Zinc</strong> – These essential minerals contribute to the maintenance of normal bones and connective tissue.</p><h3><strong>Who Can Benefit from Seven Seas JointCare MAX?</strong></h3><p>? <strong>Active Individuals</strong> – Whether you’re into sports or fitness, keeping your joints healthy is essential for optimal performance.</p><p>?? <strong>People with Joint Discomfort</strong> – If you experience stiffness or discomfort, this supplement can help provide support and relief.</p><p>?? <strong>Aging Adults</strong> – As we get older, joint health becomes even more important. Seven Seas JointCare MAX helps maintain flexibility and mobility.</p><p>?? <strong>Anyone Looking to Maintain Healthy Joints</strong> – Even if you’re not experiencing issues, taking proactive steps to care for your joints can help you stay active for years to come.</p><h3><strong>How to Use Seven Seas JointCare MAX</strong></h3><p>For best results, take <strong>two capsules per day</strong> with a cold drink. Regular daily use will ensure that your joints receive continuous support.</p><h3><strong>Where to Buy Seven Seas JointCare MAX?</strong></h3><p>You can conveniently purchase <strong>Seven Seas JointCare MAX</strong> online through <strong>Amazon</strong>. Check out the best deals and get it delivered straight to your doorstep.</p><p>?? <a href="https://www.amazon.co.uk/Seven-Seas-GLUCOSAMINE-Glucosamine-Chondroitin/dp/B0D797XDNN?ie=UTF8&amp;th=1&amp;linkCode=ll1&amp;tag=ezewayaaid-21&amp;linkId=15893e8f103852b53d731b5e8f3f7b4b&amp;language=en_GB&amp;ref_=as_li_ss_tl" target="_blank"><strong>Buy Now on Amazon</strong></a></p><h3><strong>Final Thoughts</strong></h3><p>Joint health is essential for leading an active and comfortable life. <strong>Seven Seas JointCare MAX</strong> is a trusted supplement that provides a powerful blend of nutrients to support and protect your joints. Whether you''re an athlete, an aging adult, or simply looking to maintain mobility, this supplement is a great addition to your daily routine.</p><p>Start prioritizing your joint health today with Seven Seas JointCare MAX!
</p>', N'Seven Seas JointCare MAX GLUCOSAMINE with Omega-3, Glucosamine, Chondroitin, Vitamins C and D, Manganese and Zinc, Food Supplements, 30-Day Pack', N'seven_seas_jointcare_max_glucosamine_with_omega_3_glucosamine_chondroitin_vitamins_c_and_d_manganese', N'blgs_live', CAST(N'2025-02-09T00:00:32.383' AS DateTime))
INSERT [dbo].[tblBlog] ([blog_id], [blog_author], [blog_dt_created], [blog_dt_modified], [blog_content], [blog_title], [blog_url], [blog_status], [blog_dt_display]) VALUES (N'526f00f9-9a92-44fe-8a72-69ea02be964d', N'00000000-0000-0000-0000-000000000000', CAST(N'2025-03-14T02:10:46.163' AS DateTime), CAST(N'2025-03-14T02:10:46.163' AS DateTime), N'
<b>10 Last-Minute Valentine''s Gifts for Him and Her</b><div><br></div><div>Leaving things a bit late? Want to buy that perfect gift but stuck for ideas.</div><div><br></div><div>Here are 10 super ideas for that last minute gift surprise.</div><div><br></div><div><a href="https://amzn.to/3Qe6SJR" target="_blank">Jellycat Large Amuseable Pink Heart Collectable Stuffed Plush Decoration</a></div><div><br></div><div><img src="[url]/ezeway_data/Amazon/amazon_products/Jellycat_Large_Amuseable_Pink_Heart_Collectable_Stuffed_Plush_Decoration/71JdvezhZTL._AC_SX679_.jpg" )"="" alt="image" class="blog-image"><br></div><div>Beautiful jelly cat, cute, soft and adorable ... wonderful for Valentine''s Day&nbsp;</div><div><br></div><div><a href="https://amzn.to/3X2MP4H" target="_blank">LEGO Botanicals Lucky Bamboo Artificial Plant for Indoor Display</a></div><div></div><img src="[url]/ezeway_data/Amazon/amazon_products/LEGO-Botanicals-Lucky-Bamboo-Artificial-Plant-for-Indoor-Display-71ABP_8heJL._AC_SX679_.jpg" alt="Lego" class="blog-image"><div><br></div><div>LEGO Botanicals Lucky Bamboo Artificial Plant for Indoor Display</div><div>Set for Adults includes a Buildable Pot with a Wood-Effect Plinth for Home Decor&nbsp;</div><div>Gift for Valentine''s Day for Her or Him</div><div><br></div><div>So cute, a nice easy build</div><div><br></div><div><br></div><div><div class="a-row a-spacing-small review-data" style="width: 680px; margin-bottom: 8px !important;"><span data-hook="review-body" class="a-size-base review-text" style="font-size: 14px !important; line-height: 20px !important;"><div data-a-expander-name="review_text_read_more" data-a-expander-collapsed-height="300" class="a-expander-collapsed-height a-row a-expander-container a-expander-partial-collapse-container" style="width: 680px; overflow: hidden; position: relative; max-height: 300px;"><div data-hook="review-collapsed" data-expanded="false" class="a-expander-content reviewText review-text-content a-expander-partial-collapse-content" style="overflow: hidden; position: relative;"><br></div><div data-hook="review-collapsed" data-expanded="false" class="a-expander-content reviewText review-text-content a-expander-partial-collapse-content" style="overflow: hidden; position: relative;"><br></div></div></span></div><div data-hook="review-comments" class="a-row review-comments cr-vote-action-bar" style="width: 680px;"><span class="cr-vote" data-hook="review-voting-widget"><span style="color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;"></span><div class="cr-helpful-icon-button cr-vote-component" style="color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;"><span class="a-declarative" data-action="reviews:vote-action" data-reviews:vote-action="{&quot;ajaxUrl&quot;:&quot;/hz/reviews-render/ajax/helpful-vote/submit/ref=cm_cr_dp_d_vote_lft?ie=UTF8&quot;,&quot;cssSelectors&quot;:{&quot;voteCountComponent&quot;:&quot;.cr-helpful-icon-count&quot;,&quot;loadingVoteComponent&quot;:&quot;.cr-vote-loading-component&quot;,&quot;onError&quot;:&quot;.cr-vote-error&quot;,&quot;removeVoteComponent&quot;:&quot;.cr-remove-vote-component&quot;,&quot;submitVoteComponent&quot;:&quot;.cr-submit-vote-component&quot;,&quot;inFlight&quot;:&quot;.cr-vote-feedback&quot;,&quot;hideVoteComponents&quot;:&quot;.cr-vote-component&quot;,&quot;onSuccess&quot;:&quot;.cr-vote-success&quot;},&quot;csrfT&quot;:&quot;hKJ9eSyXLRfK93CYqlwiFl31rLCpZpbb6lJjviPeNLQqAAAAAGetdfwAAAAB&quot;,&quot;isReviewLocal&quot;:true,&quot;reviewId&quot;:&quot;R1LN0U63NOHQXM&quot;,&quot;allowLinkDefault&quot;:&quot;1&quot;}"><div class="cr-helpful-button aok-float-left" style="margin-right: 5px; vertical-align: middle; float: left !important;"><span class="a-button a-button-base" id="a-autoid-42" style="border-radius: 100px; border-width: 1px; display: inline-block; padding: 0px; text-align: center; vertical-align: middle; cursor: pointer; border-color: rgb(136, 140, 140); border-style: solid;"></span></div></span></div></span></div></div><div><br></div><div><br></div>    
', N'20 Last-Minute Valentine''s Gifts for Him and Her', N'10_last_minute_valentines_gifts_for_him_and_her', N'blgs_live', CAST(N'2025-03-14T02:10:46.163' AS DateTime))
INSERT [dbo].[tblBlog] ([blog_id], [blog_author], [blog_dt_created], [blog_dt_modified], [blog_content], [blog_title], [blog_url], [blog_status], [blog_dt_display]) VALUES (N'8e2073f0-9b2b-4f57-a003-b913cee5c01f', N'00000000-0000-0000-0000-000000000000', CAST(N'2025-01-28T22:56:06.253' AS DateTime), CAST(N'2025-01-28T22:56:06.253' AS DateTime), N'<h3 data-pm-slice="1 1 []">Discover the Comfort of the Amazon Electric Heated Throw Blanket</h3><p>Winter brings with it cozy evenings, warm drinks, and the need for ultimate comfort. And nothing delivers that better than a heated throw blanket. If you’ve been looking for the perfect solution to keep warm while relaxing at home, the Amazon Electric Heated Throw Blanket might just be what you need.</p><h4>Why Choose an Electric Heated Throw Blanket?</h4><p>Electric heated throw blankets are more than just regular blankets. They provide consistent, adjustable warmth to keep you comfortable no matter how chilly it gets. Unlike cranking up your heating system—which can be expensive and less eco-friendly—an electric heated blanket gives you localized warmth, saving energy and cutting costs.</p><h4>Features of the Amazon Electric Heated Throw Blanket</h4><ol data-spread="true" start="1"><li><p><strong>Fast Heating Technology</strong>: With its advanced heating elements, the Amazon Electric Heated Throw Blanket warms up in no time, ensuring you’re cozy within minutes.</p></li><li><p><strong>Adjustable Heat Settings</strong>: Whether you prefer gentle warmth or a toasty hug, the adjustable heat settings let you customize the experience to your liking.</p></li><li><p><strong>Soft, Plush Fabric</strong>: Made from ultra-soft materials, this throw blanket feels luxurious against your skin, offering both comfort and warmth.</p></li><li><p><strong>Safety Features</strong>: Equipped with an automatic shut-off function, the blanket ensures safety by turning off after a set duration, preventing overheating.</p></li><li><p><strong>Easy Maintenance</strong>: The blanket is machine washable, making it simple to keep clean and fresh for everyday use.</p></li></ol><h4>Benefits of Owning a Heated Throw Blanket</h4><ul data-spread="false"><li><p><strong>Energy Savings</strong>: Keep your heating bills under control by using this blanket instead of heating the entire house.</p></li><li><p><strong>Relief from Aches and Pains</strong>: The gentle heat can help soothe sore muscles and improve circulation.</p></li><li><p><strong>Stylish and Functional</strong>: Designed to complement your living room or bedroom, this blanket is as aesthetically pleasing as it is practical.</p></li><li><p><strong>Great for All Ages</strong>: Whether you’re watching TV, reading, or simply unwinding after a long day, this blanket caters to everyone in the family.</p></li></ul><h4>Why Buy from Amazon?</h4><p>Amazon offers the convenience of easy online shopping, reliable delivery, and great customer support. Plus, with customer reviews and detailed product information, you can feel confident in your purchase.</p><p><a href="[url]/amazon/amazon_warmer_electric_heated_throw_blanket">Click here to buy your Amazon Electric Heated Throw Blanket now!</a></p><h4>Conclusion</h4><p>Don’t let the winter chill get the better of you. Treat yourself to the Amazon Electric Heated Throw Blanket and experience unmatched comfort and warmth. It’s a small investment that makes a big difference in how you enjoy the colder months.</p><p>Stay warm, stay cozy, and let the winter vibes bring you joy!</p><p></p>', N'Discover the Comfort of the Amazon Electric Heated Throw Blanket', N'discover_the_comfort_of_the_amazon_electric_heated_throw_blanket', N'blgs_live', CAST(N'2025-01-29T21:10:51.330' AS DateTime))
GO
INSERT [dbo].[tblPageData] ([pd_id], [pd_page], [pd_controller], [pd_action]) VALUES (N'00000000-0000-0000-0000-000000000000', N'all', N'*', N'*')
INSERT [dbo].[tblPageData] ([pd_id], [pd_page], [pd_controller], [pd_action]) VALUES (N'6a262515-a405-4dcf-903f-12ec7ce0cbab', N'index', N'home', N'index')
GO
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
GO
SET IDENTITY_INSERT [dbo].[tblBlogOrder] ON 

INSERT [dbo].[tblBlogOrder] ([blgo_id], [blgo_uid], [blgo_index]) VALUES (1, N'526f00f9-9a92-44fe-8a72-69ea02be964d', 1)
INSERT [dbo].[tblBlogOrder] ([blgo_id], [blgo_uid], [blgo_index]) VALUES (2, N'8e2073f0-9b2b-4f57-a003-b913cee5c01f', 10)
SET IDENTITY_INSERT [dbo].[tblBlogOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblContact] ON 

INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (1, N'Tony Stoddart', N'07915280808', N'ezeway@supatee.co.uk', N'Test message', N'This is a test message', CAST(N'2025-01-23T14:27:55.287' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (2, N'TedPab', N'83927858539', N'moqagides18@gmail.com', N'Hello, i am writing about     price for reseller', N'Hi, ??????? ?????? ?????? ????.', CAST(N'2025-01-25T22:47:25.167' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (3, N'JohnPab', N'86251596385', N'arikerer278@gmail.com', N'Hi, i write about     price for reseller', N'Hallo, ek wou jou prys ken.', CAST(N'2025-01-26T07:28:37.277' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (4, N'Brianna Belton', N'2132620124', N'Brianna Belton', N'Re: Improve your website traffic and SEO', N'Hello team, 

With my experience in SEO and digital marketing, I believe your website could achieve better results in organic search rankings with some targeted improvements.I’ve reviewed your site and noticed that it could benefit from a more robust SEO strategy. Optimizing your online presence could lead to improved search engine rankings and increased traffic.

Our main focus will be to help generate more sales & online traffic.

We can place your website on Google''s 1st page. We will improve your website’s position on Google and get more traffic.

Proposal/Package Offer-
If you are interested, I would be happy to send you a proposal or package with more details. Kindly provide your preferred contact details.

Thank you,
Brianna Belton



ezeway.co.uk

', CAST(N'2025-01-27T13:38:06.363' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (5, N'Brianna Belton', N'2132620124', N'Brianna Belton', N'Re: Improve your website traffic and SEO', N'Hello team, 

I specialize in helping businesses like yours improve their online presence. By optimizing your website’s SEO, you can rank higher on search engines and attract more targeted traffic.

 Because of this you''re losing a ton of calls to your competitors!

We can place your website on Google''s 1st page. We will improve your website’s position on Google and get more traffic.

Phone Number Request for Call Scheduling - 
   If you''re available, could you kindly share a suitable time and phone number so we can arrange a follow-up call? I look forward to discussing this further.

Thank you,
Brianna Belton



ezeway.co.uk

', CAST(N'2025-01-27T15:34:38.163' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (6, N'Brianna Belton', N'2132620124', N'Brianna Belton', N'Re: Improve your website traffic and SEO', N'Hello team, 

I came across your website while conducting a search and noticed that your site could benefit from improved search engine optimization (SEO) to increase visibility.

Our main focus will be to help generate more sales & online traffic.

We can increase targeted visitor''s to your website so that it appears on Google''s first page. Bing, Yahoo, AOL, etc.


Follow-up Call Scheduling  -
   Please let me know when would be a good time to connect for a follow-up call. I''d be glad to discuss our solutions further.

Thank you,
Brianna Belton



ezeway.co.uk

', CAST(N'2025-01-27T17:03:25.003' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (7, N'Shauna Balog', N'407655324', N'shauna.balog@yahoo.com', N'investigation', N'Want to get your message in front of millions of potential customers? Our service can help. By sending your ad text to website contact forms, your message will be read just like you''re reading this one. And with one flat rate, you can reach a massive audience without any per click costs. Start growing your business today.

Feel free to contact me using the details below if you want to learn more about my approach.

Regards,
Shauna Balog
Email: Shauna.Balog@morebiz.my
Website: http://7ejada.contactblastingworks.my

', CAST(N'2025-01-31T23:12:25.950' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (8, N'HenryPab', N'85442188191', N'ebojajuje04@gmail.com', N'Hallo  i am writing about     price', N'Kaixo, zure prezioa jakin nahi nuen.', CAST(N'2025-02-03T03:45:03.140' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (9, N'TedPab', N'81779247386', N'moqagides18@gmail.com', N'Hallo,   wrote about   the price for reseller', N'Hai, saya ingin tahu harga Anda.', CAST(N'2025-02-03T07:51:09.200' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (10, N'FreyaPab', N'82358769273', N'yawiviseya67@gmail.com', N'Hallo    writing about     price for reseller', N'Dia duit, theastaigh uaim do phraghas a fháil.', CAST(N'2025-02-06T09:01:23.757' AS DateTime))
INSERT [dbo].[tblContact] ([ctactId], [ctactName], [ctactPhone], [ctactEmail], [ctactSubject], [ctactMessage], [ctactDTMessage]) VALUES (11, N'JohnPab', N'82326385866', N'anepivepaz038@gmail.com', N'Aloha, i writing about   the price for reseller', N'Aloha, makemake wau e?ike i kau kumuku?ai.', CAST(N'2025-02-13T02:18:21.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblContact] OFF
GO
INSERT [dbo].[tblCustomer] ([cust_id], [cust_firstname], [cust_lastname], [cust_email], [cust_mobile], [cust_pwd], [cust_signup_dt], [cust_browserdetails], [cust_flags]) VALUES (N'a0b5deb9-4626-4b9d-bd50-91acaad7483f', N'Tony', N'Stoddart', N'wddty@supatee.co.uk', N'07915280808', N'', CAST(N'2024-12-09T02:24:40.377' AS DateTime), N'{"mRemoteIP":"::1","mUserAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"}', N'{"cust_avon":false, "cust_vivamk":false, "cust_offers":false}')
GO
INSERT [dbo].[tblMenu] ([menu_id], [menu_parent], [menu_title], [menu_url], [menu_status], [menu_type], [menu_order]) VALUES (N'00000000-0000-0000-0000-000000000000', NULL, N'New menu', NULL, N'menustatus_draft', N'menutype_new', 0)
INSERT [dbo].[tblMenu] ([menu_id], [menu_parent], [menu_title], [menu_url], [menu_status], [menu_type], [menu_order]) VALUES (N'f540183f-ccab-4233-8d19-13fe23f311f8', NULL, N'Own Your Future Challenge', NULL, N'menustatus_public', N'menutype_normal', 0)
GO
INSERT [dbo].[tblPage] ([page_id], [page_title], [page_status], [page_date], [page_author_id], [page_type]) VALUES (N'00000000-0000-0000-0000-000000000000', N'New page', N'pagestatus_draft', NULL, N'cef213f0-5e8b-41fc-9a57-c8e7860474df', N'pagetype_new')
INSERT [dbo].[tblPage] ([page_id], [page_title], [page_status], [page_date], [page_author_id], [page_type]) VALUES (N'd286ce2b-991e-4587-887e-5d8b9b5bcb49', N'Page Two', N'pagestatus_draft', CAST(N'2023-08-15T00:59:39.230' AS DateTime), N'cef213f0-5e8b-41fc-9a57-c8e7860474df', N'pagetype_normal')
INSERT [dbo].[tblPage] ([page_id], [page_title], [page_status], [page_date], [page_author_id], [page_type]) VALUES (N'71ba424f-b546-4644-853a-76a3347afce4', N'home', N'pagestatus_public', CAST(N'2023-08-08T00:53:00.000' AS DateTime), N'cef213f0-5e8b-41fc-9a57-c8e7860474df', N'pagetype_normal')
GO
INSERT [dbo].[tblPost] ([post_id], [post_author], [post_date], [post_content], [post_title], [post_excerpt], [post_status], [post_comment_status], [post_name], [post_type], [post_page_id]) VALUES (N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', NULL, NULL, N'New post', NULL, N'poststatus_draft', NULL, NULL, N'posttype_post', N'71ba424f-b546-4644-853a-76a3347afce4')
INSERT [dbo].[tblPost] ([post_id], [post_author], [post_date], [post_content], [post_title], [post_excerpt], [post_status], [post_comment_status], [post_name], [post_type], [post_page_id]) VALUES (N'a9ff327b-c54c-4e51-a38b-037b8074c815', N'cef213f0-5e8b-41fc-9a57-c8e7860474df', CAST(N'2023-08-01T10:29:00.000' AS DateTime), N'The basic site is up. But we need the content to database driven.
But at least the site is cane be indexed into the search engines using Google Search Console.
I reckon that will take some time to happen anyway.
', N'The basic site is up', NULL, N'poststatus_public', NULL, NULL, N'posttype_post', N'71ba424f-b546-4644-853a-76a3347afce4')
INSERT [dbo].[tblPost] ([post_id], [post_author], [post_date], [post_content], [post_title], [post_excerpt], [post_status], [post_comment_status], [post_name], [post_type], [post_page_id]) VALUES (N'071f1050-553c-435b-89bc-0483d0839980', N'cef213f0-5e8b-41fc-9a57-c8e7860474df', CAST(N'2023-08-09T11:37:00.000' AS DateTime), N'The text content of the site now largely comes from the database. Simple system at the moment but it works.
Now to think of a nice system for handling the images that go with each of the posts.
', N'The text content is database driven', NULL, N'poststatus_public', NULL, NULL, N'posttype_post', N'71ba424f-b546-4644-853a-76a3347afce4')
INSERT [dbo].[tblPost] ([post_id], [post_author], [post_date], [post_content], [post_title], [post_excerpt], [post_status], [post_comment_status], [post_name], [post_type], [post_page_id]) VALUES (N'a28c51c7-4007-4b7a-8684-277cafe6378a', N'cef213f0-5e8b-41fc-9a57-c8e7860474df', CAST(N'2023-07-29T09:20:00.000' AS DateTime), N'Some years back I did have a website. it was very simple, but at least something was there. 
Then I went through few years where I got a little distracted, and also changed hosting companies a couple times.
And with all of that my website disappeared.
', N'Where it all started', NULL, N'poststatus_public', NULL, NULL, N'posttype_post', N'71ba424f-b546-4644-853a-76a3347afce4')
INSERT [dbo].[tblPost] ([post_id], [post_author], [post_date], [post_content], [post_title], [post_excerpt], [post_status], [post_comment_status], [post_name], [post_type], [post_page_id]) VALUES (N'be98879a-3213-440f-898c-29ddc39573f5', N'cef213f0-5e8b-41fc-9a57-c8e7860474df', CAST(N'2023-07-29T12:45:00.000' AS DateTime), N'Well, I received some motivation from my friend DamajaUK.
He had just rebuilt his own website and it looks pretty cool. He pointed out that I should have my own website again, and I decided that he was right.', N'Some sage advice from DamajaUK', NULL, N'poststatus_public', NULL, NULL, N'posttype_post', N'71ba424f-b546-4644-853a-76a3347afce4')
INSERT [dbo].[tblPost] ([post_id], [post_author], [post_date], [post_content], [post_title], [post_excerpt], [post_status], [post_comment_status], [post_name], [post_type], [post_page_id]) VALUES (N'8a21621b-e17d-4859-88e7-e8857b62d839', N'cef213f0-5e8b-41fc-9a57-c8e7860474df', CAST(N'2023-07-24T11:59:00.000' AS DateTime), N'SupaTee ... The story of one man''s determination to undergo a journey to have his own personal website, the decisions made, and the obstacles encountered and overcome along the way.', N'Who is SupaTee', NULL, N'poststatus_public', NULL, NULL, N'posttype_initial', N'71ba424f-b546-4644-853a-76a3347afce4')
INSERT [dbo].[tblPost] ([post_id], [post_author], [post_date], [post_content], [post_title], [post_excerpt], [post_status], [post_comment_status], [post_name], [post_type], [post_page_id]) VALUES (N'4bf306d2-68e8-48fc-aa93-f27c7a7289e2', N'cef213f0-5e8b-41fc-9a57-c8e7860474df', CAST(N'2023-08-10T02:27:00.000' AS DateTime), N'This is the story about the SupaTee alter ego, and his website development journey.
An obvious choice would have been to use Wordpress, or some other cms/blogging system.
However the choice was made to begin this journey with Microsoft''s .Net Core 7
And knowing Microsoft, this journey will change over time.
Another aim is to implement a blogging system from scratch. Re-invent the wheel why don''t we?
Then to discover will anyone resonate with these ideas? Or is it too niched.
Yet another aim is to discover, is it possible that the framework being developed can be used for other ideas?
And what could these other ideas be?
This is gonna be a real adventure.', N'New post', NULL, N'poststatus_draft', NULL, NULL, N'posttype_about', N'71ba424f-b546-4644-853a-76a3347afce4')
GO
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription], [setId]) VALUES (N'AppName', N'Property Directory', N'Name of application', 1)
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription], [setId]) VALUES (N'PasswordSalt', N'pN1UH7z/LaI3PVPQQ9fy9w==', N'Salt used for password', 2)
INSERT [dbo].[tblSettings] ([setName], [setValue], [setDescription], [setId]) VALUES (N'SmtpDetails', N'{"defaultCredentials":"false", "host":"mx496593.smtp-engine.com", "password":"Smtp$2021_", "port":"587", "username":"outmail@explose.co.uk","enablessl":"true"}', N'Smtp Details', 3)
GO
