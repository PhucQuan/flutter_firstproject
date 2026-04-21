class Promotion {
  final String id;
  final String code;
  final String name;
  final String description;
  final PromotionType type;
  final double value;
  final DateTime startDate;
  final DateTime endDate;
  final int usageLimit;
  final int usageCount;
  final bool isActive;

  Promotion({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.type,
    required this.value,
    required this.startDate,
    required this.endDate,
    required this.usageLimit,
    this.usageCount = 0,
    this.isActive = true,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id']?.toString() ?? '',
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: PromotionType.fromString(json['type'] ?? 'percentage'),
      value: (json['value'] ?? 0).toDouble(),
      startDate: json['startDate'] != null 
          ? DateTime.parse(json['startDate']) 
          : DateTime.now(),
      endDate: json['endDate'] != null 
          ? DateTime.parse(json['endDate']) 
          : DateTime.now().add(const Duration(days: 30)),
      usageLimit: json['usageLimit'] ?? 0,
      usageCount: json['usageCount'] ?? 0,
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'description': description,
      'type': type.value,
      'value': value,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'usageLimit': usageLimit,
      'usageCount': usageCount,
      'isActive': isActive,
    };
  }

  bool get isExpired => DateTime.now().isAfter(endDate);
  bool get isNotStarted => DateTime.now().isBefore(startDate);
  bool get isValid => !isExpired && !isNotStarted && isActive;
}

enum PromotionType {
  percentage('percentage', 'Phần trăm'),
  fixed('fixed', 'Số tiền cố định');

  final String value;
  final String label;

  const PromotionType(this.value, this.label);

  static PromotionType fromString(String value) {
    return PromotionType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => PromotionType.percentage,
    );
  }
}
