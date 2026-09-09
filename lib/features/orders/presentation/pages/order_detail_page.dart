import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_item.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/order_status_chip.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;

  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isActive =
        order.status != OrderStatus.delivered &&
        order.status != OrderStatus.cancelled;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          '#${order.id.substring(0, 8).toUpperCase()}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StatusSection(order: order),
            const SizedBox(height: 16),

            if (order.status != OrderStatus.cancelled) ...[
              _OrderTimeline(currentStatus: order.status),
              const SizedBox(height: 16),
            ],

            _SectionCard(
              title: 'Dirección de entrega',
              icon: Icons.location_on_outlined,
              child: Text(
                order.addressSnapshot,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),

            _SectionCard(
              title: 'Productos',
              icon: Icons.shopping_bag_outlined,
              child: Column(
                children: order.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${item.formattedQuantity} x ${item.productNameSnapshot}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(item.calculatedSubtotal),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            _SectionCard(
              title: 'Resumen de pago',
              icon: Icons.receipt_outlined,
              child: Column(
                children: [
                  _SummaryRow(
                    label: 'Subtotal',
                    value: CurrencyFormatter.format(
                      order.subtotal,
                    ), // valor -> value
                  ),
                  _SummaryRow(
                    label: 'Envío',
                    value: order.shippingCost == 0
                        ? 'Gratis'
                        : CurrencyFormatter.format(order.shippingCost),
                  ),
                  if (order.appliedDiscounts > 0)
                    _SummaryRow(
                      label: 'Descuentos',
                      value: CurrencyFormatter.format(order.appliedDiscounts),
                      color: Colors.green,
                    ),
                  const Divider(height: 16),
                  _SummaryRow(
                    label: 'Total',
                    value: CurrencyFormatter.format(order.total),
                    isBold: true, // esBold -> isBold
                    color: const Color(0xFF1E3A8A),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (isActive && order.confirmationCode != null) ...[
              _ConfirmationCode(code: order.confirmationCode!),
              const SizedBox(height: 12),
            ],

            _SectionCard(
              title: 'Información del pedido',
              icon: Icons.info_outline,
              child: Column(
                children: [
                  _InfoRow(
                    label: 'Fecha de pedido',
                    value: _formatDate(order.createdAt),
                  ),
                  if (order.estimatedDeliveryDate != null)
                    _InfoRow(
                      label: 'Fecha de entrega',
                      value: _formatDate(order.estimatedDeliveryDate!),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final local = date.toLocal();
    const months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    return '${local.day} de ${months[local.month - 1]} de ${local.year}';
  }
}

class _StatusSection extends StatelessWidget {
  final Order order;
  const _StatusSection({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Estado actual',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                OrderStatusChip(status: order.status),
              ],
            ),
          ),
          Icon(
            _statusIcon(order.status),
            size: 48,
            color: _statusColor(order.status).withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }

  IconData _statusIcon(OrderStatus status) => switch (status) {
    OrderStatus.pendingPayment => Icons.hourglass_empty,
    OrderStatus.confirmed => Icons.check_circle_outline,
    OrderStatus.preparing => Icons.inventory_2_outlined,
    OrderStatus.onTheWay => Icons.delivery_dining,
    OrderStatus.delivered => Icons.done_all,
    OrderStatus.cancelled => Icons.cancel_outlined,
  };

  Color _statusColor(OrderStatus status) => switch (status) {
    OrderStatus.pendingPayment => Colors.orange,
    OrderStatus.confirmed => Colors.blue,
    OrderStatus.preparing => Colors.purple,
    OrderStatus.onTheWay => Colors.teal,
    OrderStatus.delivered => Colors.green,
    OrderStatus.cancelled => Colors.red,
  };
}

class _OrderTimeline extends StatelessWidget {
  final OrderStatus currentStatus;

  const _OrderTimeline({required this.currentStatus});

  static const _steps = [
    (status: OrderStatus.pendingPayment, label: 'Pedido\nrecibido'),
    (status: OrderStatus.confirmed, label: 'Confirmado'),
    (status: OrderStatus.preparing, label: 'En\npreparación'),
    (status: OrderStatus.onTheWay, label: 'En\ncamino'),
    (status: OrderStatus.delivered, label: 'Entregado'),
  ];

  int get _currentIndex => _steps.indexWhere((p) => p.status == currentStatus);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Seguimiento',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(_steps.length * 2 - 1, (i) {
              if (i.isOdd) {
                final stepIndex = i ~/ 2;
                final isCompleted = stepIndex < _currentIndex;
                return Expanded(
                  child: SizedBox(
                    height: 32,
                    child: Center(
                      child: Container(
                        height: 2,
                        color: isCompleted
                            ? const Color(0xFF1E3A8A)
                            : Colors.grey.shade200,
                      ),
                    ),
                  ),
                );
              }

              final stepIndex = i ~/ 2;
              final step = _steps[stepIndex];
              final isCompleted = stepIndex <= _currentIndex;
              final isCurrent = stepIndex == _currentIndex;

              return Column(
                children: [
                  SizedBox(
                    height: 32,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isCurrent ? 32 : 24,
                        height: isCurrent ? 32 : 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted
                              ? const Color(0xFF1E3A8A)
                              : Colors.grey.shade200,
                          border: isCurrent
                              ? Border.all(
                                  color: const Color(
                                    0xFF1E3A8A,
                                  ).withValues(alpha: 0.3),
                                  width: 4,
                                )
                              : null,
                        ),
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 28,
                    child: Text(
                      step.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: isCompleted
                            ? const Color(0xFF1E3A8A)
                            : Colors.grey.shade400,
                        fontWeight: isCurrent
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _ConfirmationCode extends StatefulWidget {
  final String code;
  const _ConfirmationCode({required this.code});

  @override
  State<_ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<_ConfirmationCode> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF1E3A8A).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.lock_outline,
                size: 18,
                color: Color(0xFF1E3A8A),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Código de confirmación',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => _isVisible = !_isVisible),
                child: Text(_isVisible ? 'Ocultar' : 'Mostrar'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _isVisible ? widget.code : '••••',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              letterSpacing: 20,
              color: _isVisible
                  ? const Color(0xFF1E3A8A)
                  : Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Muéstrale este código al repartidor cuando llegue',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFF1E3A8A)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          child,
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? color;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
