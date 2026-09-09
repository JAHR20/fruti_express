import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/driver_section.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/driver_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/driver_orders_state.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/driver_orders_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/pages/driver_summary_page.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/driver_drawer.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/pages/edit_profile_page.dart';

class DriverDashboardPage extends StatefulWidget {
  const DriverDashboardPage({super.key});

  @override
  State<DriverDashboardPage> createState() => _DriverDashboardPageState();
}

class _DriverDashboardPageState extends State<DriverDashboardPage> {
  DriverOrdersCubit? _cubit;
  DriverSection _section = DriverSection.orders;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<DriverOrdersCubit>();
    final profile =
        (context.read<AuthCubit>().state as AuthAuthenticated).profile;
    _cubit!.startWatching(profile.id);
  }

  @override
  void dispose() {
    _cubit?.stopWatching();
    super.dispose();
  }

  void _navigate(DriverSection section) {
    setState(() => _section = section);
    Navigator.of(context).pop();
  }

  String get _title => switch (_section) {
    DriverSection.orders => 'Mis Pedidos',
    DriverSection.summary => 'Resumen del Día',
    DriverSection.profile => 'Mi Perfil',
  };

  @override
  Widget build(BuildContext context) {
    final profile =
        (context.read<AuthCubit>().state as AuthAuthenticated).profile;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: DriverDrawer(
        profile: profile,
        activeSection: _section,
        onNavigate: _navigate,
        onLogout: () => context.read<AuthCubit>().logout(),
      ),
      body: BlocBuilder<DriverOrdersCubit, DriverOrdersState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            error: (msg) => _ErrorView(
              message: msg,
              onRetry: () => _cubit?.startWatching(profile.id),
            ),
            loaded: (orders) =>
                _buildSection(orders: orders, actionOrderId: null),
            performingAction: (orders, orderId) =>
                _buildSection(orders: orders, actionOrderId: orderId),
            errorWithOrders: (orders, message) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              });
              return _buildSection(orders: orders, actionOrderId: null);
            },
          );
        },
      ),
    );
  }

  Widget _buildSection({
    required List<Order> orders,
    required String? actionOrderId,
  }) {
    return switch (_section) {
      DriverSection.orders => DriverOrdersPage(
        orders: orders,
        activeOrderId: actionOrderId, 
        contactService: sl<ContactService>(),
        onDepartForDelivery: (id) =>
            _cubit?.departForDelivery(id), 
      ),
      DriverSection.summary => DriverSummaryPage(
        orders: orders,
      ), 
      DriverSection.profile => BlocProvider(
        create: (_) => sl<UsersCubit>(),
        child: const EditProfilePage(),
      ),
    };
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
