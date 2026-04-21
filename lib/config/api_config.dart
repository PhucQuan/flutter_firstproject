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
  
  // Manager endpoints
  static const String dashboard = '$baseUrl/manager/dashboard';
  static const String products = '$baseUrl/manager/products';
  static const String orders = '$baseUrl/manager/orders';
  static const String promotions = '$baseUrl/manager/promotions';
  static const String revenue = '$baseUrl/manager/revenue';
  static const String users = '$baseUrl/manager/users';
  
  // Headers
  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  
  static Map<String, String> headersWithToken(String token) => {
    ...headers,
    'Authorization': 'Bearer $token',
  };
}
