# BÁO CÁO BÀI TẬP FLUTTER 1
## ỨNG DỤNG MANAGER APP

---

## I. THÔNG TIN SINH VIÊN

**Họ và tên:** Trần Hoàng Phúc Quân 
**MSSV:** 23110146 
  
**Môn học:** Lập trình di động nâng cao

---

## II. YÊU CẦU BÀI TẬP

Viết ứng dụng Manager App gồm 2 trang:
1. **Trang giới thiệu thành viên nhóm** - tự động chuyển sau 10 giây
2. **Trang Login** dành cho role Manager

---

## III. CÀI ĐẶT MÔI TRƯỜNG

### 1. Cài đặt Flutter SDK

**Bước 1:** Truy cập trang chủ Flutter
- URL: https://docs.flutter.dev/
- Chọn hệ điều hành phù hợp (Windows/macOS/Linux)

**Bước 2:** Tải và cài đặt Flutter SDK
- Tải file zip Flutter SDK từ trang chủ
- Giải nén vào thư mục (ví dụ: C:\src\flutter)
- Thêm đường dẫn Flutter vào biến môi trường PATH

**Bước 3:** Kiểm tra cài đặt
```bash
flutter doctor
```

**Kết quả:**
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Visual Studio Code
[✓] Connected device
```

### 2. Cài đặt Android Studio

- Tải Android Studio từ: https://developer.android.com/studio
- Cài đặt Flutter plugin và Dart plugin
- Cấu hình Android SDK

### 3. Cài đặt Visual Studio Code (Tùy chọn)

- Tải VS Code từ: https://code.visualstudio.com/
- Cài đặt extensions: Flutter và Dart

---

## IV. THỰC HIỆN BÀI TẬP

### 1. Tạo project Flutter mới

```bash
flutter create flutter_application
cd flutter_application
```

### 2. Cấu trúc thư mục

```
lib/
├── main.dart
└── screens/
    ├── team_intro_screen.dart
    └── login_screen.dart
```

### 3. Mô tả các file

#### a) File main.dart
- File chính khởi động ứng dụng
- Cấu hình MaterialApp với theme màu xanh
- Thiết lập TeamIntroScreen làm trang khởi đầu

#### b) File team_intro_screen.dart
- Hiển thị thông tin 3 thành viên nhóm
- Sử dụng Timer để đếm ngược 10 giây
- Tự động chuyển sang LoginScreen sau 10 giây
- Giao diện gradient màu xanh-tím
- Hiển thị card thông tin từng thành viên

#### c) File login_screen.dart
- Form đăng nhập cho Manager
- Validation cho username và password
- Hiển thị/ẩn mật khẩu
- Giao diện gradient màu xanh
- Thông báo khi đăng nhập thành công

---

## V. CHỨC NĂNG ĐÃ THỰC HIỆN

### 1. Trang Giới Thiệu Nhóm

**Các tính năng:**
- ✅ Hiển thị thông tin 3 thành viên (tên, MSSV)
- ✅ Icon đại diện cho từng thành viên
- ✅ Đếm ngược 10 giây
- ✅ Tự động chuyển trang sau 10 giây
- ✅ Giao diện gradient đẹp mắt
- ✅ Card shadow cho từng thành viên

**Công nghệ sử dụng:**
- StatefulWidget để quản lý state
- Timer.periodic để đếm ngược
- Navigator.pushReplacement để chuyển trang
- Container với BoxDecoration cho gradient
- SafeArea để tránh notch

### 2. Trang Login Manager

**Các tính năng:**
- ✅ Form đăng nhập với validation
- ✅ TextFormField cho username và password
- ✅ Validation: không để trống, password tối thiểu 6 ký tự
- ✅ Nút hiển thị/ẩn mật khẩu
- ✅ Nút đăng nhập với feedback
- ✅ SnackBar thông báo đăng nhập thành công
- ✅ Giao diện responsive với SingleChildScrollView

**Công nghệ sử dụng:**
- Form và GlobalKey<FormState> để quản lý form
- TextEditingController để lấy giá trị input
- Validator functions để kiểm tra dữ liệu
- ScaffoldMessenger để hiển thị thông báo
- Card với elevation cho hiệu ứng nổi

---

## VI. SCREENSHOTS

### 1. Trang Giới Thiệu Nhóm
[Chèn ảnh screenshot trang giới thiệu]

**Mô tả:**
- Hiển thị tiêu đề "GIỚI THIỆU NHÓM"
- 3 card thành viên với avatar và thông tin
- Countdown timer ở dưới cùng

### 2. Trang Login
[Chèn ảnh screenshot trang login]

**Mô tả:**
- Icon admin panel ở trên
- Form đăng nhập với 2 trường
- Nút đăng nhập màu xanh
- Link "Quên mật khẩu?"

---

## VII. UPLOAD LÊN GITHUB

### 1. Khởi tạo Git Repository

```bash
git init
git add .
git commit -m "bài tập flutter 1"
```

### 2. Tạo Repository trên GitHub

- Truy cập: https://github.com
- Tạo repository mới: flutter_firstproject
- Copy URL repository

### 3. Push code lên GitHub

```bash
git branch -M main
git remote add origin https://github.com/PhucQuan/flutter_firstproject.git
git push -u origin main
```

### 4. Link GitHub

**Repository URL:** https://github.com/PhucQuan/flutter_firstproject.git

**Commit message:** "bài tập flutter 1"

---

## VIII. KẾT QUẢ ĐẠT ĐƯỢC

✅ Hoàn thành trang giới thiệu nhóm với countdown 10 giây  
✅ Hoàn thành trang login với validation đầy đủ  
✅ Giao diện đẹp, responsive, có gradient và animation  
✅ Code được tổ chức rõ ràng theo cấu trúc thư mục  
✅ Upload thành công lên GitHub với commit message đúng yêu cầu  

---

## IX. HƯỚNG PHÁT TRIỂN

Các tính năng có thể bổ sung:
- Kết nối API backend để xác thực đăng nhập thực
- Lưu trạng thái đăng nhập với SharedPreferences
- Thêm animation chuyển trang mượt mà hơn
- Thêm trang Home sau khi đăng nhập thành công
- Implement chức năng "Quên mật khẩu"
- Thêm dark mode

---

## X. KẾT LUẬN

Bài tập đã hoàn thành đầy đủ các yêu cầu:
- Trang giới thiệu nhóm tự động chuyển sau 10 giây
- Trang login cho Manager với validation
- Code được upload lên GitHub với commit message "bài tập flutter 1"

Qua bài tập này, em đã nắm được:
- Cách tạo và cấu trúc project Flutter
- Sử dụng StatefulWidget và State management cơ bản
- Navigation giữa các màn hình
- Form validation và user input handling
- Sử dụng Git và GitHub để quản lý code

---

**Ngày hoàn thành:** [Điền ngày hoàn thành]  
**Chữ ký sinh viên:** [Chữ ký]
