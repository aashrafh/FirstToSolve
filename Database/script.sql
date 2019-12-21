USE [master]
GO
/****** Object:  Database [A4A]    Script Date: 12/21/2019 2:34:51 AM ******/
CREATE DATABASE [A4A]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'A4A', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\A4A.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'A4A_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\A4A_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [A4A] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [A4A].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [A4A] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [A4A] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [A4A] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [A4A] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [A4A] SET ARITHABORT OFF 
GO
ALTER DATABASE [A4A] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [A4A] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [A4A] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [A4A] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [A4A] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [A4A] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [A4A] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [A4A] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [A4A] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [A4A] SET  ENABLE_BROKER 
GO
ALTER DATABASE [A4A] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [A4A] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [A4A] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [A4A] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [A4A] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [A4A] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [A4A] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [A4A] SET RECOVERY FULL 
GO
ALTER DATABASE [A4A] SET  MULTI_USER 
GO
ALTER DATABASE [A4A] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [A4A] SET DB_CHAINING OFF 
GO
ALTER DATABASE [A4A] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [A4A] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [A4A] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'A4A', N'ON'
GO
ALTER DATABASE [A4A] SET QUERY_STORE = OFF
GO
USE [A4A]
GO
/****** Object:  Table [dbo].[_Group]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Group](
	[GroupID] [int] NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[GroupAdmin] [int] NOT NULL,
 CONSTRAINT [PK___Group__149AF30A9461D30B] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_User]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_User](
	[UserID] [int] NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Passowrd] [varchar](50) NOT NULL,
	[Rating] [int] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK___User__1788CCACE8E9381A] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] NOT NULL,
	[BlogTitle] [varchar](50) NOT NULL,
	[BlogWriter] [int] NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK__Blog__149AF30A12F3CDEA] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contest](
	[ContestID] [int] NOT NULL,
	[ContestName] [varchar](50) NOT NULL,
	[ContestDate] [date] NOT NULL,
	[ContestLength] [int] NOT NULL,
	[ContestWriter] [int] NOT NULL,
 CONSTRAINT [PK__Contest__87DE08FAF5810C4A] PRIMARY KEY CLUSTERED 
(
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContestProblems]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContestProblems](
	[ContestID] [int] NOT NULL,
	[ProblemID] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[UserID] [int] NOT NULL,
	[FriendID] [int] NOT NULL,
 CONSTRAINT [PK__Friends__3DA43AFA2C1C95C8] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FriendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupContest]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupContest](
	[GroupID] [int] NOT NULL,
	[ContestID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMembers]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMembers](
	[GroupID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
 CONSTRAINT [PK__GroupMem__8455F7B9EC2CDEE2] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMgrs]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMgrs](
	[MgrID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK__GroupMgr__5FE8A6B8DB76297F] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[MgrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] NOT NULL,
	[OrganizationName] [varchar](50) NOT NULL,
	[AdminID] [int] NOT NULL,
 CONSTRAINT [PK__Organiza__CADB0B7244156978] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrgGroups]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrgGroups](
	[GroupID] [int] NOT NULL,
	[OrgID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[ContestantID] [int] NOT NULL,
	[ContestID] [int] NOT NULL,
 CONSTRAINT [PK__Particip__9798BAEAA12198C7] PRIMARY KEY CLUSTERED 
(
	[ContestantID] ASC,
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problem]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problem](
	[ProblemWriter] [int] NOT NULL,
	[ProblemName] [varchar](50) NOT NULL,
	[ProblemTopic] [varchar](50) NULL,
	[ProblemLink] [varchar](50) NOT NULL,
	[ProblemDifficulty] [int] NULL,
	[ProblemContest] [int] NOT NULL,
	[ProblemID] [varchar](50) NOT NULL,
 CONSTRAINT [pk_Problem_ID] PRIMARY KEY CLUSTERED 
(
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Submission]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submission](
	[SubmissionID] [int] NOT NULL,
	[ContestantID] [int] NOT NULL,
	[SubmissionVerdict] [varchar](50) NOT NULL,
	[SubmissionMemory] [int] NULL,
	[SubmissionTime] [int] NOT NULL,
	[SubmissionDate] [date] NOT NULL,
	[SubmissionLang] [varchar](50) NOT NULL,
	[ProblemID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] NOT NULL,
	[TeamName] [varchar](50) NOT NULL,
	[Rating] [int] NULL,
	[LeaderID] [int] NOT NULL,
 CONSTRAINT [PK__Team__123AE7B9B8BE07DD] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamContest]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamContest](
	[TeamID] [int] NOT NULL,
	[ContestID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC,
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 12/21/2019 2:34:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[MemberID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK__TeamMemb__8DD3E54322DD9530] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[_Group] ([GroupID], [GroupName], [GroupAdmin]) VALUES (1, N'A4A', 2)
INSERT [dbo].[_Group] ([GroupID], [GroupName], [GroupAdmin]) VALUES (2, N'Team2', 1)
INSERT [dbo].[_User] ([UserID], [Fname], [Lname], [Email], [Passowrd], [Rating], [Type]) VALUES (1, N'Ahmed', N'Ashraf', N'aashrafh31@gmail.com', N'123456789', 123456, N'Admin')
INSERT [dbo].[_User] ([UserID], [Fname], [Lname], [Email], [Passowrd], [Rating], [Type]) VALUES (2, N'Dola', N'Rizq', N'adel.m.rizq@gmail.com', N'987654321', 654321, N'Admin')
INSERT [dbo].[_User] ([UserID], [Fname], [Lname], [Email], [Passowrd], [Rating], [Type]) VALUES (3, N'Abdallah', N'Hemdan', N'Hemdan@outlook.com', N'GrandMaster', 0, N'User')
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (1, N'TestContest', CAST(N'2019-05-06' AS Date), 2, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (2, N'DolaContest', CAST(N'2002-02-12' AS Date), 2, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (100, N'CMP Contest 2022', CAST(N'2019-05-22' AS Date), 3, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (101, N'CMP Contest 2021', CAST(N'2018-05-22' AS Date), 5, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (102, N'CMP Contest 2020', CAST(N'2017-05-22' AS Date), 8, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (103, N'CMP Contest 2019', CAST(N'2016-05-22' AS Date), 2, 1)
INSERT [dbo].[Contest] ([ContestID], [ContestName], [ContestDate], [ContestLength], [ContestWriter]) VALUES (104, N'CMP Contest 2018', CAST(N'2015-05-22' AS Date), 5, 1)
INSERT [dbo].[ContestProblems] ([ContestID], [ProblemID]) VALUES (2, N'100A')
INSERT [dbo].[ContestProblems] ([ContestID], [ProblemID]) VALUES (1, N'100A')
INSERT [dbo].[ContestProblems] ([ContestID], [ProblemID]) VALUES (1, N'100B')
INSERT [dbo].[GroupMembers] ([GroupID], [MemberID]) VALUES (1, 2)
INSERT [dbo].[Organization] ([OrganizationID], [OrganizationName], [AdminID]) VALUES (1, N'CUFE', 2)
INSERT [dbo].[Participants] ([ContestantID], [ContestID]) VALUES (1, 2)
INSERT [dbo].[Participants] ([ContestantID], [ContestID]) VALUES (1, 100)
INSERT [dbo].[Participants] ([ContestantID], [ContestID]) VALUES (2, 1)
INSERT [dbo].[Participants] ([ContestantID], [ContestID]) VALUES (2, 2)
INSERT [dbo].[Participants] ([ContestantID], [ContestID]) VALUES (2, 101)
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Carpeting the Room', N'Implementation', N'https://codeforces.s3.amazonaws.com/100A.pdf', 800, 100, N'100A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Friendly Numbers', N'Implementation', N'https://codeforces.s3.amazonaws.com/100B.pdf', 1000, 100, N'100B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'A+B', N'Implementation', N'https://codeforces.s3.amazonaws.com/100C.pdf', 1200, 100, N'100C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'World of Mouth', N'Strings', N'https://codeforces.s3.amazonaws.com/100D.pdf', 1400, 100, N'100D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Lamps in a Line', N'Math', N'https://codeforces.s3.amazonaws.com/100E.pdf', 1600, 100, N'100E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Polynom', N'Implementation', N'https://codeforces.s3.amazonaws.com/100F.pdf', 1800, 100, N'100F')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Name the album', N'Implementation', N'https://codeforces.s3.amazonaws.com/100G.pdf', 2000, 100, N'100G')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Battleship', N'Implementation', N'https://codeforces.s3.amazonaws.com/100H.pdf', 2200, 100, N'100H')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Rotation', N'Geometry', N'https://codeforces.s3.amazonaws.com/100I.pdf', 2400, 100, N'100I')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Interval Coloring', N'Greedy', N'https://codeforces.s3.amazonaws.com/100J.pdf', 2600, 100, N'100J')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Homework', N'Greedy', N'https://codeforces.s3.amazonaws.com/101A.pdf', 800, 101, N'101A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Buses', N'Binary Search', N'https://codeforces.s3.amazonaws.com/101B.pdf', 1000, 101, N'101B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Vectors', N'Implementation', N'https://codeforces.s3.amazonaws.com/101C.pdf', 1200, 101, N'101C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Castle', N'Dynamic Programming', N'https://codeforces.s3.amazonaws.com/101D.pdf', 1400, 101, N'101D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Candies and Stones', N'Divide and Conquer', N'https://codeforces.s3.amazonaws.com/101E.pdf', 1600, 101, N'101E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Clothes', N'Brute Force', N'https://codeforces.s3.amazonaws.com/102A.pdf', 800, 102, N'102A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Sum of Digits', N'Implementation', N'https://codeforces.s3.amazonaws.com/102B.pdf', 1000, 102, N'102B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Homework', N'Greedy', N'https://codeforces.s3.amazonaws.com/102C.pdf', 1200, 102, N'102C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Buses', N'Data Structures', N'https://codeforces.s3.amazonaws.com/102D.pdf', 1400, 102, N'102D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Vectors', N'Implementation', N'https://codeforces.s3.amazonaws.com/102E.pdf', 1600, 102, N'102E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Testing Pants for Sadness', N'Greedy', N'https://codeforces.s3.amazonaws.com/103A.pdf', 800, 103, N'103A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Cthulhu', N'DFS and Similar', N'https://codeforces.s3.amazonaws.com/103B.pdf', 1000, 103, N'103B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Russian Roulette', N'Constructive Algorithm', N'https://codeforces.s3.amazonaws.com/103C.pdf', 1200, 103, N'103C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Time to Raid Cowavans', N'Brute Force', N'https://codeforces.s3.amazonaws.com/103D.pdf', 1400, 103, N'103D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Buying Sets', N'Graphs', N'https://codeforces.s3.amazonaws.com/103E.pdf', 1600, 103, N'103E')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Blackjack', N'Implementation', N'https://codeforces.s3.amazonaws.com/104A.pdf', 800, 104, N'104A')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Testing Pants for Sadness', N'Math', N'https://codeforces.s3.amazonaws.com/104B.pdf', 1000, 104, N'104B')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Cthulhu', N'DSU', N'https://codeforces.s3.amazonaws.com/104C.pdf', 1200, 104, N'104C')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Russian Roulette', N'Math', N'https://codeforces.s3.amazonaws.com/104D.pdf', 1400, 104, N'104D')
INSERT [dbo].[Problem] ([ProblemWriter], [ProblemName], [ProblemTopic], [ProblemLink], [ProblemDifficulty], [ProblemContest], [ProblemID]) VALUES (1, N'Time to Raid Cowavans', N'Implementation', N'https://codeforces.s3.amazonaws.com/104E.pdf', 1600, 104, N'104E')
INSERT [dbo].[Submission] ([SubmissionID], [ContestantID], [SubmissionVerdict], [SubmissionMemory], [SubmissionTime], [SubmissionDate], [SubmissionLang], [ProblemID]) VALUES (52454088, 2, N'OK', 307200, 122, CAST(N'2019-04-07' AS Date), N'GNU C++14', N'102B')
INSERT [dbo].[Team] ([TeamID], [TeamName], [Rating], [LeaderID]) VALUES (1, N'7th floor Dragons', 3200, 2)
/****** Object:  Index [UQ___Group__149AF30B468BD052]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[_Group] ADD  CONSTRAINT [UQ___Group__149AF30B468BD052] UNIQUE NONCLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ___User__1788CCAD0BB5866D]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[_User] ADD  CONSTRAINT [UQ___User__1788CCAD0BB5866D] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ___User__A9D10534F7ACAFFD]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[_User] ADD  CONSTRAINT [UQ___User__A9D10534F7ACAFFD] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Blog__54379E51BE60420B]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [UQ__Blog__54379E51BE60420B] UNIQUE NONCLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Contest__87DE08FB532ACB49]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[Contest] ADD  CONSTRAINT [UQ__Contest__87DE08FB532ACB49] UNIQUE NONCLUSTERED 
(
	[ContestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Organiza__CADB0B73783D4E86]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[Organization] ADD  CONSTRAINT [UQ__Organiza__CADB0B73783D4E86] UNIQUE NONCLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Submissi__449EE104020B2BE9]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[Submission] ADD UNIQUE NONCLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Team__123AE7B8FAD635CC]    Script Date: 12/21/2019 2:34:52 AM ******/
ALTER TABLE [dbo].[Team] ADD  CONSTRAINT [UQ__Team__123AE7B8FAD635CC] UNIQUE NONCLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[_User] ADD  CONSTRAINT [DF___User__Rating__5BE2A6F2]  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Submission] ADD  DEFAULT ((0)) FOR [SubmissionMemory]
GO
ALTER TABLE [dbo].[Team] ADD  CONSTRAINT [DF__Team__Rating__5DCAEF64]  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[_Group]  WITH CHECK ADD  CONSTRAINT [FK___Group__GroupAdm__5EBF139D] FOREIGN KEY([GroupAdmin])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[_Group] CHECK CONSTRAINT [FK___Group__GroupAdm__5EBF139D]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__BlogWriter__5FB337D6] FOREIGN KEY([BlogWriter])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__BlogWriter__5FB337D6]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__GroupID__60A75C0F] FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__GroupID__60A75C0F]
GO
ALTER TABLE [dbo].[Contest]  WITH CHECK ADD  CONSTRAINT [FK__Contest__Contest__619B8048] FOREIGN KEY([ContestWriter])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Contest] CHECK CONSTRAINT [FK__Contest__Contest__619B8048]
GO
ALTER TABLE [dbo].[ContestProblems]  WITH CHECK ADD  CONSTRAINT [FK_ContestProblems_Contest] FOREIGN KEY([ContestID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[ContestProblems] CHECK CONSTRAINT [FK_ContestProblems_Contest]
GO
ALTER TABLE [dbo].[ContestProblems]  WITH CHECK ADD  CONSTRAINT [FK_ContestProblems_Problem] FOREIGN KEY([ProblemID])
REFERENCES [dbo].[Problem] ([ProblemID])
GO
ALTER TABLE [dbo].[ContestProblems] CHECK CONSTRAINT [FK_ContestProblems_Problem]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK__Friends__FriendI__628FA481] FOREIGN KEY([FriendID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK__Friends__FriendI__628FA481]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK__Friends__UserID__6383C8BA] FOREIGN KEY([UserID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK__Friends__UserID__6383C8BA]
GO
ALTER TABLE [dbo].[GroupContest]  WITH CHECK ADD  CONSTRAINT [FK__GroupCont__Conte__6477ECF3] FOREIGN KEY([ContestID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[GroupContest] CHECK CONSTRAINT [FK__GroupCont__Conte__6477ECF3]
GO
ALTER TABLE [dbo].[GroupContest]  WITH CHECK ADD  CONSTRAINT [FK__GroupCont__Group__656C112C] FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[GroupContest] CHECK CONSTRAINT [FK__GroupCont__Group__656C112C]
GO
ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD  CONSTRAINT [FK__GroupMemb__Group__66603565] FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[GroupMembers] CHECK CONSTRAINT [FK__GroupMemb__Group__66603565]
GO
ALTER TABLE [dbo].[GroupMembers]  WITH CHECK ADD  CONSTRAINT [FK__GroupMemb__Membe__6754599E] FOREIGN KEY([MemberID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[GroupMembers] CHECK CONSTRAINT [FK__GroupMemb__Membe__6754599E]
GO
ALTER TABLE [dbo].[GroupMgrs]  WITH CHECK ADD  CONSTRAINT [FK__GroupMgrs__Group__68487DD7] FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[GroupMgrs] CHECK CONSTRAINT [FK__GroupMgrs__Group__68487DD7]
GO
ALTER TABLE [dbo].[GroupMgrs]  WITH CHECK ADD  CONSTRAINT [FK__GroupMgrs__MgrID__693CA210] FOREIGN KEY([MgrID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[GroupMgrs] CHECK CONSTRAINT [FK__GroupMgrs__MgrID__693CA210]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization__User] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization__User]
GO
ALTER TABLE [dbo].[OrgGroups]  WITH CHECK ADD  CONSTRAINT [FK__OrgGroups__Group__6A30C649] FOREIGN KEY([GroupID])
REFERENCES [dbo].[_Group] ([GroupID])
GO
ALTER TABLE [dbo].[OrgGroups] CHECK CONSTRAINT [FK__OrgGroups__Group__6A30C649]
GO
ALTER TABLE [dbo].[OrgGroups]  WITH CHECK ADD  CONSTRAINT [FK__OrgGroups__OrgID__6B24EA82] FOREIGN KEY([OrgID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[OrgGroups] CHECK CONSTRAINT [FK__OrgGroups__OrgID__6B24EA82]
GO
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD  CONSTRAINT [FK__Participa__Conte__6C190EBB] FOREIGN KEY([ContestantID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [FK__Participa__Conte__6C190EBB]
GO
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD  CONSTRAINT [FK__Participa__Conte__6D0D32F4] FOREIGN KEY([ContestID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [FK__Participa__Conte__6D0D32F4]
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD  CONSTRAINT [FK__Problem__Problem__6E01572D] FOREIGN KEY([ProblemContest])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[Problem] CHECK CONSTRAINT [FK__Problem__Problem__6E01572D]
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD  CONSTRAINT [FK__Problem__Problem__6EF57B66] FOREIGN KEY([ProblemWriter])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Problem] CHECK CONSTRAINT [FK__Problem__Problem__6EF57B66]
GO
ALTER TABLE [dbo].[Submission]  WITH CHECK ADD  CONSTRAINT [FK__Submissio__Conte__6FE99F9F] FOREIGN KEY([ContestantID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[Submission] CHECK CONSTRAINT [FK__Submissio__Conte__6FE99F9F]
GO
ALTER TABLE [dbo].[Submission]  WITH CHECK ADD  CONSTRAINT [fK_Problem_ID] FOREIGN KEY([ProblemID])
REFERENCES [dbo].[Problem] ([ProblemID])
GO
ALTER TABLE [dbo].[Submission] CHECK CONSTRAINT [fK_Problem_ID]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team__User] FOREIGN KEY([LeaderID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team__User]
GO
ALTER TABLE [dbo].[TeamContest]  WITH CHECK ADD  CONSTRAINT [FK__TeamConte__Conte__71D1E811] FOREIGN KEY([ContestID])
REFERENCES [dbo].[Contest] ([ContestID])
GO
ALTER TABLE [dbo].[TeamContest] CHECK CONSTRAINT [FK__TeamConte__Conte__71D1E811]
GO
ALTER TABLE [dbo].[TeamContest]  WITH CHECK ADD  CONSTRAINT [FK__TeamConte__TeamI__72C60C4A] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[TeamContest] CHECK CONSTRAINT [FK__TeamConte__TeamI__72C60C4A]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK__TeamMembe__Membe__73BA3083] FOREIGN KEY([MemberID])
REFERENCES [dbo].[_User] ([UserID])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK__TeamMembe__Membe__73BA3083]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK__TeamMembe__TeamI__74AE54BC] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK__TeamMembe__TeamI__74AE54BC]
GO
/****** Object:  StoredProcedure [dbo].[Check_Email_And_Password]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Check_Email_And_Password]
	@Email varchar(50),
	@Password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select _User.UserID from _User
	where Email = @Email and _User.Passowrd = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[Count_Users]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Count_Users]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select COunt(*) from _User
END
GO
/****** Object:  StoredProcedure [dbo].[CountContests]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CountContests]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count(*) from Contest
END
GO
/****** Object:  StoredProcedure [dbo].[CountGroups]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CountGroups]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select COunt(*)
	from _Group
END
GO
/****** Object:  StoredProcedure [dbo].[CountOrgs]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CountOrgs]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count(*) from Organization
END
GO
/****** Object:  StoredProcedure [dbo].[CountSubmissions]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CountSubmissions]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count(*) from Submission
END
GO
/****** Object:  StoredProcedure [dbo].[CountTeams]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CountTeams]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count(*) from Team
END
GO
/****** Object:  StoredProcedure [dbo].[GetProblemNameByID]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProblemNameByID]
	@ProblemID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Problem.ProblemName
	from Problem
	where ProblemID = @ProblemID
END
GO
/****** Object:  StoredProcedure [dbo].[GetSubmissionByID]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSubmissionByID] 
	@SubmissionID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select *
	from Submission
	where SubmissionID = @SubmissionID
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_User]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_User]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@Fname varchar(50),
	@Lname varchar(50),
	@Email varchar(50),
	@Password varchar(50),
	@Rating int,
	@Type varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into _User
	Values(@UserID, @Fname, @Lname, @Email, @Password, @Rating, @Type)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertContest]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertContest]
	-- Add the parameters for the stored procedure here
	@ContestID int,
	@ContestName varchar(50),
	@ContestDate Date,
	@ContestLength int,
	@ContestWriterID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Contest 
	values (@ContestID, @ContestName, @ContestDate, @ContestLength, @ContestWriterID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertContestProblem]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertContestProblem]
	-- Add the parameters for the stored procedure here
	@ContestID int,
	@ProblemID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into ContestProblems 
	values (@ContestID, @ProblemID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFriends]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertFriends]
	@UserID int,
	@FriendID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Friends
	values (@UserID, @FriendID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertGroup]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertGroup]
	@GroupID int,
	@GroupName varchar(50),
	@AdminID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into _Group
	values (@GroupID, @GroupName, @AdminID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertGroupMembers]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertGroupMembers]
	@GroupID int,
	@MemberID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into GroupMembers
	values (@GroupID, @MemberID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrg]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertOrg]
	@OrgID int,
	@OrgName varchar(50),
	@AdminID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Organization
	values (@OrgID, @OrgName, @AdminID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrgGroups]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertOrgGroups]
	@OrgID int,
	@GroupID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into OrgGroups
	values (@GroupID, @OrgID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSubmission]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertSubmission]
	@SubmissionID int,
	@ContestantID int, 
	@SubmissionVerdict varchar(50),
	@SubmissionMemory int,
	@SubmissionTime int,
	@SubmissionDate date,
	@SubmissionLang varchar(50),
	@ProblemID varchar(50)
AS
BEGIN
	insert into Submission
	values (@SubmissionID, @ContestantID, @SubmissionVerdict, @SubmissionMemory, @SubmissionTime, @SubmissionDate, @SubmissionLang, @ProblemID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTeam]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTeam]
	@TeamID int,
	@TeamName varchar(50),
	@Rating int,
	@LeaderID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Team
	values (@TeamID, @TeamName, @Rating, @LeaderID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTeamMembers]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTeamMembers]
	@TeamID int,
	@MemberID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into TeamMembers
	values (@MemberID, @TeamID)
END
GO
/****** Object:  StoredProcedure [dbo].[LoadMyContests]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoadMyContests] 
	-- Add the parameters for the stored procedure here
	@UserID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT C.ContestID, C.ContestDate, C.ContestLength, C.ContestName, C.ContestWriter
	from _User U, Contest C, Participants P
	where U.UserID = p.ContestantID and C.ContestID = P.ContestID and U.UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[Select_All_Orgs]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_All_Orgs]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from Organization
END
GO
/****** Object:  StoredProcedure [dbo].[Select_All_Teams]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_All_Teams]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select * from Team
END
GO
/****** Object:  StoredProcedure [dbo].[Select_All_Users]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_All_Users]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from _User
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Orgs_of_Group]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Orgs_of_Group]
	@GroupID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select OrganizationID, OrganizationName, O.AdminID
	from Organization O, OrgGroups OG
	where O.OrganizationID = OG.OrgID and OG.GroupID = @GroupID
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Teams_of_Member]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Teams_of_Member]
	@MemberID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select t.TeamID, t.TeamName, t.Rating, t.LeaderID 
	from team t, teamMembers tm
	where t.TeamID = tm.TeamID and MemberID = @MemberID
END
GO
/****** Object:  StoredProcedure [dbo].[Select_User_By_ID]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_User_By_ID]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from _User where UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllOfContests]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllOfContests]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Contest
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllOfGroups]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllOfGroups]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from _Group
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllOfGroupsOfUser]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllOfGroupsOfUser]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * 
	from _Group G, GroupMembers GM
	where G.GroupID = GM.GroupID and GM.MemberID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllOfProblems]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectAllOfProblems]
AS
BEGIN
	Select * from Problem;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectContestProblems]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectContestProblems] 
	-- Add the parameters for the stored procedure here
	@ContestID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT P.ProblemID, P.ProblemContest, P.ProblemDifficulty, P.ProblemLink, P.ProblemName, P.ProblemTopic, P.ProblemWriter 
	from Problem P, Contest C, ContestProblems CP
	where P.ProblemID = cp.ProblemID and C.ContestID = cp.ContestID and C.ContestID = @ContestID
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUserNameByID]    Script Date: 12/21/2019 2:34:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectUserNameByID] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Fname, Lname 
	from _User
	where @UserID = USERID
END
GO
USE [master]
GO
ALTER DATABASE [A4A] SET  READ_WRITE 
GO
