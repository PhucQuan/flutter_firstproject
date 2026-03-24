# Bài Tập Flutter 1 - Manager App

## Mô tả dự án
Ứng dụng Manager App gồm 2 trang:
1. **Trang giới thiệu nhóm**: Hiển thị thông tin các thành viên trong nhóm, tự động chuyển sang trang Login sau 10 giây
2. **Trang Login Manager**: Giao diện đăng nhập dành cho quản lý

## Thành viên nhóm
- Nguyễn Văn A - MSSV: 2021001
- Trần Thị B - MSSV: 2021002
- Lê Văn C - MSSV: 2021003

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
