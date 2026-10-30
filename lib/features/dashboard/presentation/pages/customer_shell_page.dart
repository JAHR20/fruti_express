import 'package:flutter/material.dart';
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
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          16, 
          0, 
          16, 
          MediaQuery.of(context).padding.bottom + 12,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: colorTheme.secondaryContainer,
            borderRadius: BorderRadius.circular(40), 
            boxShadow: [
              BoxShadow(
                color: colorTheme.outlineVariant.withValues(alpha: 0.5),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavIcon(
                label: 'Inicio',
                baseIcon: Icons.home_outlined, 
                activeIcon: Icons.home_filled, 
                isSelected: navigationShell.currentIndex == 0, 
                onTap: () => _goToBranch(0),
              ),
              _NavIcon(
                label: 'Categorias',
                baseIcon: Icons.grid_view_outlined,
                activeIcon: Icons.grid_view_rounded,
                isSelected: navigationShell.currentIndex == 1,
                onTap: () => _goToBranch(1),
              ),
              _NavIcon(
                label: 'Carrito',
                baseIcon: Icons.shopping_bag_outlined,
                activeIcon: Icons.shopping_bag,
                isSelected: false,
                onTap: () {
                    // context.pushNamed(CartRoutes.name);
                },
              ),
              _NavIcon(
                label: 'Pedidos',
                baseIcon: Icons.inbox_outlined,
                activeIcon: Icons.inbox_rounded,
                isSelected: navigationShell.currentIndex == 2,
                onTap: () => _goToBranch(2),
              ),
              _NavIcon(
                label: 'Perfil',
                baseIcon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                isSelected: navigationShell.currentIndex == 3,
                onTap: () => _goToBranch(3),
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
    final colorTheme = Theme.of(context).colorScheme;
    
    final backgroundColor = isSelected ? colorTheme.surface : colorTheme.secondaryContainer;
    final contentColor = isSelected ? colorTheme.onSurface : colorTheme.onSecondaryContainer;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16.0 : 10.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : baseIcon,
              size: 24,
              color: contentColor,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              child: SizedBox(
                width: isSelected ? null : 0,
                child: Padding(
                  padding: EdgeInsets.only(left: isSelected ? 8.0 : 0),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: contentColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}