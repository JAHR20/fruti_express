import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/seccion_repartidor.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class RepartidorDrawer extends StatelessWidget {
  final Perfil perfil;
  final SeccionRepartidor seccionActiva;
  final ValueChanged<SeccionRepartidor> onNavegar;
  final VoidCallback onCerrarSesion;

  const RepartidorDrawer({
    super.key,
    required this.perfil,
    required this.seccionActiva,
    required this.onNavegar,
    required this.onCerrarSesion,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1E3A8A)),
            accountName: Text(
              '${perfil.nombre} ${perfil.apellidoPaterno}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(perfil.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: perfil.avatarUrl != null
                  ? NetworkImage(perfil.avatarUrl!)
                  : null,
              child: perfil.avatarUrl == null
                  ? Text(
                      perfil.nombre[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A8A),
                      ),
                    )
                  : null,
            ),
          ),
          _OpcionDrawer(
            icono: Icons.delivery_dining,
            etiqueta: 'Mis Pedidos',
            activo: seccionActiva == SeccionRepartidor.pedidos,
            onTap: () => onNavegar(SeccionRepartidor.pedidos),
          ),
          _OpcionDrawer(
            icono: Icons.bar_chart_outlined,
            etiqueta: 'Resumen del Día',
            activo: seccionActiva == SeccionRepartidor.resumen,
            onTap: () => onNavegar(SeccionRepartidor.resumen),
          ),
          _OpcionDrawer(
            icono: Icons.person_outline,
            etiqueta: 'Mi Perfil',
            activo: seccionActiva == SeccionRepartidor.perfil,
            onTap: () => onNavegar(SeccionRepartidor.perfil),
          ),

          const Spacer(),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Cerrar Sesión',
                style: TextStyle(color: Colors.red)),
            onTap: onCerrarSesion,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _OpcionDrawer extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final bool activo;
  final VoidCallback onTap;

  const _OpcionDrawer({
    required this.icono,
    required this.etiqueta,
    required this.activo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icono,
        color: activo ? const Color(0xFF1E3A8A) : Colors.grey,
      ),
      title: Text(
        etiqueta,
        style: TextStyle(
          color: activo ? const Color(0xFF1E3A8A) : null,
          fontWeight: activo ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: activo,
      selectedTileColor: const Color(0xFF1E3A8A).withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
    );
  }
}