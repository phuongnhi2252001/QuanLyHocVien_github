USE [QuanLyHocVien]
GO
/****** Object:  Table [dbo].[dang_nhap]    Script Date: 29/05/2021 12:46:47 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dang_nhap](
	[tendangnhap] [nchar](10) NULL,
	[matkhau] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoc_vien]    Script Date: 29/05/2021 12:46:47 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoc_vien](
	[ma_hoc_vien] [int] NOT NULL,
	[ho_ten] [varchar](225) NULL,
	[ngay_sinh] [date] NULL,
	[gioi_tinh] [bit] NULL,
	[so_dien_thoai] [varchar](50) NULL,
	[dia_chi] [nvarchar](225) NULL,
	[tinh_trang] [bit] NULL,
 CONSTRAINT [PK_hoc_vien] PRIMARY KEY CLUSTERED 
(
	[ma_hoc_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoc_vien1]    Script Date: 29/05/2021 12:46:47 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoc_vien1](
	[ma_hoc_vien] [int] NOT NULL,
	[ten] [nvarchar](50) NULL,
	[ngay_sinh] [date] NULL,
	[sdt] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[gioi_tinh] [nvarchar](50) NULL,
	[dia_chi] [nvarchar](50) NULL,
 CONSTRAINT [PK_hoc_vien1] PRIMARY KEY CLUSTERED 
(
	[ma_hoc_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa_hoc]    Script Date: 29/05/2021 12:46:47 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa_hoc](
	[ma_khoa_hoc] [int] NOT NULL,
	[ten_khoa_hoc] [nvarchar](50) NULL,
	[ten_gv] [nvarchar](50) NULL,
	[mo_ta] [nvarchar](225) NULL,
	[tong_so_hoc_vien] [int] NULL,
	[ngay_bat_dau] [date] NULL,
	[ngay_ket_thuc] [date] NULL,
	[tinh_trang] [bit] NULL,
 CONSTRAINT [PK_khoa_hoc] PRIMARY KEY CLUSTERED 
(
	[ma_khoa_hoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop_hoc]    Script Date: 29/05/2021 12:46:47 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop_hoc](
	[ma_lop_hoc] [int] NOT NULL,
	[ma_khoa_hoc] [int] NOT NULL,
	[ma_hoc_vien] [int] NOT NULL,
	[ngay_dang_ky] [date] NOT NULL,
	[tinh_trang] [bit] NULL,
 CONSTRAINT [PK_lop_hoc_1] PRIMARY KEY CLUSTERED 
(
	[ma_lop_hoc] ASC,
	[ma_khoa_hoc] ASC,
	[ma_hoc_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[lop_hoc]  WITH CHECK ADD  CONSTRAINT [FK_lop_hoc_hoc_vien1] FOREIGN KEY([ma_hoc_vien])
REFERENCES [dbo].[hoc_vien1] ([ma_hoc_vien])
GO
ALTER TABLE [dbo].[lop_hoc] CHECK CONSTRAINT [FK_lop_hoc_hoc_vien1]
GO
ALTER TABLE [dbo].[lop_hoc]  WITH CHECK ADD  CONSTRAINT [FK_lop_hoc_khoa_hoc] FOREIGN KEY([ma_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([ma_khoa_hoc])
GO
ALTER TABLE [dbo].[lop_hoc] CHECK CONSTRAINT [FK_lop_hoc_khoa_hoc]
GO
