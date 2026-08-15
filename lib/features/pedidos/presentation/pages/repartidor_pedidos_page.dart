import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/services/contacto_service.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_repartidor_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/confirmar_entrega_sheet.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/pedido_card_repartidor.dart';

class RepartidorPedidosPage extends StatefulWidget {
  final List<Pedido> pedidos;
  final String? pedidoEnAccion;
  final ContactoService contactoService;
  final ValueChanged<String>? onSalirAEntregar;
  final ValueChanged<String>? onConfirmarEntrega;

  const RepartidorPedidosPage({
    super.key,
    required this.pedidos,
    required this.contactoService,
    this.pedidoEnAccion,
    this.onSalirAEntregar,
    this.onConfirmarEntrega,
  });

  @override
  State<RepartidorPedidosPage> createState() => _RepartidorPedidosPageState();
}

class _RepartidorPedidosPageState extends State<RepartidorPedidosPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const _tabs = [
    (label: 'Por Recoger', estado: EstadoPedido.enPreparacion),
    (label: 'En Camino', estado: EstadoPedido.enCamino),
    (label: 'Entregados', estado: EstadoPedido.entregado),
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
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFF9A826),
          labelColor: const Color(0xFF1E3A8A),
          unselectedLabelColor: Colors.grey,
          tabs: _tabs.map((t) => Tab(text: t.label)).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _tabs.map((tab) {
              final filtrados = widget.pedidos
                  .where((p) => p.estado == tab.estado)
                  .toList();

              if (filtrados.isEmpty) {
                return _EstadoVacio(estado: tab.estado);
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: filtrados.length,
                itemBuilder: (_, i) {
                  final pedido = filtrados[i];
                  return PedidoCardRepartidor(
                    pedido: pedido,
                    estaCargando: pedido.id == widget.pedidoEnAccion,
                    contactoService: widget.contactoService,
                    onSalirAEntregar: tab.estado == EstadoPedido.enPreparacion
                        ? () => widget.onSalirAEntregar?.call(pedido.id)
                        : null,
                    onConfirmarEntrega: tab.estado == EstadoPedido.enCamino
                        ? () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
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
                                value: context.read<PedidosRepartidorCubit>(),
                                child: ConfirmarEntregaSheet(pedido: pedido),
                              ),
                            ),
                          )
                        : null,
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
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
          Icon(
            estado == EstadoPedido.entregado
                ? Icons.check_circle_outline
                : Icons.inbox_outlined,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 12),
          Text(
            switch (estado) {
              EstadoPedido.enPreparacion => 'No tienes pedidos por recoger',
              EstadoPedido.enCamino => 'No tienes pedidos en camino',
              _ => 'Aún no has entregado pedidos',
            },
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
