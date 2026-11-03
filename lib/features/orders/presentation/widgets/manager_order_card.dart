import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/enums/payment_method_type.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';

class ManagerOrderCard extends StatelessWidget {
  final Order order;
  final bool isLoading;
  final VoidCallback? onConfirm;
  final VoidCallback? onAssignDriver;
  final VoidCallback? onCancel;
  final VoidCallback? onTap;

  const ManagerOrderCard({
    super.key,
    required this.order,
    this.isLoading = false,
    this.onTap,
    this.onConfirm,
    this.onAssignDriver,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(order: order),
              const Divider(height: 24),
              _CustomerName(order: order),
              const SizedBox(height: 8),
              _ItemsSummary(order: order),
              const SizedBox(height: 12),
              _Total(order: order),
              _PaymentInfo(order: order),
              if (isLoading) ...[
                const SizedBox(height: 12),
                const LinearProgressIndicator(),
              ] else ...[
                const SizedBox(height: 12),
                _Actions(
                  order: order,
                  onConfirm: onConfirm,
                  onAssignDriver: onAssignDriver,
                  onCancel: onCancel,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Order order;
  const _Header({required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '#${order.id.substring(0, 13).toUpperCase()}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _StatusChip(status: order.status, label: _statusLabel(order)),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final OrderStatus status;
  final String label;
  const _StatusChip({required this.status, required this.label});

  Color get _color => switch (status) {
    OrderStatus.pendingPayment => Colors.orange,
    OrderStatus.confirmed => Colors.blue,
    OrderStatus.preparing => Colors.purple,
    OrderStatus.onTheWay => Colors.teal,
    OrderStatus.delivered => Colors.green,
    OrderStatus.cancelled => Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: _color,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

class _CustomerName extends StatelessWidget {
  final Order order;
  const _CustomerName({required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.person_outline,
          size: 16,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            order.customerNameSnapshot,
            style: const TextStyle(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ItemsSummary extends StatelessWidget {
  final Order order;
  const _ItemsSummary({required this.order});

  @override
  Widget build(BuildContext context) {
    final n = order.items.length;
    var colorTheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(
          Icons.shopping_bag_outlined,
          size: 16,
          color: colorTheme.secondaryContainer,
        ),
        const SizedBox(width: 6),
        Text(
          n == 1 ? '1 producto' : '$n productos',
          style:  TextStyle( color: colorTheme.outline),
        ),
        const Spacer(),
        Text(
          'Ver detalle',
          style: TextStyle(
            color: colorTheme.primaryContainer,
            fontSize: 12,
          ),
        ),
        Icon(
          Icons.chevron_right,
          size: 16,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ],
    );
  }
}

class _Total extends StatelessWidget {
  final Order order;
  const _Total({required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          CurrencyFormatter.format(order.total),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  final Order order;
  final VoidCallback? onConfirm;
  final VoidCallback? onAssignDriver;
  final VoidCallback? onCancel;

  const _Actions({
    required this.order,
    this.onConfirm,
    this.onAssignDriver,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    final isCash = order.paymentMethod == PaymentMethodType.cashOnDelivery;
    final canCancel =
        isCash &&
        (order.status == OrderStatus.pendingPayment ||
            order.status == OrderStatus.confirmed ||
            order.status == OrderStatus.preparing);

    return Row(
      children: [
        if (canCancel)
          TextButton(
            onPressed: onCancel,
            style: TextButton.styleFrom(foregroundColor: colorTheme.error),
            child: const Text('Cancelar', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        const Spacer(),
        switch (order.status) {
          OrderStatus.pendingPayment =>
            isCash
                ? FilledButton(
                    onPressed: onConfirm,
                    style: FilledButton.styleFrom(
                      backgroundColor: colorTheme.primary,
                    ),
                    child: const Text('Aceptar pedido'),
                  )
                : Text(
                    'Esperando el pago del cliente',
                    style: TextStyle(color: colorTheme.outline),
                  ),
          OrderStatus.confirmed => FilledButton.icon(
            onPressed: onAssignDriver,
            icon: const Icon(Icons.delivery_dining, size: 18),
            label: const Text('Asignar y Preparar'),
            style: FilledButton.styleFrom(backgroundColor: colorTheme.tertiary),
          ),
          _ => const SizedBox.shrink(),
        },
      ],
    );
  }
}

class _PaymentInfo extends StatelessWidget {
  final Order order;
  const _PaymentInfo({required this.order});

  @override
  Widget build(BuildContext context) {
    final method = order.paymentMethod;
    if (method == null) return const SizedBox.shrink();

    final isCash = method == PaymentMethodType.cashOnDelivery;
    var colorTheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(
            isCash ? Icons.payments_outlined : Icons.credit_card,
            size: 16,
            color: colorTheme.primaryContainer,
          ),
          const SizedBox(width: 6),
          Text(
            isCash ? 'Efectivo contra entrega' : 'Tarjeta',
            style: TextStyle(color: colorTheme.outline, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

String _statusLabel(Order order) {
  if (order.status == OrderStatus.pendingPayment) {
    return order.paymentMethod == PaymentMethodType.cashOnDelivery
        ? 'Por aceptar'
        : 'Esperando pago';
  }
  return order.status.displayName;
}
