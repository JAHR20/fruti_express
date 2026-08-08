import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

class RoleBadge extends StatelessWidget {
  final TipoUsuario? rol;

  const RoleBadge({super.key, required this.rol});

  @override
  Widget build(BuildContext context) {
    Color color;
    String texto;

    switch (rol) {
      case TipoUsuario.admin:
        color = Colors.red.shade700;
        texto = 'ADMIN';
        break;
      case TipoUsuario.encargado:
        color = Colors.orange.shade700;
        texto = 'ENCARGADO';
        break;
      case TipoUsuario.repartidor:
        color = Colors.blue.shade700;
        texto = 'REPARTIDOR';
        break;
      default:
        color = Colors.green.shade700;
        texto = 'CLIENTE';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}