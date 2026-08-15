import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/seccion_repartidor.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/services/contacto_service.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_repartidor_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_repartidor_state.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/pages/repartidor_pedidos_page.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/pages/repartidor_resumen_page.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/repartidor_drawer.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/usuarios_cubit.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/pages/editar_perfil_page.dart';

class RepartidorDashboardPage extends StatefulWidget {
  const RepartidorDashboardPage({super.key});

  @override
  State<RepartidorDashboardPage> createState() =>
      _RepartidorDashboardPageState();
}

class _RepartidorDashboardPageState extends State<RepartidorDashboardPage> {
  PedidosRepartidorCubit? _cubit;
  SeccionRepartidor _seccion = SeccionRepartidor.pedidos;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<PedidosRepartidorCubit>();
    final perfil =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;
    _cubit!.iniciarWatch(perfil.id);
  }

  @override
  void dispose() {
    _cubit?.detenerWatch();
    super.dispose();
  }

  void _navegar(SeccionRepartidor seccion) {
    setState(() => _seccion = seccion);
    Navigator.of(context).pop();
  }

  String get _titulo => switch (_seccion) {
    SeccionRepartidor.pedidos => 'Mis Pedidos',
    SeccionRepartidor.resumen => 'Resumen del Día',
    SeccionRepartidor.perfil => 'Mi Perfil',
  };

  @override
  Widget build(BuildContext context) {
    final perfil =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          _titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: RepartidorDrawer(
        perfil: perfil,
        seccionActiva: _seccion,
        onNavegar: _navegar,
        onCerrarSesion: () => context.read<AuthCubit>().logout(),
      ),
      body: BlocBuilder<PedidosRepartidorCubit, PedidosRepartidorState>(
        builder: (context, state) {
          return state.when(
            inicial: () => const SizedBox.shrink(),
            cargando: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            error: (msg) => _ErrorView(
              mensaje: msg,
              onReintentar: () => _cubit?.iniciarWatch(perfil.id),
            ),
            cargado: (pedidos) =>
                _buildSeccion(pedidos: pedidos, pedidoEnAccion: null),
            accionando: (pedidos, pedidoId) =>
                _buildSeccion(pedidos: pedidos, pedidoEnAccion: pedidoId),
            errorConPedidos: (pedidos, mensaje) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(mensaje), backgroundColor: Colors.red),
                );
              });
              return _buildSeccion(pedidos: pedidos, pedidoEnAccion: null);
            },
          );
        },
      ),
    );
  }

  Widget _buildSeccion({
    required List<Pedido> pedidos,
    required String? pedidoEnAccion,
  }) {
    return switch (_seccion) {
      SeccionRepartidor.pedidos => RepartidorPedidosPage(
        pedidos: pedidos,
        pedidoEnAccion: pedidoEnAccion,
        contactoService: sl<ContactoService>(),
        onSalirAEntregar: (id) => _cubit?.salirAEntregar(id),
      ),
      SeccionRepartidor.resumen => RepartidorResumenPage(pedidos: pedidos),
      SeccionRepartidor.perfil => BlocProvider(
        create: (_) => sl<UsuariosCubit>(),
        child: const EditarPerfilPage(),
      ),
    };
  }
}

class _ErrorView extends StatelessWidget {
  final String mensaje;
  final VoidCallback onReintentar;
  const _ErrorView({required this.mensaje, required this.onReintentar});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(mensaje, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: onReintentar,
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}
