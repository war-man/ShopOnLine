USE [master]
GO
/****** Object:  Database [C.ShopOnline]    Script Date: 5/27/2019 5:20:30 PM ******/
CREATE DATABASE [C.ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'C.ShopOnline', FILENAME = N'F:\DoAnTotNghiep\Documents\Database\C.ShopOnline.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'C.ShopOnline_log', FILENAME = N'F:\DoAnTotNghiep\Documents\Database\C.ShopOnline_log.ldf' , SIZE = 112320KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [C.ShopOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [C.ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [C.ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [C.ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [C.ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [C.ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [C.ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [C.ShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [C.ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [C.ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [C.ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [C.ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [C.ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [C.ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [C.ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [C.ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [C.ShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [C.ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [C.ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [C.ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [C.ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [C.ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [C.ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [C.ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [C.ShopOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [C.ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [C.ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [C.ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [C.ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [C.ShopOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [C.ShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'C.ShopOnline', N'ON'
GO
USE [C.ShopOnline]
GO
/****** Object:  Table [dbo].[landDistrict]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landDistrict](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Type] [nvarchar](50) NULL,
	[ProvinceId] [int] NOT NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[landProvince]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landProvince](
	[ProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Type] [nvarchar](20) NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[landQuanHuyen]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landQuanHuyen](
	[ID_Quan] [int] NOT NULL,
	[TenQuan] [nvarchar](100) NULL,
	[ID_Tinh] [int] NOT NULL,
 CONSTRAINT [PK__QuanHuye__9BF5CD2D2A843F54] PRIMARY KEY CLUSTERED 
(
	[ID_Quan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[landTinhThanh]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landTinhThanh](
	[ID_Tinh] [int] NOT NULL,
	[TenTinh] [nvarchar](100) NULL,
	[ID_KhuVuc] [int] NULL,
 CONSTRAINT [PK__TinhThan__D34E76D13F633CBA] PRIMARY KEY CLUSTERED 
(
	[ID_Tinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhieuNhap]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhieuNhap](
	[LoaiPhieuNhapId] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiPhieuNhap] [nvarchar](250) NULL,
	[LoaiPhieuNhapXuat] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_LoaiPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[LoaiPhieuNhapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtDepartments]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtDepartments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Fax] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[UnitId] [int] NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtPositions]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtPositions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](250) NULL,
	[Code] [nvarchar](250) NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtRoles]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtRoles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](20) NULL,
	[RoleName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDete] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtSubstitute]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtSubstitute](
	[SubstituteId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[AppName] [nvarchar](250) NULL,
	[AppCode] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Substitute] PRIMARY KEY CLUSTERED 
(
	[SubstituteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtSubstituteDetail]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtSubstituteDetail](
	[SubstituteDetailId] [int] IDENTITY(1,1) NOT NULL,
	[SubstituteId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_SubstituteDetail] PRIMARY KEY CLUSTERED 
(
	[SubstituteDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtUnitManager]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtUnitManager](
	[UnitManagerId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UnitId] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_UnitManager] PRIMARY KEY CLUSTERED 
(
	[UnitManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtUnits]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtUnits](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[UnitCode] [nvarchar](250) NULL,
	[ParentId] [int] NULL,
	[LevelCode] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
	[Email] [nvarchar](250) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtUserConfig]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtUserConfig](
	[UserConfigId] [int] IDENTITY(1,1) NOT NULL,
	[UnitId] [int] NULL,
	[AppName] [nvarchar](250) NULL,
	[AppCode] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_qtUserConfig] PRIMARY KEY CLUSTERED 
(
	[UserConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtUserConfigDetail]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtUserConfigDetail](
	[UserConfigDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserConfigId] [int] NULL,
	[UserId] [int] NULL,
	[OrderBy] [int] NULL,
 CONSTRAINT [PK_qtUserConfigDetail] PRIMARY KEY CLUSTERED 
(
	[UserConfigDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtUserRole]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtUserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[UnitId] [int] NULL,
	[DepartmentId] [int] NULL,
	[PositionId] [int] NULL,
	[Application] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qtUsers]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qtUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserLogin] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
	[ImageFile] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Sex] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[IsAdmin] [bit] NULL,
	[Notes] [nvarchar](500) NULL,
	[UnitId] [int] NULL,
	[DepartmentId] [int] NULL,
	[PositionId] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shAboutus]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shAboutus](
	[AboutGuid] [nvarchar](50) NOT NULL,
	[AboutId] [int] IDENTITY(1,1) NOT NULL,
	[AboutTitle] [nvarchar](2000) NULL,
	[MetaTitle] [nvarchar](500) NULL,
	[AboutName] [nvarchar](4000) NULL,
	[AboutContent] [ntext] NULL,
	[Year] [int] NULL,
	[Sign] [ntext] NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[ParentId] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_AboutUs] PRIMARY KEY CLUSTERED 
(
	[AboutGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shAgent]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shAgent](
	[AgentGuid] [nvarchar](50) NOT NULL,
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](250) NULL,
	[AgentAddress] [nvarchar](2000) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[Website] [nvarchar](250) NULL,
	[Url] [nvarchar](500) NULL,
	[ProvinceId] [int] NULL,
	[DistrictId] [int] NULL,
	[Longitude] [nvarchar](100) NULL,
	[Latitude] [nvarchar](100) NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_shAgent] PRIMARY KEY CLUSTERED 
(
	[AgentGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shBanner]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shBanner](
	[BannerGuid] [nvarchar](50) NOT NULL,
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[BannerName] [nvarchar](500) NULL,
	[Url] [nvarchar](250) NULL,
	[PositionBanner] [int] NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_shBanner] PRIMARY KEY CLUSTERED 
(
	[BannerGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shCategory]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shCategory](
	[CategoryGuid] [nvarchar](50) NOT NULL,
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[SortOrder] [int] NULL,
	[SortOrderHighLight] [int] NULL,
	[TopHot] [bit] NULL,
	[FileName] [nvarchar](250) NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_shCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shCategoryImage]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shCategoryImage](
	[CategoryImageGuid] [nvarchar](50) NOT NULL,
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryGuid] [nvarchar](50) NULL,
	[FileName] [nvarchar](250) NULL,
	[FileNameGoc] [nvarchar](250) NULL,
	[Image] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_CategoryImage] PRIMARY KEY CLUSTERED 
(
	[CategoryImageGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shColor]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shColor](
	[ColorGuid] [nvarchar](50) NOT NULL,
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shColor] PRIMARY KEY CLUSTERED 
(
	[ColorGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shComments]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shComments](
	[CommentGuid] [nvarchar](50) NOT NULL,
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[MemberGuiId] [nvarchar](50) NULL,
	[ProductGuid] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[MemberName] [nvarchar](500) NULL,
	[Rating] [int] NULL,
	[Contents] [nvarchar](4000) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[LaDaXem] [bit] NULL,
 CONSTRAINT [PK_shComments] PRIMARY KEY CLUSTERED 
(
	[CommentGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shGoodReceiptIsuue]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shGoodReceiptIsuue](
	[ReceiptIsuueGuid] [nvarchar](50) NOT NULL,
	[ReceiptIssueId] [int] IDENTITY(1,1) NOT NULL,
	[Phieu] [int] NULL,
	[ReceiptIsuueName] [nvarchar](250) NULL,
	[SKU] [nvarchar](50) NULL,
	[MaKho] [int] NULL,
	[TenKho] [nvarchar](500) NULL,
	[LoaiPhieu] [int] NULL,
	[MaDonHang] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](2000) NULL,
	[UserId] [int] NULL,
	[TrangThai] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shGoodReceiptIsuue] PRIMARY KEY CLUSTERED 
(
	[ReceiptIsuueGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shGoodReceiptIsuueDetail]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shGoodReceiptIsuueDetail](
	[ReceiptIsuueDetailGuid] [nvarchar](50) NOT NULL,
	[ReceiptIsuueDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptIsuueGuid] [nvarchar](50) NULL,
	[ProductGuid] [nvarchar](50) NULL,
	[SectionGuid] [nvarchar](50) NULL,
	[SizeGuid] [nvarchar](50) NULL,
	[Number] [int] NULL,
	[Phieu] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shGoodReceiptIsuueDetail] PRIMARY KEY CLUSTERED 
(
	[ReceiptIsuueDetailGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shIdeaCustomer]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shIdeaCustomer](
	[IdeaGuid] [nvarchar](50) NOT NULL,
	[IdeaId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Contents] [nvarchar](2000) NULL,
	[Image] [nvarchar](500) NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_IdeaCustomer] PRIMARY KEY CLUSTERED 
(
	[IdeaGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shMembers]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shMembers](
	[MemberGuiId] [nvarchar](50) NOT NULL,
	[MemberId] [int] NOT NULL,
	[MemberName] [nvarchar](250) NULL,
	[MemberLogin] [nvarchar](250) NULL,
	[Password] [nvarchar](50) NULL,
	[ImageFile] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Sex] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[Phone] [nvarchar](50) NULL,
	[Notes] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[LaDaXem] [bit] NULL,
 CONSTRAINT [PK_shMembers] PRIMARY KEY CLUSTERED 
(
	[MemberGuiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shNews]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shNews](
	[NewGuiId] [nvarchar](50) NOT NULL,
	[NewId] [int] IDENTITY(1,1) NOT NULL,
	[TitleNew] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Descriptions] [nvarchar](4000) NULL,
	[ImageFile] [nvarchar](250) NULL,
	[Summary] [nvarchar](4000) NULL,
	[Contents] [ntext] NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_shNews] PRIMARY KEY CLUSTERED 
(
	[NewGuiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shOrder]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shOrder](
	[OrderGuid] [nvarchar](50) NOT NULL,
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](1000) NULL,
	[MemberGuid] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Total] [money] NULL,
	[OrderStatus] [int] NULL,
	[SortOrder] [int] NULL,
	[DistrictId] [int] NULL,
	[ProvinceId] [int] NULL,
	[FeeShip] [money] NULL,
	[PayType] [int] NULL,
	[NgayDat] [datetime] NULL,
	[LaDaXem] [bit] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shOrder] PRIMARY KEY CLUSTERED 
(
	[OrderGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shOrderDetail]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shOrderDetail](
	[OrderDetailGuid] [nvarchar](50) NOT NULL,
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailName] [nvarchar](50) NULL,
	[OrderGuid] [nvarchar](50) NULL,
	[MemberGuiId] [nvarchar](50) NULL,
	[ProductGuid] [nvarchar](50) NULL,
	[ProductName] [nvarchar](250) NULL,
	[SectionGuid] [nvarchar](50) NULL,
	[SizeGuid] [nvarchar](50) NULL,
	[Number] [int] NULL,
	[Prices] [money] NULL,
	[Total] [money] NULL,
	[PayType] [int] NULL,
	[SortOrder] [int] NULL,
	[NgayDat] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shCartName] PRIMARY KEY CLUSTERED 
(
	[OrderDetailGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shOrderHistory]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shOrderHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderGuid] [nvarchar](50) NULL,
	[OrderStatus] [int] NULL,
	[Description] [nvarchar](2000) NULL,
	[MemberGuid] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shOrderHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shPrices]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shPrices](
	[PriceGuid] [nvarchar](50) NOT NULL,
	[PriceId] [int] IDENTITY(1,1) NOT NULL,
	[ProductGuid] [nvarchar](50) NULL,
	[SectionGuid] [nvarchar](50) NULL,
	[SizeGuid] [nvarchar](50) NULL,
	[PriceName] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Money] [money] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shPrices] PRIMARY KEY CLUSTERED 
(
	[PriceGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shProductImage]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shProductImage](
	[ProductImageGuid] [nvarchar](50) NOT NULL,
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductGuid] [nvarchar](50) NULL,
	[FileName] [nvarchar](250) NULL,
	[FileNameGoc] [nvarchar](250) NULL,
	[ProductImageCategory] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shProducts]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shProducts](
	[ProductGuid] [nvarchar](50) NOT NULL,
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryGuid] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](250) NULL,
	[ProductName] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](2000) NULL,
	[Image] [nvarchar](250) NULL,
	[Details] [nvarchar](2000) NULL,
	[UserManual] [ntext] NULL,
	[CompleteSetInclude] [nvarchar](2000) NULL,
	[PriceCurrent] [money] NULL,
	[PercentCurrent] [int] NULL,
	[PriceAfterPercents] [money] NULL,
	[ViewsProduct] [int] NULL,
	[ProductStatus] [int] NULL,
	[TopHot] [bit] NULL,
	[SortOrder] [int] NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Number] [int] NULL,
	[Inventory] [int] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shProducts] PRIMARY KEY CLUSTERED 
(
	[ProductGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shProductSet]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shProductSet](
	[SectionGuid] [nvarchar](50) NOT NULL,
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[ProductGuid] [nvarchar](50) NULL,
	[SectionName] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[ParentId] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
	[Number] [int] NULL,
	[Inventory] [int] NULL,
	[ItemStatus] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shSection] PRIMARY KEY CLUSTERED 
(
	[SectionGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shSale]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shSale](
	[SaleGuid] [nvarchar](50) NOT NULL,
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[SaleDetailGuid] [nvarchar](50) NULL,
	[SaleName] [nvarchar](500) NULL,
	[SaleCode] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[CachTinhGiaTriKhuyenMai] [int] NULL,
	[GiaTri] [nvarchar](500) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[DieuKienApDung] [int] NULL,
	[SaleStatus] [int] NULL,
	[UserId] [int] NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shSale] PRIMARY KEY CLUSTERED 
(
	[SaleGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shSaleDetail]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shSaleDetail](
	[SaleDetailGuid] [nvarchar](50) NOT NULL,
	[SaleDetailId] [int] IDENTITY(1,1) NOT NULL,
	[SaleGuid] [nvarchar](50) NULL,
	[CachTinhGiaTriKhuyenMai] [int] NULL,
	[GiaTri] [nvarchar](500) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DieuKienApDung] [int] NULL,
	[MaCauHinh] [nvarchar](50) NULL,
	[CategoryGuidProductGuid] [nvarchar](50) NULL,
	[CategoryGuid] [nvarchar](50) NULL,
	[ProductGuid] [nvarchar](50) NULL,
	[Percents] [int] NULL,
	[Description] [nvarchar](4000) NULL,
	[Notes] [nvarchar](4000) NULL,
	[PriceAfterPercents] [money] NULL,
	[SaleAttach] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shSaleDetail_1] PRIMARY KEY CLUSTERED 
(
	[SaleDetailGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shSetSize]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shSetSize](
	[SizeGuid] [nvarchar](50) NOT NULL,
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductGuid] [nvarchar](50) NULL,
	[SectionGuid] [nvarchar](50) NULL,
	[SizeName] [nvarchar](50) NULL,
	[PriceCurrent] [money] NULL,
	[Stuff] [nvarchar](50) NULL,
	[ParentId] [nvarchar](50) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[PercentCurrent] [int] NULL,
	[PriceAfterPercents] [money] NULL,
	[Number] [int] NULL,
	[Inventory] [int] NULL,
	[SizeStatus] [int] NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_shColor_Size] PRIMARY KEY CLUSTERED 
(
	[SizeGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shSex]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shSex](
	[SexGuid] [nvarchar](50) NOT NULL,
	[SexId] [int] IDENTITY(1,1) NOT NULL,
	[SexName] [nvarchar](25) NULL,
 CONSTRAINT [PK_shSex] PRIMARY KEY CLUSTERED 
(
	[SexGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[ThongBaoId] [int] IDENTITY(1,1) NOT NULL,
	[NoiDungThongBao] [nvarchar](1000) NULL,
	[NoiDungCongViec] [nvarchar](1000) NULL,
	[LienKet] [nvarchar](1000) NULL,
	[OrderGuid] [nvarchar](50) NULL,
	[MaLoaiThongBao] [nvarchar](50) NULL,
	[NguoiThongBaoID] [int] NULL,
	[NguoiNhanThongBaoId] [int] NULL,
	[ThoiGian] [datetime] NULL,
	[DaXem] [bit] NULL,
	[GiaTri] [int] NULL,
 CONSTRAINT [PK_ThongBao] PRIMARY KEY CLUSTERED 
(
	[ThongBaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[landDistrict] ON 

INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (1, N'Ba Đình', N'Quận', 1, 1)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (2, N'Hoàn Kiếm', N'Quận', 1, 2)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (3, N'Tây Hồ', N'Quận', 1, 3)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (4, N'Long Biên', N'Quận', 1, 4)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (5, N'Cầu Giấy', N'Quận', 1, 5)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (6, N'Đống Đa', N'Quận', 1, 6)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (7, N'Hai Bà Trưng', N'Quận', 1, 7)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (8, N'Hoàng Mai', N'Quận', 1, 8)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (9, N'Thanh Xuân', N'Quận', 1, 9)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (16, N'Sóc Sơn', N'Huyện', 1, 12)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (17, N'Đông Anh', N'Huyện', 1, 13)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (18, N'Gia Lâm', N'Huyện', 1, 14)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (19, N'Từ Liêm', N'Huyện', 1, 15)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (20, N'Thanh Trì', N'Huyện', 1, 16)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (24, N'Hà Giang', N'Thị Xã', 2, 30)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (26, N'Đồng Văn', N'Huyện', 2, 31)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (27, N'Mèo Vạc', N'Huyện', 2, 32)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (28, N'Yên Minh', N'Huyện', 2, 33)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (29, N'Quản Bạ', N'Huyện', 2, 34)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (30, N'Vị Xuyên', N'Huyện', 2, 35)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (31, N'Bắc Mê', N'Huyện', 2, 36)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (32, N'Hoàng Su Phì', N'Huyện', 2, 37)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (33, N'Xín Mần', N'Huyện', 2, 38)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (34, N'Bắc Quang', N'Huyện', 2, 39)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (35, N'Quang Bình', N'Huyện', 2, 40)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (40, N'Cao Bằng', N'Thị Xã', 4, 41)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (42, N'Bảo Lâm', N'Huyện', 4, 42)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (43, N'Bảo Lạc', N'Huyện', 4, 43)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (44, N'Thông Nông', N'Huyện', 4, 44)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (45, N'Hà Quảng', N'Huyện', 4, 45)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (46, N'Trà Lĩnh', N'Huyện', 4, 46)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (47, N'Trùng Khánh', N'Huyện', 4, 47)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (48, N'Hạ Lang', N'Huyện', 4, 48)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (49, N'Quảng Uyên', N'Huyện', 4, 49)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (50, N'Phục Hoà', N'Huyện', 4, 50)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (51, N'Hoà An', N'Huyện', 4, 51)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (52, N'Nguyên Bình', N'Huyện', 4, 52)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (53, N'Thạch An', N'Huyện', 4, 53)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (58, N'Bắc Kạn', N'Thị Xã', 6, 54)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (60, N'Pác Nặm', N'Huyện', 6, 55)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (61, N'Ba Bể', N'Huyện', 6, 56)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (62, N'Ngân Sơn', N'Huyện', 6, 57)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (63, N'Bạch Thông', N'Huyện', 6, 58)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (64, N'Chợ Đồn', N'Huyện', 6, 59)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (65, N'Chợ Mới', N'Huyện', 6, 60)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (66, N'Na Rì', N'Huyện', 6, 61)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (70, N'Tuyên Quang', N'Thị Xã', 8, 62)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (72, N'Nà Hang', N'Huyện', 8, 63)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (73, N'Chiêm Hóa', N'Huyện', 8, 64)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (74, N'Hàm Yên', N'Huyện', 8, 65)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (75, N'Yên Sơn', N'Huyện', 8, 66)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (76, N'Sơn Dương', N'Huyện', 8, 67)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (80, N'Lào Cai', N'Thành Phố', 10, 68)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (82, N'Bát Xát', N'Huyện', 10, 69)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (83, N'Mường Khương', N'Huyện', 10, 70)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (84, N'Si Ma Cai', N'Huyện', 10, 71)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (85, N'Bắc Hà', N'Huyện', 10, 72)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (86, N'Bảo Thắng', N'Huyện', 10, 73)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (87, N'Bảo Yên', N'Huyện', 10, 74)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (88, N'Sa Pa', N'Huyện', 10, 75)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (89, N'Văn Bàn', N'Huyện', 10, 76)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (94, N'Điện Biên Phủ', N'Thành Phố', 11, 77)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (95, N'Mường Lay', N'Thị Xã', 11, 78)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (96, N'Mường Nhé', N'Huyện', 11, 79)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (97, N'Mường Chà', N'Huyện', 11, 80)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (98, N'Tủa Chùa', N'Huyện', 11, 81)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (99, N'Tuần Giáo', N'Huyện', 11, 82)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (100, N'Điện Biên', N'Huyện', 11, 83)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (101, N'Điện Biên Đông', N'Huyện', 11, 84)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (102, N'Mường Ảng', N'Huyện', 11, 85)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (104, N'Lai Châu', N'Thị Xã', 12, 86)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (106, N'Tam Đường', N'Huyện', 12, 87)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (107, N'Mường Tè', N'Huyện', 12, 88)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (108, N'Sìn Hồ', N'Huyện', 12, 89)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (109, N'Phong Thổ', N'Huyện', 12, 90)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (110, N'Than Uyên', N'Huyện', 12, 91)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (111, N'Tân Uyên', N'Huyện', 12, 92)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (116, N'Sơn La', N'Thành Phố', 14, 93)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (118, N'Quỳnh Nhai', N'Huyện', 14, 94)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (119, N'Thuận Châu', N'Huyện', 14, 95)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (120, N'Mường La', N'Huyện', 14, 96)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (121, N'Bắc Yên', N'Huyện', 14, 97)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (122, N'Phù Yên', N'Huyện', 14, 98)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (123, N'Mộc Châu', N'Huyện', 14, 99)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (124, N'Yên Châu', N'Huyện', 14, 100)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (125, N'Mai Sơn', N'Huyện', 14, 101)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (126, N'Sông Mã', N'Huyện', 14, 102)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (127, N'Sốp Cộp', N'Huyện', 14, 103)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (132, N'Yên Bái', N'Thành Phố', 15, 104)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (133, N'Nghĩa Lộ', N'Thị Xã', 15, 105)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (135, N'Lục Yên', N'Huyện', 15, 106)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (136, N'Văn Yên', N'Huyện', 15, 107)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (137, N'Mù Cang Chải', N'Huyện', 15, 108)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (138, N'Trấn Yên', N'Huyện', 15, 109)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (139, N'Trạm Tấu', N'Huyện', 15, 110)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (140, N'Văn Chấn', N'Huyện', 15, 111)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (141, N'Yên Bình', N'Huyện', 15, 112)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (148, N'Hòa Bình', N'Thành Phố', 17, 113)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (150, N'Đà Bắc', N'Huyện', 17, 114)
GO
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (151, N'Kỳ Sơn', N'Huyện', 17, 115)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (152, N'Lương Sơn', N'Huyện', 17, 116)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (153, N'Kim Bôi', N'Huyện', 17, 117)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (154, N'Cao Phong', N'Huyện', 17, 118)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (155, N'Tân Lạc', N'Huyện', 17, 119)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (156, N'Mai Châu', N'Huyện', 17, 120)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (157, N'Lạc Sơn', N'Huyện', 17, 121)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (158, N'Yên Thủy', N'Huyện', 17, 122)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (159, N'Lạc Thủy', N'Huyện', 17, 123)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (164, N'Thái Nguyên', N'Thành Phố', 19, 124)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (165, N'Sông Công', N'Thị Xã', 19, 125)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (167, N'Định Hóa', N'Huyện', 19, 126)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (168, N'Phú Lương', N'Huyện', 19, 127)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (169, N'Đồng Hỷ', N'Huyện', 19, 128)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (170, N'Võ Nhai', N'Huyện', 19, 129)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (171, N'Đại Từ', N'Huyện', 19, 130)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (172, N'Phổ Yên', N'Huyện', 19, 131)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (173, N'Phú Bình', N'Huyện', 19, 132)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (178, N'Lạng Sơn', N'Thành Phố', 20, 133)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (180, N'Tràng Định', N'Huyện', 20, 134)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (181, N'Bình Gia', N'Huyện', 20, 135)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (182, N'Văn Lãng', N'Huyện', 20, 136)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (183, N'Cao Lộc', N'Huyện', 20, 137)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (184, N'Văn Quan', N'Huyện', 20, 138)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (185, N'Bắc Sơn', N'Huyện', 20, 139)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (186, N'Hữu Lũng', N'Huyện', 20, 140)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (187, N'Chi Lăng', N'Huyện', 20, 141)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (188, N'Lộc Bình', N'Huyện', 20, 142)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (189, N'Đình Lập', N'Huyện', 20, 143)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (193, N'Hạ Long', N'Thành Phố', 22, 144)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (194, N'Móng Cái', N'Thành Phố', 22, 145)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (195, N'Cẩm Phả', N'Thị Xã', 22, 146)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (196, N'Uông Bí', N'Thị Xã', 22, 147)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (198, N'Bình Liêu', N'Huyện', 22, 148)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (199, N'Tiên Yên', N'Huyện', 22, 149)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (200, N'Đầm Hà', N'Huyện', 22, 150)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (201, N'Hải Hà', N'Huyện', 22, 151)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (202, N'Ba Chẽ', N'Huyện', 22, 152)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (203, N'Vân Đồn', N'Huyện', 22, 153)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (204, N'Hoành Bồ', N'Huyện', 22, 154)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (205, N'Đông Triều', N'Huyện', 22, 155)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (206, N'Yên Hưng', N'Huyện', 22, 156)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (207, N'Cô Tô', N'Huyện', 22, 157)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (213, N'Bắc Giang', N'Thành Phố', 24, 158)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (215, N'Yên Thế', N'Huyện', 24, 159)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (216, N'Tân Yên', N'Huyện', 24, 160)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (217, N'Lạng Giang', N'Huyện', 24, 161)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (218, N'Lục Nam', N'Huyện', 24, 162)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (219, N'Lục Ngạn', N'Huyện', 24, 163)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (220, N'Sơn Động', N'Huyện', 24, 164)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (221, N'Yên Dũng', N'Huyện', 24, 165)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (222, N'Việt Yên', N'Huyện', 24, 166)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (223, N'Hiệp Hòa', N'Huyện', 24, 167)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (227, N'Việt Trì', N'Thành Phố', 25, 168)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (228, N'Phú Thọ', N'Thị Xã', 25, 169)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (230, N'Đoan Hùng', N'Huyện', 25, 170)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (231, N'Hạ Hoà', N'Huyện', 25, 171)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (232, N'Thanh Ba', N'Huyện', 25, 172)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (233, N'Phù Ninh', N'Huyện', 25, 173)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (234, N'Yên Lập', N'Huyện', 25, 174)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (235, N'Cẩm Khê', N'Huyện', 25, 175)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (236, N'Tam Nông', N'Huyện', 25, 176)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (237, N'Lâm Thao', N'Huyện', 25, 177)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (238, N'Thanh Sơn', N'Huyện', 25, 178)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (239, N'Thanh Thuỷ', N'Huyện', 25, 179)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (240, N'Tân Sơn', N'Huyện', 25, 180)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (243, N'Vĩnh Yên', N'Thành Phố', 26, 181)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (244, N'Phúc Yên', N'Thị Xã', 26, 182)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (246, N'Lập Thạch', N'Huyện', 26, 183)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (247, N'Tam Dương', N'Huyện', 26, 184)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (248, N'Tam Đảo', N'Huyện', 26, 185)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (249, N'Bình Xuyên', N'Huyện', 26, 186)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (250, N'Mê Linh', N'Huyện', 1, 17)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (251, N'Yên Lạc', N'Huyện', 26, 187)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (252, N'Vĩnh Tường', N'Huyện', 26, 188)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (253, N'Sông Lô', N'Huyện', 26, 189)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (256, N'Bắc Ninh', N'Thành Phố', 27, 190)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (258, N'Yên Phong', N'Huyện', 27, 192)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (259, N'Quế Võ', N'Huyện', 27, 193)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (260, N'Tiên Du', N'Huyện', 27, 194)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (261, N'Từ Sơn', N'Thị Xã', 27, 191)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (262, N'Thuận Thành', N'Huyện', 27, 195)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (263, N'Gia Bình', N'Huyện', 27, 196)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (264, N'Lương Tài', N'Huyện', 27, 197)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (268, N'Hà Đông', N'Quận', 1, 10)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (269, N'Sơn Tây', N'Thị Xã', 1, 11)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (271, N'Ba Vì', N'Huyện', 1, 18)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (272, N'Phúc Thọ', N'Huyện', 1, 19)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (273, N'Đan Phượng', N'Huyện', 1, 20)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (274, N'Hoài Đức', N'Huyện', 1, 21)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (275, N'Quốc Oai', N'Huyện', 1, 22)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (276, N'Thạch Thất', N'Huyện', 1, 23)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (277, N'Chương Mỹ', N'Huyện', 1, 24)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (278, N'Thanh Oai', N'Huyện', 1, 25)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (279, N'Thường Tín', N'Huyện', 1, 26)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (280, N'Phú Xuyên', N'Huyện', 1, 27)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (281, N'Ứng Hòa', N'Huyện', 1, 28)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (282, N'Mỹ Đức', N'Huyện', 1, 29)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (288, N'Hải Dương', N'Thành Phố', 30, 198)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (290, N'Chí Linh', N'Huyện', 30, 199)
GO
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (291, N'Nam Sách', N'Huyện', 30, 200)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (292, N'Kinh Môn', N'Huyện', 30, 201)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (293, N'Kim Thành', N'Huyện', 30, 202)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (294, N'Thanh Hà', N'Huyện', 30, 203)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (295, N'Cẩm Giàng', N'Huyện', 30, 204)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (296, N'Bình Giang', N'Huyện', 30, 205)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (297, N'Gia Lộc', N'Huyện', 30, 206)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (298, N'Tứ Kỳ', N'Huyện', 30, 207)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (299, N'Ninh Giang', N'Huyện', 30, 208)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (300, N'Thanh Miện', N'Huyện', 30, 209)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (303, N'Hồng Bàng', N'Quận', 31, 210)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (304, N'Ngô Quyền', N'Quận', 31, 211)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (305, N'Lê Chân', N'Quận', 31, 212)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (306, N'Hải An', N'Quận', 31, 213)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (307, N'Kiến An', N'Quận', 31, 214)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (308, N'Đồ Sơn', N'Quận', 31, 215)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (309, N'Kinh Dương', N'Quận', 31, 216)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (311, N'Thuỷ Nguyên', N'Huyện', 31, 217)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (312, N'An Dương', N'Huyện', 31, 218)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (313, N'An Lão', N'Huyện', 31, 219)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (314, N'Kiến Thụy', N'Huyện', 31, 220)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (315, N'Tiên Lãng', N'Huyện', 31, 221)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (316, N'Vĩnh Bảo', N'Huyện', 31, 222)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (317, N'Cát Hải', N'Huyện', 31, 223)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (318, N'Bạch Long Vĩ', N'Huyện', 31, 224)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (323, N'Hưng Yên', N'Thành Phố', 33, 225)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (325, N'Văn Lâm', N'Huyện', 33, 226)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (326, N'Văn Giang', N'Huyện', 33, 227)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (327, N'Yên Mỹ', N'Huyện', 33, 228)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (328, N'Mỹ Hào', N'Huyện', 33, 229)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (329, N'Ân Thi', N'Huyện', 33, 230)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (330, N'Khoái Châu', N'Huyện', 33, 231)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (331, N'Kim Động', N'Huyện', 33, 232)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (332, N'Tiên Lữ', N'Huyện', 33, 233)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (333, N'Phù Cừ', N'Huyện', 33, 234)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (336, N'Thái Bình', N'Thành Phố', 34, 235)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (338, N'Quỳnh Phụ', N'Huyện', 34, 236)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (339, N'Hưng Hà', N'Huyện', 34, 237)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (340, N'Đông Hưng', N'Huyện', 34, 238)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (341, N'Thái Thụy', N'Huyện', 34, 239)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (342, N'Tiền Hải', N'Huyện', 34, 240)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (343, N'Kiến Xương', N'Huyện', 34, 241)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (344, N'Vũ Thư', N'Huyện', 34, 242)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (347, N'Phủ Lý', N'Thành Phố', 35, 243)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (349, N'Duy Tiên', N'Huyện', 35, 244)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (350, N'Kim Bảng', N'Huyện', 35, 245)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (351, N'Thanh Liêm', N'Huyện', 35, 246)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (352, N'Bình Lục', N'Huyện', 35, 247)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (353, N'Lý Nhân', N'Huyện', 35, 248)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (356, N'Nam Định', N'Thành Phố', 36, 249)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (358, N'Mỹ Lộc', N'Huyện', 36, 250)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (359, N'Vụ Bản', N'Huyện', 36, 251)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (360, N'Ý Yên', N'Huyện', 36, 252)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (361, N'Nghĩa Hưng', N'Huyện', 36, 253)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (362, N'Nam Trực', N'Huyện', 36, 254)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (363, N'Trực Ninh', N'Huyện', 36, 255)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (364, N'Xuân Trường', N'Huyện', 36, 256)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (365, N'Giao Thủy', N'Huyện', 36, 257)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (366, N'Hải Hậu', N'Huyện', 36, 258)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (369, N'Ninh Bình', N'Thành Phố', 37, 259)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (370, N'Tam Điệp', N'Thị Xã', 37, 260)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (372, N'Nho Quan', N'Huyện', 37, 261)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (373, N'Gia Viễn', N'Huyện', 37, 262)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (374, N'Hoa Lư', N'Huyện', 37, 263)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (375, N'Yên Khánh', N'Huyện', 37, 264)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (376, N'Kim Sơn', N'Huyện', 37, 265)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (377, N'Yên Mô', N'Huyện', 37, 266)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (380, N'Thanh Hóa', N'Thành Phố', 38, 267)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (381, N'Bỉm Sơn', N'Thị Xã', 38, 268)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (382, N'Sầm Sơn', N'Thị Xã', 38, 269)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (384, N'Mường Lát', N'Huyện', 38, 270)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (385, N'Quan Hóa', N'Huyện', 38, 271)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (386, N'Bá Thước', N'Huyện', 38, 272)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (387, N'Quan Sơn', N'Huyện', 38, 273)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (388, N'Lang Chánh', N'Huyện', 38, 274)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (389, N'Ngọc Lặc', N'Huyện', 38, 275)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (390, N'Cẩm Thủy', N'Huyện', 38, 276)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (391, N'Thạch Thành', N'Huyện', 38, 277)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (392, N'Hà Trung', N'Huyện', 38, 278)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (393, N'Vĩnh Lộc', N'Huyện', 38, 279)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (394, N'Yên Định', N'Huyện', 38, 280)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (395, N'Thọ Xuân', N'Huyện', 38, 281)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (396, N'Thường Xuân', N'Huyện', 38, 282)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (397, N'Triệu Sơn', N'Huyện', 38, 283)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (398, N'Thiệu Hoá', N'Huyện', 38, 284)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (399, N'Hoằng Hóa', N'Huyện', 38, 285)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (400, N'Hậu Lộc', N'Huyện', 38, 286)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (401, N'Nga Sơn', N'Huyện', 38, 287)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (402, N'Như Xuân', N'Huyện', 38, 288)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (403, N'Như Thanh', N'Huyện', 38, 289)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (404, N'Nông Cống', N'Huyện', 38, 290)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (405, N'Đông Sơn', N'Huyện', 38, 291)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (406, N'Quảng Xương', N'Huyện', 38, 292)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (407, N'Tĩnh Gia', N'Huyện', 38, 293)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (412, N'Vinh', N'Thành Phố', 40, 294)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (413, N'Cửa Lò', N'Thị Xã', 40, 295)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (414, N'Thái Hoà', N'Thị Xã', 40, 296)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (415, N'Quế Phong', N'Huyện', 40, 297)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (416, N'Quỳ Châu', N'Huyện', 40, 298)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (417, N'Kỳ Sơn', N'Huyện', 40, 299)
GO
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (418, N'Tương Dương', N'Huyện', 40, 300)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (419, N'Nghĩa Đàn', N'Huyện', 40, 301)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (420, N'Quỳ Hợp', N'Huyện', 40, 302)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (421, N'Quỳnh Lưu', N'Huyện', 40, 303)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (422, N'Con Cuông', N'Huyện', 40, 304)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (423, N'Tân Kỳ', N'Huyện', 40, 305)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (424, N'Anh Sơn', N'Huyện', 40, 306)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (425, N'Diễn Châu', N'Huyện', 40, 307)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (426, N'Yên Thành', N'Huyện', 40, 308)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (427, N'Đô Lương', N'Huyện', 40, 309)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (428, N'Thanh Chương', N'Huyện', 40, 310)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (429, N'Nghi Lộc', N'Huyện', 40, 311)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (430, N'Nam Đàn', N'Huyện', 40, 312)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (431, N'Hưng Nguyên', N'Huyện', 40, 313)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (436, N'Hà Tĩnh', N'Thành Phố', 42, 314)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (437, N'Hồng Lĩnh', N'Thị Xã', 42, 315)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (439, N'Hương Sơn', N'Huyện', 42, 316)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (440, N'Đức Thọ', N'Huyện', 42, 317)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (441, N'Vũ Quang', N'Huyện', 42, 318)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (442, N'Nghi Xuân', N'Huyện', 42, 319)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (443, N'Can Lộc', N'Huyện', 42, 320)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (444, N'Hương Khê', N'Huyện', 42, 321)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (445, N'Thạch Hà', N'Huyện', 42, 322)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (446, N'Cẩm Xuyên', N'Huyện', 42, 323)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (447, N'Kỳ Anh', N'Huyện', 42, 324)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (448, N'Lộc Hà', N'Huyện', 42, 325)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (450, N'Đồng Hới', N'Thành Phố', 44, 326)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (452, N'Minh Hóa', N'Huyện', 44, 327)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (453, N'Tuyên Hóa', N'Huyện', 44, 328)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (454, N'Quảng Trạch', N'Huyện', 44, 329)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (455, N'Bố Trạch', N'Huyện', 44, 330)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (456, N'Quảng Ninh', N'Huyện', 44, 331)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (457, N'Lệ Thủy', N'Huyện', 44, 332)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (461, N'Đông Hà', N'Thành Phố', 45, 333)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (462, N'Quảng Trị', N'Thị Xã', 45, 334)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (464, N'Vĩnh Linh', N'Huyện', 45, 335)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (465, N'Hướng Hóa', N'Huyện', 45, 336)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (466, N'Gio Linh', N'Huyện', 45, 337)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (467, N'Đa Krông', N'Huyện', 45, 338)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (468, N'Cam Lộ', N'Huyện', 45, 339)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (469, N'Triệu Phong', N'Huyện', 45, 340)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (470, N'Hải Lăng', N'Huyện', 45, 341)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (471, N'Cồn Cỏ', N'Huyện', 45, 342)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (474, N'Huế', N'Thành Phố', 46, 343)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (476, N'Phong Điền', N'Huyện', 46, 344)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (477, N'Quảng Điền', N'Huyện', 46, 345)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (478, N'Phú Vang', N'Huyện', 46, 346)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (479, N'Hương Thủy', N'Huyện', 46, 347)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (480, N'Hương Trà', N'Huyện', 46, 348)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (481, N'A Lưới', N'Huyện', 46, 349)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (482, N'Phú Lộc', N'Huyện', 46, 350)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (483, N'Nam Đông', N'Huyện', 46, 351)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (490, N'Liên Chiểu', N'Quận', 48, 352)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (491, N'Thanh Khê', N'Quận', 48, 353)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (492, N'Hải Châu', N'Quận', 48, 354)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (493, N'Sơn Trà', N'Quận', 48, 355)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (494, N'Ngũ Hành Sơn', N'Quận', 48, 356)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (495, N'Cẩm Lệ', N'Quận', 48, 357)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (497, N'Hoà Vang', N'Huyện', 48, 358)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (498, N'Hoàng Sa', N'Huyện', 48, 359)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (502, N'Tam Kỳ', N'Thành Phố', 49, 360)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (503, N'Hội An', N'Thành Phố', 49, 361)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (504, N'Tây Giang', N'Huyện', 49, 362)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (505, N'Đông Giang', N'Huyện', 49, 363)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (506, N'Đại Lộc', N'Huyện', 49, 364)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (507, N'Điện Bàn', N'Huyện', 49, 365)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (508, N'Duy Xuyên', N'Huyện', 49, 366)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (509, N'Quế Sơn', N'Huyện', 49, 367)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (510, N'Nam Giang', N'Huyện', 49, 368)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (511, N'Phước Sơn', N'Huyện', 49, 369)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (512, N'Hiệp Đức', N'Huyện', 49, 370)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (513, N'Thăng Bình', N'Huyện', 49, 371)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (514, N'Tiên Phước', N'Huyện', 49, 372)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (515, N'Bắc Trà My', N'Huyện', 49, 373)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (516, N'Nam Trà My', N'Huyện', 49, 374)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (517, N'Núi Thành', N'Huyện', 49, 375)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (518, N'Phú Ninh', N'Huyện', 49, 376)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (519, N'Nông Sơn', N'Huyện', 49, 377)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (522, N'Quảng Ngãi', N'Thành Phố', 51, 378)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (524, N'Bình Sơn', N'Huyện', 51, 379)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (525, N'Trà Bồng', N'Huyện', 51, 380)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (526, N'Tây Trà', N'Huyện', 51, 381)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (527, N'Sơn Tịnh', N'Huyện', 51, 382)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (528, N'Tư Nghĩa', N'Huyện', 51, 383)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (529, N'Sơn Hà', N'Huyện', 51, 384)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (530, N'Sơn Tây', N'Huyện', 51, 385)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (531, N'Minh Long', N'Huyện', 51, 386)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (532, N'Nghĩa Hành', N'Huyện', 51, 387)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (533, N'Mộ Đức', N'Huyện', 51, 388)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (534, N'Đức Phổ', N'Huyện', 51, 389)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (535, N'Ba Tơ', N'Huyện', 51, 390)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (536, N'Lý Sơn', N'Huyện', 51, 391)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (540, N'Qui Nhơn', N'Thành Phố', 52, 392)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (542, N'An Lão', N'Huyện', 52, 393)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (543, N'Hoài Nhơn', N'Huyện', 52, 394)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (544, N'Hoài Ân', N'Huyện', 52, 395)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (545, N'Phù Mỹ', N'Huyện', 52, 396)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (546, N'Vĩnh Thạnh', N'Huyện', 52, 397)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (547, N'Tây Sơn', N'Huyện', 52, 398)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (548, N'Phù Cát', N'Huyện', 52, 399)
GO
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (549, N'An Nhơn', N'Huyện', 52, 400)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (550, N'Tuy Phước', N'Huyện', 52, 401)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (551, N'Vân Canh', N'Huyện', 52, 402)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (555, N'Tuy Hòa', N'Thành Phố', 54, 403)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (557, N'Sông Cầu', N'Thị Xã', 54, 404)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (558, N'Đồng Xuân', N'Huyện', 54, 405)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (559, N'Tuy An', N'Huyện', 54, 406)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (560, N'Sơn Hòa', N'Huyện', 54, 407)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (561, N'Sông Hinh', N'Huyện', 54, 408)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (562, N'Tây Hoà', N'Huyện', 54, 409)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (563, N'Phú Hoà', N'Huyện', 54, 410)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (564, N'Đông Hoà', N'Huyện', 54, 411)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (568, N'Nha Trang', N'Thành Phố', 56, 412)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (569, N'Cam Ranh', N'Thị Xã', 56, 413)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (570, N'Cam Lâm', N'Huyện', 56, 414)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (571, N'Vạn Ninh', N'Huyện', 56, 415)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (572, N'Ninh Hòa', N'Huyện', 56, 416)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (573, N'Khánh Vĩnh', N'Huyện', 56, 417)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (574, N'Diên Khánh', N'Huyện', 56, 418)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (575, N'Khánh Sơn', N'Huyện', 56, 419)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (576, N'Trường Sa', N'Huyện', 56, 420)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (582, N'Phan Rang-Tháp Chàm', N'Thành Phố', 58, 421)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (584, N'Bác Ái', N'Huyện', 58, 422)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (585, N'Ninh Sơn', N'Huyện', 58, 423)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (586, N'Ninh Hải', N'Huyện', 58, 424)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (587, N'Ninh Phước', N'Huyện', 58, 425)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (588, N'Thuận Bắc', N'Huyện', 58, 426)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (589, N'Thuận Nam', N'Huyện', 58, 427)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (593, N'Phan Thiết', N'Thành Phố', 60, 428)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (594, N'La Gi', N'Thị Xã', 60, 429)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (595, N'Tuy Phong', N'Huyện', 60, 430)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (596, N'Bắc Bình', N'Huyện', 60, 431)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (597, N'Hàm Thuận Bắc', N'Huyện', 60, 432)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (598, N'Hàm Thuận Nam', N'Huyện', 60, 433)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (599, N'Tánh Linh', N'Huyện', 60, 434)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (600, N'Đức Linh', N'Huyện', 60, 435)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (601, N'Hàm Tân', N'Huyện', 60, 436)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (602, N'Phú Quí', N'Huyện', 60, 437)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (608, N'Kon Tum', N'Thành Phố', 62, 438)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (610, N'Đắk Glei', N'Huyện', 62, 439)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (611, N'Ngọc Hồi', N'Huyện', 62, 440)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (612, N'Đắk Tô', N'Huyện', 62, 441)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (613, N'Kon Plông', N'Huyện', 62, 442)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (614, N'Kon Rẫy', N'Huyện', 62, 443)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (615, N'Đắk Hà', N'Huyện', 62, 444)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (616, N'Sa Thầy', N'Huyện', 62, 445)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (617, N'Tu Mơ Rông', N'Huyện', 62, 446)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (622, N'Pleiku', N'Thành Phố', 64, 447)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (623, N'An Khê', N'Thị Xã', 64, 448)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (624, N'Ayun Pa', N'Thị Xã', 64, 449)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (625, N'Kbang', N'Huyện', 64, 450)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (626, N'Đăk Đoa', N'Huyện', 64, 451)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (627, N'Chư Păh', N'Huyện', 64, 452)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (628, N'Ia Grai', N'Huyện', 64, 453)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (629, N'Mang Yang', N'Huyện', 64, 454)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (630, N'Kông Chro', N'Huyện', 64, 455)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (631, N'Đức Cơ', N'Huyện', 64, 456)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (632, N'Chư Prông', N'Huyện', 64, 457)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (633, N'Chư Sê', N'Huyện', 64, 458)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (634, N'Đăk Pơ', N'Huyện', 64, 459)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (635, N'Ia Pa', N'Huyện', 64, 460)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (637, N'Krông Pa', N'Huyện', 64, 461)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (638, N'Phú Thiện', N'Huyện', 64, 462)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (639, N'Chư Pưh', N'Huyện', 64, 463)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (643, N'Buôn Ma Thuột', N'Thành Phố', 66, 464)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (644, N'Buôn Hồ', N'Thị Xã', 66, 465)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (645, N'Ea H''leo', N'Huyện', 66, 466)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (646, N'Ea Súp', N'Huyện', 66, 467)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (647, N'Buôn Đôn', N'Huyện', 66, 468)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (648, N'Cư M''gar', N'Huyện', 66, 469)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (649, N'Krông Búk', N'Huyện', 66, 470)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (650, N'Krông Năng', N'Huyện', 66, 471)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (651, N'Ea Kar', N'Huyện', 66, 472)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (652, N'M''đrắk', N'Huyện', 66, 473)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (653, N'Krông Bông', N'Huyện', 66, 474)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (654, N'Krông Pắc', N'Huyện', 66, 475)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (655, N'Krông A Na', N'Huyện', 66, 476)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (656, N'Lắk', N'Huyện', 66, 477)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (657, N'Cư Kuin', N'Huyện', 66, 478)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (660, N'Gia Nghĩa', N'Thị Xã', 67, 479)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (661, N'Đắk Glong', N'Huyện', 67, 480)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (662, N'Cư Jút', N'Huyện', 67, 481)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (663, N'Đắk Mil', N'Huyện', 67, 482)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (664, N'Krông Nô', N'Huyện', 67, 483)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (665, N'Đắk Song', N'Huyện', 67, 484)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (666, N'Đắk R''lấp', N'Huyện', 67, 485)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (667, N'Tuy Đức', N'Huyện', 67, 486)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (672, N'Đà Lạt', N'Thành Phố', 68, 487)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (673, N'Bảo Lộc', N'Thị Xã', 68, 488)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (674, N'Đam Rông', N'Huyện', 68, 489)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (675, N'Lạc Dương', N'Huyện', 68, 490)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (676, N'Lâm Hà', N'Huyện', 68, 491)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (677, N'Đơn Dương', N'Huyện', 68, 492)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (678, N'Đức Trọng', N'Huyện', 68, 493)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (679, N'Di Linh', N'Huyện', 68, 494)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (680, N'Bảo Lâm', N'Huyện', 68, 495)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (681, N'Đạ Huoai', N'Huyện', 68, 496)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (682, N'Đạ Tẻh', N'Huyện', 68, 497)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (683, N'Cát Tiên', N'Huyện', 68, 498)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (688, N'Phước Long', N'Thị Xã', 70, 500)
GO
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (689, N'Đồng Xoài', N'Thị Xã', 70, 499)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (690, N'Bình Long', N'Thị Xã', 70, 501)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (691, N'Bù Gia Mập', N'Huyện', 70, 502)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (692, N'Lộc Ninh', N'Huyện', 70, 503)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (693, N'Bù Đốp', N'Huyện', 70, 504)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (694, N'Hớn Quản', N'Huyện', 70, 505)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (695, N'Đồng Phù', N'Huyện', 70, 506)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (696, N'Bù Đăng', N'Huyện', 70, 507)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (697, N'Chơn Thành', N'Huyện', 70, 508)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (703, N'Tây Ninh', N'Thị Xã', 72, 509)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (705, N'Tân Biên', N'Huyện', 72, 510)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (706, N'Tân Châu', N'Huyện', 72, 511)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (707, N'Dương Minh Châu', N'Huyện', 72, 512)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (708, N'Châu Thành', N'Huyện', 72, 513)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (709, N'Hòa Thành', N'Huyện', 72, 514)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (710, N'Gò Dầu', N'Huyện', 72, 515)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (711, N'Bến Cầu', N'Huyện', 72, 516)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (712, N'Trảng Bàng', N'Huyện', 72, 517)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (718, N'Thủ Dầu Một', N'Thị Xã', 74, 518)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (720, N'Dầu Tiếng', N'Huyện', 74, 519)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (721, N'Bến Cát', N'Huyện', 74, 520)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (722, N'Phú Giáo', N'Huyện', 74, 521)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (723, N'Tân Uyên', N'Huyện', 74, 522)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (724, N'Dĩ An', N'Huyện', 74, 523)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (725, N'Thuận An', N'Huyện', 74, 524)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (731, N'Biên Hòa', N'Thành Phố', 75, 525)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (732, N'Long Khánh', N'Thị Xã', 75, 526)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (734, N'Tân Phú', N'Huyện', 75, 527)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (735, N'Vĩnh Cửu', N'Huyện', 75, 528)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (736, N'Định Quán', N'Huyện', 75, 529)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (737, N'Trảng Bom', N'Huyện', 75, 530)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (738, N'Thống Nhất', N'Huyện', 75, 531)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (739, N'Cẩm Mỹ', N'Huyện', 75, 532)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (740, N'Long Thành', N'Huyện', 75, 533)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (741, N'Xuân Lộc', N'Huyện', 75, 534)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (742, N'Nhơn Trạch', N'Huyện', 75, 535)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (747, N'Vũng Tầu', N'Thành Phố', 77, 536)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (748, N'Bà Rịa', N'Thị Xã', 77, 537)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (750, N'Châu Đức', N'Huyện', 77, 538)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (751, N'Xuyên Mộc', N'Huyện', 77, 539)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (752, N'Long Điền', N'Huyện', 77, 540)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (753, N'Đất Đỏ', N'Huyện', 77, 541)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (754, N'Tân Thành', N'Huyện', 77, 542)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (755, N'Côn Đảo', N'Huyện', 77, 543)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (760, N'1', N'Quận', 79, 544)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (761, N'12', N'Quận', 79, 545)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (762, N'Thủ Đức', N'Quận', 79, 546)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (763, N'9', N'Quận', 79, 547)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (764, N'Gò Vấp', N'Quận', 79, 548)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (765, N'Bình Thạnh', N'Quận', 79, 549)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (766, N'Tân Bình', N'Quận', 79, 550)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (767, N'Tân Phú', N'Quận', 79, 551)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (768, N'Phú Nhuận', N'Quận', 79, 552)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (769, N'2', N'Quận', 79, 553)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (770, N'3', N'Quận', 79, 554)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (771, N'10', N'Quận', 79, 555)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (772, N'11', N'Quận', 79, 556)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (773, N'4', N'Quận', 79, 557)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (774, N'5', N'Quận', 79, 558)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (775, N'6', N'Quận', 79, 559)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (776, N'8', N'Quận', 79, 560)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (777, N'Bình Tân', N'Quận', 79, 561)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (778, N'7', N'Quận', 79, 562)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (783, N'Củ Chi', N'Huyện', 79, 563)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (784, N'Hóc Môn', N'Huyện', 79, 564)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (785, N'Bình Chánh', N'Huyện', 79, 565)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (786, N'Nhà Bè', N'Huyện', 79, 566)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (787, N'Cần Giờ', N'Huyện', 79, 567)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (794, N'Tân An', N'Thành Phố', 80, 568)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (796, N'Tân Hưng', N'Huyện', 80, 569)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (797, N'Vĩnh Hưng', N'Huyện', 80, 570)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (798, N'Mộc Hóa', N'Huyện', 80, 571)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (799, N'Tân Thạnh', N'Huyện', 80, 572)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (800, N'Thạnh Hóa', N'Huyện', 80, 573)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (801, N'Đức Huệ', N'Huyện', 80, 574)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (802, N'Đức Hòa', N'Huyện', 80, 575)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (803, N'Bến Lức', N'Huyện', 80, 576)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (804, N'Thủ Thừa', N'Huyện', 80, 577)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (805, N'Tân Trụ', N'Huyện', 80, 578)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (806, N'Cần Đước', N'Huyện', 80, 579)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (807, N'Cần Giuộc', N'Huyện', 80, 580)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (808, N'Châu Thành', N'Huyện', 80, 581)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (815, N'Mỹ Tho', N'Thành Phố', 82, 582)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (816, N'Gò Công', N'Thị Xã', 82, 583)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (818, N'Tân Phước', N'Huyện', 82, 584)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (819, N'Cái Bè', N'Huyện', 82, 585)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (820, N'Cai Lậy', N'Huyện', 82, 586)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (821, N'Châu Thành', N'Huyện', 82, 587)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (822, N'Chợ Gạo', N'Huyện', 82, 588)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (823, N'Gò Công Tây', N'Huyện', 82, 589)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (824, N'Gò Công Đông', N'Huyện', 82, 590)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (825, N'Tân Phú Đông', N'Huyện', 82, 591)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (829, N'Bến Tre', N'Thành Phố', 83, 592)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (831, N'Châu Thành', N'Huyện', 83, 593)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (832, N'Chợ Lách', N'Huyện', 83, 594)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (833, N'Mỏ Cày Nam', N'Huyện', 83, 595)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (834, N'Giồng Trôm', N'Huyện', 83, 596)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (835, N'Bình Đại', N'Huyện', 83, 597)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (836, N'Ba Tri', N'Huyện', 83, 598)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (837, N'Thạnh Phú', N'Huyện', 83, 599)
GO
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (838, N'Mỏ Cày Bắc', N'Huyện', 83, 600)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (842, N'Trà Vinh', N'Thị Xã', 84, 601)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (844, N'Càng Long', N'Huyện', 84, 602)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (845, N'Cầu Kè', N'Huyện', 84, 603)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (846, N'Tiểu Cần', N'Huyện', 84, 604)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (847, N'Châu Thành', N'Huyện', 84, 605)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (848, N'Cầu Ngang', N'Huyện', 84, 606)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (849, N'Trà Cú', N'Huyện', 84, 607)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (850, N'Duyên Hải', N'Huyện', 84, 608)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (855, N'Vĩnh Long', N'Thành Phố', 86, 609)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (857, N'Long Hồ', N'Huyện', 86, 610)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (858, N'Mang Thít', N'Huyện', 86, 611)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (859, N'Vũng Liêm', N'Huyện', 86, 612)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (860, N'Tam Bình', N'Huyện', 86, 613)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (861, N'Bình Minh', N'Huyện', 86, 614)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (862, N'Trà Ôn', N'Huyện', 86, 615)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (863, N'Bình Tân', N'Huyện', 86, 616)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (866, N'Cao Lãnh', N'Thành Phố', 87, 617)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (867, N'Sa Đéc', N'Thị Xã', 87, 618)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (868, N'Hồng Ngự', N'Thị Xã', 87, 619)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (869, N'Tân Hồng', N'Huyện', 87, 620)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (870, N'Hồng Ngự', N'Huyện', 87, 621)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (871, N'Tam Nông', N'Huyện', 87, 622)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (872, N'Tháp Mười', N'Huyện', 87, 623)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (873, N'Cao Lãnh', N'Huyện', 87, 624)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (874, N'Thanh Bình', N'Huyện', 87, 625)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (875, N'Lấp Vò', N'Huyện', 87, 626)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (876, N'Lai Vung', N'Huyện', 87, 627)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (877, N'Châu Thành', N'Huyện', 87, 628)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (883, N'Long Xuyên', N'Thành Phố', 89, 629)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (884, N'Châu Đốc', N'Thị Xã', 89, 630)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (886, N'An Phú', N'Huyện', 89, 631)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (887, N'Tân Châu', N'Thị Xã', 89, 632)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (888, N'Phú Tân', N'Huyện', 89, 633)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (889, N'Châu Phú', N'Huyện', 89, 634)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (890, N'Tịnh Biên', N'Huyện', 89, 635)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (891, N'Tri Tôn', N'Huyện', 89, 636)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (892, N'Châu Thành', N'Huyện', 89, 637)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (893, N'Chợ Mới', N'Huyện', 89, 638)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (894, N'Thoại Sơn', N'Huyện', 89, 639)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (899, N'Rạch Giá', N'Thành Phố', 91, 640)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (900, N'Hà Tiên', N'Thị Xã', 91, 641)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (902, N'Kiên Lương', N'Huyện', 91, 642)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (903, N'Hòn Đất', N'Huyện', 91, 643)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (904, N'Tân Hiệp', N'Huyện', 91, 644)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (905, N'Châu Thành', N'Huyện', 91, 645)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (906, N'Giồng Giềng', N'Huyện', 91, 646)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (907, N'Gò Quao', N'Huyện', 91, 647)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (908, N'An Biên', N'Huyện', 91, 648)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (909, N'An Minh', N'Huyện', 91, 649)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (910, N'Vĩnh Thuận', N'Huyện', 91, 650)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (911, N'Phú Quốc', N'Huyện', 91, 651)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (912, N'Kiên Hải', N'Huyện', 91, 652)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (913, N'U Minh Thượng', N'Huyện', 91, 653)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (914, N'Giang Thành', N'Huyện', 91, 654)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (916, N'Ninh Kiều', N'Quận', 92, 655)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (917, N'Ô Môn', N'Quận', 92, 656)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (918, N'Bình Thuỷ', N'Quận', 92, 657)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (919, N'Cái Răng', N'Quận', 92, 658)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (923, N'Thốt Nốt', N'Quận', 92, 659)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (924, N'Vĩnh Thạnh', N'Huyện', 92, 660)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (925, N'Cờ Đỏ', N'Huyện', 92, 661)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (926, N'Phong Điền', N'Huyện', 92, 662)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (927, N'Thới Lai', N'Huyện', 92, 663)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (930, N'Vị Thanh', N'Thị Xã', 93, 664)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (931, N'Ngã Bảy', N'Thị Xã', 93, 665)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (932, N'Châu Thành A', N'Huyện', 93, 666)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (933, N'Châu Thành', N'Huyện', 93, 667)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (934, N'Phụng Hiệp', N'Huyện', 93, 668)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (935, N'Vị Thuỷ', N'Huyện', 93, 669)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (936, N'Long Mỹ', N'Huyện', 93, 670)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (941, N'Sóc Trăng', N'Thành Phố', 94, 671)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (942, N'Châu Thành', N'Huyện', 94, 672)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (943, N'Kế Sách', N'Huyện', 94, 673)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (944, N'Mỹ Tú', N'Huyện', 94, 674)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (945, N'Cù Lao Dung', N'Huyện', 94, 675)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (946, N'Long Phú', N'Huyện', 94, 676)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (947, N'Mỹ Xuyên', N'Huyện', 94, 677)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (948, N'Ngã Năm', N'Huyện', 94, 678)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (949, N'Thạnh Trị', N'Huyện', 94, 679)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (950, N'Vĩnh Châu', N'Huyện', 94, 680)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (951, N'Trần Đề', N'Huyện', 94, 681)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (954, N'Bạc Liêu', N'Thị Xã', 95, 682)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (956, N'Hồng Dân', N'Huyện', 95, 683)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (957, N'Phước Long', N'Huyện', 95, 684)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (958, N'Vĩnh Lợi', N'Huyện', 95, 685)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (959, N'Giá Rai', N'Huyện', 95, 686)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (960, N'Đông Hải', N'Huyện', 95, 687)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (961, N'Hoà Bình', N'Huyện', 95, 688)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (964, N'Cà Mau', N'Thành Phố', 96, 689)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (966, N'U Minh', N'Huyện', 96, 690)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (967, N'Thới Bình', N'Huyện', 96, 691)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (968, N'Trần Văn Thời', N'Huyện', 96, 692)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (969, N'Cái Nước', N'Huyện', 96, 693)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (970, N'Đầm Dơi', N'Huyện', 96, 694)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (971, N'Năm Căn', N'Huyện', 96, 695)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (972, N'Phú Tân', N'Huyện', 96, 696)
INSERT [dbo].[landDistrict] ([DistrictId], [Name], [Type], [ProvinceId], [SortOrder]) VALUES (973, N'Ngọc Hiển', N'Huyện', 96, 697)
SET IDENTITY_INSERT [dbo].[landDistrict] OFF
SET IDENTITY_INSERT [dbo].[landProvince] ON 

INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (1, N'Hà Nội', N'Thành Phố', 24)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (2, N'Hà Giang', N'Tỉnh', 22)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (4, N'Cao Bằng', N'Tỉnh', 14)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (6, N'Bắc Kạn', N'Tỉnh', 4)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (8, N'Tuyên Quang', N'Tỉnh', 60)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (10, N'Lào Cai', N'Tỉnh', 38)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (11, N'Điện Biên', N'Tỉnh', 18)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (12, N'Lai Châu', N'Tỉnh', 35)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (14, N'Sơn La', N'Tỉnh', 52)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (15, N'Yên Bái', N'Tỉnh', 63)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (17, N'Hòa Bình', N'Tỉnh', 30)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (19, N'Thái Nguyên', N'Tỉnh', 55)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (20, N'Lạng Sơn', N'Tỉnh', 37)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (22, N'Quảng Ninh', N'Tỉnh', 49)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (24, N'Bắc Giang', N'Tỉnh', 3)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (25, N'Phú Thọ', N'Tỉnh', 44)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (26, N'Vĩnh Phúc', N'Tỉnh', 62)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (27, N'Bắc Ninh', N'Tỉnh', 6)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (30, N'Hải Dương', N'Tỉnh', 26)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (31, N'Hải Phòng', N'Thành Phố', 27)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (33, N'Hưng Yên', N'Tỉnh', 31)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (34, N'Thái Bình', N'Tỉnh', 54)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (35, N'Hà Nam', N'Tỉnh', 23)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (36, N'Nam Định', N'Tỉnh', 40)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (37, N'Ninh Bình', N'Tỉnh', 42)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (38, N'Thanh Hóa', N'Tỉnh', 56)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (40, N'Nghệ An', N'Tỉnh', 41)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (42, N'Hà Tĩnh', N'Tỉnh', 25)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (44, N'Quảng Bình', N'Tỉnh', 46)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (45, N'Quảng Trị', N'Tỉnh', 50)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (46, N'Thừa Thiên Huế', N'Tỉnh', 57)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (48, N'Đà Nẵng', N'Thành Phố', 15)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (49, N'Quảng Nam', N'Tỉnh', 47)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (51, N'Quảng Ngãi', N'Tỉnh', 48)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (52, N'Bình Định', N'Tỉnh', 8)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (54, N'Phú Yên', N'Tỉnh', 45)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (56, N'Khánh Hòa', N'Tỉnh', 32)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (58, N'Ninh Thuận', N'Tỉnh', 43)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (60, N'Bình Thuận', N'Tỉnh', 11)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (62, N'Kon Tum', N'Tỉnh', 34)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (64, N'Gia Lai', N'Tỉnh', 21)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (66, N'Đắk Lắk', N'Tỉnh', 16)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (67, N'Đắk Nông', N'Tỉnh', 17)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (68, N'Lâm Đồng', N'Tỉnh', 36)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (70, N'Bình Phước', N'Tỉnh', 10)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (72, N'Tây Ninh', N'Tỉnh', 53)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (74, N'Bình Dương', N'Tỉnh', 9)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (75, N'Đồng Nai', N'Tỉnh', 19)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (77, N'Bà Rịa - Vũng Tàu', N'Tỉnh', 2)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (79, N'Hồ Chí Minh', N'Thành Phố', 29)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (80, N'Long An', N'Tỉnh', 39)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (82, N'Tiền Giang', N'Tỉnh', 58)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (83, N'Bến Tre', N'Tỉnh', 7)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (84, N'Trà Vinh', N'Tỉnh', 59)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (86, N'Vĩnh Long', N'Tỉnh', 61)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (87, N'Đồng Tháp', N'Tỉnh', 20)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (89, N'An Giang', N'Tỉnh', 1)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (91, N'Kiên Giang', N'Tỉnh', 33)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (92, N'Cần Thơ', N'Thành Phố', 13)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (93, N'Hậu Giang', N'Tỉnh', 28)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (94, N'Sóc Trăng', N'Tỉnh', 51)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (95, N'Bạc Liêu', N'Tỉnh', 5)
INSERT [dbo].[landProvince] ([ProvinceId], [Name], [Type], [SortOrder]) VALUES (96, N'Cà Mau', N'Tỉnh', 12)
SET IDENTITY_INSERT [dbo].[landProvince] OFF
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10101, N'Quận Ba Đình', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10103, N'Quận Tây Hồ', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10105, N'Quận Hoàn Kiếm', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10106, N'Quận Long Biên', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10107, N'Quận Hai Bà Trưng', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10108, N'Quận Hoàng Mai', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10109, N'Quận Đống Đa', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10111, N'Quận Thanh Xuân', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10113, N'Quận Cầu Giấy', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10115, N'Huyện Sóc Sơn', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10117, N'Huyện Đông Anh', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10119, N'Huyện Gia Lâm', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10121, N'Huyện Từ Liêm', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10123, N'Huyện Thanh Trì', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10125, N'Huyện Mê Linh', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10127, N'Quận Hà Đông', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10129, N'Thị xã Sơn Tây', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10131, N'Huyện Phúc Thọ', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10133, N'Huyện Đan Phượng', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10135, N'Huyện Thạch Thất', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10137, N'Huyện Hoài Đức', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10139, N'Huyện Quốc Oai', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10141, N'Huyện Thanh Oai', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10143, N'Huyện Thường Tín', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10145, N'Huyện Mỹ Đức', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10147, N'Huyện ứng Hòa', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10149, N'Huyện Phú Xuyên', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10151, N'Huyện Ba Vì', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10153, N'Huyện Chương Mỹ', 101)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10301, N'Quận Hồng Bàng', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10303, N'Quận Ngô Quyền', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10304, N'Quận Hải An', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10305, N'Quận Lê Chân', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10307, N'Quận Kiến An', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10309, N'Quận Đồ Sơn', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10311, N'Huyện Thuỷ Nguyên', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10313, N'Huyện An Dương', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10315, N'Huyện An Lão', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10317, N'Huyện Kiến Thụy', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10319, N'Huyện Tiên Lãng', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10321, N'Huyện Vĩnh Bảo', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10323, N'Huyện Cát Hải', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10325, N'Huyện Bạch Long Vĩ', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10327, N'Quận Dương Kinh', 103)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10701, N'Thành phố Hải Dương', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10703, N'Huyện Chí Linh', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10705, N'Huyện Nam Sách', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10707, N'Huyện Thanh Hà', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10709, N'Huyện Kinh Môn', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10711, N'Huyện Kim Thành', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10713, N'Huyện Gia Lộc', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10715, N'Huyện Tứ Kỳ', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10717, N'Huyện Cẩm Giàng', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10719, N'Huyện Bình Giang', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10721, N'Huyện Thanh Miện', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10723, N'Huyện Ninh Giang', 107)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10901, N'Thành phố Hưng Yên', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10903, N'Huyện Mỹ Hào', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10905, N'Huyện Khoái Châu', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10907, N'Huyện Ân Thi', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10909, N'Huyện Kim Động', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10911, N'Huyện Phù Cừ', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10913, N'Huyện Tiên Lữ', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10915, N'Huyện Văn Giang', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10917, N'Huyện Văn Lâm', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (10919, N'Huyện Yên Mỹ', 109)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11101, N'Thành Phố Phủ Lý', 111)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11103, N'Huyện Duy Tiên', 111)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11105, N'Huyện Kim Bảng', 111)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11107, N'Huyện Lý Nhân', 111)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11109, N'Huyện Thanh Liêm', 111)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11111, N'Huyện Bình Lục', 111)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11301, N'Thành phố Nam Định', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11303, N'Huyện Vụ Bản', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11305, N'Huyện Mỹ Lộc', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11307, N'Huyện ý Yên', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11309, N'Huyện Nam Trực', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11311, N'Huyện Trực Ninh', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11313, N'Huyện Xuân Trường', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11315, N'Huyện Giao Thủy', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11317, N'Huyện Nghĩa Hưng', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11319, N'Huyện Hải Hậu', 113)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11501, N'Thành phố Thái Bình', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11503, N'Huyện Quỳnh Phụ', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11505, N'Huyện Hưng Hà', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11507, N'Huyện Thái Thụy', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11509, N'Huyện Đông Hưng', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11511, N'Huyện Vũ Thư', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11513, N'Huyện Kiến Xương', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11515, N'Huyện Tiền Hải', 115)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11701, N'Thành Phố Ninh Bình', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11703, N'Thị xã Tam Điệp', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11705, N'Huyện Nho Quan', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11707, N'Huyện Gia Viễn', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11709, N'Huyện Hoa Lư', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11711, N'Huyện Yên Mô', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11713, N'Huyện Yên Khánh', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (11715, N'Huyện Kim Sơn', 117)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20101, N'Thị xã Hà Giang', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20103, N'Huyện Đồng Văn', 201)
GO
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20105, N'Huyện Mèo Vạc', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20107, N'Huyện Yên Minh', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20109, N'Huyện Quản Bạ', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20111, N'Huyện Bắc Mê', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20113, N'Huyện Hoàng Su Phì', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20115, N'Huyện Vị Xuyên', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20117, N'Huyện Xín Mần', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20118, N'Huyện Quang Bình', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20119, N'Huyện Bắc Quang', 201)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20301, N'Thị xã Cao Bằng', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20303, N'Huyện Bảo Lạc', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20305, N'Huyện Hà Quảng', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20307, N'Huyện Thông Nông', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20309, N'Huyện Trà Lĩnh', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20311, N'Huyện Trùng Khánh', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20313, N'Huyện Nguyên Bình', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20315, N'Huyện Hoà An', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20317, N'Huyện Quảng Uyên', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20318, N'Huyện Phục Hoà', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20319, N'Huyện Hạ Lang', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20321, N'Huyện Thạch An', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20323, N'Huyện Bảo Lâm', 203)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20501, N'Thành phố Lào Cai', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20505, N'Huyện Mường Khương', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20507, N'Huyện Bát Xát', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20509, N'Huyện Bắc Hà', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20511, N'Huyện Bảo Thắng', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20513, N'Huyện Sa Pa', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20515, N'Huyện Bảo Yên', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20519, N'Huyện Văn Bàn', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20521, N'Huyện Si Ma Cai', 205)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20701, N'Thị xã Bắc Kạn', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20703, N'Huyện Ba Bể', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20704, N'Huyện Pác Nặm', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20705, N'Huyện Ngân Sơn', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20707, N'Huyện Chợ Đồn', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20709, N'Huyện Na Rì', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20711, N'Huyện Bạch Thông', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20713, N'Huyện Chợ Mới', 207)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20901, N'Thành phố Lạng Sơn', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20903, N'Huyện Tràng Định', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20905, N'Huyện Văn Lãng', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20907, N'Huyện Bình Gia', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20909, N'Huyện Bắc Sơn', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20911, N'Huyện Văn Quan', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20913, N'Huyện Cao Lộc', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20915, N'Huyện Lộc Bình', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20917, N'Huyện Chi Lăng', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20919, N'Huyện Đình Lập', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (20921, N'Huyện Hữu Lũng', 209)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21101, N'Thị xã Tuyên Quang', 211)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21103, N'Huyện Nà Hang', 211)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21105, N'Huyện Chiêm Hóa', 211)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21107, N'Huyện Hàm Yên', 211)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21109, N'Huyện Yên Sơn', 211)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21111, N'Huyện Sơn Dương', 211)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21301, N'Thành phố Yên Bái', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21303, N'Thị xã Nghĩa Lộ', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21305, N'Huyện Lục Yên', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21307, N'Huyện Văn Yên', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21309, N'Huyện Mù Cang Chải', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21311, N'Huyện Trấn Yên', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21313, N'Huyện Yên Bình', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21315, N'Huyện Văn Chấn', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21317, N'Huyện Trạm Tấu', 213)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21501, N'Thành phố Thái Nguyên', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21503, N'Thị xã Sông Công', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21505, N'Huyện Định Hóa', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21507, N'Huyện Võ Nhai', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21509, N'Huyện Phú Lương', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21511, N'Huyện Đồng Hỷ', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21513, N'Huyện Đại Từ', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21515, N'Huyện Phú Bình', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21517, N'Huyện Phổ Yên', 215)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21701, N'Thành phố Việt Trì', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21703, N'Thị xã Phú Thọ', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21705, N'Huyện Đoan Hùng', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21707, N'Huyện Hạ Hoà', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21709, N'Huyện Thanh Ba', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21711, N'Huyện Phù Ninh', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21713, N'Huyện Cẩm Khê', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21715, N'Huyện Yên Lập', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21717, N'Huyện Tam Nông', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21719, N'Huyện Thanh Sơn', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21720, N'Huyện Tân Sơn', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21721, N'Huyện Lâm Thao', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21723, N'Huyện Thanh Thuỷ', 217)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21901, N'Thành Phố Vĩnh Yên', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21902, N'Thị xã Phúc Yên', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21903, N'Huyện Lập Thạch', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21904, N'Huyện Tam Đảo', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21905, N'Huyện Tam Dương', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21907, N'Huyện Vĩnh Tường', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21909, N'Huyện Yên Lạc', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21913, N'Huyện Bình Xuyên', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (21915, N'Huyện Sông Lô', 219)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22101, N'Thành phố Bắc Giang', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22103, N'Huyện Yên Thế', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22105, N'Huyện Tân Yên', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22107, N'Huyện Lục Ngạn', 221)
GO
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22109, N'Huyện Hiệp Hòa', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22111, N'Huyện Lạng Giang', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22113, N'Huyện Sơn Động', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22115, N'Huyện Lục Nam', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22117, N'Huyện Việt Yên', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22119, N'Huyện Yên Dũng', 221)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22301, N'Thành phố Bắc Ninh', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22303, N'Huyện Yên Phong', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22305, N'Huyện Quế Võ', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22307, N'Huyện Tiên Du', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22309, N'Huyện Thuận Thành', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22311, N'Huyện Lương Tài', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22313, N'Thị xã Từ Sơn', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22315, N'Huyện Gia Bình', 223)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22501, N'Thành phố Hạ Long', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22503, N'Thị xã Cẩm Phả', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22505, N'Thị xã Uông Bí', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22507, N'Huyện Bình Liêu', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22509, N'Thành Phố Móng Cái', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22511, N'Huyện Hải Hà', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22513, N'Huyện Tiên Yên', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22515, N'Huyện Ba Chẽ', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22517, N'Huyện Vân Đồn', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22519, N'Huyện Hoành Bồ', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22521, N'Huyện Đông Triều', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22523, N'Huyện Cô Tô', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22525, N'Huyện Yên Hưng', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (22527, N'Huyện Đầm Hà', 225)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30101, N'Thành phố Điện Biên Phủ', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30103, N'Thị xã Mường Lay', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30104, N'Huyện Mường Nhé', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30111, N'Huyện Mường Chà', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30113, N'Huyện Tủa Chùa', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30115, N'Huyện Tuần Giáo', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30117, N'Huyện Điện Biên', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30119, N'Huyện Điện Biên Đông', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30121, N'Huyện Mường ảng', 301)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30201, N'Huyện Mường Tè', 302)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30202, N'Thị xã Lai Châu', 302)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30203, N'Huyện Phong Thổ', 302)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30205, N'Huyện Tam Đường', 302)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30207, N'Huyện Sìn Hồ', 302)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30209, N'Huyện Than Uyên', 302)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30211, N'Huyện Tân Uyên', 302)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30301, N'Thành Phố Sơn La', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30303, N'Huyện Quỳnh Nhai', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30305, N'Huyện Mường La', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30307, N'Huyện Thuận Châu', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30309, N'Huyện Bắc Yên', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30311, N'Huyện Phù Yên', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30313, N'Huyện Mai Sơn', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30315, N'Huyện Sông Mã', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30317, N'Huyện Yên Châu', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30319, N'Huyện Mộc Châu', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30321, N'Huyện Sốp Cộp', 303)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30501, N'Thành phố Hòa Bình', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30503, N'Huyện Đà Bắc', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30505, N'Huyện Mai Châu', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30507, N'Huyện Kỳ Sơn', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30509, N'Huyện Lương Sơn', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30510, N'Huyện Cao Phong', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30511, N'Huyện Kim Bôi', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30513, N'Huyện Tân Lạc', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30515, N'Huyện Lạc Sơn', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30517, N'Huyện Lạc Thủy', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (30519, N'Huyện Yên Thủy', 305)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40101, N'Thành phố Thanh Hóa', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40103, N'Thị xã Bỉm Sơn', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40105, N'Thị xã Sầm Sơn', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40107, N'Huyện Mường Lát', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40109, N'Huyện Quan Hóa', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40111, N'Huyện Quan Sơn', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40113, N'Huyện Bá Thước', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40115, N'Huyện Cẩm Thủy', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40117, N'Huyện Lang Chánh', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40119, N'Huyện Thạch Thành', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40121, N'Huyện Ngọc Lặc', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40123, N'Huyện Thường Xuân', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40125, N'Huyện Như Xuân', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40127, N'Huyện Như Thanh', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40129, N'Huyện Vĩnh Lộc', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40131, N'Huyện Hà Trung', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40133, N'Huyện Nga Sơn', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40135, N'Huyện Yên Định', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40137, N'Huyện Thọ Xuân', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40139, N'Huyện Hậu Lộc', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40141, N'Huyện Thiệu Hoá', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40143, N'Huyện Hoằng Hóa', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40145, N'Huyện Đông Sơn', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40147, N'Huyện Triệu Sơn', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40149, N'Huyện Quảng Xương', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40151, N'Huyện Nông Cống', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40153, N'Huyện Tĩnh Gia', 401)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40301, N'Thành phố Vinh', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40303, N'Thị xã Cửa Lò', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40305, N'Huyện Quế Phong', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40307, N'Huyện Quỳ Châu', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40309, N'Huyện Kỳ Sơn', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40311, N'Huyện Quỳ Hợp', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40313, N'Huyện Nghĩa Đàn', 403)
GO
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40314, N'TX Thái Hoà', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40315, N'Huyện Tương Dương', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40317, N'Huyện Quỳnh Lưu', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40319, N'Huyện Tân Kỳ', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40321, N'Huyện Con Cuông', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40323, N'Huyện Yên Thành', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40325, N'Huyện Diễn Châu', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40327, N'Huyện Anh Sơn', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40329, N'Huyện Đô Lương', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40331, N'Huyện Thanh Chương', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40333, N'Huyện Nghi Lộc', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40335, N'Huyện Nam Đàn', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40337, N'Huyện Hưng Nguyên', 403)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40501, N'Thành phố Hà Tĩnh', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40503, N'Thị xã Hồng Lĩnh', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40505, N'Huyện Nghi Xuân', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40507, N'Huyện Đức Thọ', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40509, N'Huyện Hương Sơn', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40511, N'Huyện Can Lộc', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40513, N'Huyện Thạch Hà', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40515, N'Huyện Cẩm Xuyên', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40517, N'Huyện Hương Khê', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40519, N'Huyện Kỳ Anh', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40521, N'Huyện Vũ Quang', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40523, N'Huyện Lộc Hà', 405)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40701, N'Thành phố Đồng Hới', 407)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40703, N'Huyện Tuyên Hóa', 407)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40705, N'Huyện Minh Hóa', 407)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40707, N'Huyện Quảng Trạch', 407)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40709, N'Huyện Bố Trạch', 407)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40711, N'Huyện Quảng Ninh', 407)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40713, N'Huyện Lệ Thủy', 407)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40901, N'Thị xã Đông Hà', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40903, N'Thị xã Quảng Trị', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40905, N'Huyện Vĩnh Linh', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40907, N'Huyện Gio Linh', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40909, N'Huyện Cam Lộ', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40911, N'Huyện Triệu Phong', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40913, N'Huyện Hải Lăng', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40915, N'Huyện Hướng Hóa', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40917, N'Huyện Đa Krông', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (40919, N'Huyện Đảo Cồn Cỏ', 409)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41101, N'Thành phố Huế', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41103, N'Huyện Phong Điền', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41105, N'Huyện Quảng Điền', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41107, N'Huyện Hương Trà', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41109, N'Huyện Phú Vang', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41111, N'Huyện Hương Thủy', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41113, N'Huyện Phú Lộc', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41115, N'Huyện A Lưới', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (41117, N'Huyện Nam Đông', 411)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50101, N'Quận Hải Châu', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50103, N'Quận Thanh Khê', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50105, N'Quận Sơn Trà', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50107, N'Quận Ngũ Hành Sơn', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50109, N'Quận Liên Chiểu', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50111, N'Huyện Hoà Vang', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50113, N'Huyện Hoàng Sa', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50115, N'Quận Cẩm Lệ', 501)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50301, N'Thành phố Tam Kỳ', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50302, N'Huyện Phú Ninh', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50303, N'Thành Phố Hội An', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50304, N'Huyện Tây Giang', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50305, N'Huyện Đông Giang', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50307, N'Huyện Đại Lộc', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50309, N'Huyện Điện Bàn', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50311, N'Huyện Duy Xuyên', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50313, N'Huyện Nam Giang', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50315, N'Huyện Thăng Bình', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50317, N'Huyện Quế Sơn', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50318, N'Huyện Nông Sơn', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50319, N'Huyện Hiệp Đức', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50321, N'Huyện Tiên Phước', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50323, N'Huyện Phước Sơn', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50325, N'Huyện Núi Thành', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50327, N'Huyện Bắc Trà My', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50329, N'Huyện Nam Trà My', 503)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50501, N'Thành phố Quảng Ngãi', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50503, N'Huyện Lý Sơn', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50505, N'Huyện Bình Sơn', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50507, N'Huyện Trà Bồng', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50508, N'Huyện Tây Trà', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50509, N'Huyện Sơn Tịnh', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50511, N'Huyện Sơn Tây', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50513, N'Huyện Sơn Hà', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50515, N'Huyện Tư Nghĩa', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50517, N'Huyện Nghĩa Hành', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50519, N'Huyện Minh Long', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50521, N'Huyện Mộ Đức', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50523, N'Huyện Đức Phổ', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50525, N'Huyện Ba Tơ', 505)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50701, N'Thành phố Quy Nhơn', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50703, N'Huyện An Lão', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50705, N'Huyện Hoài Nhơn', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50707, N'Huyện Hoài Ân', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50709, N'Huyện Phù Mỹ', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50711, N'Huyện Vĩnh Thạnh', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50713, N'Huyện Phù Cát', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50715, N'Huyện Tây Sơn', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50717, N'Huyện An Nhơn', 507)
GO
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50719, N'Huyện Tuy Phước', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50721, N'Huyện Vân Canh', 507)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50901, N'Thành phố Tuy Hòa', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50903, N'Huyện Đồng Xuân', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50905, N'Huyện Sông Cầu', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50907, N'Huyện Tuy An', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50909, N'Huyện Sơn Hòa', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50911, N'Huyện Đông Hòa', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50912, N'Huyện Tây Hòa', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50913, N'Huyện Sông Hinh', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (50915, N'Huyện Phú Hoà', 509)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51101, N'Thành phố Nha Trang', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51103, N'Huyện Vạn Ninh', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51105, N'Huyện Ninh Hòa', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51107, N'Huyện Diên Khánh', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51109, N'Thị xã Cam Ranh', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51111, N'Huyện Khánh Vĩnh', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51113, N'Huyện Khánh Sơn', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51115, N'Huyện Trường Sa', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (51117, N'Huyện Cam Lâm', 511)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60101, N'Thành phố Kon Tum', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60103, N'Huyện Đắk Glei', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60105, N'Huyện Ngọc Hồi', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60107, N'Huyện Đắk Tô', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60108, N'Huyện Kon Rẫy', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60109, N'Huyện Kon Plông', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60111, N'Huyện Đắk Hà', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60113, N'Huyện Sa Thầy', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60115, N'Huyện Tu Mơ Rông', 601)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60301, N'Thành phố Pleiku', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60303, N'Huyện KBang', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60305, N'Huyện Mang Yang', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60307, N'Huyện Chư Păh', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60309, N'Huyện Ia Grai', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60311, N'Thị xã An Khê', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60313, N'Huyện Kông Chro', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60315, N'Huyện Đức Cơ', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60317, N'Huyện Chư Prông', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60319, N'Huyện Chư Sê', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60320, N'Huyện Ia Pa', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60321, N'Thị xã Ayun Pa', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60323, N'Huyện Krông Pa', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60325, N'Huyện Đăk Đoa', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60327, N'Huyện Đăk Pơ', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60329, N'Huyện Phú Thiện', 603)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60501, N'Thành phố Buôn Ma Thuột', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60503, N'Huyện Ea H-leo', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60505, N'Huyện Ea Súp', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60507, N'Huyện Krông Năng', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60509, N'Thị Xã Buôn Hồ', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60511, N'Huyện Buôn Đôn', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60513, N'Huyện Cư M-gar', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60515, N'Huyện Ea Kar', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60517, N'Huyện M-Đrắk', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60519, N'Huyện Krông Pắc', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60523, N'Huyện Krông A Na', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60525, N'Huyện Krông Bông', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60531, N'Huyện Lắk', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60537, N'Huyện Cư Kuin', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60539, N'Huyện Krông Búk', 605)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60603, N'Huyện Cư Jút', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60605, N'Huyện Krông Nô', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60607, N'Huyện Đắk Mil', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60609, N'Huyện Đắk Song', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60611, N'Huyện Đắk R-Lấp', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60613, N'Thị xã Gia Nghĩa', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60615, N'Huyện Đắk Glong', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (60617, N'Huyện Tuy Đức', 606)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70101, N'Quận 1', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70103, N'Quận 2', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70105, N'Quận 3', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70107, N'Quận 4', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70109, N'Quận 5', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70111, N'Quận 6', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70113, N'Quận 7', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70115, N'Quận 8', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70117, N'Quận 9', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70119, N'Quận 10', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70121, N'Quận 11', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70123, N'Quận 12', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70125, N'Quận Gò Vấp', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70127, N'Quận Tân Bình', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70128, N'Quận Tân Phú', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70129, N'Quận Bình Thạnh', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70131, N'Quận Phú Nhuận', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70133, N'Quận Thủ Đức', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70134, N'Quận Bình Tân', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70135, N'Huyện Củ Chi', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70137, N'Huyện Hóc Môn', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70139, N'Huyện Bình Chánh', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70141, N'Huyện Nhà Bè', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70143, N'Huyện Cần Giờ', 701)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70301, N'Thành phố Đà Lạt', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70303, N'Thị xã Bảo Lộc', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70305, N'Huyện Lạc Dương', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70307, N'Huyện Đơn Dương', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70309, N'Huyện Đức Trọng', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70311, N'Huyện Lâm Hà', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70313, N'Huyện Bảo Lâm', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70315, N'Huyện Di Linh', 703)
GO
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70317, N'Huyện Đạ Huoai', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70319, N'Huyện Đạ Tẻh', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70321, N'Huyện Cát Tiên', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70323, N'Huyện Đam Rông', 703)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70501, N'TP. Phan Rang - Tháp Chàm', 705)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70503, N'Huyện Ninh Sơn', 705)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70505, N'Huyện Ninh Hải', 705)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70507, N'Huyện Ninh Phước', 705)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70509, N'Huyện Bác ái', 705)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70511, N'Huyện Thuận Bắc', 705)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70513, N'Huyện Thuận Nam', 705)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70701, N'Huyện Đồng Phù', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70703, N'Huyện Phước Long', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70705, N'Huyện Lộc Ninh', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70706, N'Huyện Bù Đốp', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70707, N'Huyện Bù Đăng', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70709, N'Huyện Bình Long', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70710, N'Huyện Chơn Thành', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70711, N'Thị xã Đồng Xoài', 707)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70901, N'Thị xã Tây Ninh', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70903, N'Huyện Tân Biên', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70905, N'Huyện Tân Châu', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70907, N'Huyện Dương Minh Châu', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70909, N'Huyện Châu Thành', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70911, N'Huyện Hòa Thành', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70913, N'Huyện Bến Cầu', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70915, N'Huyện Gò Dầu', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (70917, N'Huyện Trảng Bàng', 709)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71101, N'Thị xã Thủ Dầu Một', 711)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71103, N'Huyện Bến Cát', 711)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71105, N'Huyện Tân Uyên', 711)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71107, N'Huyện Thuận An', 711)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71109, N'Huyện Dĩ An', 711)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71111, N'Huyện Phú Giáo', 711)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71113, N'Huyện Dầu Tiếng', 711)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71301, N'Thành phố Biên Hòa', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71302, N'Thị xã Long Khánh', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71303, N'Huyện Tân Phú', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71305, N'Huyện Định Quán', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71307, N'Huyện Vĩnh Cửu', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71308, N'Huyện Trảng Bom', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71309, N'Huyện Thống Nhất', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71311, N'Huyện Cẩm Mỹ', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71313, N'Huyện Xuân Lộc', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71315, N'Huyện Long Thành', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71317, N'Huyện Nhơn Trạch', 713)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71501, N'Thành phố Phan Thiết', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71503, N'Huyện Tuy Phong', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71505, N'Huyện Bắc Bình', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71507, N'Huyện Hàm Thuận Bắc', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71509, N'Huyện Hàm Thuận Nam', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71511, N'Huyện Tánh Linh', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71513, N'Thị xã Lagi', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71514, N'Huyện Hàm Tân', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71515, N'Huyện Đức Linh', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71517, N'Huyện Phú Quí', 715)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71701, N'Thành phố Vũng Tầu', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71703, N'Thị xã Bà Rịa', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71705, N'Huyện Châu Đức', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71707, N'Huyện Xuyên Mộc', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71709, N'Huyện Tân Thành', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71711, N'Huyện Long Điền', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71712, N'Huyện Đất Đỏ', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (71713, N'Huyện Côn Đảo', 717)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80101, N'Thành phố Tân An', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80103, N'Huyện Tân Hưng', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80105, N'Huyện Vĩnh Hưng', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80107, N'Huyện Mộc Hóa', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80109, N'Huyện Tân Thạnh', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80111, N'Huyện Thạnh Hóa', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80113, N'Huyện Đức Huệ', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80115, N'Huyện Đức Hòa', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80117, N'Huyện Bến Lức', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80119, N'Huyện Thủ Thừa', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80121, N'Huyện Châu Thành', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80123, N'Huyện Tân Trụ', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80125, N'Huyện Cần Đước', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80127, N'Huyện Cần Giuộc', 801)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80301, N'Thành phố Cao Lãnh', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80303, N'Thị xã Sa Đéc', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80305, N'Huyện Tân Hồng', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80307, N'Huyện Hồng Ngự', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80309, N'Huyện Tam Nông', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80311, N'Huyện Thanh Bình', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80313, N'Huyện Tháp Mười', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80315, N'Huyện Cao Lãnh', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80317, N'Huyện Lấp Vò', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80319, N'Huyện Lai Vung', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80321, N'Huyện Châu Thành', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80323, N'Thị xã Hồng Ngự', 803)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80501, N'Thành phố Long Xuyên', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80503, N'Thị xã Châu Đốc', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80505, N'Huyện An Phú', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80507, N'Huyện Tân Châu', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80509, N'Huyện Phú Tân', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80511, N'Huyện Châu Phú', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80513, N'Huyện Tịnh Biên', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80515, N'Huyện Tri Tôn', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80517, N'Huyện Chợ Mới', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80519, N'Huyện Châu Thành', 805)
GO
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80521, N'Huyện Thoại Sơn', 805)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80701, N'Thành phố Mỹ Tho', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80703, N'Thị xã Gò Công', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80705, N'Huyện Tân Phước', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80707, N'Huyện Châu Thành', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80709, N'Huyện Cai Lậy', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80711, N'Huyện Chợ Gạo', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80713, N'Huyện Cái Bè', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80715, N'Huyện Gò Công Tây', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80717, N'Huyện Gò Công Đông', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80719, N'Huyện Tân Phú Đông', 807)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80901, N'Thành Phố Vĩnh Long', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80903, N'Huyện Long Hồ', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80905, N'Huyện Mang Thít', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80907, N'Huyện Bình Minh', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80908, N'Huyện Bình Tân', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80909, N'Huyện Tam Bình', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80911, N'Huyện Trà ôn', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (80913, N'Huyện Vũng Liêm', 809)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81101, N'Thị xã Bến Tre', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81103, N'Huyện Châu Thành', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81105, N'Huyện Chợ Lách', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81107, N'Huyện Mỏ Cày Nam', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81108, N'Huyện Mỏ Cày Bắc', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81109, N'Huyện Giồng Trôm', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81111, N'Huyện Bình Đại', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81113, N'Huyện Ba Tri', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81115, N'Huyện Thạnh Phú', 811)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81301, N'Thành phố Rạch Giá', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81303, N'Huyện Kiên Lương', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81305, N'Huyện Hòn Đất', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81307, N'Huyện Tân Hiệp', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81309, N'Huyện Châu Thành', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81311, N'Huyện Giồng Riềng', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81313, N'Huyện Gò Quao', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81315, N'Huyện An Biên', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81317, N'Huyện An Minh', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81319, N'Huyện Vĩnh Thuận', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81321, N'Huyện Phú Quốc', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81323, N'Huyện Kiên Hải', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81325, N'Thị xã Hà Tiên', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81327, N'Huyện U Minh Thượng', 813)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81503, N'Quận Thốt Nốt', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81505, N'Quận Ô Môn', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81519, N'Quận Ninh Kiều', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81521, N'Quận Bình Thuỷ', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81523, N'Quận Cái Răng', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81525, N'Huyện Vĩnh Thạnh', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81527, N'Huyện Cờ Đỏ', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81529, N'Huyện Phong Điền', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81531, N'Huyện Thới Lai', 815)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81601, N'Thị xã Vị Thanh', 816)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81603, N'Huyện Châu Thành A', 816)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81605, N'Huyện Châu Thành', 816)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81607, N'Thị xã Ngã Bảy', 816)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81608, N'Huyện Phụng Hiệp', 816)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81609, N'Huyện Vị Thuỷ', 816)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81611, N'Huyện Long Mỹ', 816)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81701, N'Thị xã Trà Vinh', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81703, N'Huyện Càng Long', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81705, N'Huyện Châu Thành', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81707, N'Huyện Cầu Kè', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81709, N'Huyện Tiểu Cần', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81711, N'Huyện Cầu Ngang', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81713, N'Huyện Trà Cú', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81715, N'Huyện Duyên Hải', 817)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81901, N'Thành phố Sóc Trăng', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81903, N'Huyện Kế Sách', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81905, N'Huyện Long Phú', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81906, N'Huyện Cù Lao Dung', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81907, N'Huyện Mỹ Tú', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81909, N'Huyện Mỹ Xuyên', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81911, N'Huyện Thạnh Trị', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81912, N'Huyện Ngã Năm', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81913, N'Huyện Vĩnh Châu', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (81915, N'Huyện Châu Thành', 819)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82101, N'Thị xã Bạc Liêu', 821)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82103, N'Huyện Hồng Dân', 821)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82105, N'Huyện Vĩnh Lợi', 821)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82106, N'Huyện Hòa Bình', 821)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82107, N'Huyện Giá Rai', 821)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82109, N'Huyện Phước Long', 821)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82111, N'Huyện Đông Hải', 821)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82301, N'Thành phố Cà Mau', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82303, N'Huyện Thới Bình', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82305, N'Huyện U Minh', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82307, N'Huyện Trần Văn Thời', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82308, N'Huyện Phú Tân', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82309, N'Huyện Cái Nước', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82311, N'Huyện Đầm Dơi', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82312, N'Huyện Năm Căn', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82313, N'Huyện Ngọc Hiển', 823)
INSERT [dbo].[landQuanHuyen] ([ID_Quan], [TenQuan], [ID_Tinh]) VALUES (82314, N'Thị xã Kiến Tường', 801)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (101, N'Hà Nội', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (103, N'Hải Phòng', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (107, N'Hải Dương', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (109, N'Hưng Yên', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (111, N'Hà Nam', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (113, N'Nam Định', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (115, N'Thái Bình', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (117, N'Ninh Bình', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (201, N'Hà Giang', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (203, N'Cao Bằng', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (205, N'Lào Cai', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (207, N'Bắc Cạn', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (209, N'Lạng Sơn', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (211, N'Tuyên Quang', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (213, N'Yên Bái', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (215, N'Thái Nguyên', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (217, N'Phú Thọ', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (219, N'Vĩnh Phúc', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (221, N'Bắc Giang', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (223, N'Bắc Ninh', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (225, N'Quảng Ninh', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (301, N'Điện Biên', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (302, N'Lai Châu', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (303, N'Sơn La', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (305, N'Hòa Bình', 1)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (401, N'Thanh Hoá', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (403, N'Nghệ An', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (405, N'Hà Tĩnh', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (407, N'Quảng Bình', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (409, N'Quảng Trị', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (411, N'Thừa Thiên - Huế', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (501, N'Đà Nẵng', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (503, N'Quảng Nam', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (505, N'Quảng Ngãi', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (507, N'Bình Định', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (509, N'Phú Yên', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (511, N'Khánh Hòa', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (601, N'Kon Tum', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (603, N'Gia Lai', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (605, N'Đắc Lắc', 2)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (606, N'Đắk Nông', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (701, N'TP Hồ Chí Minh', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (703, N'Lâm Đồng', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (705, N'Ninh Thuận', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (707, N'Bình Phước', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (709, N'Tây Ninh', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (711, N'Bình Dương', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (713, N'Đồng Nai', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (715, N'Bình Thuận', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (717, N'Bà Rịa - Vũng Tàu', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (801, N'Long An', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (803, N'Đồng Tháp', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (805, N'An Giang', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (807, N'Tiền Giang', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (809, N'Vĩnh Long', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (811, N'Bến Tre', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (813, N'Kiên Giang', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (815, N'Cần Thơ', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (816, N'Hậu Giang', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (817, N'Trà Vinh', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (819, N'Sóc Trăng', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (821, N'Bạc Liêu', 3)
INSERT [dbo].[landTinhThanh] ([ID_Tinh], [TenTinh], [ID_KhuVuc]) VALUES (823, N'Cà Mau', 3)
SET IDENTITY_INSERT [dbo].[LoaiPhieuNhap] ON 

INSERT [dbo].[LoaiPhieuNhap] ([LoaiPhieuNhapId], [TenLoaiPhieuNhap], [LoaiPhieuNhapXuat], [Status], [CreateDate]) VALUES (1, N'Mua hàng', 1, 1, CAST(N'2018-10-27T00:48:21.767' AS DateTime))
INSERT [dbo].[LoaiPhieuNhap] ([LoaiPhieuNhapId], [TenLoaiPhieuNhap], [LoaiPhieuNhapXuat], [Status], [CreateDate]) VALUES (2, N'Nhập trả', 1, 1, CAST(N'2018-10-27T00:48:28.753' AS DateTime))
INSERT [dbo].[LoaiPhieuNhap] ([LoaiPhieuNhapId], [TenLoaiPhieuNhap], [LoaiPhieuNhapXuat], [Status], [CreateDate]) VALUES (3, N'Khác', 1, 1, CAST(N'2018-10-27T00:48:37.717' AS DateTime))
INSERT [dbo].[LoaiPhieuNhap] ([LoaiPhieuNhapId], [TenLoaiPhieuNhap], [LoaiPhieuNhapXuat], [Status], [CreateDate]) VALUES (4, N'Bán lẻ', 2, 1, CAST(N'2018-10-27T00:48:40.993' AS DateTime))
INSERT [dbo].[LoaiPhieuNhap] ([LoaiPhieuNhapId], [TenLoaiPhieuNhap], [LoaiPhieuNhapXuat], [Status], [CreateDate]) VALUES (5, N'Bán sỉ', 2, 1, CAST(N'2018-10-27T00:48:46.567' AS DateTime))
INSERT [dbo].[LoaiPhieuNhap] ([LoaiPhieuNhapId], [TenLoaiPhieuNhap], [LoaiPhieuNhapXuat], [Status], [CreateDate]) VALUES (6, N'Xuất trả', 2, 1, CAST(N'2018-10-27T00:48:51.727' AS DateTime))
INSERT [dbo].[LoaiPhieuNhap] ([LoaiPhieuNhapId], [TenLoaiPhieuNhap], [LoaiPhieuNhapXuat], [Status], [CreateDate]) VALUES (7, N'Khác', 2, 1, CAST(N'2018-10-27T00:48:54.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[LoaiPhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[qtDepartments] ON 

INSERT [dbo].[qtDepartments] ([DepartmentId], [DepartmentName], [Address], [Phone], [Fax], [Email], [UnitId], [SortOrder], [Status], [CreatedDate]) VALUES (1, N'Quản trị hệ thống', NULL, NULL, NULL, NULL, 1, 0, 1, CAST(N'2018-09-16T14:01:31.430' AS DateTime))
INSERT [dbo].[qtDepartments] ([DepartmentId], [DepartmentName], [Address], [Phone], [Fax], [Email], [UnitId], [SortOrder], [Status], [CreatedDate]) VALUES (2, N'Ban lãnh đạo Showroom', NULL, NULL, NULL, NULL, 2, 1, 1, CAST(N'2018-09-16T14:03:17.213' AS DateTime))
INSERT [dbo].[qtDepartments] ([DepartmentId], [DepartmentName], [Address], [Phone], [Fax], [Email], [UnitId], [SortOrder], [Status], [CreatedDate]) VALUES (3, N'Phòng Kinh Doanh', NULL, NULL, NULL, NULL, 2, 2, 1, CAST(N'2018-09-16T14:08:23.553' AS DateTime))
INSERT [dbo].[qtDepartments] ([DepartmentId], [DepartmentName], [Address], [Phone], [Fax], [Email], [UnitId], [SortOrder], [Status], [CreatedDate]) VALUES (4, N'Phòng Hành Chính - Nhân Sự', NULL, NULL, NULL, NULL, 2, 3, 1, CAST(N'2018-09-16T14:08:32.830' AS DateTime))
INSERT [dbo].[qtDepartments] ([DepartmentId], [DepartmentName], [Address], [Phone], [Fax], [Email], [UnitId], [SortOrder], [Status], [CreatedDate]) VALUES (5, N'Phòng Kỹ Thuật', NULL, NULL, NULL, NULL, 2, 4, 1, CAST(N'2018-09-16T14:09:59.820' AS DateTime))
INSERT [dbo].[qtDepartments] ([DepartmentId], [DepartmentName], [Address], [Phone], [Fax], [Email], [UnitId], [SortOrder], [Status], [CreatedDate]) VALUES (6, N'Phòng Tổng Hợp', N'Hà Nội', N'', N'', N'', 2, 5, 1, CAST(N'2018-09-18T22:43:39.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[qtDepartments] OFF
SET IDENTITY_INSERT [dbo].[qtPositions] ON 

INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (1, N'Quản trị phần mềm', N'QTHT', NULL, 1, CAST(N'2018-09-16T13:49:12.270' AS DateTime))
INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (2, N'Giám Đốc', N'GD', NULL, 1, CAST(N'2018-09-16T13:50:01.497' AS DateTime))
INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (3, N'Phó Giám Đốc', N'PGD', NULL, 1, CAST(N'2018-09-16T13:50:12.163' AS DateTime))
INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (4, N'Trưởng Phòng', N'TP', NULL, 1, CAST(N'2018-09-16T13:59:37.153' AS DateTime))
INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (5, N'Phó Phòng', N'PP', NULL, 1, CAST(N'2018-09-16T13:59:47.923' AS DateTime))
INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (6, N'Chuyên Viên', N'CV', NULL, 1, CAST(N'2018-09-16T13:59:59.297' AS DateTime))
INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (7, N'Thư ký', N'TK', NULL, 1, CAST(N'2018-09-16T14:02:49.907' AS DateTime))
INSERT [dbo].[qtPositions] ([PositionId], [PositionName], [Code], [SortOrder], [Status], [CreateDate]) VALUES (8, N'Bảo Vệ', N'BAO_VE', NULL, 1, CAST(N'2018-09-19T01:15:24.923' AS DateTime))
SET IDENTITY_INSERT [dbo].[qtPositions] OFF
SET IDENTITY_INSERT [dbo].[qtRoles] ON 

INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (18, N'QTHT', N'Quản trị người dùng', N'QUAN_TRI_NGUOI_DUNG', 0, 0, 1, CAST(N'2018-11-04T20:54:40.747' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (19, N'QTHT', N'Danh sách người dùng', N'QUAN_TRI_NGUOI_DUNG', 18, 1, 1, CAST(N'2018-11-04T20:57:45.590' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (20, N'QTHT', N'Danh mục đơn vị', N'DANH_MUC_DON_VI', 18, 2, 1, CAST(N'2018-11-04T20:57:51.360' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (21, N'QTHT', N'Danh mục phòng ban', N'DANH_MUC_PHONG_BAN', 18, 3, 1, CAST(N'2018-11-04T20:57:55.797' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (22, N'QTHT', N'Danh mục chức vụ', N'DANH_MUC_CHUC_VU', 18, 4, 1, CAST(N'2018-11-04T20:57:59.637' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (23, N'QTHT', N'Quản lý thành viên', N'QUAN_LY_THANH_VIEN', 0, 0, 1, CAST(N'2018-11-04T21:00:56.370' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (24, N'QTHT', N'Quản lý thành viên', N'QUAN_LY_THANH_VIEN', 23, 1, 1, CAST(N'2018-11-04T21:01:30.937' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (25, N'QTHT', N'Quản lý bình luận sản phẩm', N'QUAN_LY_BINH_LUAN', 23, 2, 1, CAST(N'2018-11-04T21:01:58.980' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (26, N'QTHT', N'Quản trị danh mục', N'QUAN_LY_DANH_MUC', 0, 0, 1, CAST(N'2018-11-04T21:02:40.843' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (27, N'QTHT', N'Danh mục sản phẩm', N'QUAN_LY_DANH_MUC', 26, 1, 1, CAST(N'2018-11-04T21:02:55.287' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (28, N'QTHT', N'Danh mục nổi bật', N'QUAN_LY_DANH_MUC_NOI_BAT', 26, 2, 1, CAST(N'2018-11-04T21:03:22.210' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (29, N'QTHT', N'Quản lý tin tức', N'QUAN_LY_TIN_TUC', 26, 3, 1, CAST(N'2018-11-04T21:03:31.137' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (30, N'QTHT', N'Quản lý banner', N'QUAN_LY_BANNER', 26, 4, 1, CAST(N'2018-11-04T21:03:57.153' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (31, N'QTHT', N'Quản lý màu sắc', N'QUAN_LY_MAU_SAC', 26, 5, 1, CAST(N'2018-11-04T21:04:17.977' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (32, N'QTHT', N'Trang giới thiệu', N'GIOI_THIEU', 26, 6, 1, CAST(N'2018-11-04T21:04:29.203' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (33, N'QTHT', N'Quản lý sản phẩm', N'QUAN_LY_SAN_PHAM', 0, 0, 1, CAST(N'2018-11-04T21:05:39.590' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (34, N'QTHT', N'Quản lý sản phẩm', N'QUAN_LY_SAN_PHAM', 33, 1, 1, CAST(N'2018-11-04T21:06:00.183' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (35, N'QTHT', N'Quản lý sản phẩm nổi bật', N'QUAN_LY_SAN_PHAM_NOI_BAT', 33, 2, 1, CAST(N'2018-11-04T21:06:20.057' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (36, N'QTHT', N'Quản lý khuyến mại', N'QUAN_LY_KHUYEN_MAI', 33, 3, 1, CAST(N'2018-11-04T21:06:41.050' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (37, N'QTHT', N'Tìm kiếm nhanh', N'TIM_KIEM_NHANH', 33, 4, 1, CAST(N'2018-11-04T21:06:53.277' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (38, N'QTHT', N'Quản lý hàng hóa', N'QUAN_LY_DON_HANG', 0, 0, 1, CAST(N'2018-11-04T21:08:06.993' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (39, N'QTHT', N'Quản lý đơn hàng', N'QUAN_LY_DON_HANG', 38, 1, 1, CAST(N'2018-11-04T21:08:35.217' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (40, N'QTHT', N'Quản lý nhập hàng', N'QUAN_LY_NHAP_KHO', 38, 2, 1, CAST(N'2018-11-04T21:08:48.320' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (41, N'QTHT', N'Báo cáo thống kê', N'BAO_CAO_THONG_KE', 0, 0, 1, CAST(N'2018-11-04T21:09:10.540' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (42, N'QTHT', N'Báo cáo thống kê', N'BAO_CAO_THONG_KE', 41, 1, 1, CAST(N'2018-11-04T21:09:31.127' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (43, N'QTHT', N'Báo cáo tồn kho', N'QUAN_LY_TON_KHO', 41, 2, 1, CAST(N'2018-11-04T21:09:45.317' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (44, N'QTHT', N'Báo cáo doanh thu', N'BAO_CAO_DOANH_THU', 41, 3, 1, CAST(N'2018-11-04T21:09:58.660' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (45, N'QTHT', N'Cấu hình người dùng', N'CAU_HINH_CHUC_NANG_DON_VI', 0, 0, 1, CAST(N'2018-11-04T21:10:18.340' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (46, N'QTHT', N'Cấu hình NSD theo đơn vị', N'CAU_HINH_CHUC_NANG_DON_VI', 45, 1, 1, CAST(N'2018-11-04T21:10:43.977' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (47, N'QTHT', N'Cấu hình NSD theo phòng', N'CAU_HINH_CHUC_NANG_PHONG', 45, 2, 1, CAST(N'2018-11-04T21:10:57.210' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (48, N'QTHT', N'Phân công quản lý đơn vị', N'PHAN_CONG_QUAN_LY_DON_VI', 45, 3, 1, CAST(N'2018-11-04T21:11:09.990' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (49, N'QTHT', N'Quản trị người dùng', N'PHAN_QUYEN', 0, 0, 1, CAST(N'2018-11-04T21:11:45.513' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (50, N'QTHT', N'Phân quyền', N'PHAN_QUYEN', 49, 1, 1, CAST(N'2018-11-04T21:12:03.890' AS DateTime))
INSERT [dbo].[qtRoles] ([RoleId], [Application], [RoleName], [Description], [ParentId], [SortOrder], [Status], [CreatedDete]) VALUES (51, N'QTHT', N'Cấu hình Menu', N'USER_IN_ROLE', 49, 2, 1, CAST(N'2018-11-04T21:12:20.190' AS DateTime))
SET IDENTITY_INSERT [dbo].[qtRoles] OFF
SET IDENTITY_INSERT [dbo].[qtUnitManager] ON 

INSERT [dbo].[qtUnitManager] ([UnitManagerId], [UserId], [UnitId], [Active]) VALUES (1, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[qtUnitManager] OFF
SET IDENTITY_INSERT [dbo].[qtUnits] ON 

INSERT [dbo].[qtUnits] ([UnitId], [UnitName], [UnitCode], [ParentId], [LevelCode], [SortOrder], [Email], [PhoneNumber], [Status], [CreatedDate]) VALUES (1, N'Công ty chăn ga gối đệm Everpia', N'EVERPIA', NULL, N'CONG_TY', 0, NULL, NULL, 1, CAST(N'2018-09-16T13:49:12.270' AS DateTime))
INSERT [dbo].[qtUnits] ([UnitId], [UnitName], [UnitCode], [ParentId], [LevelCode], [SortOrder], [Email], [PhoneNumber], [Status], [CreatedDate]) VALUES (2, N'Chi nhánh Showroom', N'CNSHOWHROOM', 1, N'CHI_NHANH', 1, NULL, NULL, 1, CAST(N'2018-09-16T13:53:25.020' AS DateTime))
INSERT [dbo].[qtUnits] ([UnitId], [UnitName], [UnitCode], [ParentId], [LevelCode], [SortOrder], [Email], [PhoneNumber], [Status], [CreatedDate]) VALUES (6, N'Chi nhánh Nam Hà Nội', N'CNHANOI', 1, N'CHI_NHANH', 2, NULL, NULL, 1, CAST(N'2018-10-26T23:08:07.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[qtUnits] OFF
SET IDENTITY_INSERT [dbo].[qtUserConfig] ON 

INSERT [dbo].[qtUserConfig] ([UserConfigId], [UnitId], [AppName], [AppCode], [IsActive]) VALUES (1, 2, N'Lãnh Đạo Đơn Vị', N'LANH_DAO_DON_VI', 1)
INSERT [dbo].[qtUserConfig] ([UserConfigId], [UnitId], [AppName], [AppCode], [IsActive]) VALUES (2, 2, N'Cấu Hình Tài Khoản Nhận Email, Thông Báo Tiếp Nhận Đơn Hàng', N'TAI_KHOAN_EMAIL_THONG_BAO_TIEP_NHAN_DON_HANG', 1)
INSERT [dbo].[qtUserConfig] ([UserConfigId], [UnitId], [AppName], [AppCode], [IsActive]) VALUES (3, 2, N'Danh sách tài khoản nhận đơn hàng ( random)', N'TAI_KHOAN_NHAN_DON_HANG', 1)
SET IDENTITY_INSERT [dbo].[qtUserConfig] OFF
SET IDENTITY_INSERT [dbo].[qtUserConfigDetail] ON 

INSERT [dbo].[qtUserConfigDetail] ([UserConfigDetailId], [UserConfigId], [UserId], [OrderBy]) VALUES (6, 1, 2, 1)
INSERT [dbo].[qtUserConfigDetail] ([UserConfigDetailId], [UserConfigId], [UserId], [OrderBy]) VALUES (11, 2, 2, 1)
INSERT [dbo].[qtUserConfigDetail] ([UserConfigDetailId], [UserConfigId], [UserId], [OrderBy]) VALUES (12, 3, 3, 1)
INSERT [dbo].[qtUserConfigDetail] ([UserConfigDetailId], [UserConfigId], [UserId], [OrderBy]) VALUES (13, 3, 4, 2)
SET IDENTITY_INSERT [dbo].[qtUserConfigDetail] OFF
SET IDENTITY_INSERT [dbo].[qtUserRole] ON 

INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (1, 18, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (2, 19, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (3, 20, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (4, 21, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (5, 22, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (6, 23, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (7, 24, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (8, 25, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (9, 26, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (10, 27, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (11, 28, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (12, 29, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (13, 30, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (14, 31, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (15, 32, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (16, 33, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (17, 34, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (18, 35, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (19, 36, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (20, 37, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (21, 38, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (22, 39, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (23, 40, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (24, 41, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (25, 42, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (26, 43, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (27, 44, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (28, 45, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (29, 46, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (30, 47, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (31, 48, 2, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (53, 23, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (54, 24, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (55, 25, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (56, 26, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (57, 27, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (58, 28, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (59, 29, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (60, 33, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (61, 34, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (62, 35, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (63, 37, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (64, 38, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (65, 39, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (66, 40, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (67, 41, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (68, 42, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (69, 43, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (70, 44, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (71, 45, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (72, 46, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (73, 47, 2, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (74, 23, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (75, 24, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (76, 25, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (77, 26, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (78, 30, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (79, 31, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (80, 32, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (81, 33, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (82, 34, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (83, 36, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (84, 37, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (85, 38, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (86, 39, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (87, 40, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (88, 41, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (89, 42, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (90, 43, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (91, 44, 2, 5, 7, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (92, 18, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (93, 19, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (94, 20, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (95, 21, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (96, 22, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (97, 23, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (98, 24, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (99, 25, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (100, 26, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (101, 27, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (102, 28, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (103, 29, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (104, 30, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (105, 31, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (106, 32, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (107, 33, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (108, 34, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (109, 35, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (110, 36, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (111, 37, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (112, 38, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (113, 39, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (114, 40, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (115, 41, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (116, 42, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (117, 43, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (118, 44, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (119, 45, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (120, 46, 1, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (121, 47, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (122, 48, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (123, 49, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (124, 50, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[qtUserRole] ([UserRoleId], [RoleId], [UnitId], [DepartmentId], [PositionId], [Application], [Status], [CreatedDate]) VALUES (125, 51, 1, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[qtUserRole] OFF
SET IDENTITY_INSERT [dbo].[qtUsers] ON 

INSERT [dbo].[qtUsers] ([UserId], [UserName], [UserLogin], [Password], [SortOrder], [ImageFile], [Address], [Sex], [Email], [Tel], [Phone], [IsAdmin], [Notes], [UnitId], [DepartmentId], [PositionId], [Status], [CreatedDate]) VALUES (1, N'Quản trị', N'administrator', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', 1, NULL, N' ', 1, N'nghinv00@gmail.com', N' ', N' ', 1, N' ', 1, 1, 1, 0, CAST(N'2018-09-16T14:15:52.063' AS DateTime))
INSERT [dbo].[qtUsers] ([UserId], [UserName], [UserLogin], [Password], [SortOrder], [ImageFile], [Address], [Sex], [Email], [Tel], [Phone], [IsAdmin], [Notes], [UnitId], [DepartmentId], [PositionId], [Status], [CreatedDate]) VALUES (2, N'Nguyễn Văn Nghi', N'nghinv', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', 2, NULL, N' ', 1, N'nghinv00@gmail.com', N'', N' ', 0, N' ', 2, 2, 4, 1, CAST(N'2018-11-04T21:43:36.837' AS DateTime))
INSERT [dbo].[qtUsers] ([UserId], [UserName], [UserLogin], [Password], [SortOrder], [ImageFile], [Address], [Sex], [Email], [Tel], [Phone], [IsAdmin], [Notes], [UnitId], [DepartmentId], [PositionId], [Status], [CreatedDate]) VALUES (3, N'Nguyễn Thị Bình', N'binhnt', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', 3, NULL, N' ', 1, N'nghinv00@gmail.com', N'', N' ', 0, N' ', 2, 5, 6, 1, CAST(N'2018-11-04T21:44:12.143' AS DateTime))
INSERT [dbo].[qtUsers] ([UserId], [UserName], [UserLogin], [Password], [SortOrder], [ImageFile], [Address], [Sex], [Email], [Tel], [Phone], [IsAdmin], [Notes], [UnitId], [DepartmentId], [PositionId], [Status], [CreatedDate]) VALUES (4, N'Nguyễn Văn Công', N'congnv', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', 4, NULL, N' ', 1, N'nghinv00@gmail.com', N'', N' ', 0, N' ', 2, 5, 7, 1, CAST(N'2018-11-04T21:48:23.550' AS DateTime))
SET IDENTITY_INSERT [dbo].[qtUsers] OFF
SET IDENTITY_INSERT [dbo].[shAboutus] ON 

INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'1db4d7a7dded4fa7b886ee86d4eebe49', 9, N'SƠ ĐỒ TỔ CHỨC', N'/gioi-thieu/so-do-to-chuc', N'', N'', NULL, N'', N'', N'', NULL, NULL, 1, CAST(N'2018-10-18T22:36:58.407' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'31de4daee2e347d093e1d985f7c4a8ae', 5, N'', N'/gioi-thieu/', N'', N'<div>
	&nbsp;</div>
<div>
	<div class="n-content" style="box-sizing: border-box; margin: 0px; padding: 0px 20px 0px 0px; width: 295px; float: left; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
		<span style="box-sizing: border-box; font-weight: 700;">Năm 2012</span>, Công ty tiếp tục cung cấp ra thị trường dòng sản phẩm trẻ em: Baby Collection với hai dòng sản phẩm chủ đạo: Doraemon và Hello Kitty, được mua bản quyền từ Nhật Bản đánh dấu bước phát triển vượt bậc trên thị trường cũng như khẳng định uy tín của công ty với các đối tác trong và ngoài nước. Các sản phẩm có màu sắc rực rỡ, hình ảnh ngộ nghĩnh, đáng yêu phù hợp với trẻ sơ sinh, trẻ nhỏ và thanh thiếu niên.</div>
</div>
<div>
	&nbsp;</div>
', 2018, N'', N'/images/banner/10_2018/eb66b6d050e84be4a4af28998d785951about4.jpg', N'4cb965ac2fcb46e1996a89814f048354', 4, NULL, 1, CAST(N'2018-11-23T19:55:38.883' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'40688d8fcb324e06aa888917131229ec', 8, N'SỨ MỆNH & TẦM NHÌN', N'/gioi-thieu/su-menh-tam-nhin', N'', N'<p>
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">Sứ mệnh của chúng tôi là mong muốn phục vụ đồng bào mình với những sản phẩm ở ĐỈNH CAO CỦA TINH HOA CHẤT LƯỢNG do bàn tay, khối óc người Việt làm ra vì sức khỏe, niềm tin, tình yêu thương và sự phát triển mạnh mẽ của một Việt Nam hôm nay và ngày mai.</span><br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;" />
	<br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;" />
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">Tầm nhìn: Trở thành công ty sản xuất Chăn ga gối đệm hàng đầu Việt Nam về sản xuất, tiêu thụ sản phẩm trong và ngoài nước</span></p>
', NULL, N'', N'', N'', 3, NULL, 1, CAST(N'2018-10-18T22:36:04.147' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'4cb965ac2fcb46e1996a89814f048354', 1, N'GIỚI THIỆU VỀ HỆ THỐNG', N'/gioi-thieu/gioi-thieu-ve-he-thong', N'', N'<div>
	<div style="box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
		<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px;">
			<span style="box-sizing: border-box; font-weight: 700;">Với những con số &quot;biết nói&quot; về doanh thu và lợi nhuận cũng như quy mô nhà xưởng, máy móc liên tục được đầu tư, phát triển và mở rộng, chúng tôi tự tin và hướng về tương lai với các sản phẩm mang đặc trưng tâm hồn người VIệt, đậm đà bản sắc dân tốc nhưng đồng thời cũng mang nhiều nét hiện đại, đổi mới. May Công ty nguyện cùng đồng hành với Người tiêu dùng trong phong trào &quot;Người Việt dùng hàng Việt&quot; như một sự tri ân những khách hàng đã gắn bó, tin tưởng Công ty trong nhiều năm qua.</span></p>
		<div>
			&nbsp;</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, N'', N'/images/banner/10_2018/a9d84029b45d4f8c896ed77de2221280about2.jpg', N'', 1, NULL, 1, CAST(N'2018-11-23T19:56:05.423' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'ae621f1ac9b74bd2ad5e972deddc540d', 2, N'Ra đời vào năm', N'/gioi-thieu/ra-doi-vao-nam', N'', N'<div>
	&nbsp;</div>
<div>
	<span style="box-sizing: border-box; font-weight: 700; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">Ra đời vào năm 2018</span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">, sản phẩm Chăn ga gối đệm Cao cấp chính thức đánh dấu sự tham gia một thương hiệu nội địa vào thị trường hàng tiêu dùng trong nước, nhằm cạnh tranh với các thương hiệu và Công ty nước ngoài vốn độc chiếm thị trường lâu nay. Chúng tôi muốn chứng minh rằng, các Doanh nghiệp, doanh nhân Việt Nam luôn mang trong mình khát vọng và ý chí vươn lên mãnh liệt.</span></div>
', 2018, N'', N'/images/banner/10_2018/97adca0cc091447a9e63ee8a10a4c69babout2.jpg', N'4cb965ac2fcb46e1996a89814f048354', 1, NULL, 1, CAST(N'2018-11-23T19:53:13.693' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'dd76d6b20e57481783bf65e6cd5ee599', 4, N'', N'/gioi-thieu/', N'', N'<p>
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">Công ty tiếp tục cải tiến và phát triển dòng sản phẩm truyền thống hiện có là Classic Collection, đồng thời cho ra mắt hai dòng sản phẩm mới là Home Collection và Luxury Collection hướng tới tất cả các đối tượng người tiêu dùng trên khắp lãnh thổ Việt Nam. Tất cả các sản phẩm mới đều sử dụng các nguyên liệu chất lượng cao nhất, được thiết kế cầu kỳ, đa dạng, mang tính Thời trang và thẩm mỹ cao nhằm đem lại cảm giác hài hoà, thoải mái và ấm áp cho mọi căn phòng ngủ của các gia đình Việt Nam.</span></p>
', 2018, N'', N'/images/banner/10_2018/8f2906f5f9324828a5df6a2e67059192about4.jpg', N'4cb965ac2fcb46e1996a89814f048354', 3, NULL, 1, CAST(N'2018-11-04T12:07:11.577' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'f736fd8b60c343ab807f19650c550a50', 7, N'', N'/gioi-thieu/', N'', N'<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-weight: 700; color: rgb(178, 34, 34); font-size: 18px; line-height: 16px; text-align: justify;">LỜI TỰ SỰ CUỐI NĂM NĂM 2018</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;; line-height: 20.8px;">Tựa như một cơ thể sống, Công ty May đã bước vào tuổi đầu tiên tràn đầy sinh lực của mình. Thật khó có thể hình dung được sự đổi thay, lớn mạnh vượt bậc với một doanh nghiệp mà lúc ra đời chỉ có mấy chục chiếc máy đạp chân, chẳng đồng vốn dự trữ, vậy mà có mấy chàng trai dù chưa một lần kinh qua doanh nghiệp đã dám cả gan xin nhận sứ mệnh xây dựng cơ đồ của Công ty&nbsp;bấy giờ. Không kịp ngoái lại phía sau đã gặp bao gian truân, trắc trở nữa, chỉ biết rằng đã có những lúc gần như rơi xuống sự tận cùng của bế tắc và tuyệt vọng, nhất là với một doanh nghiệp nhỏ bé ở địa phương, chống chọi thế nào đây với những trận cuồng phong suy thoái kinh tế trong nước, sự kiềm tỏa đến nghẹt thở từ thế giới bên ngoài &hellip;. mà không có bất cứ thế lực nào che chở. Kiên trì kiếm tìm từng khe sáng nhỏ trong cuộc sống,&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">May&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">&nbsp;cứ lặng lẽ tiến bước, để khi gặp cơ hội bỗng bừng lên như một hiện tượng thật riêng biệt, vượt qua hàng nghìn doanh nghiệp để đứng vào Top 5 lớn nhất của ngành Dệt &ndash; May Việt Nam với một gia sản hùng mạnh đến giờ tới hàng nghìn tỷ đồng, gần 8.000 lao động để tạo ra mỗi năm trên dưới 2.000 tỷ đồng doanh thu, hàng trăm tỷ đồng lợi nhuận, tạo thu nhập cho cán bộ, công nhân ở mức cao nhất trong các doanh nghiệp Dệt &ndash; May Việt Nam &hellip; Thật tự hào khi nhiều tập đoàn lớn trên thế giới với những thương hiệu nổi tiếng luôn coi&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">May&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">&nbsp;là đối tác tin cậy để tham gia chuỗi giá trị và phân phối toàn cầu của họ. Và cũng thật hạnh phúc khi hàng vạn gia đình Việt Nam có các sản phẩm Chăn &ndash; Đệm&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">May&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">&nbsp;làm ấm lòng các cụ già khi mùa đông gió lạnh và sáng bừng đôi mắt trẻ thơ với các sản phẩm Doraemon, Hello Kitty mà chúng mặc nhiên coi đó là thứ sản phẩm đặc hữu của chỉ riêng mình &hellip;</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;; line-height: 20.8px;">Là người đã tham gia vun trồng từng ngọn cỏ, gốc cây, đặt từng viên gạch móng của Công ty, tôi luôn khát khao một điều tâm ước: Ngoài hàng rào Công ty có thể còn nhiều xô bồ, ngang trái nhưng trong cánh cổng Công ty, nhất định phải là một xã hội khác. Ở đây nhân cách con người luôn được coi trọng, mỗi người đều có cơ hội thăng tiến không ngừng. Sẽ không có bất cứ nỗi đau oan trái nào xảy ra với bất cứ ai. Công ty sẽ đem lại cho mọi người nguồn công việc, nguồn sống cơ bản, bền vững và lương thiện nhất. Các thế hệ con cái sẽ mãi nối tiếp làm việc ở Công ty&nbsp;May . Sẽ có các khu cư dân Công ty&nbsp;May&nbsp;&nbsp;được sống trong sự trù phú, văn minh &hellip;</span><br style="box-sizing: border-box; font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;; line-height: 20.8px;" />
	<span style="box-sizing: border-box; font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;; line-height: 20.8px;">Nặng lòng mang ơn những người bạn, người đồng chí đã cùng hoặc giúp tôi vượt qua mọi gian nan để tạo dựng lên cơ nghiệp Công ty&nbsp;May . Nếu không có mọi người, không thể có Công ty&nbsp;May&nbsp;&nbsp;lớn mạnh hôm nay &hellip;</span><br style="box-sizing: border-box; font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;; line-height: 20.8px;" />
	<span style="box-sizing: border-box; font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;; line-height: 20.8px;">Ra đời từ gian khó, lớn lên trong phong ba,&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty&nbsp;</span><span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">May đã vươn tới biển cả. Sức sống ấy không có gì cản ngăn được nữa vì nó đã trở thành biểu tượng của sự huy hoàng và bất tử!&nbsp;</span></p>
<div>
	&nbsp;</div>
', NULL, N'', N'', N'f79d35586bd24f2c8534ec98cfd96792', NULL, NULL, 1, CAST(N'2018-11-23T19:58:39.833' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'f79d35586bd24f2c8534ec98cfd96792', 6, N'LỜI TỰ SỰ', N'/gioi-thieu/loi-tu-su', N'', N'<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-size: 20px;">3 tháng, song hành cùng lời tự sự...</span></em></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; line-height: 1.6em;">Bộ sản phẩm Chăn-Bông-Đệm ra đời muộn hơn chừng nửa chặng đường so với chiều dài về thời gian của Công ty. Rất giống hình hài Công ty lúc thành lập, tất cả đều chơi vơi, mông lung cùng với những gian nan, khốn khó khôn cùng. Trên mỗi bước đường, trong mỗi sản phẩm của Công ty dường như&nbsp;đều có chút&nbsp;hơi hướng lãng mạn nào đó của&nbsp;những kẻ say mê&nbsp;nghệ thuật, luôn&nbsp;tự hành xác, dấn thân&nbsp;vào những&nbsp;tìm tòi, khám phá&nbsp;và có cả chút ngang tàng, liều lĩnh&nbsp;đến ngỡ ngàng nữa về&nbsp;tính cách&nbsp;của những người lính.&nbsp;</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	Rất lạ lẫm&nbsp;với cái tên Chăn-Bông-Đệm cách&nbsp;đây 3 tháng,&nbsp;ít ai có thể ngờ được giờ đã là một thương hiệu rất nổi tiếng và trở thành những sản vật vô cùng thân thiết của các gia đình Việt nam. Tất cả đều Việt nam, từ tên gọi Công ty&nbsp;đến&nbsp;tên gọi sản phẩm&nbsp;đều mang trọn vẹn cốt cách Việt nam. Ông bà, cha mẹ&nbsp;đặt cho mỗi người chúng ta một cái tên Việt nam,&nbsp;để ghi nhớ rằng, dù&nbsp;cuộc đời có thế nào&nbsp;đi nữa thì&nbsp;trước hết và mãi mãi, ta vẫn là Việt nam, là người Việt nam.&nbsp;Mỗi cán bộ, công nhân và mỗi&nbsp;sản phẩm của&nbsp;<span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty</span>&nbsp;đều luôn mang trong mình dòng máu kiêu hãnh và tự hào ấy mặc dù không phải lúc nào cũng đầy hoa thơm, trái ngọt.</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty</span>&nbsp;đang tham gia sản xuất&nbsp;nhiều thương hiệu may mặc nổi tiếng thế giới cùng với những cam kết về&nbsp;trách nhiệm xã hội, đạo đức, môi trường, an toàn, an ninh...rất nghiêm ngặt. Các sản phẩm Chăn-Bông-Đệm của Công ty dù hiện tại đang tiêu thụ trong nước là chính, song&nbsp;<span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty&nbsp;</span>đã mang toàn bộ những tiêu chí ấy vào quá trình sản xuất các sản phẩm của mình, dẫu biết như thế là sẽ tăng thêm chi phí và giảm lợi nhuận rất nhiều so với những hãng khác.&nbsp;Song, lãi nhiều, lời cao, liệu có thể&nbsp;mang lại&nbsp;sự bình yên, khi&nbsp;trong lòng nó mang theo những vết hằn của sự thiếu trung thực và nặng hơn là sự dối trá với đồng bào của mình,&nbsp;với môi trường sống của cộng đồng.</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	Tuy không là tín đồ của một tôn giáo cụ thể nào cả, song tôi rất tin vào thuyết nhân quả. Hãy làm việc tận tụy và sống&nbsp;lương thiện&nbsp;thì cuộc đời luôn giang tay ra đón. Nếu có ngã thì cũng sẽ&nbsp;ngã vào lòng cuôc sống, rồi lại&nbsp;đứng lên&nbsp;chứ không bao giờ bị chối từ, xua đuổi. Phải chăng từ tâm niệm ấy mà&nbsp;<span style="font-family: sans-serif, Arial, Verdana, &quot;Trebuchet MS&quot;;">Công ty</span>&nbsp;đã lớn mạnh vượt bậc dù phải trải qua bao đắng cay, gian khổ. Phải chăng vì mang theo sự tinh khôi, trong&nbsp;trắng ấy mà các sản phẩm Chăn-Bông-Đệm luôn như những cơn gió mang những điều may mắn và&nbsp;tốt lành đến với các gia đình Việt nam.</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	Hành trình 3 tháng với &quot;4 mùa yêu thương &quot;để có một Thương hiệu Chăn-Bông-Đệm rạng rỡ hôm nay!</p>
', NULL, N'<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-weight: 700; line-height: 16px; text-align: justify;">CÔNG TY CP MAY</span></p>
<p>
	<br style="box-sizing: border-box; line-height: 16px; text-align: justify;" />
	<div style="text-align: justify;">
		Giám đốc ký tên</div>
</p>
<div>
	&nbsp;</div>
', N'', N'', 2, NULL, 1, CAST(N'2018-11-23T20:00:42.877' AS DateTime))
INSERT [dbo].[shAboutus] ([AboutGuid], [AboutId], [AboutTitle], [MetaTitle], [AboutName], [AboutContent], [Year], [Sign], [ImageUrl], [ParentId], [SortOrder], [UserId], [Status], [CreateDate]) VALUES (N'fc25db3e310f427cba15039925f24b41', 3, N'SAU HƠN 3 Tháng', N'/gioi-thieu/sau-hon-3-thang', N'', N'<p>
	<span style="box-sizing: border-box; font-weight: 700; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">Sau hơn 3 </span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">tháng xuất hiện trên thị trường, thương hiệu Công Ty đã dần khẳng định được chỗ đứng của mình, được người tiêu dùng tin tưởng và trở thành sản phẩm quen thuộc của nhiều gia đình Việt Nam. Để xứng đáng với niềm tin ấy và không ngừng vươn xa hơn để trở thành niềm tự hào của các thương hiệu Việt Nam, Công ty hiện không ngừng đầu tư đổi mới công nghệ sản xuất, thiết bị, chú trọng đầu tư vào việc thiết kế, quản lý chất lượng sản phẩm, quảng bá thương hiệu. Công ty cũng rất quan tâm đến tính an toàn và sức khỏe của người tiêu dùng bằng những cam kết và quy trình kiểm tra chất lượng nghiêm ngặt trên từng sản phẩm cũng như lựa chọn&nbsp;các nhà cung cấp nguyên liệu uy tín.</span></p>
<div alt="0" id="SL_balloon_obj" style="display: block;">
	<div class="SL_ImTranslatorLogo" id="SL_button" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/imtranslator-s.png&quot;); display: none; opacity: 1;">
		&nbsp;</div>
	<div id="SL_shadow_translation_result2" style="display: none;">
		&nbsp;</div>
	<div id="SL_shadow_translator" style="display: none;">
		<div id="SL_planshet">
			<div id="SL_arrow_up" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/up.png&quot;);">
				&nbsp;</div>
			<div id="SL_Bproviders">
				<div class="SL_BL_LABLE_ON" id="SL_P0" title="Google">
					G</div>
				<div class="SL_BL_LABLE_ON" id="SL_P1" title="Microsoft">
					M</div>
				<div class="SL_BL_LABLE_ON" id="SL_P2" title="Translator">
					T</div>
			</div>
			<div id="SL_alert_bbl" style="display: none;">
				<div id="SLHKclose" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/delete.png&quot;);">
					&nbsp;</div>
				<div id="SL_alert_cont">
					&nbsp;</div>
			</div>
			<div id="SL_TB">
				<table cellspacing="1" id="SL_tables">
					<tbody>
						<tr>
							<td align="right" class="SL_td" width="10%">
								<input id="SL_locer" title="Lock-in language" type="checkbox" /></td>
							<td align="left" class="SL_td" width="20%">
								<select id="SL_lng_from" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/select.png&quot;) 100% 0px no-repeat rgb(255, 255, 255);"><option value="auto">Detect language</option><option value="af">Afrikaans</option><option value="sq">Albanian</option><option value="am">Amharic</option><option value="ar">Arabic</option><option value="hy">Armenian</option><option value="az">Azerbaijani</option><option value="eu">Basque</option><option value="be">Belarusian</option><option value="bn">Bengali</option><option value="bs">Bosnian</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="ceb">Cebuano</option><option value="ny">Chichewa</option><option value="zh-CN">Chinese (Simplified)</option><option value="zh-TW">Chinese (Traditional)</option><option value="co">Corsican</option><option value="hr">Croatian</option><option value="cs">Czech</option><option value="da">Danish</option><option value="nl">Dutch</option><option value="en">English</option><option value="eo">Esperanto</option><option value="et">Estonian</option><option value="tl">Filipino</option><option value="fi">Finnish</option><option value="fr">French</option><option value="fy">Frisian</option><option value="gl">Galician</option><option value="ka">Georgian</option><option value="de">German</option><option value="el">Greek</option><option value="gu">Gujarati</option><option value="ht">Haitian Creole</option><option value="ha">Hausa</option><option value="haw">Hawaiian</option><option value="iw">Hebrew</option><option value="hi">Hindi</option><option value="hmn">Hmong</option><option value="hu">Hungarian</option><option value="is">Icelandic</option><option value="ig">Igbo</option><option value="id">Indonesian</option><option value="ga">Irish</option><option value="it">Italian</option><option value="ja">Japanese</option><option value="jw">Javanese</option><option value="kn">Kannada</option><option value="kk">Kazakh</option><option value="km">Khmer</option><option value="ko">Korean</option><option value="ku">Kurdish</option><option value="ky">Kyrgyz</option><option value="lo">Lao</option><option value="la">Latin</option><option value="lv">Latvian</option><option value="lt">Lithuanian</option><option value="lb">Luxembourgish</option><option value="mk">Macedonian</option><option value="mg">Malagasy</option><option value="ms">Malay</option><option value="ml">Malayalam</option><option value="mt">Maltese</option><option value="mi">Maori</option><option value="mr">Marathi</option><option value="mn">Mongolian</option><option value="my">Myanmar (Burmese)</option><option value="ne">Nepali</option><option value="no">Norwegian</option><option value="ps">Pashto</option><option value="fa">Persian</option><option value="pl">Polish</option><option value="pt">Portuguese</option><option value="pa">Punjabi</option><option value="ro">Romanian</option><option value="ru">Russian</option><option value="sm">Samoan</option><option value="gd">Scots Gaelic</option><option value="sr">Serbian</option><option value="st">Sesotho</option><option value="sn">Shona</option><option value="sd">Sindhi</option><option value="si">Sinhala</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="so">Somali</option><option value="es">Spanish</option><option value="su">Sundanese</option><option value="sw">Swahili</option><option value="sv">Swedish</option><option value="tg">Tajik</option><option value="ta">Tamil</option><option value="te">Telugu</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="ur">Urdu</option><option value="uz">Uzbek</option><option value="vi">Vietnamese</option><option value="cy">Welsh</option><option value="xh">Xhosa</option><option value="yi">Yiddish</option><option value="yo">Yoruba</option><option value="zu">Zulu</option></select></td>
							<td align="center" class="SL_td" width="3">
								<div id="SL_switch_b" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/switchb.png&quot;);" title="Switch languages">
									&nbsp;</div>
							</td>
							<td align="left" class="SL_td" width="20%">
								<select id="SL_lng_to" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/select.png&quot;) 100% 0px no-repeat rgb(255, 255, 255);"><option value="af">Afrikaans</option><option value="sq">Albanian</option><option value="am">Amharic</option><option value="ar">Arabic</option><option value="hy">Armenian</option><option value="az">Azerbaijani</option><option value="eu">Basque</option><option value="be">Belarusian</option><option value="bn">Bengali</option><option value="bs">Bosnian</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="ceb">Cebuano</option><option value="ny">Chichewa</option><option value="zh-CN">Chinese (Simplified)</option><option value="zh-TW">Chinese (Traditional)</option><option value="co">Corsican</option><option value="hr">Croatian</option><option value="cs">Czech</option><option value="da">Danish</option><option value="nl">Dutch</option><option value="en">English</option><option value="eo">Esperanto</option><option value="et">Estonian</option><option value="tl">Filipino</option><option value="fi">Finnish</option><option value="fr">French</option><option value="fy">Frisian</option><option value="gl">Galician</option><option value="ka">Georgian</option><option value="de">German</option><option value="el">Greek</option><option value="gu">Gujarati</option><option value="ht">Haitian Creole</option><option value="ha">Hausa</option><option value="haw">Hawaiian</option><option value="iw">Hebrew</option><option value="hi">Hindi</option><option value="hmn">Hmong</option><option value="hu">Hungarian</option><option value="is">Icelandic</option><option value="ig">Igbo</option><option value="id">Indonesian</option><option value="ga">Irish</option><option value="it">Italian</option><option value="ja">Japanese</option><option value="jw">Javanese</option><option value="kn">Kannada</option><option value="kk">Kazakh</option><option value="km">Khmer</option><option value="ko">Korean</option><option value="ku">Kurdish</option><option value="ky">Kyrgyz</option><option value="lo">Lao</option><option value="la">Latin</option><option value="lv">Latvian</option><option value="lt">Lithuanian</option><option value="lb">Luxembourgish</option><option value="mk">Macedonian</option><option value="mg">Malagasy</option><option value="ms">Malay</option><option value="ml">Malayalam</option><option value="mt">Maltese</option><option value="mi">Maori</option><option value="mr">Marathi</option><option value="mn">Mongolian</option><option value="my">Myanmar (Burmese)</option><option value="ne">Nepali</option><option value="no">Norwegian</option><option value="ps">Pashto</option><option value="fa">Persian</option><option value="pl">Polish</option><option value="pt">Portuguese</option><option value="pa">Punjabi</option><option value="ro">Romanian</option><option value="ru">Russian</option><option value="sm">Samoan</option><option value="gd">Scots Gaelic</option><option value="sr">Serbian</option><option value="st">Sesotho</option><option value="sn">Shona</option><option value="sd">Sindhi</option><option value="si">Sinhala</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="so">Somali</option><option value="es">Spanish</option><option value="su">Sundanese</option><option value="sw">Swahili</option><option value="sv">Swedish</option><option value="tg">Tajik</option><option value="ta">Tamil</option><option value="te">Telugu</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="ur">Urdu</option><option value="uz">Uzbek</option><option selected="selected" value="vi">Vietnamese</option><option value="cy">Welsh</option><option value="xh">Xhosa</option><option value="yi">Yiddish</option><option value="yo">Yoruba</option><option value="zu">Zulu</option></select></td>
							<td align="center" class="SL_td" width="5%">
								&nbsp;</td>
							<td align="center" class="SL_td" width="8%">
								<div id="SL_TTS_voice" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/ttsvoice.png&quot;);" title="undefined">
									&nbsp;</div>
							</td>
							<td align="center" class="SL_td" width="8%">
								<div class="SL_copy" id="SL_copy" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/copy.png&quot;);" title="Copy translation">
									&nbsp;</div>
							</td>
							<td align="center" class="SL_td" width="8%">
								<div id="SL_bbl_font_patch">
									&nbsp;</div>
								<div class="SL_bbl_font" id="SL_bbl_font" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/font.png&quot;);" title="Font size">
									&nbsp;</div>
							</td>
							<td align="center" class="SL_td" width="8%">
								<div id="SL_bbl_help" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/bhelp.png&quot;);" title="Help">
									&nbsp;</div>
							</td>
							<td align="right" class="SL_td" width="15%">
								<div class="SL_pin_off" id="SL_pin" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/pin-on.png&quot;);" title="Pin pop-up bubble">
									&nbsp;</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="SL_shadow_translation_result" style="visibility: visible;">
			&nbsp;</div>
		<div class="SL_loading" id="SL_loading" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/loading.gif&quot;);">
			&nbsp;</div>
		<div id="SL_player2">
			&nbsp;</div>
		<div id="SL_alert100">
			Text-to-speech function is limited to 200 characters</div>
		<div id="SL_Balloon_options" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/bg3.png&quot;) rgb(255, 255, 255);">
			<div id="SL_arrow_down" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/down.png&quot;);">
				&nbsp;</div>
			<table id="SL_tbl_opt" width="100%">
				<tbody>
					<tr>
						<td align="center" width="5%">
							<input checked="1" id="SL_BBL_locer" title="Show Translator''s button 3 second(s)" type="checkbox" /></td>
						<td align="left" width="5%">
							<div id="SL_BBL_IMG" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/bbl-logo.png&quot;);" title="Show Translator''s button 3 second(s)">
								&nbsp;</div>
						</td>
						<td align="center" width="70%">
							<a class="SL_options" href="chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/html/options/options.html?bbl" target="_blank" title="Show options">Options</a> : <a class="SL_options" href="chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/html/options/options.html?hist" target="_blank" title="Translation History">History</a> : <a class="SL_options" href="chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/html/options/options.html?feed" target="_blank" title="ImTranslator Feedback">Feedback</a> : <a class="SL_options" href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&amp;hosted_button_id=GD9D8CPW8HFA2" target="_blank" title="Make a small contribution">Donate</a></td>
						<td align="right" width="15%">
							<span id="SL_Balloon_Close" title="Close">Close</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, N'', N'/images/banner/10_2018/7be5927632bd43c192ddeae402f4af02about3.jpg', N'4cb965ac2fcb46e1996a89814f048354', 2, NULL, 1, CAST(N'2018-11-23T19:54:55.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[shAboutus] OFF
SET IDENTITY_INSERT [dbo].[shAgent] ON 

INSERT [dbo].[shAgent] ([AgentGuid], [AgentId], [AgentName], [AgentAddress], [Phone], [Email], [Website], [Url], [ProvinceId], [DistrictId], [Longitude], [Latitude], [SortOrder], [Status], [CreatedDate]) VALUES (N'105d5e183b724f15b689b1f4d98f8757', 1, N'Đại lý Thuận Phát', N'256 đường 30-4, P.Linh Khánh, Ninh Kiều, Cần Thơ', N'0918 145 966', N'nghinv@gmail.com', N'/', N'/SongHongVn/vnt_upload/dealer/thumbs/180_CongtyCPMaySongHong_Logo1.jpg', 1, 1, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[shAgent] ([AgentGuid], [AgentId], [AgentName], [AgentAddress], [Phone], [Email], [Website], [Url], [ProvinceId], [DistrictId], [Longitude], [Latitude], [SortOrder], [Status], [CreatedDate]) VALUES (N'2052fc3d0b514ff3ba6968ae39b202ad', 2, N'Showroom Mục Loan', N'97B, Nguyễn Trãi, Tp. Đông Hà, Quảng Trị', N'0905330564', N'nghinv@gmail.com', N'/', N'/SongHongVn/vnt_upload/dealer/thumbs/180_CongtyCPMaySongHong_Logo1.jpg', 1, 1, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[shAgent] ([AgentGuid], [AgentId], [AgentName], [AgentAddress], [Phone], [Email], [Website], [Url], [ProvinceId], [DistrictId], [Longitude], [Latitude], [SortOrder], [Status], [CreatedDate]) VALUES (N'374a867f8033425e83daeba41fcc36c2', 3, N'Showroom Hùng Thoa', N'520 Quang Trung, TX. Ba Đồn, Tỉnh Quảng Bình', N'0232 3 512 985 / 0912 157 517', N'nghinv@gmail.com', N'/', N'/SongHongVn/vnt_upload/dealer/thumbs/180_CongtyCPMaySongHong_Logo1.jpg', 1, 1, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[shAgent] ([AgentGuid], [AgentId], [AgentName], [AgentAddress], [Phone], [Email], [Website], [Url], [ProvinceId], [DistrictId], [Longitude], [Latitude], [SortOrder], [Status], [CreatedDate]) VALUES (N'391656d710dc43e5ab962e915e1674c3', 4, N'NPP Phương Bắc', N'37 Quang Trung, phường Tân Quang, Tp Tuyên Quang', N'Tel: 0273.824914 / 0904 275 199', N'nghinv@gmail.com', N'/', N'/SongHongVn/vnt_upload/dealer/thumbs/180_CongtyCPMaySongHong_Logo1.jpg', 1, 1, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[shAgent] ([AgentGuid], [AgentId], [AgentName], [AgentAddress], [Phone], [Email], [Website], [Url], [ProvinceId], [DistrictId], [Longitude], [Latitude], [SortOrder], [Status], [CreatedDate]) VALUES (N'423eaa676f704dbaba57152c45e21c09', 5, N'Showroom Tấn Phát', N'Số 82, Quốc Lộ 9, Phường 1, TP. Đông Hà, Quảng Trị', N'0964.517.238', N'nghinv@gmail.com', N'/', N'/SongHongVn/vnt_upload/dealer/thumbs/180_CongtyCPMaySongHong_Logo1.jpg', 1, 2, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[shAgent] ([AgentGuid], [AgentId], [AgentName], [AgentAddress], [Phone], [Email], [Website], [Url], [ProvinceId], [DistrictId], [Longitude], [Latitude], [SortOrder], [Status], [CreatedDate]) VALUES (N'4c52c9d3ae164a2fa85aae61ef18929e', 7, N'NPP Tuyết Điểm', N'Số 645 Cù Chính Lan -Phường Phương Lâm - Thành phố Hòa Bình', N'098 372 7621 / 090 477 9830', N'nghinv@gmail.com', N'/', N'/SongHongVn/vnt_upload/dealer/thumbs/180_CongtyCPMaySongHong_Logo1.jpg', 1, 2, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[shAgent] OFF
SET IDENTITY_INSERT [dbo].[shBanner] ON 

INSERT [dbo].[shBanner] ([BannerGuid], [BannerId], [BannerName], [Url], [PositionBanner], [SortOrder], [Status], [CreatedDate]) VALUES (N'1376569556144e2491ae99e42cc87f1a', 8, N'Banner Bảng giá', N'/images/banner/10_2018/12cc8fc54357409c98d40525ecb8944fbanner1.jpg', 4, NULL, 1, CAST(N'2018-10-18T23:08:20.843' AS DateTime))
INSERT [dbo].[shBanner] ([BannerGuid], [BannerId], [BannerName], [Url], [PositionBanner], [SortOrder], [Status], [CreatedDate]) VALUES (N'14b13f07241e433fa8f0430249c6bee4', 6, N'Banner Sản Phẩm', N'/images/banner/10_2018/000ee59fe7ca4a83bbd31d315f506777banner1.jpg', 2, NULL, 1, CAST(N'2018-10-18T15:04:52.007' AS DateTime))
INSERT [dbo].[shBanner] ([BannerGuid], [BannerId], [BannerName], [Url], [PositionBanner], [SortOrder], [Status], [CreatedDate]) VALUES (N'26ce21f9ab764efe9a14636b97811b75', 7, N'Banner Đại lý', N'/images/banner/10_2018/c55c9933f5924c02907054b2cdabd9fecong_ty_may_song_hong_banner_gioi_thieu_02.jpg', 3, NULL, 1, CAST(N'2018-10-18T23:01:11.840' AS DateTime))
INSERT [dbo].[shBanner] ([BannerGuid], [BannerId], [BannerName], [Url], [PositionBanner], [SortOrder], [Status], [CreatedDate]) VALUES (N'af5f1edbc3324cd4b930cf2ec663c863', 5, N'Banner Giới Thiệu', N'/images/banner/10_2018/0c15e799adaf40a885d64e3ada625786cong_ty_may_song_hong_banner_gioi_thieu_02.jpg', 1, NULL, 1, CAST(N'2018-10-18T15:03:42.157' AS DateTime))
INSERT [dbo].[shBanner] ([BannerGuid], [BannerId], [BannerName], [Url], [PositionBanner], [SortOrder], [Status], [CreatedDate]) VALUES (N'bd5b8bd9e04e4687ba615fae485363fd', 9, N'Banner Tin tức sự kiện', N'/images/banner/10_2018/9ec76175154049788547b0cf7a4e3f40banner_doremon.jpg', 6, NULL, 1, CAST(N'2018-10-18T23:09:47.647' AS DateTime))
SET IDENTITY_INSERT [dbo].[shBanner] OFF
SET IDENTITY_INSERT [dbo].[shCategory] ON 

INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'320162dfe2f54f929872298d6125a8a4', 19, N'934c0ed550c14a41a975f65ea92124a4', N'Disney Collection', N'/bo-chan-ga-goi/disney-collection', N' Năm 2018 Sông Hồng chính thức được cấp bản quyền độc quyền hình ảnh                                     các nhân vật trong phim hoạt hình nổi tiếng thuộc tập đoàn Walt Disney.                                     Với các nhân vật đã đi vào tuổi thơ của các em nhỏ như:                                     Mickey mouse & Friends, Pixar Cars, Princess, Frozen hy vọng sẽ mang đến những bộ sưu tập Chăn ga gối ngộ nghĩnh,                                     đáng yêu cho các em nhỏ.', 4, NULL, 1, N'/images/product/10_2018/thumbs/4712594f462141bbbca2596bd4cf2726(570x306)_13122hinh-nen-hoat-hinh-disney-mickey-va-vit-donal.jpg', NULL, 1, CAST(N'2018-10-10T02:41:12.013' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'49ebe5695f784bd288e6e96fbf22b7e7', 21, N'934c0ed550c14a41a975f65ea92124a4', N'Bộ sản phẩm trẻ em', N'/bo-chan-ga-goi/bo-san-pham-tre-em', N'BỘ SẢN PHẨM TRẺ EM
- Các sản phẩm trẻ em của May Sông Hồng được sản xuất trên thiết bị hiện đại và giám sát chặt chẽ đảm bảo chất lượng sản phẩm.
- Các sản phẩm trẻ em của May Sông Hồng đều được phun Nano kháng khuẩn, đảm bảo an toàn tuyệt đối cho bà Mẹ và Trẻ em.', 6, NULL, NULL, N'/images/product/10_2018/thumbs/0fa164bcc0a8498cb4764e2c07b9d8c0570_fm_fmax_fw_fh_zmax_untitled.jpg', NULL, 1, CAST(N'2018-10-10T02:41:23.193' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'4b98a22a297642a7bff127ddb4917952', 20, N'934c0ed550c14a41a975f65ea92124a4', N'Elegance', N'/bo-chan-ga-goi/elegance', N'Với chất liệu MICRO SH lần đầu tiên xuất hiện, độ bền màu cao,sợi vải thoáng, mịn;                                     màu sắc sang trọng, trang nhã, họa tiết phong phú, chúng tôi hy vọng ELEGANCE Collection                                     sẽ là sự lựa chọn hàng đầu của quý khách khi mua dùng sản phẩm.                                     Elegance với những thiết kế năng động, trẻ trung nhưng không kém phần trang nhã,                                     lịch thiệp, chắc chắn sẽ làm hài lòng ngay cả những khách hàng khó tính nhất,                                     đặc biệt khi đối tượng khách hàng tiềm năng mà thương hiệu hướng tới là giới trẻ', 5, NULL, 1, N'/images/product/10_2018/thumbs/64d81811fc8d433288e81ff2cccd45f1(570x306)_bdr_elegance_6x3.5m_k1_1.jpg', NULL, 1, CAST(N'2018-10-10T02:41:16.473' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'5a2e935861174a1bab60c15ae4776b90', 26, N'abbce1a1efc649eabbd6949f40f83c60', N'Bệnh viện', N'/du-an/benh-vien', N'', 3, NULL, NULL, N'/images/product/10_2018/thumbs/4af7e88b9f5b4c1b99433169bcf3e9d7yem_bvien_small.jpg', NULL, 1, CAST(N'2018-10-10T14:19:30.990' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'6d5cdc58b59b46e38aae499c168e7547', 24, N'abbce1a1efc649eabbd6949f40f83c60', N'Quà tặng', N'/du-an/voi-the-manh-la-mot-trong-nhung-doanh-ng', N'Mỗi sản phẩm của Sông Hồng đều có thể thay bạn nói lên lời tri ân, chúc mừng hay thể hiện sự thương yêu dành cho người thân, bạn bè, đối tác….', 1, NULL, NULL, N'/images/product/10_2018/thumbs/2d256410b422409c900d581b553141a3(420x240)_fm_fmax_fw_fh_zmax_hop_qua_1.jpg', NULL, 1, CAST(N'2018-11-06T02:36:51.427' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'81252833f40d4367981f0782a4faf2d1', 12, N'', N'CHĂN ĐÔNG - RUỘT GỐI', N'/chan-dong-ruot-goi/chan-dong-von-da-rat-noi-tieng-voi-cac-s', N'Chăn đông vốn đã rất nổi tiếng với các sản phẩm về bông,
                                    chăn đông và ruột gối là một trong những thế mạnh lâu đời của Sông Hồng.
                                    Các sản phẩm chăn đông - ruột gối của Sông Hồng được người tiêu dùng Việt Nam tín nhiệm vì chất lượng cao,
                                    bền đẹp với giá thành phù hợp', 3, NULL, 1, N'/images/product/10_2018/thumbs/25ac8130183b4d27b7643566a23dad85570_fm_fmax_fw_fh_zmax_ruot_chan_ruot_goi_1.jpg', 4, 1, CAST(N'2018-10-11T01:31:44.850' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'8944a763d1834b1b8e09e05d58c9df4a', 10, N'', N'ĐỆM', N'/dem/dem-bong-tinh-khiet-the-he-thu-hai
bo-san-pham-nay-hoan-toa', N'ĐỆM BÔNG TINH KHIẾT THẾ HỆ THỨ HAI
Bộ sản phẩm này hoàn toàn đáp ứng tiêu chuẩn của các Khách sạn, Resort cao cấp và các gia đình có điều kiện kinh tế tốt ở Việt nam. Với sự am tường của mình, những người tiêu dùng thông minh, thêm lần nữa có cơ hội lựa chọn sản phẩm ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG thế hệ thứ hai này cho sự phong phú và yên bình trong cuộc sống', 1, NULL, NULL, N'/images/product/10_2018/thumbs/d5a57bd6486b41238908042e88d348e8(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, 1, CAST(N'2018-11-06T11:48:58.930' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'8c1b70988c774426883c1bcf1fcaba2c', 23, N'81252833f40d4367981f0782a4faf2d1', N'RUỘT GỐI', N'/chan-dong-ruot-goi/ruot-goi', N' Vốn đã rất nổi tiếng với các sản phẩm về bông,
                                    chăn đông và ruột gối là một trong những thế mạnh lâu đời của Sông Hồng.
                                    Các sản phẩm chăn đông - ruột gối của Sông Hồng được người tiêu dùng Việt Nam tín nhiệm vì chất lượng cao,
                                    bền đẹp với giá thành phù hợp.', 2, NULL, NULL, N'/images/product/10_2018/thumbs/609da86b73a745f5bfb92a2546ea4c72420_ruot_chan_-_ruot_goi.jpg', NULL, 1, CAST(N'2018-10-10T02:41:41.357' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'934c0ed550c14a41a975f65ea92124a4', 11, N'', N'BỘ CHĂN GA GỐI', N'/bo-chan-ga-goi/bo-chan-ga-goi
cac-san-pham-chan-ga-goi', N'BỘ CHĂN GA GỐI
Các sản phẩm chăn ga gối của Sông Hồng được người tiêu dùng tín nhiệm bình chọn là hàng Việt Nam chất lượng cao trong nhiều năm liền gồm:
+ Dòng Home Collection 
+ Classic Collection 
+ Doraemon – Hello Kitty Collection . 
Ngoài tiêu chuẩn khắt khe về chất lượng, các mẫu mã còn được công ty cải tiến liên tục để phù hợp với nhu cầu thẩm mỹ ngày càng cao của người tiêu dùng.
', 2, NULL, NULL, N'/images/product/10_2018/thumbs/96930e9119ab484f83de222a06549b33570_fm_fmax_fw_fh_zmax_prod1.jpg', 3, 1, CAST(N'2018-10-11T01:18:37.423' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'979be2e056c34ca0ab375caa780ae5d2', 17, N'934c0ed550c14a41a975f65ea92124a4', N'Classic collection', N'/bo-chan-ga-goi/classic-collection', N'Classic collection là dòng sản phẩm chăn ga gối truyền thống, sử dụng chất liệu vải 100% Cotton 200T và TC 170T, mang nhiều ưu điểm về tính kinh tế, tiện dụng, mềm mại, bền chắc. Sản phẩm nổi bật là các mẫu Chăn đông Sông Hồng, vốn đã nổi tiếng về sự ấm áp và nhẹ nhàng', 2, NULL, 1, N'/images/product/10_2018/thumbs/4f6713195a6d4affabd15d975162dff6(570x306)_prod1.jpg', NULL, 1, CAST(N'2018-10-10T02:41:03.440' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'9998823448054c3bb061fe69cd71bb46', 15, N'8944a763d1834b1b8e09e05d58c9df4a', N'Đệm bông tinh khiết', N'/dem/dem-bong-tinh-khiet-the-he-thu-hai
bo-s', N'Bộ sản phẩm này hoàn toàn đáp ứng tiêu chuẩn của các Khách sạn, Resort cao cấp và các gia đình có điều kiện kinh tế tốt ở Việt nam. Với sự am tường của mình, những người tiêu dùng thông minh, thêm lần nữa có cơ hội lựa chọn sản phẩm ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG thế hệ thứ hai này cho sự phong phú và yên bình trong cuộc sống.', 1, NULL, 1, N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, 1, CAST(N'2018-11-06T11:46:21.917' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'abbce1a1efc649eabbd6949f40f83c60', 13, N'', N'DỰ ÁN', N'/du-an/voi-the-manh-la-mot-trong-nhung-doanh-ng', N'Với thế mạnh là một trong những doanh nghiệp lớn nhất ngành Dệt - May Việt Nam,
                                    Sông Hồng tự hào sở hữu những nhà máy, dây chuyền hiện đại nhất Việt Nam,
                                    là đối tác tin cậy của những thương hiệu nổi tiếng trên thế giới.
                                    Bằng kinh nghiệm và kỹ năng của mình trong ngành,
                                    Sông Hồng cam kết phục vụ tốt nhất các đơn hàng đặt riêng cho dự án trong lĩnh vực khách sạn, bệnh viện,
                                    trường học và các sản phẩm quà tặng khác.', 4, NULL, 1, N'/images/product/10_2018/thumbs/704161bed24144db95453a57e164eea5(570x306)_prod1.jpg', 4, 1, CAST(N'2018-10-11T01:31:17.287' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'def2a47647a347a88e067a67b4735b77', 22, N'81252833f40d4367981f0782a4faf2d1', N'CHĂN ĐÔNG', N'/chan-dong-ruot-goi/chan-dong', N'Vốn đã rất nổi tiếng với các sản phẩm về bông,
                                    chăn đông và ruột gối là một trong những thế mạnh lâu đời của Sông Hồng.
                                    Các sản phẩm chăn đông - ruột gối của Sông Hồng được người tiêu dùng Việt Nam tín nhiệm vì chất lượng cao,
                                    bền đẹp với giá thành phù hợp', 1, NULL, NULL, N'/images/product/10_2018/thumbs/77f674008a16426a9f53065678b11333c16_c38.jpg', NULL, 1, CAST(N'2018-10-10T02:41:37.180' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'ebf90a4171884c778b7126fe31372d23', 16, N'934c0ed550c14a41a975f65ea92124a4', N'Home collection', N'/bo-chan-ga-goi/home-collection', N'Home collection là các sản phẩm cao cấp của thương hiệu Chăn Ga Gối Đệm Sông Hồng. Với xu hướng màu hiện đại, sử dụng chất liệu vải nhập khẩu 100% cotton 250T với những họa tiết và thiết kế tươi sáng, trẻ trung, bộ sưu tập Home Collection phù hợp với cuộc sống đô thị và các gia đình trẻ', 1, NULL, 1, N'/images/product/10_2018/thumbs/e87050f566a14dd68474417347ef7669(570x306)_song_hong__1332_f.png', NULL, 1, CAST(N'2018-10-10T02:40:58.780' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'ef49b8df991c4e6bbeadc199210e058b', 18, N'934c0ed550c14a41a975f65ea92124a4', N'Hello Kitty-Doraemon ', N'/bo-chan-ga-goi/hello-kitty-doraemon', N'Các sản phẩm chăn - ga - gối được thiết kế từ hình ảnh bản quyền Doraemon và Hello Kitty đáng yêu,                                     rất êm ái và an toàn dành riêng cho trẻ em Việt Nam.                                     Ruột bông của các sản phẩm chứa hạt nano bạc để diệt khuẩn,                                     đảm bảo sự an toàn cho làn da nhạy cảm của các bé', 3, NULL, 1, N'/images/product/10_2018/thumbs/f220ccd62cce4156b15468d7b81093e8(570x306)_song_hong__1129_f.png', NULL, 1, CAST(N'2018-10-10T02:41:07.533' AS DateTime))
INSERT [dbo].[shCategory] ([CategoryGuid], [CategoryId], [ParentId], [CategoryName], [MetaTitle], [Description], [SortOrder], [SortOrderHighLight], [TopHot], [FileName], [UserId], [Status], [CreatedDate]) VALUES (N'fcb96a14bf044c78b7a609b2b3cb1505', 25, N'abbce1a1efc649eabbd6949f40f83c60', N'Trang trí Khách sạn', N'/du-an/voi-the-manh-la-mot-trong-nhung-doanh-ng', N'Hàng khách sạn của Sông Hồng đa dạng về mẫu mã và được các khách sạn lớn tin dùng vì sử dụng các loại vải có độ bền cao, đường may chắc chắn, nguyên liệu có nguồn gốc, xuất xứ rõ ràng.', 2, NULL, NULL, N'/images/product/10_2018/thumbs/2d5e2b7a69ca4c0d8a030a4a18dc8cdc420_sh_0047_1.jpg', NULL, 1, CAST(N'2018-11-06T11:48:10.193' AS DateTime))
SET IDENTITY_INSERT [dbo].[shCategory] OFF
SET IDENTITY_INSERT [dbo].[shCategoryImage] ON 

INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'01c205aa1e3847bdbe9194cade4d2780', 65, N'81252833f40d4367981f0782a4faf2d1', N'/images/product/10_2018/thumbs/25ac8130183b4d27b7643566a23dad85570_fm_fmax_fw_fh_zmax_ruot_chan_ruot_goi_1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:31:44.867' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'01cfe9f6d8cd40c8b714ff5a6e53050e', 52, N'8944a763d1834b1b8e09e05d58c9df4a', N'/images/product/10_2018/thumbs/d5a57bd6486b41238908042e88d348e8(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T13:02:51.057' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'039c4689616949f78f8f5e1868c3e10f', 18, N'ebf90a4171884c778b7126fe31372d23', N'/images/product/10_2018/3c7709c4d7fc4ca9b76b99ebc733e16bdem-bong-active.png', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:07:32.010' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'08b831e5561a4e6ba97a251117a187d4', 44, N'def2a47647a347a88e067a67b4735b77', N'/images/product/10_2018/thumbs/77f674008a16426a9f53065678b11333c16_c38.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:27.523' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'08f3270d30594e15b671b5d995e58f9e', 2, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:48:35.520' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'0ad9a8d397184f6aad34be026b593dad', 67, N'6d5cdc58b59b46e38aae499c168e7547', N'/images/product/10_2018/thumbs/2d256410b422409c900d581b553141a3(420x240)_fm_fmax_fw_fh_zmax_hop_qua_1.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T02:36:51.437' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'0b4770f9124c4be49d57936f838259ac', 38, N'ebf90a4171884c778b7126fe31372d23', N'/images/product/10_2018/thumbs/e87050f566a14dd68474417347ef7669(570x306)_song_hong__1332_f.png', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:40:58.790' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'10a22224af4046b3b1f471cac6e73b30', 26, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/a51e7a8e02c64a64b9757ec1d4861418dem-bong-active.png', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:17:58.987' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'135bcee7e1424ea6be4a99d1b98f0d80', 68, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T11:33:42.417' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'18a59c5c2ff942cf9652a1672f6badc8', 20, N'979be2e056c34ca0ab375caa780ae5d2', N'/images/product/10_2018/52c7a596848e462da93c7904c83f1eccclassic-colection-active.svg', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:13:09.290' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'18aef39b7e30420a96391e565b112288', 3, N'ebf90a4171884c778b7126fe31372d23', N'/images/product/10_2018/thumbs/e87050f566a14dd68474417347ef7669(570x306)_song_hong__1332_f.png', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:50:21.713' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'212bea12895f4f6b8dd8eb32ad98cd76', 56, N'5a2e935861174a1bab60c15ae4776b90', N'/images/product/10_2018/thumbs/4af7e88b9f5b4c1b99433169bcf3e9d7yem_bvien_small.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T14:19:30.997' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'25f76e5b71a846b0ba9cf78ca22cbacf', 63, N'abbce1a1efc649eabbd6949f40f83c60', N'/images/product/10_2018/thumbs/704161bed24144db95453a57e164eea5(570x306)_prod1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:18:49.243' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'286db42803ff49769dc014c39297dee8', 70, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T11:43:29.897' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'2912afa37f3b4078af73fe653b41d5e3', 71, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T11:46:51.187' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'2a1cba6dd3e4400bb0633e2bb60fe6b9', 4, N'979be2e056c34ca0ab375caa780ae5d2', N'/images/product/10_2018/thumbs/4f6713195a6d4affabd15d975162dff6(570x306)_prod1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:50:57.963' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'2e6c060e8da94819a2f3e39bfb65bce2', 1, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:48:10.580' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'30f1d42f1b5f4a8bb3aa329cc118a883', 49, N'5a2e935861174a1bab60c15ae4776b90', N'', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:57.200' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'38b8c684148f41a086c01d05dfcab720', 50, N'81252833f40d4367981f0782a4faf2d1', N'/images/product/10_2018/thumbs/25ac8130183b4d27b7643566a23dad85570_fm_fmax_fw_fh_zmax_ruot_chan_ruot_goi_1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T11:34:36.920' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'3d906f7ad6444494a2f84328acedac21', 47, N'6d5cdc58b59b46e38aae499c168e7547', N'', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:47.027' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4218fa4bc452418ab5af9e78feba09d5', 32, N'4b98a22a297642a7bff127ddb4917952', N'/images/product/10_2018/c2ee8c229eb24b2c98de8e7a25d7af43classic-colection-active.png', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:21:24.187' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'44c5d9e0b7eb4db488223185856f818c', 9, N'def2a47647a347a88e067a67b4735b77', N'/images/product/10_2018/thumbs/77f674008a16426a9f53065678b11333c16_c38.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T19:13:26.823' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'453ced1837bf4132b16b454398f07806', 41, N'320162dfe2f54f929872298d6125a8a4', N'/images/product/10_2018/thumbs/4712594f462141bbbca2596bd4cf2726(570x306)_13122hinh-nen-hoat-hinh-disney-mickey-va-vit-donal.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:12.027' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'472766c1ca6b42f18c32d7710cefed87', 33, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:34:38.973' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4772229209ab4b44a17524c4362bc33a', 59, N'8944a763d1834b1b8e09e05d58c9df4a', N'/images/product/10_2018/thumbs/d5a57bd6486b41238908042e88d348e8(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:16:54.830' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'48ba85dcc4fd4e678dd0f026458a0c80', 25, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/58530742336e42f2a166c66a3fb394addem-bong.png', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:17:58.977' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4e677dd213314fb2aa970efcbe31b602', 17, N'ebf90a4171884c778b7126fe31372d23', N'/images/product/10_2018/0a86e4893f594e9fb3c25cab55d05b86dem-bong.png', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:07:31.993' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'51a38a7150be4c508689b3f2fb3afc29', 7, N'4b98a22a297642a7bff127ddb4917952', N'/images/product/10_2018/thumbs/64d81811fc8d433288e81ff2cccd45f1(570x306)_bdr_elegance_6x3.5m_k1_1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:54:48.830' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'5372cbc0d0364b64b7b06b2558874d93', 60, N'8944a763d1834b1b8e09e05d58c9df4a', N'/images/product/10_2018/thumbs/d5a57bd6486b41238908042e88d348e8(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:18:16.460' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'56fa37ad272649deb5e80f546f6c6e94', 53, N'934c0ed550c14a41a975f65ea92124a4', N'/images/product/10_2018/thumbs/96930e9119ab484f83de222a06549b33570_fm_fmax_fw_fh_zmax_prod1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T13:04:04.790' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'58421defed5f4ff4ab0ef97afced569c', 48, N'fcb96a14bf044c78b7a609b2b3cb1505', N'', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:52.040' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'58dd28054f2442c7903a111ebfcd8e68', 5, N'ef49b8df991c4e6bbeadc199210e058b', N'/images/product/10_2018/thumbs/f220ccd62cce4156b15468d7b81093e8(570x306)_song_hong__1129_f.png', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:52:50.723' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'70f52ce6786c4405adf76abe7f640075', 29, N'320162dfe2f54f929872298d6125a8a4', N'/images/product/10_2018/1f5e4a0e6e474f4aa74f6c5e65267f62download.jpg', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:20:03.133' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'76238ea25c774e298857f319fe1ecf39', 37, N'abbce1a1efc649eabbd6949f40f83c60', N'', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:38:03.450' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'76ce6f5ad29e45d599f1a05f24a6b218', 46, N'8c1b70988c774426883c1bcf1fcaba2c', N'/images/product/10_2018/thumbs/609da86b73a745f5bfb92a2546ea4c72420_ruot_chan_-_ruot_goi.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:41.383' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'81857cdebb0c47f18c1469239344e045', 31, N'4b98a22a297642a7bff127ddb4917952', N'/images/product/10_2018/7bc92efec8944a17bbde9dd9e8f9383fclassic-colection.png', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:21:24.180' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'84e01aa429dd401abe1fe5fde110bba5', 66, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T02:36:33.543' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'88a5e9d93eb146cd963b70bb4e1735f4', 21, N'81252833f40d4367981f0782a4faf2d1', N'/images/product/10_2018/204381e9a8844f54854be3d613a0761fchan-ruot-goi.png', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:16:26.510' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'9156909bfd3b4fb48a8511a7aa7f2b29', 6, N'320162dfe2f54f929872298d6125a8a4', N'/images/product/10_2018/thumbs/4712594f462141bbbca2596bd4cf2726(570x306)_13122hinh-nen-hoat-hinh-disney-mickey-va-vit-donal.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:53:19.687' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'94ff996f39f04aa4887432483e45ef6b', 24, N'abbce1a1efc649eabbd6949f40f83c60', N'/images/product/10_2018/3630775e4ffb459794fd4f05c6a9f50bsp-du-an-active.png', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:17:26.677' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'9dc3c8fc8fed438291f99105a82e764c', 40, N'ef49b8df991c4e6bbeadc199210e058b', N'/images/product/10_2018/thumbs/f220ccd62cce4156b15468d7b81093e8(570x306)_song_hong__1129_f.png', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:07.540' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a33d770dbb6a4246b30975db18c67ab3', 8, N'49ebe5695f784bd288e6e96fbf22b7e7', N'/images/product/10_2018/thumbs/0fa164bcc0a8498cb4764e2c07b9d8c0570_fm_fmax_fw_fh_zmax_untitled.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T18:57:50.650' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a4dc466ea26c4565b3e84fbefdf6f2df', 30, N'320162dfe2f54f929872298d6125a8a4', N'/images/product/10_2018/a85413a71030466f930d474c8baee85dimages.jpg', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:20:03.140' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'aa0266207da143bc92c9e39304e29f5e', 51, N'abbce1a1efc649eabbd6949f40f83c60', N'/images/product/10_2018/thumbs/704161bed24144db95453a57e164eea5(570x306)_prod1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T11:35:32.230' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'b1e5138a91db4dbf91a9e6383593749d', 28, N'ef49b8df991c4e6bbeadc199210e058b', N'/images/product/10_2018/9fe925c05f5549c8ab25a6f3ec78a1fddoraemon-kitty-active.svg', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:18:56.190' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'b5bc75d434664304a99c82950b8c14f1', 54, N'6d5cdc58b59b46e38aae499c168e7547', N'/images/product/10_2018/thumbs/2d256410b422409c900d581b553141a3(420x240)_fm_fmax_fw_fh_zmax_hop_qua_1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T14:17:18.983' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'ba0c7a46f3bd4ea2ab5a5242a45e3fa6', 27, N'ef49b8df991c4e6bbeadc199210e058b', N'/images/product/10_2018/72301e65640c4a5f84ff30fbc30ef39adoraemon-kitty.svg', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:18:56.187' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'bd52c26c125b44a1bf32d7b32bfdeb94', 57, N'8944a763d1834b1b8e09e05d58c9df4a', N'/images/product/10_2018/thumbs/d5a57bd6486b41238908042e88d348e8(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T22:58:55.993' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'c0c076abe4c342bd89b804310633c2bd', 42, N'4b98a22a297642a7bff127ddb4917952', N'/images/product/10_2018/thumbs/64d81811fc8d433288e81ff2cccd45f1(570x306)_bdr_elegance_6x3.5m_k1_1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:16.483' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'c1815edd16f243f5915c0a15cb9e1b11', 62, N'81252833f40d4367981f0782a4faf2d1', N'/images/product/10_2018/thumbs/25ac8130183b4d27b7643566a23dad85570_fm_fmax_fw_fh_zmax_ruot_chan_ruot_goi_1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:18:44.017' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'c23796ac4ee546a4bbd2e963171d44d5', 22, N'81252833f40d4367981f0782a4faf2d1', N'/images/product/10_2018/62ac03a1d5974911a9e98458509c33b0chan-ruot-goi-active.png', NULL, N'IconActive', 1, 1, CAST(N'2018-10-10T02:16:26.523' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'c73aa62b1ec743008848d0db4c34a1f2', 43, N'49ebe5695f784bd288e6e96fbf22b7e7', N'/images/product/10_2018/thumbs/0fa164bcc0a8498cb4764e2c07b9d8c0570_fm_fmax_fw_fh_zmax_untitled.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:23.207' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'cab6cfc3977145769bb9d4c1980a2f64', 36, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:37:57.540' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'cf1b8fea8e814c1aaa1d3e899597b624', 64, N'abbce1a1efc649eabbd6949f40f83c60', N'/images/product/10_2018/thumbs/704161bed24144db95453a57e164eea5(570x306)_prod1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:31:17.307' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'd3fb105130e54d7395abafd36b4ef1ca', 55, N'fcb96a14bf044c78b7a609b2b3cb1505', N'/images/product/10_2018/thumbs/2d5e2b7a69ca4c0d8a030a4a18dc8cdc420_sh_0047_1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T14:18:55.380' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'd8feb6bf421a45e88476a589cf2463e6', 35, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:37:03.137' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'da8e519361f1491595018aef2c85a7ee', 69, N'9998823448054c3bb061fe69cd71bb46', N'/images/product/10_2018/thumbs/6a040189a13d430a86a6265cbbf9dff6(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T11:38:13.960' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'e2192239c457401483b399d1e6c09aad', 61, N'934c0ed550c14a41a975f65ea92124a4', N'/images/product/10_2018/thumbs/96930e9119ab484f83de222a06549b33570_fm_fmax_fw_fh_zmax_prod1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:18:37.447' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'e379f38bf9234d7d8a619d3720288acc', 58, N'8944a763d1834b1b8e09e05d58c9df4a', N'/images/product/10_2018/thumbs/d5a57bd6486b41238908042e88d348e8(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-11T01:08:45.867' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'e64af9f6d5214810b44c0a96afe50a46', 73, N'8944a763d1834b1b8e09e05d58c9df4a', N'/images/product/10_2018/thumbs/d5a57bd6486b41238908042e88d348e8(570x306)_banner-sp-ngoai-trang-chu-dem-bong-tinh-khiet-th2.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T11:49:09.877' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'ea3ae4af8fdb4682a70c5fd4660bf481', 23, N'abbce1a1efc649eabbd6949f40f83c60', N'/images/product/10_2018/ca65fb555f824db691d3182636a657a8sp-du-an.png', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:17:26.663' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'eacfeed770fd470986b5ab4fa3016ba1', 19, N'979be2e056c34ca0ab375caa780ae5d2', N'/images/product/10_2018/cbcf813eba4f41c4b3422b600b4000bfclassic-colection.svg', NULL, N'Icon', 1, 1, CAST(N'2018-10-10T02:13:09.280' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'ef4a3ab78b124ccda73cc8ab5edf48fb', 10, N'8c1b70988c774426883c1bcf1fcaba2c', N'/images/product/10_2018/thumbs/609da86b73a745f5bfb92a2546ea4c72420_ruot_chan_-_ruot_goi.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-06T19:16:07.020' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'f36cfa9c412449d48a78347aa110f0cf', 45, N'def2a47647a347a88e067a67b4735b77', N'/images/product/10_2018/thumbs/77f674008a16426a9f53065678b11333c16_c38.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:37.187' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'f442914c28834400af2e1f58aa9cfc67', 72, N'fcb96a14bf044c78b7a609b2b3cb1505', N'/images/product/10_2018/thumbs/2d5e2b7a69ca4c0d8a030a4a18dc8cdc420_sh_0047_1.jpg', NULL, NULL, 2, 1, CAST(N'2018-11-06T11:48:25.770' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'faed107a06034de4ac91b5b567a6eeb7', 39, N'979be2e056c34ca0ab375caa780ae5d2', N'/images/product/10_2018/thumbs/4f6713195a6d4affabd15d975162dff6(570x306)_prod1.jpg', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:41:03.447' AS DateTime))
INSERT [dbo].[shCategoryImage] ([CategoryImageGuid], [CategoryId], [CategoryGuid], [FileName], [FileNameGoc], [Image], [UserId], [Status], [CreateDate]) VALUES (N'ff8ed07c7094462db71d65adc4d634a0', 34, N'ebf90a4171884c778b7126fe31372d23', N'/images/product/10_2018/thumbs/e87050f566a14dd68474417347ef7669(570x306)_song_hong__1332_f.png', NULL, NULL, 1, 1, CAST(N'2018-10-10T02:35:05.550' AS DateTime))
SET IDENTITY_INSERT [dbo].[shCategoryImage] OFF
SET IDENTITY_INSERT [dbo].[shComments] ON 

INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'105d5e183b724f15b689b1f4d98f8757', 3, NULL, N'4c52c9d3ae164a2fa85aae61ef18929e', N'nguyenha@gmail.com', N'Nguyen Ha', NULL, N'De nghi shop bao gia mat hang nay qua email lien he', 1, CAST(N'2018-10-11T20:27:37.240' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'39cbe82baaff4f8fb397d9692c34d2ec', 17, NULL, N'4c52c9d3ae164a2fa85aae61ef18929e', N'nghinv@gmail.com', N'Thanh Ha', 0, N'Post Comment San Pham Dem Bong Tinh Khiet The He Thu 3', 0, CAST(N'2018-10-11T23:31:06.097' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'3aef2f23490c41a28f5bf3c6074d1647', 15, NULL, N'4c52c9d3ae164a2fa85aae61ef18929e', N'nguyenan@gmail.com', N'nguyen an ', NULL, N'GHI', 0, CAST(N'2018-10-11T20:30:41.020' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'43c0c91e90624c7891cb57aa7dd2fed3', 21, NULL, N'7ec461e972424afc87eef26b068b3868', N'nguyen@gmail.com', N'nguyen nghi', 5, N'Tôi muốn đặt hàng này thì giao dịch như thế nào shop ', 1, CAST(N'2018-10-12T03:05:38.263' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'6bafa300b1bb4e42858e541d12b4c900', 16, NULL, N'4c52c9d3ae164a2fa85aae61ef18929e', N'le thi hong', N'Le Hong', NULL, N'ABCABC', 0, CAST(N'2018-10-11T20:31:05.063' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'870bc67cf2d24288a42f38323699d0cd', 20, NULL, N'374a867f8033425e83daeba41fcc36c2', N'nghinv@gmail.com', N'hoa huong duong', 5, N'Sản phẩm tốt vui long lien he so dien thoai', 1, CAST(N'2018-10-12T00:36:06.090' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'cdd256675893432885ea7b00b6312c2a', 22, NULL, N'b150c65366424661baf6179261e65df2', N'nghinv00@gmail.com', N'nghi nguyen', 5, N'Đánh giá sản phẩm tốt', 1, CAST(N'2018-11-15T16:59:20.513' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'e52199ba58184328b0a7f03de3533e61', 8, NULL, N'4c52c9d3ae164a2fa85aae61ef18929e', N'dinhhoa@gmail.com', N'Dinh hoa', NULL, N'abc', 1, CAST(N'2018-10-11T20:29:11.107' AS DateTime), NULL)
INSERT [dbo].[shComments] ([CommentGuid], [CommentId], [MemberGuiId], [ProductGuid], [Email], [MemberName], [Rating], [Contents], [Status], [CreatedDate], [LaDaXem]) VALUES (N'eb8d8cb7d23d4074a74b2562b98fe1d1', 9, NULL, N'4c52c9d3ae164a2fa85aae61ef18929e', N'mai thi hoa@gmail.com', N'Mai Hoa', NULL, N'DEF', 1, CAST(N'2018-10-11T20:29:28.213' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[shComments] OFF
SET IDENTITY_INSERT [dbo].[shGoodReceiptIsuue] ON 

INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'131ac90925314639b76795faf639a88f', 1013, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập Bộ chăn ga gối hello kitty sh_d18 020 với 21 đơn vị sản phẩm ', 2, 3, 1, CAST(N'2018-11-06T01:26:42.803' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'18731a102a914569802d5cb1d83b52bf', 1011, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập lô hàng Ruột gối với số lượng 20 đơn vi sản phẩm', 2, 3, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'244384b2b1af4c188e378491847b8919', 1019, 2, N'Chi-nhanh-Showroom-07-11-2018', NULL, 2, N'Chi nhánh Showroom', 4, N'e71fa38de681499d9cc633c95ca05dfa', N'Chuyển hàng tới khách hàng ', 3, 3, 1, CAST(N'2018-11-07T01:02:14.447' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'293146e5a6be40f9a927012da30f449f', 1010, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập lô chăn đông - ruột chăn 30 đơn vị', 2, 3, 1, CAST(N'2018-11-06T01:14:48.340' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'2e420d669f8f4a67a22617d5c5375620', 1014, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập bộ Sản phẩ Disney sh_dn18 04 với 27 đơn vị sản phẩm ', 2, 3, 1, CAST(N'2018-11-06T01:27:38.030' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'4057d20cacbb4d3698a309b430093ab3', 1018, 2, N'Chi-nhanh-Showroom-07-11-2018', NULL, 2, N'Chi nhánh Showroom', 4, N'220afae6dfd742d5baec0ef6b98f3fdb', N'nhân viên giao hàng xác nhận chuyển tới khách hàng thành công và tạo phiếu xuất. ', 4, 3, 1, CAST(N'2018-11-07T00:57:21.633' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'4871daf7cd714429b404fc5cb36a9853', 1007, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập đệm bông vỏ vải gấm số lượng 110 đơn vị. ', 2, 3, 1, CAST(N'2018-11-06T00:22:57.857' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'590b199ab1674dbaa079699d1c7168a7', 1009, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập đệm bông tinh khiết thế thệ thứ 2 . Số lượng 84 đơn vị', 2, 3, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'5d2997aafa1340f99b2628614c899d62', 1005, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập bộ chăn ga gối sh_h17_054 có số lượng là 72 ', 2, 3, 1, CAST(N'2018-11-06T00:09:01.787' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'782dcc48d4a849ecaf3313735359c343', 1006, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập bộ chăn ga gối sh_h18_056 Có số lượng : 40', 2, 3, 1, CAST(N'2018-11-06T00:17:28.157' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'7f14bd5ae0b442ee88508ff653e4db08', 1016, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập đơn hàng Bộ chan ga gối trẻ em TE 05 với 30 đơn vị sản phẩm ', 2, 3, 1, CAST(N'2018-11-06T01:31:07.360' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'84842881bb8242009b4f2019cecf1693', 1008, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập vỏ vải TC với số lượng 55 đơn vị', 2, 3, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'b2ca58f867694e9a87295b2375be94e5', 1015, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập sản phẩm Elegance sh-e18 10  với  80 đơn vị sản phẩm, được xếp vào danh mục sản phẩm chủ lực', 2, 3, 1, CAST(N'2018-11-06T01:29:39.587' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'cebbab102c6241358470b7d9aa3a6028', 1017, 2, N'Chi-nhanh-Showroom-07-11-2018', NULL, 2, N'Chi nhánh Showroom', 4, N'b49e56ec9ea74b7582939610c3f6158b', N'Giao hàng tới nhân viên ', 4, 3, 1, CAST(N'2018-11-07T00:46:05.367' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'd90ec98d32ce4e6ba68c896aa775d3a2', 1003, 1, N'Chi-nhanh-Showroom-05-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập kho hàng đợt 1 : Sản phẩm chăn ga gối sh_h17', 2, 3, 1, CAST(N'2018-11-05T22:39:28.563' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'e6ab3a60e3d54d0a975b40335759557d', 1004, 1, N'Chi-nhanh-Showroom-05-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập hàng bộ chăn ga gối sh_h17_052 số lượng 90 sản phẩm', 2, 3, 1, CAST(N'2018-11-05T23:13:19.850' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuue] ([ReceiptIsuueGuid], [ReceiptIssueId], [Phieu], [ReceiptIsuueName], [SKU], [MaKho], [TenKho], [LoaiPhieu], [MaDonHang], [GhiChu], [UserId], [TrangThai], [Status], [CreateDate]) VALUES (N'fd5c889b2fe44572b0d1a5a382ae1ea7', 1012, 1, N'Chi-nhanh-Showroom-06-11-2018', NULL, 2, N'Chi nhánh Showroom', 1, NULL, N'Nhập đơn hàng Classic Cotton sh_C16 041 với 24 đơn vị sản phẩm', 2, 3, 1, CAST(N'2018-11-06T01:25:48.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[shGoodReceiptIsuue] OFF
SET IDENTITY_INSERT [dbo].[shGoodReceiptIsuueDetail] ON 

INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'016094d8ac8f48ab8473d5937a1db130', 1067, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'053b180d9e86448f9e627acdc31da6fa', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'061a1dc802514ff88b2c8004de098a5a', 1034, N'5d2997aafa1340f99b2628614c899d62', N'ef92dca418f149a9a8fa95543ecdc7f0', N'97b9fa4265eb4356804e0ad2a3de35db', N'0bdac7da12dc43899948f0825d984116', 12, 1, 1, CAST(N'2018-11-06T00:09:01.787' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'09f4ab5b58194847b7ea0e8754110a2a', 1076, N'293146e5a6be40f9a927012da30f449f', N'bcaf655eb6a34736b99add7c80b457f4', N'd2bf0e9e11004a9fba4160f0d4c7f110', N'de7e6dc772394d008f1dfde302ef11f5', 15, 1, 1, CAST(N'2018-11-06T01:14:48.340' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'0c2b8eed97114202bd5454418bff64f9', 1028, N'e6ab3a60e3d54d0a975b40335759557d', N'6952b3a16adc4e76841f6c016cbe01ad', N'c0697a9b39cc4e26afc4c8d69226573c', N'dbef212655964f04bb00eb757f7deecd', 15, 1, 1, CAST(N'2018-11-05T23:12:57.317' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'0cc0effa87de46dab85655718297a1d0', 1071, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'9d1146dc4d09436794accc718fab4d1a', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'10b94d20a228413b8170532d9fed0774', 1078, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'90bee1d744754635af98a98c708b304c', N'4fff2402e04a472194c4100939e8eae7', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'130990d869e04a8190c0174eaa27d1e0', 1023, N'd90ec98d32ce4e6ba68c896aa775d3a2', N'2052fc3d0b514ff3ba6968ae39b202ad', N'f8b8f536efbf4f608bf2fa19179e7763', N'e0be978d3d0d40b8bdeb0f662eb84ee6', 10, 1, 1, CAST(N'2018-11-05T22:39:09.050' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'14bf604160ef4affb0457a83c51e1058', 1030, N'e6ab3a60e3d54d0a975b40335759557d', N'6952b3a16adc4e76841f6c016cbe01ad', N'4f2e2251d5c04d55a6d4c8478be02d64', N'3119b3f23a1d4262a92d876b325b0492', 15, 1, 1, CAST(N'2018-11-05T23:12:57.317' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'15e03ef9b03443e492cf5e34d814fee1', 1098, N'b2ca58f867694e9a87295b2375be94e5', N'd986ac16835a4d62baf61dc2ee45c645', N'7de53a0800004f9aa8c5bddc7e6ccbf5', N'3d4e09179b8b42b7877ee84f00818c67', 20, 1, 1, CAST(N'2018-11-06T01:29:39.587' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'19573eb79b164f0e86af315c087e51e0', 1093, N'2e420d669f8f4a67a22617d5c5375620', N'8d4e41d756f446a581e27333f117f01c', N'7bb5c1fcd0444336ba0d64132bd2b505', N'ad283967e6d946db843cd4d4f11cadea', 9, 1, 1, CAST(N'2018-11-06T01:27:38.030' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'22780500423c473b851939b917890b41', 1063, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'76a92b204b6a481f9b513f9b2b2e5cdc', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'26b651b2b4f248b3b76d03834504e0d5', 1064, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'6b7d8c3349014a2f88ebde002d717ae2', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'2a68255f3fd746c2ba36c0e3e33539ac', 1069, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'c75408d4c0de4f9a81cf11cd4ff3a0a4', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'2c9e68144b2b4611af7803fd3a0db5be', 1057, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'5a2ead1dd39641b29972335b2a065dd1', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'2da5d36c97e443e6babd1f51bde248fa', 1026, N'e6ab3a60e3d54d0a975b40335759557d', N'6952b3a16adc4e76841f6c016cbe01ad', N'c0697a9b39cc4e26afc4c8d69226573c', N'06b9db51775d4b7f901f7d708bbb03d7', 15, 1, 1, CAST(N'2018-11-05T23:12:57.317' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'2dc7798ae14d401ba1f601d61d315e6b', 1074, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'9a8011114320495ea0219c2517d0a389', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'3426b530567948248499b1da25d6ce8b', 1029, N'e6ab3a60e3d54d0a975b40335759557d', N'6952b3a16adc4e76841f6c016cbe01ad', N'4f2e2251d5c04d55a6d4c8478be02d64', N'c34d22e1aa78406fb63f574d62efddd6', 15, 1, 1, CAST(N'2018-11-05T23:12:57.317' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'35939a3fc25d44d3bde73a950aeac0a2', 1059, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'b44bcf8ba4124ccc8ac6ca267c03e915', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'37894f96cbaa418999d7093a0ab63be1', 1075, N'293146e5a6be40f9a927012da30f449f', N'bcaf655eb6a34736b99add7c80b457f4', N'd2bf0e9e11004a9fba4160f0d4c7f110', N'c0c0e85fda374363a6a48572bffc80d2', 15, 1, 1, CAST(N'2018-11-06T01:14:48.340' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'3eec768a25584943b8d1df96adfc9e15', 1090, N'131ac90925314639b76795faf639a88f', N'374a867f8033425e83daeba41fcc36c2', N'7c2bd16f29b645a0b066868142a545f7', N'ddd1c74253794eef8f2597da8038ef58', 7, 1, 1, CAST(N'2018-11-06T01:26:42.803' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'40e00c504cfb45f8a9bb47a3c8735295', 1091, N'131ac90925314639b76795faf639a88f', N'374a867f8033425e83daeba41fcc36c2', N'7c2bd16f29b645a0b066868142a545f7', N'72232ed4c2224e1699964afdd5e7f7cc', 7, 1, 1, CAST(N'2018-11-06T01:26:42.803' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'414c91e057874e7db89112699ec6b352', 1079, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'af94b26dd6424953bbe8704cdaf7ac00', N'a04f45e9653c4b6a8da10e6b3d7f4a49', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'437ab09ec0e341ab83b0435a7582f0ee', 1042, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'fb25b8132c6e4addb6622fe8879a9cd5', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'43a01a07818e4ffdba9c11590dcde9f4', 1041, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'1f65aed2171c47d1831d90b8ed1d4ec3', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'442bf15473fd4ea89c78f5fe98ddb35b', 1039, N'782dcc48d4a849ecaf3313735359c343', N'b150c65366424661baf6179261e65df2', N'68456f12b3ca4ee391017d51fbbfc22a', N'a773544c66d441a0ad11a99381895e35', 20, 1, 1, CAST(N'2018-11-06T00:17:28.157' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'44b053da0304494fa3900a6861eb0ccc', 1040, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'e08417e25d32473eb6385c3d7d12de66', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'478ef9d1cde6483ea281ec8fb45f2094', 1104, N'4057d20cacbb4d3698a309b430093ab3', N'bcaf655eb6a34736b99add7c80b457f4', N'd2bf0e9e11004a9fba4160f0d4c7f110', N'de7e6dc772394d008f1dfde302ef11f5', 2, 2, 1, CAST(N'2018-11-07T00:57:21.633' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'49993b2131fd4b3598196e2ee09773da', 1065, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'85781d6b9e64424ebd4e7d73165a7da7', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'4aa53e784a47486ab8736557dd6ca9dc', 1045, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'8d4ad52be0f0403ebcab263dd635da68', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'4b3405fb865d44c4b7dadc7d40ceb378', 1031, N'e6ab3a60e3d54d0a975b40335759557d', N'6952b3a16adc4e76841f6c016cbe01ad', N'4f2e2251d5c04d55a6d4c8478be02d64', N'7aa49a63d56f4cbfaae9fb35cee66ffe', 15, 1, 1, CAST(N'2018-11-05T23:12:57.317' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'5041b5dfc9034c27a08bb2de6469c00b', 1072, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'bd549ee234c144fe9e74b248d33cc214', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'52796ae59e574f49854cc3ff94ae6ab8', 1025, N'd90ec98d32ce4e6ba68c896aa775d3a2', N'2052fc3d0b514ff3ba6968ae39b202ad', N'f8b8f536efbf4f608bf2fa19179e7763', N'1da57e1b547a458db31d0b795d4300c0', 10, 1, 1, CAST(N'2018-11-05T22:39:09.050' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'5932ee47b1134862bbbb474988430931', 1027, N'e6ab3a60e3d54d0a975b40335759557d', N'6952b3a16adc4e76841f6c016cbe01ad', N'c0697a9b39cc4e26afc4c8d69226573c', N'd28d3c8d894b4395a3bf4a333890671b', 15, 1, 1, CAST(N'2018-11-05T23:12:57.317' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'5992e47de5684ee7bfcc701dfcdc95d1', 1082, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'7ac9ff21858c45b89706e18e10aab0b6', N'1964db4fb9e74467aafde0706c1018dc', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'5ab6c42f92da49deaee36d0452120e6a', 1095, N'b2ca58f867694e9a87295b2375be94e5', N'd986ac16835a4d62baf61dc2ee45c645', N'f973ae2ebf50462c91b16287612a88dd', N'd4e79b48f6504b7cbdb856d144e0881e', 20, 1, 1, CAST(N'2018-11-06T01:29:39.587' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'5c5b28bb7cfb47b7be21a59ba446064f', 1052, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'39bdfe4055d94af6b06762e7a46aa015', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'5e8266069fb64da28af4548c254bc521', 1022, N'd90ec98d32ce4e6ba68c896aa775d3a2', N'2052fc3d0b514ff3ba6968ae39b202ad', N'42118da80b884812a5fb071dfa5fb41e', N'58988164f5484b6286a1dca862a29c29', 10, 1, 1, CAST(N'2018-11-05T22:39:09.050' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'60473b258b56435894d642002f0d8358', 1094, N'2e420d669f8f4a67a22617d5c5375620', N'8d4e41d756f446a581e27333f117f01c', N'7bb5c1fcd0444336ba0d64132bd2b505', N'9fd7b43cb5684abdb8d28a20bf75d95f', 9, 1, 1, CAST(N'2018-11-06T01:27:38.030' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'615f6716ad2c4da1b5382832f8d46809', 1058, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'182639a4916e4c5dae5b5f0729af3148', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'617be25580aa40f49a22fcbfece9d3cf', 1081, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'7ac9ff21858c45b89706e18e10aab0b6', N'463d8bfb862f4e30af1c35bab22d2308', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'69b9fba83c0d49159373ecf8f492d016', 1032, N'5d2997aafa1340f99b2628614c899d62', N'ef92dca418f149a9a8fa95543ecdc7f0', N'97b9fa4265eb4356804e0ad2a3de35db', N'96756944065d42fa913ca96051f4da8a', 12, 1, 1, CAST(N'2018-11-06T00:09:01.787' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'6b13864380494323823e62c83b6d6bba', 1101, N'7f14bd5ae0b442ee88508ff653e4db08', N'649b88137337436fb57b1972667b1c70', N'1916231acdfa43208adb9972b0719787', N'4e2a6b1e5a8d492989b113f67e7adbbb', 10, 1, 1, CAST(N'2018-11-06T01:31:07.360' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'6ce5ed7b46d04abc825489fc22cb6168', 1046, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'ad834690744c4f0d90bae60e6a743c2b', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'6f0c8434e3344cbb8a35c7c2690af1c3', 1054, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'59eff82bc8984e5d95eabdeefaa7d44a', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'721b1f362e3f4849a594a5dd5181f3b4', 1066, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'd7c2ace5ca8f4bb7bdeb8bd1242476b0', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'75f1d7d8387347a3a2764aa461223723', 1105, N'244384b2b1af4c188e378491847b8919', N'b150c65366424661baf6179261e65df2', N'68456f12b3ca4ee391017d51fbbfc22a', N'5fdd8e2c14704351bc2cc3d2af8d81d6', 2, 2, 1, CAST(N'2018-11-07T01:02:14.447' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'76bb1acca247440f97167294917fe0ef', 1085, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'6361de4892344968a249059cdc15984d', N'829fd7a47a4040b2b0cbff5c2c308ed9', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'77d19861765e43e5a4f4dae9766a379c', 1088, N'fd5c889b2fe44572b0d1a5a382ae1ea7', N'a2597d0247764a6f861846717b5b64c7', N'5f3a45282da64e50b62aea07b0d37749', N'86a38edd2ab3419da87d7000022b8bb3', 12, 1, 1, CAST(N'2018-11-06T01:25:48.767' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'7a30606b5b934593b84e0e640ade8b30', 1086, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'6361de4892344968a249059cdc15984d', N'b318c2fee2c24aae997afb55aa2f331a', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'8121cc49118248f4bdbc6fe5ea67f509', 1053, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'0820b99e5da943b3b31e8d0f1dd193dd', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'88f58edac094458ca28e1be3b3ee762b', 1038, N'782dcc48d4a849ecaf3313735359c343', N'b150c65366424661baf6179261e65df2', N'68456f12b3ca4ee391017d51fbbfc22a', N'5fdd8e2c14704351bc2cc3d2af8d81d6', 20, 1, 1, CAST(N'2018-11-06T00:17:28.157' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'8cdb2fbfd7f34720abadeaa6b652fb44', 1062, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'3d22fc9725eb46d4966e6979b95a1fe4', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'8dcafb4bdc05447a83c7e0b4a7f33812', 1037, N'5d2997aafa1340f99b2628614c899d62', N'ef92dca418f149a9a8fa95543ecdc7f0', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', N'6eabdea75fe347f4915e9d3739152a94', 12, 1, 1, CAST(N'2018-11-06T00:09:01.787' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'8fae52c86df04d66a98c5f0064bce197', 1024, N'd90ec98d32ce4e6ba68c896aa775d3a2', N'2052fc3d0b514ff3ba6968ae39b202ad', N'f8b8f536efbf4f608bf2fa19179e7763', N'29a134d21b8e409e8835e3b8e2bb2930', 10, 1, 1, CAST(N'2018-11-05T22:39:09.050' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'99019bc9e4a349c687490d060cd2c679', 1050, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'3f6e1104ff9147cdbde61286fd85c5c3', 1, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'99a401980b1547c7ae4173779f8a8cba', 1047, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'f4b993ee828840d1887bf4623fd7efe0', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'9a3343629efd482687785f687896899c', 1089, N'131ac90925314639b76795faf639a88f', N'374a867f8033425e83daeba41fcc36c2', N'7c2bd16f29b645a0b066868142a545f7', N'87499efe4bed4f03869f14a4b58f2915', 7, 1, 1, CAST(N'2018-11-06T01:26:42.803' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'9a68c56039cb491198992c4aeb1f172b', 1077, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'90bee1d744754635af98a98c708b304c', N'2f5ed050e6af41bba012dfa45a22201b', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'9ad8b75a84144bcc94e527293567ada0', 1056, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'9d1265279a674fc68736f3042af6108e', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'a1380fa621054746b74d05fbf4b55a60', 1055, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'2e83feb613e243b6b19afa286f575d99', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'a94767b5794c4bc2bfe709f7a00ce03a', 1087, N'fd5c889b2fe44572b0d1a5a382ae1ea7', N'a2597d0247764a6f861846717b5b64c7', N'5f3a45282da64e50b62aea07b0d37749', N'04fadefdeb2b43c4aefd0e0e485f860f', 12, 1, 1, CAST(N'2018-11-06T01:25:48.767' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'ad98fb6a116c4edfbe24c870eeb07e78', 1048, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'ca792a148dc04c588fc30ae8e2c4cabf', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'b10638be97b94f2b999f55fbf6672081', 1021, N'd90ec98d32ce4e6ba68c896aa775d3a2', N'2052fc3d0b514ff3ba6968ae39b202ad', N'42118da80b884812a5fb071dfa5fb41e', N'3a4c8da536cf470995bd55dc568b7873', 10, 1, 1, CAST(N'2018-11-05T22:39:09.050' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'b54b1c723a594182980255ee27a84e0c', 1083, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'fde15b57ab774a3494e73bb0a1758282', N'1683ee8ea2af41268820927ddfa1f6cd', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'b7ffa9f58d29464fa13b61308ca554d9', 1084, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'fde15b57ab774a3494e73bb0a1758282', N'a954579617564ea0b4a53a8cf85c65dc', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'bb3d3f99873a4cd8a8dc31b0a1965eee', 1099, N'7f14bd5ae0b442ee88508ff653e4db08', N'649b88137337436fb57b1972667b1c70', N'1916231acdfa43208adb9972b0719787', N'113215ca0502471e9d6b90d6c354bf02', 10, 1, 1, CAST(N'2018-11-06T01:31:07.360' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'bdabdbafa68f4a509ef5e526ee83fdf1', 1103, N'cebbab102c6241358470b7d9aa3a6028', N'a2597d0247764a6f861846717b5b64c7', N'5f3a45282da64e50b62aea07b0d37749', N'86a38edd2ab3419da87d7000022b8bb3', 1, 2, 1, CAST(N'2018-11-07T00:46:05.367' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'bef9d88adf5a451ebc34e9f0eee775f4', 1044, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'ef5418cb23ab45a6a212d3597310529d', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'c10fbfaa08e14ceb8e650ce6376fccbb', 1043, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'1e065f37a72744968b23b9587232e808', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'c9c3e546b5884d00ad274d1e7c7411f7', 1061, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'c466f74855554f1da753e85dacdb1b14', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'ce3b4034450e447b9914c76b4c9e03a6', 1097, N'b2ca58f867694e9a87295b2375be94e5', N'd986ac16835a4d62baf61dc2ee45c645', N'7de53a0800004f9aa8c5bddc7e6ccbf5', N'6573bf2377124daa9f32900c22e9a7a9', 20, 1, 1, CAST(N'2018-11-06T01:29:39.587' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'dd0e67fc614047f6897ac4b4505a17a8', 1096, N'b2ca58f867694e9a87295b2375be94e5', N'd986ac16835a4d62baf61dc2ee45c645', N'f973ae2ebf50462c91b16287612a88dd', N'd9c45dae570a4bd3b2d0fe1e2f0beeb7', 20, 1, 1, CAST(N'2018-11-06T01:29:39.587' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'de357b92e4e0413bbe01cc4822f23450', 1036, N'5d2997aafa1340f99b2628614c899d62', N'ef92dca418f149a9a8fa95543ecdc7f0', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', N'8ad1f5a3f24d458990d958f66459480a', 12, 1, 1, CAST(N'2018-11-06T00:09:01.787' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'e025dbbd5cb54bb5aa6282ca98bab339', 1100, N'7f14bd5ae0b442ee88508ff653e4db08', N'649b88137337436fb57b1972667b1c70', N'1916231acdfa43208adb9972b0719787', N'223198f7528a4d619580959c8bbcb975', 10, 1, 1, CAST(N'2018-11-06T01:31:07.360' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'e229d51830d544a4bbe372b881768464', 1070, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'f7ed1461c9ae4921a91258b86b43ec11', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'e25421bc43ae4e9c86fc230e91e658a4', 1102, N'cebbab102c6241358470b7d9aa3a6028', N'a2597d0247764a6f861846717b5b64c7', N'5f3a45282da64e50b62aea07b0d37749', N'04fadefdeb2b43c4aefd0e0e485f860f', 1, 2, 1, CAST(N'2018-11-07T00:46:05.367' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'e5b74f1244c94ad794266af8d2e53a3c', 1049, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'3f6e1104ff9147cdbde61286fd85c5c3', 9, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'e67047354d7e46ef978bf4cbcfa95c63', 1051, N'4871daf7cd714429b404fc5cb36a9853', N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'942cc1d584ea42c59b0f097552432e06', 10, 1, 1, CAST(N'2018-11-06T00:20:56.017' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'e8eb011397b641c2aaa4b10c6c900f7c', 1020, N'd90ec98d32ce4e6ba68c896aa775d3a2', N'2052fc3d0b514ff3ba6968ae39b202ad', N'42118da80b884812a5fb071dfa5fb41e', N'06294a807ae6438ab71c5b9f1757e15f', 10, 1, 1, CAST(N'2018-11-05T22:39:09.050' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'efccebcfcd5d4a198b269c2fcd919bd0', 1033, N'5d2997aafa1340f99b2628614c899d62', N'ef92dca418f149a9a8fa95543ecdc7f0', N'97b9fa4265eb4356804e0ad2a3de35db', N'3497934ea2b74e078e21f0589a7e6be0', 12, 1, 1, CAST(N'2018-11-06T00:09:01.787' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'f176305f9716479285132c5f882809c3', 1092, N'2e420d669f8f4a67a22617d5c5375620', N'8d4e41d756f446a581e27333f117f01c', N'7bb5c1fcd0444336ba0d64132bd2b505', N'83c199eada904c30b94a6b1cbbf185a8', 9, 1, 1, CAST(N'2018-11-06T01:27:38.030' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'f34166407ca1474cbc41ed85ecab937a', 1068, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'a398d8d9ea0841ba871679392db8df3d', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'f615354ce14d4b1c8a95aee0c8481248', 1080, N'18731a102a914569802d5cb1d83b52bf', N'105d5e183b724f15b689b1f4d98f8757', N'af94b26dd6424953bbe8704cdaf7ac00', N'c084fa93fd20403a9e62d53efbb6effa', 2, 1, 1, CAST(N'2018-11-06T01:15:54.877' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'f6d8ab2d45644729828ef8adc7ba12a8', 1035, N'5d2997aafa1340f99b2628614c899d62', N'ef92dca418f149a9a8fa95543ecdc7f0', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', N'f0c19904c2274d65b06693db2ebafd0f', 12, 1, 1, CAST(N'2018-11-06T00:09:01.787' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'f70a0f3f10d042ef85f7f70cd7b70484', 1060, N'84842881bb8242009b4f2019cecf1693', N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'96ccdec670c84f6a9d886d7251e5dcfc', 5, 1, 1, CAST(N'2018-11-06T00:56:26.513' AS DateTime))
INSERT [dbo].[shGoodReceiptIsuueDetail] ([ReceiptIsuueDetailGuid], [ReceiptIsuueDetailId], [ReceiptIsuueGuid], [ProductGuid], [SectionGuid], [SizeGuid], [Number], [Phieu], [Status], [CreateDate]) VALUES (N'ff72af3183c2481d8e881fdccbdca65e', 1073, N'590b199ab1674dbaa079699d1c7168a7', N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'e8e9c75819d847a0b457f5aa6e1e661c', 7, 1, 1, CAST(N'2018-11-06T00:57:52.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[shGoodReceiptIsuueDetail] OFF
SET IDENTITY_INSERT [dbo].[shIdeaCustomer] ON 

INSERT [dbo].[shIdeaCustomer] ([IdeaGuid], [IdeaId], [Name], [Contents], [Image], [SortOrder], [Status], [CreateDate]) VALUES (N'1376569556144e2491ae99e42cc87f1a', 1, N'Chị Hoàng Minh Thảo', N'Hài Lòng', N'/images/product/10_2018/ea2bc07c466347549f6446da00830422126_fm_fmax_fw_fh_zmax_crop_img_feel1_2.jpg', 1, 1, CAST(N'2018-10-19T00:56:23.413' AS DateTime))
INSERT [dbo].[shIdeaCustomer] ([IdeaGuid], [IdeaId], [Name], [Contents], [Image], [SortOrder], [Status], [CreateDate]) VALUES (N'14b13f07241e433fa8f0430249c6bee4', 2, N'Anh : Phạm Văn Hoàng', N'Mùa cưới năm nay mình đã tin tưởng lựa chọn sản phẩm Chăn ga gối của Sông Hồng', N'/images/product/10_2018/8cc4f5b159734ee39e6dfb24e44546ae126_fm_fmax_fw_fh_zmax_crop_img_feel2.jpg', 2, 1, CAST(N'2018-10-19T00:56:28.913' AS DateTime))
INSERT [dbo].[shIdeaCustomer] ([IdeaGuid], [IdeaId], [Name], [Contents], [Image], [SortOrder], [Status], [CreateDate]) VALUES (N'26ce21f9ab764efe9a14636b97811b75', 3, N'Chị : Nguyễn Minh Trang', N'Dịch vụ và sản phẩm của SongHong rất tốt và thoải mái khi sử dụng
', N'/images/product/10_2018/092a66ede4aa4ffb83cb9da719753c69126_fm_fmax_fw_fh_zmax_crop_img_feel3.jpg', 3, 1, CAST(N'2018-10-19T00:56:33.370' AS DateTime))
INSERT [dbo].[shIdeaCustomer] ([IdeaGuid], [IdeaId], [Name], [Contents], [Image], [SortOrder], [Status], [CreateDate]) VALUES (N'af5f1edbc3324cd4b930cf2ec663c863', 4, N'Chị : Nguyễn Thanh Nga', N'Tôi đã lựa chọn dòng sản phẩm Hello Kitty của May Sông Hồng vì có màu sắc đẹp đẽ, hình ảnh dễ thương phù hợp với lứa tuổi của tôi', N'/images/product/10_2018/06bfba822c354c4eb54c2e19fe051ed8126_fm_fmax_fw_fh_zmax_crop_img_feel4.jpg', 4, 1, CAST(N'2018-10-19T00:56:38.613' AS DateTime))
SET IDENTITY_INSERT [dbo].[shIdeaCustomer] OFF
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'06965b34d4d44f2fba922cd073e47d6e', 10000, N'Nguyễn Văn An', N'14', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:22:34.157' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'06feadad17a64fbc8e8a5334edcf938d', 10001, N'Cathy Trần', N'13', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', N'', N'', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789', N'', 1, CAST(N'2018-10-13T22:46:23.447' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'282c6293dd15456aa611a5ff512d6ce4', 10002, N'Nguyễn Văn An', N'12', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:26:16.050' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'2ec3b766dd8f422291f949d0b21ae85e', 10003, N'Nguyễn Văn An', N'11', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:24:49.107' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'338b00f365744caeb41234ea2a52db12', 10004, N'Nguyễn Văn An', N'9', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:15:28.997' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'3e383086c7bd42d1ac3aa7e9ab9c5d13', 10005, N'Nguyễn Văn An', N'annv', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 1, N'nghinv00@gmail.com', NULL, NULL, N'0123456789', N'', 1, CAST(N'2018-11-06T02:46:34.483' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'4a698d826b824c928016a9fc8096198a', 10006, N'hoa trần', N'8', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', N'', N'', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789', N'', 1, CAST(N'2018-10-13T22:51:52.533' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'5ba55caa3f0043c0ac56a2766631ecde', 10007, N'Nguyễn Văn An', N'7', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:24:02.167' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'6d43adce2f3d466296f4af0af7801697', 10008, N'Nguyễn Văn An', N'4', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:49:36.773' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'7c9e7a316e1a44ca8336c79e97f1982c', 10009, N'Nguyễn Văn An', N'3', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:16:42.733' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'a6ddb5197fa846babdb4f6a586785dbc', 10010, N'Nguyễn Văn An', N'6', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:58:26.820' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'aadcd9d36131423a8e85db2bba5402a3', 10011, N'Nguyễn Văn An', N'2', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T17:02:44.243' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'ca7d51bc54134434bf5f06d8d8cd0a7d', 10012, N'Nguyễn Văn An', N'1', N'01-33-9A-79-16-5F-8F-F2-3A-91-67-65-5C-EA-61-1E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789111', N'', 1, CAST(N'2018-10-21T16:50:51.337' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'dbd85204822640859d1f18a59c2c1652', 10013, N'Nguyễn Văn An', N'annv', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', N'/images/product/10_2018/9042ee607276427e901659a70833f32ccathy_tran_2.jpg', N'Hà Nội', 2, N'nghinv00@gmail.com', NULL, NULL, N'0123456789', N'', 1, CAST(N'2018-10-13T22:32:44.267' AS DateTime), NULL)
INSERT [dbo].[shMembers] ([MemberGuiId], [MemberId], [MemberName], [MemberLogin], [Password], [ImageFile], [Address], [Sex], [Email], [Tel], [BirthDay], [Phone], [Notes], [Status], [CreateDate], [LaDaXem]) VALUES (N'e1dd20b3f4c4410a95831e7fbe726ff5', 10014, N'fadfadf', N'16', N'DD-89-39-1D-9B-BC-29-1A-8E-5A-A9-1A-2B-10-33-0E', N'/images/product/10_2018/c095a4c664dd4c97b945f98dc8b37cd8hiragana.png', N'', NULL, N'nghinv00@gmail.com', NULL, NULL, N'', N'', 1, CAST(N'2018-10-13T22:53:38.297' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[shNews] ON 

INSERT [dbo].[shNews] ([NewGuiId], [NewId], [TitleNew], [MetaTitle], [Descriptions], [ImageFile], [Summary], [Contents], [SortOrder], [Status], [CreatedDate]) VALUES (N'19952da1b8854e55acd8a21b23acbbba', 3, N'CHĂN GA GỐI NỆM TỐT BẢO VỆ SỨC KHỎE', N'/tin-tuc/CHAN-GA-GOI-NEM-TOT-BAO-VE-SUC-KHOE', N'', N'/images/product/10_2018/37846e13f91746b39c61bfef860e0e3anews4.png', N'Ông bà ta thường nói chăn ấm, nệm êm sẽ mang lại hạnh phúc cho gia đình và hơn thế ngày nay ta nhận thấy còn giúp chúng ta có sức khỏe tốt hơn. Một chiếc nệm êm, bộ chăn ga mềm mại thật cần thiết cho giấc ngủ của tất cả gia đình mỗi ngày.

Để  chăm sóc giấc ngủ ngon, chị Việt Liên, một nhân viên ngân hàng, quận Phú Nhuận, TP.HCM nói: “Tôi ra các cửa hàng và thấy cả rừng nệm, đủ loại, đủ giá, đủ thương hiệu. Lương của tôi thì không thể mua những loại nệm quá đắt tiền, nhưng tôi cũng không muốn mua loại rẻ mà chất lượng tồi”.

Chọn nệm như thế nào là tốt cho sức khỏe ?', N'<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px;">
	<img src="/images/product/10_2018/6679da22b0434fd090d1bce26d20edd1news4.png" />&nbsp; &nbsp;<strong>Ô</strong><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; font-weight: 700; text-align: justify;">ng bà ta thường nói chăn ấm, nệm êm sẽ mang lại hạnh phúc cho gia đình và hơn thế ngày nay ta nhận thấy còn giúp chúng ta có sức khỏe tốt hơn. Một chiếc nệm êm, bộ chăn ga mềm mại thật cần thiết cho giấc ngủ của tất cả gia đình mỗi ngày.</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px;">
	<span style="box-sizing: border-box; font-weight: 700; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Để&nbsp; chăm sóc giấc ngủ ngon, chị Việt Liên, một nhân viên ngân hàng, quận Phú Nhuận, TP.HCM nói: &ldquo;Tôi ra các cửa hàng và thấy cả rừng nệm, đủ loại, đủ giá, đủ thương hiệu. Lương của tôi thì không thể mua những loại nệm quá đắt tiền, nhưng tôi cũng không muốn mua loại rẻ mà chất lượng tồi&rdquo;.</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">
	<span style="box-sizing: border-box; font-weight: 700;">Chọn nệm như thế nào là tốt cho sức khỏe&nbsp;?</span></p>
<div>
	&nbsp;</div>
<div>
	<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">
		Đây không phải là băn khoăn duy nhất, trong đó có cả những người từng sử dụng nệm nhiều năm rồi một ngày bỗng phát bệnh đau lưng. Theo các chuyên gia thì chuyện này không có gì bất thường. Bởi dù mỗi người thường dành 1/3 cuộc đời chỉ cho việc ngủ nhưng tiêu chí chọn nệm tốt không phải ai cũng biết.</p>
	<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">
		Bạn đã chọn mua cho mình một chiếc giường và nệm mới. Nhưng chiếc giường này sẽ mất đi 70% giá trị của nó sau 5 đến 10 năm sử dụng. Vì vậy bạn cần thay nệm mới. Và để không bị đau lưng và đổ lỗi cho nằm nệm, bạn cần chăm sóc cái lưng của mình cẩn thận khi đã lớn tuổi. Khi đó chỉ cần vặn người hay nâng đồ vật nặng sai tư thế là bạn có thể bị chứng bệnh khó chịu này.</p>
</div>
<p>
	<img src="/images/product/10_2018/c0ee778e7dac47e1b6649fd9b64379a4dem-bong-tot-tinh-khiet-chat-luong-cao.jpg" style="float: left;" /></p>
<p>
	&nbsp;</p>
<div>
	Nệm bông tinh khiết thế hệ 2 &ndash; êm ái, độ đàn hồi tốt, độ bền cao</div>
', NULL, 1, CAST(N'2018-10-13T10:50:37.910' AS DateTime))
INSERT [dbo].[shNews] ([NewGuiId], [NewId], [TitleNew], [MetaTitle], [Descriptions], [ImageFile], [Summary], [Contents], [SortOrder], [Status], [CreatedDate]) VALUES (N'dbd85204822640859d1f18a59c2c1652', 2, N'ĐỆM NÀO LÀ SỰ LỰA CHỌN THÔNG MINH CỦA BẠN', N'/tin-tuc/DEM-NAO-LA-SU-LUA-CHON-THONG-MINH-CUA-BAN', N'', N'/images/product/10_2018/37f64789e4414c78b6a1f5fbe6546e39(570x380)_crop_nem-trang-tinh-khiet.jpg', N'Hiện nay có rất nhiều loại đệm trên thị trường nhưng tại sao ngày càng nhiều người tin dùng đệm bông tinh khiết Sông Hồng. Bạn biết tại sao không?

Hãy khám phá những ưu điểm của Đệm bông tinh khiết Sông Hồng theo tiêu chuẩn và công nghệ Nhật Bản
', N'<div class="imgDetail_left" style="box-sizing: border-box; margin: 0px 7px 0px 0px; padding: 0px; float: left; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify; width: 412px;">
	<a class="thickbox" href="/SongHongvn/vnt_upload/news/11_2016/nem-trang-tinh-khiet.jpg" style="box-sizing: border-box; background-color: transparent; color: rgb(245, 0, 145); text-decoration-line: none; line-height: 22px; transition: color 0.5s ease 0s; outline: 0px;" title="Zoom">
<img alt="Đệm nào là sự lựa chọn thông minh của bạn" src="/SongHongvn/vnt_upload/news/11_2016/nem-trang-tinh-khiet.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" title="Đệm nào là sự lựa chọn thông minh của bạn" width="412" /></a>
	<p class="fDespic" style="box-sizing: border-box; margin: 0px; padding: 5px 0px; font-size: 9px; color: rgb(153, 153, 153); text-align: center;">
		Đệm nào là sự lựa chọn thông minh của bạn</p>
</div>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px;">
	<span style="box-sizing: border-box; font-weight: 700; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;"><span style="box-sizing: border-box;">Hiện nay có rất nhiều loại đệm trên thị trường nhưng tại sao ngày càng nhiều người tin dùng đệm bông tinh khiết Sông Hồng. Bạn biết tại sao không?</span></span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px;">
	<span style="box-sizing: border-box; font-weight: 700; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;"><span style="box-sizing: border-box;">Hãy khám phá những ưu điểm của Đệm bông tinh khiết Sông Hồng theo tiêu chuẩn và công nghệ Nhật Bản</span></span></p>
<p>
	<img alt="all_" src="/SongHongvn/vnt_upload/news/12_2016/all_.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify; width: 1024px; height: 1454px;" /></p>
', NULL, 1, CAST(N'2018-10-13T11:21:09.270' AS DateTime))
SET IDENTITY_INSERT [dbo].[shNews] OFF
SET IDENTITY_INSERT [dbo].[shOrder] ON 

INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'0f1119d66acb4359b67703db016bb3c5', 1040, NULL, N'', N'Test 4', N'', N'0123456789', N'Thanh Xuân', 3060000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-23T22:12:43.250' AS DateTime), NULL, 4, 1, CAST(N'2018-11-23T22:12:43.247' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'20fbbbea543c4bd4813a80be2e6622ea', 1020, N'', N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Mạnh Hùng', N'', N'0123456789', N'Thanh Xuân', 4338000.0000, 9, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-06T02:40:21.597' AS DateTime), NULL, 3, 1, CAST(N'2018-11-06T02:40:21.597' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'220afae6dfd742d5baec0ef6b98f3fdb', 1018, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Lê Thị Hoa', N'', N'0123456789', N'Thanh Xuân', 216000.0000, 7, NULL, NULL, NULL, 50000.0000, 1, CAST(N'2018-11-06T02:22:57.257' AS DateTime), NULL, 4, 1, CAST(N'2018-11-06T02:22:57.257' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'311e11c5308c4ec89946fffbb7aeab10', 1028, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Văn Nghị', N'Nghinguyenv1310@gmail.com', N'0123456789', N'Thanh Xuân', 2700000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-15T17:03:56.417' AS DateTime), NULL, NULL, 1, CAST(N'2018-11-15T17:03:56.417' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'3e316886c6f14dce9fcf4a142eb9b528', 1027, N'', N'dbd85204822640859d1f18a59c2c1652', N'Lê Thị Thắm', N'', N'0123456789', N'Thanh Xuân', 6192000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-06T02:55:54.277' AS DateTime), NULL, 4, 1, CAST(N'2018-11-06T02:55:54.277' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'49da0d7e20b8450bbc9986eb9f409282', 1024, N'', N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Anh Thắng', N'', N'0123456789', N'Thanh Xuân', 1710000.0000, 4, NULL, NULL, NULL, 50000.0000, 1, CAST(N'2018-11-06T02:46:10.457' AS DateTime), NULL, 3, 1, CAST(N'2018-11-06T02:46:10.457' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'50c664c79b814b6ab82b1e5a0be703fc', 1023, N'', N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Văn Điền', N'', N'0123456789', N'Thanh Xuân', 9171000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-06T02:43:47.700' AS DateTime), NULL, 2, 1, CAST(N'2018-11-06T02:43:47.700' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'6bdd336921c7442aab049ea1fb38915d', 1022, N'', N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Văn An', N'', N'0123456789', N'Thanh Xuân', 7074000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-06T02:42:42.870' AS DateTime), NULL, 2, 1, CAST(N'2018-11-06T02:42:42.870' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'7866d886a10f46acba3c9ec0e665f54b', 1026, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Bùi Huy Đức', N'', N'0123456789', N'Thanh Xuân', 3465000.0000, 9, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-06T02:52:47.820' AS DateTime), NULL, 4, 1, CAST(N'2018-11-06T02:52:47.820' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'84fcc0196f1a41d0b3356ab8c4e8fd11', 1033, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Thị Yên', N'', N'0123456789', N'Yên Mỹ Ý Yên', 3420000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-23T21:10:20.837' AS DateTime), NULL, 0, 1, CAST(N'2018-11-23T21:10:20.837' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'86ba5990dde54cfaba9df819bff6607f', 1021, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Mai Anh Bảo', N'', N'0123456789', N'Thanh Xuân', 3267000.0000, 9, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-06T02:41:23.193' AS DateTime), NULL, 4, 1, CAST(N'2018-11-06T02:41:23.193' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'900a59e691e646cd820d0674f3322c53', 1032, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Huy Tưởng', N'', N'0123456789', N'Hà Nội', 6120000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-23T20:55:46.193' AS DateTime), NULL, 0, 1, CAST(N'2018-11-23T20:55:46.193' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'908169341361470b823695c00762e7a6', 1016, N'', N'dbd85204822640859d1f18a59c2c1652', N'Lê văn Tùng', N'', N'0123456789', N'Thanh Xuân', 1485000.0000, 4, NULL, NULL, NULL, 50000.0000, 1, CAST(N'2018-11-05T20:56:28.067' AS DateTime), NULL, 2, 1, CAST(N'2018-11-05T20:56:28.060' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'950f19553b3c45729536221eb44bf068', 1029, NULL, N'dbd85204822640859d1f18a59c2c1652', N'NGuyễn Văn Nghi 15/10', N'Nghinguyenv1310@gmail.com', N'0123456789', N'Thanh Xuân', 6624000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-15T17:34:35.357' AS DateTime), NULL, NULL, 1, CAST(N'2018-11-15T17:34:35.357' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'9b629e82ebca4f0597ae8bdf52dd324f', 1019, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Quỳnh Mai', N'', N'0123456789', N'Thanh Xuân', 759600.0000, 5, NULL, NULL, NULL, 50000.0000, 1, CAST(N'2018-11-06T02:33:31.207' AS DateTime), NULL, 3, 1, CAST(N'2018-11-06T02:33:31.207' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'b49e56ec9ea74b7582939610c3f6158b', 1015, N'', N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Thị Hồng', N'', N'0123456789', N'Thanh Xuân', 6885000.0000, 7, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-05T20:34:01.030' AS DateTime), NULL, 4, 1, CAST(N'2018-11-05T20:34:01.027' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'c31c72b1e3b94e07a401d29436c6a244', 1035, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Test 2', N'', N'0123456789', N'Test 2', 10260000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-23T21:18:04.250' AS DateTime), NULL, 3, 1, CAST(N'2018-11-23T21:18:04.250' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'd1d6d54d12da47ae91ad7040e918fa81', 1034, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Test', N'', N'0123456789', N'Test', 3420000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-23T21:15:07.903' AS DateTime), NULL, 4, 1, CAST(N'2018-11-23T21:15:07.900' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'e54ae6b6c6e04ecb9be375670b0c3034', 1031, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Thị hoàng', N'', N'0123456789', N'Thanh Xuân', 5400000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-23T20:53:00.993' AS DateTime), NULL, 0, 1, CAST(N'2018-11-23T20:53:00.993' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'e5e14465f6ec4aeaaf485952a6cd3f8f', 1030, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Nguyen Thi Hoa ', N'Nghinguyenv1310@gmail.com', N'0123456789', N'Thanh Xuân', 22050000.0000, 5, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-19T12:27:02.270' AS DateTime), NULL, 3, 1, CAST(N'2018-11-19T12:27:02.270' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'e71fa38de681499d9cc633c95ca05dfa', 1014, N'', N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Huy Hoàng', N'', N'0123456789', N'Hà Nội', 5400000.0000, 7, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-05T14:51:37.387' AS DateTime), NULL, 3, 1, CAST(N'2018-11-05T14:51:37.387' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'ecef9c72c3e142ac894882729069c1a9', 1025, N'', N'dbd85204822640859d1f18a59c2c1652', N'Nguyễn Văn Điền', N'', N'0123456789', N'Thanh Xuân', 2250000.0000, 4, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-06T02:47:43.850' AS DateTime), NULL, 3, 1, CAST(N'2018-11-06T02:47:43.850' AS DateTime))
INSERT [dbo].[shOrder] ([OrderGuid], [OrderId], [OrderName], [MemberGuid], [FullName], [Email], [Phone], [Address], [Total], [OrderStatus], [SortOrder], [DistrictId], [ProvinceId], [FeeShip], [PayType], [NgayDat], [LaDaXem], [UserId], [Status], [CreateDate]) VALUES (N'f8ce4546e5d34847a31f5873576c4298', 1017, NULL, N'dbd85204822640859d1f18a59c2c1652', N'Mai thị Hoa', N'', N'0123456789', N'Thanh Xuân', 5508000.0000, 5, NULL, NULL, NULL, 0.0000, 1, CAST(N'2018-11-05T22:18:57.197' AS DateTime), NULL, 3, 1, CAST(N'2018-11-05T22:18:57.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[shOrder] OFF
SET IDENTITY_INSERT [dbo].[shOrderDetail] ON 

INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'0df2b581803a4985814b3a7ecd749915', 1042, NULL, N'311e11c5308c4ec89946fffbb7aeab10', N'dbd85204822640859d1f18a59c2c1652', N'b150c65366424661baf6179261e65df2', N'BỘ CHĂN GA GỐI SH_H18 056', N'68456f12b3ca4ee391017d51fbbfc22a', N'5fdd8e2c14704351bc2cc3d2af8d81d6', 1, 2700000.0000, 2700000.0000, NULL, NULL, CAST(N'2018-11-15T17:03:56.517' AS DateTime), NULL, 1, CAST(N'2018-11-15T17:03:56.517' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'0fdcc4a978ba4680b2218a04c3b3a2e4', 1020, NULL, N'b49e56ec9ea74b7582939610c3f6158b', N'dbd85204822640859d1f18a59c2c1652', N'a2597d0247764a6f861846717b5b64c7', N'BỘ CLASSIC COTTON SH_C16 041', N'5f3a45282da64e50b62aea07b0d37749', N'04fadefdeb2b43c4aefd0e0e485f860f', 1, 3420000.0000, 3420000.0000, NULL, NULL, CAST(N'2018-11-05T20:34:52.220' AS DateTime), NULL, 1, CAST(N'2018-11-05T20:34:52.220' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'1f452eec49e64c56a19dcad05f5ea84b', 1023, NULL, N'f8ce4546e5d34847a31f5873576c4298', N'dbd85204822640859d1f18a59c2c1652', N'8d4e41d756f446a581e27333f117f01c', N'BỘ SẢN PHẨM DISNEY SH_DN18 04', N'7bb5c1fcd0444336ba0d64132bd2b505', N'83c199eada904c30b94a6b1cbbf185a8', 2, 1863000.0000, 3726000.0000, NULL, NULL, CAST(N'2018-11-05T22:18:58.060' AS DateTime), NULL, 1, CAST(N'2018-11-05T22:18:58.060' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'23cf5a883de64d5ebda59f2802a9cda5', 1026, NULL, N'9b629e82ebca4f0597ae8bdf52dd324f', N'dbd85204822640859d1f18a59c2c1652', N'105d5e183b724f15b689b1f4d98f8757', N'RUỘT GỐI', N'6361de4892344968a249059cdc15984d', N'b318c2fee2c24aae997afb55aa2f331a', 2, 70200.0000, 140400.0000, NULL, NULL, CAST(N'2018-11-06T02:33:31.553' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:33:31.553' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'2f20e382a4cb418f8a5b66fbe18a1f8b', 1049, NULL, N'd1d6d54d12da47ae91ad7040e918fa81', N'dbd85204822640859d1f18a59c2c1652', N'a2597d0247764a6f861846717b5b64c7', N'BỘ CLASSIC COTTON SH_C16 041', N'5f3a45282da64e50b62aea07b0d37749', N'04fadefdeb2b43c4aefd0e0e485f860f', 1, 3420000.0000, 3420000.0000, NULL, NULL, CAST(N'2018-11-23T21:15:15.657' AS DateTime), NULL, 1, CAST(N'2018-11-23T21:15:15.653' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'4741ba0b29cf4c8ea3d09fdf2f7c15ae', 1019, NULL, N'e71fa38de681499d9cc633c95ca05dfa', N'dbd85204822640859d1f18a59c2c1652', N'b150c65366424661baf6179261e65df2', N'BỘ CHĂN GA GỐI SH_H18 056', N'68456f12b3ca4ee391017d51fbbfc22a', N'5fdd8e2c14704351bc2cc3d2af8d81d6', 2, 2700000.0000, 5400000.0000, NULL, NULL, CAST(N'2018-11-05T14:52:40.737' AS DateTime), NULL, 1, CAST(N'2018-11-05T14:52:40.733' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'49766e96aa6e4b308ed77c5606e12b52', 1030, NULL, N'9b629e82ebca4f0597ae8bdf52dd324f', N'dbd85204822640859d1f18a59c2c1652', N'105d5e183b724f15b689b1f4d98f8757', N'RUỘT GỐI', N'fde15b57ab774a3494e73bb0a1758282', N'a954579617564ea0b4a53a8cf85c65dc', 2, 124200.0000, 248400.0000, NULL, NULL, CAST(N'2018-11-06T02:33:31.600' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:33:31.600' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'5d3dac0cef0746b9b106966a12ded982', 1029, NULL, N'9b629e82ebca4f0597ae8bdf52dd324f', N'dbd85204822640859d1f18a59c2c1652', N'105d5e183b724f15b689b1f4d98f8757', N'RUỘT GỐI', N'7ac9ff21858c45b89706e18e10aab0b6', N'463d8bfb862f4e30af1c35bab22d2308', 2, 60300.0000, 120600.0000, NULL, NULL, CAST(N'2018-11-06T02:33:31.593' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:33:31.593' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'60942f5cb3384c358b2c58cc6dd7f806', 1045, NULL, N'e5e14465f6ec4aeaaf485952a6cd3f8f', N'dbd85204822640859d1f18a59c2c1652', N'ef92dca418f149a9a8fa95543ecdc7f0', N'BỘ CHĂN GA GỐI SH_H17 054', N'97b9fa4265eb4356804e0ad2a3de35db', N'96756944065d42fa913ca96051f4da8a', 2, 3411000.0000, 6822000.0000, NULL, NULL, CAST(N'2018-11-19T12:27:02.810' AS DateTime), NULL, 1, CAST(N'2018-11-19T12:27:02.810' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'646c61e57cc44293aa48c2c7b526eba0', 1033, NULL, N'6bdd336921c7442aab049ea1fb38915d', N'dbd85204822640859d1f18a59c2c1652', N'2052fc3d0b514ff3ba6968ae39b202ad', N'BỘ CHĂN GA GỐI SH_H17 051', N'42118da80b884812a5fb071dfa5fb41e', N'06294a807ae6438ab71c5b9f1757e15f', 1, 3762000.0000, 3762000.0000, NULL, NULL, CAST(N'2018-11-06T02:42:43.167' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:42:43.167' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'79ed5212ab3b453185062eeb2fcf2c73', 1028, NULL, N'9b629e82ebca4f0597ae8bdf52dd324f', N'dbd85204822640859d1f18a59c2c1652', N'105d5e183b724f15b689b1f4d98f8757', N'RUỘT GỐI', N'af94b26dd6424953bbe8704cdaf7ac00', N'a04f45e9653c4b6a8da10e6b3d7f4a49', 2, 60300.0000, 120600.0000, NULL, NULL, CAST(N'2018-11-06T02:33:31.587' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:33:31.587' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'7fbabba0eff14d13b1dcab1fead11d0a', 1043, NULL, N'950f19553b3c45729536221eb44bf068', N'dbd85204822640859d1f18a59c2c1652', N'2052fc3d0b514ff3ba6968ae39b202ad', N'BỘ CHĂN GA GỐI SH_H17 051', N'f8b8f536efbf4f608bf2fa19179e7763', N'1da57e1b547a458db31d0b795d4300c0', 2, 3312000.0000, 6624000.0000, NULL, NULL, CAST(N'2018-11-15T17:34:35.640' AS DateTime), NULL, 1, CAST(N'2018-11-15T17:34:35.640' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'9177dc9b4119404c9a877a21b6014200', 1037, NULL, N'50c664c79b814b6ab82b1e5a0be703fc', N'dbd85204822640859d1f18a59c2c1652', N'6952b3a16adc4e76841f6c016cbe01ad', N'BỘ CHĂN GA GỐI SH_H17 052', N'c0697a9b39cc4e26afc4c8d69226573c', N'06b9db51775d4b7f901f7d708bbb03d7', 1, 3060000.0000, 3060000.0000, NULL, NULL, CAST(N'2018-11-06T02:43:47.997' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:43:47.997' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'976d61bac78d4795b99067dbf86a43f5', 1032, NULL, N'86ba5990dde54cfaba9df819bff6607f', N'dbd85204822640859d1f18a59c2c1652', N'423eaa676f704dbaba57152c45e21c09', N'ĐỆM BÔNG TINH KHIẾT VỎ VẢI GẤM  ', N'57e620ba8b8e40928d106b610b250243', N'e08417e25d32473eb6385c3d7d12de66', 2, 1633500.0000, 3267000.0000, NULL, NULL, CAST(N'2018-11-06T02:41:23.217' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:41:23.217' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'99966c855cd14601ba4ccf2595f6cfa6', 1024, NULL, N'f8ce4546e5d34847a31f5873576c4298', N'dbd85204822640859d1f18a59c2c1652', N'd986ac16835a4d62baf61dc2ee45c645', N'BỘ ELEGANCE SH-E18 10', N'f973ae2ebf50462c91b16287612a88dd', N'd4e79b48f6504b7cbdb856d144e0881e', 1, 1782000.0000, 1782000.0000, NULL, NULL, CAST(N'2018-11-05T22:18:58.087' AS DateTime), NULL, 1, CAST(N'2018-11-05T22:18:58.087' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'99d63eef0b9d4dd7bff953ff373322c9', 1021, NULL, N'b49e56ec9ea74b7582939610c3f6158b', N'dbd85204822640859d1f18a59c2c1652', N'a2597d0247764a6f861846717b5b64c7', N'BỘ CLASSIC COTTON SH_C16 041', N'5f3a45282da64e50b62aea07b0d37749', N'86a38edd2ab3419da87d7000022b8bb3', 1, 3465000.0000, 3465000.0000, NULL, NULL, CAST(N'2018-11-05T20:35:03.440' AS DateTime), NULL, 1, CAST(N'2018-11-05T20:35:03.437' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'a0c1c4636607412d8e53c6a5b7c5d41f', 1039, NULL, N'ecef9c72c3e142ac894882729069c1a9', N'dbd85204822640859d1f18a59c2c1652', N'8d4e41d756f446a581e27333f117f01c', N'BỘ SẢN PHẨM DISNEY SH_DN18 04', N'7bb5c1fcd0444336ba0d64132bd2b505', N'9fd7b43cb5684abdb8d28a20bf75d95f', 1, 2250000.0000, 2250000.0000, NULL, NULL, CAST(N'2018-11-06T02:47:44.150' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:47:44.150' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'a3e6c6e1cef34c81a6d1782873294383', 1041, NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'dbd85204822640859d1f18a59c2c1652', N'6952b3a16adc4e76841f6c016cbe01ad', N'BỘ CHĂN GA GỐI SH_H17 052', N'c0697a9b39cc4e26afc4c8d69226573c', N'd28d3c8d894b4395a3bf4a333890671b', 2, 3096000.0000, 6192000.0000, NULL, NULL, CAST(N'2018-11-06T02:55:54.297' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:55:54.297' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'bf16ad16bfa24fd489c2b851eec0a722', 1031, NULL, N'20fbbbea543c4bd4813a80be2e6622ea', N'dbd85204822640859d1f18a59c2c1652', N'4c52c9d3ae164a2fa85aae61ef18929e', N'ĐỆM BÔNG TINH KHIẾT THẾ HỆ THỨ HAI', N'591cdf63f6a44c21865a4b3cdaf58f48', N'76a92b204b6a481f9b513f9b2b2e5cdc', 1, 4338000.0000, 4338000.0000, NULL, NULL, CAST(N'2018-11-06T02:40:21.617' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:40:21.617' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'ca5c4f9ed7f846ada6ce93a2f301fb0c', 1050, NULL, N'c31c72b1e3b94e07a401d29436c6a244', N'dbd85204822640859d1f18a59c2c1652', N'a2597d0247764a6f861846717b5b64c7', N'BỘ CLASSIC COTTON SH_C16 041', N'5f3a45282da64e50b62aea07b0d37749', N'04fadefdeb2b43c4aefd0e0e485f860f', 3, 3420000.0000, 10260000.0000, NULL, NULL, CAST(N'2018-11-23T21:18:04.727' AS DateTime), NULL, 1, CAST(N'2018-11-23T21:18:04.727' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'd1159cd33a8442aca499ed2a1d15d127', 1046, NULL, N'e54ae6b6c6e04ecb9be375670b0c3034', N'dbd85204822640859d1f18a59c2c1652', N'b150c65366424661baf6179261e65df2', N'BỘ CHĂN GA GỐI SH_H18 056', N'68456f12b3ca4ee391017d51fbbfc22a', N'5fdd8e2c14704351bc2cc3d2af8d81d6', 2, 2700000.0000, 5400000.0000, NULL, NULL, CAST(N'2018-11-23T20:53:01.287' AS DateTime), NULL, 1, CAST(N'2018-11-23T20:53:01.287' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'd2f3a6d5fb1642c39bcfb4d2d5864233', 1048, NULL, N'84fcc0196f1a41d0b3356ab8c4e8fd11', N'dbd85204822640859d1f18a59c2c1652', N'a2597d0247764a6f861846717b5b64c7', N'BỘ CLASSIC COTTON SH_C16 041', N'5f3a45282da64e50b62aea07b0d37749', N'04fadefdeb2b43c4aefd0e0e485f860f', 1, 3420000.0000, 3420000.0000, NULL, NULL, CAST(N'2018-11-23T21:10:21.177' AS DateTime), NULL, 1, CAST(N'2018-11-23T21:10:21.177' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'd6ab6a1e9aaa433cb96447d47fddba93', 1047, NULL, N'900a59e691e646cd820d0674f3322c53', N'dbd85204822640859d1f18a59c2c1652', N'6952b3a16adc4e76841f6c016cbe01ad', N'BỘ CHĂN GA GỐI SH_H17 052', N'c0697a9b39cc4e26afc4c8d69226573c', N'06b9db51775d4b7f901f7d708bbb03d7', 2, 3060000.0000, 6120000.0000, NULL, NULL, CAST(N'2018-11-23T20:55:46.483' AS DateTime), NULL, 1, CAST(N'2018-11-23T20:55:46.483' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'dca9b564010544a7a5a9c187646d77da', 1038, NULL, N'49da0d7e20b8450bbc9986eb9f409282', N'dbd85204822640859d1f18a59c2c1652', N'649b88137337436fb57b1972667b1c70', N'BỘ CHĂN GA GỐI TRẺ EM TE 05', N'1916231acdfa43208adb9972b0719787', N'4e2a6b1e5a8d492989b113f67e7adbbb', 1, 1710000.0000, 1710000.0000, NULL, NULL, CAST(N'2018-11-06T02:46:10.727' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:46:10.727' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'e6243722d7b44814beee523820c58e8b', 1036, NULL, N'50c664c79b814b6ab82b1e5a0be703fc', N'dbd85204822640859d1f18a59c2c1652', N'b150c65366424661baf6179261e65df2', N'BỘ CHĂN GA GỐI SH_H18 056', N'68456f12b3ca4ee391017d51fbbfc22a', N'5fdd8e2c14704351bc2cc3d2af8d81d6', 1, 2700000.0000, 2700000.0000, NULL, NULL, CAST(N'2018-11-06T02:43:47.990' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:43:47.990' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'eab8eb0e412f430b8b530331502bddf9', 1035, NULL, N'50c664c79b814b6ab82b1e5a0be703fc', N'dbd85204822640859d1f18a59c2c1652', N'ef92dca418f149a9a8fa95543ecdc7f0', N'BỘ CHĂN GA GỐI SH_H17 054', N'97b9fa4265eb4356804e0ad2a3de35db', N'96756944065d42fa913ca96051f4da8a', 1, 3411000.0000, 3411000.0000, NULL, NULL, CAST(N'2018-11-06T02:43:47.983' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:43:47.983' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'f017752f7ba84cb3a623eca15dc39f2b', 1022, NULL, N'908169341361470b823695c00762e7a6', N'dbd85204822640859d1f18a59c2c1652', N'374a867f8033425e83daeba41fcc36c2', N'BỘ CHĂN GA GỐI HELLO KITTY SH_D18 020', N'7c2bd16f29b645a0b066868142a545f7', N'87499efe4bed4f03869f14a4b58f2915', 1, 1485000.0000, 1485000.0000, NULL, NULL, CAST(N'2018-11-05T20:56:32.460' AS DateTime), NULL, 1, CAST(N'2018-11-05T20:56:32.457' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'f43e543ae25c4e7db9cd0a0562e71f48', 1051, NULL, N'0f1119d66acb4359b67703db016bb3c5', N'', N'6952b3a16adc4e76841f6c016cbe01ad', N'BỘ CHĂN GA GỐI SH_H17 052', N'c0697a9b39cc4e26afc4c8d69226573c', N'06b9db51775d4b7f901f7d708bbb03d7', 1, 3060000.0000, 3060000.0000, NULL, NULL, CAST(N'2018-11-23T22:12:55.230' AS DateTime), NULL, 1, CAST(N'2018-11-23T22:12:55.227' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'f6ed3a0a680b49609f83ab1896bed174', 1025, NULL, N'220afae6dfd742d5baec0ef6b98f3fdb', N'dbd85204822640859d1f18a59c2c1652', N'bcaf655eb6a34736b99add7c80b457f4', N'CHĂN ĐÔNG - RUỘT CHĂN', N'd2bf0e9e11004a9fba4160f0d4c7f110', N'de7e6dc772394d008f1dfde302ef11f5', 2, 108000.0000, 216000.0000, NULL, NULL, CAST(N'2018-11-06T02:22:58.020' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:22:58.020' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'f7dd0bbe1d4d468098f4ad0f1176190e', 1027, NULL, N'9b629e82ebca4f0597ae8bdf52dd324f', N'dbd85204822640859d1f18a59c2c1652', N'105d5e183b724f15b689b1f4d98f8757', N'RUỘT GỐI', N'90bee1d744754635af98a98c708b304c', N'2f5ed050e6af41bba012dfa45a22201b', 2, 64800.0000, 129600.0000, NULL, NULL, CAST(N'2018-11-06T02:33:31.580' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:33:31.580' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'f7e4b2feb8234332b309145e12a47e05', 1034, NULL, N'6bdd336921c7442aab049ea1fb38915d', N'dbd85204822640859d1f18a59c2c1652', N'2052fc3d0b514ff3ba6968ae39b202ad', N'BỘ CHĂN GA GỐI SH_H17 051', N'f8b8f536efbf4f608bf2fa19179e7763', N'1da57e1b547a458db31d0b795d4300c0', 1, 3312000.0000, 3312000.0000, NULL, NULL, CAST(N'2018-11-06T02:42:43.203' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:42:43.203' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'fe8882afc7db4caa9cd8f0baa6eef7df', 1044, NULL, N'e5e14465f6ec4aeaaf485952a6cd3f8f', N'dbd85204822640859d1f18a59c2c1652', N'2052fc3d0b514ff3ba6968ae39b202ad', N'BỘ CHĂN GA GỐI SH_H17 051', N'42118da80b884812a5fb071dfa5fb41e', N'3a4c8da536cf470995bd55dc568b7873', 4, 3807000.0000, 15228000.0000, NULL, NULL, CAST(N'2018-11-19T12:27:02.717' AS DateTime), NULL, 1, CAST(N'2018-11-19T12:27:02.717' AS DateTime))
INSERT [dbo].[shOrderDetail] ([OrderDetailGuid], [OrderDetailId], [OrderDetailName], [OrderGuid], [MemberGuiId], [ProductGuid], [ProductName], [SectionGuid], [SizeGuid], [Number], [Prices], [Total], [PayType], [SortOrder], [NgayDat], [UserId], [Status], [CreateDate]) VALUES (N'ff89618528cb4345a9e62cb4de9e15cc', 1040, NULL, N'7866d886a10f46acba3c9ec0e665f54b', N'dbd85204822640859d1f18a59c2c1652', N'a2597d0247764a6f861846717b5b64c7', N'BỘ CLASSIC COTTON SH_C16 041', N'5f3a45282da64e50b62aea07b0d37749', N'86a38edd2ab3419da87d7000022b8bb3', 1, 3465000.0000, 3465000.0000, NULL, NULL, CAST(N'2018-11-06T02:52:48.130' AS DateTime), NULL, 1, CAST(N'2018-11-06T02:52:48.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[shOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[shOrderHistory] ON 

INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1027, N'e71fa38de681499d9cc633c95ca05dfa', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-05T14:51:57.703' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1028, N'b49e56ec9ea74b7582939610c3f6158b', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-05T20:34:35.487' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1029, N'908169341361470b823695c00762e7a6', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-05T20:56:29.170' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1030, N'f8ce4546e5d34847a31f5873576c4298', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-05T22:18:58.037' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1031, N'220afae6dfd742d5baec0ef6b98f3fdb', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:22:57.997' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1032, N'9b629e82ebca4f0597ae8bdf52dd324f', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:33:31.533' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1033, N'20fbbbea543c4bd4813a80be2e6622ea', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:40:21.607' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1034, N'86ba5990dde54cfaba9df819bff6607f', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:41:23.203' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1035, N'6bdd336921c7442aab049ea1fb38915d', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:42:43.160' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1036, N'50c664c79b814b6ab82b1e5a0be703fc', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:43:47.977' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1037, N'49da0d7e20b8450bbc9986eb9f409282', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:46:10.713' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1038, N'ecef9c72c3e142ac894882729069c1a9', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:47:44.140' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1039, N'7866d886a10f46acba3c9ec0e665f54b', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:52:48.123' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1040, N'3e316886c6f14dce9fcf4a142eb9b528', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-06T02:55:54.287' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1041, N'b49e56ec9ea74b7582939610c3f6158b', 7, N'Giao hàng tới nhân viên ', NULL, 4, 1, CAST(N'2018-11-07T00:46:05.437' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1042, N'220afae6dfd742d5baec0ef6b98f3fdb', 7, N'nhân viên giao hàng xác nhận chuyển tới khách hàng thành công và tạo phiếu xuất. ', NULL, 4, 1, CAST(N'2018-11-07T00:57:25.373' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1043, N'e71fa38de681499d9cc633c95ca05dfa', 7, N'Chuyển hàng tới khách hàng ', NULL, 3, 1, CAST(N'2018-11-07T01:02:17.753' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1044, N'7866d886a10f46acba3c9ec0e665f54b', 9, N'Hủy đơn hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-07T01:08:25.650' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1045, N'e71fa38de681499d9cc633c95ca05dfa', 7, N'Hàng hóa nhận đã ok . ', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-07T01:10:44.600' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1046, N'311e11c5308c4ec89946fffbb7aeab10', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-15T17:03:56.477' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1047, N'950f19553b3c45729536221eb44bf068', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-15T17:34:35.620' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1048, N'e5e14465f6ec4aeaaf485952a6cd3f8f', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-19T12:27:02.627' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1049, N'e54ae6b6c6e04ecb9be375670b0c3034', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-23T20:53:01.273' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1050, N'900a59e691e646cd820d0674f3322c53', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-23T20:55:46.473' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1051, N'84fcc0196f1a41d0b3356ab8c4e8fd11', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-23T21:10:21.163' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1052, N'd1d6d54d12da47ae91ad7040e918fa81', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-23T21:15:13.247' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1053, N'c31c72b1e3b94e07a401d29436c6a244', 4, N'Đặt hàng', N'dbd85204822640859d1f18a59c2c1652', NULL, 1, CAST(N'2018-11-23T21:18:04.597' AS DateTime))
INSERT [dbo].[shOrderHistory] ([Id], [OrderGuid], [OrderStatus], [Description], [MemberGuid], [UserId], [Status], [CreateDate]) VALUES (1054, N'0f1119d66acb4359b67703db016bb3c5', 4, N'Đặt hàng', N'', NULL, 1, CAST(N'2018-11-23T22:12:52.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[shOrderHistory] OFF
SET IDENTITY_INSERT [dbo].[shProductImage] ON 

INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'038d13148ff141d3ba246d2bdc3f7747', 36, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/thumbs/1abac3ca930a4cbaae7f230d0ad5817014.1.jpg', N'14.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'053016fd0c5145d6a21223a052e193e3', 40, N'2052fc3d0b514ff3ba6968ae39b202ad', N'/images/product/10_2018/649fc23326e74a2792327cdc4c58947a420_h17051.jpg', N'420_H17051.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T10:35:38.263' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'103b84e660094b5b9c1761435c2c5b16', 50, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/390be4fa323e4ce49f7a19c7f0e59cc0420_17_c15_025_copy_1_1.jpg', N'420_17_C15_025_copy_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'18aa8a09fc3941fa84fe0420091c8f1e', 93, N'7ec461e972424afc87eef26b068b3868', N'/images/product/10_2018/14efc9cb1f0d48dab651a553faf0b8ef670_crop_hop_qua_1.jpg', N'670_crop_hop_qua_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-12T03:00:47.613' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'19002374e4bc4377b4a1cd175499c27c', 54, N'105d5e183b724f15b689b1f4d98f8757', N'/images/product/10_2018/d28351bca0e54b259f5d7b73548f2826420_ruot_chan_ruot_goi.jpg', N'420_Ruot_chan_ruot_goi.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:05:39.863' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'19f93719082248ab999097e734d79d80', 63, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/e5e12264cd694bfda408987b9bda4f28420_sh_0060_1.jpg', N'420_SH_0060_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'1bf3993a3f4b45af8cd3a69ad94bfe1a', 59, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/a121e1d17a9240eba5f489c10049d2bf420_sh_0047_1.jpg', N'420_SH_0047_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'1c36da7699544327841a88c6dbd9f340', 86, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/images/product/10_2018/38c8b25bafb540eeb60cbb95a02e45b415.1.jpg', N'15.1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-11T00:22:23.867' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'1d36120c33cb4cf48173495d084a3c48', 62, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/efe0e8f22e4249a685290a2f950dbce7420_sh_0055_1_1.jpg', N'420_SH_0055_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'1eb17ba61856494a8533b3fddfe5a69c', 99, N'd986ac16835a4d62baf61dc2ee45c645', N'/images/product/10_2018/dd09145318aa4a03aade137761e9ebd4(420x240)_fm_fmax_fw_fh_zmax_e10.jpg', N'(420x240)_fm_fmax_fw_fh_zmax_e10.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-23T14:22:38.773' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'1fb0becb433e462ca00e4fbb04e64b70', 15, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/thumbs/94e923fa51c0428899e056d9a05543b613.1.jpg', N'13.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'2379159b03114287b514b58be3ca259e', 27, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/thumbs/2a0a83e768c240728ef0c5417b5600d112.1.jpg', N'12.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'24d9a454ccc746638bc64cdde44c95a0', 88, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/images/product/10_2018/098740ad48ef4916bada918336d655cf10.1.jpg', N'10.1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-11T09:43:31.863' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'26933e846df54d5a86713e00b9e8531e', 16, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/186fd5770eb74d4987985538aabb1f5d420_42.jpg', N'420_42.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'26b98a0e63b543c2a8b51ae14f1ba2ca', 76, N'2052fc3d0b514ff3ba6968ae39b202ad', N'/images/product/10_2018/dcdaedf83bd14a70940e8125a1ce1b88banner_1.jpg', NULL, N'MauMa', N'HighLight', 1, 1, CAST(N'2018-10-10T15:05:26.957' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'28bf1cf450b14f1b89d21ca8bd97d14b', 20, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/e2e132afee26475fbd25b60c8f525bb5420_112.jpg', N'420_112.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'292dbf920af34a6a984850841d7e36ac', 96, N'b150c65366424661baf6179261e65df2', N'/images/product/10_2018/fa535d5f7617441e9e08c8bef492190710_small.jpg', N'10_Small.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-20T10:03:27.330' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'2ae1d55e0e0446079c8a6c6042d65ab1', 87, N'423eaa676f704dbaba57152c45e21c09', N'/images/product/10_2018/876ddd4b40f441a699e0223992b0ff0617.1.jpg', N'17.1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-11T09:42:20.640' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'30a015cb1f1547f4bc95a4cf05a9e055', 3, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/582bbd4d367c4817956e0e84ca07a358420_22.jpg', N'420_22.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'317ba87a15b84d2bbbc39ce8dc1a1205', 98, N'd986ac16835a4d62baf61dc2ee45c645', N'/images/product/10_2018/6255786048184782868ac3c64e6c5d01662_crop_e10.jpg', N'662_crop_e10.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-23T14:22:38.773' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'319daa6f2dac41c0aec1c82b03ea681b', 106, N'a2597d0247764a6f861846717b5b64c7', N'/images/product/11_2018/4f7c080d34f14b43b270b251ad1aafcdslider-banner4.jpg', N'slider-banner4.jpg', N'MauMa', NULL, 2, 1, CAST(N'2018-11-23T19:03:42.573' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'32c6ef41cc0c42a0adaa6d3c3829446c', 56, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/5b9c248e98b44f959a36770cd7ec76c7420_22__copy_custom.jpg', N'420_22__copy_Custom.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'33b0ea5c03f546a9a3b93395c6583e3c', 46, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/29bc37896be4454698acf3bf2a497e6e420_16_ok_1_1.jpg', N'420_16_OK_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'37002b08958e40fba5d932bcd7993205', 61, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/884ada2112f744d0be73a6b5f3ee36bf420_sh_0053_1.jpg', N'420_SH_0053_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'3a221f7e67164b9793811c448bd45bf2', 22, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/2f57e3a69b294702a0add2fe63397879420_152.jpg', N'420_152.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'3cc8029c88744b21aa3949273c3db77e', 57, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/0eef6d98c479461ab42150935a4fa3e6420_sh_0022_1.jpg', N'420_SH_0022_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'3d45bcfc5198441781dbd73fa7b539ec', 107, N'6952b3a16adc4e76841f6c016cbe01ad', N'/images/product/11_2018/7bc34bb481f54f8aa1e04144113a2e4bsp_h16_01.jpg', N'SP_H16_01.jpg', N'MauMa', NULL, 2, 1, CAST(N'2018-11-23T19:46:29.953' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'3d5498bc97214099a2932b654a6575cf', 51, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/b28918807f214bdc99bc9779a6a40545420_16_ok_1_1.jpg', N'420_16_OK_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'3eab193809764e4d9c3a738c620b1697', 1, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/bada72a165da46deb91a2d3136e85b8e420_1.1.jpg', N'420_1.1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'40adf4ec3e194c68bfdf146c2da96a09', 14, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/thumbs/47ca174f7fbe4bc7be84f6285162d7a49.1.jpg', N'9.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4493b6fad34447de867666fc9ae0cb37', 71, N'2052fc3d0b514ff3ba6968ae39b202ad', N'/images/product/10_2018/483ab0cd7b4a448dadb072d1dda7c3c8h17049.jpg', N'H17049.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-09T10:16:09.053' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'47c62ea8cb0c4b0298024fe3e8385632', 17, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/52a466b80df64b1f99e0f2c8de54c2bc420_72_(1).jpg', N'420_72 (1).jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4872a98d7c504f9285cf8359f9701fbe', 25, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/thumbs/d97c3b67cb9f48fa878d0960c6ae3a2410.1.jpg', N'10.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4b04ba53dc7442b6b43b7fd0ce14576b', 60, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/35a08913aeb246659cc421083566f4a5420_sh_0050_1.jpg', N'420_SH_0050_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4caafafe5b8940b393e19937fb77046e', 33, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/e41b2b7925e04270ad5c4eab00e7bad5420_171.jpg', N'420_171.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'4cec0ab12ece4f5e95ff19fa8584bb1c', 39, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/thumbs/5f21ace7c2274eb085d0a3ccc33c235418.1.jpg', N'18.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'530b4640dde64e49867975baced474aa', 49, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/e10ba03e8b3d4f238fe1b1f55f7e95a6420_19__copy_1_1.jpg', N'420_19__copy_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'5697116324ad45578825499b68800b57', 37, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/thumbs/2992bd90fd8a4acaa0e2831033e3a7a416.1.jpg', N'16.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'57a49c42e8d2476d82d23b7c2b3d25f3', 4, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/5e4a2a9e24b54cdf855075e68da18727420_32_1.jpg', N'420_32_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'5ec1b0dc117f4d4db3a7adca37377b71', 45, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/c716d5a3136f4fc1b1597baf82ecf60b420_17_c15_025_copy_1_1.jpg', N'420_17_C15_025_copy_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'5f4d5b1aeaf049ca8fc06f0885ecff39', 11, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/thumbs/b33c593f59414bfca5a62030e34be0c13.1.jpg', N'3.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'60e2459e109b40edb5bef38765a4fe57', 47, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/a7a834600da74993a5457289cfe29008420_15_1_copy_1_1.jpg', N'420_15_1_copy_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'6405ea2627e34e9d90bb8fa96826d4c2', 104, N'ef92dca418f149a9a8fa95543ecdc7f0', N'/images/product/11_2018/59e1dbf3d0a84095bbc01cf6ef00e4a2slider-banner2.jpg', N'slider-banner2.jpg', N'MauMa', NULL, 2, 1, CAST(N'2018-11-23T19:02:47.103' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'64a856068d27471f875a2f2006300f55', 18, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/848b2046a7564bc3b8769b172055e5bf420_82_1_(1).jpg', N'420_82_1 (1).jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'73b10eff1bfe4d18a005f479ddb72ad7', 64, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/a75d8c04a264497d82b3cc2cda667114420_sh_0064_1.jpg', N'420_SH_0064_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'7594634aefae497a9085c0edf4077bfb', 83, N'374a867f8033425e83daeba41fcc36c2', N'/images/product/10_2018/fc4df7da1ae6492985ef00bef8184a40670_crop_shutterstock_1023876448_cho_ma_d18_020_copy.jpg', N'670_crop_shutterstock_1023876448_cho_ma_D18_020_copy.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-10T15:31:18.757' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'782be56770354f0c8ecc8458552d9f5f', 78, N'2052fc3d0b514ff3ba6968ae39b202ad', N'/images/product/10_2018/48d64972568e4f408c882cdbfb45c69fbanner_2.jpg', NULL, N'MauMa', N'HighLight', 1, 1, CAST(N'2018-10-10T15:07:07.967' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'832c698cfb3e47248357968f028b41c0', 12, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/thumbs/b4b9b3c5da94412aaaeb10698d6ad8726.1.jpg', N'6.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'86a32ed1ff274a65ad18783e4e420849', 44, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/67f0274f01c245b7a6cd745d5c51cfed420_18_c15_e27_copy_1_1.jpg', N'420_18_C15_E27_copy_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'873064a6644b42e99dd75c2534c9c34a', 6, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/6a99142ac69c4f3b8e84dc11b366bc77420_62.jpg', N'420_62.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'91643d0d394a45248a9630bb0906da3f', 80, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/images/product/10_2018/350d88d60f274e6aae60917a80ac895310.1.jpg', N'10.1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-10T15:25:01.313' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'91c600bf68314a63beee0a325c9f4f05', 2, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/f8f7f708f44f4bcbafddce6386dde8b6420_12_1.jpg', N'420_12_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'92bcd03110dd42b88b5667a82537193a', 97, N'd986ac16835a4d62baf61dc2ee45c645', N'/images/product/10_2018/1b690df63631453b907e9d876162d0f7e10.jpg', N'e10.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-23T14:22:38.773' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'938c705cb562437ca4e0c2aa8434d78d', 32, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/83290e76cf9d40b0a81121e7ae37f118420_162.jpg', N'420_162.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'962ef20059874c0595e39de45d8781de', 53, N'105d5e183b724f15b689b1f4d98f8757', N'/images/product/10_2018/501b0677f0874372bb249731819f385f420_ruot_chan_-_ruot_goi.jpg', N'420_Ruot_chan_-_ruot_goi.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:05:39.863' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'97333e810261483e824a1940f78d7222', 79, N'423eaa676f704dbaba57152c45e21c09', N'/images/product/10_2018/13c4c94c842c4ce5abbcc6cfca3ba0ab1.1.jpg', N'1.1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-10T15:23:59.353' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a19f47ca96794e24ba3a394ca34bb74b', 52, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/8f0d41baef4846cdbdd96d0eb74ee77a420_15_1_copy_1_1.jpg', N'420_15_1_copy_1_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a2326355afcb49978a0d98289e748ae4', 23, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/thumbs/c24c46799f6c49068cd99c7c984ced347.1.jpg', N'7.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a2dc3ef3e3164a019acbea6664190763', 108, N'ef92dca418f149a9a8fa95543ecdc7f0', N'/images/product/11_2018/ec59f1cd897e4cc99490f156328af8cfslider-banner5.jpg', N'slider-banner5.jpg', N'MauMa', NULL, 2, 1, CAST(N'2018-11-23T19:48:13.290' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a2ff2f804cd14bd28dcb602e31375b7f', 91, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/b7a06db3781c43d49000016439386d92670_crop_ruot_chan_-_ruot_goi.jpg', N'670_crop_Ruot_chan_-_ruot_goi.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-12T02:08:43.180' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a319b713fda34dbf877934d0d12488e6', 8, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/781c509f8457488e86b1c1c1f2aa6b42420_img_2286_copy_1.jpg', N'420_IMG_2286_copy_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a9542cec64ba41b391b90f28256deb71', 94, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/40fba040aa264d539f4cb5df348c1ff1670_crop_22__copy_custom.jpg', N'670_crop_22__copy_Custom.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-12T03:01:25.260' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'a97cb5089ace4c01bbeeaf9c7b4081ce', 67, N'8d4e41d756f446a581e27333f117f01c', N'/images/product/10_2018/a803ef11afe64bafb8910b8d635a9406420_shutterstock_705618805_copy.jpg', N'420_shutterstock_705618805_copy.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-08T14:06:21.303' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'aaef34b845e3494eaa01c834beeeac38', 85, N'8d4e41d756f446a581e27333f117f01c', N'/images/product/10_2018/7cb934f1fd884ff2896dd7cb3f9afa3c670_crop_shutterstock_262441817_copy.jpg', N'670_crop_shutterstock_262441817_copy.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-10T15:38:45.683' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'b3e9bcc5cc5a498b8e5b5f0864f2225c', 21, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/2ae47fb59abe4444995d69afc7ae0c28420_122_1_(1).jpg', N'420_122_1 (1).jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'ba3978589f794593acef71f74057ddfa', 19, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/65009076ec3a4879ab4b26d98811110c420_102_1_(1).jpg', N'420_102_1 (1).jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'bb511fd6b84e411bb95cddc3f4a6b4ac', 66, N'374a867f8033425e83daeba41fcc36c2', N'/images/product/10_2018/c81f4d0af2594964beb4507f111d35ad420_shutterstock_1023876448_cho_ma_d18_020_copy.jpg', N'420_shutterstock_1023876448_cho_ma_D18_020_copy.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-08T11:03:22.617' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'bba5299b57c84fe4aecdf3ced93ffb04', 105, N'ef92dca418f149a9a8fa95543ecdc7f0', N'/images/product/11_2018/64955c7ad7914dc09b37a060b7ba6dea420_c16_034.jpg', N'420_C16_034.jpg', N'MauMa', NULL, 2, 1, CAST(N'2018-11-23T19:02:47.103' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'bbeb6a3fd0f3477c9c901fc646ce14ed', 34, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/69e5722dca024dcc8241a354b5025606420_172.jpg', N'420_172.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'bc8a863d24ac4b1681b3443c3cf2f513', 84, N'374a867f8033425e83daeba41fcc36c2', N'/images/product/10_2018/e1f8edba034d41f89b0f54240dc194c6670_crop_shutterstock_705618805_copy.jpg', N'670_crop_shutterstock_705618805_copy.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-10T15:32:21.520' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'be3053dfde404bb58922f54df17b4170', 26, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/thumbs/06fd2049d0954ed2a71a41a8a007732511.1.jpg', N'11.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'c1cab0f2867640febf4bf8e35b435de1', 48, N'bcaf655eb6a34736b99add7c80b457f4', N'/images/product/10_2018/caa2df4879b7478bbe4350e02f7d8a25420_21_201.png', N'420_21_201.png', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T21:26:24.500' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'c2b25cf09ea649d8a52fbf73fb98f03b', 13, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/thumbs/38bc66328cf64e5e9187c518f7f318a07.1.jpg', N'7.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'cf3eca2feb704eaea03f2d9084538c23', 74, N'2052fc3d0b514ff3ba6968ae39b202ad', N'/images/product/10_2018/7a237e8876514e9999492be8b23d6731banner_3.jpg', NULL, N'MauMa', N'HighLight', 1, 1, CAST(N'2018-10-10T00:10:16.823' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'd3f011c552704fffb4fbfdb6f780d79a', 69, N'649b88137337436fb57b1972667b1c70', N'/images/product/10_2018/37e2cfff12714e6286202cedb0a5b64e420_te17_05_copy.jpg', N'420_TE17_05_Copy.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-08T17:23:22.937' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'd9a7b2aa646b4987b534ae586bba23f5', 55, N'7ec461e972424afc87eef26b068b3868', N'/images/product/10_2018/5eee44dc4ac44626a112e640ab067507420_hop_qua_1.jpg', N'420_hop_qua_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:27:12.990' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'db12c1684ac042a59b88ef10ff47be30', 102, N'd986ac16835a4d62baf61dc2ee45c645', N'/images/product/10_2018/thumbs/15dd9ac6f9014b60a56e54a06d7ab65dshutterstock_1023876448_cho_ma_d18_020_copy.jpg', N'shutterstock_1023876448_cho_ma_D18_020_copy.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-23T14:25:05.477' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'e2b46de7854f49c88626f8c8299f876d', 9, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/fb47cb746bdb4f32a10163230f7e4181420_img_2287_copy_1.jpg', N'420_IMG_2287_copy_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'e90bfa317a1142fcac1b1a7a384e3a2b', 92, N'105d5e183b724f15b689b1f4d98f8757', N'/images/product/10_2018/7385568d2e8546c0bf1d4f383209ca80670_crop_c16_c38.jpg', N'670_crop_C16_C38.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-12T02:09:57.877' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'e9a713f0b3da48f28553bbe4b851e613', 30, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/238e2ee9f12c497d88f9bbe10c23ae99420_182.jpg', N'420_182.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'ecf0042ec6bc4d60b5ccd48f62e94be1', 24, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/thumbs/3b875ffc99da4c678732899ab7c60e7b8.1.jpg', N'8.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'ef7f23ea68b34eed9a1618ac9eed5cb5', 58, N'391656d710dc43e5ab962e915e1674c3', N'/images/product/10_2018/8b5b105e85a24501bb0a3e52edc85aab420_sh_0031_copy.jpg', N'420_SH_0031_copy.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-07T22:30:07.550' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'f506b0ad4431444bb9bb88e085ed0e67', 95, N'b150c65366424661baf6179261e65df2', N'/images/product/10_2018/05c54befc2674376a362cfb3ff3027aa06_-_ok_small.jpg', N'06_-_OK_Small.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-20T10:03:27.330' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'f622bc9607bb4f5889ff1ab386735246', 35, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/df3be8417db94cf98de23be944163f9e420_142.jpg', N'420_142.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'f737d9f289a54cc5b6825e88fe221bef', 29, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/3e194cb8bb2d41ebbd6fa5fd06027356420_18.1.jpg', N'420_18.1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'f80c51ac98a44cd7bfa432817bdff9be', 28, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'/Images/product/10_2018/thumbs/13d586a5b66c47bd82ef1b4e759f530413.1.jpg', N'13.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:59:49.790' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'f9f802654ce84e968c679c314bfc443c', 31, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/950877756fe746f3919118c679d889db420_161.jpg', N'420_161.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'fa0ad0e079394bec8c83d5d238487e1c', 89, N'649b88137337436fb57b1972667b1c70', N'/images/product/10_2018/30650b5de3f34002a635df0ac3a59b86420_doremon202_2.jpg', N'420_doremon202_2.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-11T23:57:23.177' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'fa203254299546e887fdc12a1224df80', 38, N'4c52c9d3ae164a2fa85aae61ef18929e', N'/Images/product/10_2018/thumbs/228ad29830a84ba188bb6b5255ebd94317.1.jpg', N'17.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T15:39:07.107' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'fcdc91f8c9cd45e0a30763a6012a673b', 5, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/48152a0eaba842daa51ca4797ef0f304420_52_1.jpg', N'420_52_1.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'fd3a351b6e654deeb533574ab027102d', 10, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/thumbs/72159e1a63f847a9a1d53efc969a8bf72.1.jpg', N'2.1.jpg', N'ChatLieu', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
INSERT [dbo].[shProductImage] ([ProductImageGuid], [ProductImageId], [ProductGuid], [FileName], [FileNameGoc], [ProductImageCategory], [Image], [UserId], [Status], [CreateDate]) VALUES (N'fd523a57d27e4a08b4fc660964e6cec1', 7, N'423eaa676f704dbaba57152c45e21c09', N'/Images/product/10_2018/fd4f0f44ac534153b4abe3e723b31c3c420_92.jpg', N'420_92.jpg', N'MauMa', NULL, 1, 1, CAST(N'2018-10-06T14:03:28.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[shProductImage] OFF
SET IDENTITY_INSERT [dbo].[shProducts] ON 

INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'105d5e183b724f15b689b1f4d98f8757', 8, N'8c1b70988c774426883c1bcf1fcaba2c', NULL, N'RUỘT GỐI', N'/chan-dong-ruot-goi/ruot-goi', N'Ruột gối Sông Hồng được sản xuất từ nguyên liệu bông tinh khiết nhập khẩu, chất lượng cao, giá thành hợp lý được người tiêu dùng ưa chuộng', N'/images/product/10_2018/7385568d2e8546c0bf1d4f383209ca80670_crop_c16_c38.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-12T02:09:57.853' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'2052fc3d0b514ff3ba6968ae39b202ad', 4, N'ebf90a4171884c778b7126fe31372d23', NULL, N'BỘ CHĂN GA GỐI SH_H17 051', N'/bo-chan-ga-goi/bo-chan-ga-goi-sh_h17-051', N'Hiện đại và truyền thống

Với màu chủ đạo xanh cốm, tươi mát kết hợp màu vàng nhẹ, màu sắc của bộ drap mang vẻ hiện đại nhưng thêu cành sen, lá sen xanh truyền thống lại vô cùng ăn ý. Đường chần như gọn sóng nước mặt hồ, nổi lên các cánh sen xanh và hoa sen cách điệu, thật tuyệt. Có thể nói bộ drap sẽ làm hài lòng ngay cả những người khó tính nhất', N'/images/product/10_2018/48d64972568e4f408c882cdbfb45c69fbanner_2.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-09T11:05:13.910' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'374a867f8033425e83daeba41fcc36c2', 12, N'ef49b8df991c4e6bbeadc199210e058b', NULL, N'BỘ CHĂN GA GỐI HELLO KITTY SH_D18 020', N'/bo-chan-ga-goi/bo-chan-ga-goi-hello-kitty-sh_d18-020', N'- Các sản phẩm trẻ em của May Sông Hồng được sản xuất trên thiết bị hiện đại và giám sát chặt chẽ đảm bảo chất lượng sản phẩm.
- Các sản phẩm trẻ em của May Sông Hồng đều được phun Nano kháng khuẩn, đảm bảo an toàn tuyệt đối cho bà Mẹ và Trẻ em.', N'/images/product/10_2018/e1f8edba034d41f89b0f54240dc194c6670_crop_shutterstock_705618805_copy.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-10T15:32:21.410' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'391656d710dc43e5ab962e915e1674c3', 10, N'fcb96a14bf044c78b7a609b2b3cb1505', NULL, N'KHÁCH SẠN', N'/du-an/khach-san', N'Hàng khách sạn của Sông Hồng đa dạng về mẫu mã và được các khách sạn lớn tin dùng vì sử dụng các loại vải có độ bền cao, đường may chắc chắn, nguyên liệu có nguồn gốc, xuất xứ rõ ràng.', N'/images/product/10_2018/40fba040aa264d539f4cb5df348c1ff1670_crop_22__copy_custom.jpg', N'Hàng khách sạn của Sông Hồng đa dạng về mẫu mã và được các khách sạn lớn tin dùng vì sử dụng các loại vải có độ bền cao, đường may chắc chắn, nguyên liệu có nguồn gốc, xuất xứ rõ ràng.

Gồm 2 loại chính là Dobby và CVC

         1. Vải CVC:

“CVC” là chữ viết tắt của cụm từ tiếng Anh “Chief Value of Cotton”, tạm dịch là “Xơ bông giá trị cao
Vải CVC là để chỉ loại sợi, vải hỗn hợp của xơ polyester với xơ bông, trong đó tỷ lệ thành phần xơ bông trong sợi,vải chiếm từ 50% trở lên.
Sự kết hợp 2 loại nguyên liệu thiên nhiên và nhân tạo cho ra các sản phẩm có tính năng sử dụng tốt và ưu việt về kinh tế.Vải CVC có độ bền cao, chống nhăn tốt, mềm mại thoải mái cho người dùng, hơn nữa còn có khả năng chống cháy tốt. Vì vậy hiện nay CVC đang rất được các khách sạn lớn ưa chuộng.
​         2. Vải Dobby​:

Dobby là vải dệt được sản xuất trên các máy dệt dobby, đặc trưng bởi mô hình hình học nhỏ và kết cấu phụ trong vải. Các sợi dọc và sợi ngang có thể là cùng một màu hoặc khác nhau. Loại vải dệt này rất hợp với kiểu dệt Satin, vì sẽ làm cho thiết kế nổi bật một cách hiệu quả hơn .
', N'<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-size: 18px;">Hàng khách sạn của Sông Hồng đa dạng về mẫu mã và được các khách sạn lớn tin dùng vì sử dụng các loại vải có độ bền cao, đường may chắc chắn, nguyên liệu có nguồn gốc, xuất xứ rõ ràng.</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-size: 18px;">Gồm 2 loại chính là Dobby và CVC</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-size: 18px;"><span style="box-sizing: border-box; font-weight: 700;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.&nbsp;Vải CVC:</span></span></p>
<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; list-style: none; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; line-height: 20.8px; margin-left: 40px;">
	<li style="box-sizing: border-box; line-height: 20px; list-style: square inside; font-size: 12px;">
		<span style="box-sizing: border-box; font-size: 18px;">&ldquo;CVC&rdquo; là chữ viết tắt của cụm từ tiếng Anh &ldquo;Chief Value of Cotton&rdquo;, tạm dịch là &ldquo;Xơ bông giá trị cao</span></li>
	<li style="box-sizing: border-box; line-height: 20px; list-style: square inside; font-size: 12px;">
		<span style="box-sizing: border-box; font-size: 18px;">Vải CVC là để chỉ loại sợi, vải hỗn hợp của xơ polyester với xơ bông, trong đó tỷ lệ thành phần xơ bông trong sợi,vải chiếm từ 50% trở lên.</span></li>
	<li style="box-sizing: border-box; line-height: 20px; list-style: square inside; font-size: 12px;">
		<span style="box-sizing: border-box; font-size: 18px;">Sự kết hợp 2 loại nguyên liệu thiên nhiên và nhân tạo cho ra các sản phẩm có tính năng sử dụng tốt và ưu việt về kinh tế.Vải CVC có độ bền cao, chống nhăn tốt, mềm mại thoải mái cho người dùng, hơn nữa còn có khả năng chống cháy tốt. Vì vậy hiện nay CVC đang rất được các khách sạn lớn ưa chuộng.</span></li>
</ul>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-size: 18px;">​ &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="box-sizing: border-box; font-weight: 700; line-height: 20.8px;">2.&nbsp;</span><span style="box-sizing: border-box; font-weight: 700;">Vải Dobby​<span style="box-sizing: border-box; line-height: 20.8px;">:</span></span></span></p>
<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; list-style: none; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<li style="box-sizing: border-box; line-height: 20px; list-style: square inside; font-size: 12px; margin-left: 40px;">
		<span style="box-sizing: border-box; font-size: 18px;">Dobby là vải dệt được sản xuất trên các máy dệt dobby, đặc trưng bởi mô hình hình học nhỏ và kết cấu phụ trong vải. Các sợi dọc và sợi ngang có thể là cùng một màu hoặc khác nhau. Loại vải dệt này rất hợp với kiểu dệt Satin, vì sẽ làm cho thiết kế nổi bật một cách hiệu quả hơn .</span></li>
</ul>
', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-12T03:03:13.413' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'423eaa676f704dbaba57152c45e21c09', 1, N'9998823448054c3bb061fe69cd71bb46', NULL, N'ĐỆM BÔNG TINH KHIẾT VỎ VẢI GẤM  ', N'/dem/dem-bong-tinh-khiet-vo-vai-gam', N'Đệm bông tinh khiết Sông Hồng vỏ vải gấm được làm từ bông có chất lượng cao, được khử trùng tuyệt đối nên đảm bảo an toàn cho mọi loại da. 
Lớp vải bọc đệm được làm từ vải gấm cao cấp, hoa văn tinh xảo tạo nên vẻ sang trọng, cuốn hút và tiện dụng với những chiếc khóa kéo giúp tháo rời lớp vỏ này một cách dễ dàng khi làm vệ sinh hoặc giặt rửa đệm', N'/images/product/10_2018/876ddd4b40f441a699e0223992b0ff0617.1.jpg', N'', N'<p>
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Các kỹ sư chế tạo ở các nước có nền công nghiệp hiện đại đều luôn không ngừng tập trung nghiên cứu các thiết bị có tính năng vượt trội để tạo ra các chủng loại sản phẩm ưu việt phục vụ loài người và bảo vệ môi trường. Đó là nguyên tắc và là tôn chỉ đạo đức trong mọi hoạt động nghiên cứu, sản xuất, kinh doanh của họ. Các sản phẩm&nbsp;</span><span style="color:#ff0000;"><strong>Đệm bông tinh khiết Sông Hồng</strong></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;và chăn ga gối của Công ty Cổ phần may Sông Hồng - Nam Định ra đời từ các&nbsp;</span><a href="http://www.webtretho.com/forum/chu-de/vong-co/" style="box-sizing: border-box; color: rgb(102, 102, 102); text-decoration-line: none; font-size: 13px; line-height: 22px; transition: color 0.5s ease 0s; font-family: Arial; text-align: justify;" target="_blank">dây chuyền</a><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;thiết bị đó, khác biệt hoàn toàn với các dây chuyền hiện có ở Việt Nam đã đáp ứng được tất cả các mong muốn mang tính nguyên tắc ấy.</span></p>
<p>
	<br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;" />
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Các chủng loại sản phẩm&nbsp;</span><span style="color:#ff0000;"><strong>Đệm bông tinh khiết Sông Hồng</strong></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;tuyệt đối không sử dụng bất cứ loại hoá chất nào trong suốt quá trình sản xuất chế tạo sản phẩm và chỉ sử dụng các loại bông có chất lượng cao, được khử trùng tuyệt đối và không dùng bông tái sinh.</span></p>
<p>
	<br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;" />
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Hiện nay các sản phẩm</span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;</span><span style="color:#ff0000;"><strong>Đệm bông tinh khiết Sông Hồng</strong></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;không hoá chất thuộc thế hệ thứ hai của Sông Hồng chủ yếu phục vụ tiêu dùng trong nước và xuất khẩu. Do tính năng vượt trội của sản phẩm có tính đàn hồi cao như các loại đệm lò xo; khoảng giữa đệm được kết cấu đặc biệt, thực sự như một vật dụng y học để bảo vệ hệ xương sống, nơi tập trung các dây thần kinh quan trọng nhất của con người. Bề mặt sản phẩm có độ dai, phẳng tiêu chuẩn, được đóng dấu nổi logo Sông Hồng cả hai mặt để chống hàng giả và được đăng ký bảo hộ nhãn hiệu hàng hoá.</span></p>
<p>
	<br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;" />
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Do tính ưu việt của thiết bị và được vận hành bởi đội ngũ kỹ sư cơ khí, kỹ sư điện và điện tự động cùng đội ngũ kĩ thuật viên nhiều kinh nghiệm, các sản phẩm Đệm bông và Bông tấm thế hệ thứ hai của Sông Hồng mặc dù có giá trị sử dụng rất cao song giá thành vẫn không hề xa cách với cuộc sống của đa số những người dân Việt Nam. Sản phẩm được&nbsp;</span><span style="color:#ff0000;"><span style="box-sizing: border-box; font-weight: 700; font-family: Arial; font-size: 13px; text-align: justify;">bảo hành 05 năm</span></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;và chỉ được bán ở các Đại lý chính thức của Công ty trên toàn quốc</span></p>
', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-11T14:59:06.827' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'4c52c9d3ae164a2fa85aae61ef18929e', 3, N'9998823448054c3bb061fe69cd71bb46', NULL, N'ĐỆM BÔNG TINH KHIẾT THẾ HỆ THỨ HAI', N'/dem/dem-bong-tinh-khiet-the-he-thu-hai', N'Sau ba mùa xuất hiện, với những tính năng và sự ưu việt vượt trội, bộ sản phẩm ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG đã nhanh chóng chứng minh được sức sống mãnh liệt trên thị trường Việt nam. Không dừng lại, Sông Hồng tiếp tục ra đời bộ sản phẩm ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG thế hệ 2 có độ dầy lý tưởng từ 20 cm đến 25 cm với tiêu chuẩn kĩ thuật và công nghệ Nhật bản. Trong bộ sản phẩm này, các Kĩ sư và các Kĩ thuật viên đã giải quyết được bài toán khó nhất là tích hợp được đồng thời ba yếu tố: sản phẩm có độ cứng vừa phải ở phần cuối, có độ nẩy và đàn hồi vừa phải ở phần giữa và có độ mềm mại, êm ái tuyệt đối tốt cho giấc ngủ ở lớp trên cùng.

', N'/images/product/10_2018/38c8b25bafb540eeb60cbb95a02e45b415.1.jpg', N'', N'<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<em style="box-sizing: border-box;">Chào</em>&nbsp;<em style="box-sizing: border-box;">đón&nbsp;sản phẩm mới:</em>&nbsp;&nbsp;&nbsp;</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: center;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: center;">
	&nbsp;<span style="box-sizing: border-box; font-weight: 700;">ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG -&nbsp;<em style="box-sizing: border-box; line-height: 1.6em;">Thế hệ thứ hai.</em></span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Sau ba mùa xuất hiện, với&nbsp;những tính năng và&nbsp;sự ưu việt vượt trội, bộ sản phẩm&nbsp;ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG&nbsp;đã nhanh chóng chứng minh&nbsp;được sức sống&nbsp;mãnh liệt&nbsp;trên thị trường Việt nam.&nbsp;Không dừng lại&nbsp;ở&nbsp;thành công&nbsp;vang dội ấy, Sông hồng lại&nbsp;tiếp tục&nbsp;cho ra đời bộ sản phẩm ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG&nbsp;thế hệ 2 có độ dầy lý tưởng từ 20 cm đến 25 cm với tiêu chuẩn kĩ thuật và công nghệ Nhật bản. Trong bộ sản phẩm này, các Kĩ sư và các Kĩ thuật viên đã giải quyết được bài toán khó nhất&nbsp;là tích hợp được đồng thời ba&nbsp;yếu tố: sản phẩm có&nbsp;độ cứng vừa phải ở&nbsp;lớp&nbsp;cuối, có&nbsp;độ nẩy và&nbsp;đàn hồi vừa phải ở phần giữa và&nbsp;có độ mềm mại, êm ái tuyệt đối tốt cho giấc ngủ ở lớp trên cùng.</p>
<p open="" style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Bộ sản phẩm này hoàn toàn đáp ứng được các tiêu chuẩn của các Khách sạn và Resort cao cấp cũng như trong các gia đình có điều kiện kinh tế tương đối tốt ở Việt nam. Với sự tinh tế của mình, các chị và những người tiêu dùng am tường, thêm lần nữa có cơ hội lựa chọn bộ ĐỆM BÔNG TINH KHIẾT SÔNG HỒNG thế hệ thứ hai này để&nbsp;làm thêm sự phong phú và yên bình trong cuộc sống của mình.</p>
<p open="" style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-weight: 700;">Vỏ chần bông có 3 lớp:</span></p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;1.1 Lớp vải gấm : sử dụng vải chất lượng cao, thấm mồ hôi, đàn hồi tốt, an toàn với mọi làn da</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;1.2 Lớp bông kháng khuẩn : 100% bông tinh khiết, không hóa chất</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;1.3 Lớp vải lót mềm mại có in Logo công ty tránh hàng giả</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;1.4 Có thể tháo lắp dễ dàng và giặt bằng máy giặt</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	<span style="box-sizing: border-box; font-weight: 700;">Lõi đệm&nbsp;</span>: cam kết 100% sử dụng bông tinh khiết, không dùng hóa chất độc hại, an toàn với môi trường</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;2.1 Hai lớp bề mặt bông kháng khuẩn có dập nổi Logo Sông Hồng để chống hàng giả</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;2.2 Lớp lõi dầy đến 25cm được kết cấu đặc biệt với công nghệ tiên tiến đàn hồi thoáng mát, hỗ trợ tối đa sống lưng của người sử dụng. Chất liệu bông 100% Polyeste kháng khuẩn</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	&nbsp;2.3 Có thể giặt với nước</p>
<div>
	&nbsp;</div>
', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-11T15:00:25.347' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'649b88137337436fb57b1972667b1c70', 15, N'49ebe5695f784bd288e6e96fbf22b7e7', NULL, N'BỘ CHĂN GA GỐI TRẺ EM TE 05', N'/bo-chan-ga-goi/bo-chan-ga-goi-tre-em-te-05', N'- Các sản phẩm trẻ em của May Sông Hồng được sản xuất trên thiết bị hiện đại và giám sát chặt chẽ đảm bảo chất lượng sản phẩm.
- Các sản phẩm trẻ em của May Sông Hồng đều được phun Nano kháng khuẩn, đảm bảo an toàn tuyệt đối cho bà Mẹ và Trẻ em.', N'/images/product/10_2018/30650b5de3f34002a635df0ac3a59b86420_doremon202_2.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-11T23:57:22.807' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'6952b3a16adc4e76841f6c016cbe01ad', 5, N'ebf90a4171884c778b7126fe31372d23', NULL, N'BỘ CHĂN GA GỐI SH_H17 052', N'/bo-chan-ga-goi/bo-chan-ga-goi-sh_h17-052', N'Độc và lạ

Một mẫu thiết kế mới, độc và lạ của bộ sựu tập năm nay. Màu xám ánh bạc sang trọng, phối tông màu xám lạnh, thêu bông xanh nên hoàn toàn lạ mà vẫn hợp lý. Tông màu tối, lạnh nhưng vẫn có độ tươi sáng rất lạ và hoàn toàn phù hợp với thời tiết các mùa. Với mẫu thiết kế này bộ drap là một mẫu không thể thiếu trong những căn nhà đẹp, hiện đại mới vừa ý những chủ nhân cầu kỳ, ưa thích sự sáng tạo, mới lạ', N'/images/product/11_2018/7bc34bb481f54f8aa1e04144113a2e4bsp_h16_01.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-23T19:46:21.423' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'7ec461e972424afc87eef26b068b3868', 9, N'6d5cdc58b59b46e38aae499c168e7547', NULL, N'QUÀ TẶNG', N'/du-an/qua-tang', N'Mỗi sản phẩm của Sông Hồng đều có thể thay bạn nói lên lời tri ân, chúc mừng hay thể hiện sự thương yêu dành cho người thân, bạn bè, đối tác….', N'/images/product/10_2018/14efc9cb1f0d48dab651a553faf0b8ef670_crop_hop_qua_1.jpg', N'Mỗi sản phẩm của Sông Hồng đều có thể thay bạn nói lên lời tri ân, chúc mừng hay thể hiện sự thương yêu dành cho người thân, bạn bè, đối tác….

Để đặt hàng quà tặng, vui lòng liên hệ bộ phận kinh doanh dự án:

+ Khu vực phía Bắc: Mr Bình - P. Kinh Doanh - 0915 302 402

+ Khu vực phía Nam: 0903 359 849 / 0979 075 87

', N'<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	Mỗi sản phẩm của Sông Hồng đều có thể thay bạn nói lên lời tri ân, chúc mừng hay thể hiện sự thương yêu dành cho người thân, bạn bè, đối tác&hellip;.</p>
<p style="box-sizing: border-box; margin: 0px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	Để đặt hàng quà tặng, vui lòng liên hệ bộ phận kinh doanh dự án:</p>
<p style="box-sizing: border-box; margin: 0px 0px 0px 40px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	+&nbsp;<span style="box-sizing: border-box; font-weight: 700;">Khu vực phía Bắc</span>:&nbsp;<span style="box-sizing: border-box; font-size: 18px;"><span style="box-sizing: border-box; color: rgb(255, 0, 153);">Nguyễn văn Nghị - 0000000000</span></span></p>
<p style="box-sizing: border-box; margin: 0px 0px 0px 40px; padding: 5px 0px; line-height: 20px; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px;">
	+&nbsp;<span style="box-sizing: border-box; font-weight: 700;">Khu vực phía Nam</span>:<span style="box-sizing: border-box; font-size: 18px;">&nbsp;<span style="box-sizing: border-box; color: rgb(255, 0, 153);">0000000000&nbsp;/&nbsp;</span></span><span style="color: rgb(255, 0, 153); font-size: 18px;">0000000000</span></p>
<div>
	&nbsp;</div>
', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-12T03:04:27.157' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'8d4e41d756f446a581e27333f117f01c', 13, N'320162dfe2f54f929872298d6125a8a4', NULL, N'BỘ SẢN PHẨM DISNEY SH_DN18 04', N'/bo-chan-ga-goi/bo-san-pham-disney-sh_dn18-04', N'- Các sản phẩm trẻ em của May Sông Hồng được sản xuất trên thiết bị hiện đại và giám sát chặt chẽ đảm bảo chất lượng sản phẩm.
- Các sản phẩm trẻ em của May Sông Hồng đều được phun Nano kháng khuẩn, đảm bảo an toàn tuyệt đối cho bà Mẹ và Trẻ em.', N'/images/product/10_2018/7cb934f1fd884ff2896dd7cb3f9afa3c670_crop_shutterstock_262441817_copy.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-10T15:38:45.587' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'a2597d0247764a6f861846717b5b64c7', 11, N'979be2e056c34ca0ab375caa780ae5d2', NULL, N'BỘ CLASSIC COTTON SH_C16 041', N'/bo-chan-ga-goi/bo-classic-cotton-sh_c16-041', N'Màu đỏ hồng tươi mới kết hợp đường kẻ sọc, họa tiết lá cây, phá cách trong thiết kế khiến phòng ngủ của bạn gây chú ý.  Vải cotton 100% mềm, mát sẽ mang lại cho bạn cảm giác êm dịu, nhẹ nhàng chìm vào giấc ngủ sâu mỗi khi mỏi mệt.

', N'/images/product/11_2018/4f7c080d34f14b43b270b251ad1aafcdslider-banner4.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-23T19:03:42.553' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'b150c65366424661baf6179261e65df2', 16, N'ebf90a4171884c778b7126fe31372d23', NULL, N'BỘ CHĂN GA GỐI SH_H18 056', N'/bo-chan-ga-goi/bo-chan-ga-goi-sh_h18-056', N'- Các sản phẩm trẻ em của May Sông Hồng được sản xuất trên thiết bị hiện đại và giám sát chặt chẽ đảm bảo chất lượng sản phẩm. - Các sản phẩm trẻ em của May Sông Hồng đều được phun Nano kháng khuẩn, đảm bảo an toàn tuyệt đối cho bà Mẹ và Trẻ em.', N'/images/product/10_2018/05c54befc2674376a362cfb3ff3027aa06_-_ok_small.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-20T10:03:27.257' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'bcaf655eb6a34736b99add7c80b457f4', 7, N'def2a47647a347a88e067a67b4735b77', NULL, N'CHĂN ĐÔNG - RUỘT CHĂN', N'/chan-dong-ruot-goi/chan-dong-ruot-chan', N'Chăn đông Sông Hồng vốn nổi tiếng nhờ sự mềm mại, ấm áp, nhẹ nhàng và bền. Ngoài ra, với mẫu mã phong phú, chăn đông Sông Hồng đã trở thành một sản phẩm không thể thiếu song hành cùng các gia đình Việt trong mỗi mùa đông. Sản phẩm chăn đông gồm

+ Chăn đông vỏ TC: (40% cotton – 60% polyester) độ bền cao, màu sắc đa dạng, chống nhăn với giá thành hợp lý

+ Chăn đông vỏ Cotton: thoáng mát, mềm mại, màu sắc phong phú, hoa văn đẹp

', N'/images/product/10_2018/b7a06db3781c43d49000016439386d92670_crop_ruot_chan_-_ruot_goi.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-12T02:08:43.107' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'c706c1fb5bee4a788c77b7ba8f8ed3f2', 2, N'9998823448054c3bb061fe69cd71bb46', NULL, N'ĐỆM BÔNG TINH KHIẾT VỎ VẢI TC', N'/dem/dem-bong-tinh-khiet-vo-vai-tc', N'Đệm bông tinh khiết Sông Hồng vỏ vải TC được làm từ bông có chất lượng cao, được khử trùng tuyệt đối nên đảm bảo an toàn cho mọi loại da. 
Lớp vải bọc đệm được làm từ TC cao cấp giúp thấm hút mồ hôi tốt và tiện dụng với những chiếc khóa kéo giúp tháo rời lớp vỏ này một cách dễ dàng khi làm vệ sinh hoặc giặt rửa đệm.
', N'/images/product/10_2018/098740ad48ef4916bada918336d655cf10.1.jpg', N'', N'<p>
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Các kỹ sư chế tạo ở các nước có nền công nghiệp hiện đại đều luôn không ngừng tập trung nghiên cứu các thiết bị có tính năng vượt trội để tạo ra các chủng loại sản phẩm ưu việt phục vụ loài người và bảo vệ môi trường. Đó là nguyên tắc và là tôn chỉ đạo đức trong mọi hoạt động nghiên cứu, sản xuất, kinh doanh của họ. Các sản phẩm&nbsp;</span><span style="color: rgb(255, 0, 0);"><strong>Đệm bông tinh khiết Sông Hồng</strong></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;và chăn ga gối của Công ty Cổ phần may Sông Hồng - Nam Định ra đời từ các&nbsp;</span><a href="http://www.webtretho.com/forum/chu-de/vong-co/" style="box-sizing: border-box; color: rgb(102, 102, 102); text-decoration-line: none; font-size: 13px; line-height: 22px; transition: color 0.5s ease 0s; font-family: Arial; text-align: justify;" target="_blank">dây chuyền</a><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;thiết bị đó, khác biệt hoàn toàn với các dây chuyền hiện có ở Việt Nam đã đáp ứng được tất cả các mong muốn mang tính nguyên tắc ấy.</span></p>
<p>
	<br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;" />
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Các chủng loại sản phẩm&nbsp;</span><span style="color: rgb(255, 0, 0);"><strong>Đệm bông tinh khiết Sông Hồng</strong></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;tuyệt đối không sử dụng bất cứ loại hoá chất nào trong suốt quá trình sản xuất chế tạo sản phẩm và chỉ sử dụng các loại bông có chất lượng cao, được khử trùng tuyệt đối và không dùng bông tái sinh.</span></p>
<p>
	<br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;" />
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Hiện nay các sản phẩm</span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;</span><span style="color: rgb(255, 0, 0);"><strong>Đệm bông tinh khiết Sông Hồng</strong></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;không hoá chất thuộc thế hệ thứ hai của Sông Hồng chủ yếu phục vụ tiêu dùng trong nước và xuất khẩu. Do tính năng vượt trội của sản phẩm có tính đàn hồi cao như các loại đệm lò xo; khoảng giữa đệm được kết cấu đặc biệt, thực sự như một vật dụng y học để bảo vệ hệ xương sống, nơi tập trung các dây thần kinh quan trọng nhất của con người. Bề mặt sản phẩm có độ dai, phẳng tiêu chuẩn, được đóng dấu nổi logo Sông Hồng cả hai mặt để chống hàng giả và được đăng ký bảo hộ nhãn hiệu hàng hoá.</span></p>
<p>
	<br style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;" />
	<span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">Do tính ưu việt của thiết bị và được vận hành bởi đội ngũ kỹ sư cơ khí, kỹ sư điện và điện tự động cùng đội ngũ kĩ thuật viên nhiều kinh nghiệm, các sản phẩm Đệm bông và Bông tấm thế hệ thứ hai của Sông Hồng mặc dù có giá trị sử dụng rất cao song giá thành vẫn không hề xa cách với cuộc sống của đa số những người dân Việt Nam. Sản phẩm được&nbsp;</span><span style="color: rgb(255, 0, 0);"><span style="box-sizing: border-box; font-weight: 700; font-family: Arial; font-size: 13px; text-align: justify;">bảo hành 05 năm</span></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 13px; text-align: justify;">&nbsp;và chỉ được bán ở các Đại lý chính thức của Công ty trên toàn quốc</span></p>
', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-11T14:59:01.523' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'd986ac16835a4d62baf61dc2ee45c645', 14, N'4b98a22a297642a7bff127ddb4917952', NULL, N'BỘ ELEGANCE SH-E18 10', N'/bo-chan-ga-goi/bo-elegance-sh-e18-10', N'Tông màu ghi-trắng chưa bao giờ là lỗi mốt, đem đến cảm giác dịu mắt, đây là một trong những cách kết hợp giữa 2 gam màu đặc trưng tạo nên một phong cách rất cổ điển.

', N'/images/product/10_2018/1b690df63631453b907e9d876162d0f7e10.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-23T14:25:05.470' AS DateTime))
INSERT [dbo].[shProducts] ([ProductGuid], [ProductId], [CategoryGuid], [CategoryName], [ProductName], [MetaTitle], [Description], [Image], [Details], [UserManual], [CompleteSetInclude], [PriceCurrent], [PercentCurrent], [PriceAfterPercents], [ViewsProduct], [ProductStatus], [TopHot], [SortOrder], [Color], [Size], [Number], [Inventory], [UserId], [Status], [CreateDate]) VALUES (N'ef92dca418f149a9a8fa95543ecdc7f0', 6, N'ebf90a4171884c778b7126fe31372d23', NULL, N'BỘ CHĂN GA GỐI SH_H17 054', N'/bo-chan-ga-goi/bo-chan-ga-goi-sh_h17-054', N'Độc và lạ

Một mẫu thiết kế mới, độc và lạ của bộ sựu tập năm nay. Màu xám ánh bạc sang trọng, phối tông màu xám lạnh, thêu bông xanh nên hoàn toàn lạ mà vẫn hợp lý. Tông màu tối, lạnh nhưng vẫn có độ tươi sáng rất lạ và hoàn toàn phù hợp với thời tiết các mùa. Với mẫu thiết kế này bộ drap là một mẫu không thể thiếu trong những căn nhà đẹp, hiện đại mới vừa ý những chủ nhân cầu kỳ, ưa thích sự sáng tạo, mới lạ

', N'/images/product/11_2018/ec59f1cd897e4cc99490f156328af8cfslider-banner5.jpg', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-23T19:48:08.787' AS DateTime))
SET IDENTITY_INSERT [dbo].[shProducts] OFF
SET IDENTITY_INSERT [dbo].[shProductSet] ON 

INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'0478168d6b5c43c1bf3569c062804b29', 89, N'd986ac16835a4d62baf61dc2ee45c645', N'Vỏ gối đơn (Set C)', N'/vo-goi-don-set-c-', N'7de53a0800004f9aa8c5bddc7e6ccbf5', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T16:11:50.853' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'0ba5111a50784c0faaa1029321d421bd', 86, N'd986ac16835a4d62baf61dc2ee45c645', N'Vỏ gối ôm(Set R)', N'/vo-goi-om-set-r-', N'f973ae2ebf50462c91b16287612a88dd', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-08T16:11:20.857' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'159eb36f4ff248eba5bed908b4770e6d', 70, N'a2597d0247764a6f861846717b5b64c7', N'Chăn đông', N'/chan-dong', N'5f3a45282da64e50b62aea07b0d37749', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T10:11:09.703' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'1916231acdfa43208adb9972b0719787', 94, N'649b88137337436fb57b1972667b1c70', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T18:37:15.443' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'1af5dcdbb1d34addb167a69fe7d5d832', 58, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Chăn xuân thu	(Set C)', N'/chan-xuan-thu	-set-c-', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', 4, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:56:06.803' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'1e6d914fa1624ea78814934069b74f68', 56, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Vỏ gối ôm (Set C)', N'/vo-goi-om-set-c-', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:55:37.360' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'1fce1280cacc4992a1f5a8d297254d2f', 72, N'a2597d0247764a6f861846717b5b64c7', N'Bộ ga rèm	', N'/bo-ga-rem', N'5f3a45282da64e50b62aea07b0d37749', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-08T10:11:41.620' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'2546e26c155842748f5d35b6a6b4750f', 97, N'649b88137337436fb57b1972667b1c70', N'Ga bọc', N'/ga-boc', N'1916231acdfa43208adb9972b0719787', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-08T18:38:17.283' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'3027bc8c135842f9b77278995fc65c6e', 54, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Chăn xuân thu	(Set R)', N'/chan-xuan-thu	-set-r-', N'97b9fa4265eb4356804e0ad2a3de35db', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-07T19:00:26.883' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'3aa55a50e80448c4822e28e19ea53e93', 41, N'6952b3a16adc4e76841f6c016cbe01ad', N'Vỏ gối đơn(Set R)', N'/vo-goi-don-set-r-', N'c0697a9b39cc4e26afc4c8d69226573c', NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:04:31.987' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'3fc931aaace64b9c9bcb17d74bf92bc0', 44, N'6952b3a16adc4e76841f6c016cbe01ad', N'Chăn xuân thu	(Set R)', N'/chan-xuan-thu	-set-r-', N'c0697a9b39cc4e26afc4c8d69226573c', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:10:10.087' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'42118da80b884812a5fb071dfa5fb41e', 17, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Set R (Bộ chăn ga rèm)', N'/set-r-bo-chan-ga-rem-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-07T11:10:10.160' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'46bce31abbc441aab425e257ab6a3002', 81, N'8d4e41d756f446a581e27333f117f01c', N'Chăn xuân thu	 ', N'/chan-xuan-thu', N'7bb5c1fcd0444336ba0d64132bd2b505', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-08T14:12:51.790' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'4f2e2251d5c04d55a6d4c8478be02d64', 40, N'6952b3a16adc4e76841f6c016cbe01ad', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:03:30.140' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'4fbf386613604631b10edb14ddf3c6d0', 73, N'a2597d0247764a6f861846717b5b64c7', N'Bộ ga rèm + Vỏ chăn đông', N'/bo-ga-rem-vo-chan-dong', N'5f3a45282da64e50b62aea07b0d37749', 4, NULL, NULL, NULL, 1, CAST(N'2018-10-08T10:12:10.097' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'5031f0c7cab744ac8caef26a569b0491', 71, N'a2597d0247764a6f861846717b5b64c7', N'Chăn xuân thu	', N'/chan-xuan-thu', N'5f3a45282da64e50b62aea07b0d37749', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-08T10:11:49.977' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'56ce86d106674a61bfed823b22c00b79', 91, N'd986ac16835a4d62baf61dc2ee45c645', N'Ga chun (bọc)', N'/ga-chun-boc-', N'7de53a0800004f9aa8c5bddc7e6ccbf5', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-08T15:20:55.943' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'57e620ba8b8e40928d106b610b250243', 14, N'423eaa676f704dbaba57152c45e21c09', N'Đệm vỏ gấm', N'/dem-vo-gam', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-06T14:19:22.873' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'5885d3425e5640508d92d56e45cf0f70', 96, N'649b88137337436fb57b1972667b1c70', N'Chăn xuân thu	(Set C)', N'/chan-xuan-thu	-set-c-', N'1916231acdfa43208adb9972b0719787', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-08T18:37:58.037' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'591cdf63f6a44c21865a4b3cdaf58f48', 16, N'4c52c9d3ae164a2fa85aae61ef18929e', N'Đệm vỏ gấm', N'/dem-vo-gam', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-06T15:40:22.017' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'5a1c07ee73b94ae4b730f31364359488', 37, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Test ', N'/test', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:55:35.780' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'5a5c48b7ef024abc8a73d77e28d7a458', 46, N'6952b3a16adc4e76841f6c016cbe01ad', N'Vỏ gối ôm (Set C)', N'/vo-goi-om-set-c-', N'4f2e2251d5c04d55a6d4c8478be02d64', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:06:16.880' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'5f3a45282da64e50b62aea07b0d37749', 67, N'a2597d0247764a6f861846717b5b64c7', N'Set R (Bộ chăn ga rèm)', N'/set-r-bo-chan-ga-rem-', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-08T09:57:02.557' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'60c698269ce24cdc85e3c1bda04d12a5', 53, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Ga Rèm (phủ) ', N'/ga-rem-phu-', N'97b9fa4265eb4356804e0ad2a3de35db', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:54:36.213' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'6361de4892344968a249059cdc15984d', 66, N'105d5e183b724f15b689b1f4d98f8757', N'Ruột gối tựa	', N'/ruot-goi-tua', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T22:06:25.873' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'68456f12b3ca4ee391017d51fbbfc22a', 98, N'b150c65366424661baf6179261e65df2', N'Chăn xuân thu	(Set R)', N'/chan-xuan-thu	-set-r-', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-20T10:05:40.870' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'69c31820ecce45e59a7f9bc70cc1e3df', 100, N'b150c65366424661baf6179261e65df2', N'Chăn hè tháng 3', N'/chan-he-thang-3', N'bd087ac0d38b4e9aa96efd5cba92394b', NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-20T10:08:11.917' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'69f32685beaf4458bc9851b523fc6408', 90, N'd986ac16835a4d62baf61dc2ee45c645', N'Vỏ gối ôm(Set C)', N'/vo-goi-om-set-c-', N'7de53a0800004f9aa8c5bddc7e6ccbf5', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-08T16:12:07.340' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'6a78bfea6c90431aaff4adee6b573e57', 47, N'6952b3a16adc4e76841f6c016cbe01ad', N'Ga chun (Bọc)', N'/ga-chun-boc-', N'4f2e2251d5c04d55a6d4c8478be02d64', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:06:40.593' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'74cb9a53a356446eb438ea7843c82cda', 87, N'd986ac16835a4d62baf61dc2ee45c645', N'Ga rèm (phủ)	', N'/ga-rem-phu-', N'f973ae2ebf50462c91b16287612a88dd', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-08T15:19:28.043' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'767852057fef40b68396babd107b8d03', 69, N'a2597d0247764a6f861846717b5b64c7', N'Set S (Bộ ga chun)', N'/set-s-bo-ga-chun-', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-08T09:57:11.750' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'76a902f08e6c44a4985e20a2daaf290a', 61, N'bcaf655eb6a34736b99add7c80b457f4', N'Chăn xuân thu	', N'/chan-xuan-thu', NULL, 3, NULL, NULL, NULL, 0, CAST(N'2018-10-07T21:28:25.380' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'7807ad81bb264d5395d60029d7dfb81d', 92, N'd986ac16835a4d62baf61dc2ee45c645', N'Chăn xuân thu	(Set C)', N'/chan-xuan-thu	-set-c-', N'7de53a0800004f9aa8c5bddc7e6ccbf5', 4, NULL, NULL, NULL, 1, CAST(N'2018-10-08T16:12:22.493' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'78982f9489754d3b98247ed1bfdcdf5b', 75, N'374a867f8033425e83daeba41fcc36c2', N'Gối ôm', N'/goi-om', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-08T11:04:10.073' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'7ac9ff21858c45b89706e18e10aab0b6', 64, N'105d5e183b724f15b689b1f4d98f8757', N'Vỏ gối ôm	', N'/vo-goi-om', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T22:06:11.517' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'7bb5c1fcd0444336ba0d64132bd2b505', 79, N'8d4e41d756f446a581e27333f117f01c', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T14:06:54.553' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'7c2bd16f29b645a0b066868142a545f7', 74, N'374a867f8033425e83daeba41fcc36c2', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-08T11:03:59.617' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'7de53a0800004f9aa8c5bddc7e6ccbf5', 84, N'd986ac16835a4d62baf61dc2ee45c645', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-08T15:18:56.447' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'818a9e20549b42408acee5f7149acfe4', 35, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Vỏ gối đơn(Set C)', N'/vo-goi-don', N'f8b8f536efbf4f608bf2fa19179e7763', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:40:04.413' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'87c763260c1142bbb269c272e0b17e7f', 82, N'8d4e41d756f446a581e27333f117f01c', N'Ga bọc', N'/ga-boc', N'7bb5c1fcd0444336ba0d64132bd2b505', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-08T14:13:08.037' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'8eddf7dc55ef42b6a55a4ed0a8709289', 78, N'374a867f8033425e83daeba41fcc36c2', N'Ga bọc', N'/ga-boc', N'7c2bd16f29b645a0b066868142a545f7', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-08T11:13:28.103' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'90bee1d744754635af98a98c708b304c', 62, N'105d5e183b724f15b689b1f4d98f8757', N'Vỏ gối đơn', N'/vo-goi-don', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T22:05:58.733' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'94842c94e5774aa2b70b490d7bb5b090', 22, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Ga rèm (phủ)', N'/ga-rem-phu-', N'42118da80b884812a5fb071dfa5fb41e', 5, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:32:19.070' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'952e6c92408d4677b51b8a20308df158', 34, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Vỏ gối ôm(Set C)', N'/vo-goi-om', N'f8b8f536efbf4f608bf2fa19179e7763', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:39:47.993' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'97b9fa4265eb4356804e0ad2a3de35db', 49, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Set R (Bộ chăn ga rèm)', N'/set-r-bo-chan-ga-rem-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:53:30.703' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'9bfc645e5d1944f8840757c3c5d5b35f', 51, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Vỏ gối đơn (Set R)', N'/vo-goi-don-set-r-', N'97b9fa4265eb4356804e0ad2a3de35db', NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:54:08.477' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'9bfff44791004e19a67cfc2172f062aa', 85, N'd986ac16835a4d62baf61dc2ee45c645', N'Vỏ gối đơn(Set R)', N'/vo-goi-don-set-r-', N'f973ae2ebf50462c91b16287612a88dd', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T16:11:08.207' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'9dce34e3467844df9aced1c038c46b7f', 21, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Vỏ gối ôm (Set R)', N'/vo-goi-om-set-r-', N'42118da80b884812a5fb071dfa5fb41e', 4, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:50:05.463' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'a19831f70b7b4535a094ae24123546a4', 60, N'bcaf655eb6a34736b99add7c80b457f4', N'Ruột chăn đông dầy	', N'/ruot-chan-dong-day', NULL, 2, NULL, NULL, NULL, 0, CAST(N'2018-10-07T21:28:15.080' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'ab6b6e16179e4ebc8ead59963e90a499', 88, N'd986ac16835a4d62baf61dc2ee45c645', N'Chăn xuân thu	(Set R)', N'/chan-xuan-thu	-set-r-', N'f973ae2ebf50462c91b16287612a88dd', 4, NULL, NULL, NULL, 1, CAST(N'2018-10-08T16:11:36.427' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'ad5b851c82bc4a92ad8a8e32edcfb1f3', 50, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:53:53.187' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'adb9601331c4448faee05bdec2048694', 23, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Ga chun (bọc)	', N'/ga-chun-boc-', N'f8b8f536efbf4f608bf2fa19179e7763', 5, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:37:51.183' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'af94b26dd6424953bbe8704cdaf7ac00', 63, N'105d5e183b724f15b689b1f4d98f8757', N'Ruột gối đơn	', N'/ruot-goi-don', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T22:06:06.820' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'b70d0e7d9a69423eb1d9848599698d74', 48, N'6952b3a16adc4e76841f6c016cbe01ad', N'Chăn xuân thu	(Set C)', N'/chan-xuan-thu	-set-c-', N'4f2e2251d5c04d55a6d4c8478be02d64', 4, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:06:58.970' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'b8f3a2d62abf49c7870c35111e4e61c3', 55, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Vỏ gối đơn (Set C)', N'/vo-goi-don-set-c-', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:55:10.933' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'ba01f4880919424f8698f1d48b1e1b13', 15, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'Đệm vỏ TC', N'/dem-vo-tc', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-06T15:01:33.177' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'bd01a90c1b0149bc9d3398526d422cbb', 42, N'6952b3a16adc4e76841f6c016cbe01ad', N'Vỏ gối ôm(Set R)', N'/vo-goi-om-set-r-', N'c0697a9b39cc4e26afc4c8d69226573c', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:04:59.717' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'bd087ac0d38b4e9aa96efd5cba92394b', 99, N'b150c65366424661baf6179261e65df2', N'Chăn hè', N'/chan-he', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2018-10-20T10:07:40.007' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'c0697a9b39cc4e26afc4c8d69226573c', 39, N'6952b3a16adc4e76841f6c016cbe01ad', N'Set R (Bộ chăn ga rèm)', N'/set-r-bo-chan-ga-rem-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:03:36.497' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'c1d65b9f46a24baf8e6b87dee1bdb699', 68, N'a2597d0247764a6f861846717b5b64c7', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-08T09:57:07.200' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'c622d863bc08437e8e3d8c907409919e', 38, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Test 2', N'/test-2', N'5a1c07ee73b94ae4b730f31364359488', NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:55:50.770' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'cba90459173e4e3da00a28044515f9fe', 36, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Chăn xuân thu(Set C)', N'/chan-xuan-thu', N'f8b8f536efbf4f608bf2fa19179e7763', 6, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:47:05.510' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'd225f93f0f7e45e895aebf27b920c389', 57, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Ga chun (bọc)	', N'/ga-chun-boc-', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:55:53.393' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'd2bf0e9e11004a9fba4160f0d4c7f110', 59, N'bcaf655eb6a34736b99add7c80b457f4', N'Chăn đông', N'/chan-dong', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-07T21:28:06.010' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'd3621a08d8324c72b5800a4399cffe2a', 93, N'd986ac16835a4d62baf61dc2ee45c645', N'160 x 200 (cm)', N'/160-x-200-cm-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T16:28:01.787' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'd6ec1265dbf848eaaa908e42968f6a29', 24, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Chăn xuân thu (Set R)', N'/chan-xuan-thu	-set-r-', N'42118da80b884812a5fb071dfa5fb41e', 7, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:50:22.263' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'e110c1dbc54c4f288c66d1c3ff48a9e4', 45, N'6952b3a16adc4e76841f6c016cbe01ad', N'Vỏ gối đơn (Set C)', N'/vo-goi-don-set-c-', N'4f2e2251d5c04d55a6d4c8478be02d64', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:06:03.600' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'e3b208f277bf4adaae1ca21e2d3de140', 43, N'6952b3a16adc4e76841f6c016cbe01ad', N'Ga Rèm (phủ)', N'/ga-rem-phu-', N'c0697a9b39cc4e26afc4c8d69226573c', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:05:27.177' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'e5748fdde7a34ebfa36a7e2ccb7f3ea2', 95, N'649b88137337436fb57b1972667b1c70', N'Vỏ gối đơn (Set C)', N'/vo-goi-don-set-c-', N'1916231acdfa43208adb9972b0719787', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T18:37:41.167' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'e980d758d5974dfe9b9242742ff89938', 77, N'374a867f8033425e83daeba41fcc36c2', N'Chăn xuân thu', N'/chan-xuan-thu', N'7c2bd16f29b645a0b066868142a545f7', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-08T11:13:20.643' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'ea489e393bb944cbb324b255da7ed21f', 76, N'374a867f8033425e83daeba41fcc36c2', N'Vỏ gối đơn', N'/vo-goi-don', N'7c2bd16f29b645a0b066868142a545f7', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T11:13:11.623' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'ef12b9b3343d44f8ab7de5d6282553d3', 20, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Vỏ gối đơn (Set R)', N'/vo-goi-don-set-r-', N'42118da80b884812a5fb071dfa5fb41e', 3, NULL, NULL, NULL, 1, CAST(N'2018-10-07T17:49:49.767' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'f68e187066674c18a9e344e54303b630', 80, N'8d4e41d756f446a581e27333f117f01c', N'Vỏ gối đơn', N'/vo-goi-don', N'7bb5c1fcd0444336ba0d64132bd2b505', 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T14:12:35.273' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'f8b8f536efbf4f608bf2fa19179e7763', 18, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Set C (Bộ chăn ga chun)', N'/set-c-bo-chan-ga-chun-', NULL, 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T11:10:20.723' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'f973ae2ebf50462c91b16287612a88dd', 83, N'd986ac16835a4d62baf61dc2ee45c645', N'Set R (Bộ chăn ga rèm)', N'/set-r-bo-chan-ga-rem-', NULL, 1, NULL, NULL, NULL, 1, CAST(N'2018-10-08T15:18:20.353' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'f98e71a705dc46bf81c178eaecc8ace8', 52, N'ef92dca418f149a9a8fa95543ecdc7f0', N'Vỏ gối ôm (Set R)', N'/vo-goi-om-set-r-', N'97b9fa4265eb4356804e0ad2a3de35db', 2, NULL, NULL, NULL, 1, CAST(N'2018-10-07T18:54:24.383' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'fb1e980b0818429e87b94352ad93b705', 19, N'2052fc3d0b514ff3ba6968ae39b202ad', N'Set D', N'/set-d', NULL, 3, NULL, NULL, NULL, 0, CAST(N'2018-10-07T11:24:41.810' AS DateTime))
INSERT [dbo].[shProductSet] ([SectionGuid], [SectionId], [ProductGuid], [SectionName], [MetaTitle], [ParentId], [SortOrder], [Number], [Inventory], [ItemStatus], [Status], [CreateDate]) VALUES (N'fde15b57ab774a3494e73bb0a1758282', 65, N'105d5e183b724f15b689b1f4d98f8757', N'Ruột gối ôm	', N'/ruot-goi-om', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-10-07T22:06:20.773' AS DateTime))
SET IDENTITY_INSERT [dbo].[shProductSet] OFF
SET IDENTITY_INSERT [dbo].[shSale] ON 

INSERT [dbo].[shSale] ([SaleGuid], [SaleId], [SaleDetailGuid], [SaleName], [SaleCode], [Description], [CachTinhGiaTriKhuyenMai], [GiaTri], [StartTime], [EndTime], [DieuKienApDung], [SaleStatus], [UserId], [MetaTitle], [Status], [CreateDate]) VALUES (N'71724757c3b04ae09a59f39a9648d2bb', 7, NULL, N'Chương trình Khuyến mại mùa đông - 2018', N'FALL-2018', N'', 1, N'10', CAST(N'2018-11-01T00:00:00.000' AS DateTime), CAST(N'2018-12-31T00:00:00.000' AS DateTime), 1, 2, 2, NULL, 1, CAST(N'2018-11-03T14:21:25.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[shSale] OFF
SET IDENTITY_INSERT [dbo].[shSaleDetail] ON 

INSERT [dbo].[shSaleDetail] ([SaleDetailGuid], [SaleDetailId], [SaleGuid], [CachTinhGiaTriKhuyenMai], [GiaTri], [StartDate], [EndDate], [DieuKienApDung], [MaCauHinh], [CategoryGuidProductGuid], [CategoryGuid], [ProductGuid], [Percents], [Description], [Notes], [PriceAfterPercents], [SaleAttach], [Status], [CreateDate]) VALUES (N'a6cd963d6bd84364b125c6ee79cd90b6', 1002, N'71724757c3b04ae09a59f39a9648d2bb', 1, N'10', CAST(N'2018-11-01T00:00:00.000' AS DateTime), CAST(N'2018-12-31T00:00:00.000' AS DateTime), 1, N'TatCa', N'MaCauHinh_TatCaSanPham ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-11-03T14:21:25.603' AS DateTime))
SET IDENTITY_INSERT [dbo].[shSaleDetail] OFF
SET IDENTITY_INSERT [dbo].[shSetSize] ON 

INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'01f2744aa8c149f8b4d7f6f4bff82df1', 116, N'ef92dca418f149a9a8fa95543ecdc7f0', N'd225f93f0f7e45e895aebf27b920c389', N'01 cái - 200 x 220 (cm)', 930000.0000, N'', N'6eabdea75fe347f4915e9d3739152a94', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:44:25.907' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'04fadefdeb2b43c4aefd0e0e485f860f', 132, N'a2597d0247764a6f861846717b5b64c7', N'5f3a45282da64e50b62aea07b0d37749', N'160 x 200 (cm)', 3800000.0000, N'', NULL, NULL, NULL, NULL, NULL, 12, 11, NULL, NULL, 1, CAST(N'2018-10-08T10:56:55.663' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'053b180d9e86448f9e627acdc31da6fa', 51, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'150 x 190 x 15 (cm)', 5450000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:23:13.027' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'06294a807ae6438ab71c5b9f1757e15f', 59, N'2052fc3d0b514ff3ba6968ae39b202ad', N'42118da80b884812a5fb071dfa5fb41e', N'160x200 (cm)', 4180000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-07T11:11:49.697' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'06b5fdbe10c946d49382c94106f6069d', 164, N'8d4e41d756f446a581e27333f117f01c', N'46bce31abbc441aab425e257ab6a3002', N'01 Chăn xuân thu: 200 x 220cm', 1500000.0000, N'', N'ad283967e6d946db843cd4d4f11cadea', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T14:58:06.283' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'06b9db51775d4b7f901f7d708bbb03d7', 81, N'6952b3a16adc4e76841f6c016cbe01ad', N'c0697a9b39cc4e26afc4c8d69226573c', N'160 x 200 (cm)', 3400000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, NULL, NULL, 1, CAST(N'2018-10-07T18:08:34.563' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'0820b99e5da943b3b31e8d0f1dd193dd', 36, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'120 x 190 x 7 (cm)', 2090000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:05:23.183' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'0bdac7da12dc43899948f0825d984116', 104, N'ef92dca418f149a9a8fa95543ecdc7f0', N'97b9fa4265eb4356804e0ad2a3de35db', N'200 x 220 (cm)', 4000000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, NULL, NULL, 1, CAST(N'2018-10-07T18:57:47.767' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'113215ca0502471e9d6b90d6c354bf02', 189, N'649b88137337436fb57b1972667b1c70', N'1916231acdfa43208adb9972b0719787', N'120 x 200 cm', 1650000.0000, N'', N'', NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-08T18:38:46.697' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'125a33f2bc0b4c46a0de75c549bb0e2e', 69, N'2052fc3d0b514ff3ba6968ae39b202ad', N'd6ec1265dbf848eaaa908e42968f6a29', N'200 x 220 (cm)	', 1500000.0000, N'', N'06294a807ae6438ab71c5b9f1757e15f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:10:36.417' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'129790822c7743bf911ff0b512469590', 177, N'd986ac16835a4d62baf61dc2ee45c645', N'ab6b6e16179e4ebc8ead59963e90a499', N'200 x 220 (cm)', 1180000.0000, N'', N'd9c45dae570a4bd3b2d0fe1e2f0beeb7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T16:22:12.267' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'154d2ea8c7014bceb374a4c9a4cda420', 108, N'ef92dca418f149a9a8fa95543ecdc7f0', N'1af5dcdbb1d34addb167a69fe7d5d832', N'200 x 220 (cm)', 1500000.0000, N'', N'f0c19904c2274d65b06693db2ebafd0f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:44:34.143' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1609a46ee08a479e8490a20089e97af3', 110, N'ef92dca418f149a9a8fa95543ecdc7f0', N'b8f3a2d62abf49c7870c35111e4e61c3', N'02 cái - 45 x 65 (cm)', 370000.0000, N'', N'f0c19904c2274d65b06693db2ebafd0f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:44:03.570' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1683ee8ea2af41268820927ddfa1f6cd', 124, N'105d5e183b724f15b689b1f4d98f8757', N'fde15b57ab774a3494e73bb0a1758282', N'38 x 100 ', NULL, N'TC', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:24:14.647' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'182639a4916e4c5dae5b5f0729af3148', 42, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'160 x 195 x 5 (cm)', 2220000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:07:38.827' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'190fc11160b34639ae9b34f75bc662a1', 181, N'd986ac16835a4d62baf61dc2ee45c645', N'0478168d6b5c43c1bf3569c062804b29', N'02 cái - 45 x 65 (cm)	', 330000.0000, N'', N'6573bf2377124daa9f32900c22e9a7a9', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:12:50.413' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1964db4fb9e74467aafde0706c1018dc', 123, N'105d5e183b724f15b689b1f4d98f8757', N'7ac9ff21858c45b89706e18e10aab0b6', N'38 x 100 ', 91000.0000, N'Cotton', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:23:09.387' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1c89591652a148e19254cfa3968bd968', 114, N'ef92dca418f149a9a8fa95543ecdc7f0', N'd225f93f0f7e45e895aebf27b920c389', N'01 cái - 160 x 200 (cm)', 700000.0000, N'', N'f0c19904c2274d65b06693db2ebafd0f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:44:17.723' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1da57e1b547a458db31d0b795d4300c0', 64, N'2052fc3d0b514ff3ba6968ae39b202ad', N'f8b8f536efbf4f608bf2fa19179e7763', N'200x220 (cm)', 3680000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-07T11:13:18.317' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1dc1fb8e7b1241a6b9876d5c14ca857d', 86, N'6952b3a16adc4e76841f6c016cbe01ad', N'3fc931aaace64b9c9bcb17d74bf92bc0', N'200 x 220 (cm)', 1500000.0000, N'', N'06b9db51775d4b7f901f7d708bbb03d7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:47:36.183' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1e065f37a72744968b23b9587232e808', 26, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'140 x 190 x 7 (cm)', 2580000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:06.980' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'1f65aed2171c47d1831d90b8ed1d4ec3', 24, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'120 x 190 x 7 (cm)', 2310000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:27:07.523' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'223198f7528a4d619580959c8bbcb975', 190, N'649b88137337436fb57b1972667b1c70', N'1916231acdfa43208adb9972b0719787', N'160 x 200cm', 1800000.0000, N'', N'', NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-08T18:38:57.487' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'234fca93ce2747eb84c20b69b3571fb8', 111, N'ef92dca418f149a9a8fa95543ecdc7f0', N'1e6d914fa1624ea78814934069b74f68', N'01 cái - 38 x 100 (cm)', 500000.0000, N'', N'f0c19904c2274d65b06693db2ebafd0f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:45:04.337' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'29a134d21b8e409e8835e3b8e2bb2930', 63, N'2052fc3d0b514ff3ba6968ae39b202ad', N'f8b8f536efbf4f608bf2fa19179e7763', N'180x200 (cm)', 3520000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-07T11:13:01.990' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'2daae778380c483fa797e107731ae0fe', 137, N'a2597d0247764a6f861846717b5b64c7', N'1fce1280cacc4992a1f5a8d297254d2f', N'150 x 190	', 870000.0000, N'', N'04fadefdeb2b43c4aefd0e0e485f860f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:07:57.207' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'2e83feb613e243b6b19afa286f575d99', 39, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'140 x 190 x 7 (cm)', 2370000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:07:11.727' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'2f5ed050e6af41bba012dfa45a22201b', 117, N'105d5e183b724f15b689b1f4d98f8757', N'90bee1d744754635af98a98c708b304c', N'45 x 65 ', 72000.0000, N'TC', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:14:05.257' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'30c308e7099149eca66c83b2a224ffb4', 85, N'6952b3a16adc4e76841f6c016cbe01ad', N'bd01a90c1b0149bc9d3398526d422cbb', N'01 cái - 38 x 100 (cm)	', 600000.0000, N'', N'06b9db51775d4b7f901f7d708bbb03d7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:47:17.000' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'30d9cd54da214f69a1d03e496f87978e', 152, N'374a867f8033425e83daeba41fcc36c2', N'e980d758d5974dfe9b9242742ff89938', N'01 cái 200 x 220cm', NULL, N'', N'ddd1c74253794eef8f2597da8038ef58', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T12:06:31.440' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3119b3f23a1d4262a92d876b325b0492', 91, N'6952b3a16adc4e76841f6c016cbe01ad', N'4f2e2251d5c04d55a6d4c8478be02d64', N'180 x 200 (cm)', 2930000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, NULL, NULL, 1, CAST(N'2018-10-07T18:29:31.627' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'322387c946634d58b27e70c351d3a109', 168, N'8d4e41d756f446a581e27333f117f01c', N'87c763260c1142bbb269c272e0b17e7f', N'01 Ga bọc: 180 x 200 cm', 600000.0000, N'', N'9fd7b43cb5684abdb8d28a20bf75d95f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T15:01:10.050' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'329fe96e3656404285842a1c8fe7e760', 70, N'2052fc3d0b514ff3ba6968ae39b202ad', N'94842c94e5774aa2b70b490d7bb5b090', N'01 cái - 180 x 200 (cm)', 1550000.0000, N'', N'3a4c8da536cf470995bd55dc568b7873', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:10:28.387' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3497934ea2b74e078e21f0589a7e6be0', 103, N'ef92dca418f149a9a8fa95543ecdc7f0', N'97b9fa4265eb4356804e0ad2a3de35db', N'180 x 200 (cm)', 3800000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, NULL, NULL, 1, CAST(N'2018-10-07T18:57:37.993' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'39234bc89e474b2fad71eb36e20259de', 134, N'a2597d0247764a6f861846717b5b64c7', N'5031f0c7cab744ac8caef26a569b0491', N'150 x 210	', 610000.0000, N'Cotton', N'04fadefdeb2b43c4aefd0e0e485f860f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:07:48.247' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'39bdfe4055d94af6b06762e7a46aa015', 35, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'120 x 190 x 5 (cm) ', 1710000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:26:25.023' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'39ed724f1349425c84bdd1514ae9af8d', 162, N'8d4e41d756f446a581e27333f117f01c', N'87c763260c1142bbb269c272e0b17e7f', N'01 Ga bọc: 120 x 200cm', 500000.0000, N'', N'83c199eada904c30b94a6b1cbbf185a8', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T14:46:11.900' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3a378cc9b7824dcca4d68b1b5a342ee6', 185, N'd986ac16835a4d62baf61dc2ee45c645', N'0478168d6b5c43c1bf3569c062804b29', N'02 cái - 45 x 65 (cm)', 400000.0000, N'', N'3d4e09179b8b42b7877ee84f00818c67', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:17:25.250' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3a4c8da536cf470995bd55dc568b7873', 60, N'2052fc3d0b514ff3ba6968ae39b202ad', N'42118da80b884812a5fb071dfa5fb41e', N'180x200 (cm)', 4230000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-07T11:12:01.177' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3b51bf7551904b57910af61cb9462d41', 150, N'374a867f8033425e83daeba41fcc36c2', N'8eddf7dc55ef42b6a55a4ed0a8709289', N'01 cái 120 x 200cm', NULL, N'', N'87499efe4bed4f03869f14a4b58f2915', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T11:47:48.060' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3ce916b12ddb47e287520a7b183e0acc', 171, N'd986ac16835a4d62baf61dc2ee45c645', N'9bfff44791004e19a67cfc2172f062aa', N'02 cái - 45 x 65 (cm)', 300000.0000, N'', N'd4e79b48f6504b7cbdb856d144e0881e', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T15:26:44.253' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3d22fc9725eb46d4966e6979b95a1fe4', 46, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'200 x 220 x 7 (cm) ', 3850000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:08:23.870' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3d4e09179b8b42b7877ee84f00818c67', 180, N'd986ac16835a4d62baf61dc2ee45c645', N'7de53a0800004f9aa8c5bddc7e6ccbf5', N'180 x 200 (cm)', 1800000.0000, N'', N'', NULL, NULL, NULL, NULL, 20, 20, NULL, NULL, 1, CAST(N'2018-10-08T16:33:01.883' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3ecb1d77b8434c618c5b9bcdfa8bba5e', 68, N'2052fc3d0b514ff3ba6968ae39b202ad', N'adb9601331c4448faee05bdec2048694', N'01 cái - 160 x 200 (cm)	', 800000.0000, N'', N'e0be978d3d0d40b8bdeb0f662eb84ee6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:11:13.483' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'3f6e1104ff9147cdbde61286fd85c5c3', 33, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'200 x 220 x 5 (cm)', 3500000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:47.070' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'41ca4b031ff2435aa0eaffa7560dd924', 129, N'a2597d0247764a6f861846717b5b64c7', N'159eb36f4ff248eba5bed908b4770e6d', N'180 x 210	', 855000.0000, N'Cotton', N'86a38edd2ab3419da87d7000022b8bb3', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:07:36.773' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4302edbb14634dc5a03c3c588d6ffc59', 98, N'6952b3a16adc4e76841f6c016cbe01ad', N'6a78bfea6c90431aaff4adee6b573e57', N'200 x 220 (cm)', 420000.0000, N'', N'7aa49a63d56f4cbfaae9fb35cee66ffe', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:48:32.837' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'435f3b81b9144284a9f7e29a6ecc5195', 87, N'6952b3a16adc4e76841f6c016cbe01ad', N'e3b208f277bf4adaae1ca21e2d3de140', N'01 cái - 160 x 200 (cm)', 900000.0000, N'', N'06b9db51775d4b7f901f7d708bbb03d7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:47:21.933' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'463d8bfb862f4e30af1c35bab22d2308', 122, N'105d5e183b724f15b689b1f4d98f8757', N'7ac9ff21858c45b89706e18e10aab0b6', N'38 x 100 ', 67000.0000, N'TC', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:22:48.747' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'492e0f0612614ada9218e88a5a1b7969', 161, N'8d4e41d756f446a581e27333f117f01c', N'46bce31abbc441aab425e257ab6a3002', N' 01 Chăn xuân thu: 180 x 210cm', 1200000.0000, N'', N'83c199eada904c30b94a6b1cbbf185a8', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T15:01:28.940' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4ac793491d984d8d8371ac46e45299b5', 192, N'649b88137337436fb57b1972667b1c70', N'e5748fdde7a34ebfa36a7e2ccb7f3ea2', N'01 Vỏ gối đơn: 47 x 67cm', 350000.0000, N'', N'113215ca0502471e9d6b90d6c354bf02', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:39:48.977' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4adbc1a847674f39834d576b7d116e0d', 65, N'2052fc3d0b514ff3ba6968ae39b202ad', N'ef12b9b3343d44f8ab7de5d6282553d3', N'02 cái - 45 x 65 (cm)	', 480000.0000, N'', N'06294a807ae6438ab71c5b9f1757e15f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:10:13.003' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4bf6266bc2c84e75a06c9c68d55850a8', 197, N'649b88137337436fb57b1972667b1c70', N'2546e26c155842748f5d35b6a6b4750f', N'01 Ga bọc: 160 x 200cm', 350000.0000, N'', N'223198f7528a4d619580959c8bbcb975', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:43:07.367' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4cb66a953a9348d68723c5b07e3bc0c3', 96, N'6952b3a16adc4e76841f6c016cbe01ad', N'6a78bfea6c90431aaff4adee6b573e57', N'01 cái - 160 x 200 (cm)', 300000.0000, N'', N'c34d22e1aa78406fb63f574d62efddd6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:48:24.203' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4e2a6b1e5a8d492989b113f67e7adbbb', 191, N'649b88137337436fb57b1972667b1c70', N'1916231acdfa43208adb9972b0719787', N'180 x 200 cm', 1900000.0000, N'', N'', NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-08T18:39:13.627' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4ee5ab519c54484585a0a76e34171a27', 154, N'374a867f8033425e83daeba41fcc36c2', N'ea489e393bb944cbb324b255da7ed21f', N' 02 Cái 47 x 67cm', NULL, N'', N'72232ed4c2224e1699964afdd5e7f7cc', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T12:07:13.117' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'4fff2402e04a472194c4100939e8eae7', 119, N'105d5e183b724f15b689b1f4d98f8757', N'90bee1d744754635af98a98c708b304c', N'45 x 65', 87000.0000, N'Cotton', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:14:13.103' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'501efb9506584b21be207ef7fa09b022', 151, N'374a867f8033425e83daeba41fcc36c2', N'ea489e393bb944cbb324b255da7ed21f', N'02 cái 47 x 67cm', NULL, N'', N'ddd1c74253794eef8f2597da8038ef58', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T12:06:13.707' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'52c25507bc1d43ff8647b71ebea01b54', 160, N'8d4e41d756f446a581e27333f117f01c', N'f68e187066674c18a9e344e54303b630', N'01 Vỏ gối đơn: 47 x 67cm  ', 370000.0000, N'', N'83c199eada904c30b94a6b1cbbf185a8', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T14:44:49.597' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'58988164f5484b6286a1dca862a29c29', 61, N'2052fc3d0b514ff3ba6968ae39b202ad', N'42118da80b884812a5fb071dfa5fb41e', N'200x220 (cm)', 4330000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-07T11:12:14.597' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'59eff82bc8984e5d95eabdeefaa7d44a', 38, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'140 x 190 x 5 (cm)', 1960000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:06:49.480' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'5a2ead1dd39641b29972335b2a065dd1', 41, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'150 x 190 x 7 (cm)', 2540000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:07:30.037' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'5fdd8e2c14704351bc2cc3d2af8d81d6', 201, N'b150c65366424661baf6179261e65df2', N'68456f12b3ca4ee391017d51fbbfc22a', N'120*200 cm', 3000000.0000, N'', N'', NULL, NULL, NULL, NULL, 20, 18, NULL, NULL, 1, CAST(N'2018-10-23T16:30:59.150' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'63acc7f0fe034cd78e8c5b6c296aafed', 188, N'd986ac16835a4d62baf61dc2ee45c645', N'7807ad81bb264d5395d60029d7dfb81d', N'200 x 220 (cm)', 700000.0000, N'', N'3d4e09179b8b42b7877ee84f00818c67', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:18:40.493' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'64ef4687c50744c9a7b8a7d7d9e4ddff', 165, N'8d4e41d756f446a581e27333f117f01c', N'87c763260c1142bbb269c272e0b17e7f', N'01 Ga bọc: 160 x 200cm', 500000.0000, N'', N'ad283967e6d946db843cd4d4f11cadea', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T14:58:38.817' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'6573bf2377124daa9f32900c22e9a7a9', 179, N'd986ac16835a4d62baf61dc2ee45c645', N'7de53a0800004f9aa8c5bddc7e6ccbf5', N'160 x 200 (cm)', 1730000.0000, N'', N'', NULL, NULL, NULL, NULL, 20, 20, NULL, NULL, 1, CAST(N'2018-10-08T16:29:06.690' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'67bbe90e7ae145d38ed6c403fe3ba1d8', 195, N'649b88137337436fb57b1972667b1c70', N'e5748fdde7a34ebfa36a7e2ccb7f3ea2', N'02 Vỏ gối đơn: 47 x 67cm', 400000.0000, N'', N'223198f7528a4d619580959c8bbcb975', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:41:27.023' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'697f8d2e4dbc4a42a8ea90316a026f44', 95, N'6952b3a16adc4e76841f6c016cbe01ad', N'b70d0e7d9a69423eb1d9848599698d74', N'200 x 220 (cm)	', 1500000.0000, N'', N'c34d22e1aa78406fb63f574d62efddd6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:48:53.070' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'69f675be9fcb47faaf33d1c1cc60e374', 187, N'd986ac16835a4d62baf61dc2ee45c645', N'56ce86d106674a61bfed823b22c00b79', N'01 cái - 160 x 200 (cm)	', 300000.0000, N'', N'3d4e09179b8b42b7877ee84f00818c67', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:18:06.687' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'6b7d8c3349014a2f88ebde002d717ae2', 48, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'120 x 190 x 20 (cm)', 5430000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:22:24.667' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'6d21db825e0e425ebc5dd9f865f50a9a', 149, N'374a867f8033425e83daeba41fcc36c2', N'e980d758d5974dfe9b9242742ff89938', N'01 cái 180 x 210cm', NULL, N'', N'87499efe4bed4f03869f14a4b58f2915', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T11:47:33.167' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'6da7a8c2dcd94b86a88767c4fef1c6f0', 153, N'374a867f8033425e83daeba41fcc36c2', N'8eddf7dc55ef42b6a55a4ed0a8709289', N'01 Cái: 160 x 200cm', NULL, N'', N'ddd1c74253794eef8f2597da8038ef58', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T12:06:55.153' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'6eabdea75fe347f4915e9d3739152a94', 101, N'ef92dca418f149a9a8fa95543ecdc7f0', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', N'200 x 220 (cm)', 3300000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, NULL, NULL, 1, CAST(N'2018-10-07T18:57:14.920' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'72232ed4c2224e1699964afdd5e7f7cc', 146, N'374a867f8033425e83daeba41fcc36c2', N'7c2bd16f29b645a0b066868142a545f7', N'180 x 200 (cm)', 1900000.0000, N'', NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-08T11:05:45.177' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'7393ed9456154ebebbf888b710cf2846', 147, N'374a867f8033425e83daeba41fcc36c2', N'78982f9489754d3b98247ed1bfdcdf5b', N'20 x 80 (cm)', 215000.0000, N'', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T11:06:40.340' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'76a92b204b6a481f9b513f9b2b2e5cdc', 47, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'120 x 190 x 15 (cm)', 4820000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:22:07.593' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'7aa49a63d56f4cbfaae9fb35cee66ffe', 92, N'6952b3a16adc4e76841f6c016cbe01ad', N'4f2e2251d5c04d55a6d4c8478be02d64', N'200 x 220 (cm)', 3090000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, NULL, NULL, 1, CAST(N'2018-10-07T18:29:43.023' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'7be38e47084e479fbca903e94a0c35bd', 199, N'649b88137337436fb57b1972667b1c70', N'5885d3425e5640508d92d56e45cf0f70', N'01 Chăn xuân thu: 200 x 220cm  ', 1050000.0000, N'', N'4e2a6b1e5a8d492989b113f67e7adbbb', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:47:33.870' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'7cf30657fe4e4976ac1778479ad15dac', 74, N'2052fc3d0b514ff3ba6968ae39b202ad', N'adb9601331c4448faee05bdec2048694', N'01 cái - 180 x 200 (cm)', 870000.0000, N'', N'29a134d21b8e409e8835e3b8e2bb2930', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:11:18.193' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'7d0dc0ffaf194c57ab658d3cdcaf20d0', 172, N'd986ac16835a4d62baf61dc2ee45c645', N'0ba5111a50784c0faaa1029321d421bd', N'01 cái - 38 x 100 (cm)	', 200000.0000, N'', N'd4e79b48f6504b7cbdb856d144e0881e', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T15:27:02.810' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'7f074dad6ebb4b9b863430509d164d84', 174, N'd986ac16835a4d62baf61dc2ee45c645', N'ab6b6e16179e4ebc8ead59963e90a499', N'200 x 220 (cm)', 1180000.0000, N'', N'd4e79b48f6504b7cbdb856d144e0881e', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T15:27:54.500' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'829fd7a47a4040b2b0cbff5c2c308ed9', 126, N'105d5e183b724f15b689b1f4d98f8757', N'6361de4892344968a249059cdc15984d', N'50 x 50 ', NULL, N'TC', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:24:33.203' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'83c199eada904c30b94a6b1cbbf185a8', 157, N'8d4e41d756f446a581e27333f117f01c', N'7bb5c1fcd0444336ba0d64132bd2b505', N'120 x 200 cm	', 2070000.0000, N'', N'', NULL, NULL, NULL, NULL, 9, 9, NULL, NULL, 1, CAST(N'2018-10-08T14:41:17.517' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'85781d6b9e64424ebd4e7d73165a7da7', 49, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'140 x 190 x 20 (cm)', 5850000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:22:55.570' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'86a38edd2ab3419da87d7000022b8bb3', 133, N'a2597d0247764a6f861846717b5b64c7', N'5f3a45282da64e50b62aea07b0d37749', N'180 x 200 (cm)', 3850000.0000, N'', NULL, NULL, NULL, NULL, NULL, 12, 11, NULL, NULL, 1, CAST(N'2018-10-08T10:57:02.850' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'87499efe4bed4f03869f14a4b58f2915', 144, N'374a867f8033425e83daeba41fcc36c2', N'7c2bd16f29b645a0b066868142a545f7', N'120 x 200 (cm) ', 1650000.0000, N'', N'', NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-08T12:05:14.247' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'87a381c3d657441cb4ea8c9270162709', 186, N'd986ac16835a4d62baf61dc2ee45c645', N'69f32685beaf4458bc9851b523fc6408', N'01 cái - 38 x 100 (cm)', 400000.0000, N'', N'3d4e09179b8b42b7877ee84f00818c67', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:17:41.120' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'8ad1f5a3f24d458990d958f66459480a', 100, N'ef92dca418f149a9a8fa95543ecdc7f0', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', N'180 x 200 (cm)', 3130000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, NULL, NULL, 1, CAST(N'2018-10-07T18:57:08.523' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'8d4ad52be0f0403ebcab263dd635da68', 29, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'150 x 190 x 9 (cm) ', 3070000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:24.473' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'91076531d49e4838b3525500c99e569e', 141, N'a2597d0247764a6f861846717b5b64c7', N'4fbf386613604631b10edb14ddf3c6d0', N'180 x 200	', 1600000.0000, N'Cotton', N'86a38edd2ab3419da87d7000022b8bb3', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:08:11.950' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'93789421106d45c0aaa32dc0ef24e321', 112, N'ef92dca418f149a9a8fa95543ecdc7f0', N'60c698269ce24cdc85e3c1bda04d12a5', N'01 cái - 180 x 200 (cm', 1110000.0000, N'', N'3497934ea2b74e078e21f0589a7e6be0', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:43:32.420' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'942cc1d584ea42c59b0f097552432e06', 34, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'200 x 220 x 7 (cm)', 4310000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:51.480' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'96756944065d42fa913ca96051f4da8a', 102, N'ef92dca418f149a9a8fa95543ecdc7f0', N'97b9fa4265eb4356804e0ad2a3de35db', N'160 x 200 (cm)', 3790000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, NULL, NULL, 1, CAST(N'2018-10-07T18:57:26.717' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'96ccdec670c84f6a9d886d7251e5dcfc', 44, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'180 x 200 x 7 (cm)', 3120000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:07:58.303' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'98f2322895a94a68a7dd0c93f35cce77', 66, N'2052fc3d0b514ff3ba6968ae39b202ad', N'9dce34e3467844df9aced1c038c46b7f', N'01 cái - 38 x 100 (cm)', 700000.0000, N'', N'06294a807ae6438ab71c5b9f1757e15f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:10:18.597' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9a8011114320495ea0219c2517d0a389', 58, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'200 x 220 x 20 (cm)', 8480000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:24:33.183' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9b26802de6324540ae2c947b0c2170e0', 194, N'649b88137337436fb57b1972667b1c70', N'2546e26c155842748f5d35b6a6b4750f', N'01 Ga bọc: 120 x 200cm', 300000.0000, N'', N'113215ca0502471e9d6b90d6c354bf02', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:40:30.937' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9bf66c7697a94c488cf22d6aeebad483', 97, N'6952b3a16adc4e76841f6c016cbe01ad', N'6a78bfea6c90431aaff4adee6b573e57', N'01 cái - 180 x 200 (cm', 360000.0000, N'', N'3119b3f23a1d4262a92d876b325b0492', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:48:28.603' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9d1146dc4d09436794accc718fab4d1a', 55, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'180 x 200 x 20 (cm)', 7350000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:24:05.423' AS DateTime))
GO
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9d1265279a674fc68736f3042af6108e', 40, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'150 x 190 x 5 (cm)', 2110000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:07:21.813' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9e8860c23a7c4803800d2e4518006c05', 105, N'ef92dca418f149a9a8fa95543ecdc7f0', N'9bfc645e5d1944f8840757c3c5d5b35f', N'02 cái - 45 x 65 (cm)', 490000.0000, N'', N'96756944065d42fa913ca96051f4da8a', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:42:42.877' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9ea9f91ce48c4bf6a8960273dadfc464', 193, N'649b88137337436fb57b1972667b1c70', N'5885d3425e5640508d92d56e45cf0f70', N'01 Chăn xuân thu: 180 x 210cm', 1000000.0000, N'', N'113215ca0502471e9d6b90d6c354bf02', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:40:04.500' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'9fd7b43cb5684abdb8d28a20bf75d95f', 159, N'8d4e41d756f446a581e27333f117f01c', N'7bb5c1fcd0444336ba0d64132bd2b505', N'180 x 200 cm', 2500000.0000, N'', N'', NULL, NULL, NULL, NULL, 9, 9, NULL, NULL, 1, CAST(N'2018-10-08T14:07:37.753' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'a04f45e9653c4b6a8da10e6b3d7f4a49', 120, N'105d5e183b724f15b689b1f4d98f8757', N'af94b26dd6424953bbe8704cdaf7ac00', N'45 x 65', 67000.0000, N'TC', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:15:19.483' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'a398d8d9ea0841ba871679392db8df3d', 52, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'150 x 190 x 20 (cm)', 6110000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:23:32.403' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'a5bb7e82874441f985877c134551326d', 75, N'2052fc3d0b514ff3ba6968ae39b202ad', N'adb9601331c4448faee05bdec2048694', N'01 cái - 200 x 220 (cm)	', 1030000.0000, N'', N'1da57e1b547a458db31d0b795d4300c0', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:11:39.510' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'a69b68284cb3407a81c7d9a2388b65c9', 77, N'2052fc3d0b514ff3ba6968ae39b202ad', N'952e6c92408d4677b51b8a20308df158', N'01 cái - 38 x 100 (cm)', 700000.0000, N'', N'e0be978d3d0d40b8bdeb0f662eb84ee6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:11:06.507' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'a773544c66d441a0ad11a99381895e35', 202, N'b150c65366424661baf6179261e65df2', N'68456f12b3ca4ee391017d51fbbfc22a', N'160*200 cm', 3500000.0000, N'', N'', NULL, NULL, NULL, NULL, 20, 20, NULL, NULL, 1, CAST(N'2018-10-23T16:31:05.277' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'a88791dcfcfb4cb2b102dcb44d8c0333', 173, N'd986ac16835a4d62baf61dc2ee45c645', N'74cb9a53a356446eb438ea7843c82cda', N'01 cái - 160 x 200 (cm)', 300000.0000, N'', N'd4e79b48f6504b7cbdb856d144e0881e', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T15:27:29.463' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'a954579617564ea0b4a53a8cf85c65dc', 125, N'105d5e183b724f15b689b1f4d98f8757', N'fde15b57ab774a3494e73bb0a1758282', N'38 x 100 ', 138000.0000, N'Cotton', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:24:21.687' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ad283967e6d946db843cd4d4f11cadea', 158, N'8d4e41d756f446a581e27333f117f01c', N'7bb5c1fcd0444336ba0d64132bd2b505', N'160 x 200cm', 2400000.0000, N'', N'', NULL, NULL, NULL, NULL, 9, 9, NULL, NULL, 1, CAST(N'2018-10-08T14:07:24.380' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ad834690744c4f0d90bae60e6a743c2b', 30, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'160 x 195 x 5 (cm)', 2420000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:29.647' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ae851ae6da1f4794a77ad3c24e8378a3', 155, N'374a867f8033425e83daeba41fcc36c2', N'e980d758d5974dfe9b9242742ff89938', N'01 Cái 200 x 220cm', NULL, N'', N'72232ed4c2224e1699964afdd5e7f7cc', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T12:07:35.990' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'b0889d1617764621af03add20bea2419', 182, N'd986ac16835a4d62baf61dc2ee45c645', N'69f32685beaf4458bc9851b523fc6408', N'01 cái - 38 x 100 (cm)	', 400000.0000, N'', N'6573bf2377124daa9f32900c22e9a7a9', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:13:14.787' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'b1b8bd6fa09e40dc82a59f95262e9f63', 163, N'8d4e41d756f446a581e27333f117f01c', N'f68e187066674c18a9e344e54303b630', N'02 Vỏ gối đơn: 47 x 67cm', 400000.0000, N'', N'ad283967e6d946db843cd4d4f11cadea', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T14:57:30.753' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'b318c2fee2c24aae997afb55aa2f331a', 127, N'105d5e183b724f15b689b1f4d98f8757', N'6361de4892344968a249059cdc15984d', N'50 x 50', 78000.0000, N'Cotton', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:25:06.970' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'b3ca4a2597344e00b1be4d72b5a66572', 93, N'6952b3a16adc4e76841f6c016cbe01ad', N'e110c1dbc54c4f288c66d1c3ff48a9e4', N'02 cái - 45 x 65 (cm)	', 470000.0000, N'', N'c34d22e1aa78406fb63f574d62efddd6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:48:07.297' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'b44bcf8ba4124ccc8ac6ca267c03e915', 43, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'180 x 200 x 5 (cm)', 2580000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:07:48.117' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'b725049b5d1c467e8bcb973ba167b5e2', 94, N'6952b3a16adc4e76841f6c016cbe01ad', N'5a5c48b7ef024abc8a73d77e28d7a458', N'01 cái - 38 x 100 (cm)	', 600000.0000, N'', N'c34d22e1aa78406fb63f574d62efddd6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:48:15.550' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ba4fd8c42043478c95b8bd447f9e5273', 76, N'2052fc3d0b514ff3ba6968ae39b202ad', N'818a9e20549b42408acee5f7149acfe4', N'02 cái - 45 x 65 (cm)', 450000.0000, N'', N'e0be978d3d0d40b8bdeb0f662eb84ee6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:10:52.973' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'bb05e5bf6fb1461db47bc74669af30f5', 109, N'ef92dca418f149a9a8fa95543ecdc7f0', N'60c698269ce24cdc85e3c1bda04d12a5', N'01 cái - 160 x 200 (cm)', 1100000.0000, N'', N'96756944065d42fa913ca96051f4da8a', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:43:05.707' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'bd549ee234c144fe9e74b248d33cc214', 56, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'180 x 200 x 25 (cm) ', 7950000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:24:15.727' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'bf304988c71845308d4e333d313119df', 115, N'ef92dca418f149a9a8fa95543ecdc7f0', N'd225f93f0f7e45e895aebf27b920c389', N'01 cái - 180 x 200 (cm)', 760000.0000, N'', N'8ad1f5a3f24d458990d958f66459480a', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:44:21.997' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c084fa93fd20403a9e62d53efbb6effa', 121, N'105d5e183b724f15b689b1f4d98f8757', N'af94b26dd6424953bbe8704cdaf7ac00', N'45 x 65 ', 92000.0000, N' Cotton', NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, 1, CAST(N'2018-10-07T22:15:23.553' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c0c0e85fda374363a6a48572bffc80d2', 205, N'bcaf655eb6a34736b99add7c80b457f4', N'd2bf0e9e11004a9fba4160f0d4c7f110', N'45 x 65', 100000.0000, N'TC', N'', NULL, NULL, NULL, NULL, 15, 15, NULL, NULL, 1, CAST(N'2018-11-06T01:05:42.027' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c239477d52ba44e8a56c2338a45406d4', 167, N'8d4e41d756f446a581e27333f117f01c', N'46bce31abbc441aab425e257ab6a3002', N'01 Chăn xuân thu: 200 x 220cm', 1500000.0000, N'', N'9fd7b43cb5684abdb8d28a20bf75d95f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T15:00:29.873' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c34d22e1aa78406fb63f574d62efddd6', 90, N'6952b3a16adc4e76841f6c016cbe01ad', N'4f2e2251d5c04d55a6d4c8478be02d64', N'160x200 (cm)	', 2870000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, NULL, NULL, 1, CAST(N'2018-10-07T18:14:48.873' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c466f74855554f1da753e85dacdb1b14', 45, N'c706c1fb5bee4a788c77b7ba8f8ed3f2', N'ba01f4880919424f8698f1d48b1e1b13', N'200 x 220 x 5 (cm)', 3340000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, NULL, NULL, 1, CAST(N'2018-10-06T15:08:08.653' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c604a091df0348b3abdd83b44e5b7254', 88, N'6952b3a16adc4e76841f6c016cbe01ad', N'e3b208f277bf4adaae1ca21e2d3de140', N'01 cái - 180 x 200 (cm', 940000.0000, N'', N'd28d3c8d894b4395a3bf4a333890671b', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:47:26.520' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c75408d4c0de4f9a81cf11cd4ff3a0a4', 53, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'160 x 200 x 15 (cm)', 5950000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:23:48.517' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'c7cf8aaf987c4eb39903e7de4a38ed50', 89, N'6952b3a16adc4e76841f6c016cbe01ad', N'e3b208f277bf4adaae1ca21e2d3de140', N'01 cái - 200 x 220 (cm)', 1080000.0000, N'', N'dbef212655964f04bb00eb757f7deecd', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:47:30.943' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ca792a148dc04c588fc30ae8e2c4cabf', 32, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'180 x 200 x 5 (cm)', 2590000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:40.610' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ccaddb6f37f54e02b8fcfa00b0e5ca37', 148, N'374a867f8033425e83daeba41fcc36c2', N'ea489e393bb944cbb324b255da7ed21f', N'01 cái - 47 x 67cm', NULL, N'', N'87499efe4bed4f03869f14a4b58f2915', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T11:46:31.637' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'cd174c1941ea4c89bfdd7a54e0c15d3f', 200, N'649b88137337436fb57b1972667b1c70', N'2546e26c155842748f5d35b6a6b4750f', N'01 Ga bọc: 180 x 200 cm', 450000.0000, N'', N'4e2a6b1e5a8d492989b113f67e7adbbb', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:51:27.290' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'cec5dbf55ab54c96b493a1ce1d8abb92', 138, N'a2597d0247764a6f861846717b5b64c7', N'1fce1280cacc4992a1f5a8d297254d2f', N'180 x 200	', 1000000.0000, N'', N'86a38edd2ab3419da87d7000022b8bb3', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:08:00.597' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd08c1a29c3834667b85938f98213f764', 176, N'd986ac16835a4d62baf61dc2ee45c645', N'0ba5111a50784c0faaa1029321d421bd', N'01 cái - 38 x 100 (cm)', 200000.0000, N'', N'd9c45dae570a4bd3b2d0fe1e2f0beeb7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T16:10:16.523' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd08fbe6f281a4cb1a9ed7526618121b1', 106, N'ef92dca418f149a9a8fa95543ecdc7f0', N'f98e71a705dc46bf81c178eaecc8ace8', N'01 cái - 38 x 100 (cm)', 700000.0000, N'', N'96756944065d42fa913ca96051f4da8a', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:42:55.453' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd097f2b58d004ab2b7408f6e7482278a', 107, N'ef92dca418f149a9a8fa95543ecdc7f0', N'3027bc8c135842f9b77278995fc65c6e', N'200 x 220 (cm)', 1500000.0000, N'', N'96756944065d42fa913ca96051f4da8a', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:43:13.750' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd28d3c8d894b4395a3bf4a333890671b', 82, N'6952b3a16adc4e76841f6c016cbe01ad', N'c0697a9b39cc4e26afc4c8d69226573c', N'180 x 200 (cm)	', 3440000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, NULL, NULL, 1, CAST(N'2018-10-07T18:08:46.763' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd47c061e82274fac87d51bd6d3527818', 67, N'2052fc3d0b514ff3ba6968ae39b202ad', N'94842c94e5774aa2b70b490d7bb5b090', N'01 cái - 160 x 200 (cm)', 1500000.0000, N'', N'06294a807ae6438ab71c5b9f1757e15f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:10:24.057' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd4e79b48f6504b7cbdb856d144e0881e', 169, N'd986ac16835a4d62baf61dc2ee45c645', N'f973ae2ebf50462c91b16287612a88dd', N'160 x 200 (cm)', 1980000.0000, N'', N'', NULL, NULL, NULL, NULL, 20, 20, NULL, NULL, 1, CAST(N'2018-10-08T15:21:31.390' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd514ea87ce2f4d9cad57fa9bb8d027b4', 196, N'649b88137337436fb57b1972667b1c70', N'5885d3425e5640508d92d56e45cf0f70', N' 01 Chăn xuân thu: 200 x 220cm', 1050000.0000, N'', N'223198f7528a4d619580959c8bbcb975', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:42:46.690' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd6ace16ab2bd43d0a30d70635a4fa3fb', 128, N'a2597d0247764a6f861846717b5b64c7', N'159eb36f4ff248eba5bed908b4770e6d', N'150 x 210', 760000.0000, N'Cotton', N'04fadefdeb2b43c4aefd0e0e485f860f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:07:31.273' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd713e953feec4e02b870cf05c85f87bb', 140, N'a2597d0247764a6f861846717b5b64c7', N'4fbf386613604631b10edb14ddf3c6d0', N'150 x 190', 1470000.0000, N'Cotton', N'04fadefdeb2b43c4aefd0e0e485f860f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:08:06.933' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd7c2ace5ca8f4bb7bdeb8bd1242476b0', 50, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'140 x 200 x 15 (cm)', 5390000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:23:02.890' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'd9c45dae570a4bd3b2d0fe1e2f0beeb7', 170, N'd986ac16835a4d62baf61dc2ee45c645', N'f973ae2ebf50462c91b16287612a88dd', N'180 x 200 (cm)', 2100000.0000, N'', N'', NULL, NULL, NULL, NULL, 20, 20, NULL, NULL, 1, CAST(N'2018-10-08T15:21:45.113' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'dbef212655964f04bb00eb757f7deecd', 83, N'6952b3a16adc4e76841f6c016cbe01ad', N'c0697a9b39cc4e26afc4c8d69226573c', N'200 x 220 (cm)', 3580000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, NULL, NULL, 1, CAST(N'2018-10-07T18:09:00.287' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ddd1c74253794eef8f2597da8038ef58', 145, N'374a867f8033425e83daeba41fcc36c2', N'7c2bd16f29b645a0b066868142a545f7', N'160 x 200 (cm)', 1800000.0000, N'', NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-08T11:05:30.297' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'de7e6dc772394d008f1dfde302ef11f5', 206, N'bcaf655eb6a34736b99add7c80b457f4', N'd2bf0e9e11004a9fba4160f0d4c7f110', N'45 x 65', 120000.0000, N'Cotton', N'', NULL, NULL, NULL, NULL, 15, 13, NULL, NULL, 1, CAST(N'2018-11-06T01:06:06.187' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'e08417e25d32473eb6385c3d7d12de66', 23, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'120 x 190 x 5 (cm)', 1815000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:26:33.957' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'e0be978d3d0d40b8bdeb0f662eb84ee6', 62, N'2052fc3d0b514ff3ba6968ae39b202ad', N'f8b8f536efbf4f608bf2fa19179e7763', N'160x200 (cm)', 3450000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-07T11:12:49.730' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'e1ff8eb0b4c84aee83f4ee87e70f9079', 183, N'd986ac16835a4d62baf61dc2ee45c645', N'56ce86d106674a61bfed823b22c00b79', N'01 cái - 160 x 200 (cm)	', 300000.0000, N'', N'6573bf2377124daa9f32900c22e9a7a9', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:14:25.827' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'e2666aed9f5743bfa4432cf0179344df', 166, N'8d4e41d756f446a581e27333f117f01c', N'f68e187066674c18a9e344e54303b630', N'02 Vỏ gối đơn: 47 x 67cm', 400000.0000, N'', N'9fd7b43cb5684abdb8d28a20bf75d95f', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T14:59:22.020' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'e8e9c75819d847a0b457f5aa6e1e661c', 57, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'200 x 220 x 15 (cm)', 7380000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:24:23.760' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'e94a722f03a24d3dbd5710fe1397656c', 80, N'2052fc3d0b514ff3ba6968ae39b202ad', N'cba90459173e4e3da00a28044515f9fe', N'200 x 220 (cm)', 1500000.0000, N'', N'e0be978d3d0d40b8bdeb0f662eb84ee6', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:11:28.953' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ea7433eb87fc4ebb8b8dbe25d2d3fa44', 84, N'6952b3a16adc4e76841f6c016cbe01ad', N'3aa55a50e80448c4822e28e19ea53e93', N'02 cái - 45 x 65 (cm)', 400000.0000, N'', N'06b9db51775d4b7f901f7d708bbb03d7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:47:11.990' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ec48b37f5bc848f68a8111de29ec1fa7', 178, N'd986ac16835a4d62baf61dc2ee45c645', N'74cb9a53a356446eb438ea7843c82cda', N'01 cái - 180 x 200 (cm)', 420000.0000, N'', N'd9c45dae570a4bd3b2d0fe1e2f0beeb7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T16:18:02.170' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ed0609f5dea24552bbf1568b32cadadf', 198, N'649b88137337436fb57b1972667b1c70', N'e5748fdde7a34ebfa36a7e2ccb7f3ea2', N'02 Vỏ gối đơn: 47 x 67cm', 400000.0000, N'', N'4e2a6b1e5a8d492989b113f67e7adbbb', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T18:43:48.943' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ee05989241d44ff8b354abce8057cc98', 73, N'2052fc3d0b514ff3ba6968ae39b202ad', N'94842c94e5774aa2b70b490d7bb5b090', N'01 cái - 200 x 220 (cm)', 1650000.0000, N'', N'58988164f5484b6286a1dca862a29c29', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:10:32.190' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ef5418cb23ab45a6a212d3597310529d', 27, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'150 x 190 x 7 (cm)', 2725000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:11.540' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'ef92b01606324af184a098344713387e', 175, N'd986ac16835a4d62baf61dc2ee45c645', N'9bfff44791004e19a67cfc2172f062aa', N'02 cái - 45 x 65 (cm)', 300000.0000, N'', N'd9c45dae570a4bd3b2d0fe1e2f0beeb7', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T16:09:22.990' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'f0c19904c2274d65b06693db2ebafd0f', 99, N'ef92dca418f149a9a8fa95543ecdc7f0', N'ad5b851c82bc4a92ad8a8e32edcfb1f3', N'160 x 200 (cm)', 3070000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12, NULL, NULL, 1, CAST(N'2018-10-07T18:57:00.230' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'f1594db53935414ba2805c7a1ded5278', 113, N'ef92dca418f149a9a8fa95543ecdc7f0', N'60c698269ce24cdc85e3c1bda04d12a5', N'01 cái - 200 x 220 (cm)', 1210000.0000, N'', N'0bdac7da12dc43899948f0825d984116', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T15:43:38.927' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'f1d203ba32084350899c2f9a804d57c4', 135, N'a2597d0247764a6f861846717b5b64c7', N'5031f0c7cab744ac8caef26a569b0491', N'180 x 210', 700000.0000, N'', N'86a38edd2ab3419da87d7000022b8bb3', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-23T16:07:52.157' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'f229beb9f1db4712a40e7301b26f3a66', 204, N'b150c65366424661baf6179261e65df2', N'69c31820ecce45e59a7f9bc70cc1e3df', N'45*65', NULL, N'', N'd2e605e456aa42678762f6e128d59408', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-20T10:12:25.310' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'f2752438f77347a59a7a5cae2a56d2b5', 184, N'd986ac16835a4d62baf61dc2ee45c645', N'7807ad81bb264d5395d60029d7dfb81d', N'200 x 220 (cm)', 700000.0000, N'', N'6573bf2377124daa9f32900c22e9a7a9', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T17:14:50.323' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'f4b993ee828840d1887bf4623fd7efe0', 31, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'160 x 195 x 7 (cm)', 2940000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:30:36.067' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'f7ed1461c9ae4921a91258b86b43ec11', 54, N'4c52c9d3ae164a2fa85aae61ef18929e', N'591cdf63f6a44c21865a4b3cdaf58f48', N'160 x 200 x 20 (cm) ', 6690000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, NULL, NULL, 1, CAST(N'2018-10-06T16:23:57.197' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'fb25b8132c6e4addb6622fe8879a9cd5', 25, N'423eaa676f704dbaba57152c45e21c09', N'57e620ba8b8e40928d106b610b250243', N'140 x 190 x 5 (cm)', 2185000.0000, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, 1, CAST(N'2018-10-06T14:29:59.730' AS DateTime))
INSERT [dbo].[shSetSize] ([SizeGuid], [SizeId], [ProductGuid], [SectionGuid], [SizeName], [PriceCurrent], [Stuff], [ParentId], [MetaTitle], [Description], [PercentCurrent], [PriceAfterPercents], [Number], [Inventory], [SizeStatus], [SortOrder], [Status], [CreateDate]) VALUES (N'fcffcb65011c40f69793ec23584ea78a', 156, N'374a867f8033425e83daeba41fcc36c2', N'8eddf7dc55ef42b6a55a4ed0a8709289', N' 01 Cái 180 x 200 cm', NULL, N'', N'72232ed4c2224e1699964afdd5e7f7cc', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, CAST(N'2018-10-08T12:07:55.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[shSetSize] OFF
SET IDENTITY_INSERT [dbo].[shSex] ON 

INSERT [dbo].[shSex] ([SexGuid], [SexId], [SexName]) VALUES (N'ae5bf22c-0e6c-45e1-97fa-a3289994c0e1', 1, N'Nam')
INSERT [dbo].[shSex] ([SexGuid], [SexId], [SexName]) VALUES (N'ae5bf22c-0e6c-45e1-97fa-a3289994c0e2', 2, N'Nữ')
SET IDENTITY_INSERT [dbo].[shSex] OFF
SET IDENTITY_INSERT [dbo].[ThongBao] ON 

INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (2, N'Thông báo đơn hàng mới', N'Bạn có đơn hàng mới cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=e71fa38de681499d9cc633c95ca05dfa', N'e71fa38de681499d9cc633c95ca05dfa', N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-05T16:24:34.257' AS DateTime), 1, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (3, N'Thông báo đơn hàng mới', N'Bạn có đơn hàng mới cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=e71fa38de681499d9cc633c95ca05dfa', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-05T16:24:56.780' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (4, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=e71fa38de681499d9cc633c95ca05dfa', NULL, N'THONG_BAO_DON_HANG', 2, 3, CAST(N'2018-11-05T16:37:07.883' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (5, N'Thông báo đơn hàng mới', N'Bạn có đơn hàng mới cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=b49e56ec9ea74b7582939610c3f6158b', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-05T20:36:43.770' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (6, N'Thông báo đơn hàng mới', N'Bạn có đơn hàng mới cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=b49e56ec9ea74b7582939610c3f6158b', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-05T20:36:45.770' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (7, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=b49e56ec9ea74b7582939610c3f6158b', NULL, N'THONG_BAO_DON_HANG', 2, 4, CAST(N'2018-11-05T20:43:53.523' AS DateTime), 1, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (8, N'Thông báo đơn hàng mới', N'Bạn có đơn hàng mới cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=908169341361470b823695c00762e7a6', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-05T20:57:11.293' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (9, N'Thông báo đơn hàng mới', N'Bạn có đơn hàng mới cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=908169341361470b823695c00762e7a6', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-05T20:57:13.457' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (10, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=908169341361470b823695c00762e7a6', NULL, N'THONG_BAO_DON_HANG', 2, 2, CAST(N'2018-11-05T20:58:04.320' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (11, N'Thông báo đơn hàng mới. Người đặt hàng: Mai thị Hoa, giá trị: 1,782,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Mai thị Hoa với đơn hàng tổng giá trị: 1,782,000 lúc: 05/11/2018 22:19. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=f8ce4546e5d34847a31f5873576c4298', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-05T22:19:24.340' AS DateTime), 1, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (12, N'Thông báo đơn hàng mới. Người đặt hàng: Mai thị Hoa, giá trị: 1,782,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Mai thị Hoa với đơn hàng tổng giá trị: 1,782,000 lúc: 05/11/2018 22:19. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=f8ce4546e5d34847a31f5873576c4298', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-05T22:19:24.363' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (13, N'Thông báo đơn hàng mới. Người đặt hàng: Lê Thị Hoa, giá trị: 108,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Lê Thị Hoa với đơn hàng tổng giá trị: 108,000 lúc: 06/11/2018 02:23. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=220afae6dfd742d5baec0ef6b98f3fdb', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:23:23.617' AS DateTime), 1, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (14, N'Thông báo đơn hàng mới. Người đặt hàng: Lê Thị Hoa, giá trị: 108,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Lê Thị Hoa với đơn hàng tổng giá trị: 108,000 lúc: 06/11/2018 02:23. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=220afae6dfd742d5baec0ef6b98f3fdb', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:23:23.910' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (15, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Quỳnh Mai, giá trị: 124,200', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Quỳnh Mai với đơn hàng tổng giá trị: 124,200 lúc: 06/11/2018 02:33. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=9b629e82ebca4f0597ae8bdf52dd324f', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:33:36.740' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (16, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Quỳnh Mai, giá trị: 124,200', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Quỳnh Mai với đơn hàng tổng giá trị: 124,200 lúc: 06/11/2018 02:33. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=9b629e82ebca4f0597ae8bdf52dd324f', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:33:36.773' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (17, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Mạnh Hùng, giá trị: 4,338,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Mạnh Hùng với đơn hàng tổng giá trị: 4,338,000 lúc: 06/11/2018 02:40. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=20fbbbea543c4bd4813a80be2e6622ea', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:40:28.110' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (18, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Mạnh Hùng, giá trị: 4,338,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Mạnh Hùng với đơn hàng tổng giá trị: 4,338,000 lúc: 06/11/2018 02:40. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=20fbbbea543c4bd4813a80be2e6622ea', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:40:28.117' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (19, N'Thông báo đơn hàng mới. Người đặt hàng: Mai Anh Bảo, giá trị: 1,633,500', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Mai Anh Bảo với đơn hàng tổng giá trị: 1,633,500 lúc: 06/11/2018 02:41. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=86ba5990dde54cfaba9df819bff6607f', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:41:27.907' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (20, N'Thông báo đơn hàng mới. Người đặt hàng: Mai Anh Bảo, giá trị: 1,633,500', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Mai Anh Bảo với đơn hàng tổng giá trị: 1,633,500 lúc: 06/11/2018 02:41. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=86ba5990dde54cfaba9df819bff6607f', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:41:27.913' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (21, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Văn An, giá trị: 3,312,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Văn An với đơn hàng tổng giá trị: 3,312,000 lúc: 06/11/2018 02:42. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=6bdd336921c7442aab049ea1fb38915d', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:42:47.963' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (22, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Văn An, giá trị: 3,312,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Văn An với đơn hàng tổng giá trị: 3,312,000 lúc: 06/11/2018 02:42. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=6bdd336921c7442aab049ea1fb38915d', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:42:47.977' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (23, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Văn Điền, giá trị: 3,060,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Văn Điền với đơn hàng tổng giá trị: 3,060,000 lúc: 06/11/2018 02:43. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=50c664c79b814b6ab82b1e5a0be703fc', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:43:53.300' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (24, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Văn Điền, giá trị: 3,060,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Văn Điền với đơn hàng tổng giá trị: 3,060,000 lúc: 06/11/2018 02:43. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=50c664c79b814b6ab82b1e5a0be703fc', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:43:53.307' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (25, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Anh Thắng, giá trị: 1,710,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Anh Thắng với đơn hàng tổng giá trị: 1,710,000 lúc: 06/11/2018 02:46. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=49da0d7e20b8450bbc9986eb9f409282', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:46:16.607' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (26, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Anh Thắng, giá trị: 1,710,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Anh Thắng với đơn hàng tổng giá trị: 1,710,000 lúc: 06/11/2018 02:46. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=49da0d7e20b8450bbc9986eb9f409282', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:46:16.613' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (27, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Văn Điền, giá trị: 2,250,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Văn Điền với đơn hàng tổng giá trị: 2,250,000 lúc: 06/11/2018 02:47. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=ecef9c72c3e142ac894882729069c1a9', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:47:50.053' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (28, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Văn Điền, giá trị: 2,250,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Văn Điền với đơn hàng tổng giá trị: 2,250,000 lúc: 06/11/2018 02:47. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=ecef9c72c3e142ac894882729069c1a9', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:47:50.073' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (29, N'Thông báo đơn hàng mới. Người đặt hàng: Bùi Huy Đức, giá trị: 3,465,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Bùi Huy Đức với đơn hàng tổng giá trị: 3,465,000 lúc: 06/11/2018 02:52. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=7866d886a10f46acba3c9ec0e665f54b', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:52:54.067' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (30, N'Thông báo đơn hàng mới. Người đặt hàng: Bùi Huy Đức, giá trị: 3,465,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Bùi Huy Đức với đơn hàng tổng giá trị: 3,465,000 lúc: 06/11/2018 02:52. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=7866d886a10f46acba3c9ec0e665f54b', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:52:54.103' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (31, N'Thông báo đơn hàng mới. Người đặt hàng: Lê Thị Thắm, giá trị: 3,096,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Lê Thị Thắm với đơn hàng tổng giá trị: 3,096,000 lúc: 06/11/2018 02:55. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=3e316886c6f14dce9fcf4a142eb9b528', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-06T02:55:59.027' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (32, N'Thông báo đơn hàng mới. Người đặt hàng: Lê Thị Thắm, giá trị: 3,096,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Lê Thị Thắm với đơn hàng tổng giá trị: 3,096,000 lúc: 06/11/2018 02:55. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index?s=3e316886c6f14dce9fcf4a142eb9b528', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-06T02:55:59.040' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (33, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=f8ce4546e5d34847a31f5873576c4298', NULL, N'THONG_BAO_DON_HANG', 2, 3, CAST(N'2018-11-06T21:51:20.567' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (34, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=220afae6dfd742d5baec0ef6b98f3fdb', NULL, N'THONG_BAO_DON_HANG', 2, 4, CAST(N'2018-11-06T21:51:28.077' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (35, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=9b629e82ebca4f0597ae8bdf52dd324f', NULL, N'THONG_BAO_DON_HANG', 2, 3, CAST(N'2018-11-06T21:51:34.193' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (36, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=20fbbbea543c4bd4813a80be2e6622ea', NULL, N'THONG_BAO_DON_HANG', 2, 3, CAST(N'2018-11-06T21:51:40.267' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (37, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=86ba5990dde54cfaba9df819bff6607f', NULL, N'THONG_BAO_DON_HANG', 2, 4, CAST(N'2018-11-06T21:51:45.523' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (38, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=6bdd336921c7442aab049ea1fb38915d', NULL, N'THONG_BAO_DON_HANG', 2, 2, CAST(N'2018-11-06T21:51:52.250' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (39, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=50c664c79b814b6ab82b1e5a0be703fc', NULL, N'THONG_BAO_DON_HANG', 2, 2, CAST(N'2018-11-06T21:51:58.807' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (40, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=49da0d7e20b8450bbc9986eb9f409282', NULL, N'THONG_BAO_DON_HANG', 2, 3, CAST(N'2018-11-06T21:52:04.917' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (41, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=ecef9c72c3e142ac894882729069c1a9', NULL, N'THONG_BAO_DON_HANG', 2, 3, CAST(N'2018-11-06T21:52:10.503' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (42, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=7866d886a10f46acba3c9ec0e665f54b', NULL, N'THONG_BAO_DON_HANG', 2, 4, CAST(N'2018-11-06T21:52:15.903' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (43, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=3e316886c6f14dce9fcf4a142eb9b528', NULL, N'THONG_BAO_DON_HANG', 2, 4, CAST(N'2018-11-06T21:52:21.337' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (44, N'Thông báo đơn hàng đang trong quá trình xử lý', N'Đơn hàng của bạn đang trong quá trình vận chuyển. Vui lòng kiểm tra thông tin cá nhân trong quá trình chúng tôi vận chuyển sản phẩm', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DA_XU_LY_DON_HANG', 4, 10013, CAST(N'2018-11-07T00:46:05.707' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (45, N'Thông báo xử lý đơn hàng', N'Đơn hàng của bạn đã được tiếp nhận và xử lý. Nếu có thắc mắc vui lòng liên hệ với quản trị viên để biết thêm chi tiết', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DON_HANG', 4, 10013, CAST(N'2018-11-07T00:46:54.497' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (46, N'Thông báo xử lý đơn hàng', N'Đơn hàng của bạn đã được tiếp nhận và xử lý. Nếu có thắc mắc vui lòng liên hệ với quản trị viên để biết thêm chi tiết', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DON_HANG', 4, 10013, CAST(N'2018-11-07T00:48:03.447' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (47, N'Thông báo xử lý đơn hàng', N'Đơn hàng của bạn đã được tiếp nhận và xử lý. Nếu có thắc mắc vui lòng liên hệ với quản trị viên để biết thêm chi tiết', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DON_HANG', 4, 10013, CAST(N'2018-11-07T00:49:30.033' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (48, N'Thông báo xử lý đơn hàng', N'Đơn hàng của bạn đã được tiếp nhận và xử lý. Nếu có thắc mắc vui lòng liên hệ với quản trị viên để biết thêm chi tiết', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DON_HANG', 4, 10013, CAST(N'2018-11-07T00:56:15.563' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (49, N'Thông báo đơn hàng đang trong quá trình xử lý', N'Đơn hàng của bạn đang trong quá trình vận chuyển. Vui lòng kiểm tra thông tin cá nhân trong quá trình chúng tôi vận chuyển sản phẩm', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DA_XU_LY_DON_HANG', 4, 10013, CAST(N'2018-11-07T00:57:36.293' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (50, N'Thông báo đơn hàng đang trong quá trình xử lý', N'Đơn hàng của bạn đang trong quá trình vận chuyển. Vui lòng kiểm tra thông tin cá nhân trong quá trình chúng tôi vận chuyển sản phẩm', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DA_XU_LY_DON_HANG', 3, 10013, CAST(N'2018-11-07T01:02:17.867' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (51, N'Thông báo xử lý đơn hàng', N'Đơn hàng của bạn đã được tiếp nhận và xử lý. Nếu có thắc mắc vui lòng liên hệ với quản trị viên để biết thêm chi tiết', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DON_HANG', 3, 10013, CAST(N'2018-11-07T01:04:13.010' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (52, N'Thông báo xử lý đơn hàng', N'Đơn hàng của bạn đã được tiếp nhận và xử lý. Nếu có thắc mắc vui lòng liên hệ với quản trị viên để biết thêm chi tiết', NULL, N'3e316886c6f14dce9fcf4a142eb9b528', N'THONG_BAO_DON_HANG', 3, 10013, CAST(N'2018-11-07T01:04:42.690' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (53, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Văn Nghị, giá trị: 2,700,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Văn Nghị với đơn hàng tổng giá trị: 2,700,000 lúc: 15/11/2018 17:03. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=311e11c5308c4ec89946fffbb7aeab10', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-15T17:03:56.667' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (54, N'Thông báo đơn hàng mới. Người đặt hàng: NGuyễn Văn Nghi 15/10, giá trị: 3,312,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: NGuyễn Văn Nghi 15/10 với đơn hàng tổng giá trị: 3,312,000 lúc: 15/11/2018 17:34. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=950f19553b3c45729536221eb44bf068', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-15T17:34:35.720' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (55, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyen Thi Hoa , giá trị: 3,411,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyen Thi Hoa  với đơn hàng tổng giá trị: 3,411,000 lúc: 19/11/2018 12:27. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=e5e14465f6ec4aeaaf485952a6cd3f8f', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-19T12:27:02.947' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (56, N'Thông báo đơn hàng cần xử lý', N'Bạn có đơn hàng cần xử lý. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=e5e14465f6ec4aeaaf485952a6cd3f8f', NULL, N'THONG_BAO_DON_HANG', 2, 3, CAST(N'2018-11-19T12:27:54.797' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (57, N'Thông báo xử lý đơn hàng', N'Đơn hàng của bạn đã được tiếp nhận và xử lý. Nếu có thắc mắc vui lòng liên hệ với quản trị viên để biết thêm chi tiết', NULL, NULL, N'THONG_BAO_DON_HANG', 3, 10013, CAST(N'2018-11-19T12:29:09.667' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (58, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Thị hoàng, giá trị: 2,700,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Thị hoàng với đơn hàng tổng giá trị: 2,700,000 lúc: 23/11/2018 20:53. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=e54ae6b6c6e04ecb9be375670b0c3034', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-23T20:53:01.373' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (59, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Huy Tưởng, giá trị: 3,060,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Huy Tưởng với đơn hàng tổng giá trị: 3,060,000 lúc: 23/11/2018 20:55. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=900a59e691e646cd820d0674f3322c53', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-23T20:55:46.527' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (60, N'Thông báo đơn hàng mới. Người đặt hàng: Nguyễn Thị Yên, giá trị: 3,420,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Nguyễn Thị Yên với đơn hàng tổng giá trị: 3,420,000 lúc: 23/11/2018 21:10. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=84fcc0196f1a41d0b3356ab8c4e8fd11', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-23T21:10:21.217' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (61, N'Thông báo đơn hàng mới. Người đặt hàng: Test, giá trị: 3,420,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Test với đơn hàng tổng giá trị: 3,420,000 lúc: 23/11/2018 21:16. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=d1d6d54d12da47ae91ad7040e918fa81', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-23T21:16:14.257' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (62, N'Thông báo đơn hàng mới. Người đặt hàng: Test, giá trị: 3,420,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Test với đơn hàng tổng giá trị: 3,420,000 lúc: 23/11/2018 21:16. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=d1d6d54d12da47ae91ad7040e918fa81', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 4, CAST(N'2018-11-23T21:16:16.290' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (63, N'Thông báo đơn hàng mới. Người đặt hàng: Test 2, giá trị: 3,420,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Test 2 với đơn hàng tổng giá trị: 3,420,000 lúc: 23/11/2018 21:18. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=c31c72b1e3b94e07a401d29436c6a244', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 2, CAST(N'2018-11-23T21:18:04.900' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (64, N'Thông báo đơn hàng mới. Người đặt hàng: Test 2, giá trị: 3,420,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Test 2 với đơn hàng tổng giá trị: 3,420,000 lúc: 23/11/2018 21:18. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=c31c72b1e3b94e07a401d29436c6a244', NULL, N'THONG_BAO_DON_HANG_MOI', 10013, 3, CAST(N'2018-11-23T21:18:04.920' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (65, N'Thông báo đơn hàng mới. Người đặt hàng: Test 4, giá trị: 3,060,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Test 4 với đơn hàng tổng giá trị: 3,060,000 lúc: 23/11/2018 22:13. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=0f1119d66acb4359b67703db016bb3c5', NULL, N'THONG_BAO_DON_HANG_MOI', NULL, 2, CAST(N'2018-11-23T22:13:24.390' AS DateTime), 0, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoId], [NoiDungThongBao], [NoiDungCongViec], [LienKet], [OrderGuid], [MaLoaiThongBao], [NguoiThongBaoID], [NguoiNhanThongBaoId], [ThoiGian], [DaXem], [GiaTri]) VALUES (66, N'Thông báo đơn hàng mới. Người đặt hàng: Test 4, giá trị: 3,060,000', N'Bạn có đơn hàng mới cần xử lý từ khách hàng: Test 4 với đơn hàng tổng giá trị: 3,060,000 lúc: 23/11/2018 22:13. Vui lòng truy cập hệ thống để xử lý', N'/DanhMuc/Order/Index/s=0f1119d66acb4359b67703db016bb3c5', NULL, N'THONG_BAO_DON_HANG_MOI', NULL, 4, CAST(N'2018-11-23T22:13:27.980' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[ThongBao] OFF
ALTER TABLE [dbo].[LoaiPhieuNhap] ADD  CONSTRAINT [DF_LoaiPhieuNhap_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[LoaiPhieuNhap] ADD  CONSTRAINT [DF_LoaiPhieuNhap_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[qtDepartments] ADD  CONSTRAINT [DF_Departments_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[qtDepartments] ADD  CONSTRAINT [DF_Departments_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[qtPositions] ADD  CONSTRAINT [DF_Positions_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[qtPositions] ADD  CONSTRAINT [DF_Positions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[qtRoles] ADD  CONSTRAINT [DF_Roles_ParentId]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[qtRoles] ADD  CONSTRAINT [DF_Roles_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[qtRoles] ADD  CONSTRAINT [DF_Roles_CreatedDete]  DEFAULT (getdate()) FOR [CreatedDete]
GO
ALTER TABLE [dbo].[qtUnits] ADD  CONSTRAINT [DF_qtUnits_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[qtUnits] ADD  CONSTRAINT [DF_qtUnits_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[qtUserRole] ADD  CONSTRAINT [DF_UserRole_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[qtUserRole] ADD  CONSTRAINT [DF_UserRole_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[qtUsers] ADD  CONSTRAINT [DF_User_Sex]  DEFAULT ((1)) FOR [Sex]
GO
ALTER TABLE [dbo].[qtUsers] ADD  CONSTRAINT [DF_User_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[qtUsers] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[qtUsers] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[shAboutus] ADD  CONSTRAINT [DF_AboutUs_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shAboutus] ADD  CONSTRAINT [DF_AboutUs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shCategory] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shCategory] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[shColor] ADD  CONSTRAINT [DF_shColor_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shColor] ADD  CONSTRAINT [DF_shColor_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shComments] ADD  CONSTRAINT [DF_Comments_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shComments] ADD  CONSTRAINT [DF_Comments_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[shGoodReceiptIsuue] ADD  CONSTRAINT [DF_shGoodReceiptIsuue_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shGoodReceiptIsuue] ADD  CONSTRAINT [DF_shGoodReceiptIsuue_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shGoodReceiptIsuueDetail] ADD  CONSTRAINT [DF_shGoodReceiptIsuueDetail_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shGoodReceiptIsuueDetail] ADD  CONSTRAINT [DF_shGoodReceiptIsuueDetail_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shIdeaCustomer] ADD  CONSTRAINT [DF_IdeaCustomer_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shIdeaCustomer] ADD  CONSTRAINT [DF_IdeaCustomer_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shMembers] ADD  CONSTRAINT [DF_Member_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shMembers] ADD  CONSTRAINT [DF_Member_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shNews] ADD  CONSTRAINT [DF_News_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shNews] ADD  CONSTRAINT [DF_News_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[shOrder] ADD  CONSTRAINT [DF_shOrder_NgayDat]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[shOrder] ADD  CONSTRAINT [DF_shCart_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shOrder] ADD  CONSTRAINT [DF_shCart_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shOrderDetail] ADD  CONSTRAINT [DF_shOrderDetail_NgayDat]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[shOrderDetail] ADD  CONSTRAINT [DF_shCartName_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shOrderDetail] ADD  CONSTRAINT [DF_shCartName_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shOrderHistory] ADD  CONSTRAINT [DF_shOrderHistory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shOrderHistory] ADD  CONSTRAINT [DF_shOrderHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shPrices] ADD  CONSTRAINT [DF_shPrices_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shPrices] ADD  CONSTRAINT [DF_shPrices_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shProductImage] ADD  CONSTRAINT [DF_ProductImage_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shProductImage] ADD  CONSTRAINT [DF_ProductImage_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shProducts] ADD  CONSTRAINT [DF_shProducts_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shProducts] ADD  CONSTRAINT [DF_shProducts_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shProductSet] ADD  CONSTRAINT [DF_shItems_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shProductSet] ADD  CONSTRAINT [DF_shItems_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shSale] ADD  CONSTRAINT [DF_shSale_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
ALTER TABLE [dbo].[shSale] ADD  CONSTRAINT [DF_shSale_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[shSale] ADD  CONSTRAINT [DF_shSale_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shSale] ADD  CONSTRAINT [DF_shSale_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shSaleDetail] ADD  CONSTRAINT [DF_shSaleDetail_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[shSaleDetail] ADD  CONSTRAINT [DF_shSaleDetail_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[shSaleDetail] ADD  CONSTRAINT [DF_shSaleDetail_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shSaleDetail] ADD  CONSTRAINT [DF_shSaleDetail_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[shSetSize] ADD  CONSTRAINT [DF_shSize_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[shSetSize] ADD  CONSTRAINT [DF_shSize_CreateDate_1]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[landDistrict]  WITH CHECK ADD  CONSTRAINT [FK_landDistrict_landProvince] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[landProvince] ([ProvinceId])
GO
ALTER TABLE [dbo].[landDistrict] CHECK CONSTRAINT [FK_landDistrict_landProvince]
GO
ALTER TABLE [dbo].[qtUserRole]  WITH CHECK ADD  CONSTRAINT [FK_qtUserRole_qtDepartments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[qtDepartments] ([DepartmentId])
GO
ALTER TABLE [dbo].[qtUserRole] CHECK CONSTRAINT [FK_qtUserRole_qtDepartments]
GO
ALTER TABLE [dbo].[qtUserRole]  WITH CHECK ADD  CONSTRAINT [FK_qtUserRole_qtPositions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[qtPositions] ([PositionId])
GO
ALTER TABLE [dbo].[qtUserRole] CHECK CONSTRAINT [FK_qtUserRole_qtPositions]
GO
ALTER TABLE [dbo].[qtUserRole]  WITH CHECK ADD  CONSTRAINT [FK_qtUserRole_qtRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[qtRoles] ([RoleId])
GO
ALTER TABLE [dbo].[qtUserRole] CHECK CONSTRAINT [FK_qtUserRole_qtRoles]
GO
ALTER TABLE [dbo].[qtUserRole]  WITH CHECK ADD  CONSTRAINT [FK_qtUserRole_qtUnits] FOREIGN KEY([UnitId])
REFERENCES [dbo].[qtUnits] ([UnitId])
GO
ALTER TABLE [dbo].[qtUserRole] CHECK CONSTRAINT [FK_qtUserRole_qtUnits]
GO
ALTER TABLE [dbo].[qtUsers]  WITH CHECK ADD  CONSTRAINT [FK_qtUsers_qtDepartments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[qtDepartments] ([DepartmentId])
GO
ALTER TABLE [dbo].[qtUsers] CHECK CONSTRAINT [FK_qtUsers_qtDepartments]
GO
ALTER TABLE [dbo].[qtUsers]  WITH CHECK ADD  CONSTRAINT [FK_qtUsers_qtPositions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[qtPositions] ([PositionId])
GO
ALTER TABLE [dbo].[qtUsers] CHECK CONSTRAINT [FK_qtUsers_qtPositions]
GO
ALTER TABLE [dbo].[qtUsers]  WITH CHECK ADD  CONSTRAINT [FK_qtUsers_qtUnits] FOREIGN KEY([UnitId])
REFERENCES [dbo].[qtUnits] ([UnitId])
GO
ALTER TABLE [dbo].[qtUsers] CHECK CONSTRAINT [FK_qtUsers_qtUnits]
GO
ALTER TABLE [dbo].[shAboutus]  WITH CHECK ADD  CONSTRAINT [FK_shAboutus_qtUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[qtUsers] ([UserId])
GO
ALTER TABLE [dbo].[shAboutus] CHECK CONSTRAINT [FK_shAboutus_qtUsers]
GO
ALTER TABLE [dbo].[shCategoryImage]  WITH CHECK ADD  CONSTRAINT [FK_shCategoryImage_shCategory] FOREIGN KEY([CategoryGuid])
REFERENCES [dbo].[shCategory] ([CategoryGuid])
GO
ALTER TABLE [dbo].[shCategoryImage] CHECK CONSTRAINT [FK_shCategoryImage_shCategory]
GO
ALTER TABLE [dbo].[shComments]  WITH CHECK ADD  CONSTRAINT [FK_shComments_shMembers] FOREIGN KEY([MemberGuiId])
REFERENCES [dbo].[shMembers] ([MemberGuiId])
GO
ALTER TABLE [dbo].[shComments] CHECK CONSTRAINT [FK_shComments_shMembers]
GO
ALTER TABLE [dbo].[shComments]  WITH CHECK ADD  CONSTRAINT [FK_shComments_shProducts] FOREIGN KEY([ProductGuid])
REFERENCES [dbo].[shProducts] ([ProductGuid])
GO
ALTER TABLE [dbo].[shComments] CHECK CONSTRAINT [FK_shComments_shProducts]
GO
ALTER TABLE [dbo].[shOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_shOrderDetail_shOrder] FOREIGN KEY([OrderGuid])
REFERENCES [dbo].[shOrder] ([OrderGuid])
GO
ALTER TABLE [dbo].[shOrderDetail] CHECK CONSTRAINT [FK_shOrderDetail_shOrder]
GO
ALTER TABLE [dbo].[shOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_shOrderDetail_shProducts] FOREIGN KEY([ProductGuid])
REFERENCES [dbo].[shProducts] ([ProductGuid])
GO
ALTER TABLE [dbo].[shOrderDetail] CHECK CONSTRAINT [FK_shOrderDetail_shProducts]
GO
ALTER TABLE [dbo].[shOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_shOrderDetail_shSetSize] FOREIGN KEY([SizeGuid])
REFERENCES [dbo].[shSetSize] ([SizeGuid])
GO
ALTER TABLE [dbo].[shOrderDetail] CHECK CONSTRAINT [FK_shOrderDetail_shSetSize]
GO
ALTER TABLE [dbo].[shPrices]  WITH CHECK ADD  CONSTRAINT [FK_shPrices_shSize] FOREIGN KEY([SizeGuid])
REFERENCES [dbo].[shSetSize] ([SizeGuid])
GO
ALTER TABLE [dbo].[shPrices] CHECK CONSTRAINT [FK_shPrices_shSize]
GO
ALTER TABLE [dbo].[shProductImage]  WITH CHECK ADD  CONSTRAINT [FK_shProductImage_shProducts] FOREIGN KEY([ProductGuid])
REFERENCES [dbo].[shProducts] ([ProductGuid])
GO
ALTER TABLE [dbo].[shProductImage] CHECK CONSTRAINT [FK_shProductImage_shProducts]
GO
ALTER TABLE [dbo].[shProducts]  WITH CHECK ADD  CONSTRAINT [FK_shProducts_shCategory] FOREIGN KEY([CategoryGuid])
REFERENCES [dbo].[shCategory] ([CategoryGuid])
GO
ALTER TABLE [dbo].[shProducts] CHECK CONSTRAINT [FK_shProducts_shCategory]
GO
ALTER TABLE [dbo].[shProductSet]  WITH CHECK ADD  CONSTRAINT [FK_shSection_shProducts] FOREIGN KEY([ProductGuid])
REFERENCES [dbo].[shProducts] ([ProductGuid])
GO
ALTER TABLE [dbo].[shProductSet] CHECK CONSTRAINT [FK_shSection_shProducts]
GO
ALTER TABLE [dbo].[shSaleDetail]  WITH CHECK ADD  CONSTRAINT [FK_shSaleDetail_shProducts] FOREIGN KEY([ProductGuid])
REFERENCES [dbo].[shProducts] ([ProductGuid])
GO
ALTER TABLE [dbo].[shSaleDetail] CHECK CONSTRAINT [FK_shSaleDetail_shProducts]
GO
ALTER TABLE [dbo].[shSaleDetail]  WITH CHECK ADD  CONSTRAINT [FK_shSaleDetail_shSale1] FOREIGN KEY([SaleGuid])
REFERENCES [dbo].[shSale] ([SaleGuid])
GO
ALTER TABLE [dbo].[shSaleDetail] CHECK CONSTRAINT [FK_shSaleDetail_shSale1]
GO
ALTER TABLE [dbo].[shSetSize]  WITH CHECK ADD  CONSTRAINT [FK_shSize_shSection] FOREIGN KEY([SectionGuid])
REFERENCES [dbo].[shProductSet] ([SectionGuid])
GO
ALTER TABLE [dbo].[shSetSize] CHECK CONSTRAINT [FK_shSize_shSection]
GO
/****** Object:  StoredProcedure [dbo].[DeleteData_shDanhMuc]    Script Date: 5/27/2019 5:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteData_shDanhMuc]
as
begin
	delete from  shProductImage
	delete from  shSale
	delete from  shSaleDetail
	delete from  shPrices
	delete from  shSize
	delete from  shSection
	delete from  shCategory 
	delete from  shNews 

	delete from  shOrderDetail
	delete from  shOrder 
	delete from  shComments
	delete from  shMembers
	delete from  shProducts
	--delete from  shProductImage
	--delete from  shProducts



--	Declare  @id int 
--set @id = 10

--Declare @val nvarchar(50)
--set @val = '9b3303c5-1252-45fe-a1d4-179b3a80f0c6'

--select * from shCategory
--where ParentId = (
--	select CategoryGuid from shCategory
--	where CategoryId = @id
--)

--select * from shProducts 
--where CategoryGuid =  (
--			select CategoryGuid from shCategory
--			where CategoryId = @id
--		)
	

--update shCategory
--set ParentId = @val
--where CategoryId = 
--		(
--			select CategoryId from shCategory
--			where ParentId = (
--							select CategoryGuid from shCategory
--							where CategoryId = @id
--							)

--		)

--update shCategory
--set CategoryGuid = @val
--where CategoryId = @id












end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 là nhập, 2 là xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoaiPhieuNhap', @level2type=N'COLUMN',@level2name=N'LoaiPhieuNhapXuat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 là giới tính nam, 0 là giới tính nữ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qtUsers', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True là Admin, False là nhân viên ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qtUsers', @level2type=N'COLUMN',@level2name=N'IsAdmin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ký tên ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shAboutus', @level2type=N'COLUMN',@level2name=N'Sign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vị trí của banner 
+ quy định : 
 - 1 là ảnh của tab trang chủ
 -  2 là tab giới thiệu 
 - 3 là tab sản phẩm 
 - 4 là tab đại lý 
 - 5 là tab bảng giá
 - 6 là tab tin tức sự kiện 
 - 7 tab liên hệ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shBanner', @level2type=N'COLUMN',@level2name=N'PositionBanner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thông tin mô tả theo danh mục: ví dụ tham khảo link: https://changagoisonghong.vn/vn/bo-chan-ga-goi-hello-kitty-sh-d18-019.html

Phần mô tả đi kèm: 
- Các sản phẩm trẻ em của May Sông Hồng được sản xuất trên thiết bị hiện đại và giám sát chặt chẽ đảm bảo chất lượng sản phẩm.
- Các sản phẩm trẻ em của May Sông Hồng đều được phun Nano kháng khuẩn, đảm bảo an toàn tuyệt đối cho bà Mẹ và Trẻ em.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shCategory', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Người tạo ra bản ghi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shCategory', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại ảnh : Ví dụ : Ảnh cấu hình hiển thị cho banner , Ảnh cấu hình hiển thị sản phẩm nổi bật ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shCategoryImage', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại ảnh : Ví dụ : Ảnh cấu hình danh mục nổi bật, Ảnh cấu hình hiển thị danh mục nổi bật ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shCategoryImage', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thông tin của khách hàng đánh giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shComments', @level2type=N'COLUMN',@level2name=N'MemberGuiId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id sản phẩm được đánh giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shComments', @level2type=N'COLUMN',@level2name=N'ProductGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên khách hàng đánh giá sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shComments', @level2type=N'COLUMN',@level2name=N'MemberName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo bản ghi ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shComments', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phiếu Nhập hay phiếu Xuất ( 1 là nhập, 2 là xuất )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'Phieu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã phiếu xuất, nhập kho' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'ReceiptIsuueName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tổng số lượng SKU (Phiên bản) trong phiếu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'SKU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên kho nhập - xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'TenKho'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại phiếu : Mua hàng, bán lẻ, bán buôn ...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'LoaiPhieu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã đơn hàng chỉ hiển thị khi phiếu xuất được tạo từ đơn hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'MaDonHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ghi chú trên phiếu. Rê chuột vào biểu tượng sẽ hiển thị ghi chú.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'GhiChu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái của phiếu Nhập - Xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuue', @level2type=N'COLUMN',@level2name=N'TrangThai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phiếu Nhập hay phiếu Xuất ( 1 là nhập, 2 là xuất )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shGoodReceiptIsuueDetail', @level2type=N'COLUMN',@level2name=N'Phieu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tiêu đề của tin tức' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shNews', @level2type=N'COLUMN',@level2name=N'TitleNew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả tiêu đề tin tức' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shNews', @level2type=N'COLUMN',@level2name=N'Descriptions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shNews', @level2type=N'COLUMN',@level2name=N'ImageFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tóm tắt nội dung tin tức' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shNews', @level2type=N'COLUMN',@level2name=N'Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nội dung tin tức' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shNews', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tổng tiền của đơn hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shOrder', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tình trạng đơn hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shOrder', @level2type=N'COLUMN',@level2name=N'OrderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cấu hình tài khoản nhân viên được phân quyền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shOrder', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mặt hàng ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shOrderDetail', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá tiền của mặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shOrderDetail', @level2type=N'COLUMN',@level2name=N'Prices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thành tiền của mặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shOrderDetail', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cấu hình tài khoản nhân viên được phân quyền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shOrderDetail', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chất liệu ảnh ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProductImage', @level2type=N'COLUMN',@level2name=N'ProductImageCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại ảnh : Ví dụ : Ảnh cấu hình hiển thị cho banner , Ảnh cấu hình hiển thị sản phẩm nổi bật ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProductImage', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'ProductName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đường link sẽ bao gồm luôn cả link của category . Ví dụ: /dem/dem-song-hong-102 : 
số 102 chính là id của sản phẩm, ở đây không dùng Guid mà dùng Id ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'MetaTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ảnh đại diện sản phẩm ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả Chi tiết sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hướng dẫn sử dụng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'UserManual'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lưu thông tin của bộ hoàn chỉnh (Bộ hoàn chỉnh bao gồm)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'CompleteSetInclude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá sản phẩm hiện tại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'PriceCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phần trăm khuyến mại hiện tại ( ví dụ : 10 là 10% = 0.1) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'PercentCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá tiền sau khuyến mại sau khi trừ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'PriceAfterPercents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lượt xem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'ViewsProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'ProductStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sản phẩm nổi bật hiển thị trên Carousel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'TopHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'sắp xếp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kích thước sản phẩm hiện tại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'Size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng tồn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProducts', @level2type=N'COLUMN',@level2name=N'Inventory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'sắp xếp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProductSet', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProductSet', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng tồn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProductSet', @level2type=N'COLUMN',@level2name=N'Inventory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái kích thước' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shProductSet', @level2type=N'COLUMN',@level2name=N'ItemStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nội dung Chương trình khuyến mãi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSale', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' có 4 cách tính giá trị khuyến mại:
1. Giảm theo % giá trị
2. Giảm theo số tiền
3. Bán giá cố định
4. Giảm theo khoảng giá trị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSale', @level2type=N'COLUMN',@level2name=N'CachTinhGiaTriKhuyenMai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị giảm tương ứng với cách tính: Là số tiền hoặc số %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSale', @level2type=N'COLUMN',@level2name=N'GiaTri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thời gian bắt đầu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSale', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thời gian kết thúc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSale', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Điều kiện áp dụng khuyến mại: 
1. Cho tất cả các sản phẩm.
2. Áp dụng theo danh mục
3. Áp dụng theo sản phẩm cụ thể 
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSale', @level2type=N'COLUMN',@level2name=N'DieuKienApDung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'5 trạng thái: 
1. Chờ xử lý
2. Đang chạy
3. Tạm dừng
4. Kết thúc
5. Gỡ bỏ
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSale', @level2type=N'COLUMN',@level2name=N'SaleStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' có 4 cách tính giá trị khuyến mại:
1. Giảm theo % giá trị
2. Giảm theo số tiền
3. Bán giá cố định
4. Giảm theo khoảng giá trị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'CachTinhGiaTriKhuyenMai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị giảm tương ứng với cách tính: Là số tiền hoặc số %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'GiaTri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Điều kiện áp dụng khuyến mại: 
1. Cho tất cả các sản phẩm.
2. Áp dụng theo danh mục
3. Áp dụng theo sản phẩm cụ thể 
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'DieuKienApDung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã cấu hình quy định theo điều kiện áp dụng khuyến mại: 
Có 3 mã cấu hình theo điều kiện:
Điều kiện áp dụng : Tất cả các sản phẩm (1) : mã là TatCa
Điều kiện áp dụng : Theo danh mục (2) : mã là DanhMuc
Điều kiện áp dụng : Theo Sản phẩm (3) : mã là SanPham ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'MaCauHinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã cấu hình quy định theo điều kiện áp dụng khuyến mại: 
Có 3 mã cấu hình theo điều kiện:
Điều kiện áp dụng : Tất cả các sản phẩm (1) : mã là TatCa có CategoryGuidProductGuid là TatCaSanPham
Điều kiện áp dụng : Theo danh mục (2) : mã là DanhMuc có CategoryGuidProductGuid là CategoryGuid
Điều kiện áp dụng : Theo Sản phẩm (3) : mã là SanPham  có CategoryGuidProductGuid là ProductGuid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'CategoryGuidProductGuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phần trăm khuyến mại ( ví dụ : 10 là 10% = 0.1)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'Percents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá tiền sau khuyến mại sau khi trừ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'PriceAfterPercents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Khuyến mại phụ đính kèm theo khuyến mại chính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSaleDetail', @level2type=N'COLUMN',@level2name=N'SaleAttach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá sản phẩm hiện tại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'PriceCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chất liệu của sản phẩm: Ví dụ : Vải Contton, vải TC' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'Stuff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phần trăm khuyến mại hiện tại ( ví dụ : 10 là 10% = 0.1), hoặc là số tiền giảm  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'PercentCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá tiền sau khuyến mại sau khi trừ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'PriceAfterPercents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng tồn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'Inventory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái kích thước' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'SizeStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'sắp xếp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSetSize', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giới tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSex', @level2type=N'COLUMN',@level2name=N'SexId'
GO
USE [master]
GO
ALTER DATABASE [C.ShopOnline] SET  READ_WRITE 
GO



