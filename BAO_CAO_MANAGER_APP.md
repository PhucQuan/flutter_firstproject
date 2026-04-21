# BÁO CÁO ỨNG DỤNG MANAGER/ADMIN
## QUẢN LÝ HỆ THỐNG BÁN HÀNG

---

## I. THÔNG TIN SINH VIÊN

**Họ và tên:** [Điền tên của bạn]  
**MSSV:** [Điền MSSV của bạn]  
**Lớp:** [Điền lớp của bạn]  
**Môn học:** Lập trình di động với Flutter

**Thời gian:** 26/03/2026 - 23/04/2026

---

## II. YÊU CẦU BÀI TẬP

Xây dựng các chức năng cho vai trò Manager/Admin để quản lý và tương tác với các chức năng của người dùng:

1. ✅ Quản lý sản phẩm
2. ✅ Quản lý theo dõi đơn hàng
3. ✅ Quản lý khuyến mãi
4. ✅ Quản lý dòng tiền bán hàng (Doanh thu)
5. ✅ Quản lý người dùng (Users)
6. ✅ Dashboard tổng quan

---

## III. KIẾN TRÚC ỨNG DỤNG

### Cấu trúc thư mục

```
lib/
├── config/
│   └── api_config.dart                 # Cấu hình API endpoints
├── models/
│   ├── user_model.dart                 # Model User
│   ├── auth_response.dart              # Model Auth Response
│   ├── product_model.dart              # Model Sản phẩm
│   ├── order_model.dart                # Model Đơn hàng
│   ├── promotion_model.dart            # Model Khuyến mãi
│   └── revenue_model.dart              # Model Doanh thu
├── services/
│   ├── auth_service.dart               # Service Authentication
│   └── manager_service.dart            # Service Manager
└── screens/
    ├── home_screen.dart                # Trang chủ
    └── manager/
        ├── manager_dashboard_screen.dart       # Dashboard Manager
        ├── products_management_screen.dart     # Quản lý sản phẩm
        ├── orders_management_screen.dart       # Quản lý đơn hàng
        ├── promotions_management_screen.dart   # Quản lý khuyến mãi
        ├── revenue_management_screen.dart      # Quản lý doanh thu
        └── users_management_screen.dart        # Quản lý người dùng
```

---

## IV. CHI TIẾT CHỨC NĂNG

### 1. Manager Dashboard (Tổng quan)

**Mô tả:** Màn hình tổng quan hiển thị các chỉ số quan trọng của hệ thống

**Tính năng:**
- Hiển thị doanh thu hôm nay, tháng này, năm nay
- Thống kê tổng số đơn hàng và đơn hàng chờ xử lý
- Thống kê tổng số sản phẩm và sản phẩm sắp hết hàng
- Thống kê tổng số người dùng
- Menu điều hướng đến các chức năng quản lý
- Refresh để cập nhật dữ liệu
- Logout

**UI/UX:**
- Card hiển thị doanh thu với màu sắc nổi bật
- Icon trực quan cho từng chỉ số
- Grid layout cho menu quản lý
- Pull-to-refresh

**File:** `lib/screens/manager/manager_dashboard_screen.dart`

---

### 2. Quản lý Sản phẩm

**Mô tả:** Quản lý toàn bộ sản phẩm trong hệ thống

**Tính năng:**
- ✅ Xem danh sách sản phẩm
- ✅ Thêm sản phẩm mới
- ✅ Sửa thông tin sản phẩm
- ✅ Xóa sản phẩm
- ✅ Hiển thị trạng thái tồn kho
- ✅ Cảnh báo sản phẩm sắp hết hàng (stock < 10)
- ✅ Pull-to-refresh

**Thông tin sản phẩm:**
- ID sản phẩm
- Tên sản phẩm
- Mô tả
- Giá bán
- Số lượng tồn kho
- Danh mục
- Hình ảnh (URL)
- Trạng thái hoạt động
- Ngày tạo/cập nhật

**UI/UX:**
- List view với card cho mỗi sản phẩm
- Icon màu xanh/đỏ theo tồn kho
- Dialog form để thêm/sửa
- Confirm dialog khi xóa
- Format giá tiền VNĐ

**File:** `lib/screens/manager/products_management_screen.dart`

---

### 3. Quản lý Đơn hàng

**Mô tả:** Theo dõi và quản lý trạng thái đơn hàng

**Tính năng:**
- ✅ Xem danh sách đơn hàng
- ✅ Lọc đơn hàng theo trạng thái
- ✅ Xem chi tiết đơn hàng
- ✅ Cập nhật trạng thái đơn hàng
- ✅ Xem thông tin khách hàng
- ✅ Xem danh sách sản phẩm trong đơn
- ✅ Pull-to-refresh

**Trạng thái đơn hàng:**
1. **Chờ xử lý** (Pending) - Màu cam
2. **Đã xác nhận** (Confirmed) - Màu xanh dương
3. **Đang giao** (Shipping) - Màu tím
4. **Đã giao** (Delivered) - Màu xanh lá
5. **Đã hủy** (Cancelled) - Màu đỏ

**Thông tin đơn hàng:**
- ID đơn hàng
- Thông tin khách hàng (tên, email, SĐT)
- Danh sách sản phẩm và số lượng
- Tổng tiền
- Địa chỉ giao hàng
- Trạng thái
- Ngày đặt hàng

**UI/UX:**
- ExpansionTile để xem chi tiết
- Chip hiển thị trạng thái với màu sắc
- ChoiceChip để cập nhật trạng thái
- Filter menu trên AppBar

**File:** `lib/screens/manager/orders_management_screen.dart`

---

### 4. Quản lý Khuyến mãi

**Mô tả:** Tạo và quản lý các chương trình khuyến mãi

**Tính năng:**
- ✅ Xem danh sách khuyến mãi
- ✅ Thêm khuyến mãi mới
- ✅ Sửa thông tin khuyến mãi
- ✅ Xóa khuyến mãi
- ✅ Hiển thị trạng thái (còn hạn/hết hạn)
- ✅ Theo dõi số lần sử dụng
- ✅ Pull-to-refresh

**Loại khuyến mãi:**
1. **Phần trăm** (Percentage) - Giảm theo %
2. **Số tiền cố định** (Fixed) - Giảm số tiền cụ thể

**Thông tin khuyến mãi:**
- ID khuyến mãi
- Mã khuyến mãi (Code)
- Tên chương trình
- Mô tả
- Loại khuyến mãi
- Giá trị giảm
- Ngày bắt đầu/kết thúc
- Giới hạn sử dụng
- Số lần đã sử dụng
- Trạng thái hoạt động

**UI/UX:**
- Card với icon khuyến mãi
- Màu xanh cho còn hạn, xám cho hết hạn
- Dialog form với dropdown chọn loại
- Hiển thị progress sử dụng

**File:** `lib/screens/manager/promotions_management_screen.dart`

---

### 5. Quản lý Doanh thu

**Mô tả:** Theo dõi và phân tích doanh thu, chi phí, lợi nhuận

**Tính năng:**
- ✅ Xem báo cáo doanh thu
- ✅ Lọc theo thời gian (ngày/tháng/năm)
- ✅ Hiển thị doanh thu, chi phí, lợi nhuận
- ✅ Tính tỷ lệ lợi nhuận (%)
- ✅ Thống kê số đơn hàng và sản phẩm bán
- ✅ Pull-to-refresh

**Chỉ số doanh thu:**
- Tổng doanh thu
- Tổng chi phí
- Lợi nhuận (Doanh thu - Chi phí)
- Tỷ lệ lợi nhuận (%)
- Số đơn hàng
- Số sản phẩm đã bán

**Kỳ báo cáo:**
- Theo ngày (Daily)
- Theo tháng (Monthly)
- Theo năm (Yearly)

**UI/UX:**
- Card lớn cho mỗi kỳ báo cáo
- Icon và màu sắc theo loại chỉ số
- Badge hiển thị % lợi nhuận
- Divider phân tách các phần
- Menu filter trên AppBar

**File:** `lib/screens/manager/revenue_management_screen.dart`

---

### 6. Quản lý Người dùng

**Mô tả:** Quản lý danh sách người dùng trong hệ thống

**Tính năng:**
- ✅ Xem danh sách người dùng
- ✅ Xem thông tin chi tiết
- ✅ Kích hoạt/Vô hiệu hóa tài khoản
- ✅ Pull-to-refresh

**Thông tin người dùng:**
- ID người dùng
- Tên
- Email
- Số điện thoại
- Trạng thái hoạt động

**UI/UX:**
- List view với avatar
- Switch để toggle trạng thái
- Avatar với chữ cái đầu tên
- Màu tím cho theme

**File:** `lib/screens/manager/users_management_screen.dart`

---

## V. MODELS (Data Structure)

### 1. Product Model
```dart
class Product {
  String id;
  String name;
  String description;
  double price;
  int stock;
  String category;
  String? imageUrl;
  bool isActive;
  DateTime createdAt;
  DateTime? updatedAt;
}
```

### 2. Order Model
```dart
class Order {
  String id;
  String userId;
  String userName;
  List<OrderItem> items;
  double totalAmount;
  OrderStatus status;
  String? shippingAddress;
  String? phoneNumber;
  DateTime createdAt;
}

enum OrderStatus {
  pending, confirmed, shipping, delivered, cancelled
}
```

### 3. Promotion Model
```dart
class Promotion {
  String id;
  String code;
  String name;
  String description;
  PromotionType type;
  double value;
  DateTime startDate;
  DateTime endDate;
  int usageLimit;
  int usageCount;
  bool isActive;
}

enum PromotionType {
  percentage, fixed
}
```

### 4. Revenue Model
```dart
class Revenue {
  String period;
  double totalRevenue;
  double totalCost;
  double profit;
  int orderCount;
  int productsSold;
}

class DashboardStats {
  double todayRevenue;
  double monthRevenue;
  double yearRevenue;
  int totalOrders;
  int pendingOrders;
  int totalProducts;
  int lowStockProducts;
  int totalUsers;
}
```

---

## VI. API ENDPOINTS

### Manager Endpoints

#### 1. Dashboard
```
GET /api/manager/dashboard
Response: {
  "data": {
    "todayRevenue": 5000000,
    "monthRevenue": 150000000,
    "yearRevenue": 1800000000,
    "totalOrders": 1250,
    "pendingOrders": 45,
    "totalProducts": 350,
    "lowStockProducts": 12,
    "totalUsers": 5000
  }
}
```

#### 2. Products
```
GET    /api/manager/products          # Lấy danh sách
POST   /api/manager/products          # Thêm mới
PUT    /api/manager/products/:id      # Cập nhật
DELETE /api/manager/products/:id      # Xóa
```

#### 3. Orders
```
GET   /api/manager/orders                    # Lấy danh sách
GET   /api/manager/orders?status=pending     # Lọc theo trạng thái
PATCH /api/manager/orders/:id/status         # Cập nhật trạng thái
```

#### 4. Promotions
```
GET    /api/manager/promotions        # Lấy danh sách
POST   /api/manager/promotions        # Thêm mới
PUT    /api/manager/promotions/:id    # Cập nhật
DELETE /api/manager/promotions/:id    # Xóa
```

#### 5. Revenue
```
GET /api/manager/revenue?period=month  # Lấy báo cáo
# period: day, month, year
```

#### 6. Users
```
GET   /api/manager/users                  # Lấy danh sách
PATCH /api/manager/users/:id/status       # Cập nhật trạng thái
```

---

## VII. HƯỚNG DẪN SỬ DỤNG

### 1. Truy cập Manager Dashboard

1. Đăng nhập vào ứng dụng
2. Từ màn hình Home, click "Truy cập Manager Dashboard"
3. Xem tổng quan hệ thống

### 2. Quản lý Sản phẩm

1. Từ Dashboard, click "Sản phẩm"
2. Xem danh sách sản phẩm
3. Click nút "+" để thêm sản phẩm mới
4. Click icon "Edit" để sửa
5. Click icon "Delete" để xóa

### 3. Quản lý Đơn hàng

1. Từ Dashboard, click "Đơn hàng"
2. Xem danh sách đơn hàng
3. Click icon filter để lọc theo trạng thái
4. Click vào đơn hàng để xem chi tiết
5. Chọn trạng thái mới để cập nhật

### 4. Quản lý Khuyến mãi

1. Từ Dashboard, click "Khuyến mãi"
2. Xem danh sách khuyến mãi
3. Click nút "+" để thêm khuyến mãi
4. Chọn loại: Phần trăm hoặc Số tiền cố định
5. Nhập thông tin và lưu

### 5. Xem Doanh thu

1. Từ Dashboard, click "Doanh thu"
2. Xem báo cáo doanh thu
3. Click icon calendar để chọn kỳ báo cáo
4. Xem chi tiết từng kỳ

### 6. Quản lý Người dùng

1. Từ Dashboard, click "Người dùng"
2. Xem danh sách người dùng
3. Toggle switch để kích hoạt/vô hiệu hóa

---

## VIII. TÍNH NĂNG NỔI BẬT

### 1. Dashboard Trực quan
- Hiển thị các chỉ số quan trọng ngay trên màn hình chính
- Card với màu sắc và icon dễ nhận biết
- Cập nhật real-time

### 2. Quản lý Đơn hàng Linh hoạt
- Cập nhật trạng thái nhanh chóng
- Lọc theo trạng thái
- Xem chi tiết đầy đủ

### 3. Báo cáo Doanh thu Chi tiết
- Nhiều kỳ báo cáo (ngày/tháng/năm)
- Tính toán tự động lợi nhuận và %
- Thống kê đầy đủ

### 4. UI/UX Chuyên nghiệp
- Material Design 3
- Màu sắc nhất quán
- Icon trực quan
- Animation mượt mà
- Pull-to-refresh
- Loading states

### 5. Bảo mật
- Yêu cầu JWT token cho mọi request
- Chỉ Manager/Admin mới truy cập được
- Logout an toàn

---

## IX. CÔNG NGHỆ SỬ DỤNG

### Flutter Packages
- `http: ^1.2.0` - HTTP client
- `flutter_secure_storage: ^9.0.0` - Lưu JWT token
- `provider: ^6.1.1` - State management
- Material Design 3

### Kiến trúc
- **MVC Pattern**
- **Service Layer** cho business logic
- **Model Layer** cho data structure
- **View Layer** cho UI

---

## X. TESTING

### Test Cases

#### Dashboard
- [ ] Hiển thị đúng các chỉ số
- [ ] Refresh cập nhật dữ liệu
- [ ] Điều hướng đến các màn hình con

#### Products
- [ ] Thêm sản phẩm mới
- [ ] Sửa sản phẩm
- [ ] Xóa sản phẩm
- [ ] Hiển thị cảnh báo tồn kho

#### Orders
- [ ] Xem danh sách đơn hàng
- [ ] Lọc theo trạng thái
- [ ] Cập nhật trạng thái
- [ ] Xem chi tiết đơn hàng

#### Promotions
- [ ] Thêm khuyến mãi
- [ ] Sửa khuyến mãi
- [ ] Xóa khuyến mãi
- [ ] Hiển thị trạng thái hết hạn

#### Revenue
- [ ] Xem báo cáo theo ngày
- [ ] Xem báo cáo theo tháng
- [ ] Xem báo cáo theo năm
- [ ] Tính toán đúng lợi nhuận

#### Users
- [ ] Xem danh sách người dùng
- [ ] Kích hoạt/vô hiệu hóa tài khoản

---

## XI. HƯỚNG PHÁT TRIỂN

### Tính năng bổ sung
- [ ] Export báo cáo ra Excel/PDF
- [ ] Biểu đồ doanh thu (Charts)
- [ ] Thông báo real-time
- [ ] Upload hình ảnh sản phẩm
- [ ] Quản lý danh mục sản phẩm
- [ ] Quản lý nhà cung cấp
- [ ] Quản lý kho hàng
- [ ] Chat với khách hàng
- [ ] Push notification
- [ ] Dark mode

---

## XII. KẾT LUẬN

Ứng dụng Manager/Admin đã hoàn thành đầy đủ các chức năng quản lý cơ bản:

✅ Dashboard tổng quan  
✅ Quản lý sản phẩm (CRUD)  
✅ Quản lý đơn hàng với nhiều trạng thái  
✅ Quản lý khuyến mãi  
✅ Báo cáo doanh thu chi tiết  
✅ Quản lý người dùng  
✅ UI/UX chuyên nghiệp  
✅ Bảo mật với JWT  
✅ Pull-to-refresh  
✅ Error handling  

Ứng dụng sẵn sàng để tích hợp với backend API và triển khai.

---

**Ngày hoàn thành:** [Điền ngày]  
**Sinh viên thực hiện:** [Tên của bạn]
