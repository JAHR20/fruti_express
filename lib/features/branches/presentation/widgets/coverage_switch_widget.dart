import 'package:flutter/material.dart';

class CoverageSwitchWidget extends StatelessWidget {
  final bool requiresCp;
  final int selectedCount;
  final ValueChanged<bool> onChanged;

  const CoverageSwitchWidget({
    super.key,
    required this.requiresCp,
    required this.selectedCount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; 

    return Card(
      elevation: 0,
      color: requiresCp 
          ? colorScheme.primary.withValues(alpha: 0.05) 
          : colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(
        // 👈 Borde dinámico
        side: BorderSide(
          color: requiresCp 
              ? colorScheme.primary.withValues(alpha: 0.3) 
              : colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        title: Text(
          'Limitar por Códigos Postales',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          requiresCp
              ? 'Activo: Solo se entregará en los $selectedCount Códigos Postales seleccionados.'
              : 'Inactivo: Se entregará en cualquier dirección dentro del radio.',
          style: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
        value: requiresCp,
        onChanged: onChanged,
      ),
    );
  }
}