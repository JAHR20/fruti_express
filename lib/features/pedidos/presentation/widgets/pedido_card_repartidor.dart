// features/pedidos/presentation/widgets/pedido_card_repartidor.dart

import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/services/contacto_service.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/acciones_rapidas_repartidor.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/widgets/chip_estado.dart';

class PedidoCardRepartidor extends StatelessWidget {
  final Pedido pedido;
  final bool estaCargando;
  final ContactoService contactoService;
  final VoidCallback? onSalirAEntregar;
  final VoidCallback? onConfirmarEntrega;

  const PedidoCardRepartidor({
    super.key,
    required this.pedido,
    required this.estaCargando,
    required this.contactoService,
    this.onSalirAEntregar,
    this.onConfirmarEntrega,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Encabezado(pedido: pedido),
            const Divider(height: 24),
            _InfoCliente(pedido: pedido),
            const SizedBox(height: 12),
            AccionesRapidasRepartidor(
              telefono: pedido.clienteTelefonoSnapshot,
              direccion: pedido.direccionSnapshot,
              contactoService: contactoService,
            ),
            const SizedBox(height: 12),
            _DireccionDestacada(direccion: pedido.direccionSnapshot),
            const SizedBox(height: 12),
            _Items(pedido: pedido),
            const Divider(height: 20),
            _Total(total: FormatoMoneda.formatear(pedido.total)),
            if (estaCargando) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
            ] else if (onSalirAEntregar != null ||
                onConfirmarEntrega != null) ...[
              const SizedBox(height: 12),
              _BotonAccion(
                onSalirAEntregar: onSalirAEntregar,
                onConfirmarEntrega: onConfirmarEntrega,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Subwidgets ───────────────────────────────────────────────────────────────

class _Encabezado extends StatelessWidget {
  final Pedido pedido;
  const _Encabezado({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '#${pedido.id.substring(0, 8).toUpperCase()}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        EstadoChip(estado: pedido.estado),
      ],
    );
  }
}

class _InfoCliente extends StatelessWidget {
  final Pedido pedido;
  const _InfoCliente({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Icon(Icons.person_outline, size: 16, color: Colors.grey),
          const SizedBox(width: 6),
          Text(pedido.clienteNombreSnapshot,
              style: const TextStyle(fontWeight: FontWeight.w500)),
        ]),
        const SizedBox(height: 4),
        Row(children: [
          const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
          const SizedBox(width: 6),
          Text(pedido.clienteTelefonoSnapshot,
              style: const TextStyle(color: Colors.grey)),
        ]),
      ],
    );
  }
}

class _DireccionDestacada extends StatelessWidget {
  final String direccion;
  const _DireccionDestacada({required this.direccion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: const Color(0xFF1E3A8A).withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on, size: 18, color: Color(0xFF1E3A8A)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              direccion,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _Items extends StatelessWidget {
  final Pedido pedido;
  const _Items({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pedido.items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${item.cantidad}x ${item.nombreProductoSnapshot}',
                  style: const TextStyle(fontSize: 13)),
              Text('\$${item.cantidad * item.precioUnitarioSnapshot}',
                  style: const TextStyle(fontSize: 13)),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _Total extends StatelessWidget {
  final String total;
  const _Total({required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(total,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF1E3A8A))),
      ],
    );
  }
}

class _BotonAccion extends StatelessWidget {
  final VoidCallback? onSalirAEntregar;
  final VoidCallback? onConfirmarEntrega;

  const _BotonAccion({
    this.onSalirAEntregar,
    this.onConfirmarEntrega,
  });

  @override
  Widget build(BuildContext context) {
    final esSalir = onSalirAEntregar != null;
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: FilledButton.icon(
        onPressed: esSalir ? onSalirAEntregar : onConfirmarEntrega,
        style: FilledButton.styleFrom(
          backgroundColor: esSalir ? Colors.teal : Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
        ),
        icon: Icon(
          esSalir ? Icons.delivery_dining : Icons.check_circle_outline,
          size: 20,
        ),
        label: Text(
          esSalir ? 'Salir a Entregar' : 'Confirmar Entrega',
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}