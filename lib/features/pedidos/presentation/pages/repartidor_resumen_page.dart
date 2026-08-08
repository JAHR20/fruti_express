// features/pedidos/presentation/pages/repartidor_resumen_page.dart

import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';

/// Página de resumen del día para el repartidor.
/// Calcula métricas desde los pedidos ya en memoria — sin llamadas extra a BD.
class RepartidorResumenPage extends StatelessWidget {
  final List<Pedido> pedidos;

  const RepartidorResumenPage({super.key, required this.pedidos});

  // ─── Cálculos en memoria ──────────────────────────────────────────────────

  List<Pedido> get _entregadosHoy {
  final hoy = DateTime.now().toLocal();

  return pedidos.where((p) {
    if (p.estado != EstadoPedido.entregado) return false;
    final fecha = p.fechaEntrega?.toLocal(); // ← convierte a hora local
    if (fecha == null) return false;
    return fecha.year == hoy.year &&
           fecha.month == hoy.month &&
           fecha.day == hoy.day;
  }).toList();
}

  List<Pedido> get _enCamino =>
      pedidos.where((p) => p.estado == EstadoPedido.enCamino).toList();

  List<Pedido> get _porRecoger =>
      pedidos.where((p) => p.estado == EstadoPedido.enPreparacion).toList();

  @override
  Widget build(BuildContext context) {
    final entregados = _entregadosHoy;
    final enCamino = _enCamino;
    final porRecoger = _porRecoger;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resumen del Día',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            _fechaFormateada(),
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          // ─── Tarjetas de métricas ─────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: _TarjetaMetrica(
                  icono: Icons.check_circle_outline,
                  color: Colors.green,
                  valor: entregados.length.toString(),
                  etiqueta: 'Entregados hoy',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TarjetaMetrica(
                  icono: Icons.delivery_dining,
                  color: Colors.teal,
                  valor: enCamino.length.toString(),
                  etiqueta: 'En camino',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TarjetaMetrica(
                  icono: Icons.inventory_2_outlined,
                  color: Colors.purple,
                  valor: porRecoger.length.toString(),
                  etiqueta: 'Por recoger',
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // ─── Lista de entregas del día ────────────────────────────────
          if (entregados.isNotEmpty) ...[
            const Text(
              'Entregas completadas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...entregados.map((p) => _EntregaItem(pedido: p)),
          ] else ...[
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Icon(Icons.local_shipping_outlined,
                      size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 12),
                  Text(
                    'Aún no has completado entregas hoy',
                    style: TextStyle(
                        color: Colors.grey.shade500, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _fechaFormateada() {
    final now = DateTime.now();
    const meses = [
      'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
      'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    ];
    return '${now.day} de ${meses[now.month - 1]} de ${now.year}';
  }
}

// ─── Subwidgets ───────────────────────────────────────────────────────────────

class _TarjetaMetrica extends StatelessWidget {
  final IconData icono;
  final Color color;
  final String valor;
  final String etiqueta;

  const _TarjetaMetrica({
    required this.icono,
    required this.color,
    required this.valor,
    required this.etiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icono, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            valor,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            etiqueta,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class _EntregaItem extends StatelessWidget {
  final Pedido pedido;
  const _EntregaItem({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFDCFCE7),
          child: Icon(Icons.check, color: Colors.green, size: 20),
        ),
        title: Text(
          pedido.clienteNombreSnapshot,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          pedido.direccionSnapshot,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Text(
          FormatoMoneda.formatear(pedido.total),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
      ),
    );
  }
}