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
    return Card(
      elevation: 0,
      color: Colors.blue.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        title: const Text(
          'Limitar por Códigos Postales',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          requiresCp
              ? 'Activo: Solo se entregará en los $selectedCount Códigos Postales seleccionados.'
              : 'Inactivo: Se entregará en cualquier dirección dentro del radio.',
        ),
        activeThumbColor: Colors.blue,
        value: requiresCp,
        onChanged: onChanged,
      ),
    );
  }
}