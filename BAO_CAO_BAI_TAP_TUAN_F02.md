# BÁO CÁO BÀI TẬP TUẦN F02
## ỨNG DỤNG AUTHENTICATION VỚI OTP VÀ JWT

---

## I. THÔNG TIN SINH VIÊN

**Họ và tên:** [Điền tên của bạn]  
**MSSV:** [Điền MSSV của bạn]  
**Lớp:** [Điền lớp của bạn]  
**Môn học:** Lập trình di động với Flutter

---

## II. YÊU CẦU BÀI TẬP

Xây dựng ứng dụng với các chức năng:
1. **Register với OTP**: Đăng ký tài khoản và xác thực bằng mã OTP
2. **Login với JWT**: Đăng nhập và lưu JWT token
3. **Forget Password với OTP**: Quên mật khẩu và đặt lại bằng OTP

---

## III. CÔNG NGHỆ SỬ DỤNG

### 1. Flutter Packages
- `http: ^1.2.0` - HTTP client để gọi API
- `flutter_secure_storage: ^9.0.0` - Lưu trữ JWT token an toàn
- `pinput: ^3.0.1` - Widget nhập OTP đẹp mắt
- `provider: ^6.1.1` - State management
- `flutter_spinkit: ^5.2.0` - Loading indicators

### 2. Kiến trúc ứng dụng
```
lib/
├── main.dart                           # Entry point
├── config/
│   └── api_config.dart                 # Cấu hình API endpoints
├── models/
│   ├── user_model.dart                 # Model User
│   └── auth_response.dart              # Model Response từ API
├── services/
│   └── auth_service.dart               # Service xử lý authentication
└── screens/
    ├── team_intro_screen.dart          # Màn hình giới thiệu nhóm
    ├── login_screen_new.dart           # Màn hình đăng nhập (JWT)
    ├── register_screen.dart            # Màn hình đăng ký
    ├── otp_verification_screen.dart    # Màn hình xác thực OTP
    ├── forgot_password_screen.dart     # Màn hình quên mật khẩu
    ├── reset_password_screen.dart      # Màn hình đặt lại mật khẩu
    └── home_screen.dart                # Màn hình chính sau login
```

---

## IV. CHI TIẾT CHỨC NĂNG

### 1. Register với OTP

**Luồng hoạt động:**
1. Người dùng nhập thông tin: Họ tên, Email, Số điện thoại, Mật khẩu
2. Ấn nút "ĐĂNG KÝ"
3. Gọi API `POST /api/auth/register`
4. Nếu thành công, chuyển sang màn hình nhập OTP
5. Nhập mã OTP 6 số
6. Gọi API `POST /api/auth/verify-otp`
7. Xác thực thành công → Chuyển sang màn hình đăng nhập

**Validation:**
- Email phải đúng định dạng
- Mật khẩu tối thiểu 6 ký tự
- Xác nhận mật khẩu phải khớp
- Họ tên không được để trống

**File liên quan:**
- `lib/screens/register_screen.dart`
- `lib/screens/otp_verification_screen.dart`
- `lib/services/auth_service.dart`

### 2. Login với JWT

**Luồng hoạt động:**
1. Người dùng nhập Email và Mật khẩu
2. Ấn nút "ĐĂNG NHẬP"
3. Gọi API `POST /api/auth/login`
4. Nhận JWT token từ server
5. Lưu token vào Secure Storage
6. Chuyển sang màn hình Home

**Bảo mật:**
- JWT token được lưu trong `flutter_secure_storage`
- Token được gửi kèm trong header `Authorization: Bearer <token>`
- Có chức năng logout để xóa token

**File liên quan:**
- `lib/screens/login_screen_new.dart`
- `lib/services/auth_service.dart`

### 3. Forget Password với OTP

**Luồng hoạt động:**
1. Người dùng ấn "Quên mật khẩu?" trên màn hình login
2. Nhập Email
3. Gọi API `POST /api/auth/forgot-password`
4. Nhận mã OTP qua email
5. Nhập OTP và mật khẩu mới
6. Gọi API `POST /api/auth/reset-password`
7. Đặt lại mật khẩu thành công → Chuyển về màn hình login

**Tính năng bổ sung:**
- Countdown 60 giây trước khi có thể gửi lại OTP
- Nút "Gửi lại" OTP
- Validation mật khẩu mới

**File liên quan:**
- `lib/screens/forgot_password_screen.dart`
- `lib/screens/reset_password_screen.dart`
- `lib/services/auth_service.dart`

---

## V. CẤU HÌNH API

### Cấu hình trong `lib/config/api_config.dart`

```dart
class ApiConfig {
  // Thay đổi URL này thành API của nhóm bạn
  static const String baseUrl = 'https://your-api-url.com/api';
  
  // Auth endpoints
  static const String register = '$baseUrl/auth/register';
  static const String verifyOtp = '$baseUrl/auth/verify-otp';
  static const String login = '$baseUrl/auth/login';
  static const String forgotPassword = '$baseUrl/auth/forgot-password';
  static const String resetPassword = '$baseUrl/auth/reset-password';
  static const String resendOtp = '$baseUrl/auth/resend-otp';
}
```

### API Endpoints cần thiết

#### 1. Register
```
POST /api/auth/register
Body: {
  "email": "user@example.com",
  "password": "123456",
  "name": "Nguyen Van A",
  "phone": "0123456789"
}
Response: {
  "success": true,
  "message": "Đăng ký thành công. Vui lòng kiểm tra email để nhận OTP"
}
```

#### 2. Verify OTP
```
POST /api/auth/verify-otp
Body: {
  "email": "user@example.com",
  "otp": "123456"
}
Response: {
  "success": true,
  "message": "Xác thực thành công",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "1",
    "email": "user@example.com",
    "name": "Nguyen Van A"
  }
}
```

#### 3. Login
```
POST /api/auth/login
Body: {
  "email": "user@example.com",
  "password": "123456"
}
Response: {
  "success": true,
  "message": "Đăng nhập thành công",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "1",
    "email": "user@example.com",
    "name": "Nguyen Van A"
  }
}
```

#### 4. Forgot Password
```
POST /api/auth/forgot-password
Body: {
  "email": "user@example.com"
}
Response: {
  "success": true,
  "message": "Mã OTP đã được gửi đến email của bạn"
}
```

#### 5. Reset Password
```
POST /api/auth/reset-password
Body: {
  "email": "user@example.com",
  "otp": "123456",
  "newPassword": "newpass123"
}
Response: {
  "success": true,
  "message": "Đặt lại mật khẩu thành công"
}
```

#### 6. Resend OTP
```
POST /api/auth/resend-otp
Body: {
  "email": "user@example.com"
}
Response: {
  "success": true,
  "message": "Đã gửi lại mã OTP"
}
```

---

## VI. HƯỚNG DẪN CÀI ĐẶT VÀ CHẠY

### 1. Clone repository
```bash
git clone [link-github-của-bạn]
cd flutter_application
```

### 2. Cài đặt dependencies
```bash
flutter pub get
```

### 3. Cấu hình API
Mở file `lib/config/api_config.dart` và thay đổi `baseUrl` thành URL API của nhóm bạn.

### 4. Chạy ứng dụng
```bash
# Kiểm tra thiết bị
flutter devices

# Chạy trên Chrome
flutter run -d chrome

# Chạy trên Android
flutter run -d android

# Chạy trên iOS
flutter run -d ios
```

---

## VII. GIAO DIỆN ỨNG DỤNG

### 1. Màn hình giới thiệu nhóm
- Hiển thị thông tin 3 thành viên
- Countdown 10 giây
- Tự động chuyển sang màn hình Login

### 2. Màn hình đăng nhập
- Form đăng nhập với Email và Password
- Nút "Quên mật khẩu?"
- Link đến màn hình đăng ký
- Gradient màu xanh dương

### 3. Màn hình đăng ký
- Form đầy đủ: Họ tên, Email, SĐT, Mật khẩu
- Validation đầy đủ
- Gradient màu tím

### 4. Màn hình xác thực OTP
- Input OTP 6 số với Pinput widget
- Countdown 60 giây
- Nút gửi lại OTP
- Gradient màu xanh-tím

### 5. Màn hình quên mật khẩu
- Nhập email
- Gradient màu cam-đỏ

### 6. Màn hình đặt lại mật khẩu
- Input OTP 6 số
- Nhập mật khẩu mới
- Xác nhận mật khẩu
- Gradient màu cam-đỏ

### 7. Màn hình Home
- Hiển thị thông báo đăng nhập thành công
- Danh sách tính năng đã hoàn thành
- Nút Logout

---

## VIII. TESTING

### Test Cases

#### 1. Register Flow
- [ ] Đăng ký với thông tin hợp lệ
- [ ] Đăng ký với email không hợp lệ
- [ ] Đăng ký với mật khẩu < 6 ký tự
- [ ] Đăng ký với mật khẩu không khớp
- [ ] Xác thực OTP đúng
- [ ] Xác thực OTP sai
- [ ] Gửi lại OTP

#### 2. Login Flow
- [ ] Đăng nhập với thông tin đúng
- [ ] Đăng nhập với email sai
- [ ] Đăng nhập với mật khẩu sai
- [ ] Kiểm tra JWT token được lưu
- [ ] Logout và xóa token

#### 3. Forgot Password Flow
- [ ] Gửi OTP với email hợp lệ
- [ ] Gửi OTP với email không tồn tại
- [ ] Đặt lại mật khẩu với OTP đúng
- [ ] Đặt lại mật khẩu với OTP sai
- [ ] Đặt lại mật khẩu với mật khẩu mới không hợp lệ

---

## IX. BẢO MẬT

### 1. JWT Token
- Token được lưu trong `flutter_secure_storage`
- Không lưu trong SharedPreferences hoặc biến thường
- Token được gửi trong header Authorization

### 2. Password
- Không hiển thị password khi nhập (obscureText)
- Có nút show/hide password
- Validation độ dài tối thiểu

### 3. OTP
- OTP có thời gian hết hạn
- Giới hạn số lần nhập sai (tùy backend)
- Countdown trước khi gửi lại

---

## X. KẾT LUẬN

### Đã hoàn thành:
✅ Chức năng Register với OTP  
✅ Chức năng Login với JWT  
✅ Chức năng Forget Password với OTP  
✅ Xác thực OTP  
✅ Lưu trữ JWT token an toàn  
✅ Giao diện đẹp mắt, responsive  
✅ Validation đầy đủ  
✅ Error handling  

### Hướng phát triển:
- Thêm chức năng refresh token
- Thêm biometric authentication (vân tay, Face ID)
- Thêm social login (Google, Facebook)
- Thêm profile management
- Thêm change password

---

## XI. LINK GITHUB

**Repository:** [Link GitHub của bạn]

**Commit message:** "bài tập tuần F02"

---

## XII. SCREENSHOTS

[Thêm screenshots của các màn hình ở đây]

1. Màn hình giới thiệu nhóm
2. Màn hình đăng nhập
3. Màn hình đăng ký
4. Màn hình xác thực OTP
5. Màn hình quên mật khẩu
6. Màn hình đặt lại mật khẩu
7. Màn hình Home

---

**Ngày hoàn thành:** [Điền ngày]  
**Sinh viên thực hiện:** [Tên của bạn]
