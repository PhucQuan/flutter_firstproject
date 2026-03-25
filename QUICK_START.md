# 🚀 QUICK START - BÀI TẬP TUẦN F02

## ⚡ 3 Bước để chạy ứng dụng

### 1️⃣ Cài đặt dependencies
```bash
flutter pub get
```

### 2️⃣ Cấu hình API
Mở file `lib/config/api_config.dart` và sửa dòng:
```dart
static const String baseUrl = 'https://your-api-url.com/api';
```

### 3️⃣ Chạy ứng dụng
```bash
flutter run
```

---

## 📱 Luồng sử dụng ứng dụng

### Kịch bản 1: Đăng ký tài khoản mới

1. Mở app → Xem giới thiệu nhóm (10s)
2. Tự động chuyển sang màn hình Login
3. Click "Đăng ký"
4. Điền thông tin:
   - Họ tên: Nguyễn Văn A
   - Email: test@example.com
   - SĐT: 0123456789
   - Mật khẩu: 123456
5. Click "ĐĂNG KÝ"
6. Nhập OTP (6 số) nhận được từ email
7. Click "XÁC THỰC"
8. Đăng ký thành công → Chuyển về Login

### Kịch bản 2: Đăng nhập

1. Nhập Email: test@example.com
2. Nhập Password: 123456
3. Click "ĐĂNG NHẬP"
4. Đăng nhập thành công → Vào màn hình Home

### Kịch bản 3: Quên mật khẩu

1. Ở màn hình Login, click "Quên mật khẩu?"
2. Nhập Email: test@example.com
3. Click "GỬI MÃ OTP"
4. Nhập OTP (6 số)
5. Nhập mật khẩu mới
6. Xác nhận mật khẩu
7. Click "ĐẶT LẠI MẬT KHẨU"
8. Thành công → Chuyển về Login

---

## 🔧 Cấu hình nhanh cho testing

### Option 1: Sử dụng Mock API

Nếu chưa có backend, dùng mock API:

```dart
// lib/config/api_config.dart
static const String baseUrl = 'https://mockapi.io/api/v1';
```

### Option 2: Sử dụng JSON Server (Local)

```bash
# Cài đặt json-server
npm install -g json-server

# Tạo file db.json
# Chạy server
json-server --watch db.json --port 3000

# Cấu hình
static const String baseUrl = 'http://localhost:3000';
```

### Option 3: Bypass API (Testing UI only)

Sửa file `lib/services/auth_service.dart`, comment các API call và return mock data:

```dart
Future<AuthResponse> login({...}) async {
  // Mock response for testing
  await Future.delayed(Duration(seconds: 1));
  return AuthResponse(
    success: true,
    message: 'Đăng nhập thành công',
    token: 'mock_jwt_token_123456',
    user: User(
      id: '1',
      email: email,
      name: 'Test User',
    ),
  );
}
```

---

## 📋 Checklist trước khi nộp bài

- [ ] Code chạy được không lỗi
- [ ] Đã cấu hình API URL
- [ ] Đã test tất cả chức năng
- [ ] Đã commit với message "bài tập tuần F02"
- [ ] Đã push lên GitHub
- [ ] Đã chụp screenshots
- [ ] Đã điền thông tin sinh viên trong báo cáo

---

## 🎯 Các file quan trọng cần kiểm tra

1. `lib/config/api_config.dart` - URL API
2. `lib/services/auth_service.dart` - Logic authentication
3. `lib/screens/` - Tất cả màn hình
4. `pubspec.yaml` - Dependencies
5. `README.md` - Hướng dẫn
6. `BAO_CAO_BAI_TAP_TUAN_F02.md` - Báo cáo

---

## 🐛 Lỗi thường gặp

### Lỗi 1: Package not found
```bash
flutter clean
flutter pub get
```

### Lỗi 2: API connection failed
→ Kiểm tra URL trong `api_config.dart`
→ Kiểm tra backend đang chạy

### Lỗi 3: Secure storage error
→ Chạy trên thiết bị thật hoặc emulator mới

### Lỗi 4: Build failed
```bash
flutter clean
flutter pub get
flutter run
```

---

## 📞 Cần giúp đỡ?

1. Đọc file `CHECKLIST_BAI_TAP_F02.md`
2. Đọc file `BAO_CAO_BAI_TAP_TUAN_F02.md`
3. Đọc file `HUONG_DAN_PUSH_GITHUB.md`
4. Liên hệ nhóm hoặc giảng viên

---

## 🎉 Hoàn thành!

Sau khi chạy thành công:
1. Push lên GitHub
2. Copy link GitHub
3. Nộp lên UTEXLms

**Link GitHub format:**
```
https://github.com/[username]/flutter_application
```

---

**Good luck! 🚀**
