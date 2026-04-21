# Bài Tập Flutter - Manager App

## 🎯 Tổng quan dự án

Ứng dụng quản lý hệ thống bán hàng hoàn chỉnh với 2 phần:
1. **User App**: Authentication (Register, Login, Forget Password) với OTP và JWT
2. **Manager/Admin App**: Quản lý toàn bộ hệ thống

---

## 📱 Bài Tập Tuần F02 - Authentication với OTP và JWT

### Mô tả
Ứng dụng Authentication hoàn chỉnh với các tính năng:
1. **Register với OTP**: Đăng ký tài khoản và xác thực bằng mã OTP
2. **Login với JWT**: Đăng nhập và lưu JWT token an toàn
3. **Forget Password với OTP**: Quên mật khẩu và đặt lại bằng OTP
4. **Trang giới thiệu nhóm**: Hiển thị thông tin thành viên, tự động chuyển sau 10 giây

---

## 🏢 Manager/Admin App - Quản lý Hệ thống

### Mô tả
Ứng dụng quản lý dành cho Manager/Admin với đầy đủ chức năng:

### ✨ Tính năng chính

#### 1. Dashboard Tổng quan
- Hiển thị doanh thu (hôm nay, tháng này, năm nay)
- Thống kê đơn hàng (tổng số, chờ xử lý)
- Thống kê sản phẩm (tổng số, sắp hết hàng)
- Thống kê người dùng
- Menu điều hướng nhanh

#### 2. Quản lý Sản phẩm
- ✅ Xem danh sách sản phẩm
- ✅ Thêm sản phẩm mới
- ✅ Sửa thông tin sản phẩm
- ✅ Xóa sản phẩm
- ✅ Cảnh báo tồn kho thấp
- ✅ Format giá tiền VNĐ

#### 3. Quản lý Đơn hàng
- ✅ Xem danh sách đơn hàng
- ✅ Lọc theo trạng thái (Chờ xử lý, Đã xác nhận, Đang giao, Đã giao, Đã hủy)
- ✅ Xem chi tiết đơn hàng
- ✅ Cập nhật trạng thái đơn hàng
- ✅ Xem thông tin khách hàng và sản phẩm

#### 4. Quản lý Khuyến mãi
- ✅ Xem danh sách khuyến mãi
- ✅ Thêm khuyến mãi mới
- ✅ Sửa thông tin khuyến mãi
- ✅ Xóa khuyến mãi
- ✅ 2 loại: Giảm theo % hoặc số tiền cố định
- ✅ Theo dõi số lần sử dụng
- ✅ Hiển thị trạng thái hết hạn

#### 5. Quản lý Doanh thu
- ✅ Báo cáo doanh thu theo ngày/tháng/năm
- ✅ Hiển thị doanh thu, chi phí, lợi nhuận
- ✅ Tính tỷ lệ lợi nhuận (%)
- ✅ Thống kê số đơn hàng và sản phẩm bán

#### 6. Quản lý Người dùng
- ✅ Xem danh sách người dùng
- ✅ Xem thông tin chi tiết
- ✅ Kích hoạt/Vô hiệu hóa tài khoản

## Thành viên nhóm
- Trần Hoàng Phúc Quân
- Hoàng Thanh Tú 
- Nguyễn Thanh Mạnh Hùng


## Hướng dẫn cài đặt môi trường

### 1. Cài đặt Flutter SDK
- Truy cập trang chủ Flutter: https://docs.flutter.dev/
- Tải Flutter SDK phù hợp với hệ điều hành của bạn (Windows/macOS/Linux)
- Giải nén và thêm Flutter vào PATH
- Chạy lệnh kiểm tra: `flutter doctor`

### 2. Cài đặt IDE
- Android Studio hoặc Visual Studio Code
- Cài đặt Flutter plugin/extension

### 3. Cài đặt Android SDK (cho Android)
- Cài đặt Android Studio
- Cài đặt Android SDK và Android Emulator

## Hướng dẫn chạy dự án

### Bước 1: Clone repository
```bash
git clone [link-github-của-bạn]
cd flutter_application
```

### Bước 2: Cài đặt dependencies
```bash
flutter pub get
```

### Bước 3: Kiểm tra thiết bị
```bash
flutter devices
```

### Bước 4: Chạy ứng dụng
```bash
flutter run
```

Hoặc chạy trên thiết bị cụ thể:
```bash
flutter run -d chrome        # Chạy trên Chrome
flutter run -d windows       # Chạy trên Windows
flutter run -d [device-id]   # Chạy trên thiết bị Android/iOS
```

## Cấu trúc dự án

```
lib/
├── main.dart                    # File chính của ứng dụng
└── screens/
    ├── team_intro_screen.dart   # Trang giới thiệu nhóm
    └── login_screen.dart        # Trang đăng nhập manager
```

## Tính năng

### Trang giới thiệu nhóm (Team Intro Screen)
- Hiển thị thông tin 3 thành viên nhóm
- Đếm ngược 10 giây
- Tự động chuyển sang trang Login sau 10 giây
- Giao diện gradient đẹp mắt

### Trang Login Manager
- Form đăng nhập với validation
- Trường username và password
- Hiện/ẩn mật khẩu
- Nút đăng nhập với thông báo
- Giao diện chuyên nghiệp

## Công nghệ sử dụng
- Flutter SDK 3.11.3
- Dart
- Material Design 3

## Ghi chú
- Ứng dụng sử dụng Material Design 3
- Hỗ trợ đa nền tảng (Android, iOS, Web, Desktop)
- Code được tổ chức theo cấu trúc rõ ràng, dễ bảo trì

## Liên hệ
[Thông tin liên hệ của bạn]

---
**Bài tập Flutter 1** - Được tạo bởi [Tên của bạn]


## Công nghệ sử dụng

### Flutter Packages
- `http: ^1.2.0` - HTTP client để gọi API
- `flutter_secure_storage: ^9.0.0` - Lưu trữ JWT token an toàn
- `pinput: ^3.0.1` - Widget nhập OTP đẹp mắt
- `provider: ^6.1.1` - State management
- `flutter_spinkit: ^5.2.0` - Loading indicators

### Kiến trúc
```
lib/
├── main.dart
├── config/
│   └── api_config.dart
├── models/
│   ├── user_model.dart
│   └── auth_response.dart
├── services/
│   └── auth_service.dart
└── screens/
    ├── team_intro_screen.dart
    ├── login_screen_new.dart
    ├── register_screen.dart
    ├── otp_verification_screen.dart
    ├── forgot_password_screen.dart
    ├── reset_password_screen.dart
    └── home_screen.dart
```

## Tính năng chi tiết

### 1. Register với OTP
- Form đăng ký: Họ tên, Email, SĐT, Mật khẩu
- Validation đầy đủ
- Gửi OTP qua email
- Xác thực OTP 6 số
- Countdown và resend OTP

### 2. Login với JWT
- Đăng nhập bằng Email và Password
- Nhận và lưu JWT token
- Lưu trữ token an toàn với flutter_secure_storage
- Auto-redirect sau khi login thành công

### 3. Forget Password với OTP
- Nhập email để nhận OTP
- Xác thực OTP
- Đặt lại mật khẩu mới
- Validation mật khẩu

### 4. Bảo mật
- JWT token lưu trong secure storage
- Password được mã hóa khi gửi
- OTP có thời gian hết hạn
- Validation đầy đủ

## Cấu hình API

Mở file `lib/config/api_config.dart` và thay đổi `baseUrl`:

```dart
static const String baseUrl = 'https://your-api-url.com/api';
```

### API Endpoints cần thiết:
- `POST /api/auth/register` - Đăng ký
- `POST /api/auth/verify-otp` - Xác thực OTP
- `POST /api/auth/login` - Đăng nhập
- `POST /api/auth/forgot-password` - Quên mật khẩu
- `POST /api/auth/reset-password` - Đặt lại mật khẩu
- `POST /api/auth/resend-otp` - Gửi lại OTP

Chi tiết format request/response xem trong file `BAO_CAO_BAI_TAP_TUAN_F02.md`

## Hướng dẫn chạy dự án

### Bước 1: Clone repository
```bash
git clone [link-github-của-bạn]
cd flutter_application
```

### Bước 2: Cài đặt dependencies
```bash
flutter pub get
```

### Bước 3: Cấu hình API
Sửa file `lib/config/api_config.dart` với URL API của nhóm bạn

### Bước 4: Chạy ứng dụng
```bash
flutter run
```

Hoặc chạy trên thiết bị cụ thể:
```bash
flutter run -d chrome        # Chrome
flutter run -d windows       # Windows
flutter run -d android       # Android
```

## Screenshots

### Màn hình chính
1. Team Intro Screen - Giới thiệu nhóm với countdown
2. Login Screen - Đăng nhập với JWT
3. Register Screen - Đăng ký tài khoản
4. OTP Verification - Xác thực OTP 6 số
5. Forgot Password - Quên mật khẩu
6. Reset Password - Đặt lại mật khẩu
7. Home Screen - Trang chủ sau khi đăng nhập

## Giao diện

- Gradient backgrounds đẹp mắt
- Material Design 3
- Responsive layout
- Loading indicators
- Error handling với SnackBar
- Form validation

## Testing

Để test ứng dụng mà không cần backend thật, bạn có thể:
1. Sử dụng mock API (json-server, mockapi.io)
2. Tạo backend đơn giản với Node.js/Express
3. Sử dụng Firebase Authentication

## Báo cáo

Xem file `BAO_CAO_BAI_TAP_TUAN_F02.md` để có báo cáo chi tiết về:
- Yêu cầu bài tập
- Công nghệ sử dụng
- Chi tiết chức năng
- API endpoints
- Test cases
- Bảo mật

## Commit message

```
bài tập tuần F02
```

## Liên hệ

**Nhóm thực hiện:**
- Trần Hoàng Phúc Quân
- Hoàng Thanh Tú
- Nguyễn Thanh Mạnh Hùng

---
**Bài tập tuần F02** - Authentication với OTP và JWT


---

## 📁 Cấu trúc dự án

```
lib/
├── config/
│   └── api_config.dart                     # Cấu hình API
├── models/
│   ├── user_model.dart                     # Model User
│   ├── auth_response.dart                  # Model Auth Response
│   ├── product_model.dart                  # Model Sản phẩm
│   ├── order_model.dart                    # Model Đơn hàng
│   ├── promotion_model.dart                # Model Khuyến mãi
│   └── revenue_model.dart                  # Model Doanh thu
├── services/
│   ├── auth_service.dart                   # Service Authentication
│   └── manager_service.dart                # Service Manager
└── screens/
    ├── team_intro_screen.dart              # Giới thiệu nhóm
    ├── login_screen_new.dart               # Đăng nhập
    ├── register_screen.dart                # Đăng ký
    ├── otp_verification_screen.dart        # Xác thực OTP
    ├── forgot_password_screen.dart         # Quên mật khẩu
    ├── reset_password_screen.dart          # Đặt lại mật khẩu
    ├── home_screen.dart                    # Trang chủ
    └── manager/
        ├── manager_dashboard_screen.dart           # Dashboard
        ├── products_management_screen.dart         # QL Sản phẩm
        ├── orders_management_screen.dart           # QL Đơn hàng
        ├── promotions_management_screen.dart       # QL Khuyến mãi
        ├── revenue_management_screen.dart          # QL Doanh thu
        └── users_management_screen.dart            # QL Người dùng
```

---

## 🚀 Hướng dẫn chạy dự án

### Bước 1: Clone repository
```bash
git clone [link-github-của-bạn]
cd flutter_application
```

### Bước 2: Cài đặt dependencies
```bash
flutter pub get
```

### Bước 3: Cấu hình API
Sửa file `lib/config/api_config.dart` với URL API của nhóm bạn:
```dart
static const String baseUrl = 'https://your-api-url.com/api';
```

### Bước 4: Chạy ứng dụng
```bash
flutter run
```

Hoặc chạy trên thiết bị cụ thể:
```bash
flutter run -d chrome        # Chrome
flutter run -d windows       # Windows
flutter run -d android       # Android
```

---

## 🔌 API Endpoints

### Authentication Endpoints
- `POST /api/auth/register` - Đăng ký
- `POST /api/auth/verify-otp` - Xác thực OTP
- `POST /api/auth/login` - Đăng nhập
- `POST /api/auth/forgot-password` - Quên mật khẩu
- `POST /api/auth/reset-password` - Đặt lại mật khẩu
- `POST /api/auth/resend-otp` - Gửi lại OTP

### Manager Endpoints
- `GET /api/manager/dashboard` - Dashboard stats
- `GET /api/manager/products` - Danh sách sản phẩm
- `POST /api/manager/products` - Thêm sản phẩm
- `PUT /api/manager/products/:id` - Cập nhật sản phẩm
- `DELETE /api/manager/products/:id` - Xóa sản phẩm
- `GET /api/manager/orders` - Danh sách đơn hàng
- `PATCH /api/manager/orders/:id/status` - Cập nhật trạng thái
- `GET /api/manager/promotions` - Danh sách khuyến mãi
- `POST /api/manager/promotions` - Thêm khuyến mãi
- `GET /api/manager/revenue?period=month` - Báo cáo doanh thu
- `GET /api/manager/users` - Danh sách người dùng

Chi tiết format request/response xem trong `BAO_CAO_MANAGER_APP.md`

---

## 📸 Screenshots

### User App
1. Team Intro Screen - Giới thiệu nhóm với countdown
2. Login Screen - Đăng nhập với JWT
3. Register Screen - Đăng ký tài khoản
4. OTP Verification - Xác thực OTP 6 số
5. Forgot Password - Quên mật khẩu
6. Reset Password - Đặt lại mật khẩu
7. Home Screen - Trang chủ

### Manager App
1. Manager Dashboard - Tổng quan hệ thống
2. Products Management - Quản lý sản phẩm
3. Orders Management - Quản lý đơn hàng
4. Promotions Management - Quản lý khuyến mãi
5. Revenue Management - Báo cáo doanh thu
6. Users Management - Quản lý người dùng

---

## 🎨 Giao diện

- Gradient backgrounds đẹp mắt
- Material Design 3
- Responsive layout
- Loading indicators
- Error handling với SnackBar
- Form validation
- Pull-to-refresh
- Icon và màu sắc trực quan

---

## 📚 Tài liệu

- `README.md` - Hướng dẫn tổng quan (file này)
- `BAO_CAO_BAI_TAP_TUAN_F02.md` - Báo cáo chi tiết bài tập F02
- `BAO_CAO_MANAGER_APP.md` - Báo cáo chi tiết Manager App
- `CHECKLIST_BAI_TAP_F02.md` - Checklist kiểm tra
- `HUONG_DAN_PUSH_GITHUB.md` - Hướng dẫn push GitHub
- `QUICK_START.md` - Hướng dẫn nhanh

---

## 🧪 Testing

Để test ứng dụng mà không cần backend thật, bạn có thể:
1. Sử dụng mock API (json-server, mockapi.io)
2. Tạo backend đơn giản với Node.js/Express
3. Sử dụng Firebase

---

## 📝 Commit History

```
1b6b4b4 - Hoàn thành ứng dụng Manager/Admin
359158f - Thêm tài liệu hướng dẫn và checklist
1696ec5 - bài tập tuần F02
ca529d0 - bài tập flutter 1
```

---

## 👥 Thành viên nhóm

- Trần Hoàng Phúc Quân
- Hoàng Thanh Tú
- Nguyễn Thanh Mạnh Hùng

---

## 📞 Liên hệ

[Thông tin liên hệ của bạn]

---

**Bài tập Flutter** - Authentication + Manager App  
**Thời gian:** Tháng 3 - Tháng 4, 2026
