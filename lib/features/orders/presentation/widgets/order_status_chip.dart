import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';

class OrderStatusChip extends StatelessWidget {
  final OrderStatus status;

  const OrderStatusChip({super.key, required this.status});

  Color get _color => switch (status) {
    OrderStatus.pendingPayment => Colors.orange,
    OrderStatus.confirmed      => Colors.blue,
    OrderStatus.preparing      => Colors.purple,
    OrderStatus.onTheWay       => Colors.teal,
    OrderStatus.delivered      => Colors.green,
    OrderStatus.cancelled      => Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        status.displayName,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: _color,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}