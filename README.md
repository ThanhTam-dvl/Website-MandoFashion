# 👔 MandoFashion - Hệ thống Quản lý Cửa hàng Thời trang Nam

![ASP.NET MVC](https://img.shields.io/badge/ASP.NET_MVC-5C2D91?style=for-the-badge&logo=.net&logoColor=white)
![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)
![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![Entity Framework](https://img.shields.io/badge/Entity_Framework-512BD4?style=for-the-badge&logo=.net&logoColor=white)

**Hệ thống quản lý cửa hàng thời trang nam và bán hàng trực tuyến** - Giải pháp toàn diện cho việc vận hành và quản lý cửa hàng thời trang nam hiện đại.

> **Lưu ý:** Chưa cập nhật ảnh giao diện thực tế

## ✨ Tính năng chính

### 👤 Cho khách hàng
- Đăng ký và đăng nhập tài khoản
- Duyệt danh mục sản phẩm thời trang nam
- Tìm kiếm theo tên sản phẩm hoặc danh mục
- Xem chi tiết sản phẩm
- Thêm, sửa, xóa giỏ hàng
- Đặt hàng, thanh toán đơn hàng
- Theo dõi lịch sử đơn hàng
- Hủy đơn hàng

### 🛠 Cho quản trị viên
- Quản lý danh mục sản phẩm
- Thêm/sửa/xóa sản phẩm (CRUD)
- Quản lý bài viết và tin tức
- Duyệt và xử lý đơn hàng
- Quản lý tài khoản khách hàng và nhân viên
- Phân quyền truy cập (Admin/User)
- Dashboard thống kê

## ⚙️ Công nghệ sử dụng

- **Backend:** ASP.NET MVC 5+, C# 8.0+
- **Cơ sở dữ liệu:** SQL Server 2019+
- **ORM:** Entity Framework (Code First)
- **Frontend:** Razor Views (.cshtml), Bootstrap 5
- **Xác thực:** ASP.NET Identity
- **Package Manager:** NuGet
- **IDE:** Visual Studio 2022

## 🗂️ Cấu trúc cơ sở dữ liệu

> **Lưu ý:** Chưa cập nhật ảnh sơ đồ CSDL thực tế

**Các bảng chính** (từ ProductDataModel và SecurityDataModel):
- **Products:** Thông tin sản phẩm thời trang
- **Categories:** Danh mục sản phẩm
- **Customers:** Khách hàng
- **Orders:** Đơn hàng
- **OrderDetails:** Chi tiết đơn hàng
- **Employees:** Nhân viên
- **Users:** Người dùng hệ thống
- **Roles:** Vai trò phân quyền

## 🚀 Hướng dẫn cài đặt

### 🧰 Yêu cầu hệ thống
- .NET Framework 4.8+ hoặc .NET 6+
- Visual Studio 2022 (Community hoặc cao hơn)
- SQL Server 2019+ (LocalDB hoặc Express)
- NuGet Package Manager

### ⚙️ Cài đặt từng bước

#### 1. Clone repository
```bash
git clone https://github.com/ThanhTam-dvl/Website-MandoFashion.git
cd Website-MandoFashion
```

#### 2. Mở solution trong Visual Studio
Mở file `mandofashion.sln` (nếu có) hoặc project `mandofashion.csproj` bằng Visual Studio.

#### 3. Restore NuGet packages
- Trong Visual Studio: Right-click solution > Restore NuGet Packages.
- Hoặc qua Package Manager Console:
```
Update-Package -reinstall
```

#### 4. Cấu hình database
- Mở file `web.config` trong thư mục gốc.
- Cập nhật connection string cho SQL Server (ví dụ cho ProductDataModelContext và SecurityDataModelContext):

```xml
<connectionStrings>
  <add name="ProductDataModelContext" 
       connectionString="Server=(localdb)\mssqllocaldb;Database=MandoFashion_DB;Trusted_Connection=true;MultipleActiveResultSets=true" 
       providerName="System.Data.SqlClient" />
  <add name="SecurityDataModelContext" 
       connectionString="Server=(localdb)\mssqllocaldb;Database=Security_DB;Trusted_Connection=true;MultipleActiveResultSets=true" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

- Tạo cơ sở dữ liệu bằng cách chạy migrations (nếu sử dụng Entity Framework):
```
Enable-Migrations
Add-Migration InitialCreate
Update-Database
```

- Hoặc import từ file SQL đính kèm:
  - Chạy `MandoFashion_DB.sql` để tạo database sản phẩm.
  - Chạy `Security_DB.sql` để tạo database bảo mật.

#### 5. Khởi chạy ứng dụng
- Trong Visual Studio: Press F5 hoặc Ctrl+F5 để chạy.
- Ứng dụng chạy tại: `http://localhost:port` (port mặc định, ví dụ 44300).

## 👤 Tài khoản demo

**Người dùng (Khách hàng):**
- Email: `customer@mandofashion.com`
- Mật khẩu: `123456`

**Quản trị viên:**
- Email: `admin@mandofashion.com`
- Mật khẩu: `123456`

> **Lưu ý:** Tài khoản demo có thể cần tạo thủ công qua database nếu chưa có dữ liệu seed.

## 📁 Cấu trúc thư mục chính

```
Website-MandoFashion/
├── mandofashion/
│   ├── Areas/
│   │   └── PrivatePages/
│   │       └── PrivatePagesAreaRegistration.cs
│   ├── Controllers/
│   │   ├── ArticlesController.cs
│   │   ├── CategoriesOfProductsController.cs
│   │   ├── CustomersController.cs
│   │   ├── DashboardController.cs
│   │   ├── LoginController.cs
│   │   ├── NewArticlesController.cs
│   │   ├── NewProductController.cs
│   │   └── OrderListsController.cs
│   ├── Models/
│   │   ├── AnhSanPham.cs
│   │   ├── BaiViet.cs
│   │   ├── Cart.cs
│   │   ├── ChietKH.cs
│   │   ├── DonHang.cs
│   │   ├── Employee.cs
│   │   ├── KhachHang.cs
│   │   ├── LoaiSP.cs
│   │   ├── ProductDataModelContext.cs
│   │   ├── ProductDataModel.Designer.cs
│   │   ├── RoleMaster.cs
│   │   ├── SanPham.cs
│   │   ├── SecurityDataModelContext.cs
│   │   ├── TaiKhoan.cs
│   │   ├── User.cs
│   │   └── UserRolesMapping.cs
│   ├── Views/
│   │   ├── Articles/
│   │   │   └── Index.cshtml
│   │   ├── CategoriesOfProducts/
│   │   ├── Customers/
│   │   ├── Dashboard/
│   │   ├── Login/
│   │   ├── NewArticles/
│   │   ├── NewProduct/
│   │   ├── OrderLists/
│   │   ├── Accounts/
│   │   ├── Employees/
│   │   │   ├── Create.cshtml
│   │   │   ├── Delete.cshtml
│   │   │   ├── Details.cshtml
│   │   │   ├── Edit.cshtml
│   │   │   └── Index.cshtml
│   │   ├── Home/
│   │   ├── Product/
│   │   ├── ShoppingCart/
│   │   ├── Shared/
│   │   │   └── _ViewStart.cshtml
│   │   └── _ViewStart.cshtml
│   ├── bin/
│   ├── Content/
│   ├── css/
│   ├── images/
│   ├── js/
│   ├── obj/
│   ├── packages/
│   ├── Properties/
│   ├── web.config
│   ├── Global.asax
│   ├── Global.asax.cs
│   └── packages.config
├── 2200000922_NguyenThanhTam.pdf  # Báo cáo đồ án
├── MandoFashion_DB.sql            # Script database sản phẩm
├── Security_DB.sql                # Script database bảo mật
└── README.md
```

## 🌐 Routes chính

### MVC Routes
- `/` – Trang chủ (HomeController)
- `/Products/Category/{id}` – Danh mục sản phẩm
- `/Product/Details/{id}` – Chi tiết sản phẩm
- `/ShoppingCart` – Giỏ hàng
- `/Order/Checkout` – Thanh toán
- `/Order/History` – Lịch sử đơn hàng
- `/Dashboard` – Dashboard quản trị
- `/Login` – Đăng nhập
- `/Admin/Employees` – Quản lý nhân viên

### Areas/PrivatePages
Các route riêng tư cho admin: `/PrivatePages/Dashboard`, `/PrivatePages/Orders`, v.v.

## 🛠️ Scripts hữu ích

### Visual Studio / .NET
```bash
dotnet restore                  # Restore packages
dotnet build                    # Build project
dotnet run                      # Chạy ứng dụng
dotnet ef migrations add Name   # Thêm migration (nếu dùng EF Core)
dotnet ef database update       # Cập nhật database
```

### Package Manager Console (Visual Studio)
```
Add-Migration InitialCreate
Update-Database
```

## ✅ Kiểm thử

### Unit Testing (nếu có)
- Sử dụng xUnit hoặc NUnit qua NuGet.
- Chạy tests trong Visual Studio: Test > Run All Tests.

## 🤝 Đóng góp

1. Fork repo
2. Tạo branch mới:
   ```bash
   git checkout -b feature/tinh-nang-moi
   ```
3. Commit & push
4. Tạo pull request

## 🐞 Báo lỗi

Nếu phát hiện lỗi, vui lòng tạo Issue với:
- Mô tả lỗi
- Các bước tái hiện
- Ảnh chụp (nếu có)
- Version .NET/SQL Server đang sử dụng

## 📄 Giấy phép

Dự án được phát hành theo MIT License.  
Bản quyền © 2024 Nguyễn Thành Tâm.

## 📧 Liên hệ

- **Tác giả:** Nguyễn Thành Tâm
- **Email:** nguyenthanhtam10062004@gmail.com
- **MSSV:** 2200000922
- **Giảng viên hướng dẫn:** ThS. Đỗ Hoàng Nam

## 🖼️ Demo ảnh

*(Chưa cập nhật)*

- Trang chủ ASP.NET MVC
- Danh mục sản phẩm với Razor Views
- Giỏ hàng và đặt hàng
- Dashboard admin
- Database diagrams từ Entity Framework
