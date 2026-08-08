import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_encargado_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_encargado_state.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/repartidores_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/asignar_repartidor_sheet.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/pedido_card_encargado.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_state.dart';

class DashboardPedidosPage extends StatefulWidget {
  const DashboardPedidosPage({super.key});

  @override
  State<DashboardPedidosPage> createState() => _DashboardPedidosPageState();
}

class _DashboardPedidosPageState extends State<DashboardPedidosPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  String? _sucursalSeleccionadaId;

  late final PedidosEncargadoCubit _pedidosCubit;

  static const _tabs = [
    (label: 'Nuevos',      estado: EstadoPedido.pagoPendiente),
    (label: 'Confirmados', estado: EstadoPedido.confirmado),
    (label: 'Preparando',  estado: EstadoPedido.enPreparacion),
    (label: 'En Camino',   estado: EstadoPedido.enCamino),
    (label: 'Entregados',  estado: EstadoPedido.entregado),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _pedidosCubit = context.read<PedidosEncargadoCubit>();

    final usuarioActual =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;

    final esEncargado = usuarioActual.sucursalId != null &&
        usuarioActual.sucursalId!.isNotEmpty;

    // Encargado → inicia watch directo con su sucursal
    // Admin → espera a que seleccione sucursal en el dropdown
    if (esEncargado) {
      _sucursalSeleccionadaId = usuarioActual.sucursalId;
      _pedidosCubit.iniciarWatch(usuarioActual.sucursalId!);
    } else {
      context.read<SucursalCubit>().cargarSucursales();
    }
  }

  @override
  void dispose() {
    _pedidosCubit.detenerWatch(); 
    _tabController.dispose();
    super.dispose();
  }

  void _abrirAsignarRepartidor(String pedidoId) {
    final encargadoCubit = context.read<PedidosEncargadoCubit>();
    final repartidoresCubit = context.read<RepartidoresCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: encargadoCubit),
          BlocProvider.value(value: repartidoresCubit),
        ],
        child: AsignarRepartidorSheet(pedidoId: pedidoId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usuarioActual =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;
    final esAdminGlobal = usuarioActual.sucursalId == null ||
        usuarioActual.sucursalId!.isEmpty;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Pedidos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: const Color(0xFFF9A826),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: _tabs.map((t) => Tab(text: t.label)).toList(),
        ),
      ),
      body: Column(
        children: [
          // ─── Selector de sucursal (solo Admin) ───────────────────────────
          if (esAdminGlobal)
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: BlocBuilder<SucursalCubit, SucursalState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: LinearProgressIndicator()),
                    loaded: (sucursales) {
                      if (sucursales.isEmpty) {
                        return const Text('No hay sucursales registradas.',
                            style: TextStyle(color: Colors.grey));
                      }
                      return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Selecciona una sucursal',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                        initialValue: _sucursalSeleccionadaId,
                        items: sucursales
                            .map((s) => DropdownMenuItem(
                                  value: s.id,
                                  child: Text(s.nombre),
                                ))
                            .toList(),
                        onChanged: (nuevoId) {
                          if (nuevoId != null) {
                            setState(
                                () => _sucursalSeleccionadaId = nuevoId);
                            // Reinicia el watch con la nueva sucursal
                            context
                                .read<PedidosEncargadoCubit>()
                                .iniciarWatch(nuevoId);
                          }
                        },
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),

          // ─── Tabs de pedidos ─────────────────────────────────────────────
          Expanded(
            child: BlocBuilder<PedidosEncargadoCubit, PedidosEncargadoState>(
              builder: (context, state) {
                return state.when(
                  inicial: () => _SinSucursal(esAdmin: esAdminGlobal),
                  cargando: () => const Center(
                    child:
                        CircularProgressIndicator(color: Color(0xFF1E3A8A)),
                  ),
                  error: (msg) => _ErrorView(
                    mensaje: msg,
                    onReintentar: () {
                      if (_sucursalSeleccionadaId != null) {
                        context
                            .read<PedidosEncargadoCubit>()
                            .iniciarWatch(_sucursalSeleccionadaId!);
                      }
                    },
                  ),
                  cargado: (pedidos) => _TabViews(
                    tabController: _tabController,
                    tabs: _tabs,
                    pedidos: pedidos,
                    pedidoEnAccion: null,
                    onConfirmar: (id) => context
                        .read<PedidosEncargadoCubit>()
                        .confirmarPedido(id),
                    onAsignarRepartidor: _abrirAsignarRepartidor,
                    onCancelar: (id) => context
                        .read<PedidosEncargadoCubit>()
                        .cancelarPedido(id),
                  ),
                  accionando: (pedidos, pedidoId) => _TabViews(
                    tabController: _tabController,
                    tabs: _tabs,
                    pedidos: pedidos,
                    pedidoEnAccion: pedidoId,
                    onConfirmar: (_) {},
                    onAsignarRepartidor: (_) {},
                    onCancelar: (_) {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── TabViews ─────────────────────────────────────────────────────────────────

class _TabViews extends StatelessWidget {
  final TabController tabController;
  final List<({String label, EstadoPedido estado})> tabs;
  final List<Pedido> pedidos;
  final String? pedidoEnAccion;
  final ValueChanged<String> onConfirmar;
  final ValueChanged<String> onAsignarRepartidor;
  final ValueChanged<String> onCancelar;

  const _TabViews({
    required this.tabController,
    required this.tabs,
    required this.pedidos,
    required this.pedidoEnAccion,
    required this.onConfirmar,
    required this.onAsignarRepartidor,
    required this.onCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: tabs.map((tab) {
        final filtrados =
            pedidos.where((p) => p.estado == tab.estado).toList();

        if (filtrados.isEmpty) {
          return _EstadoVacio(estado: tab.estado);
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: filtrados.length,
          itemBuilder: (_, i) {
            final pedido = filtrados[i];
            return PedidoCardEncargado(
              pedido: pedido,
              estaCargando: pedido.id == pedidoEnAccion,
              onConfirmar: () => onConfirmar(pedido.id),
              onAsignarRepartidor: () => onAsignarRepartidor(pedido.id),
              onCancelar: () => onCancelar(pedido.id),
            );
          },
        );
      }).toList(),
    );
  }
}

// ─── Vistas auxiliares ────────────────────────────────────────────────────────

class _SinSucursal extends StatelessWidget {
  final bool esAdmin;
  const _SinSucursal({required this.esAdmin});

  @override
  Widget build(BuildContext context) {
    if (!esAdmin) return const SizedBox.shrink();
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

class _EstadoVacio extends StatelessWidget {
  final EstadoPedido estado;
  const _EstadoVacio({required this.estado});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            'Sin pedidos ${estado.displayName.toLowerCase()}',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
          ),
        ],
      ),
    );
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