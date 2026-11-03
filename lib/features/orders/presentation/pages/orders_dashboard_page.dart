import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/core/widgets/pill_tab_bar.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; // Import corregido
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/drivers_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/manager_orders_cubit.dart'; // Import corregido
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/manager_orders_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/order_detail_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/assign_driver_sheet.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/cancel_order_dialog.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/manager_order_card.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_state.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class OrdersDashboardPage extends StatefulWidget {
  const OrdersDashboardPage({super.key});

  @override
  State<OrdersDashboardPage> createState() => _OrdersDashboardPageState();
}

class _OrdersDashboardPageState extends State<OrdersDashboardPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  String? _selectedBranchId;

  late final ManagerOrdersCubit _ordersCubit;

  static const _tabs = [
    (label: 'Nuevos', status: OrderStatus.pendingPayment),
    (label: 'Confirmados', status: OrderStatus.confirmed),
    (label: 'Preparando', status: OrderStatus.preparing),
    (label: 'En Camino', status: OrderStatus.onTheWay),
    (label: 'Entregados', status: OrderStatus.delivered),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _ordersCubit = context.read<ManagerOrdersCubit>();

    final currentUser =
        (context.read<AuthCubit>().state as AuthAuthenticated).user;

    if (currentUser.isAdmin) {
      context.read<BranchCubit>().loadBranches();
    } else {
      final branchId = currentUser.branchId;
      if (branchId != null && branchId.isNotEmpty) {
        _selectedBranchId = branchId;
        _ordersCubit.startWatching(branchId);
      }
    }
  }

  @override
  void dispose() {
    _ordersCubit.stopWatching();
    _tabController.dispose();
    super.dispose();
  }

  void _openAssignDriver(String orderId) {
    final managerCubit = context.read<ManagerOrdersCubit>();
    final driversCubit = context.read<DriversCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: managerCubit),
          BlocProvider.value(value: driversCubit),
        ],
        child: AssignDriverSheet(orderId: orderId),
      ),
    );
  }

  Future<void> handleRefresh() async {
    if (_selectedBranchId != null) {
      // Supongamos que tu cubit tiene un método para recargar o re-observar
      context.read<ManagerOrdersCubit>().startWatching(_selectedBranchId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser =
        (context.read<AuthCubit>().state as AuthAuthenticated).user;
    final isGlobalAdmin = currentUser.isAdmin;
    final hasBranch =
        currentUser.branchId != null && currentUser.branchId!.isNotEmpty;

    if (!isGlobalAdmin && !hasBranch) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Tu cuenta no tiene una sucursal asignada.\n'
            'Contacta al administrador.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Column(
      children: [
        PillTabBar(
          controller: _tabController,
          tabs: _tabs.map((t) => Tab(text: t.label)).toList(),
        ),

        if (isGlobalAdmin)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: BlocBuilder<BranchCubit, BranchState>(
              builder: (context, state) {
                if (state.isLoading && state.branches.isEmpty) {
                  return const Center(child: LinearProgressIndicator());
                }

                final branches = state.branches;

                if (branches.isEmpty) {
                  return const Text(
                    'No hay sucursales registradas.',
                    style: TextStyle(color: Colors.grey),
                  );
                }

                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Selecciona una sucursal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  initialValue: _selectedBranchId,
                  items: branches
                      .map(
                        (b) =>
                            DropdownMenuItem(value: b.id, child: Text(b.name)),
                      )
                      .toList(),
                  onChanged: (newId) {
                    if (newId != null) {
                      setState(() => _selectedBranchId = newId);
                      context.read<ManagerOrdersCubit>().startWatching(newId);
                    }
                  },
                );
              },
            ),
          ),

        const SizedBox(height: 8),

        Expanded(
          child: BlocBuilder<ManagerOrdersCubit, ManagerOrdersState>(
            builder: (context, state) {
              return state.when(
                initial: () => _NoBranchSelected(isAdmin: isGlobalAdmin),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                ),
                error: (msg) => _ErrorView(
                  message: msg,
                  onRetry: () {
                    if (_selectedBranchId != null) {
                      context.read<ManagerOrdersCubit>().startWatching(
                        _selectedBranchId!,
                      );
                    }
                  },
                ),
                loaded: (orders) => _TabViews(
                  tabController: _tabController,
                  tabs: _tabs,
                  orders: orders,
                  activeOrderId: null,
                  onConfirm: (id) =>
                      context.read<ManagerOrdersCubit>().confirmOrder(id),
                  onAssignDriver: _openAssignDriver,
                  onCancel: (id) async {
                    final choice = await showCancelOrderDialog(context);
                    if (choice == null || !context.mounted) return;
                    context.read<ManagerOrdersCubit>().cancelOrder(
                      orderId: id,
                      reason: choice.reason,
                      note: choice.note,
                    );
                  },
                  onRefresh: handleRefresh,
                ),
                performingAction: (orders, orderId) => _TabViews(
                  tabController: _tabController,
                  tabs: _tabs,
                  orders: orders,
                  activeOrderId: orderId,
                  onConfirm: (_) {},
                  onAssignDriver: (_) {},
                  onCancel: (_) {},
                  onRefresh: handleRefresh,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TabViews extends StatelessWidget {
  final TabController tabController;
  final List<({String label, OrderStatus status})> tabs;
  final List<Order> orders;
  final String? activeOrderId;
  final ValueChanged<String> onConfirm;
  final ValueChanged<String> onAssignDriver;
  final ValueChanged<String> onCancel;
  final Future<void> Function() onRefresh;

  const _TabViews({
    required this.tabController,
    required this.tabs,
    required this.orders,
    required this.activeOrderId,
    required this.onConfirm,
    required this.onAssignDriver,
    required this.onCancel,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TabBarView(
      controller: tabController,
      children: tabs.map((tab) {
        final filtered = orders.where((o) => o.status == tab.status).toList();

        if (filtered.isEmpty) {
          return RefreshIndicator(
            color: colorScheme.primary,
            onRefresh: onRefresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AnimatedEmptyState(
                    icon: const Icon(Icons.inbox_outlined, size: 64),
                    title: 'Sin pedidos',
                    subtitle:
                        'No hay pedidos ${tab.status.displayName.toLowerCase()} en este momento',
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          color: colorScheme.primary,
          onRefresh: onRefresh,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: filtered.length,
            itemBuilder: (_, i) {
              final order = filtered[i];
              return ManagerOrderCard(
                order: order,
                isLoading: order.id == activeOrderId,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        OrderDetailPage(order: order, isStaffView: true),
                  ),
                ),
                onConfirm: () => onConfirm(order.id),
                onAssignDriver: () => onAssignDriver(order.id),
                onCancel: () => onCancel(order.id),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}

class _NoBranchSelected extends StatelessWidget {
  final bool isAdmin;
  const _NoBranchSelected({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    if (!isAdmin) return const SizedBox.shrink();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.store_outlined, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            'Selecciona una sucursal\npara ver sus pedidos',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}
