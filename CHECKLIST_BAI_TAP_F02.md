# ✅ CHECKLIST BÀI TẬP TUẦN F02

## 📋 Yêu cầu bài tập

- [x] Xây dựng chức năng Register dùng OTP
- [x] Xây dựng chức năng Login dùng JWT
- [x] Xây dựng chức năng Forget Password dùng OTP
- [x] Giao diện tùy chỉnh đẹp mắt
- [x] Tích hợp API (cần cấu hình URL)
- [x] Commit với message "bài tập tuần F02"
- [ ] Push lên GitHub cá nhân
- [ ] Nộp source code và link GitHub lên UTEXLms

---

## 📁 Cấu trúc file đã tạo

### Config
- [x] `lib/config/api_config.dart` - Cấu hình API endpoints

### Models
- [x] `lib/models/user_model.dart` - Model User
- [x] `lib/models/auth_response.dart` - Model Response

### Services
- [x] `lib/services/auth_service.dart` - Service xử lý authentication

### Screens
- [x] `lib/screens/team_intro_screen.dart` - Giới thiệu nhóm (đã có)
- [x] `lib/screens/login_screen_new.dart` - Đăng nhập với JWT
- [x] `lib/screens/register_screen.dart` - Đăng ký với OTP
- [x] `lib/screens/otp_verification_screen.dart` - Xác thực OTP
- [x] `lib/screens/forgot_password_screen.dart` - Quên mật khẩu
- [x] `lib/screens/reset_password_screen.dart` - Đặt lại mật khẩu
- [x] `lib/screens/home_screen.dart` - Trang chủ

### Documentation
- [x] `README.md` - Hướng dẫn dự án
- [x] `BAO_CAO_BAI_TAP_TUAN_F02.md` - Báo cáo chi tiết
- [x] `HUONG_DAN_PUSH_GITHUB.md` - Hướng dẫn push GitHub
- [x] `CHECKLIST_BAI_TAP_F02.md` - File này

### Dependencies
- [x] `pubspec.yaml` - Đã thêm các package cần thiết

---

## 🔧 Các bước cần làm tiếp

### 1. Cấu hình API (BẮT BUỘC)

Mở file `lib/config/api_config.dart` và thay đổi:

```dart
static const String baseUrl = 'https://your-api-url.com/api';
```

Thành URL API của nhóm bạn, ví dụ:
```dart
static const String baseUrl = 'https://api.nhom1.com/api';
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Test ứng dụng

```bash
flutter run
```

Kiểm tra các chức năng:
- [ ] Trang giới thiệu nhóm hiển thị đúng
- [ ] Chuyển trang sau 10 giây
- [ ] Form đăng ký hoạt động
- [ ] Form đăng nhập hoạt động
- [ ] Quên mật khẩu hoạt động
- [ ] OTP verification hoạt động
- [ ] Validation form đúng

### 4. Push lên GitHub

```bash
# Kiểm tra remote
git remote -v

# Nếu chưa có remote, thêm vào
git remote add origin https://github.com/username/flutter_application.git

# Push code
git push origin main
```

Chi tiết xem file `HUONG_DAN_PUSH_GITHUB.md`

### 5. Nộp bài

1. Copy link GitHub: `https://github.com/username/flutter_application`
2. Truy cập UTEXLms
3. Nộp:
   - Source code (có thể zip hoặc link GitHub)
   - Link GitHub cá nhân

---

## 📦 Packages đã sử dụng

```yaml
dependencies:
  http: ^1.2.0                      # HTTP client
  provider: ^6.1.1                  # State management
  flutter_secure_storage: ^9.0.0   # Lưu JWT token
  pinput: ^3.0.1                    # OTP input
  flutter_spinkit: ^5.2.0           # Loading indicators
```

---

## 🎨 Tính năng đã hoàn thành

### Register với OTP
- [x] Form đăng ký đầy đủ (name, email, phone, password)
- [x] Validation form
- [x] Gọi API register
- [x] Chuyển sang màn hình OTP
- [x] Nhập OTP 6 số
- [x] Countdown 60 giây
- [x] Resend OTP
- [x] Xác thực OTP thành công

### Login với JWT
- [x] Form đăng nhập (email, password)
- [x] Validation form
- [x] Gọi API login
- [x] Nhận JWT token
- [x] Lưu token vào secure storage
- [x] Chuyển sang màn hình Home
- [x] Logout và xóa token

### Forget Password với OTP
- [x] Nhập email
- [x] Gọi API forgot password
- [x] Nhận OTP
- [x] Nhập OTP và mật khẩu mới
- [x] Validation mật khẩu
- [x] Đặt lại mật khẩu thành công

### UI/UX
- [x] Gradient backgrounds đẹp mắt
- [x] Material Design 3
- [x] Loading indicators
- [x] Error handling với SnackBar
- [x] Show/hide password
- [x] Responsive layout

---

## 🔐 Bảo mật

- [x] JWT token lưu trong flutter_secure_storage
- [x] Password không hiển thị (obscureText)
- [x] Validation đầy đủ
- [x] Error handling

---

## 📝 API Endpoints cần có

Backend của nhóm cần implement các endpoints sau:

1. `POST /api/auth/register` - Đăng ký
2. `POST /api/auth/verify-otp` - Xác thực OTP
3. `POST /api/auth/login` - Đăng nhập
4. `POST /api/auth/forgot-password` - Quên mật khẩu
5. `POST /api/auth/reset-password` - Đặt lại mật khẩu
6. `POST /api/auth/resend-otp` - Gửi lại OTP

Chi tiết format request/response xem trong `BAO_CAO_BAI_TAP_TUAN_F02.md`

---

## 🐛 Troubleshooting

### Lỗi: Package not found
```bash
flutter pub get
flutter pub upgrade
```

### Lỗi: API connection failed
- Kiểm tra URL trong `lib/config/api_config.dart`
- Kiểm tra backend đang chạy
- Kiểm tra network/internet

### Lỗi: Secure storage
- Trên Android: Cần Android SDK 18+
- Trên iOS: Tự động hoạt động
- Trên Web: Sử dụng localStorage thay thế

### Lỗi: Build failed
```bash
flutter clean
flutter pub get
flutter run
```

---

## 📸 Screenshots cần chụp

Để nộp bài đầy đủ, chụp screenshots của:

1. [ ] Màn hình giới thiệu nhóm
2. [ ] Màn hình đăng nhập
3. [ ] Màn hình đăng ký
4. [ ] Màn hình xác thực OTP
5. [ ] Màn hình quên mật khẩu
6. [ ] Màn hình đặt lại mật khẩu
7. [ ] Màn hình Home sau login
8. [ ] GitHub repository với commit "bài tập tuần F02"

---

## ✨ Điểm cộng (nếu có thời gian)

- [ ] Thêm loading animation đẹp hơn
- [ ] Thêm dark mode
- [ ] Thêm internationalization (i18n)
- [ ] Thêm unit tests
- [ ] Thêm integration tests
- [ ] Thêm CI/CD với GitHub Actions
- [ ] Deploy web version lên GitHub Pages

---

## 📞 Liên hệ

Nếu có vấn đề, liên hệ:
- Giảng viên
- Nhóm trưởng
- Các thành viên trong nhóm

---

**Chúc bạn hoàn thành tốt bài tập! 🎉**
