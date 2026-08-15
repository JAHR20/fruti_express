import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/carrito_fab.dart';
import 'package:go_router/go_router.dart';

class ClientePrincipalShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ClientePrincipalShell({super.key, required this.navigationShell});

  void _irARama(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      body: navigationShell,

      floatingActionButton: const CarritoFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            children: [
              Expanded(
                child: _NavIcon(
                  label: 'Inicio',
                  iconoBase: Icons.home_outlined,
                  iconoActivo: Icons.home_filled,
                  estaSeleccionado: navigationShell.currentIndex == 0,
                  onTap: () => _irARama(0),
                ),
              ),
              Expanded(
                child: _NavIcon(
                  label: 'Productos',
                  iconoBase: Icons.grid_view_outlined,
                  iconoActivo: Icons.grid_view_rounded,
                  estaSeleccionado: navigationShell.currentIndex == 1,
                  onTap: () => _irARama(1),
                ),
              ),

              const SizedBox(width: 48),

              Expanded(
                child: _NavIcon(
                  label: 'Pedidos',
                  iconoBase: Icons.inbox_outlined,
                  iconoActivo: Icons.inbox_rounded,
                  estaSeleccionado: navigationShell.currentIndex == 2,
                  onTap: () => _irARama(2),
                ),
              ),
              Expanded(
                child: _NavIcon(
                  label: 'Perfil',
                  iconoBase: Icons.person_outline_rounded,
                  iconoActivo: Icons.person_rounded,
                  estaSeleccionado: navigationShell.currentIndex == 3,
                  onTap: () => _irARama(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final String label;
  final IconData iconoBase;
  final IconData iconoActivo;
  final bool estaSeleccionado;
  final VoidCallback onTap;

  const _NavIcon({
    required this.label,
    required this.iconoBase,
    required this.iconoActivo,
    required this.estaSeleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = estaSeleccionado ? const Color(0xFF4DB6AC) : Colors.grey[400];
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              estaSeleccionado ? iconoActivo : iconoBase,
              size: 26,
              color: color,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: estaSeleccionado
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
