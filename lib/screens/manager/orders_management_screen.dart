import 'package:flutter/material.dart';
import '../../services/manager_service.dart';
import '../../models/order_model.dart';

class OrdersManagementScreen extends StatefulWidget {
  const OrdersManagementScreen({super.key});

  @override
  State<OrdersManagementScreen> createState() => _OrdersManagementScreenState();
}

class _OrdersManagementScreenState extends State<OrdersManagementScreen> {
  final _managerService = ManagerService();
  List<Order> _orders = [];
  bool _isLoading = true;
  OrderStatus? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    setState(() => _isLoading = true);
    final orders = await _managerService.getOrders(status: _selectedStatus);
    setState(() {
      _orders = orders;
      _isLoading = false;
    });
  }

  Future<void> _updateOrderStatus(String orderId, OrderStatus newStatus) async {
    final success = await _managerService.updateOrderStatus(orderId, newStatus);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? 'Đã cập nhật trạng thái' : 'Cập nhật thất bại'),
          backgroundColor: success ? Colors.green : Colors.red,
        ),
      );
      if (success) _loadOrders();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý đơn hàng'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<OrderStatus?>(
            icon: const Icon(Icons.filter_list),
            onSelected: (status) {
              setState(() => _selectedStatus = status);
              _loadOrders();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: null,
                child: Text('Tất cả'),
              ),
              ...OrderStatus.values.map((status) => PopupMenuItem(
                value: status,
                child: Text(status.label),
              )),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadOrders,
              child: _orders.isEmpty
                  ? const Center(child: Text('Chưa có đơn hàng nào'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _orders.length,
                      itemBuilder: (context, index) {
                        final order = _orders[index];
                        return _buildOrderCard(order);
                      },
                    ),
            ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(order.status).withOpacity(0.2),
          child: Icon(
            Icons.shopping_bag,
            color: _getStatusColor(order.status),
          ),
        ),
        title: Text(
          'Đơn hàng #${order.id}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Khách hàng: ${order.userName}'),
            Text('Tổng tiền: ${_formatCurrency(order.totalAmount)}đ'),
            Chip(
              label: Text(
                order.status.label,
                style: const TextStyle(fontSize: 12),
              ),
              backgroundColor: _getStatusColor(order.status).withOpacity(0.2),
              labelStyle: TextStyle(color: _getStatusColor(order.status)),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sản phẩm:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...order.items.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text('• ${item.productName} x${item.quantity}'),
                )),
                const SizedBox(height: 12),
                if (order.shippingAddress != null) ...[
                  Text('Địa chỉ: ${order.shippingAddress}'),
                  const SizedBox(height: 4),
                ],
                if (order.phoneNumber != null) ...[
                  Text('SĐT: ${order.phoneNumber}'),
                  const SizedBox(height: 12),
                ],
                const Text(
                  'Cập nhật trạng thái:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: OrderStatus.values.map((status) {
                    return ChoiceChip(
                      label: Text(status.label),
                      selected: order.status == status,
                      onSelected: (selected) {
                        if (selected) {
                          _updateOrderStatus(order.id, status);
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.shipping:
        return Colors.purple;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
