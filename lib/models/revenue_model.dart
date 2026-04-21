class Revenue {
  final String period;
  final double totalRevenue;
  final double totalCost;
  final double profit;
  final int orderCount;
  final int productsSold;

  Revenue({
    required this.period,
    required this.totalRevenue,
    required this.totalCost,
    required this.profit,
    required this.orderCount,
    required this.productsSold,
  });

  factory Revenue.fromJson(Map<String, dynamic> json) {
    return Revenue(
      period: json['period'] ?? '',
      totalRevenue: (json['totalRevenue'] ?? 0).toDouble(),
      totalCost: (json['totalCost'] ?? 0).toDouble(),
      profit: (json['profit'] ?? 0).toDouble(),
      orderCount: json['orderCount'] ?? 0,
      productsSold: json['productsSold'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'period': period,
      'totalRevenue': totalRevenue,
      'totalCost': totalCost,
      'profit': profit,
      'orderCount': orderCount,
      'productsSold': productsSold,
    };
  }

  double get profitMargin => 
      totalRevenue > 0 ? (profit / totalRevenue) * 100 : 0;
}

class DashboardStats {
  final double todayRevenue;
  final double monthRevenue;
  final double yearRevenue;
  final int totalOrders;
  final int pendingOrders;
  final int totalProducts;
  final int lowStockProducts;
  final int totalUsers;

  DashboardStats({
    required this.todayRevenue,
    required this.monthRevenue,
    required this.yearRevenue,
    required this.totalOrders,
    required this.pendingOrders,
    required this.totalProducts,
    required this.lowStockProducts,
    required this.totalUsers,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      todayRevenue: (json['todayRevenue'] ?? 0).toDouble(),
      monthRevenue: (json['monthRevenue'] ?? 0).toDouble(),
      yearRevenue: (json['yearRevenue'] ?? 0).toDouble(),
      totalOrders: json['totalOrders'] ?? 0,
      pendingOrders: json['pendingOrders'] ?? 0,
      totalProducts: json['totalProducts'] ?? 0,
      lowStockProducts: json['lowStockProducts'] ?? 0,
      totalUsers: json['totalUsers'] ?? 0,
    );
  }
}
