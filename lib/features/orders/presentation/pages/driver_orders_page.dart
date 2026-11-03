import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; 
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/driver_orders_cubit.dart'; 
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/confirm_delivery_sheet.dart'; 
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/driver_order_card.dart'; 
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

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    
    // Función de respaldo por si no se pasa por parámetro
    Future<void> defaultRefresh() async {
      // Aquí puedes disparar la recarga del DriverOrdersCubit si lo requieres
    }

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
                          icon: Icon(
                            tab.status == OrderStatus.delivered
                                ? Icons.check_circle_outline
                                : Icons.inbox_outlined,
                            size: 64,
                          ),
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