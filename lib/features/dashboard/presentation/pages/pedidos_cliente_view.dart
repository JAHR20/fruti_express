// features/dashboard/presentation/pages/pedidos_cliente_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/pages/pedido_detalle_page.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido_item.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_cliente_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_cliente_state.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/chip_estado.dart';

class PedidosClienteView extends StatefulWidget {
  const PedidosClienteView({super.key});

  @override
  State<PedidosClienteView> createState() => _PedidosClienteViewState();
}

class _PedidosClienteViewState extends State<PedidosClienteView> {
  @override
  void initState() {
    super.initState();
    final perfil =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;
    context.read<PedidosClienteCubit>().cargar(perfil.id);
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
      body: BlocBuilder<PedidosClienteCubit, PedidosClienteState>(
        builder: (context, state) {
          return state.when(
            inicial: () => const SizedBox.shrink(),
            cargando: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF1E3A8A)),
            ),
            error: (msg) => _ErrorView(
              mensaje: msg,
              onReintentar: () {
                final perfil =
                    (context.read<AuthCubit>().state as AuthAuthenticated)
                        .perfil;
                context.read<PedidosClienteCubit>().cargar(perfil.id);
              },
            ),
            cargado: (pedidos) {
              if (pedidos.isEmpty) return const _SinPedidos();
              return RefreshIndicator(
                color: const Color(0xFF1E3A8A),
                onRefresh: () async {
                  final perfil =
                      (context.read<AuthCubit>().state as AuthAuthenticated)
                          .perfil;
                  await context.read<PedidosClienteCubit>().cargar(perfil.id);
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: pedidos.length,
                  itemBuilder: (_, i) => _PedidoCardCliente(pedido: pedidos[i]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ─── Card del cliente ─────────────────────────────────────────────────────────

class _PedidoCardCliente extends StatelessWidget {
  final Pedido pedido;
  const _PedidoCardCliente({required this.pedido});

  @override
  Widget build(BuildContext context) {
    final estaActivo =
        pedido.estado != EstadoPedido.entregado &&
        pedido.estado != EstadoPedido.cancelado;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => PedidoDetallePage(pedido: pedido)),
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
              // ─── Encabezado ───────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${pedido.id.substring(0, 8).toUpperCase()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  EstadoChip(estado: pedido.estado),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                _formatearFecha(pedido.fechaCreacion),
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
              const Divider(height: 20),

              // ─── Items ────────────────────────────────────────────────────
              ...pedido.items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          // 🌟 La UI no piensa, solo pinta lo que el Dominio ya procesó
                          '${item.cantidadFormateada} x ${item.nombreProductoSnapshot}',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      Text(
                        // 🌟 Adiós multiplicaciones feas en la vista
                        item.subtotalCalculado.formatoMoneda,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                );
              }),
              const Divider(height: 20),

              // ─── Total ────────────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    FormatoMoneda.formatear(pedido.total),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),

              // ─── Código de confirmación (solo pedidos activos) ────────────
              if (estaActivo && pedido.codigoConfirmacion != null) ...[
                const SizedBox(height: 16),
                _CodigoConfirmacion(codigo: pedido.codigoConfirmacion!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatearFecha(DateTime fecha) {
    const meses = [
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
    return '${fecha.day} ${meses[fecha.month - 1]} ${fecha.year}';
  }
}

// ─── Widget del código ────────────────────────────────────────────────────────

class _CodigoConfirmacion extends StatefulWidget {
  final String codigo;
  const _CodigoConfirmacion({required this.codigo});

  @override
  State<_CodigoConfirmacion> createState() => _CodigoConfirmacionState();
}

class _CodigoConfirmacionState extends State<_CodigoConfirmacion> {
  bool _visible = false;

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
                onTap: () => setState(() => _visible = !_visible),
                child: Text(
                  _visible ? 'Ocultar' : 'Mostrar',
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
              _visible ? widget.codigo : '••••',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 16,
                color: _visible
                    ? const Color(0xFF1E3A8A)
                    : Colors.grey.shade400,
              ),
            ),
          ),
          if (_visible) ...[
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

// ─── Vistas auxiliares ────────────────────────────────────────────────────────

class _SinPedidos extends StatelessWidget {
  const _SinPedidos();

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
