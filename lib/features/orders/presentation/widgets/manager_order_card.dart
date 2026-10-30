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

  const ManagerOrderCard({
    super.key,
    required this.order,
    this.isLoading = false,
    this.onConfirm,
    this.onAssignDriver,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(order: order),
            const Divider(height: 24),
            _CustomerInfo(order: order),
            const SizedBox(height: 8),
            _Items(order: order),
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

class _CustomerInfo extends StatelessWidget {
  final Order order;
  const _CustomerInfo({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.person_outline, size: 16, color: Colors.grey),
            const SizedBox(width: 6),
            Text(
              order.customerNameSnapshot,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
            const SizedBox(width: 6),
            Text(
              order.customerPhoneSnapshot,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                order.addressSnapshot,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Items extends StatelessWidget {
  final Order order;
  const _Items({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: order.items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${item.quantity}x ${item.productNameSnapshot}',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              Text(
                '\$${(item.quantity * item.unitPriceSnapshot)}',
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        );
      }).toList(),
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color(0xFF1E3A8A),
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
    final isCash = order.paymentMethod == PaymentMethodType.cashOnDelivery;
    final isOpen = order.status != OrderStatus.delivered &&
        order.status != OrderStatus.cancelled;

    return Row(
      children: [
        if (isOpen && isCash)
          TextButton(
            onPressed: onCancel,
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Cancelar'),
          ),
        const Spacer(),
        switch (order.status) {
          OrderStatus.pendingPayment => isCash
              ? FilledButton(
                  onPressed: onConfirm,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                  ),
                  child: const Text('Aceptar pedido'),
                )
              : const Text(
                  'Esperando el pago del cliente',
                  style: TextStyle(color: Colors.grey),
                ),
          OrderStatus.confirmed => FilledButton.icon(
              onPressed: onAssignDriver,
              icon: const Icon(Icons.delivery_dining, size: 18),
              label: const Text('Asignar y Preparar'),
              style: FilledButton.styleFrom(backgroundColor: Colors.purple),
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
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(
            isCash ? Icons.payments_outlined : Icons.credit_card,
            size: 16,
            color: Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(
            isCash ? 'Efectivo contra entrega' : 'Tarjeta',
            style: const TextStyle(color: Colors.grey, fontSize: 13),
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
