USE [master]
GO
/****** Object:  Database [collegeDB]    Script Date: 12/20/2021 7:36:35 PM ******/
CREATE DATABASE [collegeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'collegeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\collegeDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'collegeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\collegeDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [collegeDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [collegeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [collegeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [collegeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [collegeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [collegeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [collegeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [collegeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [collegeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [collegeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [collegeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [collegeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [collegeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [collegeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [collegeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [collegeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [collegeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [collegeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [collegeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [collegeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [collegeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [collegeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [collegeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [collegeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [collegeDB] SET RECOVERY FULL 
GO
ALTER DATABASE [collegeDB] SET  MULTI_USER 
GO
ALTER DATABASE [collegeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [collegeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [collegeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [collegeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [collegeDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [collegeDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'collegeDB', N'ON'
GO
ALTER DATABASE [collegeDB] SET QUERY_STORE = OFF
GO
USE [collegeDB]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/20/2021 7:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [char](8) NOT NULL,
	[CourseTitle] [varchar](50) NOT NULL,
	[Cost] [decimal](6, 2) NULL,
	[Credit_Hours] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CourseTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 12/20/2021 7:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[Stdno] [char](5) NOT NULL,
	[courseID] [char](8) NOT NULL,
	[semesterID] [char](5) NOT NULL,
	[grade] [char](2) NULL,
	[mark] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Stdno] ASC,
	[courseID] ASC,
	[semesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 12/20/2021 7:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[semesterID] [char](5) NOT NULL,
	[semestercode] [int] NULL,
	[semesterYear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[semesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/20/2021 7:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Stdno] [char](5) NOT NULL,
	[Firstname] [varchar](25) NOT NULL,
	[Lastname] [varchar](25) NOT NULL,
	[Depart] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Stdno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((2)) FOR [Credit_Hours]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[Course] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD FOREIGN KEY([semesterID])
REFERENCES [dbo].[Semester] ([semesterID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD FOREIGN KEY([Stdno])
REFERENCES [dbo].[Students] ([Stdno])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD CHECK  (([cost]>=(0)))
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD CHECK  (([Credit_Hours]>=(0) AND [Credit_Hours]<=(200)))
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD CHECK  (([mark]>=(0.00) AND [mark]<=(100.00)))
GO
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD CHECK  (([semestercode]>=(1) AND [semestercode]<=(4)))
GO
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD CHECK  (([semesterYear]>=(2000) AND [semesterYear]<=(9999)))
GO
USE [master]
GO
ALTER DATABASE [collegeDB] SET  READ_WRITE 
GO
INSERT [dbo].[Students] ([Stdno], [Firstname], [Lastname], [Depart]) VALUES (N'S0001', N'Khaled', N'Marwan Ali', N'CS  ')
INSERT [dbo].[Students] ([Stdno], [Firstname], [Lastname], [Depart]) VALUES (N'S0201', N'Mosa', N'Ahmad Majd', N'IT  ')
INSERT [dbo].[Students] ([Stdno], [Firstname], [Lastname], [Depart]) VALUES (N'S0211', N'Alnasser', N'Ameen', N'CS  ')
INSERT [dbo].[Students] ([Stdno], [Firstname], [Lastname], [Depart]) VALUES (N'S0421', N'Mohammad', N'Omar Riyadh', N'IT  ')
INSERT [dbo].[Students] ([Stdno], [Firstname], [Lastname], [Depart]) VALUES (N'S0711', N'Alsaleh', N'Abdulaziz Saleh', N'CS  ')
GO
INSERT [dbo].[Course] ([CourseId], [CourseTitle], [Cost], [Credit_Hours]) VALUES (N'CS1301  ', N'Programming 1', CAST(5000.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[Course] ([CourseId], [CourseTitle], [Cost], [Credit_Hours]) VALUES (N'CS2301  ', N'Programming 2', CAST(7000.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[Course] ([CourseId], [CourseTitle], [Cost], [Credit_Hours]) VALUES (N'CSC152  ', N'C Programming', CAST(8200.50 AS Decimal(6, 2)), 4)
INSERT [dbo].[Course] ([CourseId], [CourseTitle], [Cost], [Credit_Hours]) VALUES (N'CSC153  ', N'Object Oriented Programming', CAST(8480.00 AS Decimal(6, 2)), 4)
INSERT [dbo].[Course] ([CourseId], [CourseTitle], [Cost], [Credit_Hours]) VALUES (N'IS3511  ', N'Database 2', CAST(7530.00 AS Decimal(6, 2)), 2)
INSERT [dbo].[Course] ([CourseId], [CourseTitle], [Cost], [Credit_Hours]) VALUES (N'IT124   ', N'Java Programming', CAST(7680.00 AS Decimal(6, 2)), 3)
INSERT [dbo].[Course] ([CourseId], [CourseTitle], [Cost], [Credit_Hours]) VALUES (N'IT125   ', N'Database 1', CAST(6435.50 AS Decimal(6, 2)), 3)
GO
INSERT [dbo].[Semester] ([semesterID], [semestercode], [semesterYear]) VALUES (N'SM01 ', 1, 2012)
INSERT [dbo].[Semester] ([semesterID], [semestercode], [semesterYear]) VALUES (N'SM02 ', 2, 2012)
INSERT [dbo].[Semester] ([semesterID], [semestercode], [semesterYear]) VALUES (N'SM03 ', 1, 2013)
INSERT [dbo].[Semester] ([semesterID], [semestercode], [semesterYear]) VALUES (N'SM04 ', 2, 2013)
GO
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0001', N'CSC152  ', N'SM02 ', N'A ', CAST(92.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0001', N'IS3511  ', N'SM02 ', N'B+', CAST(80.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0001', N'IT125   ', N'SM01 ', N'A+', CAST(96.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0201', N'CS1301  ', N'SM01 ', N'C ', CAST(70.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0201', N'CS2301  ', N'SM02 ', N'C+', CAST(75.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0201', N'CSC153  ', N'SM01 ', N'D+', CAST(65.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0201', N'IT124   ', N'SM01 ', N'A+', CAST(98.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0201', N'IT125   ', N'SM02 ', N'B+', CAST(87.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0211', N'CSC153  ', N'SM01 ', N'F ', CAST(50.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0421', N'IS3511  ', N'SM03 ', N'D+', CAST(65.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0421', N'IT124   ', N'SM02 ', N'F ', CAST(57.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0421', N'IT125   ', N'SM02 ', N'B ', CAST(84.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0711', N'CSC152  ', N'SM01 ', N'F ', CAST(55.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0711', N'CSC152  ', N'SM03 ', N'C+', CAST(77.00 AS Decimal(4, 2)))
INSERT [dbo].[Register] ([Stdno], [courseID], [semesterID], [grade], [mark]) VALUES (N'S0711', N'IS3511  ', N'SM03 ', N'A+', CAST(95.00 AS Decimal(4, 2)))

select * from Register ;
select * from Course ;
select * from Semester ;
select * from Students ;

select Stdno ,mark from Register
where mark = max(mark);

select Stdno ,mark from Register
where mark = (select max(mark) from Register);



select( Firstname+' '+ Lastname ) as NAME, Depart from Students
where Depart = 'CS'


select * from Students ;
select * from Register ;



