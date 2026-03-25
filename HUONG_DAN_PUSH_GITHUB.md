# HƯỚNG DẪN PUSH CODE LÊN GITHUB

## Bước 1: Kiểm tra Git đã được cấu hình

Mở terminal/command prompt và chạy:

```bash
git config --global user.name "Tên của bạn"
git config --global user.email "email@example.com"
```

## Bước 2: Kiểm tra remote repository

```bash
git remote -v
```

Nếu đã có remote `origin`, bạn sẽ thấy:
```
origin  https://github.com/username/flutter_application.git (fetch)
origin  https://github.com/username/flutter_application.git (push)
```

Nếu chưa có, thêm remote:
```bash
git remote add origin https://github.com/username/flutter_application.git
```

## Bước 3: Push code lên GitHub

```bash
git push origin main
```

Hoặc nếu branch của bạn là `master`:
```bash
git push origin master
```

Nếu gặp lỗi, thử:
```bash
git push -u origin main --force
```

## Bước 4: Xác nhận trên GitHub

1. Mở trình duyệt
2. Truy cập: https://github.com/username/flutter_application
3. Kiểm tra commit message "bài tập tuần F02"
4. Xác nhận các file đã được push

## Nếu chưa có repository trên GitHub

### Cách 1: Tạo repository mới trên GitHub

1. Truy cập https://github.com
2. Click nút "New" hoặc "+" → "New repository"
3. Đặt tên: `flutter_application`
4. Chọn Public hoặc Private
5. KHÔNG chọn "Initialize with README"
6. Click "Create repository"

Sau đó chạy:
```bash
git remote add origin https://github.com/username/flutter_application.git
git branch -M main
git push -u origin main
```

### Cách 2: Sử dụng GitHub CLI

```bash
# Cài đặt GitHub CLI nếu chưa có
# https://cli.github.com/

# Login
gh auth login

# Tạo repository và push
gh repo create flutter_application --public --source=. --push
```

## Kiểm tra commit đã push

```bash
git log --oneline
```

Bạn sẽ thấy:
```
1696ec5 (HEAD -> main, origin/main) bài tập tuần F02
ca529d0 bài tập flutter 1
```

## Link GitHub để nộp bài

Sau khi push thành công, link GitHub của bạn sẽ là:
```
https://github.com/username/flutter_application
```

Copy link này để nộp lên UTEXLms.

## Lưu ý

- Thay `username` bằng username GitHub của bạn
- Đảm bảo commit message là "bài tập tuần F02"
- Kiểm tra tất cả file đã được push đầy đủ
- Repository có thể để Public hoặc Private (tùy yêu cầu giảng viên)

## Troubleshooting

### Lỗi: Permission denied
→ Kiểm tra SSH key hoặc sử dụng HTTPS với Personal Access Token

### Lỗi: Repository not found
→ Kiểm tra lại URL remote và quyền truy cập

### Lỗi: Updates were rejected
→ Chạy `git pull origin main` trước, sau đó `git push`

### Lỗi: Authentication failed
→ Sử dụng Personal Access Token thay vì password
→ Tạo token tại: https://github.com/settings/tokens
