import 'package:flutter/material.dart';
import '../../services/manager_service.dart';
import '../../models/promotion_model.dart';

class PromotionsManagementScreen extends StatefulWidget {
  const PromotionsManagementScreen({super.key});

  @override
  State<PromotionsManagementScreen> createState() =>
      _PromotionsManagementScreenState();
}

class _PromotionsManagementScreenState
    extends State<PromotionsManagementScreen> {
  final _managerService = ManagerService();
  List<Promotion> _promotions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPromotions();
  }

  Future<void> _loadPromotions() async {
    setState(() => _isLoading = true);
    final promotions = await _managerService.getPromotions();
    setState(() {
      _promotions = promotions;
      _isLoading = false;
    });
  }

  Future<void> _deletePromotion(String id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: const Text('Bạn có chắc muốn xóa khuyến mãi này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final success = await _managerService.deletePromotion(id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(success ? 'Đã xóa khuyến mãi' : 'Xóa thất bại'),
            backgroundColor: success ? Colors.green : Colors.red,
          ),
        );
        if (success) _loadPromotions();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý khuyến mãi'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadPromotions,
              child: _promotions.isEmpty
                  ? const Center(child: Text('Chưa có khuyến mãi nào'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _promotions.length,
                      itemBuilder: (context, index) {
                        final promotion = _promotions[index];
                        return _buildPromotionCard(promotion);
                      },
                    ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPromotionDialog(),
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPromotionCard(Promotion promotion) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: promotion.isValid
              ? Colors.green.shade100
              : Colors.grey.shade200,
          child: Icon(
            Icons.local_offer,
            color: promotion.isValid ? Colors.green : Colors.grey,
          ),
        ),
        title: Text(
          promotion.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mã: ${promotion.code}'),
            Text(
              promotion.type == PromotionType.percentage
                  ? 'Giảm ${promotion.value}%'
                  : 'Giảm ${_formatCurrency(promotion.value)}đ',
            ),
            Text(
              'Sử dụng: ${promotion.usageCount}/${promotion.usageLimit}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            if (promotion.isExpired)
              const Text(
                'Đã hết hạn',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _showPromotionDialog(promotion: promotion),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deletePromotion(promotion.id),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  void _showPromotionDialog({Promotion? promotion}) {
    final isEdit = promotion != null;
    final codeController = TextEditingController(text: promotion?.code ?? '');
    final nameController = TextEditingController(text: promotion?.name ?? '');
    final descController =
        TextEditingController(text: promotion?.description ?? '');
    final valueController =
        TextEditingController(text: promotion?.value.toString() ?? '');
    final limitController =
        TextEditingController(text: promotion?.usageLimit.toString() ?? '');
    PromotionType selectedType = promotion?.type ?? PromotionType.percentage;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(isEdit ? 'Sửa khuyến mãi' : 'Thêm khuyến mãi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(labelText: 'Mã khuyến mãi'),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Tên'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                  maxLines: 2,
                ),
                DropdownButtonFormField<PromotionType>(
                  value: selectedType,
                  decoration: const InputDecoration(labelText: 'Loại'),
                  items: PromotionType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.label),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedType = value);
                    }
                  },
                ),
                TextField(
                  controller: valueController,
                  decoration: InputDecoration(
                    labelText: selectedType == PromotionType.percentage
                        ? 'Giá trị (%)'
                        : 'Giá trị (VNĐ)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: limitController,
                  decoration: const InputDecoration(labelText: 'Giới hạn sử dụng'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                final newPromotion = Promotion(
                  id: promotion?.id ?? '',
                  code: codeController.text,
                  name: nameController.text,
                  description: descController.text,
                  type: selectedType,
                  value: double.tryParse(valueController.text) ?? 0,
                  startDate: promotion?.startDate ?? DateTime.now(),
                  endDate: promotion?.endDate ??
                      DateTime.now().add(const Duration(days: 30)),
                  usageLimit: int.tryParse(limitController.text) ?? 0,
                );

                final success = isEdit
                    ? await _managerService.updatePromotion(
                        promotion!.id, newPromotion)
                    : await _managerService.createPromotion(newPromotion);

                if (mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(success
                          ? (isEdit ? 'Đã cập nhật' : 'Đã thêm khuyến mãi')
                          : 'Thao tác thất bại'),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );
                  if (success) _loadPromotions();
                }
              },
              child: Text(isEdit ? 'Cập nhật' : 'Thêm'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
