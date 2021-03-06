USE [master]
GO
/****** Object:  Database [TinTucWeb2]    Script Date: 11/23/2016 03:31:00 ******/
CREATE DATABASE [TinTucWeb2] ON  PRIMARY 
( NAME = N'TinTucWeb2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TinTucWeb2.mdf' , SIZE = 3328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TinTucWeb2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TinTucWeb2_log.LDF' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TinTucWeb2] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TinTucWeb2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TinTucWeb2] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TinTucWeb2] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TinTucWeb2] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TinTucWeb2] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TinTucWeb2] SET ARITHABORT OFF
GO
ALTER DATABASE [TinTucWeb2] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TinTucWeb2] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TinTucWeb2] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TinTucWeb2] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TinTucWeb2] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TinTucWeb2] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TinTucWeb2] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TinTucWeb2] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TinTucWeb2] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TinTucWeb2] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TinTucWeb2] SET  ENABLE_BROKER
GO
ALTER DATABASE [TinTucWeb2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TinTucWeb2] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TinTucWeb2] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TinTucWeb2] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TinTucWeb2] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TinTucWeb2] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TinTucWeb2] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TinTucWeb2] SET  READ_WRITE
GO
ALTER DATABASE [TinTucWeb2] SET RECOVERY FULL
GO
ALTER DATABASE [TinTucWeb2] SET  MULTI_USER
GO
ALTER DATABASE [TinTucWeb2] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TinTucWeb2] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TinTucWeb2', N'ON'
GO
USE [TinTucWeb2]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTW] [int] NOT NULL,
	[TenTW] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTW] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (1, N'DangTin', N'Dùng để đăng tin')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (2, N'QLTheLoai', N'Dùng để quản lý thể loại')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (3, N'QLLoaiTin', N'Dùng để quản lý loại tin')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (4, N'AllTin', N'Trang quản lý tất cả tin tức')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (5, N'QLNhanVien', N'Dùng để quản lý nhân viên')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (6, N'EmailDK', N'Dùng để theo dõi các email đăng kí nhận tin mới')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (7, N'PhanHoi', N'Dùng để quản lý các phản hồi')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (8, N'QLVaiTro', N'Dùng để quản lý vai trò ')
INSERT [dbo].[TrangWeb] ([MaTW], [TenTW], [MoTa]) VALUES (9, N'QLPhanQuyen', N'Dùng để quản lý phân quyền nhân viên')
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[idTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](100) NOT NULL,
	[AnhHien] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[idTheLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON
INSERT [dbo].[TheLoai] ([idTheLoai], [TenTheLoai], [AnhHien]) VALUES (1, N'Thể loại Game', N'game.png')
INSERT [dbo].[TheLoai] ([idTheLoai], [TenTheLoai], [AnhHien]) VALUES (2, N'Thể loại Công Nghệ', N'gcbonii5usujou0isozc4sywhztsxeyx-vwaqquxsyqoxujye2nuivoi19vdwsse7nxjhhnp3dfkhmdt8sxbq_DOFO.jpg')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
/****** Object:  Table [dbo].[DSMail]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSMail](
	[idMail] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](30) NOT NULL,
 CONSTRAINT [PK_DSMail] PRIMARY KEY CLUSTERED 
(
	[idMail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DSMail] ON
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (12, N'duytung212121@gmail.com       ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (38, N'ddd@gmail.com                 ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (39, N'ee22@gmail.com                ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (40, N'222@gmail.com                 ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (41, N'klklkl@gmail.com              ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (42, N'hihihii@gmail.com             ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (43, N'dtdtdt@gmail.com              ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (44, N'yuyuyuyu@gmail.com            ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (45, N'opopop2@gmail.com             ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (46, N'9090990@gmail.com             ')
INSERT [dbo].[DSMail] ([idMail], [Email]) VALUES (47, N'012012@gmail.com              ')
SET IDENTITY_INSERT [dbo].[DSMail] OFF
/****** Object:  Table [dbo].[Message]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[idMes] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Mess] [nvarchar](max) NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[idMes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Message] ON
INSERT [dbo].[Message] ([idMes], [Hoten], [Email], [Mess], [TinhTrang]) VALUES (13, N'tung', N'222@gmail.com', N'yuioqwe', NULL)
INSERT [dbo].[Message] ([idMes], [Hoten], [Email], [Mess], [TinhTrang]) VALUES (54, N'eeeeeeeeeeeee2', N'ee22@gmail.com', N'222eee', NULL)
INSERT [dbo].[Message] ([idMes], [Hoten], [Email], [Mess], [TinhTrang]) VALUES (55, N'Nhập họ tên của bạn', N'222@gmail.com', N'Tin nhắn...', NULL)
INSERT [dbo].[Message] ([idMes], [Hoten], [Email], [Mess], [TinhTrang]) VALUES (56, NULL, N'klklkl@gmail.com', NULL, NULL)
INSERT [dbo].[Message] ([idMes], [Hoten], [Email], [Mess], [TinhTrang]) VALUES (57, N'Nhập họ tên của bạn', N'dtdtdt@gmail.com', N'Tin nhắn...', NULL)
SET IDENTITY_INSERT [dbo].[Message] OFF
/****** Object:  Table [dbo].[VaiTro]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVT] [int] IDENTITY(1,1) NOT NULL,
	[TenVT] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_VaiTro_1] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VaiTro] ON
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [MoTa]) VALUES (1, N'Quản lý', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [MoTa]) VALUES (2, N'Nhân viên', NULL)
INSERT [dbo].[VaiTro] ([MaVT], [TenVT], [MoTa]) VALUES (3, N'Trợ lý', NULL)
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaVT] [int] NOT NULL,
	[MaTW] [int] NOT NULL,
	[DuocPhep] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (1, 1, 1, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (2, 1, 2, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (3, 1, 3, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (4, 1, 4, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (5, 1, 5, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (6, 1, 6, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (7, 1, 7, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (8, 1, 8, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (9, 1, 9, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (10, 2, 1, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (11, 2, 2, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (12, 2, 3, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (13, 2, 4, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (14, 2, 5, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (15, 2, 6, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (16, 2, 7, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (17, 2, 8, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (18, 2, 9, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (19, 3, 1, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (20, 3, 2, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (21, 3, 3, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (22, 3, 4, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (23, 3, 5, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (25, 3, 6, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (26, 3, 7, 1)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (27, 3, 8, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaVT], [MaTW], [DuocPhep]) VALUES (28, 3, 9, 0)
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
/****** Object:  Table [dbo].[User]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[idUser] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[MatKhau] [varchar](15) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[DienThoai] [varchar](12) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayDangKi] [date] NOT NULL,
	[idGroup] [int] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[MaVT] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[User] ([idUser], [HoTen], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKi], [idGroup], [NgaySinh], [GioiTinh], [Active], [MaVT]) VALUES (N'1', N'TTV Team', N'a', N'a', N'a', N'a', CAST(0xBA1D0B00 AS Date), 1, CAST(0xBC180B00 AS Date), 1, 1, 3)
INSERT [dbo].[User] ([idUser], [HoTen], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKi], [idGroup], [NgaySinh], [GioiTinh], [Active], [MaVT]) VALUES (N'123', N'123', N'123', N'123', N'123456789', N'123@gmail.com', CAST(0x213C0B00 AS Date), 1, CAST(0x6F1E0B00 AS Date), 0, 0, 3)
INSERT [dbo].[User] ([idUser], [HoTen], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKi], [idGroup], [NgaySinh], [GioiTinh], [Active], [MaVT]) VALUES (N'1234', N'12321', N'123', N'12321', N'12321', N'12321@gmail.com', CAST(0x213C0B00 AS Date), 1, CAST(0xD4230B00 AS Date), 1, 0, 3)
INSERT [dbo].[User] ([idUser], [HoTen], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKi], [idGroup], [NgaySinh], [GioiTinh], [Active], [MaVT]) VALUES (N'2', N'2', N'2', N'2', N'2', N'222@gmail.com', CAST(0x0F3C0B00 AS Date), 1, CAST(0x8D010000 AS Date), 1, 1, 2)
INSERT [dbo].[User] ([idUser], [HoTen], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKi], [idGroup], [NgaySinh], [GioiTinh], [Active], [MaVT]) VALUES (N'3', N'4', N'3', N'4', N'4', N'4@gmail.com', CAST(0x0F3C0B00 AS Date), 1, CAST(0x18030000 AS Date), 1, 0, 2)
INSERT [dbo].[User] ([idUser], [HoTen], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKi], [idGroup], [NgaySinh], [GioiTinh], [Active], [MaVT]) VALUES (N'admin', N'Tui là Admin', N'toantungvu', N'Nhà tui', N'01667372302', N'duytung212121@gmail.com', CAST(0x0F3C0B00 AS Date), 1, CAST(0xE81C0B00 AS Date), 1, 1, 1)
INSERT [dbo].[User] ([idUser], [HoTen], [MatKhau], [DiaChi], [DienThoai], [Email], [NgayDangKi], [idGroup], [NgaySinh], [GioiTinh], [Active], [MaVT]) VALUES (N'ttt', N'ttt', N'ttt', N'ttt', N'12313', N'tttt@gmail.com', CAST(0x213C0B00 AS Date), 1, CAST(0xF7600C00 AS Date), 0, 0, 2)
/****** Object:  Table [dbo].[LoaiTin]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTin](
	[idLoaiTin] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[AnhHien] [nvarchar](100) NOT NULL,
	[idTheLoai] [int] NOT NULL,
 CONSTRAINT [PK_LoaiTin] PRIMARY KEY CLUSTERED 
(
	[idLoaiTin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoaiTin] ON
INSERT [dbo].[LoaiTin] ([idLoaiTin], [Ten], [AnhHien], [idTheLoai]) VALUES (1, N'Tin Game Online', N'chuaco', 1)
INSERT [dbo].[LoaiTin] ([idLoaiTin], [Ten], [AnhHien], [idTheLoai]) VALUES (4, N'Tin Game Offline', N'chuaco', 1)
INSERT [dbo].[LoaiTin] ([idLoaiTin], [Ten], [AnhHien], [idTheLoai]) VALUES (5, N'Tin Công Nghệ Trong Nước', N'chuaco', 2)
INSERT [dbo].[LoaiTin] ([idLoaiTin], [Ten], [AnhHien], [idTheLoai]) VALUES (6, N'Tin Công Nghệ Thế Giới', N'chuaco', 2)
SET IDENTITY_INSERT [dbo].[LoaiTin] OFF
/****** Object:  Table [dbo].[Tin]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tin](
	[idTin] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[TomTat] [nvarchar](100) NOT NULL,
	[urlHinh] [nvarchar](100) NULL,
	[Ngay] [date] NOT NULL,
	[idUser] [varchar](20) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[idLoaiTin] [int] NOT NULL,
	[idTheLoai] [int] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[TinNoiBat] [bit] NOT NULL,
	[AnhHien] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Tin] PRIMARY KEY CLUSTERED 
(
	[idTin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tin] ON
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (6, N'Game không gian bom tấn Fractured Space chính thức mở cửa miễn phí', N'Game online vũ trụ bom tấn Fractured Space đã chính thức mở cửa kinh doanh dưới hình thức miễn phí', N'2.jpg', CAST(0xE53B0B00 AS Date), N'1', N'Như vậy là sau một thời gian mở cửa thử nghiệm thì game online vũ trụ bom tấn Fractured Space đã chính thức mở cửa kinh doanh dưới hình thức miễn phí giờ chơi thông qua hệ thống Steam. Hiện tại game thủ quan tâm cố thể tham khảo thêm tại địa chỉ: http://store.steampowered.com/app/310380/.
Game không gian bom tấn Fractured Space chính thức mở cửa miễn phí
Nếu như bạn chưa biết thì Fractured Space được đánh giá rất cao với đồ họa đẹp mắt cùng lối chơi chiến đấu ấn tượng theo kiểu MOBA, đưa người chơi vào trận đấu đội 5vs5 dựa trên bản đồ sẵn có. Bản đồ này cũng được chia thành 3 lane, và các người chơi khi tham gia vào trận đấu đều có sức mạnh gần như tương đồng lẫn nhau. Trong trận đấu, nhiệm vụ quan trọng nhất của game thủ là hạ gục "Nhà Chính" của phe đối thủ để giành chiến thắng chung cuộc.
Game không gian bom tấn Fractured Space chính thức mở cửa miễn phí
Đồ họa của Fractured Space được xây dựng khá đẹp và ấn tượng. Hình ảnh trong game thực sự rõ nét tạo cho người chơi cảm giác họ đang được thực sự du hành không gian vậy. Không chỉ có vậy, các thiết kế về công trình, tàu chiến đều mang phong cách chân thực, tạo thiện cảm với người chơi ngay từ khi đăng nhập.Cơ chế chiến đấu trong Fractured Space đi theo hướng bắn súng góc nhìn thứ ba. Tuy nhiên, vì tốc độ di chuyển của tàu chiến tương đối chậm nên người chơi sẽ không gặp nhiều khó khăn trong việc điều khiển, cũng như nhắm bắn đối thủ.
Game không gian bom tấn Fractured Space chính thức mở cửa miễn phí
Trong trận đấu, người chơi sẽ không chỉ có nhăm nhăm hạ gục nhà chính của đối thủ mà trước đó, họ sẽ cần tấn công, chiếm các cứ điểm, trạm không gian phụ nằm trên bản đồ. Điều này giúp người chơi tạo được lợi thế không nhỏ để có thể giành chiến thắng.
Trang chủ: https://www.fracturedspace.com', 1, 1, 123, 1, N'222.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (7, N'Thông Thiên Tây Du: Háo hức Liên Server cùng phiên bản Phi Thăng Tiên Giới', N'Trong phiên bản này, nhiều tính năng khủng đã được giới thiệu ', N'3.jpg', CAST(0xE53B0B00 AS Date), N'1', N'Boss Thế Giới
Hệ thống Boss Liên Server “đông vui” dành cho các đẳng cấp 180/240/300/360 sẽ góp phần tạo ra nhiều nguồn vật phẩm quý cùng nhiều chiến trường cạnh tranh khốc liệt hơn. Trong đó, Hệ Thống Tinh Luyện Trang Bị có lẽ là tính năng được nhiều người chờ đợi nhất. Để có thể Tinh Luyện Trang Bị, người chơi phải rất tích cực thu thập nguyên liệu trong phó bản tổ đội mới – Long Cung. Bên cạnh đó, nhiệm vụ Thánh Tăng cũng được mở cho người chơi cấp 200, đồng thời hệ thống Tiên Trận bậc 5 – 10 sao cùng phó bản tương ứng cũng được ra mắt trong bản cập nhật lần này.
Thông Thiên Tây Du: Háo hức Liên Server cùng phiên bản Phi Thăng Tiên Giới
Tiến cấp Cánh – Thú cưỡi
Dành cho những ai đang cần chăm chút cho bộ hay hay thú cưỡi của mình, phiên bản Phi Thăng Tiên Giới mở rộng tiến cấp 10, mang đến diện mạo đỉnh hơn cho trang bị cánh và thú cưỡi. Sau khi tiến cấp, các chỉ số thuộc tính đều tăng cao ngất ngưởng như Sinh Lực, Thủ, Né, Sức bền, Bạo kích, v…v
Thông Thiên Tây Du: Háo hức Liên Server cùng phiên bản Phi Thăng Tiên Giới
Thông Thiên Tây Du: Háo hức Liên Server cùng phiên bản Phi Thăng Tiên Giới
Điện May Mắn
Đúng như tên gọi, đây sẽ là hoạt động ưa thích của những người muốn thử vận may. Người chơi sẽ đổ xí ngầu để nhân vật đi qua các ô của Đại Điện. Số điểm trên mặt xí ngầu sẽ dẫn dắt người chơi đến những ô cửa khác nhau, ẩn chứa nhiều phần quà ngẫu nhiên có giá trị.
Thông Thiên Tây Du: Háo hức Liên Server cùng phiên bản Phi Thăng Tiên Giới - Ảnh 4.
Là tựa game khai thác đề tài Tây Du Kỳ hot nhất hiện nay, Thông Thiên Tây Du không làm người chơi thất vọng khi liên tục tung ra những phiên bản cập nhật độc - đẹp - lạ, mang đến những trải nghiệm đỉnh cao cho cộng đồng người chơi.
Chơi ngay Thông Thiên Tây Du tại: http://td.360game.vn/
Fanpage Thông Thiên Tây Du: https://www.facebook.com/td.360game.vn/', 1, 1, 10, 1, N'333.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (8, N'Paladins khẳng định mình không phải là "Overwatch phiên bản dành cho nhà nghèo"', N'Dĩ nhiên không thể cấm cản nổi cộng đồng game thủ nghĩ rằng Paladins giống như một phiên bản ăn theo', N'4.jpg', CAST(0xE33B0B00 AS Date), N'1', N'Như các bạn đã biết, vào ngày 17/09 vừa qua, game online bắn súng MOBA miễn phí cực hot Paladins đã chính thức mở cửa open beta trên toàn thế giới thông qua hệ thống Steam. Tất nhiên game thủ Việt cũng có thể dễ dàng tham gia thông qua địa chỉ trang chủ: https://www.paladins.com/ hoặc trang steam: http://store.steampowered.com/app/444090/.
Paladins khẳng định mình không phải là "Overwatch phiên bản dành cho nhà nghèo"
Dĩ nhiên không thể cấm cản nổi cộng đồng game thủ nghĩ rằng Paladins giống như một phiên bản ăn theo hoàn toàn miễn phí của Overwatch, tựa game bắn súng làm mưa làm gió trong nhiều tháng qua của Blizzard. Điều này đã khiến cho giám đốc kinh doanh của Hi-Rez Studio, Todd Harris lên tiếng khẳng định lại về vấn đề này:
"Overwatch là một tựa game hay, nhưng nó không phải thứ tạo cảm hứng để làm ra Paladins. Phát triển game là một quá trình tương tác với những ý tưởng đã có từ những dự án game trước đó. Và ở trường hợp của những game bắn súng dạng MOBA, phải khẳng định Team Fortress 2 mới là tựa game đầu tiên và thành công nhất.
Từ hồi 2010 chúng tôi đã ra mắt một tựa game tên Global Agenda lấy cảm hứng từ TF2. Và Paladins được phát triển từ chính tựa game này chứ không phải Overwatch. Chính vì tựa game của Blizzard được quảng cáo quá mạnh nên người ta lầm tưởng chúng tôi sao chép, từ nhân vật mech có khẩu súng 6 nòng là Ruckus, cho đến nhân vật dùng băng để chặn đầu kẻ địch là Evie,..."
Paladins khẳng định mình không phải là "Overwatch phiên bản dành cho nhà nghèo"
Paladins là một game online bắn súng FPS miễn phí đến từ hãng Hi-Rez – những người đã tạo nên Smite, Tribes: Ascend và Global Agenda. Trong thời gian qua, chúng ta đã thấy sự phát triển của các game bắn súng bằng việc đưa nhiều lớp nhân vật vào trong game như Battleborn, Dirty Bomb và thành công nhất là Overwatch đến từ Blizzard.
Về cơ bản thì lối chơi của Paladins rất giống với Overwatch hay Team Fortress 2 khi game thủ cũng lựa chọn một tướng thuộc class nhất định và được ''thả'' vào bản đồ để đấu đá với nhau theo kiểu MOBA điển hình. Nhiệm vụ của người chơi là chiếm các cứ điểm cần thiết trên map, sau đó tiến vào tiêu diệt căn cứ của team địch và tất nhiên là bảo vệ thành lũy phe mình.
Paladins khẳng định mình không phải là "Overwatch phiên bản dành cho nhà nghèo"
Ngay cả cách điều khiển nhân vật theo góc nhìn thứ nhất, di chuyển bằng các nút A, W, S, D, tấn công cơ bản bằng chuột trái, dùng skill bằng các nút Q, F, E, chuột phải... cũng gần như giống hệt với Overwatch. Tất nhiên, Paladins cũng có những khác biệt đặc trưng về skill, nhân vật cũng như map, độ giật của súng ống, hay đồ đạc của nhân vật. Song về cơ bản lối chơi thì 2 sản phẩm này có sự tương đồng cực lớn và rõ ràng game thủ có thể nhận ra chỉ qua một vài đoạn video gameplay.', 1, 1, 13, 0, N'444.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (9, N'Riders of Icarus đã có 1 triệu người đăng ký, bạn chơi chưa?', N'Riders of Icarus chứng minh mình là một trong những game online hot nhất hiện nay trên thế giới.', N'5.jpg', CAST(0xE33B0B00 AS Date), N'1', N'Tựa game online cưỡi rồng bay lượn Riders of Icarus đã mở cửa hồi tháng 7 vừa rồi và từng được rất nhiều game thủ Việt quan tâm bởi nền tảng đồ hoạ 3D khá ấn tượng và đặc biệt là gameplay thú vị, nhất là khi được cưỡi trên các loài sinh vật huyền bí để chiến đấu với lũ quái vật khổng lồ.

Riders of Icarus - Official Accolades Trailer.
Mới đây, trò chơi này đã công bố có được tới 1 triệu lượt đăng ký và chứng minh mình là một trong những game online hot nhất hiện nay trên thế giới. Những game thủ Việt quan tâm có thể dễ dàng đăng ký tài khoản cũng như download game tại trang chủ: http://icarus.nexon.net/en. Tuy nhiên khi cài đặt xong thì việc tham gia chơi tương đối phức tạp bởi NEXON đã khoá IP Việt Nam và mọi người sẽ phải fake IP sang khu vực khác để vào được thế giới ảo.
Riders of Icarus đã có 1 triệu người đăng ký, bạn chơi chưa?
Khi mới vào chơi thì Riders of Icarus đem tới 5 class cho game thủ lựa chọn bao gồm Berserker, Guardian, Assassin, Priest và Wizard có độ khó được sắp xếp từ dễ tới rất khó, cùng với đó là 2 giới tính nam và nữ. Người chơi sau đó sẽ đặt tên cho nhân vật của mình và điều chỉnh ngoại hình theo ý muốn, chúng ta có thể chọn các mẫu có sẵn hoặc tự tạo ra, tương đối phong phú.
Riders of Icarus đã có 1 triệu người đăng ký, bạn chơi chưa?
Về cơ bản thì trò chơi vận hành theo kiểu cổ điển poin and click, ngay cả khi chuyển sang chế độ hành động thì vẫn không thể tuyệt vời như các game action với cơ chế chiến đấu non-target được. Tuy nhiên việc điều khiển dễ dàng sẽ đem tới trải nghiệm chiến đấu trên không thú vị hơn, điều mà một game đánh không mục tiêu rất khó làm được.
Đồ hoạ 3D trong Riders of Icarus tương đối đẹp mắt nếu được đẩy lên cao nhất, do hạn chế về mặt cấu hình nên tôi đã phải hạ xuống thấp. Tuy vậy thì hình ảnh vẫn rất dễ nhìn, nhân vật chuyển động mượt mà kể cả khi di chuyển lẫn ra đòn.', 1, 1, 13, 1, N'555.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (10, N'Thiết Giáp Hùng Binh - Game 3D chiến trường cổ đại đồ họa khủng, hỗ trợ cả VR', N'Từ ngày 29 tháng 9 năm 2016, Thiết Giáp Hùng Binh sẽ đi vào giai đoạn thử nghiệm ', N'6.jpg', CAST(0xE23B0B00 AS Date), N'1', N'Thiết Giáp Hùng Binh (tên tiếng Anh: Blood of Steel) là một game online 3D thuộc thể loại MOBA có đề tài lịch sử được phát triển bởi Evolutio Studio trực thuộc YC Game. Trò chơi gây ấn tượng mạnh thông qua nền đồ họa chất lượng và chân thực được phát triển bằng bộ enine Evolution tự nghiên cứu, mang tới một đấu trường hoành tráng theo phong cách chiến tranh cổ đại, giúp người chơi có được trải nghiệm xông pha trận địa, hóa thân thành những danh tướng của cả phương Đông lẫn phương Tây.

Thiết Giáp Hùng Binh - Trailer
Lấy lịch sử làm gốc nhưng trò chơi không hề tạo dựng cốt truyện bám sát theo một nguyên tác lịch sử nào cả, thay vào đó là đưa vào những yếu tố hư cấu, đồng lúc sử dụng cả bối cảnh phương Tây và phương Đông. Trong đó, người chơi sẽ được chứng kiến những cuộc giao tranh không tưởng giữa các viên tướng, đội quân nổi danh thời Tam Quốc đối đầu với các tư lệnh cùng đội quân Thập Tự Chinh hùng mạnh. Mỗi bên quân sẽ có sự khác biệt lớn về khả năng chiến đấu và tính chiến thuật, đội hình.
Thiết Giáp Hùng Binh - Game 3D chiến trường cổ đại đồ họa khủng, hỗ trợ cả VR
Đồng thời, Thiết Giáp Hùng Binh hứa hẹn sẽ mang tới cho người trải nghiệm một nền tảng đồ họa ưu việt, tân tiến phù hợp với tiêu chuẩn thời đại mới bằng bộ engine tự nghiên cứu. Ở đó, hệ thống các nhân vật và quân binh có tạo hình hết sức chân thực, có độ tinh xảo tới từng chi tiết khuôn mặt, y phục, giáp trụ hay vũ khí. Phong cách thiết kế mỹ thuật trong game phải nói rất đáng khen, có độ tỉ mỉ cao và thể hiện được đặc điểm văn hóa của hai thời đại hoàn toàn khác biệt.
Thiết Giáp Hùng Binh - Game 3D chiến trường cổ đại đồ họa khủng, hỗ trợ cả VR
Các bản đồ trận địa được xây dựng rộng lớn, hùng vĩ với nhiều kiểu môi trường khác nhau, đầy đủ những yếu tố về trường thành, rào chắn lẫn những dạng công cụ chiến tranh cổ đại. Đặc biệt, trò chơi có áp dụng công nghệ motion-capture để đem tới sự mượt mà, uyển chuyển cho cử động nhân vật, kết hợp tương tác vật lí và âm thanh sinh động.
Thiết Giáp Hùng Binh - Game 3D chiến trường cổ đại đồ họa khủng, hỗ trợ cả VR
Trên phương diện nội dung gameplay, trò chơi sử dụng hình thức chiến đấu quy mô quân đoàn, mỗi viên tướng chỉ huy sẽ dẫn đầu một binh chủng, mỗi binh chủng sẽ có đặc điểm và kỹ nghệ chiến đấu riêng, người chơi vừa có điều khiển riêng lẻ chủ tướng lại vừa có thể ra lệnh cho binh lính đứng vào trận thế, tấn công hay phòng ngự theo ý muốn.
Thiết Giáp Hùng Binh - Game 3D chiến trường cổ đại đồ họa khủng, hỗ trợ cả VR
Nhờ vậy, tính chiến thuật trong game phải nói là vô cùng biến hóa, người chơi cần nắm được cách thức sắp xếp hợp lí và hỗ trợ hợp lí để giành lấy lợi thế trước đối phương. Trước mắt, hệ thống danh tướng và binh chủng cũng tương đối đa dạng với đủ kiểu vũ khí cung, kiếm thuẫn, trường thương, kỵ sĩ… Ngoài ra, trò chơi cũng hé lộ bí mật rằng phiên bản trải nghiệm thực tế VR đang trong giai đoạn nghiên cứu và sẽ được mở ra sau này.
Thiết Giáp Hùng Binh - Game 3D chiến trường cổ đại đồ họa khủng, hỗ trợ cả VR
Từ ngày 29 tháng 9 năm 2016, Thiết Giáp Hùng Binh sẽ đi vào giai đoạn thử nghiệm giới hạn lần đầu tiên ở thị trường Trung Quốc và đang nhận sự chú ý của giới chuyên môn lẫn game thủ.', 1, 1, 2, 1, N'666.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (11, N'Hybrid Wars - Game bắn súng siêu hot sắp mở cửa ngày 29/9', N'Game bắn súng góc nhìn từ trên xuống hết sức ấn tượng là Hybrid Wars', N'7.jpg', CAST(0xE23B0B00 AS Date), N'1', N'Mới đây hãng Wargaming đã giới thiệu tựa game bắn súng góc nhìn từ trên xuống hết sức ấn tượng là Hybrid Wars, trò chơi đã được ấn định sẽ mở cửa vào ngày 29/9 tới đây thông qua hệ thống Steam. Những game thủ quan tâm có thể tham khảo thêm tại địa chỉ trang chủ: http://hybridwars.net/ hoặc http://store.steampowered.com/app/411540.
Hybrid Wars - Game bắn súng siêu hot sắp mở cửa ngày 29/9
Hybrid Wars sẽ đưa game thủ tới một thế giới tương lai đang ngập chìm trong chiến tranh và nhiệm vụ của game thủ là điều khiển các loại robot, khí tài quân sự như xe tăng, máy bay đi tiêu diệt các đợt sóng quân địch đang tiến tới căn cứ. Nhìn chung game thủ sẽ chọn 1 trong 3 loại ''hero'', có khả năng bắn súng, dùng skill... và chiến đấu chống lại 50 loại quân địch tại 8 cứ điểm vô cùng rộng lớn.

Hybrid Wars Gameplay Trailer.
Mỗi hero trong game đều có vũ khí chính khác nhau đi kèm với các loại vũ khí chiến thuật rất lợi hại. Ngoài ra họ còn có các các bộ giáp robot xịn được thả trên trời xuống với khả năng cận chiến mạnh cùng giáp rất khoẻ để chống lại hoả lực địch.
Hybrid Wars - Game bắn súng siêu hot sắp mở cửa ngày 29/9
Về cơ bản thì Hybrid Wars cho phép bạn chơi một mình chống lại các thế lực thù địch, nhưng phần chơi thú vị nhất chính là phối hợp co-op với các đồng đội trên mạng để cùng tiêu diệt tất cả đối thủ mạnh mẽ, kiếm các loại đồ xịn và nâng cấp hero của mình.
Hybrid Wars có giá 17,99 USD (tương đương khoảng 400 ngàn đồng) cho bản thường và bản xịn là 19,99 USD (tương đương khoảng 450 ngàn đồng).', 1, 1, 5, 1, N'777.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (12, N'Super Mario Maker không có đồ họa 3D', N'Nhà phát triển game Super Mario Maker tiết lộ rằng trò chơi sẽ không tận dụng hết các chức năng 3D', N'8.jpg', CAST(0xC13B0B00 AS Date), N'1', N'Wii U đã không thực sự nổi bật kể từ khi được phát hành nhưng mặc dù vậy nó vẫn có một số trò chơi đặc sắc, một trong số đó là Super Mario Maker. Cũng không có gì ngạc nhiên khi Nintendo mang trò chơi này vào các thiết bị cầm tay nổi tiếng của mình như Wii U và Nintendo 3DS.

Super Mario Maker không có đồ họa 3D - ảnh 1

Một trong những điểm chính thu hút của Nintendo 3DS là khả năng chơi game 3D không cần kính hay tai nghe cồng kềnh thế nhưng Super Mario Maker lại không hỗ trợ các tính năng này. Thông tin này xuất phát từ một đơn đặt hàng trước qua trang web Canadian EB Games, tại đây nêu rõ trò chơi chỉ có thể chơi được trên định dạng 2D.

Super Mario Maker 3DS chưa được xác định ngày ra mắt trong vài tháng tới nhưng cũng không thể chắc chắc thông tin trên có chính xác hay không. Nintendo chưa từng thông báo chính thức liệu trò chơi chỉ có thể chơi ở định dạng 2D cũng không đưa ra bất kỳ lí do nào cho sự lựa chọn này. Tuy nhiên việc giữ trò chơi ở định dạng 2D dễ dàng hơn việc xây dựng lại một trò chơi 3D thông qua màn hình lập thể của 3DS.

>>> Đón đọc tin game mới, game hay tại các chuyên mục Game online, Game mobile, Game offline

Những người chơi yêu thích Super Mario Maker bởi khả năng tạo ra mỗi cấp phụ có thể sẽ không thấy quá phiên nếu trò chơi thiếu đi những chức năng 3D thế nhưng phiên bản 3DS lại thiếu khá nhiều. Không giống như phiên bản Wii U, người chơi không dễ dàng truy cập vào các course của người chơi khác, các course ID không nằm trong phiên bản 3DS của trò chơi, course ID chỉ chia sẻ được khi có kết nối wifi.

Super Mario Maker không có đồ họa 3D - ảnh 2

Thật khó để nói tại sao Nintendo lại chọn làm bản 3DS của Super Mario Maker chỉ khả dụng cho nền tảng 2D nhưng có thể những sức mạnh của 3DS lại chính là nguyên nhân. Người chơi có thể tạo ra các khóa học từ Super Mario Maker với các thử thách bẫy, quái vật và hiệu ứng. Có thể nhà phát triển nhận thấy rằng 3DS không thể xử lý tốt khi game thủ muốn xây dựng khóa học lên một cấp độ cao hơn do vậy họ chỉ phát triển game ở định dạng 2D.

Việc Super Mario Maker chỉ có định dạng 2D có thể làm ảnh hưởng tới không ít fan hâm mộ nhất là đối với những người đang trông đợi vào sự đột phá của trò chơi trên nền tảng 3D. Ấn định sẽ ra vào ngày 2/12 năm nay trên Nintendo 3DS, cho tới khi có những thông báo chính thức từ phía nhà phát triển, hi vọng Super Mario Maker sẽ không làm người chơi thất vọng.', 4, 1, 1, 0, N'888.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (13, N'Hí hửng hé lộ gameplay, Metal Gear Survive bị game thủ "nhấn chìm" trong dislike', N'Phản ứng của các fan sau khi "chiêm ngưỡng" gameplay và hình ảnh của Metal Gear Survive rất dữ dội', N'9.jpg', CAST(0xE23B0B00 AS Date), N'1', N'Lần đầu tiên công bố tại sự kiện Gamescom 2016, phần tiếp theo của series game kinh điển Metal Gear được mang tên Metal Gear Survive đã nhận phải nhiều sự hoài nghi của cộng đồng game thủ, nhất là sau sự ra đi của "cha đẻ" Hideo Kojima.

Trước đó, KONAMI đã phát biểu rất tự tin khi cho biết sẽ họ tạo ra nhiều hơn những sản phẩm tiếp theo của thương hiệu Metal Gear khi vẫn nắm trong tay nhóm phát triển cũ của Metal Gear Solid V: The Phantom Pain - sản phẩm đã giúp hãng game Nhật Bản này bội thu trong năm 2015 vừa qua. Thông tin này đã khiến cho rất nhiều game thủ đặt kỳ vọng vào Metal Gear Survive sẽ tiếp nối được thành công của những người tiền nhiệm mà không cần đến bàn tay của Hideo Kojima.



Tuy nhiên, tại sự kiện Tokyo Game Show được tổ chức mới đây, những hình ảnh và gameplay của Metal Gear Survive đã khiến cho rất nhiều người chơi không khỏi thất vọng khi thay đổi hoàn toàn những yếu tố đã làm nên thành công của series game kinh điển này. Được biết, thay vì bám sát lối chơi hành động lén lút và cốt truyện xoay quanh yếu tố chính trị giống như những sản phẩm trước đó, KONAMI đã khiến cho tất cả không khỏi "tăng xông" khi biến Metal Gear Survive trở thành một tựa game zombie chiến đấu co-op được thiết lập trong thời gian ảo.

Rõ ràng sự thay đổi này của KONAMI với Metal Gear Survive đã xóa sạch hoàn toàn những dấu vết của Hideo Kojima khỏi series game offline kinh điển này. Phản ứng của các fan hâm mộ sau khi "chiêm ngưỡng" gameplay và hình ảnh của Metal Gear Survive tại Tokyo Game Show là vô cùng dữ dội. Thậm chí, đoạn video hé lộ gameplay của tựa game mới này trên Youtube cũng đã bị game thủ "nhấn chìm" với hơn 14 nghìn lượt dislike cùng hàng loạt bình luận tiêu cực khác.', 4, 1, 2, 0, N'999.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (14, N'Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt', N'Có lẽ phải rất lâu rồi, kể từ sau 7554, chúng ta mới được nhìn thấy một tựa game “cây nhà lá vườn”', N'10.jpg', CAST(0x943B0B00 AS Date), N'1', N'Hiker Games Studio (tiền thân Emobi Games) có lẽ là một cái tên vẫn còn khá xa lạ với nhiều game thủ Việt, rất ít người biết rằng studio này sắp trình làng một tựa game Việt có tên “ Toy Odyssey: The Lost and Found" lên Steam, Xbox One và PS4. Bước chân ra làng game thế giới có thể coi là một bước tiến vô cùng lớn và cũng vô cùng mạo hiểm của bất cứ nhà phát triển game Việt nào. Vậy lí do "điên rồ" nào đã thôi thúc những con người đến từ Hiker Games Studio tự tin với sản phẩm này đến như vậy?

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 1

Toy Odyssey với hy vọng viết tiếp câu chuyện thần kỳ...

Hẳn chúng ta đã từng biết đến 7554, một sản phẩm “made in Việt Nam” dám đi đầu, dám thử thách và dám mạo hiểm. Và câu chuyện thường không đẹp như các bộ phim Hàn Quốc, 7554 đã “chết” trên chính mảnh đất nơi nó sinh ra. Nó vô tình trở thành một đòn giáng mạnh vào tâm lí những người đi sau khi muốn bắt tay vào phát triển một sản phẩm game offline Việt đúng nghĩa. Sau nhiều năm, kể từ cái kết “không ngoài dự đoán” của 7554, chưa có một nhà phát triển nào dám mạo hiểm bước chân vào thị trường game offline đầy bon chen này... cho đến khi cái tên Toy Odyssey xuất hiện.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 2

... mà người chiến binh 7554 còn viết dang dở

Không thực sự dễ dàng, Toy Odyssey đã phải mất tới 3 năm để phát triển với rất nhiều thăng trầm, không có quá nhiều người kì vọng rằng tựa game này sẽ thực sự làm nên điều kì tích. Thế nhưng, ngay khi vừa được cầm trên tay phiên bản thử nghiệm của tựa game này, chúng tôi đã không khỏi ngạc nhiên đến mức phải tự hỏi: “ Đây thực sự là một tựa game do người Việt làm sao?”. Câu hỏi đó khiến cho BBT Infogame không thể kìm lòng được mà ngay lập tức muốn đặt tay xuống và viết nên tất cả những gì cảm nhận được về trò chơi này.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 3

Toy Odyssey là một tựa game platform màn hình ngang truyền thống, nếu so với 7554 thì Toy Odyssey lại chỉ có một nền tảng đồ họa 2D đơn thuần và một lối chơi khá đơn giản. Đây có lẽ là một điều tốt, với một lối chơi thuần chất platform, người chơi sẽ dễ dàng để tiếp cận với game hơn, đồ họa đơn giản nhưng chưa bao giờ lỗi thời chắc chắn sẽ là một hướng đi rất khôn ngoan. Việc Hiker Games Studio lựa chọn một cái tên tiếng Anh và sử dụng thứ ngôn ngữ này trong game có lẽ là lựa chọn sáng suốt nếu muốn đưa tựa game này dấn sâu hơn vào thị trường game thế giới.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 4

Ngay khi bước chân vào game, người chơi sẽ được trải nghiệm một cảm giác rất khó tả. Nó là sự pha trộn giữa cảm giác đợi chờ đầy hồi hộp, đôi chút lo lắng với những gì diễn ra xung quanh và sự phấn khích với một cốt truyện đầy tiềm năng. Người chơi sẽ được xem một đoạn phim cắt cảnh ngắn được vẽ bằng tay cực kì tỉ mỉ. Chỉ cần nhìn qua thôi người chơi cũng cảm thấy ở đó sự cố gắng và nỗ lực hết mình của những họa sĩ đến từ Hiker Games Studio. Đoạn cắt cảnh diễn ra không quá nhanh cũng không quá chậm, đủ để người xem tự hiểu dù không có bất cứ câu thoại nào.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 5

Bối cảnh trong game nói về một gia đình mới chuyển về sống trong một căn biệt thự ở vùng ngoại ô, đó là một gia đình có vẻ khá hạnh phúc và họ dường như rất hài lòng với ngôi nhà mới của mình. Cậu con trai trong gia đình có tên là Felix, cậu trông có vẻ lớn hơn đám trẻ cùng tuổi nhưng vẫn thích chơi đồ chơi như chúng. Cậu có một con người gỗ đồ chơi tên là Brand và tất nhiên, cậu rất yêu quý món đồ chơi của mình. Nếu đã từng xem qua bộ phim hoạt hình Toy Story, chắc chắn người đọc sẽ hiểu chuyện gì rồi sẽ xảy ra tiếp theo.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 6

Khi màn đêm buông xuống, khi mọi thứ chìm vào tĩnh lặng, khi Felix chìm sâu vào giấc ngủ, một ánh sáng xanh lóe lên và từ đây, Brand - chú người gỗ tí hon – bỗng nhiên sống dậy. Sơ qua về cốt truyện như vậy, Toy Odyssey không hẳn có một cốt truyện quá sức đột phá nhưng vẫn đủ hấp dẫn và kích thích trí tò mò của người chơi. Tại sao cậu lại sống dậy? Tại sao các món đồ chơi trong căn nhà này lại thù địch đến thế? Tại sao các căn phòng lại tự thay hình đổi dạng? Sự thật đằng sau tấm màn bí ẩn này là gì? Tại sao chủ nhân Felix của cậu lại luôn gặp những cơn ác mộng hàng đêm? Quá nhiều câu hỏi để người chơi tự khám phá.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 7

Brand là nhân vật trung tâm, cũng là nhân vật người chơi điều khiển chính trong tất cả các sự kiện trong game. Là một món đồ chơi “sống”, Brand vẫn luôn thắc về lí do cho sự tồn tại của mình, tất nhiên là game sẽ không thể để cho anh chàng này cô đơn mãi được. Cậu ta có một người bạn cộng sự tí hon có tên Buck, một con đom đom xanh đa sự. Buck có nhiệm vụ soi sáng đường đi cho Brand và đôi khi còn nắm vai trò người hướng dẫn nữa.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 8

Có lẽ đọc đến đây, người xem sẽ thấy đôi nét tương đồng giữa Toy Odyssey với The Child of Light của hãng Ubisoft. Cùng với bối cảnh và âm nhạc, không khó để thấy rằng Toy Odyssey là sự kết hợp, học hỏi và phát triển từ những sản phẩm đi trước như Limbo, The Child of Light hay Ori and Blind Forest. Có lẽ chính bởi như thế, chúng tôi đã rất nhanh chóng cảm thấy những nét quen thuộc trong đó và rất dễ dàng để làm quen được với chúng.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 9

Là một game platform, Toy Odyssey sẽ đưa người chơi khám phá căn nhà, thế giới tưởng như không lớn mà lại lớn không tưởng. Là một fan của Metroid và Castlevania, chúng tôi không khỏi phấn khích khi được chơi một tựa game có cách xây dựng bản đồ thú vị đến như vậy. Bằng một thuật toán nào đó, các căn phòng trong căn nhà liên tục thay đổi mỗi khi một ngày trôi qua. Nó khiến cho người chơi luôn trong cảm giác vừa tò mò, vừa lo sợ “lạc đường”.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 10

Vì game diễn ra đa phần vào buổi tối nên hầu như ngoài căn phòng chính ra, thật khó để tìm được một ánh đèn ngoài màn đêm luôn bủa vây và chỉ có mỗi chú đom đóm Buck là mang tới chút ánh sáng hi vọng. Ngoài mảng đồ họa 2D được chau chuốt tỉ mỉ, không thể không kể đến âm nhạc của game. Không biết tìm được một từ nào để miêu tả ngoài hai chữ “xuất sắc”. Có thể nói, thứ làm nên trải nghiệm tuyệt nhất trong Toy Odyssey chính là âm nhạc của game. Từ những bản nhạc nền đầy ma mị và ám ảnh, cả những âm thanh cót két của ván gỗ, cho tới tiếng lách cách rợn lưng của những món đồ chơi khác đang ẩn náu đâu đó. Tất cả đã tạo ra một “bức tranh giao hưởng” vô cùng hoàn mĩ mang tên Toy Odyssey.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 11

Để khám phá thế giới rộng lớn trong game, Brand luôn phải có những món vũ khí “đồ chơi” trong tay để giúp cậu thoải mái hơn khi khám phá thế giới. Với những người bạn đồ chơi tốt bụng xung quanh, Brand có thể nâng cấp trang phục trên người, chế tạo nguyên liệu, vũ khí, nhận hàng loạt nhiệm vụ và mở khóa những kĩ năng đặc biệt. Nhìn chung, gameplay của Toy Odyssay không phải là quá đột phá nhưng vẫn đủ hấp dẫn để người chơi dành hàng chục giờ khám phá căn nhà và tìm ra câu trả lời cho hàng loạt sự kiện bí ẩn diễn ra tại nơi đây.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 12

Nếu nói rằng Toy Odyssey là một tựa game Việt xuất sắc thì không hẳn là đúng, xét về góc nhìn của một game thủ, Toy Odyssey vẫn thiếu khá nhiều điểm để khiến người chơi cảm thấy thực sự hấp dẫn. Đầu tiên có thể kể đến hệ thống điều khiển trong game khá “tù”. Không rõ có phải là cố ý hay không nhưng phải nói rằng hệ thống nút trong game thực sự quá tệ. Việc điều khiển nhân vật với hệ thống nút mặc định đôi khi còn khó khăn hơn cả cái gameplay và đa phần người chơi sẽ phải tự cài lại nút nếu không muôn ngón tay phải chạy khắp bàn phím.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 13

Kế đến có lẽ phải kể đến là cách xây dựng bản đồ, dù các món đồ trong các căn phòng đều được làm rất tỉ mỉ và trau chuốt nhưng chính vì thế lại khiến chúng trở thành những “cái bẫy”. Brand có thể chạy nhảy trên những món đồ trong phòng nhưng chỗ đó có đứng được hay không thì lại là vấn đề khác, đôi khi chỗ tưởng như đứng được thì hóa ra chỉ để “làm cảnh”. Chính vì thế, việc người chơi ngã lộn cổ vài chục lần chỉ vì không phân biệt được chỗ nào có thể đứng và chỗ nào không sẽ khiến người chơi đôi lúc cảm thấy khá khó chịu nếu không muốn nói là ức chế vì có thể chết oan rất nhiều lần.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 14

Nếu âm nhạc là điểm cộng lớn cho game thì khâu lồng tiếng lại là điểm trừ rất lớn, các đoạn hội thoại được người lồng tiếng nói với tốc độ rất nhanh. Nhân vật chính Brand dường như sở trường không phải là tiếng Anh nên các câu thoại của anh chàng này rất “chán”, với chất giọng eo éo như con gái, cộng thêm tốc độ rap ngang Eminem và tông giọng đều đều như một sẽ khiến nhiều người chơi buộc lòng phải skip nhanh các đoạn hội thoại của anh chàng này.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 15

Tính năng chiến đấu trong game không quá đặc sắc, các đòn đánh của Brand khá là đơn điệu nếu không muốn nói là đơn giản quá mức. Các món vũ khí có vẻ nhiều nhưng không thực sự tạo nên điểm nhấn và đôi lúc sẽ gây cảm giác buồn ngủ nếu chơi một thời gian dài. Chúng tôi khá hi vọng vào sự kết hợp của 2 người bạn Brand và Buck giống như cặp đôi tuyệt vời Aurora và Igniculus đã làm trong The Child of Light. Thế nhưng, đáng tiếc là điều đó không hề xảy ra.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 16

Đa phần, người chơi chỉ nhìn thấy một Brand lang thang trong đêm tối, mò mẫm và chặt chém mọi thứ cậu nhìn thấy. Sự tồn tại của Buck hầu như sẽ bị lãng quên sau khoảng 10 phút chơi vì ngoài soi sáng đường đi ra, cậu chẳng có tác dụng nào khác. Những nhân vật khác trong game cũng rất mờ nhạt, người chơi có lẽ cũng sẽ chẳng thực sự nhớ được tên những người bạn của Brand dù rằng xét theo một góc độ nào đó, họ rất hữu ích cho anh chàng này.

Đánh giá Toy Odyssey: The Lost and Found - Ngôi sao hi vọng của làng game Việt - ảnh 17

Nếu bỏ qua những tiểu tiết nhỏ trên thì Toy Odyssey thực sự là một tựa game sáng giá của làng game Việt, một “Ngôi sao hi vọng” đúng nghĩa. Với một sự khởi đầu tốt, Toy Odyssey hy vọng sẽ là con tàu mở đường cho ngành công nghiệp game Việt Nam khi bước chân ra thị trường thế giới. Tất nhiên, việc liệu Toy Odyssey: The Lost and Found và những sản phẩm game khác sẽ ra mắt trong tương lai của Việt Nam có đủ tầm sánh ngang với các sản phẩm quốc tế hay không, câu trả lời đến từ sự ủng hộ của chính chúng ta, những người Việt nên dùng hàng Việt Nam.', 4, 1, 1, 0, N'1000.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (15, N'Người hâm mộ tiếc nuối khi The Last Guardian lại trì hoãn ngày ra mắt', N'The Last Guardian, 1 trong những tựa game đáng chơi nhất trong mùa thu năm nay ', N'11.jpg', CAST(0xDE3A0B00 AS Date), N'1', N'The Last Guardian sẽ lại bị trì hoãn một lần nữa, cụ thể thì thời điểm phát hành mới sẽ là vào ngày 6/12 ở Mỹ, 7/12 ở Châu Âu và 9/12 tại Anh và Ireland.

Viết trên blog PlayStation, chủ tịch SCE toàn cầu Shuhel Yoshida đã giải thích lý do cho sự chậm trễ này.

Người hâm mộ tiếc nuối khi The Last Guardian lại trì hoãn ngày ra mắt - ảnh 1

“ Sự trì hoãn lần này là một quyết định khó khăn, đặc biệt là với một trò chơi như The Last Guardian. Chúng tôi đã gặp phải nhiều lỗi hơn so với dự tính ở giai đoạn cuối của công đoạn phát triển.”

Để đảm bảo rằng The Last Guardian sẽ cho người chơi những trải nghiệm sáng tạo mà trò chơi đã hứa hẹn từ trước nên chúng tôi cần phải mất thêm thời gian để hoàn thiện các vấn đề.”

>> Đọc thêm tin game mới tại chuyên mục Game Offline.

Fumito Ueda thuộc genDesign Nhật Bản có một hướng nhìn đầy lạc quan cho chất lượng của The Last Guardian sắp tới. “ Đó sẽ là một hành trình xúc động của tình bạn và lòng tin, và chúng tôi cũng muốn gửi đi một trải nghiệm đặc biệt nhất có thể dành cho các fan hâm mộ, những người đã hỗ trợ chúng tôi trong suốt một thời gian dài.”

Người hâm mộ tiếc nuối khi The Last Guardian lại trì hoãn ngày ra mắt - ảnh 2

Hoạt cảnh và lối chơi nhìn qua của The Last Guardian khiến chúng ta liên tưởng tới một trò chơi kinh điển của hệ máy PS2 xưa cũ là Shadow of the Colossus. Sự tương đồng xuất phát từ chuyện cả 2 Game đều được thiết kế bởi nhân vật nổi tiếng Furnito Ueda. Game thuộc thể loại nhập vai hành động trong một thế giới rộng lớn.

The Last Guardian hứa hẹn sẽ mang lại cảm giác “không tưởng” ở mọi khía cạnh và là 1 trong 3 game đáng mua nhất trong mùa thu năm nay dành cho những ai sở hữu PS4.

The Last Guardian ban đầu được dự kiến phát hành vào ngày 25/10/2016 và được liệt vào danh sách top 39 tựa game lớn nhất trên mọi nền tảng sẽ được ra mắt trong thời gian còn lại của năm 2016. Để khiến cho các fan đỡ tiếc rẻ, chúng ta hãy cùng tới 1 với đoạn clip mới về trò chơi.', 4, 1, 1, 1, N'1100.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (16, N'Ra mắt bản Demo miễn phí của FIFA 17', N'Demo game bóng đá FIFA 17 vừa chính thức ra mắt trên các thiết bị CONSOLE và PC', N'12.jpg', CAST(0xD23B0B00 AS Date), N'1', N'Trong bản trailer trước đây, nhà phát triển game hàng đầu thế giới EA Sports từng hé lộ một chế độ chơi mới trong tựa game offline con cưng của mình. Trong bản demo lần này, bạn sẽ được trải nghiệm chế độ mới rất đáng mong đợi đó.

Chế độ chơi mới được dựa theo cốt truyện hoàn toàn mới có tên gọi “ The Journey”. Trong The Journey, người chơi sẽ vào vai Alex Hunter, một cầu thủ trẻ tài năng của câu lạc bộ Manchester United. Bạn sẽ trải nghiệm cuộc sống của cầu thủ này với tất cả những thăng trầm mà cậu gặp phải. Tuy nhiên, phiên bản demo sẽ chỉ cung cấp một số nội dung cho bạn thử nghiệm.

Ra mắt bản Demo miễn phí của FIFA 17 - ảnh 1

Song song với chế độ chơi game mới là chế độ kick off quen thuộc. Người chơi có thể bắt đầu trận đấu ngay để trải nghiệm đồ họa, âm thanh, game play mới của phiên bản năm nay. Bạn sẽ điều khiển 1 trong 12 đội bóng nổi tiếng trên khắp thế giới là Manchester United, Manchester City, Chelsea, Real Madrid, Juventes, Inter Milan, PSG, Olympique Lyonnais, Seattle Sounders, Bayern Munchen, Tigers U.A.N.L và một câu lạc bộ tới từ J1, giải đấu mà EA Sports mới giành được bản quyền, Gamba Osaka.

>>> Xem thêm thông tin game về những game mới, game hay nhất tại chuyên mục GAME OFFLINE

Trong phiên bản demo của FIFA 17, nhà sản xuất EA Sports sẽ đem tới 3 sân vận động chính là Century Link, Stamford Bridge và Suita City Football Stadium.

Ra mắt bản Demo miễn phí của FIFA 17 - ảnh 2

Trong một diễn biến khác, lần đầu tiên sau nhiều năm của dòng game mô phỏng đá bóng thì Lionel Messi (tiền đạo, chỉ số chung 93) không còn là cầu thủ có chỉ số tốt nhất. Có lẽ sau một mùa giải thăng hoa dành được cả Champion League lẫn cup châu Âu Euro, ngôi sao Cristiano Ronaldo (tiền đạo, chỉ số chung 94) đã trở thành cầu thủ có chỉ số cao nhất.

Nếu là một fan của bóng đá nói chung, fan FIFA nói riêng bạn nên thử ngay bản demo này của FIFA 17.

Ra mắt bản Demo miễn phí của FIFA 17 - ảnh 3

Bản demo cũng như bản chính thức của FIFA 17 sẽ yêu cầu cấu hình như sau:

Minimum Specifications – Cấu hình tối thiểu

OS: Windows 7/8.1/10 – 64-Bit

CPU: Intel Core i3-2100 @ 3.1GHz or AMD Phenom II X4 965 @ 3.4 GHz

RAM: 8GB

Hard Drive Space Required: 50.0 GB

Minimum Supported Video Cards: NVIDIA GTX 460 or AMD Radeon R7 260

DirectX: 11.0

Recommended Specifications – Cấu hình đề nghị

OS: Windows 7/8.1/10 – 64-Bit

CPU: Intel i5-3550K @ 3.40GHz or AMD FX 8150 @ 3.6GHz

RAM: 8GB

Hard Drive Space Required: 50.0 GB

Minimum Supported Video Cards: NVIDIA GTX 660 or AMD Radeon R9 270

DirectX: 11.0

Ra mắt bản Demo miễn phí của FIFA 17 - ảnh 4

Phiên bản chính thức của FIFA 17 sẽ được ra mắt vào ngày 27/09 với giá 60$ (1,3 triệu VNĐ) cho phiên bản tiêu chuẩn và 120$ (2,6 triệu VNĐ) cho phiên bản nâng cao.', 4, 1, 1, 0, N'1200.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (17, N'Game nhập vai chiến thuật Halcyon 6 chính thức ra mắt', N'Game indie khoa học viễn tưởng Halcyon 6 mới phát hành thời gian gần đây', N'13.jpg', CAST(0xC73B0B00 AS Date), N'1', N'Khi Halcyon 6: Starbase Commander mới được ra mắt, Massive Damage đã khẳng định “ Our work is just beginning”. Ám chỉ rằng những gì họ làm mới chỉ là bước khởi đầu. Đội ngũ phát triển vẫn đang nỗ lực để đem lại nhiều điều thú vị hơn cho game thủ thông qua trò chơi này.

Game nhập vai chiến thuật Halcyon 6 chính thức ra mắt - ảnh 1

Là một tựa game khoa học viễn tưởng mang tính chiến lược, game nhập vai Halcyon 6: Starbase Commander nhận được khá nhiều lời khen từ khi có trailer ra mắt đầu tiên. Game thủ tỏ ra khá mong chờ sản phẩm này được tung ra thị trường. Mặc dù đã có mặt trên Steam Early Access được vài tháng nhưng Halcyon 6 mới chính thức ra mắt vào 9/9 vừa qua. Hiện tại trò chơi đang giảm giá 15% mừng ngày phát hành.

>>> Đón đọc các tin game mới, game hay tại các chuyên mục Game Online, Game Offline

Halcyon 6: Starbase Commander là một tựa game nhập vai, game chiến lược khoa học viễn tưởng theo kiểu retro, pha trộn độc đáo giữa việc xây dựng cơ sở, chiến thuật chiến đấu, quản lý phi hành đoàn và cấp cứu. Theo như nhà phát triển Massive Damage, trò chơi được lấy cảm hứng từ những câu chuyện cũ, từ Master of Orion, Star Control cho tới X-COM. Kết hợp giữa sự hiện đại và cô điển, Halcyon 6 đem đến một điều gì đó khá mới mẻ thu hút người chơi.

Game nhập vai chiến thuật Halcyon 6 chính thức ra mắt - ảnh 2

Với những chiến thuật cung cấp cho người chơi, game thủ sẽ dễ dàng chìm đắm vào những trận chiến trong Halcyon 6. Hiện tại game đã chính thức có mặt trên PC và vẫn đang được giảm giá 15%.', 4, 1, 1, 0, N'1300.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (18, N'Fan vui mừng khi Dragon Ball Xenoverse 2 hé lộ quá nhiều hình ảnh mới', N'2 ngày gần đây, những người hâm mộ của Dragon Ball tỏ ra vui mừng', N'14.jpg', CAST(0xB33B0B00 AS Date), N'1', N'Sự vui sướng này kéo dài kể từ thời điểm cả đoạn trailer 5 của Dragon Ball Xenoverse 2 xuất hiện tại Tokyo Game Show vừa qua. Tuy vậy ở thời điểm này thì mọi người mới chính thức được thưởng thức nó ở dạng phiên bản tiếng Anh giúp dễ nghe và dễ cảm nhận hơn.



Tiếp tới đó là sự phô diễn những khung hình ấn tượng thể hiện được sức mạnh của dòng máy Next Gen. Chúng bao gồm hình ảnh của Super Saiyan Blue Goku, Super Saiyan Blue Vegeta, Golden Frieza, Mecha Cooler, First Form Frieza, Nail, Conton City trong chế độ online, và một đoạn mở đầu hướng dẫn của các chế độ khác như Masters Milk Delivery Training, Patroller Academy, Time Patrol rankings online, và một nhiệm vụ tại Turtle Stone Hunting.



>> Đọc thêm tin game mới tại chuyên mục Game Offline.

Tiếp tới, các fan sẽ được chứng kiến 4 đoạn giới thiệu cốt truyện mới được cập nhật trên website. Đoạn phim đầu tiên ở phía dưới cho thấy sự xuất hiện Time Patroller của Xenoverse 1, Time Patroller của Xenoverse 2, Supreme Kai of Time, Elder Kai, và Time Patrol Trunks tại Time Nest. Ở phút 1:38 thì các cảnh được chuyển sang các chuỗi phim bao gồm Mira, Towa, Time Breaker Bardock, Turles, và Lord Slug.



Đoạn phim cốt truyện thứ 2 lại là màn so tài giữa Time Patroller và Lord Slug. Time Patrol Trunks, Dodoria, và Frieza Saga Vegeta cũng xuất hiện trong đây.



Đoạn phim thứ 3 đã tái hiện lại cuộc chạm trán của đoàn người Trái Đất của Gohan với 2 tay sai của Frieza đại đế là Zarbon và Dodoria.



Thêm một đoạn phim cuối cùng được hé lộ chính là sự kiện Vegeta đánh bại Dodoria tại Namec.



5 đoạn phim được tung ra của Dragon Ball Xenoverse 2 có lẽ đã làm hài lòng đa số những ai luôn yêu thích và dành sự quan tâm cho những dòng game Dragon Ball. Dragon Ball Xenoverse kể từ lúc ra mắt đã được đánh giá như một trong những game hay nhất về chủ đề này. Trò chơi có sự pha trộn của các yếu tố chơi nhập vai cùng đối kháng quen thuộc. Các độc giả hãy đón đọc những tin tức mới nhất trên Infogame.', 4, 1, 1, 0, N'1400.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (19, N'Sam Media bị phạt 55 triệu đồng vì "móc túi" người dùng hơn 230 tỷ', N'Thanh tra Sở TT&TT cho biết Công ty Sam Media đã âm thầm “móc túi” tổng số tiền  230,5 tỷ đồng.', N'15.jpg', CAST(0xAE3B0B00 AS Date), N'1', N'Hôm qua (19/9), Thanh tra Sở Thông tin và Truyền thông thành phố Hà Nội đã công bố kết quả thanh tra hoạt động kinh doanh dịch vụ nội dung thông tin trên mạng viễn thông di động đối với Công ty Sam Media (tên nước ngoài là Sam Media Limited).
Theo kết quả thanh tra, văn phòng đại diện Sam Media tại Hà Nội đã thực hiện một số nhiệm vụ theo sự phân công, ủy quyền của Công ty Sam Media để triển khai hoạt động hợp tác kinh doanh với 3 công ty tại Việt Nam gồm Công ty Cổ phần Đầu tư ACOM, Công ty Cổ phần Truyền thông VMG và Công ty Cổ phần Truyền thông Gapit cung cấp dịch vụ nội dung thông tin trên mạng viễn thông di động qua các đầu số tin nhắn ngắn.

Sau khi ký kết hợp đồng hợp tác, Công ty Sam Media đã tổ chức hoạt động quảng cáo trúng thưởng máy điện thoại, máy tính bảng, thẻ điện thoại trên Internet với phương thức quảng cáo sử dụng Landing Page (trang đích). Theo đó, toàn bộ công đoạn quảng cáo từ khách hàng đến trang đích của Công ty Sam Media (có tên miền là vn-mozzi.biz/vn) do đối tác có thương hiệu AVAZU tổ chức thực hiện với mô hình mạng quảng cáo, vì vậy, việc mua, bán dịch vụ quảng cáo được thực hiện qua các giao dịch điện tử.

Các nội dung quảng cáo trúng thưởng máy điện thoại, máy tính bảng, thẻ điện thoại do AVAZU tổ chức thực hiện được thiết kế có dạng là các biểu tượng của các sản phẩm này và các câu hỏi vui để người dùng tham gia trả lời, làm theo cùng với những câu từ kích thích sự hấp dẫn của các giải thưởng vật chất. Với thời gian xuất hiện ngắn, hình thức và địa chỉ quảng cáo liên tục được thay đổi nên khó lưu lại được các nội dung quảng cáo này.

Ngoài ra, trên trang đích, phần do Công ty Sam Media thực hiện, phần trên của giao diện màn hình là các khối hình minh họa và nội dung về các ưu điểm của dịch vụ, thông tin về các giải thưởng, mã lệnh đăng ký dịch vụ, hướng dẫn nhập mã đăng ký dịch vụ có kích thước và cỡ chữ rất lớn, phần dưới chân màn hình là nội dung về thể lệ của chương trình khuyến mại, cách hủy dịch vụ, số điện thoại hỗ trợ khách hàng và giá cước của dịch vụ với cỡ chữ nhỏ hơn nhiều so với phần trên.

Thông qua phương thức tiếp cận khách hàng như trên, từ tháng 1/2013 đến tháng 3/2016 khách hàng của 4 nhà mạng viễn thông Viettel, Mobifone, Vinaphone và Vietnamobile đã phải chi trả với với tổng số tiền là 230.484.062.000 đồng (gần 230,5 tỷ đồng). Số lượng khách hàng sử dụng dịch vụ tại thời điểm ngày 19/7/2016 là 93.735 khách hàng, trong đó, nhiều khách hàng khi được hỏi đều không biết mình đang sử dụng dịch vụ bị trừ tiền do Công ty Sam Media hợp tác với 3 công ty của Việt Nam cung cấp và cho rằng các tin nhắn gửi từ các đầu số đến máy điện thoại của họ hàng ngày là các tin rác mà không biết đây là các tin nhắn dịch vụ mất tiền .

Sau khi kết thúc thanh tra, Thanh tra Sở đã tiến hành xử phạt vi phạm hành chính Công ty Sam Media về 2 hành vi như sau:

- Đối với hành vi "Thiết lập website thương mại điện tử bán hàng (vn-mozzi.biz/vn) mà không thông báo với cơ quan quản lý nhà nước có thẩm quyền theo quy định", Thanh tra Sở Thông tin và Truyền thông Hà Nội quyết định xử phạt Công ty Sam Media số tiền là: 30.000.000 đồng theo quy định tại Điểm a Khoản 3 Điều 81 Nghị định 185/2013/NĐ-CP ngày 15/11/3013 của Chính phủ, quy định xử phạt vi phạm hành chính trong hoạt động thương mại, sản xuất, buôn bán hàng giả, hàng cấm và bảo vệ quyền lợi người tiêu dùng, được sửa đổi, bổ sung tại Nghị định 124/2015/NĐ-CP.

- Đối với hành vi "Cung cấp thông tin về dịch vụ nội dung qua tin nhắn trên trang vn-mozzi.biz/vn, nhưng thông tin giá, giá cước hiển thị không cùng kiểu mã lệnh và có kích thước nhỏ hơn 2/3 kích thước của mã lệnh", Thanh tra Sở Thông tin và Truyền thông Hà Nội quyết định xử phạt Công ty Sam Media số tiền là: 25.000.000 đồng, theo quy định tại Điểm đ Khoản 2 Điều 61 Nghị định 174/2013/NĐ-CP, ngày 13/11/2013 của Chính phủ, quy định xử phạt vi phạm hành chính trong lĩnh vực bưu chính, viễn thông, công nghệ thông tin và tần số vô tuyến điện.

Như vậy, tổng số tiền xử phạt hành chính đối với 2 hành vi vi phạm của Công ty Sam Media là 55 triệu đồng. Ngoài ra, để bảo vệ quyền lợi của người tiêu dùng, Thanh tra Sở Thông tin và Truyền thông thành phố Hà Nội cũng kiến nghị Bộ Thông tin và Truyền thông chỉ đạo các doanh nghiệp của Việt Nam có liên quan thực hiện thông báo ngay cho các khách hàng hiện có trên hệ thống được biết khách hàng đang sử dụng dịch vụ mất tiền qua các đầu số và chỉ được tiếp tục cung cấp dịch vụ khi khách hàng đồng ý đăng ký gia hạn dịch vụ theo đúng quy định tại Khoản 3 Điều 7 Thông tư 17/2016/TT-BTTTT.', 5, 2, 12, 0, N'1500.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (20, N'Shock: Lumia 525 giảm giá còn 800.000 đồng', N'Theo thông tin chúng tôi mới nhận được, đã chính thức giảm giá sốc cho Lumia 525 chỉ còn 799.000đ', N'16.jpg', CAST(0x943B0B00 AS Date), N'1', N'Do Lumia 525 đã ra mắt từ cuối năm 2013, chắc chắn đây là động thái xả hàng tồn từ phía . Hiện tại qua tham khảo website , máy chỉ còn ba màu là đen, trắng và vàng. Một số màu sắc độc như xanh biển hay đỏ không còn hàng để người dùng lựa chọn.



Lumia 525 sở hữu chip Snapdragon S4 hai nhân, RAM 1GB, bộ nhớ trong 8GB (hỗ trợ thẻ nhớ), màn hình 4 inch độ phân giải 480x800, camera 5MP và pin 1430mAh. Máy chạy hệ điều hành Windows Phone 8.1 và sẽ không được nâng cấp lên Windows 10 Mobile. Thực tế, Lumia 525 chính là Lumia 520 được nâng cấp RAM từ 512MB lên 1GB.

Shock: Lumia 525 giảm giá còn 800.000 đồng

Mặc dù có cấu hình khá hạn chế, nhưng so với mức giá này, Lumia 525 vẫn là sự lựa chọn rất đáng giá. Nhờ vào sự tối ưu hóa của hệ điều hành Windows Phone, máy chạy vẫn khá mượt mà, dù kho ứng dụng còn hạn chế. Tuy nhiên với đa số nhu cầu của người dùng cơ bản như nghe gọi, nhắn tin, lướt web, nghe nhạc, dùng Facebook, Zalo... máy vẫn đáp ứng tốt. Đây sẽ là sự lựa chọn tuyệt vời dành cho các bạn học sinh, sinh viên với điều kiện tài chính hạn chế, hay cho những ai muốn mua một chiếc máy phụ '' chống cháy '' nhỏ gọn và có độ ổn định cao.

Bạn đọc có thể tham khảo và đặt mua Lumia 525 đang bán tại qua đường link này. Do đây hứa hẹn sẽ là một sản phẩm rất hot, các bạn nên nhanh tay liên hệ đặt mua trước khi hết hàng.', 5, 2, 3, 1, N'1600.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (21, N'Bkav lọt Top 10 “Hàng Việt tốt - Dịch vụ hoàn hảo” 2016', N'Đây là lần thứ 2 liên tiếp Bkav được người tiêu dùng bình chọn và nhận được danh hiệu này.', N'17.jpg', CAST(0x9E3B0B00 AS Date), N'1', N'Là sự kiện do Hội Tiêu chuẩn & Bảo vệ Người tiêu dùng Việt Nam tổ chức, Ủy ban Kinh tế của Quốc hội bảo trợ, lễ vinh danh và trao chứng nhận chương trình khảo sát và bình chọn “Hàng Việt tốt – Dịch vụ hoàn hảo – Sản phẩm tin cậy năm 2016” vừa được tổ chức tại Hà Nội vào ngày 4/9/2016.

Chương trình khảo sát và bình chọn này được tổ chức với mục đích lựa chọn ra những sản phẩm, dịch vụ có chất lượng tốt, uy tín đối với người tiêu dùng của doanh nghiệp sản xuất trên cả nước. Các sản phẩm, dịch vụ đáp ứng các tiêu chí cơ bản: chất lượng tốt, uy tín cao đối với người tiêu dùng, không vi phạm về sở hữu trí tuệ, rõ nguồn gốc xuất sứ, thân thiện với môi trường, có sức cạnh tranh cao…sẽ được cấp chứng nhận là hàng Việt tốt - Dịch vụ hoàn hảo - Sản phẩm tin cậy; qua đó giúp người tiêu dùng nhận biết được các sản phẩm, dịch vụ đạt chất lượng tốt phù hợp với nhu cầu và sức khỏe của người Việt.

Trong danh sách Top 10 “Hàng Việt tốt - Dịch vụ hoàn hảo - Sản phẩm tin cậy” năm nay còn có các thương hiệu Tổng công ty Truyền hình Cáp Việt Nam, Tổng công ty Chè Việt Nam, Công ty Tài chính HD SAISON… Kết quả được công bố dựa trên khảo sát ý kiến người dùng trên toàn quốc nhằm chọn ra các doanh nghiệp có sản phẩm, dịch vụ chất lượng tốt, uy tín cao với người tiêu dùng, thân thiện với môi trường, có sức cạnh tranh cao…
Skip in 7...Ad finishes in 30 seconds


Đội ngũ nhân viên chăm sóc khách hàng của Bkav (Nguồn ảnh: Internet)
Ông Vũ Văn Dũng, Phó chủ tịch phụ trách kinh doanh của Bkav cho biết: “Việt Nam là một thị trường khó tính và chỉ có thể chinh phục bằng kết quả cuối cùng với sản phẩm tốt, chất lượng dịch vụ hoàn hảo. Để có được điều đó, Bkav đã làm việc bằng đam mê, bằng cái tâm của mình. Danh hiệu Top 10 Dịch vụ hoàn hảo chính là kết quả quá trình lao động của chúng tôi. Đây là một danh hiệu cao quý và chúng tôi rất vinh dự về điều này”.

Phần mềm diệt virus của Bkav đã 5 năm liên tiếp vượt qua các sản phẩm của nước ngoài, trở thành “Sản phẩm An toàn thông tin được người dùng ưa chuộng nhất” do Hiệp hội An toàn thông tin Việt Nam bình chọn. Bkav hiện có hơn 10 triệu người sử dụng, chiếm thị phần áp đảo tại Việt Nam, khẳng định chất lượng sản phẩm và dịch vụ của Bkav trong lòng khách hàng.

Bkav cũng xây dựng thành công mô hình kiến trúc Chính phủ điện tử Bkav eGov, đang được triển khai tại 26 tỉnh, thành trên toàn quốc. Trong lĩnh vực sản xuất thiết bị thông minh, nhà thông minh, Bkav được biết đến với Bkav SmartHome, giải pháp nhà thông minh hoàn chỉnh nhất theo tiêu chuẩn của Gartner. Bkav cũng là Tập đoàn công nghệ đầu tiên của Việt Nam phát triển thành công smartphone cao cấp.', 5, 2, 2, 0, N'1700.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (22, N'Google gửi cảnh báo tới người chơi Pokemon Go Việt Nam về hành vi phá hoại

', N'Người dùng Pokemon Go đang đi quá giới hạn, khi bản đồ Google Maps đang bị spam quá mức quy định', N'18.jpg', CAST(0xA83B0B00 AS Date), N'1', N'

 
Ngày 6/8 vừa qua, Niantic Labs - nhà phát triển game thực tế ảo Pokemon Go đã đăng tải thông báo trên Facebook và Twitter cho biết có thêm người dùng tại 15 nước được tải về game này, trong đó có Việt Nam. Ngay lập tức, số lượng người chơi Pokemon Go tại Việt Nam đã gia tăng đột biến.

Tuy nhiên, việc các địa điểm nhận thưởng trong game (Pokestop) được bố trí theo đúng bản đồ thực và phân bố không đều khiến cho người chơi game “khát” Pokestop. Đánh trúng tâm lý đó, nhiều bài viết trên các diễn đàn, website và trang tin công nghệ sau khi phán đoán rằng nhà phát hành Niantic sử dụng Google Map để tạo các địa điểm trong game (Pokestop và GYM), đã có nhiều bài viết hướng dẫn người chơi Pokemon Go tạo Pokestop bằng cách… sửa bản đồ Google (Google Map) thông qua công cụ vẽ bản đồ Google Map Maker của Google.

Các bài hướng dẫn này đã tạo ra làn sóng hàng ngàn người chơi Pokemon Go đổ xô lên công cụ vẽ bản đồ Google Map Maker của Google để tạo ra những địa điểm giả các di tích lịch sử và địa điểm nổi tiếng, thậm chí di chuyển nhiều địa điểm về gần nhà mình… với hy vọng được đưa vào trong game.
SkipAdAd finishes in 21 seconds

Theo một thành viên cộng đồng Google Map Maker Việt Nam, nhiều người chơi game Pokemon Go trong nước không biết rằng hành vi spam Google Map của họ có thể phá nát bản đồ Google. Để không xảy ra điều này, các thành viên cộng đồng Google Map Maker Việt Nam đã cố gắng kiểm duyệt và từ chối các địa điểm giả được người chơi tạo ra bằng Google Map Maker. Tuy nhiên, do số lượng spam trên công cụ vẽ bản đồ Google Map Maker ngày càng tăng khiến cho việc kiểm duyệt bị quá tải.

Nhiều thành viên Google Map Maker Việt Nam cũng bày tỏ sự mệt mỏi và chán nản vì những câu hỏi và yêu cầu kiểm duyệt địa điểm tạo Pokestop. Thậm chí có thành viên còn “tuyên chiến” với doanh nghiệp đang lợi dụng sự quan tâm của người chơi Pokemon Go viết bài “câu view” và cảnh cáo doanh nghiệp nào cố tình hướng dẫn các game thủ đi spam địa điểm trên Google Map thì chính thông tin của doanh nghiệp trên Google Map sẽ bị từ chối.

Như ICTnews đã thông tin, hôm qua, ngày 10/8/2016, Cộng đồng Google Map Maker Việt Nam đã đăng tải trên trên trang Google Plus và Fanpage của nhóm thông điệp kêu gọi cơ quan truyền thông, người dùng hành động để bảo vệ nguồn dữ liệu bản đồ Việt Nam trên Google Maps, do những game thủ Pokemon chỉnh sửa, nhằm lập các điểm Pokestop để săn vật phẩm trong game Pokemon.

Trong thông điệp đăng tải trên Fanpage Googe Maps Maker, Lê Bách, một trong những trưởng khu vực Google Map Maker tại Việt Nam đã kêu gọi các cơ quan báo chí, các tổ chức và người dùng có hành động để bảo vệ nguồn dữ liệu bản đồ Việt Nam trên Google Map mà người dùng trong mấy ngày qua đã trực tiếp chỉnh sửa thông qua công cụ Map Maker của Google.

Ông Lê Bách cũng chia sẻ: “Như các bạn đã biết, nguồn dữ liệu bản đồ mà các bạn đang hằng ngày sử dụng để định vị vị trí, để điều hướng khi sử dụng phương tiện giao thông cũng như tìm các vị trí hữu ích khác như cơ sở ý tế, trường học, địa danh... không phải ngẫu nhiển tồn tại, nó là công sức của hàng trăm ngàn người đã ngày đêm bổ sung, kiểm duyệt và duy trì nhằm tạo nên nguồn bản đồ chất lượng cho các bạn sử dụng, chúng tôi ở đây đã phải đổ bằng máu của mình, nhiều người đã ra đi khi đi tới đảo xa, cũng như tới các vùng biên, các anh đã yên giấc cho nguồn dữ liệu bản đồ hôm nay”.

Cũng trong thông điệp này, cộng đồng Google Map Maker Việt Nam đã đề nghị người chơi game Pokemon Go Việt Nam dừng ngay hành động phá hoại bản đồ vì Pokemon. Khẳng định cộng đồng Google Map Maker Việt Nam sẵn sàng giúp đỡ người dùng trong khả năng có thể; song đại diện cộng đồng này cũng cảnh báo những người chơi Pokemon Go Việt Nam không nên: tạo vị trí Spam hàng loạt; cố tình bổ sung trùng lặp với các vị trí đã có; di chuyển các vị trí công cộng hữu ích như trụ sở, trường học, chùa chiền, cùng nhiều vị trí danh thắng quan trọng khác; không cố tình bổ sung, spam các vị trí giả mạo nhằm tạo Pokestop...

Liên quan đến thông điệp nêu trên của cộng đồng Google Map Maker Việt Nam, hôm nay (ngày 11/8/2016), đại diện Google đã gửi tới các cơ quan báo chí thông tin chính thức của Google về vấn đề Pokemon Go và Google Map tại Việt Nam.

Trong thông tin gửi tới báo chí, về vấn đề liên quan đến Pokemon, Google khẳng định Pokemon Go là sản phẩm của Ninantic Labs, không phải là sản phẩm của Google. Và vì thế “Chúng tôi không bình luận về các sản phẩm không thuộc Google”.

Còn đối với vấn đề gần đây liên quan đến Google Map và ông Lê Bách, đại diện Google cho biết: “Cộng đồng Map Maker là tập hợp những thành viên đầy nhiệt huyết trên toàn thế giới với nhiều đóng góp tích cực trong việc cung cấp các dữ liệu chuẩn xác cho bản đồ Google. Tuy nhiên, ông Lê Bách không phải là nhân viên chính thức của Google và quan điểm của ông không đại diện cho quan điểm của Google”.

Google Map Maker là công cụ online cho phép người dùng có thể sử dụng tài khoản Gmail để đăng nhập và tham gia vẽ Bản đồ Google, các dữ liệu này sẽ được Google xuất bản lên Google Map và Google Earth. Ban đầu, hệ thống phân quyền của Google dựa trên việc đánh giá thành tích người dùng để phân quyền. Người dùng càng có nhiều đóng góp càng có nhiều quyền tham gia vẽ bản đồ cũng như kiểm duyệt bản đồ của người khác. Tuy nhiên, nhiều người đã qua mặt hệ thống phân quyền này bằng cách ban đầu vẽ các địa điểm một cách tử tế để được nâng quyền, khi có đủ quyền thì họ sử dụng để Spam hoặc cố tình đưa những dữ liệu rác vào để làm S.E.O. Sau những sự cố không mong muốn, Google đã sửa hệ thống phân quyền trong Google Map Maker bằng cách bỏ gần hết các quyền của người dùng, thay vào đó họ bổ sung thêm các trưởng khu vực (hay còn gọi là lãnh đạo vùng - Regional Lead) là những tình nguyện viên có nhiều đóng góp cho Google Map Maker tham gia giúp họ kiểm duyệt một cách chặt chẽ hơn.
Cộng đồng Google Map Maker Việt Nam là cộng đồng những người tham gia vẽ Bản đồ Google thông qua Google Map Maker ở đủ mọi lứa tuổi, cộng đồng này lần đầu tiên tổ chức họp mặt năm 2011 tại Hà Nội và thành phố Hồ Chí Minh (tháng 5), Hải Phòng (tháng 6). Cộng đồng Google Map Maker Việt Nam có nhiều hoạt động và hội thảo, đề xuất với Google các khu vực cần ưu tiên bổ sung ảnh chụp độ phân giải cao, tổ chức đi khảo sát thực tế để vẽ bản đồ cũng như tham gia các hoạt động từ thiện… Với những quốc gia như Việt Nam, Google không mua được dữ liệu bản đồ chính thống được cập nhật mới, do đó họ phụ thuộc rất nhiều vào đóng góp của cộng đồng Google Map Maker Việt Nam. Dữ liệu bản đồ trên Google Map mà chúng ta sử dụng hàng ngày chủ yếu do những thành viên cộng đồng Google Map Maker vẽ trong nhiều năm.', 5, 2, 2, 1, N'1800.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (23, N'Zalo ra mắt tính năng mới dành cho doanh nghiệp và chủ shop', N'Tóm tắt tesZalo không ngừng phát triển và cập nhật những tính năng tiện lợi cho người dùng.t', N'19.jpg', CAST(0xE13A0B00 AS Date), N'1', N'Với thiết kế quen thuộc, thoạt nhìn như website nhưng lại tối giản cho di động, Zalo Shop được đánh giá phù hợp với đa dạng đối tượng từ doanh nghiệp, người buôn bán nhỏ lẻ đến những người chưa từng sử dụng Internet để bán hàng.


Zalo ra mắt tính năng Shop
Người bán có thể sử dụng Zalo Shop để trưng bày sản phẩm kèm theo mức giá và sắp xếp hàng hóa theo danh mục tùy ý, thậm chí thiết lập các chương trình khuyến mãi. Về phía người mua, nếu quan tâm đến sản phẩm bất kì, họ có thể dễ dàng hỏi thông tin về sản phẩm đó thông qua chức năng chat được tích hợp sẵn.


Một Shop bán hàng trên Zalo
Để sử dụng tính năng này, người bán chỉ cần đăng ký Official Account “Cửa hàng - Dịch vụ”, hệ thống sẽ mặc định chuyển sang nền tảng Shop.

Zalo Shop đã được tích hợp sẵn trong hệ thống của Bizweb hoặc Haravan cho các khách hàng có nhu cầu sử dụng. Nhiều doanh nghiệp lớn đã thử dùng Zalo Shop để đưa một phần hoặc toàn bộ danh mục hàng hóa của mình đến với người dùng như FPT Shop, Thế Giới Di Động, Tiki.vn, Nguyễn Kim, Domino’s Pizza, Asus Việt Nam, HNam Mobile...

Trước đó, Zalo cũng giới thiệu hệ thống mua quảng cáo tự động giúp các doanh nghiệp tự đặt giá quảng cáo, lựa chọn đối tượng khách hàng như ý, theo dõi hiệu quả và kiểm soát chi phí.', 5, 2, 1, 1, N'1900.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (24, N'Vũng Tàu bắt đầu được phủ sóng wifi miễn phí', N'Tại TP Vũng Tàu, các trạm phát sóng dịch vụ S-wifi của SPT đã được lắp đặt', N'20.jpg', CAST(0x593B0B00 AS Date), N'1', N'Tại TP Vũng Tàu, các trạm phát sóng dịch vụ S-wifi của SPT đã được lắp đặt và chính thức phục vụ wifi miễn phí tại khu vực Bến tàu Cánh Ngầm đến công viên Bãi trước, với bán kính bắt sóng trung bình trên 100 mét.

Xem thêm: Người Sài Gòn chê wifi công cộng yếu

Được sự chấp thuận từ Uỷ Ban Nhân Dân tỉnh Bà Rịa – Vũng Tàu, Công ty Cổ phần Dịch Vụ Bưu chính Viễn thông Sài Gòn (SPT) chính thức đưa vào hoạt động dịch vụ S-wifi cung cấp wifi miễn phí cho toàn thành phố Vũng Tàu giai đoạn 1, và chuẩn bị tiến hành triển khai giai đoạn tiếp theo.

Giai đoạn 2 tại các khu vực bệnh viện Bà Rịa, Bệnh viện Lê Lợi, khu vực Bãi Sau, chợ du lịch và khu tham quan cáp treo Thành phố Vũng Tàu sẽ được phủ sóng.

Trước khi đưa vào hoạt động chính thức, dự án wifi công cộng Thành phố Vũng Tàu được Uỷ Ban Nhân Dân tỉnh Bà Rịa – Vũng Tàu chỉ đạo Sở Thông tin Truyền thông phối hợp với SPT xây dựng đề án, đưa vào thí điểm từ 08/2015, làm tiền đề cho bước triển khai thực tế.

Với lần phủ sóng lần này ở Vũng Tàu, đơn vị SPT này đã triển khai lắp đặt hệ thống wifi miễn phí trên 13 tỉnh, thành của cả nước, trong đó đã triển khai wifi công cộng diện rộng trên toàn TP. Đà Nẵng.

S-wifi là dịch vụ giải pháp truyền thông tiếp thị trên nền tảng mạng không dây (wifi marketing). Đây là sản phẩm dịch vụ tiếp thị tiên tiến nhất được xây dựng trên hạ tầng mạng wifi băng thông rộng với khả năng tiếp cận hơn 1 triệu người dùng hàng tháng trên toàn quốc.', 5, 2, 1, 0, N'2000.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (25, N'Sau Vietnam Airlines Hacker tiếp tục tấn công sang Website Liên Đoàn Bóng Đá Việt Nam', N'Sau Vietnam Airlines Hacker tiếp tục tấn công sang Website Liên Đoàn Bóng Đá Việt Nam', N'21.jpg', CAST(0x773B0B00 AS Date), N'1', N'Tối ngày 29/7, khi truy cập vào địa chỉ vff.com.vn, người xem chỉ thấy giao diện trang thay đổi kèm tuyên bố website đã bị nhóm Wolf tấn công. Website bị tấn công đã để lại thông điệp :  '' Hãy nhìn xem những gì bọn khủng bố đã gây ra. Chúng giết hàng nghìn người dân Syria vô tội. Bất cứ ai im lặng về những gì đang xảy ra ở Syria là đã tham gia vào hành động đẫm máu mà các nhóm khủng bố đang thực hiện '' .



Hiện chưa rõ hai cuộc tấn công này và hai nhóm hacker có liên quan đến nhau hay không. 

Sự cố này diễn ra ngay sau khi một nhóm hacker khác, tự nhận là 1937cn, tấn công vào hệ thống máy chủ của hai sân bay Quốc tế Nội Bài và Tân Sân Nhất chiều nay, đồng thời thay đổi giao diện trang chủ (deface) trang web của Vietnam Airlines. Đến cuối giờ chiều, website của của hãng hàng không Việt Nam đã có thể truy cập bình thường.

Đây cũng không phải lần đầu tiên VFF trở thành nạn nhân của tin tặc. Trước đó, cuối năm 2014, sau trận bán kết lượt đi AFF Cup 2014, hacker đã làm sập trang thông tin điện tử của Liên đoàn bóng đá Malaysia (FAM) cũng như Việt Nam (VFF).', 5, 2, 1, 0, N'2100.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (26, N'Apple mua lại McLaren: Chuyện đùa nhưng lại có lý!', N'The Verge ghi nhận, Apple đang tỏ ra hứng thú trong việc mua lại McLaren', N'22.jpg', CAST(0xB33B0B00 AS Date), N'1', N'Mặc dù đại diện của McLaren đã một mực phủ nhận những tin đồn về một cuộc thâu tóm nhưng chắc hẳn Apple hoàn toàn có lí do của riêng họ khi muốn sở hữu hãng ô-tô này. Vậy lí do đó là gì? Câu trả lời sẽ được giải đáp ngay sau đây.

Apple mua lại McLaren: Chuyện đùa nhưng lại có lý!
 

McLaren không chỉ là một công ty chuyên sản xuất dòng xe thể thao và sở hữu một đội đua xe chuyên nghiệp. Nó là một công ty được vận hành bởi 5.000 nhân viên có khả năng làm việc thành thạo đến 6 lĩnh vực khác nhau. Từ hệ thống kiểm soát, điều hướng xe cho đến việc điều phối với các OEM, thậm chí cả về đua xe, marketing, cũng điều được họ đảm nhận dễ dàng.

Thêm nữa, hãng xe danh tiếng này đã có kinh nghiệm làm việc với các chất liệu tiên tiến như carbon tổng hợp, nhôm và sợi carbon. Kết hợp với khả năng tự nghiên cứu và phát triển các công nghệ mới, đảm xuyến tốt các mối quan hệ với những hãng công nghiệp khác đã giúp McLaren trở thành một xưởng sản xuất xe với các công nghệ cần thiết cho việc tạo ra một chiếc xe thông minh trong thời gian tới.

Apple mua lại McLaren: Chuyện đùa nhưng lại có lý!
[captionnewsLiệu sẽ có một cuộc '' kết hôn '' giữa Apple và McLaren?[/captionnews]

Thật vậy, công ty này chẳng lạ lẫm gì với các dòng xe điện, tiền đề để chế tạo nên xe thông minh. Chiếc xe P1 của họ có thể đi được đến 6 dặm với chỉ 1 lần sạc đầy. Đây là một trong những điều mà Apple thèm muốn ở McLaren vì họ đã có sẵn '' hạt nhân '' để tạo nên '' vụ nổ '' trong ngành công nghiệp xe tự hành.

Quan trọng hơn, nếu mua lại được McLaren, Apple sẽ sở hữu trong tay hàng ngàn bằng sáng chế trong lĩnh vực ô-tô, điều này giúp họ rút ngắn rất nhiều thời gian và công sức để phát minh ra một chiếc xe tự lái của riêng mình.

Trong cuộc đua về việc đưa xe tự lái thông minh ra thị trường, Apple thực sự không có chỗ đứng trong lĩnh vực này vì họ vẫn đang mải mê mới ccasc thiết bị di động như smartphone, laptop hay tablet.

Thế nên cuộc đua trong lĩnh vực xe thông minh hiện giờ đang là cuộc đua '' song mã '' giữa Tesla của nhà thiên tài E.Musk và Google mà thôi.

Apple mua lại McLaren: Chuyện đùa nhưng lại có lý!
Nhưng nếu Apple sở hữu được McLaren, một câu chuyện cho đến thời điểm hiện tại sẽ gần như khó xảy ra, '' Táo Khuyết '' sẽ có được một nền tảng vững chắc trong lĩnh vực xe hơi và khi phòng nghiên cứu của Apple, nơi tạo ra những sản phẩm đột phá như iPhone, kết hợp với phòng nghiên cứu của McLaren, một '' cú sốc '' trong làng xe thông minh hẳn sẽ được hình thành.

Về phần của hãng xe thể thao này, họ không nên lo lắng về việc thương hiệu lẫn danh tiếng bấy lâu nay bị thâu tóm. Nếu nhìn sang Beats, một hãng tai nghe cao cấp đã được Apple mua lại nhưng vẫn được quyền tự sản xuất các mẫu tai nghe và quan trọng hơn là thương hiệu vẫn được giữ nguyên.

Chứng tỏ rằng thương vụ '' Táo '' mua lại Beats chỉ nhằm sở hữu những công nghệ âm thanh và '' chất xám '' từ các nhân sự của Beats mà thôi. Thế nên nếu có '' bán mình '' cho Apple thì cũng chẳng sao đối với McLaren, ngược lại hõ sẽ hưởng lợi nhiều hơn khi có sự hậu thuẫn từ một trong những công ty có giá trị nhất thế giới.', 6, 2, 1, 1, N'2200.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (27, N'GoPro ra mắt actioncam HERO5 Black và HERO5 Session: Quay 4K 30fps, ra lệnh bằng giọng nói', N'GoPro vừa công bố camera hành động HERO5 với hai phiên bản HERO5 Black và HERO5 Session. ', N'23.jpg', CAST(0x763B0B00 AS Date), N'1', N'
1. GoPro HERO5 Black

collage.jpg


video giới thiệu HERO5 Black
​
HERO5 Black là mẫu máy Flagship cao cấp nhất của hãng hiện nay. Máy có thể lặn sâu đến 33ft (10m) mà không cần phải chứa trong vỏ bảo vệ như trước đây, nhờ đó việc thao tác sẽ dễ hơn, kích thước thu gọn và ghi âm tốt hơn. Mặt sau của máy giờ đây là màn hình cảm ứng 2", giúp việc điều khiển GoPro dễ dàng hơn.

Bên trong máy là cảm biến ảnh kích thước 1/2.3", có thể quay video 4K 30fps và chụp ảnh tĩnh 12MP ở định dạng Jpeg hoặc RAW. Máy không có chống rung quang học, nhưng bù lại là công nghệ chống rung điện tử 5 trục. Đặc biệt, đây là actioncam đầu tiên của GoPro tích hợp khả năng ra lệnh bằng giọng nói. Bạn không cần phải dùng tay để nhấn chụp hay quay video nữa, chỉ cần nói "GoPro, chụp ảnh". GoPro cũng đã bổ sung thêm GPS, giúp bạn ghi lại toạ độ di chuyển của bạn.

GoPro HERO5 Black có giá bán lẻ $399 (xấp xỉ 9 triệu đồng), bán ra vào tháng 10 năm nay.


2. GoPro HERO5 Session

collage.jpg


video giới thiệu HERO5 Session​
HERO5 Session là phiên bản rút gọn của HERO5 Black, hướng đến sự nhỏ gọn. Máy có thiết kế dạng khối lập phương, gọn hơn, nhẹ hơn so với phiên bản HERO5 Black nhưng vẫn chưa trong mình đầy đủ các tính năng như quay 4K 30fps, chống nước không cần vỏ ở độ sâu 33ft (10m), điều khiển bằng giọng nói. Tuy nhiên vì là phiên bản thu gọn nên phiên bản Session thiếu một vài tính năng như chụp ảnh RAW và GPS. Máy chỉ có thể chụp ra ảnh JPEG và không thể lưu ở dạng ảnh RAW chất lượng cao.

GoPro HERO5 Session có giá bán lẻ $299 (xấp xỉ 6,7 triệu đồng), bán ra vào tháng 10 năm nay.
', 6, 2, 1, 1, N'2300.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (28, N'Cập nhật tính năng mới trên ứng dụng chơi game Xbox', N'Xbox được coi là một ứng dụng liên kết tất cả các trò chơi trên các thiết bị ', N'24.jpg', CAST(0xDE3A0B00 AS Date), N'1', N'Như các bạn cũng biết thì cách đây không lâu, đại diện của Microsotf đã chính thức công bố sẽ cho ra mắt một phiên bản Xbox chạy trên cả hai hệ điều hành iOS và Android, nhưng chúng ta vẫn chưa biết là khi nào mới có ngày ra mắt chính thức. Tuy nhiên, theo nguồn tin từ Phonearena thì ứng dụng Xbox đã được cập nhật thêm 2 tính năng mới đó là: Clubs và Looking for Group (LFG).
Cập nhật tính năng mới trên ứng dụng chơi game Xbox
Theo như mình thấy cộng đồng Gamer có thể được xem như là một thành phần không thể thiếu đối với thế giới công nghệ của chúng ta. Và ngay cả nhà sản xuất Microsoft một phần muốn phát huy một cộng đồng như thế cho nên đã ra ứng dụng Clubs với tính năng Clubs sẽ giúp cho người chơi có thể tạo một nhóm riêng cho mình, để họ có thể chia sẻ với nhau về những game mà họ đã chơi.

Ngoài ra, còn một tính năng thứ hai là đó Looking for Groups. Với chức năng này bạn có thể tìm kiếm được những nhóm người chơi tham gia cùng game đó của mình để có thể chơi chung cùng nhau và bạn cũng có thể tích lũy được thêm điểm kinh nghiệm nhanh chóng hơn. Tuy nhiên, chúng ta vẫn chưa biết được ngày công bố 2 tính năng mới này khi nào nhưng các bạn có thể xem qua đoạn video dưới đây để tìm hiểu về nó nhé.', 6, 2, 1, 0, N'2400.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (36, N'Microsoft cập nhật bàn phím SwiftKey: Tích hợp trí tuệ nhân tạo', N'Mới đây Microsoft đã phát hành phiên bản cập nhật mới cho ứng dụng bàn phím ', N'25.jpg', CAST(0xE03A0B00 AS Date), N'1', N'Nhằm tăng cường nghiên cứu phát triển trí tuệ nhân tạo, Microsoft đã mua SwiftKey vào tháng Hai năm nay với mức giá khoảng 250 triệu USD. Và nay, sau nhiều tháng đào tạo mô hình thần kinh ngôn ngữ mới bằng cách viết hàng triệu câu, Microsoft đã trình làng phiên bản SwiftKey mới với khả năng đoán từ tiếp theo dựa trên những cụm từ mà nó nhìn thấy trước đó.
SwiftKey mới có thể nhìn sâu vào ý nghĩa của từng từ và ngữ cảnh của nó trong một cụm từ để thực hiện dự đoán.

"Với bản cập nhật này, SwiftKey có thể thực sự nắm bắt được mối quan hệ và sự tương đồng giữa các từ. Ví dụ, nếu trước đó nó thấy cụm từ "hẹn nhau ở sân bay nhé" thì công nghệ của nó có thể suy ra rằng "văn phòng" hoặc "khách sạn" có thể được dùng để thay thế cho "sân bay", SwiftKey tuyên bố.
Hiện bản cập nhất đã được đưa lên Google Play Store sau gần một năm hoạt động dưới dạng thử nghiệm. Tuy nhiên, trong giai đoạn này ứng dụng chỉ hỗ trợ tiếng Anh Mỹ và tiếng Anh Anh, các ngôn ngữ khác sẽ được cập nhật sớm.', 6, 2, 212, 1, N'2500.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (38, N'6 tính năng nổi bật nhất trên hệ điều hành Android 7.0 Nougat', N'Android 7.0 Nougat đã chính thức được phát hành', N'26.jpg', CAST(0xC63B0B00 AS Date), N'1', N'Được biết các mẫu smartphone mang thương hiệu Nexus của Google, bao gồm Nexus 6, Nexus 9, Nexus Player, Nexus 5X, Nexus 6P, smartphone thuộc dòng sản phẩm giá rẻ Android One và đặc biệt mẫu máy tính bảng Pixel C sẽ là những sản phẩm đầu tiên được nâng cấp lên Android 7.0 Nougat.

Cùng điểm qua những tính năng đáng chú ý của bản cập nhật mới này:

Đa nhiệm tốt hơn

7 tính năng nổi bật của bản cập nhật Android 7.0 Nougat mới - ảnh 1
Giờ đây người dùng có thể nhấn đúp vào nút Recent apps (có hình vuông trên thanh menu) để chuyển qua lại giữa 2 ứng dụng đang sử dụng gần nhất. Giả sử như bạn đang ở trong Gmail, nhưng cần phải tìm một điều gì đó trong Chrome, chúng ta chỉ cầ mở Chrome, tìm và sao chép liên kết, sau đó nhấn đúp vào nút Recent apps để ngay lập tức quay trở lại Gmail.

Sử dụng cùng lúc 2 ứng dụng

7 tính năng nổi bật của bản cập nhật Android 7.0 Nougat mới - ảnh 2
Người dùng Samsung từ lâu đã quen thuộc với khả năng chia đôi, hay thậm chí chia 3 màn hình để làm việc đa nhiệm. Giờ đây với bản cập nhật Nougat, tất cả các thiết bị chạy Android đều được trang bị tính năng độc đáo này. Để kích hoạt chế độ làm việc đa cửa sổ, người dùng chỉ cần nhấn và giữ lâu nút Recent app.

Kéo thả đoạn văn bản hoặc hình ảnh khi ở chế độ đa cửa sổ

7 tính năng nổi bật của bản cập nhật Android 7.0 Nougat mới - ảnh 3
Khi đang ở chế độ đa cửa sổ, người dùng có thể thực hiện thao tác bôi đen, rồi kéo-thả đoạn văn bản từ ứng dụng này sang ứng dụng khác. Ngoài ra, hình ảnh và một vài định dạng tệp tin cũng có thể thực hiện với cách thức tương tự.

Nguồn gốc cài đặt cài đặt ứng dụng

7 tính năng nổi bật của bản cập nhật Android 7.0 Nougat mới - ảnh 4
Nền tảng Android Nougrat sẽ giúp bạn kiểm tra được các ứng dụng trong máy xem chúng được tải về và cài đặt từ đâu. Mở Setting, sau đó vào Apps, rồi lựa chọn ứng dụng bất kỳ trong danh sách. Kéo xuống dưới, chúng ta sẽ thấy mục Store, chính là nơi hiển thị nguồn gốc của ứng dụng đó. Ví dụ như nếu được tải về từ cửa hàng của Google, phần này sẽ hiển thị là Google Play.

Trả lời với tin nhắn nhanh

7 tính năng nổi bật của bản cập nhật Android 7.0 Nougat mới - ảnh 5
Người dùng giờ đây có thể hồi đáp tin nhắn của các ứng dụng như Facebook Messenger, Hangouts, hoặc Messenger một cách trực tiếp khi nhận được dòng thông báo mà không cần mở ứng dụng gốc.

Thiết lập mức độ quan trọng của từng thông báo

7 tính năng nổi bật của bản cập nhật Android 7.0 Nougat mới - ảnh 6
Một rắc rối khiến không ít người dùng smartphone gặp phải đó là việc hiển thị các dòng thông báo không cần thiết. Giờ đây, bạn có thể thiết lập mức độ quan trọng của từng dòng thông báo, đi kèm với lựa chọn hiển thị trên màn hình khóa, hoặc ưu tiên hiển thị trong chế độ Không Làm Phiền. Để đến với tùy chỉnh này, người dùng chỉ cần nhấn và giữ dòng thông báo trong một khoảng thời gian ngắn.

Quản lý dữ liệu di động tốt hơn

7 tính năng nổi bật của bản cập nhật Android 7.0 Nougat mới - ảnh 7
Mục Data Saver của Android 7.0 sẽ cho phép người dùng quản lý dữ liệu di động hiệu quả hơn như thiết lập hạn chế các của từng ứng dụng chạy nền, hay chạy ở màn hình khóa. Để tùy chỉnh hạng mục này, người dùng trước hết cần truy cập vào mục Data Saver bên trong menu Data Usage.', 6, 2, 15, 1, N'2600.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (40, N'Intel bắt đầu xây dựng chip ARM 10nm cho các thiết bị IoT', N'Intel đã thua trong cuộc chiến sản xuất vi xử lý di động cho smartphone', N'27.jpg', CAST(0xC03B0B00 AS Date), N'1', N'Hôm qua (16/8), Intel cuối cùng cũng đã thừa nhận rằng mình đã bị hụt hơi trong thị phần chip di động và hãng cũng công bố một thỏa thuận với ARM để bắt đầu sản xuất các loại chip dựa trên nền tảng này.

Intel bắt đầu xây dựng chip ARM 10nm cho các thiết bị IoT
Được biết, Intel sẽ sản xuất những dòng chip di động siêu nhỏ theo kiến trúc 10nm để sử dụng nó trên các sản phẩm IoT như vòng đeo tay thông minh, kính thông minh, các thiết bị siêu nhỏ trong một tương lai “Internet cho vạn vật”.

Với thỏa thuận này, Intel có thể sẽ trở thành một “ông lớn” mới trong thị trường chip di động thậm chí hãng sẽ sớm vượt qua cả Apple và Samsung. Cùng chờ xem!', 6, 2, 457, 1, N'2700.jpg')
INSERT [dbo].[Tin] ([idTin], [TieuDe], [TomTat], [urlHinh], [Ngay], [idUser], [NoiDung], [idLoaiTin], [idTheLoai], [SoLanXem], [TinNoiBat], [AnhHien]) VALUES (42, N'Doanh số Galaxy Note 7 cầm chắc số phận thê thảm', N' Thế rồi mọi chuyện đảo ngược hoàn toàn từ sự cố lỗi pin gây cháy nổ.', N'28.jpg', CAST(0xE33B0B00 AS Date), N'1', N'Giá trị thị trường và thương hiệu của hãng bị ảnh hưởng (nếu không nói là “tàn phá”) nghiêm trọng. Lòng tin của khách hàng cũng giảm sút không phanh dù Samsung đã bắt đầu tung đợt hàng Note 7 không lỗi.

Từ những lý do này, các nhà phân tích tin rằng doanh số Galaxy Note 7 sẽ thua xa Galaxy Note 5 năm ngoái.

Một báo cáo từ công ty BayStreet Research cho thấy Galaxy Note 7 đã có khởi đầu trong mơ: doanh số cao hơn 25% so với người tiền nhiệm. Lúc đó, nhiều người đã tin rằng Note 7 sẽ bán chạy ngang ngửa với dòng Galaxy S7, vốn đã giúp Samsung lập kỷ lục doanh thu trong quý 2 năm nay.

Doanh số Galaxy Note 7 cầm chắc số phận thê thảm
Samsung Galaxy S7 đã gặt hái rất nhiều thành công 

Còn hiện tại, nhiều người dự đoán doanh số Galaxy Note 7 cùng lắm chỉ bằng 60% so với Note 5 năm ngoái. “Trường hợp tốt nhất, sẽ giống như các đợt triệu hồi của các hãng xe. Bà con sẽ nhận xe mới và nhanh chóng quên đi lỗi cũ. Trường hợp tệ nhất, dấu ấn sự cố Note 7 sẽ ghi dấu ấn sâu đậm kiểu lỗi Siri và Apple Maps của Apple trước đây, sẽ rất khó để khiến khách hàng quên được,” bản báo cáo của BayStreet Research cho biết.

Doanh số Galaxy Note 7 cầm chắc số phận thê thảm
Điện thoại Samsung Galaxy Note 5 

Mộ trong những lý giải cho thảm họa Note 7 là do Samsung đã quá nóng vội chạy đua với thời gian để tạo lợi thế ra mắt trước iPhone 7 của Apple. Với sự cố lớn nhất ngành smartphone thế giới này, dù hiện Samsung đang cố vực dậy Note 7 để tìm kiếm một cơ hội thứ 2, nhưng sẽ rất khó thuyết phục được người dùng quay lại với sản phẩm này.', 6, 2, 56895, 1, N'2800.jpg')
SET IDENTITY_INSERT [dbo].[Tin] OFF
/****** Object:  Table [dbo].[ComMent]    Script Date: 11/23/2016 03:31:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComMent](
	[idComMent] [int] NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[idTin] [int] NOT NULL,
 CONSTRAINT [PK_ComMent] PRIMARY KEY CLUSTERED 
(
	[idComMent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_PhanQuyen_TrangWeb]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTW])
REFERENCES [dbo].[TrangWeb] ([MaTW])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
/****** Object:  ForeignKey [FK_PhanQuyen_VaiTro]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_VaiTro] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_VaiTro]
GO
/****** Object:  ForeignKey [FK_User_VaiTro]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_VaiTro] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_VaiTro]
GO
/****** Object:  ForeignKey [FK_LoaiTin_TheLoai]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[LoaiTin]  WITH CHECK ADD  CONSTRAINT [FK_LoaiTin_TheLoai] FOREIGN KEY([idTheLoai])
REFERENCES [dbo].[TheLoai] ([idTheLoai])
GO
ALTER TABLE [dbo].[LoaiTin] CHECK CONSTRAINT [FK_LoaiTin_TheLoai]
GO
/****** Object:  ForeignKey [FK_Tin_LoaiTin]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[Tin]  WITH CHECK ADD  CONSTRAINT [FK_Tin_LoaiTin] FOREIGN KEY([idLoaiTin])
REFERENCES [dbo].[LoaiTin] ([idLoaiTin])
GO
ALTER TABLE [dbo].[Tin] CHECK CONSTRAINT [FK_Tin_LoaiTin]
GO
/****** Object:  ForeignKey [FK_Tin_TheLoai]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[Tin]  WITH CHECK ADD  CONSTRAINT [FK_Tin_TheLoai] FOREIGN KEY([idTheLoai])
REFERENCES [dbo].[TheLoai] ([idTheLoai])
GO
ALTER TABLE [dbo].[Tin] CHECK CONSTRAINT [FK_Tin_TheLoai]
GO
/****** Object:  ForeignKey [FK_Tin_User]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[Tin]  WITH CHECK ADD  CONSTRAINT [FK_Tin_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[Tin] CHECK CONSTRAINT [FK_Tin_User]
GO
/****** Object:  ForeignKey [FK_ComMent_Tin]    Script Date: 11/23/2016 03:31:01 ******/
ALTER TABLE [dbo].[ComMent]  WITH CHECK ADD  CONSTRAINT [FK_ComMent_Tin] FOREIGN KEY([idTin])
REFERENCES [dbo].[Tin] ([idTin])
GO
ALTER TABLE [dbo].[ComMent] CHECK CONSTRAINT [FK_ComMent_Tin]
GO
