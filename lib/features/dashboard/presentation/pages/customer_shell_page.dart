import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/widgets/cart_fab.dart'; 
import 'package:go_router/go_router.dart';

class CustomerShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomerShellPage({super.key, required this.navigationShell});

  void _goToBranch(int index) { 
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
      floatingActionButton: const CartFab(),
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
                  baseIcon: Icons.home_outlined, 
                  activeIcon: Icons.home_filled, 
                  isSelected: navigationShell.currentIndex == 0, 
                  onTap: () => _goToBranch(0),
                ),
              ),
              Expanded(
                child: _NavIcon(
                  label: 'Productos',
                  baseIcon: Icons.grid_view_outlined,
                  activeIcon: Icons.grid_view_rounded,
                  isSelected: navigationShell.currentIndex == 1,
                  onTap: () => _goToBranch(1),
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                child: _NavIcon(
                  label: 'Pedidos',
                  baseIcon: Icons.inbox_outlined,
                  activeIcon: Icons.inbox_rounded,
                  isSelected: navigationShell.currentIndex == 2,
                  onTap: () => _goToBranch(2),
                ),
              ),
              Expanded(
                child: _NavIcon(
                  label: 'Perfil',
                  baseIcon: Icons.person_outline_rounded,
                  activeIcon: Icons.person_rounded,
                  isSelected: navigationShell.currentIndex == 3,
                  onTap: () => _goToBranch(3),
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
  final IconData baseIcon;
  final IconData activeIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavIcon({
    required this.label,
    required this.baseIcon,
    required this.activeIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFF4DB6AC) : Colors.grey[400];
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
              isSelected ? activeIcon : baseIcon,
              size: 26,
              color: color,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}