Create database mandofashion_db
go
use mandofashion_db

go
-- T?o b?ng ch?a tài kho?n thành viên
CREATE TABLE TaiKhoan (
    TaiKhoanTV VARCHAR(68) PRIMARY KEY,						-- Tài kho?n ???c c?p ?? s? d?ng trong h? th?ng
    MatKhau NVARCHAR(256) NOT NULL,							-- M?t kh?u c?a tài kho?n
    NgayCap DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,	-- Ngày ???c c?p tài kho?n
    HoTV NVARCHAR(36),										-- H? thành viên t?i ?a 36 ký t?
    TenTV NVARCHAR(16) NOT NULL,							-- Tên thành viên t?i ?a 16 ký t?
    GioiTinh BIT NOT NULL DEFAULT 1,						-- Nam:1 - N? 0
    NgaySinh DATETIME NOT NULL DEFAULT '1900/1/1',			-- Ngày sinh c?a thành viên ???c c?p tài kho?n
    NoiSinh NVARCHAR(36) DEFAULT '',						-- N?i sinh t?i ?a 36 ký t?
    SDT VARCHAR(15) DEFAULT '',								-- S?T t?i ?a 15 ký t?
    Email VARCHAR(95) DEFAULT '',							-- EMail t?i ?a 95 ký t?
    DiaChi NVARCHAR(168) DEFAULT '',						-- DC Liên l?c t?i ?a 168 ký t?
    Active BIT NOT NULL DEFAULT 0,							-- Tài kho?n hi?n hành ???c s? d?ng hay b? khóa
    GhiChu NTEXT DEFAULT ''									-- Ghi chú
);
Go
-- T?o b?ng ch?a thông tin khách hàng 
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY Identity(1,1),									-- Mã khách hàng
    TenKH NVARCHAR(88) NOT NULL,							-- Tên khách hàng
	SDT NVARCHAR(88) NOT NULL,								-- S? ?i?n tho?i c?a khách hàng [T?i ?a 168 ký t?, có th? có nhi?u s? ?? ti?n liên l?c]
    Email NVARCHAR(246) NOT NULL UNIQUE,					-- ??a ch? EMail c?a khách hàng 
    DiaChi NVARCHAR(468) NULL DEFAULT '',					-- ??a ch? c?a khách hàng [T?i ?a 468 ký t?]
    NgaySinh DATETIME NOT NULL DEFAULT '1900/1/1',			-- Ngày sinh c?a thành viên ???c c?p tài kho?n
    GioiTinh BIT NOT NULL DEFAULT 1,						-- Gi?i tính c?a khách hàng
    GhiChu NTEXT DEFAULT ''									-- Ghi chú v? thông tin KH
);
Go
-- T?o b?ng ch?a thông tin bài vi?t
CREATE TABLE BaiViet (
    MaBV INT PRIMARY KEY Identity(1,1),									-- Mã s? c?a bài vi?t [Ki?u s?]
    TenBV NVARCHAR(168) NOT NULL,							-- Tên c?a bài vi?t [T?i ?a 168 ký t?]
    NgayDang DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,	-- Ngày ??ng bài vi?t [Không c?p nh?t]
    TaiKhoanTV VARCHAR(68) NOT NULL,						-- Tài kho?n ?ã ??ng bài vi?t [References::tt_TaiKhoan(tkThanhVien)]
    TomTatND NTEXT DEFAULT '',								-- Nô?i dung to?m t??t dành cho bài vi?t
    HinhDD NTEXT DEFAULT '',								-- ????ng dâ?n tr? ??n n?i ch?a hi?nh ?a?i diê?n cho ba?i viê?t
    NoiDungBV NTEXT DEFAULT '',								-- ????ng dâ?n tr? ??n t?p tin l?u nô?i dung ba?i viê?t 
    DaDuyet BIT NOT NULL DEFAULT 0,							-- Ba?i viê?t ?a? ????c ng???i qua?n tr? duyê?t nô?i dung ch?a
    LuotXem INT DEFAULT 0									-- S? l?n xem bài vi?t
	FOREIGN KEY (TaiKhoanTV) REFERENCES TaiKhoan(TaiKhoanTV)
);
Go
-- T?o b?ng ch?a thông tin lo?i s?n ph?m
CREATE TABLE LoaiSP (
    MaLoai INT PRIMARY KEY Identity(1,1),					-- Mã s? c?a ch?ng lo?i c?n qu?n lý [Ki?u s? nguyên]
    TenLoai NVARCHAR(168) NOT NULL,							-- Tên lo?i [T?i ?a 168 ký t?]
    GhiChu NTEXT DEFAULT ''									-- Ghi chú, di?n gi?i
);
Go
-- T?o b?ng ch?a thông tin s?n ph?m kinh doanh tr?c tuy?n
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY Identity(1,1),						-- Mã s? c?a s?n ph?m [Ki?u s? nguyên]
    MaLoai INT NOT NULL,									-- Mã lo?i qu?n qu?n lý s?n ph?m
    TenSP NVARCHAR(468) NOT NULL,							-- Tên c?a s?n ph?m [T?i ?a 468 ký t?]
	DuongDanAnh NVARCHAR(255),
	DuongDanAnh1 NVARCHAR(255),
	DuongDanAnh2 NVARCHAR(255),
	DuongDanAnh3 NVARCHAR(255),
    TomTatND NVARCHAR(468) NULL DEFAULT '',					-- N?i dung tóm t?t v? thông tin c?a s?n ph?m
    NgayDangSP DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,	-- Ngày ??ng thông tin s?n ph?m
    TaiKhoanTV VARCHAR(68) NOT NULL,						-- Tài kho?n ?ã ??ng bài vi?t [References::tt_TaiKhoan(tkThanhVien)]
    GiaBan INT NOT NULL CHECK (GiaBan >= 0),				-- Giá tour cho 1 ng???i c?a s?n ph?m, không âm
    DonVi NVARCHAR(68) NOT NULL DEFAULT 'Piece',				-- ??n v? tính cho t?ng lo?i s?n ph?m[T?i ?a 68 ký t?]
    KhuyenMai NVARCHAR(279) NOT NULL DEFAULT '',			-- Thông tin khuy?n mãi khi mua s?n ph?m t??ng ?ng
    SoLuong INT NOT NULL CHECK (SoLuong >= 0),				-- S? l??ng hàng hi?n còn trong kho
    NoiDungSP NTEXT NULL DEFAULT '',						-- ???ng d?n tr? ??n file ch?a thông tin gi?i thi?u v? s?n ph?m
    KiemDuyet BIT NOT NULL DEFAULT 0,						-- S?n ph?m ?ã ???c ki?m duy?t hay ch?a
    LuotXem INT DEFAULT 0,									-- S? l?n quan tâm [Khách hàng ch?n xem]
    LuotMua INT DEFAULT 0,									-- S? l?n giao d?ch [Khách hàng ?ã mua]
	FOREIGN KEY (TaiKhoanTV) REFERENCES TaiKhoan(TaiKhoanTV),
);

Go
CREATE TABLE AnhSanPham (
    MaAnh INT PRIMARY KEY  Identity(1,1),
    MaSP INT,
    DuongDanAnh NVARCHAR(255),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
Go
-- T?o b?ng ch?a thông tin ??n hàng
CREATE TABLE DonHang (
    MaDH VARCHAR(23) PRIMARY KEY,							-- Mã ??n hàng [Chu?i s? d?a vào: {yyyymmdd}{hhmmss}{000000000} - T?i ?a 20Ký s?]
	MaKH INT NOT NULL,									-- Mã khách hàng
    TenKH NVARCHAR(88) NOT NULL,							-- Tên khách hàng
	TaiKhoanTV VARCHAR(68) NOT NULL,						-- Tài kho?n ?ã ??ng bài vi?t [References::tt_TaiKhoan(tkThanhVien)]
    GioiTinh BIT NOT NULL DEFAULT 1,						-- Gi?i tính c?a khách hàng
    SDT NVARCHAR(88) NOT NULL,								-- S? ?i?n tho?i c?a khách hàng [T?i ?a 168 ký t?, có th? có nhi?u s? ?? ti?n liên l?c]
    DiaChi NVARCHAR(468) NULL DEFAULT '',					-- ??a ch? c?a khách hàng [T?i ?a 468 ký t?]
    Email NVARCHAR(246) NOT NULL UNIQUE,					-- ??a ch? EMail c?a khách hàng 
    DCGiaoHang NTEXT DEFAULT '',							-- Thông tin v? ??a ch? giao hàng c?a khác 
    XuatHD BIT NOT NULL DEFAULT 0,							-- ??n hàng này có xu?t hoá ??n hay không
    TDDatHang DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,	-- Th?i ?i?m ??t hàng
    TDGiaoHang DATETIME NOT NULL,							-- Th?i ?i?m giao hàng 
    GhiChu NTEXT DEFAULT ''									-- Ghi chú v? thông tin quà khuy?n mãi
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY (TaiKhoanTV) REFERENCES TaiKhoan(TaiKhoanTV)
);
Go
-- T?o b?ng ch?a thông tin chi ti?t ??n hàng ?ã ??t
CREATE TABLE ChiTietDH (
    MaDH VARCHAR(23) NOT NULL,								-- Mã ??n hàng [References::donHang(maDH)] 
    MaSP INT NOT NULL,										-- Mã c?a s?n ph?m ?ã ??t mua [References::sanPham(maSP)] 
    SoLuong INT NOT NULL,									-- S? l??ng hàng ?ã ??t mua
    GiaBan INT NOT NULL,									-- L?u thông tin gia? ba?n vi? gia? co? thê? bi? thay ?ô?i
    KhuyenMai NVARCHAR(279) NOT NULL DEFAULT '',			-- Thông tin khuy?n mãi khi mua s?n ph?m t?i th?i ?i?m t??ng ?ng
    CONSTRAINT pk_MaDHMaSP_ChiTietDH PRIMARY KEY (MaDH, MaSP),
    FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP) ON DELETE CASCADE ON UPDATE CASCADE
);
Go
ALTER TABLE SanPham
	ADD CONSTRAINT FK_SanPham_LoaiSP FOREIGN KEY (MaLoai) REFERENCES LoaiSP(MaLoai);
Go
	-- Insert Some Test data into LoaiSP Table
INSERT INTO LoaiSP (TenLoai) values(N'POLO')
INSERT INTO LoaiSP (TenLoai) values(N'SHIRT')
INSERT INTO LoaiSP (TenLoai) values(N'PLAZER TAY LỠ')
INSERT INTO LoaiSP (TenLoai) values(N'QUẦN JEANS')
INSERT INTO LoaiSP (TenLoai) values(N'QUẦN ÂU')
INSERT INTO LoaiSP (TenLoai) values(N'HOODIE')
INSERT INTO LoaiSP (TenLoai) values(N'SẢN PHẨM MỚI')
INSERT INTO LoaiSP (TenLoai) values(N'SẢN PHẨM BÁN CHẠY')
select * from LoaiSP
Go
-- Insert Some Test data into TaiKhoan Table
INSERT INTO TaiKhoan (TaiKhoanTV, MatKhau, HoTV, TenTV, GioiTinh, NgaySinh, Active)
VALUES ('ChiBao', '123456', N'Nguyễn Gia Chi', N'Bảo', 1, '2004-02-15', 1);
INSERT INTO TaiKhoan (TaiKhoanTV, MatKhau, HoTV, TenTV, GioiTinh, NgaySinh, Active)
VALUES ('Admin', 'Tamzit1006', N'Nguyễn Thành', N'Tâm', 1, '2004-06-10', 1);
select * from TaiKhoan
Go

-- Insert Some Test data into Product Table
Insert into SanPham (MaLoai, DuongDanAnh, DuongDanAnh1, DuongDanAnh2, DuongDanAnh3, TenSP, TomTatND, NgayDangSP, TaiKhoanTV, GiaBan, DonVi, SoLuong) 
values  (1,'polo/polo1.jpg', 'polo/polo1.1.jpg', 'polo/polo1.2.jpg', 'polo/polo1.3.jpg', N'Áo Phông Polo Nam Màu Trắng MANDO Tay Lỡ Cotton Cao Cấp Form Rộng Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 88000, 'Piece', 20),
		(1,'polo/polo2.jpg', 'polo/polo2.1.jpg', 'polo/polo2.2.jpg', 'polo/polo2.3.jpg', N'Áo Phông Polo Trắng Nam Sọc Tay Đen MANDO Tay Lỡ Cotton Cao Cấp Form Rộng Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 88000, 'Piece', 20),
		(1,'polo/polo3.jpg', 'polo/polo3.1.jpg', 'polo/polo3.2.jpg', 'polo/polo3.3.jpg', N'POLO SIGNATURE', NULL, GETDATE(), 'Admin', 88000, 'Piece', 20),
		(1,'polo/polo4.jpg', 'polo/polo4.1.jpg', 'polo/polo4.2.jpg', 'polo/polo4.3.jpg', N'Áo Polo Nam Cổ Chữ V Không Cúc MANDO Chất Liệu Cá Sấu TC Có Hình Thêu Ngực Phong Cách Hàn Quốc ', NULL, GETDATE(), 'Admin', 168000, 'Piece', 20),
		(1,'polo/polo5.jpg', 'polo/polo5.1.jpg', 'polo/polo5.2.jpg', 'polo/polo5.3.jpg', N'Áo Polo Nam MANDO Tay Lỡ Unisex Vải Cá Sấu TC Thoáng Mát Phong Cách Trẻ Trung Hàn Quốc', NULL, GETDATE(), 'Admin', 168000, 'Piece', 20),
		(1,'polo/polo6.jpg', 'polo/polo6.1.jpg', 'polo/polo6.2.jpg', 'polo/polo6.3.jpg', N'Bộ Quần Áo Nam MANDO Chất Liệu Xốp Mềm Mịn Nhẹ Thoáng Form Rộng Phong Cách Hàn Quốc', NULL, GETDATE(), 'Admin', 168000, 'Piece', 20),
		(1,'polo/polo7.jpg', 'polo/polo7.1.jpg', 'polo/polo7.2.jpg', 'polo/polo7.3.jpg', N'Áo Polo Khoá Zip Nam MANDO Hoạ Tiết Caro Mặt Cười Chất Liệu Cotton 100% Form Oversize Phong Cách Hàn Quốc', NULL, GETDATE(), 'Admin', 168000, 'Piece', 20),
		(1,'polo/polo8.jpg', 'polo/polo8.1.jpg', 'polo/polo8.2.jpg', 'polo/polo8.3.jpg', N'Áo Polo Khóa Kéo Nam MANDO Chất Liệu Cá Sấu Cổ Khóa Zip Form Rộng Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 198000, 'Piece', 20)
		
Insert into SanPham (MaLoai, DuongDanAnh, DuongDanAnh1, DuongDanAnh2, DuongDanAnh3, TenSP, TomTatND, NgayDangSP, TaiKhoanTV, GiaBan, DonVi, SoLuong) 
values  (2, 'shirt/shirt1.jpg', 'shirt/shirt1.1.jpg', 'shirt/shirt1.1.jpg', 'shirt/shirt1.3.jpg', N'Áo Sơ Mi Caro Nam MANDO Form Rộng Dài Tay Kiểu Dáng Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 128000, 'Piece', 30),
		(2, 'shirt/shirt2.jpg', 'shirt/shirt2.1.jpg', 'shirt/shirt2.1.jpg', 'shirt/shirt2.3.jpg', N'Áo Sơ Mi Caro Nam MANDO Kiểu Dáng Basic Unisex Hàn Quốc', NULL, GETDATE(), 'Admin', 88000, 'Piece', 30),
		(2, 'shirt/shirt3.jpg', 'shirt/shirt3.1.jpg', 'shirt/shirt3.1.jpg', 'shirt/shirt3.3.jpg', N'Áo sơ mi caro phong cách Hàn Quốc năng động trẻ trung xanh than nâu', NULL, GETDATE(), 'Admin', 128000, 'Piece', 30),
		(2, 'shirt/shirt4.jpg', 'shirt/shirt4.1.jpg', 'shirt/shirt4.1.jpg', 'shirt/shirt4.3.jpg', N'ÁO SƠ MI CARO TÚI HỘP NAM MANDO', NULL, GETDATE(), 'Admin', 128000, 'Piece', 30),
		(2, 'shirt/shirt5.jpg', 'shirt/shirt5.1.jpg', 'shirt/shirt5.1.jpg', 'shirt/shirt5.3.jpg', N'Áo Sơ Mi Cổ Tàu Giấu Cúc Tay Lỡ Chất Trượt Hàn Dáng Suông Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 128000, 'Piece', 30),
		(2, 'shirt/shirt6.jpg', 'shirt/shirt6.1.jpg', 'shirt/shirt6.1.jpg', 'shirt/shirt6.3.jpg', N'Áo Sơ Mi Cổ Tàu MANDO Form Rộng Chất Vải Đũi Xước ', NULL, GETDATE(), 'Admin', 198000, 'Piece', 30)

Insert into SanPham (MaLoai, DuongDanAnh, DuongDanAnh1, DuongDanAnh2, DuongDanAnh3, TenSP, TomTatND, NgayDangSP, TaiKhoanTV, GiaBan, DonVi, SoLuong) 
values  (3, 'blazer/blazer1.jpg', 'blazer/blazer1.1.jpg', 'blazer/blazer1.2.jpg', 'blazer/blazer1.3.jpg', N'Áo Blazer Vest 1 Lớp Nam MANDO Tay Lỡ Vải Tuysi Họa Tiết Caro Xám 2 Hàng Khuyu Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 168000, 'Piece', 50),
		(3, 'blazer/blazer2.jpg', 'blazer/blazer2.1.jpg', 'blazer/blazer2.2.jpg', 'blazer/blazer2.3.jpg', N'Áo Blazer Nam Tay Lỡ MANDO 2 Màu Xanh Đen Form Rộng Kiểu Dáng Thời Trang Hàn Quốc Basic', NULL, GETDATE(), 'Admin', 168000, 'Piece', 50),
		(3, 'blazer/blazer3.jpg', 'blazer/blazer3.1.jpg', 'blazer/blazer3.2.jpg', 'blazer/blazer3.3.jpg', N'Áo Blazer Nam Tay Lỡ MANDO Form Rộng Kiểu Dáng Thời Trang Hàn Quốc Basic Họa Tiết Thêu Would You', NULL, GETDATE(), 'Admin', 168000, 'Piece', 50),
		(3, 'blazer/blazer4.jpg', 'blazer/blazer4.1.jpg', 'blazer/blazer4.2.jpg', 'blazer/blazer4.3.jpg', N'Áo Blazer Nam Tay Lỡ MANDO Form Rộng Kiểu Dáng Thời Trang Hàn Quốc Basic Gắn Dây Xích Phong Cách', NULL, GETDATE(), 'Admin', 385000, 'Piece', 50),
		(3, 'blazer/blazer5.jpg', 'blazer/blazer5.1.jpg', 'blazer/blazer5.2.jpg', 'blazer/blazer5.3.jpg', N'Áo Blazer Tay Lỡ Nam Cổ Ve Xuôi MANDO Chất Liệu Flannel Cao Cấp, Mềm Mịn Không Co Nhăn, Thiết Kế Basic', NULL, GETDATE(), 'Admin', 128000, 'Piece', 50)

Insert into SanPham (MaLoai, DuongDanAnh, DuongDanAnh1, DuongDanAnh2, DuongDanAnh3, TenSP, TomTatND, NgayDangSP, TaiKhoanTV, GiaBan, DonVi, SoLuong) 
values  (4, 'quanjeans/jeans1.jpg', 'quanjeans/jeans1.1.jpg', 'quanjeans/jeans1.2.jpg', 'quanjeans/jeans1.3.jpg', N'Quần Jean Nam MANDO Ống Rộng Chất Bò Xanh Nhạt Kiểu Dáng Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 380000, 'piece', 30),
		(4, 'quanjeans/jeans2.jpg', 'quanjeans/jeans2.1.jpg', 'quanjeans/jeans2.2.jpg', 'quanjeans/jeans2.3.jpg', N'Quần Jean Nam MANDO Rách Gối Ống Suông Form Rộng Kiểu Dáng Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 329000, 'piece', 30),
		(4, 'quanjeans/jeans3.jpg', 'quanjeans/jeans3.1.jpg', 'quanjeans/jeans3.2.jpg', 'quanjeans/jeans3.3.jpg', N'QUẦN JEAN NAM ỐNG XUÔNG MANDO', NULL, GETDATE(), 'Admin', 350000, 'piece', 30),
		(4, 'quanjeans/jeans4.jpg', 'quanjeans/jeans4.1.jpg', 'quanjeans/jeans4.2.jpg', 'quanjeans/jeans4.3.jpg', N'Quần Jean Nam Rách Gối MANDO Vải Bò Cao Cấp 2 Màu Xanh Đen Form Suông Rộng Basic Unisex Thời Trang Hàn Quốc QJN056', NULL, GETDATE(), 'Admin', 364000, 'piece', 30)

Insert into SanPham (MaLoai, DuongDanAnh, DuongDanAnh1, DuongDanAnh2, DuongDanAnh3, TenSP, TomTatND, NgayDangSP, TaiKhoanTV, GiaBan, DonVi, SoLuong) 
values  (5, 'quanau/au1.jpg', 'quanau/au1.1.jpg', 'quanau/au1.2.jpg', 'quanau/au1.3.jpg', N'Quần Âu Dáng Suông MANDO Nam Chất Liệu Tuyết Mưa Dày Dặn, Co Giãn Phối Khuy Phong Cách Unisex', NULL, GETDATE(), 'Admin', 399000, 'Piece', 20),
		(5, 'quanau/au2.jpg', 'quanau/au2.1.jpg', 'quanau/au2.2.jpg', 'quanau/au2.3.jpg', N'QUẦN ÂU HÀN NAM DÁNG XUÔNG KÈM ĐAI MANDO', NULL, GETDATE(), 'Admin', 399000, 'Piece', 20),
		(5, 'quanau/au3.jpg', 'quanau/au3.1.jpg', 'quanau/au3.2.jpg', 'quanau/au3.3.jpg', N'Quần Âu Nam Cạp Chun Sau MANDO Có Túi Form Ống Rộng Phong Cách Basic Thể Thao Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 359000, 'Piece', 20),
		(5, 'quanau/au4.jpg', 'quanau/au4.1.jpg', 'quanau/au4.2.jpg', 'quanau/au4.3.jpg', N'Quần Âu Nam MANDO Công Sở Ống Côn Vải Tuyết Mưa Không Nhăn Cao Cấp Form Đứng Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 150000, 'Piece', 20),
		(5, 'quanau/au5.jpg', 'quanau/au5.1.jpg', 'quanau/au5.2.jpg', 'quanau/au5.3.jpg', N'Quần Âu Nam MANDO Ống Côn Công Sở Không Nhăn Đứng Form Vải Tuyết Mưa Cao Cấp Basic Trẻ Trung Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 150000, 'Piece', 20),
		(5, 'quanau/au6.jpg', 'quanau/au6.1.jpg', 'quanau/au6.2.jpg', 'quanau/au6.3.jpg', N'QUẦN ÂU NAM XẾP LY CẠP SAU CHUN', NULL, GETDATE(), 'Admin', 320000, 'Piece', 20)

Insert into SanPham (MaLoai, DuongDanAnh, DuongDanAnh1, DuongDanAnh2, DuongDanAnh3, TenSP, TomTatND, NgayDangSP, TaiKhoanTV, GiaBan, DonVi, SoLuong) 
values  (6, 'hoodie/hoodie1.jpg', 'hoodie/hoodie1.1.jpg', 'hoodie/hoodie1.2.jpg', 'hoodie/hoodie1.3.jpg', N'Áo Hoodie Nam Dài Tay 2 Cúc Bấm MANDO Chất Liệu Nỉ Chân Cua Form Rộng Hình In Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 279000, 'Piece', 20),
		(6, 'hoodie/hoodie2.jpg', 'hoodie/hoodie2.1.jpg', 'hoodie/hoodie2.2.jpg', 'hoodie/hoodie2.3.jpg', N'Áo Hoodie Nam MANDO Dài Tay Form Rộng Hình In Độc Đáo, Unisex Nhiều Màu Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 200000, 'Piece', 20),
		(6, 'hoodie/hoodie3.jpg', 'hoodie/hoodie3.1.jpg', 'hoodie/hoodie3.2.jpg', 'hoodie/hoodie3.3.jpg', N'Áo Hoodie Nam MANDO Dài Tay Form Rộng Trơn Basic Unisex Nhiều Màu Thời Trang Hàn Quốc ', NULL, GETDATE(), 'Admin', 244000, 'Piece', 20),
		(6, 'hoodie/hoodie4.jpg', 'hoodie/hoodie4.1.jpg', 'hoodie/hoodie4.2.jpg', 'hoodie/hoodie4.3.jpg', N'Áo Hoodie Nỉ Nam MANDO Cao Cấp, Chất Nỉ Cào Cotton Dày Dặn Mềm Mịn Form Rộng Phong Cách', NULL, GETDATE(), 'Admin', 349000, 'Piece', 20),
		(6, 'hoodie/hoodie5.jpg', 'hoodie/hoodie5.1.jpg', 'hoodie/hoodie5.2.jpg', 'hoodie/hoodie5.3.jpg', N'Áo Nỉ Hoodie Nam Dài Tay 2 Màu Đen Trắng MANDO Chất Nỉ Cao Cấp Form Rộng Hình In Basic Unisex Thời Trang Hàn Quốc', NULL, GETDATE(), 'Admin', 279000, 'Piece', 20),
		(6, 'hoodie/hoodie6.jpg', 'hoodie/hoodie6.1.jpg', 'hoodie/hoodie6.2.jpg', 'hoodie/hoodie6.3.jpg', N'Áo Nỉ Hoodie Nam Dài Tay 2 Màu Nâu Be MANDO Chất Nỉ Cao Cấp Form Rộng Hình In Basic Unisex Thời Trang Hàn Quốc HOD004', NULL, GETDATE(), 'Admin', 279000, 'Piece', 20)

select * from SanPham
GO

delete LoaiSP
delete SanPham