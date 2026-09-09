import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; 

class DriverSummaryPage extends StatelessWidget {
  final List<Order> orders; 

  const DriverSummaryPage({super.key, required this.orders});

  List<Order> get _deliveredToday {
    final today = DateTime.now().toLocal();

    return orders.where((o) {
      if (o.status != OrderStatus.delivered) return false;
      final date = o.deliveredAt?.toLocal(); 
      if (date == null) return false;
      return date.year == today.year &&
             date.month == today.month &&
             date.day == today.day;
    }).toList();
  }

  List<Order> get _onTheWay =>
      orders.where((o) => o.status == OrderStatus.onTheWay).toList();

  List<Order> get _preparing =>
      orders.where((o) => o.status == OrderStatus.preparing).toList();

  @override
  Widget build(BuildContext context) {
    final delivered = _deliveredToday;
    final onTheWay = _onTheWay;
    final preparing = _preparing;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resumen del Día',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            _formattedDate(),
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  icon: Icons.check_circle_outline,
                  color: Colors.green,
                  value: delivered.length.toString(),
                  label: 'Entregados hoy',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MetricCard(
                  icon: Icons.delivery_dining,
                  color: Colors.teal,
                  value: onTheWay.length.toString(),
                  label: 'En camino',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MetricCard(
                  icon: Icons.inventory_2_outlined,
                  color: Colors.purple,
                  value: preparing.length.toString(),
                  label: 'Por recoger',
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          if (delivered.isNotEmpty) ...[
            const Text(
              'Entregas completadas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...delivered.map((o) => _DeliveryItem(order: o)),
          ] else ...[
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Icon(Icons.local_shipping_outlined,
                      size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 12),
                  Text(
                    'Aún no has completado entregas hoy',
                    style: TextStyle(
                        color: Colors.grey.shade500, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formattedDate() {
    final now = DateTime.now();
    const months = [
      'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
      'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    ];
    return '${now.day} de ${months[now.month - 1]} de ${now.year}';
  }
}

class _MetricCard extends StatelessWidget { 
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const _MetricCard({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class _DeliveryItem extends StatelessWidget { 
  final Order order;
  const _DeliveryItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFDCFCE7),
          child: Icon(Icons.check, color: Colors.green, size: 20),
        ),
        title: Text(
          order.customerNameSnapshot,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          order.addressSnapshot,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Text(
          CurrencyFormatter.format(order.total),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
      ),
    );
  }
}