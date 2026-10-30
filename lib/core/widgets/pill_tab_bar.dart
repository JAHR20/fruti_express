import 'package:flutter/material.dart';

class PillTabBar extends StatelessWidget {
  final TabController? controller;
  final List<Tab> tabs;
  final bool? isScrollable; // 👈 Ahora es nullable para permitir automatización
  final ValueChanged<int>? onTap;

  final Color? activeColor;
  final Color? backgroundColor;
  final Color? unselectedTextColor;

  const PillTabBar({
    super.key,
    this.controller,
    required this.tabs,
    this.isScrollable, // 👈 Ya no es obligatorio ni por defecto 'false' fijo
    this.onTap,
    this.activeColor,
    this.backgroundColor,
    this.unselectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final indicatorColor = activeColor ?? colorScheme.primary;
    final bgColor = backgroundColor ?? colorScheme.surfaceContainerHighest;
    final unselectedText = unselectedTextColor ?? colorScheme.onSurfaceVariant;
    final selectedText = colorScheme.onPrimary;

    // 👇 MAGIA AUTOMÁTICA: Si no le pasas nada, decide solo. 
    // (Ejemplo: si hay más de 3 pestañas, activa el scroll solo).
    final bool scrollable = isScrollable ?? (tabs.length > 3);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: TabBar(
            controller: controller,
            isScrollable: scrollable,
            tabAlignment: scrollable ? TabAlignment.start : TabAlignment.fill,
            dividerHeight: 0.0,
            indicatorWeight: 0.0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: indicatorColor,
              borderRadius: BorderRadius.circular(26),
              boxShadow: [
                BoxShadow(
                  color: indicatorColor.withValues(alpha: 0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            labelColor: selectedText,
            unselectedLabelColor: unselectedText,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            splashBorderRadius: BorderRadius.circular(26),
            tabs: tabs,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}