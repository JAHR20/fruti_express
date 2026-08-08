// features/dashboard/presentation/widgets/perfil_header.dart

import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class PerfilHeader extends StatelessWidget {
  final Perfil perfil;

  const PerfilHeader({super.key, required this.perfil});

  @override
  Widget build(BuildContext context) {
    final nombreCompleto = [
      perfil.nombre,
      perfil.apellidoPaterno,
      if (perfil.apellidoMaterno != null) perfil.apellidoMaterno!,
    ].join(' ');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF1E3A8A),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // ─── Avatar ───────────────────────────────────────────────────
          CircleAvatar(
            radius: 44,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            backgroundImage: perfil.avatarUrl != null
                ? NetworkImage(perfil.avatarUrl!)
                : null,
            child: perfil.avatarUrl == null
                ? Text(
                    perfil.nombre[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 12),

          // ─── Nombre ───────────────────────────────────────────────────
          Text(
            nombreCompleto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          // ─── Email ────────────────────────────────────────────────────
          Text(
            perfil.email,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),

          // ─── Alias (si tiene) ─────────────────────────────────────────
          if (perfil.alias != null) ...[
            const SizedBox(height: 4),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '@${perfil.alias}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}