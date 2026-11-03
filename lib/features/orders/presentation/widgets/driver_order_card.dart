import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_item.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/driver_quick_actions.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/order_status_chip.dart';

class DriverOrderCard extends StatelessWidget {
  final Order order;
  final bool isLoading;
  final ContactService contactService;
  final VoidCallback? onDepartForDelivery;
  final VoidCallback? onConfirmDelivery;

  const DriverOrderCard({
    super.key,
    required this.order,
    required this.isLoading,
    required this.contactService,
    this.onDepartForDelivery,
    this.onConfirmDelivery,
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
            const SizedBox(height: 12),
            DriverQuickActions(
              phone: order.customerPhoneSnapshot,
              address: order.addressSnapshot,
              contactService: contactService,
            ),
            const SizedBox(height: 12),
            _HighlightedAddress(address: order.addressSnapshot),
            const SizedBox(height: 12),
            _Items(order: order),
            const Divider(height: 20),
            _Total(total: CurrencyFormatter.format(order.total)),
            if (isLoading) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
            ] else if (onDepartForDelivery != null ||
                onConfirmDelivery != null) ...[
              const SizedBox(height: 12),
              _ActionButton(
                onDepartForDelivery: onDepartForDelivery,
                onConfirmDelivery: onConfirmDelivery,
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
          '#${order.id.substring(0, 8).toUpperCase()}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        OrderStatusChip(status: order.status),
      ],
    );
  }
}

class _CustomerInfo extends StatelessWidget {
  final Order order;
  const _CustomerInfo({required this.order});

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person_outline, size: 16, color: colorTheme.secondaryContainer),
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
            Icon(Icons.phone_outlined, size: 16, color: colorTheme.secondaryContainer),
            const SizedBox(width: 6),
            Text(
              order.customerPhoneSnapshot,
              style: TextStyle(color: colorTheme.outline),
            ),
          ],
        ),
      ],
    );
  }
}

class _HighlightedAddress extends StatelessWidget {
  final String address;
  const _HighlightedAddress({required this.address});

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    return Card(
      color: colorTheme.surfaceContainerHigh,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on, size: 18, color: colorTheme.secondaryContainer),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                address,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Items extends StatelessWidget {
  final Order order;
  const _Items({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: order.items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${item.formattedQuantity} x ${item.productNameSnapshot}',
                style: const TextStyle(fontSize: 13),
              ),
              Text(
                item.calculatedSubtotal.toCurrencyFormat,
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
  final String total;
  const _Total({required this.total});

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
          total,
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

class _ActionButton extends StatelessWidget {
  final VoidCallback? onDepartForDelivery;
  final VoidCallback? onConfirmDelivery;

  const _ActionButton({this.onDepartForDelivery, this.onConfirmDelivery});

  @override
  Widget build(BuildContext context) {
    final isDeparting = onDepartForDelivery != null;
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: FilledButton.icon(
        onPressed: isDeparting ? onDepartForDelivery : onConfirmDelivery,
        style: FilledButton.styleFrom(
          backgroundColor: isDeparting ? Colors.teal : Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(
          isDeparting ? Icons.delivery_dining : Icons.check_circle_outline,
          size: 20,
        ),
        label: Text(
          isDeparting ? 'Salir a Entregar' : 'Confirmar Entrega',
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
