# Bài Tập Flutter - Manager App

## Bài Tập Tuần F02 - Authentication với OTP và JWT

### Mô tả dự án
Ứng dụng Authentication hoàn chỉnh với các tính năng:
1. **Register với OTP**: Đăng ký tài khoản và xác thực bằng mã OTP
2. **Login với JWT**: Đăng nhập và lưu JWT token an toàn
3. **Forget Password với OTP**: Quên mật khẩu và đặt lại bằng OTP
4. **Trang giới thiệu nhóm**: Hiển thị thông tin thành viên, tự động chuyển sau 10 giây

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
