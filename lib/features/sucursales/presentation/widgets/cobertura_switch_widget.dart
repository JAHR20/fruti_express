import 'package:flutter/material.dart';

class CoberturaSwitchWidget extends StatelessWidget {
  final bool requiereCp;
  final int cantidadSeleccionados;
  final ValueChanged<bool> onChanged;

  const CoberturaSwitchWidget({
    super.key,
    required this.requiereCp,
    required this.cantidadSeleccionados,
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
          requiereCp
              ? 'Activo: Solo se entregará en los $cantidadSeleccionados Códigos Postales seleccionados.'
              : 'Inactivo: Se entregará en cualquier dirección dentro del radio.',
        ),
        activeThumbColor: Colors.blue,
        value: requiereCp,
        onChanged: onChanged,
      ),
    );
  }
}