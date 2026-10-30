import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/core/widgets/animated_empty_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/order_detail_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_item.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/customer_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/customer_orders_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/order_status_chip.dart';

class CustomerOrdersPage extends StatefulWidget {
  const CustomerOrdersPage({super.key});

  @override
  State<CustomerOrdersPage> createState() => _CustomerOrdersPageState();
}

class _CustomerOrdersPageState extends State<CustomerOrdersPage> {
  @override
  void initState() {
    super.initState();
    final profile = (context.read<AuthCubit>().state as AuthAuthenticated).user;
    context.read<CustomerOrdersCubit>().load(profile.id);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Future<void> handleRefresh() async {
      final authState = context.read<AuthCubit>().state;
      if (authState is AuthAuthenticated) {
        final ordersCubit = context.read<CustomerOrdersCubit>();
        await ordersCubit.load(authState.user.id);
      }
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Mis Pedidos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            ),

            error: (msg) => RefreshIndicator(
              color: colorScheme.primary,
              onRefresh: handleRefresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _ErrorView(message: msg, onRetry: handleRefresh),
                  ),
                ],
              ),
            ),

            loaded: (orders) {
              return RefreshIndicator(
                color: colorScheme.primary,
                onRefresh: handleRefresh,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    // CASO A: VACÍO
                    if (orders.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: AnimatedEmptyState(
                          icon: Icon(Icons.shopping_bag_outlined),
                          title: 'Aún no tienes pedidos',
                          subtitle:
                              'Cuando realices tu primer pedido, aparecerá aquí.',
                        ),
                      )
                    // CASO B: CON DATOS
                    else
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        sliver: SliverList.builder(
                          itemCount: orders.length,
                          itemBuilder: (_, i) =>
                              _CustomerOrderCard(order: orders[i]),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CustomerOrderCard extends StatelessWidget {
  final Order order;
  const _CustomerOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isActive =
        order.status != OrderStatus.delivered &&
        order.status != OrderStatus.cancelled;

    return InkWell(
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => OrderDetailPage(order: order))),
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // En M3, Card toma automáticamente colorScheme.surfaceContainer u onSurface
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${order.id.substring(0, 8).toUpperCase()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  OrderStatusChip(status: order.status),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                _formatDate(order.createdAt),
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
              const Divider(height: 20),

              ...order.items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${item.formattedQuantity} x ${item.productNameSnapshot}',
                          style: TextStyle(
                            fontSize: 13,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Text(
                        CurrencyFormatter.format(item.calculatedSubtotal),
                        style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    CurrencyFormatter.format(order.total),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              if (isActive && order.confirmationCode != null) ...[
                const SizedBox(height: 16),
                _ConfirmationCode(code: order.confirmationCode!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
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
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lock_outline,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 6),
              Text(
                'Código de confirmación',
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _isVisible = !_isVisible),
                child: Text(
                  _isVisible ? 'Ocultar' : 'Mostrar',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              _isVisible ? widget.code : '••••',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 16,
                color: _isVisible
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.primaryFixed.withValues(alpha: 1),
              ),
            ),
          ),
          if (_isVisible) ...[
            const SizedBox(height: 4),
            Center(
              child: Text(
                'Muéstraselo al repartidor al recibir tu pedido',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
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
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: colorScheme.error),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}
