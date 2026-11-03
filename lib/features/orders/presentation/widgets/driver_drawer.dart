import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/driver_section.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

class DriverDrawer extends StatelessWidget {
  final AppUser user;
  final DriverSection activeSection;
  final ValueChanged<DriverSection> onNavigate;
  final VoidCallback onLogout;

  const DriverDrawer({
    super.key,
    required this.user,
    required this.activeSection,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colorScheme.primary, colorScheme.scrim],
              ),
            ),
            accountName: Text(
              '${user.profile.firstName} ${user.profile.paternalLastName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: colorScheme.surface,
              backgroundImage: user.profile.avatarUrl != null
                  ? NetworkImage(user.profile.avatarUrl!)
                  : null,
              child: user.profile.avatarUrl == null
                  ? Text(
                      user.profile.firstName[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.secondaryContainer,
                      ),
                    )
                  : null,
            ),
          ),
          _DrawerOption(
            icon: Icons.delivery_dining_outlined,
            activeIcon: Icons.delivery_dining,
            label: 'Mis Pedidos',
            isActive: activeSection == DriverSection.orders,
            onTap: () => onNavigate(DriverSection.orders),
          ),
          _DrawerOption(
            icon: Icons.bar_chart_outlined,
            activeIcon: Icons.bar_chart,
            label: 'Resumen del Día',
            isActive: activeSection == DriverSection.summary,
            onTap: () => onNavigate(DriverSection.summary),
          ),
          _DrawerOption(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Mi Perfil',
            isActive: activeSection == DriverSection.profile,
            onTap: () => onNavigate(DriverSection.profile),
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: colorScheme.error),
            title: Text(
              'Cerrar Sesión',
              style: TextStyle(color: colorScheme.error),
            ),
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
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DrawerOption({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        isActive ? activeIcon : icon,
        color: isActive ? colorScheme.scrim : null,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? colorScheme.scrim : null,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isActive,
      selectedTileColor: colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onTap: onTap,
    );
  }
}