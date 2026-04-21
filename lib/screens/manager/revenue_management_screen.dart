import 'package:flutter/material.dart';
import '../../services/manager_service.dart';
import '../../models/revenue_model.dart';

class RevenueManagementScreen extends StatefulWidget {
  const RevenueManagementScreen({super.key});

  @override
  State<RevenueManagementScreen> createState() =>
      _RevenueManagementScreenState();
}

class _RevenueManagementScreenState extends State<RevenueManagementScreen> {
  final _managerService = ManagerService();
  List<Revenue> _revenues = [];
  bool _isLoading = true;
  String _selectedPeriod = 'month';

  @override
  void initState() {
    super.initState();
    _loadRevenue();
  }

  Future<void> _loadRevenue() async {
    setState(() => _isLoading = true);
    final revenues = await _managerService.getRevenue(period: _selectedPeriod);
    setState(() {
      _revenues = revenues;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý doanh thu'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.calendar_today),
            onSelected: (period) {
              setState(() => _selectedPeriod = period);
              _loadRevenue();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'day',
                child: Text('Theo ngày'),
              ),
              const PopupMenuItem(
                value: 'month',
                child: Text('Theo tháng'),
              ),
              const PopupMenuItem(
                value: 'year',
                child: Text('Theo năm'),
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadRevenue,
              child: _revenues.isEmpty
                  ? const Center(child: Text('Chưa có dữ liệu doanh thu'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _revenues.length,
                      itemBuilder: (context, index) {
                        final revenue = _revenues[index];
                        return _buildRevenueCard(revenue);
                      },
                    ),
            ),
    );
  }

  Widget _buildRevenueCard(Revenue revenue) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  revenue.period,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: revenue.profit > 0
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${revenue.profitMargin.toStringAsFixed(1)}%',
                    style: TextStyle(
                      color: revenue.profit > 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildRevenueRow(
              'Doanh thu',
              revenue.totalRevenue,
              Colors.blue,
              Icons.trending_up,
            ),
            const SizedBox(height: 12),
            _buildRevenueRow(
              'Chi phí',
              revenue.totalCost,
              Colors.orange,
              Icons.trending_down,
            ),
            const SizedBox(height: 12),
            _buildRevenueRow(
              'Lợi nhuận',
              revenue.profit,
              revenue.profit > 0 ? Colors.green : Colors.red,
              Icons.attach_money,
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  'Đơn hàng',
                  revenue.orderCount.toString(),
                  Icons.shopping_cart,
                ),
                _buildStatItem(
                  'Sản phẩm bán',
                  revenue.productsSold.toString(),
                  Icons.inventory,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueRow(
    String label,
    double amount,
    Color color,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Text(
          '${_formatCurrency(amount)}đ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey.shade600),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
