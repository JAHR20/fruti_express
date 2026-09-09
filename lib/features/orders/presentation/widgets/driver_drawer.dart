import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/driver_section.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

class DriverDrawer extends StatelessWidget {
  final Profile profile; 
  final DriverSection activeSection; 
  final ValueChanged<DriverSection> onNavigate; 
  final VoidCallback onLogout;

  const DriverDrawer({
    super.key,
    required this.profile,
    required this.activeSection,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1E3A8A)),
            accountName: Text(
              '${profile.firstName} ${profile.paternalLastName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(profile.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: profile.avatarUrl != null
                  ? NetworkImage(profile.avatarUrl!)
                  : null,
              child: profile.avatarUrl == null
                  ? Text(
                      profile.firstName[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A8A),
                      ),
                    )
                  : null,
            ),
          ),
          _DrawerOption(
            icon: Icons.delivery_dining,
            label: 'Mis Pedidos',
            isActive: activeSection == DriverSection.orders,
            onTap: () => onNavigate(DriverSection.orders),
          ),
          _DrawerOption(
            icon: Icons.bar_chart_outlined,
            label: 'Resumen del Día',
            isActive: activeSection == DriverSection.summary,
            onTap: () => onNavigate(DriverSection.summary),
          ),
          _DrawerOption(
            icon: Icons.person_outline,
            label: 'Mi Perfil',
            isActive: activeSection == DriverSection.profile,
            onTap: () => onNavigate(DriverSection.profile),
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Cerrar Sesión',
                style: TextStyle(color: Colors.red)),
            onTap: onLogout,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _DrawerOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DrawerOption({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? const Color(0xFF1E3A8A) : Colors.grey,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? const Color(0xFF1E3A8A) : null,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isActive,
      selectedTileColor: const Color(0xFF1E3A8A).withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
    );
  }
}