import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/payment_method_type.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_item.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/driver_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/confirm_delivery_sheet.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/driver_order_card.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/driver_quick_actions.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/order_status_chip.dart';

class DriverOrdersPage extends StatefulWidget {
  final List<Order> orders;
  final String? activeOrderId;
  final ContactService contactService;
  final ValueChanged<String>? onDepartForDelivery;
  final ValueChanged<String>? onConfirmDelivery;
  final Future<void> Function()? onRefresh;

  const DriverOrdersPage({
    super.key,
    required this.orders,
    required this.contactService,
    this.activeOrderId,
    this.onDepartForDelivery,
    this.onConfirmDelivery,
    this.onRefresh,
  });

  @override
  State<DriverOrdersPage> createState() => _DriverOrdersPageState();
}

class _DriverOrdersPageState extends State<DriverOrdersPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const _tabs = [
    (label: 'Por Recoger', status: OrderStatus.preparing),
    (label: 'En Camino', status: OrderStatus.onTheWay),
    (label: 'Entregados', status: OrderStatus.delivered),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showOrderDetailsBottomSheet(
    BuildContext context,
    Order order,
    ColorScheme colorTheme,
  ) {
    final bool isCashOnDelivery =
        order.paymentMethod == PaymentMethodType.cashOnDelivery;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colorTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra indicadora superior
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorTheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Encabezado del modal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Detalle #${order.id.substring(0, 8).toUpperCase()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  OrderStatusChip(status: order.status),
                ],
              ),
              const Divider(height: 24),

              // Información de contacto y acciones rápidas (Llamar, WhatsApp, Maps)
              Text(
                'Contacto y Ubicación',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorTheme.primary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.person_outline,
                  color: colorTheme.secondaryContainer,
                ),
                title: Text(
                  order.customerNameSnapshot,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(order.customerPhoneSnapshot),
              ),
              const SizedBox(height: 4),
              DriverQuickActions(
                phone: order.customerPhoneSnapshot,
                address: order.addressSnapshot,
                contactService: widget.contactService,
              ),
              const SizedBox(height: 16),

              // Dirección de entrega detallada
              Text(
                'Dirección de entrega',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorTheme.primary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorTheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  order.addressSnapshot,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(height: 24),

              Text(
                'Artículos a entregar (${order.items.length})',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorTheme.primary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              ...order.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 20,
                        color: colorTheme.outline,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${item.formattedQuantity}  •  ${item.productNameSnapshot}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 24),

              // BLOQUE DE PAGO / COBRO
              if (isCashOnDelivery) ...[
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monto a cobrar en efectivo:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: colorTheme.secondaryContainer,
                          ),
                        ),
                        Text(
                          order.total.toCurrencyFormat,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: colorTheme.secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '⚠️ Recibe el pago completo antes de finalizar la entrega.',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorTheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorTheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorTheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: colorTheme.primary,
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Pedido pagado previamente en la app.\nNo debes cobrar nada al cliente.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: colorTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;

    Future<void> defaultRefresh() async {}

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: colorTheme.secondary,
          labelColor: colorTheme.primary,
          unselectedLabelColor: colorTheme.outline,
          tabs: _tabs.map((t) => Tab(text: t.label)).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _tabs.map((tab) {
              final filtered = widget.orders
                  .where((o) => o.status == tab.status)
                  .toList();

              if (filtered.isEmpty) {
                return RefreshIndicator(
                  color: colorTheme.primary,
                  onRefresh: widget.onRefresh ?? defaultRefresh,
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: AnimatedEmptyState(
                          icon: Icon(switch (tab.status) {
                            OrderStatus.delivered => Icons.check_circle_outline,
                            OrderStatus.onTheWay => Icons.delivery_dining,
                            _ => Icons.inbox_outlined,
                          }, size: 64),
                          title: switch (tab.status) {
                            OrderStatus.preparing => 'Sin pedidos por recoger',
                            OrderStatus.onTheWay => 'Sin pedidos en camino',
                            _ => 'Sin pedidos entregados',
                          },
                          subtitle: 'Aún no hay registros en esta sección',
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                color: colorTheme.primary,
                onRefresh: widget.onRefresh ?? defaultRefresh,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: filtered.length,
                  itemBuilder: (_, i) {
                    final order = filtered[i];
                    return DriverOrderCard(
                      order: order,
                      isLoading: order.id == widget.activeOrderId,
                      contactService: widget.contactService,
                      onViewDetails: () => _showOrderDetailsBottomSheet(
                        context,
                        order,
                        colorTheme,
                      ),
                      onDepartForDelivery: tab.status == OrderStatus.preparing
                          ? () => widget.onDepartForDelivery?.call(order.id)
                          : null,
                      onConfirmDelivery: tab.status == OrderStatus.onTheWay
                          ? () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: colorTheme.surface,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              useSafeArea: true,
                              builder: (ctx) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                                ),
                                child: BlocProvider.value(
                                  value: context.read<DriverOrdersCubit>(),
                                  child: ConfirmDeliverySheet(order: order),
                                ),
                              ),
                            )
                          : null,
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
