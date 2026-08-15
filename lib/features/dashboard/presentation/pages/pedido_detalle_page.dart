import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido_item.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/chip_estado.dart';

class PedidoDetallePage extends StatelessWidget {
  final Pedido pedido;

  const PedidoDetallePage({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    final estaActivo =
        pedido.estado != EstadoPedido.entregado &&
        pedido.estado != EstadoPedido.cancelado;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          '#${pedido.id.substring(0, 8).toUpperCase()}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SeccionEstado(pedido: pedido),
            const SizedBox(height: 16),

            if (pedido.estado != EstadoPedido.cancelado) ...[
              _TimelinePedido(estadoActual: pedido.estado),
              const SizedBox(height: 16),
            ],

            _SeccionCard(
              titulo: 'Dirección de entrega',
              icono: Icons.location_on_outlined,
              child: Text(
                pedido.direccionSnapshot,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),

            _SeccionCard(
              titulo: 'Productos',
              icono: Icons.shopping_bag_outlined,
              child: Column(
                children: pedido.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${item.cantidadFormateada} x ${item.nombreProductoSnapshot}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          FormatoMoneda.formatear(item.subtotalCalculado),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            _SeccionCard(
              titulo: 'Resumen de pago',
              icono: Icons.receipt_outlined,
              child: Column(
                children: [
                  _FilaResumen(
                    etiqueta: 'Subtotal',
                    valor: pedido.subtotal.formatoMoneda,
                  ),
                  _FilaResumen(
                    etiqueta: 'Envío',
                    valor: pedido.costoEnvio == 0
                        ? 'Gratis'
                        : pedido.costoEnvio.formatoMoneda,
                  ),
                  if (pedido.descuentosAplicados > 0)
                    _FilaResumen(
                      etiqueta: 'Descuentos',
                      valor: pedido.descuentosAplicados.formatoMoneda,
                      color: Colors.green,
                    ),
                  const Divider(height: 16),
                  _FilaResumen(
                    etiqueta: 'Total',
                    valor: pedido.total.formatoMoneda,
                    esBold: true,
                    color: const Color(0xFF1E3A8A),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (estaActivo && pedido.codigoConfirmacion != null) ...[
              _CodigoConfirmacion(codigo: pedido.codigoConfirmacion!),
              const SizedBox(height: 12),
            ],

            _SeccionCard(
              titulo: 'Información del pedido',
              icono: Icons.info_outline,
              child: Column(
                children: [
                  _FilaInfo(
                    etiqueta: 'Fecha de pedido',
                    valor: _formatearFecha(pedido.fechaCreacion),
                  ),
                  if (pedido.fechaEntrega != null)
                    _FilaInfo(
                      etiqueta: 'Fecha de entrega',
                      valor: _formatearFecha(pedido.fechaEntrega!),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  String _formatearFecha(DateTime fecha) {
    final local = fecha.toLocal();
    const meses = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    return '${local.day} de ${meses[local.month - 1]} de ${local.year}';
  }
}

class _SeccionEstado extends StatelessWidget {
  final Pedido pedido;
  const _SeccionEstado({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Estado actual',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                EstadoChip(estado: pedido.estado),
              ],
            ),
          ),
          // Ícono según estado
          Icon(
            _iconoEstado(pedido.estado),
            size: 48,
            color: _colorEstado(pedido.estado).withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }

  IconData _iconoEstado(EstadoPedido estado) => switch (estado) {
    EstadoPedido.pagoPendiente => Icons.hourglass_empty,
    EstadoPedido.confirmado => Icons.check_circle_outline,
    EstadoPedido.enPreparacion => Icons.inventory_2_outlined,
    EstadoPedido.enCamino => Icons.delivery_dining,
    EstadoPedido.entregado => Icons.done_all,
    EstadoPedido.cancelado => Icons.cancel_outlined,
  };

  Color _colorEstado(EstadoPedido estado) => switch (estado) {
    EstadoPedido.pagoPendiente => Colors.orange,
    EstadoPedido.confirmado => Colors.blue,
    EstadoPedido.enPreparacion => Colors.purple,
    EstadoPedido.enCamino => Colors.teal,
    EstadoPedido.entregado => Colors.green,
    EstadoPedido.cancelado => Colors.red,
  };
}

class _TimelinePedido extends StatelessWidget {
  final EstadoPedido estadoActual;

  const _TimelinePedido({required this.estadoActual});

  static const _pasos = [
    (estado: EstadoPedido.pagoPendiente, etiqueta: 'Pedido\nrecibido'),
    (estado: EstadoPedido.confirmado, etiqueta: 'Confirmado'),
    (estado: EstadoPedido.enPreparacion, etiqueta: 'En\npreparación'),
    (estado: EstadoPedido.enCamino, etiqueta: 'En\ncamino'),
    (estado: EstadoPedido.entregado, etiqueta: 'Entregado'),
  ];

  int get _indiceActual => _pasos.indexWhere((p) => p.estado == estadoActual);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Seguimiento',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(_pasos.length * 2 - 1, (i) {
              if (i.isOdd) {
                // Línea conectora
                final pasoIndex = i ~/ 2;
                final completado = pasoIndex < _indiceActual;
                return Expanded(
                  child: SizedBox(
                    height: 32,
                    child: Center(
                      child: Container(
                        height: 2,
                        color: completado
                            ? const Color(0xFF1E3A8A)
                            : Colors.grey.shade200,
                      ),
                    ),
                  ),
                );
              }

              final pasoIndex = i ~/ 2;
              final paso = _pasos[pasoIndex];
              final completado = pasoIndex <= _indiceActual;
              final esActual = pasoIndex == _indiceActual;

              return Column(
                children: [
                  SizedBox(
                    height: 32,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: esActual ? 32 : 24,
                        height: esActual ? 32 : 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: completado
                              ? const Color(0xFF1E3A8A)
                              : Colors.grey.shade200,
                          border: esActual
                              ? Border.all(
                                  color: const Color(
                                    0xFF1E3A8A,
                                  ).withValues(alpha: 0.3),
                                  width: 4,
                                )
                              : null,
                        ),
                        child: completado
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 28,
                    child: Text(
                      paso.etiqueta,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: completado
                            ? const Color(0xFF1E3A8A)
                            : Colors.grey.shade400,
                        fontWeight: esActual
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF1E3A8A).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.lock_outline,
                size: 18,
                color: Color(0xFF1E3A8A),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Código de confirmación',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => _visible = !_visible),
                child: Text(_visible ? 'Ocultar' : 'Mostrar'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _visible ? widget.codigo : '••••',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              letterSpacing: 20,
              color: _visible ? const Color(0xFF1E3A8A) : Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Muéstrale este código al repartidor cuando llegue',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

class _SeccionCard extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final Widget child;

  const _SeccionCard({
    required this.titulo,
    required this.icono,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icono, size: 18, color: const Color(0xFF1E3A8A)),
              const SizedBox(width: 8),
              Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          child,
        ],
      ),
    );
  }
}

class _FilaResumen extends StatelessWidget {
  final String etiqueta;
  final String valor;
  final bool esBold;
  final Color? color;

  const _FilaResumen({
    required this.etiqueta,
    required this.valor,
    this.esBold = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: TextStyle(
              fontSize: 14,
              fontWeight: esBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            valor,
            style: TextStyle(
              fontSize: 14,
              fontWeight: esBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilaInfo extends StatelessWidget {
  final String etiqueta;
  final String valor;

  const _FilaInfo({required this.etiqueta, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          Text(valor, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
