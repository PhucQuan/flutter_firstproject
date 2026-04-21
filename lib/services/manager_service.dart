import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../services/auth_service.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';
import '../models/promotion_model.dart';
import '../models/revenue_model.dart';
import '../models/user_model.dart';

class ManagerService {
  final _authService = AuthService();

  Future<Map<String, String>> _getHeaders() async {
    final token = await _authService.getToken();
    return ApiConfig.headersWithToken(token ?? '');
  }

  // Dashboard
  Future<DashboardStats?> getDashboardStats() async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse(ApiConfig.dashboard),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return DashboardStats.fromJson(data['data']);
      }
      return null;
    } catch (e) {
      print('Error getting dashboard stats: $e');
      return null;
    }
  }

  // Products Management
  Future<List<Product>> getProducts() async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse(ApiConfig.products),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['data'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting products: $e');
      return [];
    }
  }

  Future<bool> createProduct(Product product) async {
    try {
      final headers = await _getHeaders();
      final response = await http.post(
        Uri.parse(ApiConfig.products),
        headers: headers,
        body: jsonEncode(product.toJson()),
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error creating product: $e');
      return false;
    }
  }

  Future<bool> updateProduct(String id, Product product) async {
    try {
      final headers = await _getHeaders();
      final response = await http.put(
        Uri.parse('${ApiConfig.products}/$id'),
        headers: headers,
        body: jsonEncode(product.toJson()),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating product: $e');
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final headers = await _getHeaders();
      final response = await http.delete(
        Uri.parse('${ApiConfig.products}/$id'),
        headers: headers,
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting product: $e');
      return false;
    }
  }

  // Orders Management
  Future<List<Order>> getOrders({OrderStatus? status}) async {
    try {
      final headers = await _getHeaders();
      var url = ApiConfig.orders;
      if (status != null) {
        url += '?status=${status.value}';
      }
      
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['data'] as List)
            .map((json) => Order.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting orders: $e');
      return [];
    }
  }

  Future<bool> updateOrderStatus(String orderId, OrderStatus status) async {
    try {
      final headers = await _getHeaders();
      final response = await http.patch(
        Uri.parse('${ApiConfig.orders}/$orderId/status'),
        headers: headers,
        body: jsonEncode({'status': status.value}),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating order status: $e');
      return false;
    }
  }

  // Promotions Management
  Future<List<Promotion>> getPromotions() async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse(ApiConfig.promotions),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['data'] as List)
            .map((json) => Promotion.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting promotions: $e');
      return [];
    }
  }

  Future<bool> createPromotion(Promotion promotion) async {
    try {
      final headers = await _getHeaders();
      final response = await http.post(
        Uri.parse(ApiConfig.promotions),
        headers: headers,
        body: jsonEncode(promotion.toJson()),
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error creating promotion: $e');
      return false;
    }
  }

  Future<bool> updatePromotion(String id, Promotion promotion) async {
    try {
      final headers = await _getHeaders();
      final response = await http.put(
        Uri.parse('${ApiConfig.promotions}/$id'),
        headers: headers,
        body: jsonEncode(promotion.toJson()),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating promotion: $e');
      return false;
    }
  }

  Future<bool> deletePromotion(String id) async {
    try {
      final headers = await _getHeaders();
      final response = await http.delete(
        Uri.parse('${ApiConfig.promotions}/$id'),
        headers: headers,
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting promotion: $e');
      return false;
    }
  }

  // Revenue Management
  Future<List<Revenue>> getRevenue({String period = 'month'}) async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse('${ApiConfig.revenue}?period=$period'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['data'] as List)
            .map((json) => Revenue.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting revenue: $e');
      return [];
    }
  }

  // Users Management
  Future<List<User>> getUsers() async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse(ApiConfig.users),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['data'] as List)
            .map((json) => User.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error getting users: $e');
      return [];
    }
  }

  Future<bool> updateUserStatus(String userId, bool isActive) async {
    try {
      final headers = await _getHeaders();
      final response = await http.patch(
        Uri.parse('${ApiConfig.users}/$userId/status'),
        headers: headers,
        body: jsonEncode({'isActive': isActive}),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating user status: $e');
      return false;
    }
  }
}
