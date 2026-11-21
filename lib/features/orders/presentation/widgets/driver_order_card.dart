import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/enums/payment_method_type.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/order_status_chip.dart';

class DriverOrderCard extends StatelessWidget {
  final Order order;
  final bool isLoading;
  final ContactService contactService;
  final VoidCallback? onDepartForDelivery;
  final VoidCallback? onConfirmDelivery;
  final VoidCallback? onViewDetails;

  const DriverOrderCard({
    super.key,
    required this.order,
    required this.isLoading,
    required this.contactService,
    this.onDepartForDelivery,
    this.onConfirmDelivery,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final bool isCashOnDelivery =
        order.paymentMethod == PaymentMethodType.cashOnDelivery;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onViewDetails,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Encabezado: ID y Estatus
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${order.id.substring(0, 8).toUpperCase()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      OrderStatusChip(status: order.status),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.chevron_right,
                        size: 18,
                        color: colorTheme.outline,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // 2. Cliente y Total rápido
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 15,
                          color: colorTheme.secondaryContainer,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            order.customerNameSnapshot,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isCashOnDelivery)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorTheme.tertiaryContainer.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Cobrar ${order.total.toCurrencyFormat}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: colorTheme.tertiary,
                        ),
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorTheme.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Pagado',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: colorTheme.primaryContainer,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // 3. Dirección compacta
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: colorTheme.secondaryContainer,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      order.addressSnapshot,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorTheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),

              // 4. Botón de acción rápida (Salir a entregar / Confirmar) o indicador de carga
              if (isLoading) ...[
                const SizedBox(height: 12),
                const LinearProgressIndicator(),
              ] else if (onDepartForDelivery != null ||
                  onConfirmDelivery != null) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FilledButton.icon(
                    onPressed: onDepartForDelivery ?? onConfirmDelivery,
                    style: FilledButton.styleFrom(
                      backgroundColor: onDepartForDelivery != null
                          ? colorTheme.tertiary
                          : colorTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Icon(
                      onDepartForDelivery != null
                          ? Icons.delivery_dining
                          : Icons.check_circle_outline,
                      size: 18,
                    ),
                    label: Text(
                      onDepartForDelivery != null
                          ? 'Salir a Entregar'
                          : 'Confirmar Entrega',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
