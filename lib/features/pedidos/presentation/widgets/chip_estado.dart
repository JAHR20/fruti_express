import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';

class EstadoChip extends StatelessWidget {
  final EstadoPedido estado;

  const EstadoChip({super.key, required this.estado});

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