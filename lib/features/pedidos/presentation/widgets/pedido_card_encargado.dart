import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/formato_moneda.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';

class PedidoCardEncargado extends StatelessWidget {
  final Pedido pedido;
  final bool estaCargando; 
  final VoidCallback? onConfirmar;
  final VoidCallback? onAsignarRepartidor;
  final VoidCallback? onCancelar;

  const PedidoCardEncargado({
    super.key,
    required this.pedido,
    this.estaCargando = false,
    this.onConfirmar,
    this.onAsignarRepartidor,
    this.onCancelar,
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
            const SizedBox(height: 8),
            _Items(pedido: pedido),
            const SizedBox(height: 12),
            _Total(pedido: pedido),
            if (estaCargando) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
            ] else ...[
              const SizedBox(height: 12),
              _Acciones(
                pedido: pedido,
                onConfirmar: onConfirmar,
                onAsignarRepartidor: onAsignarRepartidor,
                onCancelar: onCancelar,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  final Pedido pedido;
  const _Encabezado({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '#${pedido.id.substring(0, 13).toUpperCase()}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _EstadoChip(estado: pedido.estado),
      ],
    );
  }
}

class _EstadoChip extends StatelessWidget {
  final EstadoPedido estado;
  const _EstadoChip({required this.estado});

  Color get _color => switch (estado) {
    EstadoPedido.pagoPendiente  => Colors.orange,
    EstadoPedido.confirmado     => Colors.blue,
    EstadoPedido.enPreparacion  => Colors.purple,
    EstadoPedido.enCamino       => Colors.teal,
    EstadoPedido.entregado      => Colors.green,
    EstadoPedido.cancelado      => Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        estado.displayName,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: _color,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
        const SizedBox(height: 4),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
          const SizedBox(width: 6),
          Expanded(
            child: Text(pedido.direccionSnapshot,
                style: const TextStyle(color: Colors.grey)),
          ),
        ]),
      ],
    );
  }
}

class _Items extends StatelessWidget {
  final Pedido pedido;
  const _Items({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: pedido.items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('${item.cantidad}x ${item.nombreProductoSnapshot}',
                    style: const TextStyle(fontSize: 13)),
              ),
              Text(
                '\$${(item.cantidad * item.precioUnitarioSnapshot)}',
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _Total extends StatelessWidget {
  final Pedido pedido;
  const _Total({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(FormatoMoneda.formatear(pedido.total),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF1E3A8A))),
      ],
    );
  }
} 

class _Acciones extends StatelessWidget {
  final Pedido pedido;
  final VoidCallback? onConfirmar;
  final VoidCallback? onAsignarRepartidor;
  final VoidCallback? onCancelar;

  const _Acciones({
    required this.pedido,
    this.onConfirmar,
    this.onAsignarRepartidor,
    this.onCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (pedido.estado != EstadoPedido.entregado &&
            pedido.estado != EstadoPedido.cancelado)
          TextButton(
            onPressed: onCancelar,
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Cancelar'),
          ),

        const Spacer(),
        
        switch (pedido.estado) {
          EstadoPedido.pagoPendiente => FilledButton(
              onPressed: onConfirmar,
              style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A)),
              child: const Text('Confirmar'),
            ),
          EstadoPedido.confirmado => FilledButton.icon(
              onPressed: onAsignarRepartidor,
              icon: const Icon(Icons.delivery_dining, size: 18),
              label: const Text('Asignar y Preparar'),
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.purple),
            ),
          _ => const SizedBox.shrink(),
        },
      ],
    );
  }
}