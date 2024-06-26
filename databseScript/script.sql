USE [master]
GO
/****** Object:  Database [insurance]    Script Date: 4/29/2024 7:59:20 PM ******/
CREATE DATABASE [insurance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'insurance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\insurance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'insurance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\insurance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [insurance] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [insurance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [insurance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [insurance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [insurance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [insurance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [insurance] SET ARITHABORT OFF 
GO
ALTER DATABASE [insurance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [insurance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [insurance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [insurance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [insurance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [insurance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [insurance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [insurance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [insurance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [insurance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [insurance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [insurance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [insurance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [insurance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [insurance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [insurance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [insurance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [insurance] SET RECOVERY FULL 
GO
ALTER DATABASE [insurance] SET  MULTI_USER 
GO
ALTER DATABASE [insurance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [insurance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [insurance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [insurance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [insurance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [insurance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'insurance', N'ON'
GO
ALTER DATABASE [insurance] SET QUERY_STORE = ON
GO
ALTER DATABASE [insurance] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [insurance]
GO
/****** Object:  User [SuperAdmin]    Script Date: 4/29/2024 7:59:20 PM ******/
CREATE USER [SuperAdmin] FOR LOGIN [SuperAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 4/29/2024 7:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[card_owner] [varchar](100) NULL,
	[card_number] [bigint] NULL,
	[expiry_date] [varchar](5) NULL,
	[security_code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[policy]    Script Date: 4/29/2024 7:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policy](
	[policy_id] [int] NOT NULL,
	[policy_name] [varchar](200) NULL,
	[insurer] [varchar](100) NULL,
	[tpa] [varchar](100) NULL,
	[description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[policy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_policy]    Script Date: 4/29/2024 7:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_policy](
	[user_id] [int] NOT NULL,
	[policy_id] [int] NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[policy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/29/2024 7:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] NOT NULL,
	[emp_id] [int] NULL,
	[emp_name] [varchar](100) NULL,
	[company_name] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[payment_details] ON 

INSERT [dbo].[payment_details] ([id], [user_id], [card_owner], [card_number], [expiry_date], [security_code]) VALUES (19, 0, N'Rahul', 764293865, N'22/25', 123)
INSERT [dbo].[payment_details] ([id], [user_id], [card_owner], [card_number], [expiry_date], [security_code]) VALUES (20, 3, N'raj', 4628397642, N'12/25', 122)
INSERT [dbo].[payment_details] ([id], [user_id], [card_owner], [card_number], [expiry_date], [security_code]) VALUES (32, 2, N'Md Anwar', 4763434647467436, N'12/26', 123)
INSERT [dbo].[payment_details] ([id], [user_id], [card_owner], [card_number], [expiry_date], [security_code]) VALUES (35, 2, N'Md Anwar Mansuri', 6474788122838383, N'12/23', 133)
INSERT [dbo].[payment_details] ([id], [user_id], [card_owner], [card_number], [expiry_date], [security_code]) VALUES (37, 2, N'Rahul', 3644637347438387, N'09/25', 124)
INSERT [dbo].[payment_details] ([id], [user_id], [card_owner], [card_number], [expiry_date], [security_code]) VALUES (38, 2, N'Shivam', 4366744346346446, N'12/26', 345)
INSERT [dbo].[payment_details] ([id], [user_id], [card_owner], [card_number], [expiry_date], [security_code]) VALUES (39, 2, N'Md Anwar Mansuri', 3446474747733737, N'08/25', 134)
SET IDENTITY_INSERT [dbo].[payment_details] OFF
GO
INSERT [dbo].[policy] ([policy_id], [policy_name], [insurer], [tpa], [description]) VALUES (1, N'Group Mediclaim Policy', N'Niva Bupa Health Insurance Company Limited', N'Niva Bupa Health Insurance Company Limited', N'Enroll Family')
INSERT [dbo].[policy] ([policy_id], [policy_name], [insurer], [tpa], [description]) VALUES (2, N'Individual Mediclaim Policy', N'Niva Bupa Health Insurance Company Limited', N'Niva Bupa Health Insurance Company Limited', N'Enroll Yourself')
GO
INSERT [dbo].[user_policy] ([user_id], [policy_id], [start_date], [end_date]) VALUES (1, 1, CAST(N'2024-03-24' AS Date), CAST(N'2025-03-24' AS Date))
INSERT [dbo].[user_policy] ([user_id], [policy_id], [start_date], [end_date]) VALUES (1, 2, CAST(N'2024-03-24' AS Date), CAST(N'2025-03-24' AS Date))
INSERT [dbo].[user_policy] ([user_id], [policy_id], [start_date], [end_date]) VALUES (2, 2, CAST(N'2024-03-24' AS Date), CAST(N'2025-03-24' AS Date))
INSERT [dbo].[user_policy] ([user_id], [policy_id], [start_date], [end_date]) VALUES (3, 2, CAST(N'2024-03-24' AS Date), CAST(N'2025-03-24' AS Date))
GO
INSERT [dbo].[users] ([user_id], [emp_id], [emp_name], [company_name], [username], [password]) VALUES (1, 101, N'Rohan', N'iLink Digital', N'rohan123', N'rohan123')
INSERT [dbo].[users] ([user_id], [emp_id], [emp_name], [company_name], [username], [password]) VALUES (2, 102, N'Md Anwar', N'iLink Digital', N'anwar123', N'anwar123')
INSERT [dbo].[users] ([user_id], [emp_id], [emp_name], [company_name], [username], [password]) VALUES (3, 103, N'Shivam', N'iLink Digital', N'shivam123', N'shivam123')
GO
USE [master]
GO
ALTER DATABASE [insurance] SET  READ_WRITE 
GO
