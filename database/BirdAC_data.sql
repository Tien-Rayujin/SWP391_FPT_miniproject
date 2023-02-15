USE [BirdAccommodation]
GO
INSERT [dbo].[User] ([user_id], [role], [name], [password], [address], [phone], [email], [status], [user_img], [token]) VALUES (N'U1', N'admin', N'RaeKyo', N'12345', N'somewhere on earth', N'019191919', N'rae@gmail.com', 1, N'none_img', NULL)
INSERT [dbo].[User] ([user_id], [role], [name], [password], [address], [phone], [email], [status], [user_img], [token]) VALUES (N'U2', N'user', N'U1', N'123456', N'on moon', N'099299992', N'u1@gmail.com', 0, N'none_img', NULL)
GO
INSERT [dbo].[Birds] ([bird_id], [user_id], [bird_name], [species], [breed], [age], [gender], [description]) VALUES (N'Bi1', N'U1', N'Jobb', N'Ostrich', N'Green-cheeked', 2, N'Male', N'A chaos bird')
INSERT [dbo].[Birds] ([bird_id], [user_id], [bird_name], [species], [breed], [age], [gender], [description]) VALUES (N'Bi2', N'U1', N'Donna', N'Cockatiel', N'Normal grey', 3, N'Female', N'A playful bird')
INSERT [dbo].[Birds] ([bird_id], [user_id], [bird_name], [species], [breed], [age], [gender], [description]) VALUES (N'Bi3', N'U1', N'Hekko', N'Penguin', N'Peach page', 2, N'Male', N'A energytic bird')
INSERT [dbo].[Birds] ([bird_id], [user_id], [bird_name], [species], [breed], [age], [gender], [description]) VALUES (N'Bi4', N'U1', N'Elden Beast', N'Seagull', N'Bule and yellow tail', 2, N'Male', N'A god bird')
GO
INSERT [dbo].[Bookings] ([booking_id], [user_id], [date_from], [date_to], [total_price], [status]) VALUES (N'Bo1', N'U1', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-05' AS Date), 600, 0)
INSERT [dbo].[Bookings] ([booking_id], [user_id], [date_from], [date_to], [total_price], [status]) VALUES (N'Bo2', N'U1', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-05' AS Date), 700, 1)
GO
INSERT [dbo].[Reviews] ([review_id], [user_id], [bird_id], [booking_id], [rating], [comment]) VALUES (N'R1', N'U1', N'Bi1', N'Bo1', 4.6, N'Good service')
INSERT [dbo].[Reviews] ([review_id], [user_id], [bird_id], [booking_id], [rating], [comment]) VALUES (N'R2', N'U1', N'Bi4', N'Bo2', 4.4, N'Good report')
GO
INSERT [dbo].[Services] ([service_id], [name], [description], [status], [price]) VALUES (N'S1', N'Bird food and supplies', N'Providing a variety of bird food and supplies to meet the needs of different species', NULL, 100)
INSERT [dbo].[Services] ([service_id], [name], [description], [status], [price]) VALUES (N'S2', N'Bird boarding', N'Providing a safe and secure environment for birds to stay while their owners are away', NULL, 200)
INSERT [dbo].[Services] ([service_id], [name], [description], [status], [price]) VALUES (N'S3', N'Bird grooming', N'Cleaning and caring for birds to keep their feathers in good condition', NULL, 200)
INSERT [dbo].[Services] ([service_id], [name], [description], [status], [price]) VALUES (N'S4', N'Bird training', N'Providing training for birds to improve their behavior and socialization skills', NULL, 500)
INSERT [dbo].[Services] ([service_id], [name], [description], [status], [price]) VALUES (N'S6', N'Bird play areas', N'Providing space and activities for birds to play and socialize', NULL, 400)
INSERT [dbo].[Services] ([service_id], [name], [description], [status], [price]) VALUES (N'S7', N'Bird enrichment activities', N'Providing activities and toys to keep birds mentally stimulated and entertained', NULL, 300)
INSERT [dbo].[Services] ([service_id], [name], [description], [status], [price]) VALUES (N'S8', N'Bird photography', N'Taking photographs of birds while they are staying at the accommodation to document their stay', NULL, 500)
GO
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd1', N'Bo1', N'Bi1', N'S1')
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd2', N'Bo1', N'Bi1', N'S2')
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd3', N'Bo1', N'Bi1', N'S3')
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd4', N'Bo1', N'Bi2', N'S1')
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd5', N'Bo1', N'Bi2', N'S2')
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd6', N'Bo1', N'Bi2', N'S4')
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd7', N'Bo2', N'Bi4', N'S1')
INSERT [dbo].[BookingDetail] ([bdetail_id], [booking_id], [bird_id], [service_id]) VALUES (N'Bd8', N'Bo2', N'Bi4', N'S4')
GO
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr1', N'Bo1', N'Bi1', N'none', CAST(N'2022-12-01' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr10', N'Bo2', N'Bi2', N'none', CAST(N'2022-12-05' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr2', N'Bo1', N'Bi1', N'none', CAST(N'2022-12-02' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr3', N'Bo1', N'Bi1', N'none', CAST(N'2022-12-03' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr4', N'Bo1', N'Bi1', N'none', CAST(N'2022-12-04' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr5', N'Bo1', N'Bi1', N'none', CAST(N'2022-12-05' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr6', N'Bo1', N'Bi2', N'none', CAST(N'2022-12-01' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr7', N'Bo1', N'Bi2', N'none', CAST(N'2022-12-02' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr8', N'Bo1', N'Bi2', N'none', CAST(N'2022-12-03' AS Date))
INSERT [dbo].[DailyReport] ([dreport_id], [booking_id], [bird_id], [bird_image], [date]) VALUES (N'Dr9', N'Bo2', N'Bi2', N'none', CAST(N'2022-12-04' AS Date))
GO
INSERT [dbo].[Bills] ([bill_id], [booking_id], [total_ammount], [status], [method], [date]) VALUES (N'B1', N'Bo1', 800, 0, N'Momo', CAST(N'2022-12-14' AS Date))
INSERT [dbo].[Bills] ([bill_id], [booking_id], [total_ammount], [status], [method], [date]) VALUES (N'B2', N'Bo2', 500, 1, N'Paypal', CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df1', N'Dr1', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df10', N'Dr10', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df2', N'Dr2', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df3', N'Dr3', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df4', N'Dr4', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df5', N'Dr5', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df6', N'Dr6', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df7', N'Dr7', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df8', N'Dr8', N'none', N'empty')
INSERT [dbo].[DailyFeedback] ([dfeedback_id], [dreport_id], [title], [content]) VALUES (N'Df9', N'Dr9', N'none', N'empty')
GO
