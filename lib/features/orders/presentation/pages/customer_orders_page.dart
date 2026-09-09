import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart'; // FormatoMoneda -> CurrencyFormatter
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/order_detail_page.dart'; // PedidoDetallePage -> OrderDetailPage
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart'; // Pedido -> Order
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_item.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; // EstadoPedido -> OrderStatus
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/customer_orders_cubit.dart'; // PedidosClienteCubit -> CustomerOrdersCubit
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/customer_orders_state.dart'; // PedidosClienteState -> CustomerOrdersState
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/order_status_chip.dart'; // EstadoChip -> OrderStatusChip

class CustomerOrdersPage extends StatefulWidget { // PedidosClienteView -> CustomerOrdersPage
  const CustomerOrdersPage({super.key});

  @override
  State<CustomerOrdersPage> createState() => _CustomerOrdersPageState();
}

class _CustomerOrdersPageState extends State<CustomerOrdersPage> {
  @override
  void initState() {
    super.initState();
    final profile = // perfil -> profile
        (context.read<AuthCubit>().state as AuthAuthenticated).profile;
    context.read<CustomerOrdersCubit>().load(profile.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Mis Pedidos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(), // inicial -> initial
            loading: () => const Center( // cargando -> loading
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            error: (msg) => _ErrorView(
              message: msg, // mensaje -> message
              onRetry: () { // onReintentar -> onRetry
                final profile =
                    (context.read<AuthCubit>().state as AuthAuthenticated)
                        .profile;
                context.read<CustomerOrdersCubit>().load(profile.id);
              },
            ),
            loaded: (orders) { // cargado -> loaded, pedidos -> orders
              if (orders.isEmpty) return const _EmptyOrdersView(); // _SinPedidos -> _EmptyOrdersView
              return RefreshIndicator(
                color: const Color(0xFF1E3A8A),
                onRefresh: () async {
                  final profile =
                      (context.read<AuthCubit>().state as AuthAuthenticated)
                          .profile;
                  await context.read<CustomerOrdersCubit>().load(profile.id);
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: orders.length,
                  itemBuilder: (_, i) => _CustomerOrderCard(order: orders[i]), // _PedidoCardCliente -> _CustomerOrderCard
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
    final isActive = // estaActivo -> isActive
        order.status != OrderStatus.delivered &&
        order.status != OrderStatus.cancelled;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => OrderDetailPage(order: order)),
      ),
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  OrderStatusChip(status: order.status),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                _formatDate(order.createdAt), // _formatearFecha -> _formatDate
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
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
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      Text(
                        CurrencyFormatter.format(item.calculatedSubtotal), // formatoMoneda -> CurrencyFormatter.format()
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                );
              }),
              const Divider(height: 20),
              Row(
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
              ),
              if (isActive && order.confirmationCode != null) ...[ // codigoConfirmacion -> confirmationCode
                const SizedBox(height: 16),
                _ConfirmationCode(code: order.confirmationCode!), // _CodigoConfirmacion -> _ConfirmationCode
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) { // _formatearFecha -> _formatDate
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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF1E3A8A).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.lock_outline,
                size: 16,
                color: Color(0xFF1E3A8A),
              ),
              const SizedBox(width: 6),
              const Text(
                'Código de confirmación',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1E3A8A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _isVisible = !_isVisible), // _visible -> _isVisible
                child: Text(
                  _isVisible ? 'Ocultar' : 'Mostrar',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1E3A8A),
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
                    ? const Color(0xFF1E3A8A)
                    : Colors.grey.shade400,
              ),
            ),
          ),
          if (_isVisible) ...[
            const SizedBox(height: 4),
            Center(
              child: Text(
                'Muéstraselo al repartidor al recibir tu pedido',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _EmptyOrdersView extends StatelessWidget { // _SinPedidos -> _EmptyOrdersView
  const _EmptyOrdersView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'Aún no tienes pedidos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Cuando hagas tu primer pedido\naparecerá aquí',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message; // mensaje -> message
  final VoidCallback onRetry; // onReintentar -> onRetry
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
          FilledButton(
            onPressed: onRetry,
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}