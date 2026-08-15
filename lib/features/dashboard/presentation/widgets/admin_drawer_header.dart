import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/presentation/extensions/tipo_usuario_ui_extension.dart';

class AdminDrawerHeader extends StatelessWidget {
  final Perfil usuarioActual;

  const AdminDrawerHeader({
    super.key,
    required this.usuarioActual,
  });

  String get nombreCompleto => "${usuarioActual.nombre} ${usuarioActual.apellidoPaterno}";

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E3A8A), 
            Color(0xFF0F172A), 
          ],
        ),
      ),
      currentAccountPicture: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24, width: 3),
        ),
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.storefront, color: Color(0xFF1E3A8A), size: 32),
        ),
      ),
      accountName: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              nombreCompleto,  
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white30, width: 0.5),
              ),
              child: Text(
                usuarioActual.rol.nombreUI,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
      accountEmail: Text(
        usuarioActual.email,
        style: TextStyle(
          fontSize: 13,
          color: Colors.white.withValues(alpha: 0.7),
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}