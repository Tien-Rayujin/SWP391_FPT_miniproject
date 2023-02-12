USE [master]
GO
/****** Object:  Database [BirdAccommodation]    Script Date: 2/13/2023 00:24:14 ******/
CREATE DATABASE [BirdAccommodation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdAccommodation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BirdAccommodation.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdAccommodation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BirdAccommodation_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BirdAccommodation] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdAccommodation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdAccommodation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdAccommodation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdAccommodation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdAccommodation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdAccommodation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdAccommodation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdAccommodation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdAccommodation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdAccommodation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdAccommodation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdAccommodation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdAccommodation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdAccommodation] SET RECOVERY FULL 
GO
ALTER DATABASE [BirdAccommodation] SET  MULTI_USER 
GO
ALTER DATABASE [BirdAccommodation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdAccommodation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdAccommodation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdAccommodation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdAccommodation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdAccommodation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BirdAccommodation', N'ON'
GO
ALTER DATABASE [BirdAccommodation] SET QUERY_STORE = ON
GO
ALTER DATABASE [BirdAccommodation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BirdAccommodation]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[bill_id] [nvarchar](20) NOT NULL,
	[booking_id] [nvarchar](20) NULL,
	[total_ammount] [float] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Birds]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Birds](
	[bird_id] [nvarchar](20) NOT NULL,
	[species] [nvarchar](20) NULL,
	[breed] [nvarchar](50) NULL,
	[age] [int] NULL,
	[gender] [nvarchar](20) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Birds] PRIMARY KEY CLUSTERED 
(
	[bird_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[bdetail_id] [nvarchar](20) NOT NULL,
	[booking_id] [nvarchar](20) NULL,
	[service_id] [nvarchar](20) NULL,
	[bird_id] [nvarchar](20) NULL,
 CONSTRAINT [PK_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[bdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[booking_id] [nvarchar](20) NOT NULL,
	[user_id] [nvarchar](20) NULL,
	[date_from] [date] NULL,
	[date_to] [date] NULL,
	[total_price] [float] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyFeedback]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyFeedback](
	[dfeedback_id] [nvarchar](20) NOT NULL,
	[bdetail_id] [nvarchar](20) NULL,
	[title] [nvarchar](50) NULL,
	[content] [nvarchar](100) NULL,
 CONSTRAINT [PK_DailyFeedback] PRIMARY KEY CLUSTERED 
(
	[dfeedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyReport]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyReport](
	[dreport_id] [nvarchar](20) NOT NULL,
	[bdetail_id] [nvarchar](20) NULL,
	[bird_image] [nvarchar](100) NULL,
	[column_1] [int] NULL,
	[date] [date] NULL,
	[issue] [nvarchar](100) NULL,
 CONSTRAINT [PK_Accommodation] PRIMARY KEY CLUSTERED 
(
	[dreport_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [nvarchar](20) NOT NULL,
	[user_id] [nvarchar](20) NULL,
	[bird_id] [nvarchar](20) NULL,
	[report_id] [nvarchar](20) NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](100) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[service_id] [nvarchar](20) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/13/2023 00:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [nvarchar](20) NOT NULL,
	[role] [nvarchar](20) NULL,
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[email] [nvarchar](50) NULL,
	[status] [int] NULL,
	[user_img] [nvarchar](100) NULL,
	[token] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Bookings] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Bookings]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Bookings] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Bookings]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_User_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_User_1]
GO
ALTER TABLE [dbo].[DailyFeedback]  WITH CHECK ADD  CONSTRAINT [FK_DailyFeedback_DailyFeedback] FOREIGN KEY([dfeedback_id])
REFERENCES [dbo].[DailyFeedback] ([dfeedback_id])
GO
ALTER TABLE [dbo].[DailyFeedback] CHECK CONSTRAINT [FK_DailyFeedback_DailyFeedback]
GO
ALTER TABLE [dbo].[DailyReport]  WITH CHECK ADD  CONSTRAINT [FK_DailyReport_BookingDetail] FOREIGN KEY([bdetail_id])
REFERENCES [dbo].[BookingDetail] ([bdetail_id])
GO
ALTER TABLE [dbo].[DailyReport] CHECK CONSTRAINT [FK_DailyReport_BookingDetail]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Accommodation] FOREIGN KEY([report_id])
REFERENCES [dbo].[DailyReport] ([dreport_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Accommodation]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Birds] FOREIGN KEY([bird_id])
REFERENCES [dbo].[Birds] ([bird_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Birds]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: male, 1:female' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Birds', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: on-going, 1: complete, 2: cancel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bookings', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 to 5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reviews', @level2type=N'COLUMN',@level2name=N'rating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'admin or user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: ban, 1:unban' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'address'
GO
USE [master]
GO
ALTER DATABASE [BirdAccommodation] SET  READ_WRITE 
GO
