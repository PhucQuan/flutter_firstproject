# BÁO CÁO BÀI TẬP FLUTTER 1
## ỨNG DỤNG MANAGER APP

---

## I. THÔNG TIN SINH VIÊN

**Họ và tên:** [Điền tên của bạn]  
**MSSV:** [Điền MSSV của bạn]  
**Lớp:** [Điền lớp của bạn]  
**Môn học:** Lập trình di động với Flutter

---

## II. YÊU CẦU BÀI TẬP

Viết ứng dụng Manager App gồm 2 trang:
1. Trang giới thiệu thành viên nhóm - tự động chuyển sau 10 giây
2. Trang Login dành cho role Manager

---

## III. CÀI ĐẶT MÔI TRƯỜNG

### 1. Cài đặt Flutter SDK

**Bước 1:** Truy cập trang chủ Flutter
- URL: https://docs.flutter.dev/
- Chọn hệ điều hành phù hợp (Windows/macOS/Linux)

**Bước 2:** Tải và cài đặt Flutter SDK
- Tải file zip Flutter SDK
- Giải nén vào thư mục (ví dụ: C:\src\flutter)
- Thêm đường dẫn Flutter vào biến môi trường PATH

**Bước 3:** Kiểm tra cài đặt
```bash
flutter doctor
```

Kết quả mong đợi:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Visual Studio Code
[✓] Connected device
```

### 2. Cài đặt Android Studio

**Bước 1:** Tải Android Studio
- URL: https://developer.android.com/studio
- Cài đặt theo hướng dẫn

**Bước 2:** Cài đặt Flutter plugin
- Mở Android Studio
- File → Settings → Plugins
- Tìm kiếm "Flutter" và cài đặt
- Restart Android Studio

### 3. Cài đặt Visual Studio Code (Tùy chọn)

**Bước 1:** Tải VS Code
- URL: https://code.visualstudio.com/

**Bước 2:** Cài đặt extensions
- Flutter
- Dart

---

## IV. THỰC HIỆN BÀI TẬP

### 1. Tạo project Flutter mới

```bash
flutter create flutter_application
cd flutter_application
```

### 2. Cấu trúc thư mục

Tạo cấu trúc thư mục như sau:
```
lib/
├── main.dart
└── screens/
    ├── team_intro_screen.dart
    └── login_screen.dart
```

### 3. Mô tả các file

#### a) File main.dart
- Fil